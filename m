From: robh@kernel.org (Rob Herring)
Date: Thu, 5 Oct 2017 15:02:40 -0500
Subject: [PATCH 1/2] dt-bindings: phy: Add support for the USB3 PHY on
 Amlogic Meson GXL SoCs
In-Reply-To: <20170924195000.13276-2-martin.blumenstingl@googlemail.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
 <20170924195000.13276-2-martin.blumenstingl@googlemail.com>
Message-ID: <20171005200240.bdxd4kupapkqlosh@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Sep 24, 2017 at 09:49:59PM +0200, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
> for GXL, has three) USB2 ports. The first USB2 port supports host and
> peripheral (also called "device") mode.
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized, otherwise some boards (probably those where
> the bootloader does not initialize the USB3 PHY) show errors with
> high-speed USB devices connected to any of the USB2 ports.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

Acked-by: Rob Herring <robh@kernel.org>
