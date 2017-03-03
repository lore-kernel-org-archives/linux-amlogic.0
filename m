From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 3 Mar 2017 10:07:11 +0100
Subject: [PATCH v2 2/2] drm: bridge: Move HPD handling to PHY operations
In-Reply-To: <6652377.Pu8amSWD8H@avalon>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-3-git-send-email-narmstrong@baylibre.com>
 <6652377.Pu8amSWD8H@avalon>
Message-ID: <952185cf-16b8-b987-4737-96c2db4a0f6c@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/02/2017 05:18 PM, Laurent Pinchart wrote:
> Hi Neil,
> 
> Thank you for the patch.
> 
> On Thursday 02 Mar 2017 16:29:32 Neil Armstrong wrote:
>> The HDMI TX controller support HPD and RXSENSE signaling from the PHY
>> via it's STAT0 PHY interface, but some vendor PHYs can manage these
>> signals independently from the controller, thus these STAT0 handling
>> should be moved to PHY specific operations and become optional.
>>
>> The existing STAT0 HPD and RXSENSE handling code is refactored into
>> a supplementaty set of default PHY operations that are used automatically
>> when the platform glue doesn't provide its own operations.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/dw-hdmi.c | 134 +++++++++++++++++++++++++-----------
>>  include/drm/bridge/dw_hdmi.h     |   8 +++
>>  2 files changed, 104 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/dw-hdmi.c index 653ecd7..58dcf7d 100644
>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
>> @@ -1098,10 +1098,50 @@ static enum drm_connector_status
>> dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi, connector_status_connected :
>> connector_status_disconnected;
>>  }
>>
>> +static void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>> +				   bool force, bool disabled, bool rxsense)
>> +{
>> +	if (force || disabled || !rxsense)
>> +		hdmi->phy_mask |= HDMI_PHY_RX_SENSE;
>> +	else
>> +		hdmi->phy_mask &= ~HDMI_PHY_RX_SENSE;
>> +}
>> +
>> +static void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
>> +{
>> +	/* setup HPD and RXSENSE interrupt polarity */
>> +	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
>> +}
>> +
>> +static void dw_hdmi_phy_configure_hpd(struct dw_hdmi *hdmi, void *data)
>> +{
>> +	/* enable cable hot plug irq */
>> +	hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
>> +}
>> +
>> +static void dw_hdmi_phy_clear_hpd(struct dw_hdmi *hdmi, void *data)
>> +{
>> +	/* Clear Hotplug interrupts */
>> +	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
>> +		    HDMI_IH_PHY_STAT0);
>> +}
>> +
>> +static void dw_hdmi_phy_unmute_hpd(struct dw_hdmi *hdmi, void *data)
>> +{
>> +	/* Unmute Hotplug interrupts */
>> +	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | 
> HDMI_IH_PHY_STAT0_RX_SENSE),
>> +		    HDMI_IH_MUTE_PHY_STAT0);
>> +}
> 
> Do we really need all those new operations ? It looks to me like a bit of 
> refactoring could help lowering the number of operations. We essentially need
> 
> - an init function called at probe time (or likely rather at runtime PM resume 
> time when we'll implement runtime PM) 
> 
> - an interrupt enable/disable function roughly equivalent to 
> dw_hdmi_update_phy_mask()
> 
> - a read function to report the detection results called from 
> dw_hdmi_connector_detect()

Well, I strictly copied the 5 different operations involved in the HPD handling,
if you reduce to these 3 it will change the functional behavior of the driver regarding HPD/RxSenSe...

I do not have enough documentation and HW to actually experiment these changes !

For Amlogic I need setup, read, configure and clear. Only the unmute is specific to Synopsys PHY.

> 
>>  static const struct dw_hdmi_phy_ops dw_hdmi_synopsys_phy_ops = {
>>  	.init = dw_hdmi_phy_init,
>>  	.disable = dw_hdmi_phy_disable,
>>  	.read_hpd = dw_hdmi_phy_read_hpd,
>> +	.update_hpd = dw_hdmi_phy_update_hpd,
>> +	.setup_hpd = dw_hdmi_phy_setup_hpd,
>> +	.configure_hpd = dw_hdmi_phy_configure_hpd,
>> +	.clear_hpd = dw_hdmi_phy_clear_hpd,
>> +	.unmute_hpd = dw_hdmi_phy_unmute_hpd,
>>  };
>>
>>  /* ------------------------------------------------------------------------
>> @@ -1507,11 +1547,12 @@ static int dw_hdmi_fb_registered(struct dw_hdmi
>> *hdmi) HDMI_PHY_I2CM_CTLINT_ADDR);
>>
>>  	/* enable cable hot plug irq */
>> -	hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
>> +	if (hdmi->phy.ops->configure_hpd)
>> +		hdmi->phy.ops->configure_hpd(hdmi, hdmi->phy.data);
>>
>>  	/* Clear Hotplug interrupts */
>> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
>> -		    HDMI_IH_PHY_STAT0);
>> +	if (hdmi->phy.ops->clear_hpd)
>> +		hdmi->phy.ops->clear_hpd(hdmi, hdmi->phy.data);
> 
> The probe function contains the same code. Let's inline this function into 
> probe, group all HPD-related initialization together and extract that into a 
> function to keep probe easy to read. I think you can do that in a separate 
> patch.
> 
>>  	return 0;
>>  }
>> @@ -1622,13 +1663,14 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi
>> *hdmi) {
>>  	u8 old_mask = hdmi->phy_mask;
>>
>> -	if (hdmi->force || hdmi->disabled || !hdmi->rxsense)
>> -		hdmi->phy_mask |= HDMI_PHY_RX_SENSE;
>> -	else
>> -		hdmi->phy_mask &= ~HDMI_PHY_RX_SENSE;
>> +	if (hdmi->phy.ops->update_hpd)
>> +		hdmi->phy.ops->update_hpd(hdmi, hdmi->phy.data,
>> +					  hdmi->force, hdmi->disabled,
>> +					  hdmi->rxsense);
>>
>> -	if (old_mask != hdmi->phy_mask)
>> -		hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
>> +	if (old_mask != hdmi->phy_mask &&
> 
> phy_mask isn't accessible to glue code, so this test will never be true with 
> vendor PHYs.

The problem is that the HPD/RxSense is tied to this phy_mask and glued into the
dw-hdmi driver.

The *real* solution would be to completely separate the HPD/RxSense irq handling to
a separate driver as a shared irq...

If Jose is willing to give me some documentation and Freescale some boards, I'll be
happy to do it !

> 
>> +	    hdmi->phy.ops->configure_hpd)
>> +		hdmi->phy.ops->configure_hpd(hdmi, hdmi->phy.data);
>>  }
>>
>>  static enum drm_connector_status
>> @@ -1820,6 +1862,41 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void
>> *dev_id) return ret;
>>  }
>>
>> +void __dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool
>> rx_sense)
>> +{
>> +	mutex_lock(&hdmi->mutex);
>> +
>> +	if (!hdmi->disabled && !hdmi->force) {
>> +		/*
>> +		 * If the RX sense status indicates we're disconnected,
>> +		 * clear the software rxsense status.
>> +		 */
>> +		if (!rx_sense)
>> +			hdmi->rxsense = false;
>> +
>> +		/*
>> +		 * Only set the software rxsense status when both
>> +		 * rxsense and hpd indicates we're connected.
>> +		 * This avoids what seems to be bad behaviour in
>> +		 * at least iMX6S versions of the phy.
>> +		 */
>> +		if (hpd)
>> +			hdmi->rxsense = true;
> 
> This contradicts the above comment, hdmi->rxsense is set back to true solely 
> based on the hpd parameter.

The "hpd" here is an HPD event indicator, not the HPD pin status, so it makes sense.

I suppose the HPD and RxSense events don't come at the same time, but RxSense comes later on.


>> +
>> +		dw_hdmi_update_power(hdmi);
>> +		dw_hdmi_update_phy_mask(hdmi);
>> +	}
> 
> I'd add a blank line here.

Ok

> 
>> +	mutex_unlock(&hdmi->mutex);
>> +}
>> +
>> +void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense)
>> +{
>> +	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
>> +
>> +	__dw_hdmi_setup_rx_sense(hdmi, hpd, rx_sense);
>> +}
>> +EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
>> +
>>  static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  {
>>  	struct dw_hdmi *hdmi = dev_id;
>> @@ -1852,30 +1929,10 @@ static irqreturn_t dw_hdmi_irq(int irq, void
>> *dev_id) * ask the source to re-read the EDID.
>>  	 */
>>  	if (intr_stat &
>> -	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD)) {
>> -		mutex_lock(&hdmi->mutex);
>> -		if (!hdmi->disabled && !hdmi->force) {
>> -			/*
>> -			 * If the RX sense status indicates we're 
> disconnected,
>> -			 * clear the software rxsense status.
>> -			 */
>> -			if (!(phy_stat & HDMI_PHY_RX_SENSE))
>> -				hdmi->rxsense = false;
>> -
>> -			/*
>> -			 * Only set the software rxsense status when both
>> -			 * rxsense and hpd indicates we're connected.
>> -			 * This avoids what seems to be bad behaviour in
>> -			 * at least iMX6S versions of the phy.
>> -			 */
>> -			if (phy_stat & HDMI_PHY_HPD)
>> -				hdmi->rxsense = true;
>> -
>> -			dw_hdmi_update_power(hdmi);
>> -			dw_hdmi_update_phy_mask(hdmi);
>> -		}
>> -		mutex_unlock(&hdmi->mutex);
>> -	}
>> +	    (HDMI_IH_PHY_STAT0_RX_SENSE | HDMI_IH_PHY_STAT0_HPD))
> 
> Is this right ? If your SoC implements a custom HPD mechanism, does it still 
> rely on the standard RX SENSE and HPD interrupts ? In particular, this 
> function still writes the HDMI_IH_MUTE_PHY_STAT0 register directly, while 
> you've extracted a write to the same register in the probe function into a PHY 
> operation.

