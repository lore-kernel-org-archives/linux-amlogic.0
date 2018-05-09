From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 10 May 2018 01:50:36 +0200
Subject: [PATCH v2 3/4] ARM: dts: meson8: add the uart_A pins
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180509235037.5876-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds the pins for uart_A, which is used to connect to the Bluetooth
module on some devices.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7b16ea61e914..d77dcf890cfc 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -281,6 +281,22 @@
 				function = "pwm_e";
 			};
 		};
+
+		uart_a1_pins: uart-a1 {
+			mux {
+				groups = "uart_tx_a1",
+				       "uart_rx_a1";
+				function = "uart_a";
+			};
+		};
+
+		uart_a1_cts_rts_pins: uart-a1-cts-rts {
+			mux {
+				groups = "uart_cts_a1",
+				       "uart_rts_a1";
+				function = "uart_a";
+			};
+		};
 	};
 };
 
-- 
2.17.0
