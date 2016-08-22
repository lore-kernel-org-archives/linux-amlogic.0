From: ben-linux@fluff.org (Ben Dooks)
Date: Mon, 22 Aug 2016 23:15:00 +0100
Subject: [PATCH 4/5] ARM: meson: enable RTC for ODRoid-C1
In-Reply-To: <20160822221501.21945-1-ben-linux@fluff.org>
References: <20160822221501.21945-1-ben-linux@fluff.org>
Message-ID: <20160822221501.21945-5-ben-linux@fluff.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Ben Dooks <ben.dooks@codethink.co.uk>

Now the RTC node has been added, enable it on the ODroid-C1
board.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index e50f1a1..5c7826f 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -76,3 +76,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&rtc {
+	status = "okay";
+};
+
-- 
2.9.3
