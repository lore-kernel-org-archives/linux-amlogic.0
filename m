From: robh@kernel.org (Rob Herring)
Date: Mon, 29 Jan 2018 10:08:29 -0600
Subject: [PATCH v2 1/2] dt-bindings: phy: Add support for the USB3 PHY on
 Amlogic Meson GXL SoCs
In-Reply-To: <20180128201554.23889-2-martin.blumenstingl@googlemail.com>
References: <20180128201554.23889-1-martin.blumenstingl@googlemail.com>
 <20180128201554.23889-2-martin.blumenstingl@googlemail.com>
Message-ID: <20180129160829.aufpw7cyfbiu3yly@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Jan 28, 2018 at 09:15:53PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
> for GXL, has three) USB2 ports. The first USB2 port supports host and
> peripheral (also called "device") mode.
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized. Otherwise high-speed USB transfers (for
> example with a USB flash drive) may time out (most often seen on boards
> with mainline u-boot, where the bootloader does not initialize the USB3
> PHY registers).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

Reviewed-by: Rob Herring <robh@kernel.org>
