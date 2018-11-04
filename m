From: yangxuan8282@gmail.com (He Yangxuan)
Date: Mon, 5 Nov 2018 00:50:54 +0800
Subject: [PATCH v2 1/3] arm64: dts: meson-gxl: add support for phicomm n1
Message-ID: <20181104165054.oxgmocfntybp37v7@raspberrypi>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for the Phicomm N1. This device based on P230 reference design.
The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
And this box doesn't have cvbs, so disable related section in device tree.

Changes since v1:
 - rewrite external_phy section

Signed-off-by: He Yangxuan <yangxuan8282@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index c31f29d66..49f3ac5d8 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
new file mode 100644
index 000000000..1096509b2
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 He Yangxuan
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905d-p230.dts"
+
+/ {
+	compatible = "phicomm,n1", "amlogic,s905d", "amlogic,meson-gxl";
+	model = "Phicomm N1";
+
+	cvbs-connector {
+		status = "disabled";
+	};
+};
+
+&cvbs_vdac_port {
+	status = "disabled";
+};
+
+&external_phy {
+	/* Realtek RTL8211F (0x001cc916) */
+	eee-broken-1000t;
+};
-- 
2.11.0
