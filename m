From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 15 Jun 2017 23:33:45 +0200
Subject: [PATCH v2 03/10] ARM: dts: meson8: add the PWM_E and PWM_F pins
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170615213352.25134-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds the definition of the PWM_E (CBUS) and PWM_F (AOBUS) to
meson8.dtsi, allowing devices to use them. PWM_E can be used on some
devices to generate the 32.768kHz clock for the SDIO wifi module, while
PWM_F can be used to control the power LED.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index c5d73b999773..5ff7903964c6 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -123,6 +123,13 @@
 				function = "remote";
 			};
 		};
+
+		pwm_f_ao_pins: pwm-f-ao {
+			mux {
+				groups = "pwm_f_ao";
+				function = "pwm_f_ao";
+			};
+		};
 	};
 };
 
@@ -168,6 +175,13 @@
 				function = "ethernet";
 			};
 		};
+
+		pwm_e_pins: pwm-e {
+			mux {
+				groups = "pwm_e";
+				function = "pwm_e";
+			};
+		};
 	};
 };
 
-- 
2.13.1
