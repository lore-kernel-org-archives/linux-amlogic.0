From: kishon@ti.com (Kishon Vijay Abraham I)
Date: Tue, 7 Nov 2017 11:23:18 +0530
Subject: [PATCH 2/2] phy: amlogic: add USB3 PHY support for Meson GXL and
 GXM
In-Reply-To: <20170924195000.13276-3-martin.blumenstingl@googlemail.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
 <20170924195000.13276-3-martin.blumenstingl@googlemail.com>
Message-ID: <463fae8a-4b6d-1111-7ac2-1d3f1f31b9b1@ti.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On Monday 25 September 2017 01:20 AM, Martin Blumenstingl wrote:
> This adds a new driver for the USB3 PHY found on Meson GXL and GXM SoCs
> (both SoCs are using the same USB PHY register layout).
> 
> Unfortunately there is no documentation for this PHY in the public S905X
> datasheet (published for example by Khadas). What we know so far about
> this PHY:
> - even though the Meson GXL and GXM SoCs do not expose an USB3 port (the
>   dwc3 controller only has USB2 ports enabled) we need to initialize the
>   USB3 PHY (specifically USB_R1_U3H_FLADJ_30MHZ_REG_MASK). Without this
>   initialization high-speed USB devices (especially USB hard disks and
>   thumb drives, slower devices like mice do not seem to be affected)
> - it is responsible for the OTG detection and for switching the first
>   USB2 PHY between host and peripheral (aka device) mode. an interrupt
>   can be used to detect changes between host and device mode.
> 
> The whole OTG detection logic is currently not implemented.

Is this an independent instance of the phy? The programming model looks similar
to phy-meson-gxl-usb2.c..

I'm just thinking if we should have only a phy-meson-gxl-usb.c and have both
usb2 and usb3 phy programming there?

Thanks
Kishon
