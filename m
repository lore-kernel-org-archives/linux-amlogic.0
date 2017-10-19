From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 19 Oct 2017 11:57:43 +0200
Subject: [PATCH 0/2] Meson GXL USB3 PHY and OTG detection driver
In-Reply-To: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
Message-ID: <5cdc949b-f73e-fca8-246e-26022a743382@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 24/09/2017 21:49, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two USB2 ports,
> Meson GXM SoCs use the same dwc3 controller but with three USB3
> ports enabled. Neither of these SoCs has any USB3 port enabled in
> the dwc3 registers.
> The first USB2 port on both SoCs supports host and peripheral
> (also called "device") mode.
> 
> The dwc3 controller supports host mode only. Peripheral mode is
> implemented through an additional dwc2 controller (which only enables
> device mode). The USB3 PHY has register bits which allow a driver to
> detect the current mode - however this is currently not implemented
> as the dwc2 controller seems to hang during reset (and I do not have
> a use-case where I need peripheral/device mode).
> 
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized, otherwise some boards (probably those where
> the bootloader does not initialize the USB3 PHY) show errors with
> high-speed USB devices connected to any of the USB2 ports. Configuring
> the USB_R1_U3H_FLADJ_30MHZ_REG_MASK register as it's done by Amlogic's
> vendor GPL kernel sources makes these error go away.
> 
> Thanks to Jerome Brunet for reporting the errors and Neil Armstrong
> for discovering that initializing the USB3 PHY fixes these USB errors!
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL
>     SoCs
>   phy: amlogic: add USB3 PHY support for Meson GXL and GXM
> 
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt |  19 +++
>  drivers/phy/amlogic/Kconfig                        |  12 ++
>  drivers/phy/amlogic/Makefile                       |   1 +
>  drivers/phy/amlogic/phy-meson-gxl-usb3.c           | 177 +++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
>  create mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c
> 

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
