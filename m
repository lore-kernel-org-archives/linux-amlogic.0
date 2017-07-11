From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 12 Jul 2017 00:26:55 +0200
Subject: [PATCH] ARM: dts: meson: add a node which describes the SRAM
Message-ID: <20170711222655.15859-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All 32bit Meson SoCs contain 128KiB SRAM. This SRAM is used when
suspending the device (the the ARM Power Firmware on
Meson8/Meson8b/Meson8m2 saves the DDR settings there) and to boot the
secondary CPU cores.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 4c27ca083afb..7e136991a4b9 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -244,5 +244,13 @@
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
+
+		ahb_sram: sram at d9000000 {
+			compatible = "mmio-sram";
+			reg = <0xd9000000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xd9000000 0x20000>;
+		};
 	};
 }; /* end of / */
-- 
2.13.2
