From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 18:36:13 +0100
Subject: [RFCv2 4/4] ARM: meson: enable RTC for ODRoid-C1
In-Reply-To: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466789773-1609-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1466789773-1609-5-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now the RTC node has been added, enable it on the ODroid-C1
board.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index b147c24..af56b1d 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -85,3 +85,8 @@
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
