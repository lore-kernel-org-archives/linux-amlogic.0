From: stern@rowland.harvard.edu (Alan Stern)
Date: Mon, 9 Oct 2017 13:16:03 -0400 (EDT)
Subject: [RFC usb-next v5 2/3] usb: core: add a wrapper for the USB PHYs
 on the root-hub
In-Reply-To: <20171008211713.18696-3-martin.blumenstingl@googlemail.com>
Message-ID: <Pine.LNX.4.44L0.1710091314310.6996-100000@netrider.rowland.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 8 Oct 2017, Martin Blumenstingl wrote:

> Many SoC platforms have separate devices for the USB PHY which are
> registered through the generic PHY framework. These PHYs have to be
> enabled to make the USB controller actually work. They also have to be
> disabled again on shutdown/suspend.

...

> --- /dev/null
> +++ b/drivers/usb/core/phy.h
> @@ -0,0 +1,7 @@
> +struct usb_phy_roothub;
> +
> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev);
> +int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
> +
> +int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
> +int usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);

Have you considered the possibility that a phy might need three power
states, for on, off, and suspended?

Alan Stern
