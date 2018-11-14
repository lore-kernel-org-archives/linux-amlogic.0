From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 14 Nov 2018 11:19:24 +0100
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add libretech aml-s805x-ac
 bindings
In-Reply-To: <20181114101925.10526-1-jbrunet@baylibre.com>
References: <20181114101925.10526-1-jbrunet@baylibre.com>
Message-ID: <20181114101925.10526-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add bindings for the Libretech aml-s805x-ac board, aka 'La Frite'.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4498292b833d..203d38e5e271 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -93,6 +93,7 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,p231" (Meson gxl s905d)
 
   - "amlogic,p241" (Meson gxl s805x)
+  - "libretech,aml-s805x-ac" (Meson gxl s805x)
 
   - "amlogic,p281" (Meson gxl s905w)
   - "oranth,tx3-mini" (Meson gxl s905w)
-- 
2.19.1
