From: maxi.jourdan@wanadoo.fr (Maxime Jourdan)
Date: Wed,  1 Aug 2018 21:33:18 +0200
Subject: [RFC 2/4] ARM64: dts: meson-gx: add vdec entry
In-Reply-To: <20180801193320.25313-1-maxi.jourdan@wanadoo.fr>
References: <20180801193320.25313-1-maxi.jourdan@wanadoo.fr>
Message-ID: <20180801193320.25313-3-maxi.jourdan@wanadoo.fr>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the video decoder dts entry

Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index b8dc4dbb391b..248052737aa7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -483,6 +483,20 @@
 			};
 		};
 
+		vdec: video-decoder at 0xd0050000 {
+			compatible = "amlogic,meson-gx-vdec";
+			reg = <0x0 0xc8820000 0x0 0x10000
+			       0x0 0xc110a580 0x0 0xe4
+			       0x0 0xc8838000 0x0 0x60>;
+			reg-names = "dos", "esparser", "dmc";
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING
+				      GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "vdec", "esparser";
+
+			amlogic,ao-sysctrl = <&sysctrl_AO>;
+		};
+
 		vpu: vpu at d0100000 {
 			compatible = "amlogic,meson-gx-vpu";
 			reg = <0x0 0xd0100000 0x0 0x100000>,
-- 
2.17.1
