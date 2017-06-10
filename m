From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 23:58:44 +0200
Subject: [PATCH v7 8/9] ARM: dts: meson: mark gpio controllers as interrupt
 controllers
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Message-ID: <fe6fb55b-ed7a-db0d-a57e-71d076262866@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Make the GPIO controllers act as interrupt controllers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- separate ARM / ARM64 DT changes
- add Reviewed-by
v6:
- no changes
v7:
- no changes
---
 arch/arm/boot/dts/meson8.dtsi  | 4 ++++
 arch/arm/boot/dts/meson8b.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 6c3a68af..952dad3d 100644
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
index 64d02932..570a347e 100644
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
2.13.1
