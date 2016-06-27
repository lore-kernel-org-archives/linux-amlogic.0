From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Mon, 27 Jun 2016 17:44:09 +0100
Subject: [PATCH v2 4/4] ARM: meson: enable RTC for ODroid-C1
In-Reply-To: <1467045849-495-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1467045849-495-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1467045849-495-5-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now the RTC node has been added, enable it on the ODroid-C1
board. Note, the C1 does not have a battery by default, so
the RTC will error out on those boards. The C1+ does have
power to the RTC block whilst the external power is applied.

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
