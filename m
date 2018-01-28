From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:22:41 +0100
Subject: [PATCH 1/5] dt-bindings: phy: meson-gxl-usb2-phy: add the reset line
 and clock
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180128202245.25021-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The OTG capable USB2 PHY has a reset line (which is shared with other
components, such as the USB3 PHY for example) and a clock (which are
both part of different registers). Add the properties
for the reset line and clocks as optional ones since not all PHYs have
them (currently only the OTG capable PHY is known to use these).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
index a105494a0fc9..b84a02ebffdf 100644
--- a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
@@ -6,6 +6,10 @@ Required properties:
 - #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
 
 Optional properties:
+- clocks:	a phandle to the clock of this PHY
+- clock-names:	must be "phy"
+- resets:	a phandle to the reset line of this PHY
+- reset-names:	must be "phy"
 - phy-supply:	see phy-bindings.txt in this directory
 
 
-- 
2.16.1
