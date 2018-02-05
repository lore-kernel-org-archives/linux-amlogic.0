From: robh@kernel.org (Rob Herring)
Date: Mon, 5 Feb 2018 00:07:24 -0600
Subject: [PATCH 1/5] dt-bindings: phy: meson-gxl-usb2-phy: add the reset
 line and clock
In-Reply-To: <20180128202245.25021-2-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
 <20180128202245.25021-2-martin.blumenstingl@googlemail.com>
Message-ID: <20180205021758.55gm5faco67hbxqc@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Jan 28, 2018 at 09:22:41PM +0100, Martin Blumenstingl wrote:
> The OTG capable USB2 PHY has a reset line (which is shared with other
> components, such as the USB3 PHY for example) and a clock (which are
> both part of different registers). Add the properties
> for the reset line and clocks as optional ones since not all PHYs have
> them (currently only the OTG capable PHY is known to use these).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
