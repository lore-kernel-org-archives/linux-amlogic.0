From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 18:36:12 +0100
Subject: [RFCv2 3/4] ARM: dts: amlogic: add rtc node for meson8b
In-Reply-To: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1466789773-1609-4-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the DT node for the RTC support.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/meson8b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 6519b80..e3b4a1a 100644
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
