From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 30 May 2017 22:27:09 +0200
Subject: [PATCH v5 8/9] ARM: dts: meson: mark gpio controllers as interrupt
 controllers
In-Reply-To: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
Message-ID: <eeb7f081-f52b-0f93-dea7-3c1a0f097e1b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Make the GPIO controllers act as interrupt controllers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- separate ARM / ARM64 DT changes
- add Reviewed-by
---
 arch/arm/boot/dts/meson8.dtsi  | 4 ++++
 arch/arm/boot/dts/meson8b.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index b4c4175d..c64ddd58 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -106,6 +106,8 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_aobus 0 120 16>;
 		};
 
@@ -149,6 +151,8 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_cbus 0 0 120>;
 		};
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fedfef24..dd7ed539 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -99,6 +99,8 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_aobus 0 130 16>;
 		};
 
@@ -174,6 +176,8 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			gpio-ranges = <&pinctrl_cbus 0 0 130>;
 		};
 	};
-- 
2.13.0
