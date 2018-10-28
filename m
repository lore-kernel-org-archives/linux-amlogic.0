From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 15:03:41 +0100
Subject: [PATCH 1/3] ARM: dts: meson6: atv1200: add the /chosen/stdout-path
 property
In-Reply-To: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
References: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181028140343.1071-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Support for Meson6 SoCs is currently very limited. It's often unclear
why such a device does not boot. To debug this the "earlycon" kernel
parameter can be used (without any arguments). However, this requires
the board to define a /chosen/stdout-path property in it's .dts.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson6-atv1200.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
index 9444b0d9628f..fc48cff71ddf 100644
--- a/arch/arm/boot/dts/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/meson6-atv1200.dts
@@ -56,6 +56,10 @@
 		serial0 = &uart_AO;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x40000000 0x80000000>;
 	};
-- 
2.19.1
