From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 17 Oct 2017 23:20:58 +0200
Subject: [PATCH usb-next v6 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <20171017212100.10544-1-martin.blumenstingl@googlemail.com>
References: <20171017212100.10544-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171017212100.10544-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

A USB root-hub may have several PHYs which need to be configured before
the root-hub starts working.
This adds the documentation for such a USB root-hub as well as a hint
regarding the child-nodes on XHCI controllers which can include the
roothub.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/usb-roothub.txt        | 46 ++++++++++++++++++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  7 ++++
 2 files changed, 53 insertions(+)
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
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index ae6e484a8d7c..5b49ba9f2f9a 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -30,6 +30,13 @@ Optional properties:
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
 
+sub-nodes:
+- optionally there can be a node for the root-hub, see usb-roothub.txt in the
+  current directory
+- one or more nodes with reg 1-31 for each port to which a device is connected.
+  See usb-device.txt in the current directory for more information.
+
+
 Example:
 	usb at f0931000 {
 		compatible = "generic-xhci";
-- 
2.14.2
