From: yangxuan8282@gmail.com (He Yangxuan)
Date: Sat, 10 Nov 2018 11:01:01 +0800
Subject: [PATCH v4 1/3] arm64: dts: meson-gxl: add support for phicomm n1
In-Reply-To: <20181110030103.4091-1-yangxuan8282@gmail.com>
References: <20181110030103.4091-1-yangxuan8282@gmail.com>
Message-ID: <20181110030103.4091-2-yangxuan8282@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for the Phicomm N1. This device based on P230 reference design.
And this box doesn't have cvbs, so disable related section in device tree.

Signed-off-by: He Yangxuan <yangxuan8282@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.11.0
