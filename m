From: stern@rowland.harvard.edu (Alan Stern)
Date: Mon, 9 Oct 2017 13:18:17 -0400 (EDT)
Subject: [RFC usb-next v5 3/3] usb: core: hcd: integrate the PHY roothub
 wrapper
In-Reply-To: <20171008211713.18696-4-martin.blumenstingl@googlemail.com>
Message-ID: <Pine.LNX.4.44L0.1710091316170.6996-100000@netrider.rowland.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 8 Oct 2017, Martin Blumenstingl wrote:

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
> ---
>  drivers/usb/core/hcd.c  | 30 +++++++++++++++++++++++++++++-
>  include/linux/usb/hcd.h |  1 +
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 67aa3d039b9b..56704dd10c15 100644
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
> @@ -2292,7 +2293,11 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
>  		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
>  				"suspend", status);
>  	}
> -	return status;
> +
> +	if (status == 0)
> +		return usb_phy_roothub_power_off(hcd->phy_roothub);

Is this really the right thing to do?  If usb_phy_roothub_power_off() 
fails, what condition does this leave the bus in?  And what condition 
does the kernel _think_ the bus is in?

Alan Stern
