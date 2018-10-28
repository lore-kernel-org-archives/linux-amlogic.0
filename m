From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 13:26:28 +0100
Subject: [PATCH 6/7] ARM: dts: meson8b: odroidc1: add iio-hwmon for the chip
 temperature
In-Reply-To: <20181028122629.10144-1-martin.blumenstingl@googlemail.com>
References: <20181028122629.10144-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181028122629.10144-7-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

SAR ADC enabled channel 8 can be used to measure the chip temperature.
This can be made available to the hwmon subsystem by using iio-hwmon.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 58669abda259..9251dc102fcc 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -118,6 +118,11 @@
 			  1800000 1>;
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&saradc 8>;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		/*
 		 * RICHTEK RT9179 configured for a fixed output voltage of
-- 
2.19.1
