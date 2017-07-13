From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 13 Jul 2017 12:59:37 +0200
Subject: [RFCv2 usb-next 1/3] dt-bindings: usb: add the documentation for USB
 root-hub
In-Reply-To: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170713105939.31566-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

A USB root-hub may have several PHYs which need to be configured before
the root-hub starts working.
This adds the documentation for such a USB root-hub.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/usb/usb-roothub.txt        | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt

diff --git a/Documentation/devicetree/bindings/usb/usb-roothub.txt b/Documentation/devicetree/bindings/usb/usb-roothub.txt
new file mode 100644
index 000000000000..fc0797d7cee9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-roothub.txt
@@ -0,0 +1,46 @@
+Generic USB root-hub Properties
+
+similar to the USB device bindings (documented in usb-device.txt from the
+current directory) this provides support for configuring the root-hub.
+
+Required properties:
+- compatible: should be at least one of "usb1d6b,3", "usb1d6b,2"
+- reg: must be 0.
+- address-cells: must be 1
+- size-cells: must be 0
+
+Required sub-nodes:
+a sub-node per actual USB port is required. each sub-node supports the
+following properties:
+  Required properties:
+    - reg: the port number on the root-hub (mandatory)
+  Optional properties:
+    - phys: optional, from the *Generic PHY* bindings (mandatory needed
+      when phy-names is given)
+    - phy-names: optional, from the *Generic PHY* bindings; supported names
+      are "usb2-phy" or "usb3-phy"
+
+Example:
+	&usb1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		roothub at 0 {
+			compatible = "usb1d6b,3", "usb1d6b,2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			port at 1 {
+				reg = <1>;
+				phys = <&usb2_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+
+			port at 2 {
+				reg = <2>;
+				phys = <&usb2_phy2>, <&usb3_phy2>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+	}
-- 
2.13.2
