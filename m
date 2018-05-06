From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  6 May 2018 22:57:49 +0200
Subject: [PATCH 2/2] ARM: dts: meson8b: odroid-c1: enable the IR receiver
In-Reply-To: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
References: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180506205749.18719-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Odroid-C1 comes with an IR receiver. It is connected to the GPIOAO_7
pin and thus using the SoC's internal IR decoder.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 6 ++++++
 arch/arm/boot/dts/meson8b.dtsi         | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 7d8ad468a25b..ef3177d3da3d 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -148,6 +148,12 @@
 	};
 };
 
+&ir_receiver {
+	status = "okay";
+	pinctrl-0 = <&ir_recv_pins>;
+	pinctrl-names = "default";
+};
+
 &sdio {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 5deff6819f7d..91fc8d784803 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -148,6 +148,13 @@
 				function = "uart_ao";
 			};
 		};
+
+		ir_recv_pins: remote {
+			mux {
+				groups = "remote_input";
+				function = "remote";
+			};
+		};
 	};
 };
 
-- 
2.17.0