It won't since the IRQ is left masked and muted, and I moved all the HDMI_IH_*_PHY
into HPD ops.

> 
>> +		__dw_hdmi_setup_rx_sense(hdmi,
>> +					 phy_stat & HDMI_PHY_HPD,
>> +					 phy_stat & HDMI_PHY_RX_SENSE);
>>
>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
>> @@ -2146,11 +2203,12 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>>  	 * Configure registers related to HDMI interrupt
>>  	 * generation before registering IRQ.
>>  	 */
>> -	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
>> +	if (hdmi->phy.ops->setup_hpd)
>> +		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
>>
>>  	/* Clear Hotplug interrupts */
>> -	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
>> -		    HDMI_IH_PHY_STAT0);
>> +	if (hdmi->phy.ops->clear_hpd)
>> +		hdmi->phy.ops->clear_hpd(hdmi, hdmi->phy.data);
>>
>>  	hdmi->bridge.driver_private = hdmi;
>>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
>> @@ -2163,8 +2221,8 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>>  		goto err_iahb;
>>
>>  	/* Unmute interrupts */
>> -	hdmi_writeb(hdmi, ~(HDMI_IH_PHY_STAT0_HPD | 
> HDMI_IH_PHY_STAT0_RX_SENSE),
>> -		    HDMI_IH_MUTE_PHY_STAT0);
>> +	if (hdmi->phy.ops->unmute_hpd)
>> +		hdmi->phy.ops->unmute_hpd(hdmi, hdmi->phy.data);
>>
>>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
>>  	pdevinfo.parent = dev;
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index 8c0cc13..d72403f 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -64,6 +64,12 @@ struct dw_hdmi_phy_ops {
>>  		    struct drm_display_mode *mode);
>>  	void (*disable)(struct dw_hdmi *hdmi, void *data);
>>  	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void 
> *data);
>> +	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
>> +			   bool force, bool disabled, bool rxsense);
>> +	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
>> +	void (*configure_hpd)(struct dw_hdmi *hdmi, void *data);
>> +	void (*clear_hpd)(struct dw_hdmi *hdmi, void *data);
>> +	void (*unmute_hpd)(struct dw_hdmi *hdmi, void *data);
> 
> That's quite a lot of new operations. I think we need documentation :-)

We need documentation on all the other ops too !

Wehat would be the recommended format ?

> 
>>  };
>>
>>  struct dw_hdmi_plat_data {
>> @@ -93,6 +99,8 @@ int dw_hdmi_probe(struct platform_device *pdev,
>>  int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
>> const struct dw_hdmi_plat_data *plat_data);
>>
>> +void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
>> +
>>  void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
>>  void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
>>  void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
> 
