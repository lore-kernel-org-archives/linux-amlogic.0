From: ben-linux@fluff.org (Ben Dooks)
Date: Mon, 22 Aug 2016 23:14:58 +0100
Subject: [PATCH 2/5] ARM: dts: amlogic: add rtc node for meson8b
In-Reply-To: <20160822221501.21945-1-ben-linux@fluff.org>
References: <20160822221501.21945-1-ben-linux@fluff.org>
Message-ID: <20160822221501.21945-3-ben-linux@fluff.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Ben Dooks <ben.dooks@codethink.co.uk>

Add the DT node for the RTC support.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
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
2.9.3
