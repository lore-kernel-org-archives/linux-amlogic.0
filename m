From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Fri,  2 Jun 2017 14:38:47 +0200
Subject: [PATCH v3 4/6] powerpc: dts: acadia: DT fix
 s/#interrupts-parent/#interrupt-parent/
In-Reply-To: <1496407129-13527-1-git-send-email-geert+renesas@glider.be>
References: <1496407129-13527-1-git-send-email-geert+renesas@glider.be>
Message-ID: <1496407129-13527-5-git-send-email-geert+renesas@glider.be>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v3:
  - No changes,

v2:
  - Add Acked-by.
---
 arch/powerpc/boot/dts/acadia.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/acadia.dts b/arch/powerpc/boot/dts/acadia.dts
index 57291f61ffe7021a..86266159521edac2 100644
--- a/arch/powerpc/boot/dts/acadia.dts
+++ b/arch/powerpc/boot/dts/acadia.dts
@@ -183,7 +183,7 @@
 			usb at ef603000 {
 				compatible = "ohci-be";
 				reg = <0xef603000 0x80>;
-				interrupts-parent = <&UIC0>;
+				interrupt-parent = <&UIC0>;
 				interrupts = <0xd 0x4 0xe 0x4>;
 			};
 
-- 
2.7.4
