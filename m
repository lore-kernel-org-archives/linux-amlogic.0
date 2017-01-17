From: laurent.pinchart@ideasonboard.com (Laurent Pinchart)
Date: Tue, 17 Jan 2017 16:54:16 +0200
Subject: [RFC/RFT PATCH 2/4] drm/bridge: dw-hdmi: Add support for custom
 PHY handling
In-Reply-To: <1484656294-6140-3-git-send-email-narmstrong@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <1766052.45cMAnqkLu@avalon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

Thank you for the patch.

On Tuesday 17 Jan 2017 13:31:32 Neil Armstrong wrote:
> The Synopsys DesignWare HDMI TX Controller support various Transceivers
> (PHY) attached to the controller, but also allows fully custom PHYs to be
> connected.
> 
> Add PHY init, disable functions in plat_data to handle fully custom PHY
> init.
> 
> Some custom PHYs also handles the HPD and RxSense separately and do not use
> the internal signals exported in the Controller's IRQ stat, so a read_hpd
> is provided to switch to HPD status polling.
> To complete the implementation, add a function to mimic the Controllers
> interrupt HPD and RxSense handling from the vendor PHY wrapper code.

I believe this goes in the right direction. PHY handling needs to be decoupled 
from the TX controller. As you've noticed I've taken a first step in that 
direction with "drm: bridge: dw-hdmi: Refactor PHY power handling", but that's 
not enough. Issues were reported with that patch which I plan to rework. If 
that's fine with you, I'll rebase it on top of this patch (that I will likely 
modify) and plan to get the result ready for v4.12.

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 78 +++++++++++++++++++++++++++++--------
>  include/drm/bridge/dw_hdmi.h     |  8 +++++
>  2 files changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
> b/drivers/gpu/drm/bridge/dw-hdmi.c index 13747fe..923e250 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -1434,9 +1434,18 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct
> drm_display_mode *mode) hdmi_av_composer(hdmi, mode);
> 
>  	/* HDMI Initializateion Step B.2 */
> -	ret = dw_hdmi_phy_init(hdmi);
> -	if (ret)
> -		return ret;
> +	if (hdmi->plat_data->hdmi_phy_init) {
> +		ret = hdmi->plat_data->hdmi_phy_init(hdmi, hdmi->plat_data,
> +						     &hdmi->previous_mode);
> +		if (ret)
> +			return ret;
> +
> +		hdmi->phy_enabled = true;
> +	} else {
> +		ret = dw_hdmi_phy_init(hdmi);
> +		if (ret)
> +			return ret;
> +	}
> 
>  	/* HDMI Initialization Step B.3 */
>  	dw_hdmi_enable_video_path(hdmi);
> @@ -1551,7 +1560,11 @@ static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
> 
>  static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
>  {
> -	dw_hdmi_phy_disable(hdmi);
> +	if (hdmi->phy_enabled && hdmi->plat_data->hdmi_phy_disable) {
> +		hdmi->plat_data->hdmi_phy_disable(hdmi, hdmi->plat_data);
> +		hdmi->phy_enabled = false;
> +	} else
> +		dw_hdmi_phy_disable(hdmi);
>  	hdmi->bridge_is_on = false;
>  }
> 
> @@ -1593,6 +1606,9 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi
> *hdmi) {
>  	u8 old_mask = hdmi->phy_mask;
> 
> +	if (hdmi->plat_data && hdmi->plat_data->hdmi_read_hpd)
> +		return;
> +
>  	if (hdmi->force || hdmi->disabled || !hdmi->rxsense)
>  		hdmi->phy_mask |= HDMI_PHY_RX_SENSE;
>  	else
> @@ -1614,6 +1630,11 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi
> *hdmi) dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
> 
> +	if (hdmi->plat_data && hdmi->plat_data->hdmi_read_hpd)
> +		return hdmi->plat_data->hdmi_read_hpd(hdmi, hdmi->plat_data) ?
> +			connector_status_connected :
> +			connector_status_disconnected;
> +
>  	return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
>  		connector_status_connected : connector_status_disconnected;
>  }
> @@ -1901,6 +1922,26 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> }
>  };
> 
> +void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense)
> +{
> +	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	mutex_lock(&hdmi->mutex);
> +
> +	if (!hdmi->disabled && !hdmi->force) {
> +		if (!rx_sense)
> +			hdmi->rxsense = false;
> +
> +		if (hpd)
> +			hdmi->rxsense = true;
> +
> +		dw_hdmi_update_power(hdmi);
> +		dw_hdmi_update_phy_mask(hdmi);
> +	}
> +	mutex_unlock(&hdmi->mutex);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
> +
>  static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>  {
>  	unsigned int i;
> @@ -1921,7 +1962,9 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>  		return -ENODEV;
>  	}
> 
> -	if (!hdmi->phy->configure && !hdmi->plat_data->configure_phy) {
> +	if (!hdmi->phy->configure &&
> +	    !hdmi->plat_data->configure_phy &&
> +	    !hdmi->plat_data->hdmi_phy_init) {
>  		dev_err(hdmi->dev, "%s requires platform support\n",
>  			hdmi->phy->name);
>  		return -ENODEV;
> @@ -2101,15 +2144,17 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>  			hdmi->ddc = NULL;
>  	}
> 
> -	/*
> -	 * Configure registers related to HDMI interrupt
> -	 * generation before registering IRQ.
> -	 */
> -	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
> +	if (!hdmi->plat_data || !hdmi->plat_data->hdmi_read_hpd) {
> +		/*
> +		 * Configure registers related to HDMI interrupt
> +		 * generation before registering IRQ.
> +		 */
> +		hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, 
HDMI_PHY_POL0);
> 
> -	/* Clear Hotplug interrupts */
> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
> -		    HDMI_IH_PHY_STAT0);
> +		/* Clear Hotplug interrupts */
> +		hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | 
HDMI_IH_PHY_STAT0_RX_SENSE,
> +			    HDMI_IH_PHY_STAT0);
> +	}
> 
>  	hdmi->bridge.driver_private = hdmi;
>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> @@ -2119,9 +2164,10 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>  	if (ret)
>  		goto err_iahb;
> 
> -	/* Unmute interrupts */
> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | 
HDMI_IH_PHY_STAT0_RX_SENSE),
> -		    HDMI_IH_MUTE_PHY_STAT0);
> +	if (!hdmi->plat_data || !hdmi->plat_data->hdmi_read_hpd)
> +		/* Unmute interrupts */
> +		hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | 
HDMI_IH_PHY_STAT0_RX_SENSE),
> +			    HDMI_IH_MUTE_PHY_STAT0);
> 
>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	pdevinfo.parent = dev;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 163842d..d6a0ab3 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -61,6 +61,13 @@ struct dw_hdmi_plat_data {
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>  					   struct drm_display_mode *mode);
>  	struct regmap *regm;
> +	int (*hdmi_phy_init)(struct dw_hdmi *hdmi,
> +			     const struct dw_hdmi_plat_data *data,
> +			     struct drm_display_mode *mode);
> +	void (*hdmi_phy_disable)(struct dw_hdmi *hdmi,
> +				 const struct dw_hdmi_plat_data *data);
> +	bool (*hdmi_read_hpd)(struct dw_hdmi *hdmi,
> +			      const struct dw_hdmi_plat_data *data);
>  };
> 
>  int dw_hdmi_probe(struct platform_device *pdev,
> @@ -70,6 +77,7 @@ int dw_hdmi_probe(struct platform_device *pdev,
>  int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
> const struct dw_hdmi_plat_data *plat_data);
> 
> +void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
>  void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
>  void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
>  void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);

-- 
Regards,

Laurent Pinchart
