From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 13:26:27 +0100
Subject: [PATCH 5/7] ARM: dts: meson8b: ec100: add iio-hwmon for the chip
 temperature
In-Reply-To: <20181028122629.10144-1-martin.blumenstingl@googlemail.com>
References: <20181028122629.10144-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181028122629.10144-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

SAR ADC enabled channel 8 can be used to measure the chip temperature.
This can be made available to the hwmon subsystem by using iio-hwmon.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 0872f6e3abf5..0cebe849a920 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -64,6 +64,11 @@
 		timeout-ms = <20000>;
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&saradc 8>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.19.1
