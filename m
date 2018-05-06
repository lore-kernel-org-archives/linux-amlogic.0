From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  6 May 2018 11:21:14 +0200
Subject: [PATCH 1/6] dt-bindings: arm: amlogic: add support for the Meson8m2
 SoC
In-Reply-To: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180506092119.467-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Meson8m2 SoC is an updated version of the Meson8 SoC. Some of the
peripherals are updated to be register-compatible with Meson8b.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index f747f47922c5..6c6642c69de3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -25,6 +25,10 @@ Boards with the Amlogic Meson8b SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,meson8b";
 
+Boards with the Amlogic Meson8m2 SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,meson8m2";
+
 Boards with the Amlogic Meson GXBaby SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,meson-gxbb";
-- 
2.17.0
