From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Jun 2018 21:38:28 +0200
Subject: [PATCH 1/1] ARM64: dts: meson-gx-p23x-q20x: move the wifi node to
 each board's .dts
In-Reply-To: <20180623193828.6047-1-martin.blumenstingl@googlemail.com>
References: <20180623193828.6047-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180623193828.6047-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

meson-gx-p23x-q20x.dtsi is currently used by five boards:
- Amlogic P230 and P231 (which should be identical, apart from the
  external RGMII PHY on P230 whereas P231 can only use the internal PHY)
- Amlogic Q200 (identical to P230 but with an S912 GXM SoC instead of a
  GXL S905D SoC) and Q201 (identical to P231 but with an S912 GXM SoC
  instead of a GXL S905D SoC)
- NEXBOX A1 (based on the S912 GXM SoC)

The Amlogic P230 board uses a Broadcom BCM4356 SDIO wifi chip. Since the
other Amlogic reference design boards are very similar it's safe to
assume that these also use a Broadcom based SDIO wifi chip (which is
also how it was configured in meson-gx-p23x-q20x.dtsi).

However, NEXBOX A1 comes with a "longsys LTM8830" SDIO wifi module,
which is based on the "Qualcomm Atheros QCA9377-3(QCA1023-0)" chipset.

Thus move the wifi node from meson-gx-p23x-q20x.dtsi to each of the
four Amlogic reference board's .dts files.
There are no devicetree bindings for the QCA9377 SDIO wifi module yet,
so nothing is added to meson-gxm-nexbox-a1.dts.

Fixes: f51b454549b812 ("ARM64: dts: meson-gxm: Add support for the Nexbox A1")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 5 -----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts       | 7 +++++++
 5 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 01616982af0d..765247bc4f24 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -172,11 +172,6 @@
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
-
-	brcmf: wifi at 1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
 };
 
 /* SD card */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 9c5be060fd5e..15014faa2ab2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -100,3 +100,10 @@
 		remote-endpoint = <&hdmi_connector_in>;
 	};
 };
+
+&sd_emmc_a {
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
index 80a231476b80..92c425d0259c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
@@ -19,3 +19,10 @@
 	phy-mode = "rmii";
 	phy-handle = <&internal_phy>;
 };
+
+&sd_emmc_a {
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 432f7a435fba..73d656e4aade 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -71,3 +71,10 @@
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
+
+&sd_emmc_a {
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
index 8d132b17514a..d02b80d77378 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts
@@ -19,3 +19,10 @@
 	phy-mode = "rmii";
 	phy-handle = <&internal_phy>;
 };
+
+&sd_emmc_a {
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
-- 
2.18.0
