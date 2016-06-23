From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Thu, 23 Jun 2016 21:21:16 +0100
Subject: [RFC 2/4] odroidc1: enable rtc
In-Reply-To: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1466713278-24419-3-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

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
