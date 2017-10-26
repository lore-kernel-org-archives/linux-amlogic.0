From: mgautam@codeaurora.org (Manu Gautam)
Date: Thu, 26 Oct 2017 11:12:42 +0530
Subject: [PATCH v7 usb-next 3/4] usb: core: hcd: integrate the PHY roothub
 wrapper
In-Reply-To: <20171023215718.3446-4-martin.blumenstingl@googlemail.com>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
 <20171023215718.3446-4-martin.blumenstingl@googlemail.com>
Message-ID: <89fc89e9-4510-2283-aad4-59eacf5cf925@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,


On 10/24/2017 3:27 AM, Martin Blumenstingl wrote:
> This integrates the PHY roothub wrapper into the core hcd
> infrastructure. Multiple PHYs which are part of the roothub devicetree
> node (which is a sub-node of the sysdev's node) are now managed
> (= powered on/off when needed), by the new usb_phy_roothub code.
>
> One example where this is required is the Amlogic GXL and GXM SoCs:
> They are using a dwc3 USB controller with up to three ports enabled on
> the internal roothub. Using only the top-level "phy" properties does not
> work here since one can only specify one "usb2-phy" and one "usb3-phy",
> while actually at least two "usb2-phy" have to be specified.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
>  drivers/usb/core/hcd.c  | 26 ++++++++++++++++++++++++++
>  include/linux/usb/hcd.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 67aa3d039b9b..6ee97222cdad 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -50,6 +50,7 @@
>  #include <linux/usb/otg.h>
>  
>  #include "usb.h"
> +#include "phy.h"
>  
>  
>  /*-------------------------------------------------------------------------*/
> @@ -2271,6 +2272,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
>  		hcd->state = HC_STATE_SUSPENDED;
>  
> +		usb_phy_roothub_power_off(hcd->phy_roothub);
> +

For system-suspend it should be ok.
But, in case of runtime/auto suspend, I think PHYs shouldn't be powered off.
Should we have check for that like-

if (!PMSG_IS_AUTO(msg))
??? usb_phy_roothub_power_off()

Similar check in hcd_bus_resume?


>  		/* Did we race with a root-hub wakeup event? */
>  		if (rhdev->do_remote_wakeup) {
>  			char	buffer[6];
> @@ -2307,6 +2310,11 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>  		dev_dbg(&rhdev->dev, "skipped %s of dead bus\n", "resume");
>  		return 0;
>  	}
> +
> +	status = usb_phy_roothub_power_on(hcd->phy_roothub);
> +	if (status)
> +		return status;
> +

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
