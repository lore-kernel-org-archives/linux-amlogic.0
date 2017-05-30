From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 30 May 2017 22:26:53 +0200
Subject: [PATCH v5 7/9] pinctrl: meson: update DT binding documentation
In-Reply-To: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
Message-ID: <7bcb2099-c7e6-e06a-d451-44108f958ef0@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The GPIO controllers act as interrupt controllers now,
therefore update the related DT binding documentation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- separate documentation update from actual DT update
- add Reviewed-by
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 2392557e..49a8118a 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -24,6 +24,8 @@ Required properties for sub-nodes are:
    when it is missing the "pull" registers are used instead
  - gpio-controller: identifies the node as a gpio controller
  - #gpio-cells: must be 2
+ - interrupt-controller: identifies the node as interrupt controller
+ - #interrupt-cells: must be 2
 
 === Other sub-nodes ===
 
@@ -62,6 +64,8 @@ pinctrl-bindings.txt
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
                };
 
 		nand {
-- 
2.13.0
