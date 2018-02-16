From: kishon@ti.com (Kishon Vijay Abraham I)
Date: Fri, 16 Feb 2018 17:51:54 +0530
Subject: [PATCH 0/5] improvements and fixes for the phy-meson-gxl-usb2
 driver
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Message-ID: <a2971b23-526a-a611-4f22-098e60e1fa74@ti.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On Monday 29 January 2018 01:52 AM, Martin Blumenstingl wrote:
> This contains two fixes and two (minor) fixes for the phy-meson-gxl-usb2
> driver:
> - a clock and reset line is used for the PHYs. this was not clear from
>   the Amlogic GPL kernel sources since the clock is enabled very early
>   in the boot process (either because the hardware defaults to "on",
>   the bootrom enables it or a bootloader before BL3-3/u-boot enables it)
> - we don't read the controller's dr_mode anymore because the USB2 PHY
>   can only be switched into host mode if the USB3 PHY knows about it.
>   Thus auto-detecting the mode doesn't work for this PHY so it's removed
>   in patch #3
> - do not log an error message when the phy-supply is not ready yet and
>   we have to return -EPROBE_DEFER
> - improve the naming of some U2P_R2 test mode registers

merged, thanks!

-Kishon
> 
> 
> Martin Blumenstingl (5):
>   dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
>   phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
>   phy: amlogic: phy-meson-gxl-usb2: default to host mode
>   phy: amlogic: phy-meson-gxl-usb2: don't log an error on -EPROBE_DEFER
>   phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers
> 
>  .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  4 ++
>  drivers/phy/amlogic/Kconfig                        |  1 -
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 78 ++++++++++++++++------
>  3 files changed, 61 insertions(+), 22 deletions(-)
> 
