From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 18:36:11 +0100
Subject: [RFCv2 2/4] meson-rtc: add device-tree binding
In-Reply-To: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1466789773-1609-3-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add documentation for the AMLogic Meson RTC.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 .../devicetree/bindings/rtc/rtc-amlogic.txt         | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt b/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
new file mode 100644
index 0000000..efc7672
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
@@ -0,0 +1,21 @@
+* AMlogic Meson RTC
+
+Required properties:
+- compatible: should be one of the following describing the hardware:
+	* "amlogic,meson6-rtc"
+	* "amlogic,meson8-rtc"
+	* "amlogic,meson8b-rtc"
+
+- reg: physical register space for the controller's memory mapped registers.
+
+Optional properties:
+- resets: reset controller reference to allow reset of the controller
+- interrupts: single interrupt reference if interrupt support needed
+
+Example:
+
+	rtc: rtc at c8100740 {
+		compatible = "amlogic,meson6-rtc";
+		reg = <0xc8100740 0x14>;
+		status = "disabled";
+	};
-- 
2.8.1
