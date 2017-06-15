From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 15 Jun 2017 23:33:51 +0200
Subject: [PATCH v2 09/10] ARM: dts: meson8b: add the SCU device node
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170615213352.25134-10-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic's Meson8b SoC has a Snoop Control Unit (SCU), just like many
other Cortex-A5 SoCs. Add the corresponding devicetree node so it can be
used during SMP boot.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 5 +++++
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 17a4c6255589..dfe83364eceb 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -110,6 +110,11 @@
 			no-map;
 		};
 	};
+
+	scu at c4300000 {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0xc4300000 0x100>;
+	};
 }; /* end of / */
 
 &aobus {
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 521be5dfa8ef..173b12a999e6 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -82,6 +82,11 @@
 			reg = <0x203>;
 		};
 	};
+
+	scu at c4300000 {
+		compatible = "arm,cortex-a5-scu";
+		reg = <0xc4300000 0x100>;
+	};
 }; /* end of / */
 
 &aobus {
-- 
2.13.1
