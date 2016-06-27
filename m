From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Mon, 27 Jun 2016 15:52:15 +0100
Subject: [PATCH 4/4] ARM: meson: enable RTC for ODRoid-C1
In-Reply-To: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1467039135-26588-5-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

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
2.8.1
