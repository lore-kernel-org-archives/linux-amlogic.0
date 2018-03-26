From: rogerq@ti.com (Roger Quadros)
Date: Mon, 26 Mar 2018 12:53:52 +0300
Subject: [RFC usb-next v2 2/2] usb: core: use phy_exit during suspend if
 wake up is not supported
In-Reply-To: <20180324142121.8618-3-martin.blumenstingl@googlemail.com>
References: <20180324142121.8618-1-martin.blumenstingl@googlemail.com>
 <20180324142121.8618-3-martin.blumenstingl@googlemail.com>
Message-ID: <c5aa3b33-1c09-1ce0-39c6-9aaa0f383a58@ti.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 24/03/18 16:21, Martin Blumenstingl wrote:
> If the USB controller can wake up the system (which is the case for
> example with the Mediatek USB3 IP) then we must not call phy_exit during
> suspend to ensure that the USB controller doesn't have to re-enumerate
> the devices during resume.
> However, if the USB controller cannot wake up the system (which is the
> case for example on various TI platforms using a dwc3 controller) then
> we must call phy_exit during suspend. Otherwise the PHY driver keeps the
> clocks enabled, which prevents the system from entering the suspend
> state.

Actually it doesn't prevent the system from entering suspend but just prevents
the system from reaching lowest power levels in the suspend state.

> 
> Solve this by introducing two new functions in the PHY wrapper which are
> dedicated to the suspend and resume handling.
> If the controller can wake up the system the new usb_phy_roothub_suspend
> function will simply call usb_phy_roothub_power_off. However, if wake up
> is not supported by the controller it will also call
> usb_phy_roothub_exit.
> The also new usb_phy_roothub_resume function takes care of calling
> usb_phy_roothub_init (if the controller can't wake up the system) in
> addition to usb_phy_roothub_power_on.
> 
> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> Fixes: 178a0bce05cbc1 ("usb: core: hcd: integrate the PHY wrapper into the HCD core")
> Reported-by: Roger Quadros <rogerq@ti.com>
> Suggested-by: Roger Quadros <rogerq@ti.com>
> Suggested-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/usb/core/hcd.c |  8 +++++---
>  drivers/usb/core/phy.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/phy.h |  5 +++++
>  3 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 15b0418e3b6a..78bae4ecd68b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2262,7 +2262,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		hcd->state = HC_STATE_SUSPENDED;
>  
>  		if (!PMSG_IS_AUTO(msg))
> -			usb_phy_roothub_power_off(hcd->phy_roothub);
> +			usb_phy_roothub_suspend(hcd->self.sysdev,
> +						hcd->phy_roothub);
>  
>  		/* Did we race with a root-hub wakeup event? */
>  		if (rhdev->do_remote_wakeup) {
> @@ -2302,7 +2303,8 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>  	}
>  
>  	if (!PMSG_IS_AUTO(msg)) {
> -		status = usb_phy_roothub_power_on(hcd->phy_roothub);
> +		status = usb_phy_roothub_resume(hcd->self.sysdev,
> +						hcd->phy_roothub);
>  		if (status)
>  			return status;
>  	}
> @@ -2344,7 +2346,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>  		}
>  	} else {
>  		hcd->state = old_state;
> -		usb_phy_roothub_power_off(hcd->phy_roothub);
> +		usb_phy_roothub_suspend(hcd->self.sysdev, hcd->phy_roothub);
>  		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
>  				"resume", status);
>  		if (status != -ESHUTDOWN)
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index d1861c5a74de..e794cbee97e9 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -155,3 +155,40 @@ void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)
>  		phy_power_off(roothub_entry->phy);
>  }
>  EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
> +
> +int usb_phy_roothub_suspend(struct device *controller_dev,
> +			    struct usb_phy_roothub *phy_roothub)
> +{
> +	usb_phy_roothub_power_off(phy_roothub);
> +
> +	/* keep the PHYs initialized so the device can wake up the system */
> +	if (device_may_wakeup(controller_dev))
> +		return 0;
> +
> +	return usb_phy_roothub_exit(phy_roothub);
> +}
> +EXPORT_SYMBOL_GPL(usb_phy_roothub_suspend);
> +
> +int usb_phy_roothub_resume(struct device *controller_dev,
> +			   struct usb_phy_roothub *phy_roothub)
> +{
> +	int err;
> +
> +	/* if the device can't wake up the system _exit was called */
> +	if (device_may_wakeup(controller_dev)) {
> +		err = usb_phy_roothub_init(phy_roothub);
> +		if (err)
> +			return err;
> +	}
> +
> +	err = usb_phy_roothub_power_on(phy_roothub);
> +	if (err) {
> +		if (device_may_wakeup(controller_dev))
> +			usb_phy_roothub_exit(phy_roothub);
> +
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(usb_phy_roothub_resume);
> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> index eb31253201ad..605555901d44 100644
> --- a/drivers/usb/core/phy.h
> +++ b/drivers/usb/core/phy.h
> @@ -7,3 +7,8 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
>  
>  int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
>  void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
> +
> +int usb_phy_roothub_suspend(struct device *controller_dev,
> +			    struct usb_phy_roothub *phy_roothub);
> +int usb_phy_roothub_resume(struct device *controller_dev,
> +			   struct usb_phy_roothub *phy_roothub);
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
