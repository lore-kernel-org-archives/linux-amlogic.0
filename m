From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 18 Jan 2017 10:40:33 +0000
Subject: [RFC/RFT PATCH 2/4] drm/bridge: dw-hdmi: Add support for custom
 PHY handling
In-Reply-To: <1484656294-6140-3-git-send-email-narmstrong@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <88d1f45a-bfd2-2e6b-6c23-2d0686faa2ce@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 17-01-2017 12:31, Neil Armstrong wrote:
> @@ -1434,9 +1434,18 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>  	hdmi_av_composer(hdmi, mode);
>  
>  	/* HDMI Initializateion Step B.2 */
> -	ret = dw_hdmi_phy_init(hdmi);
> -	if (ret)
> -		return ret;
> +	if (hdmi->plat_data->hdmi_phy_init) {
> +		ret = hdmi->plat_data->hdmi_phy_init(hdmi, hdmi->plat_data,
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
> @@ -2119,9 +2164,10 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
> +	if (!hdmi->plat_data || !hdmi->plat_data->hdmi_read_hpd)
> +		/* Unmute interrupts */
> +		hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE),
> +			    HDMI_IH_MUTE_PHY_STAT0);
>  
>

[sniped some parts of the patch]

I personally don't like this kind of 'if plat_data ... else ...'
Can't we just abstract all of the phy configuration (for a
Synopsys Phy) to a new file and then pass it always in pdata as
default? Then overwrite it with custom one if needed. Much like
what you did with the regmap. Or even leave it in dw-hdmi.c but
have a generic pdata structure with generic phy init/disable
functions.

Best regards,
Jose Miguel Abreu
