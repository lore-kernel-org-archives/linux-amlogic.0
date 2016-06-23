From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Thu, 23 Jun 2016 21:21:18 +0100
Subject: [RFC 4/4] meson8b: add rtc node
In-Reply-To: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1466713278-24419-5-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

---
 arch/arm/boot/dts/meson8b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fc4080d..15a9d8d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -156,6 +156,13 @@
 			status = "disabled";
 		};
 
+		rtc: rtc at c8100740 {
+			compatible = "amlogic,meson8b-rtc";
+			reg = <0xc8100740 0x14>;
+			resets = <&reset RESET_RTC>;
+			status = "disabled";
+		};
+
 		clkc: clock-controller at c1104000 {
 			#clock-cells = <1>;
 			compatible = "amlogic,meson8b-clkc";
-- 
2.8.1
