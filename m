From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 23:58:42 +0200
Subject: [PATCH v7 7/9] pinctrl: meson: update DT binding documentation
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Message-ID: <db9dc245-ba9a-a35b-91b2-7342a45abebe@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The GPIO controllers act as interrupt controllers now,
therefore update the related DT binding documentation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v5:
- separate documentation update from actual DT update
- add Reviewed-by
v6:
- add Acked-by
v7:
- no changes
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
2.13.1
