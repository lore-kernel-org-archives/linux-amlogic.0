From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 10 May 2018 01:50:34 +0200
Subject: [PATCH v2 1/4] ARM: meson: add support for the Meson8m2 SoCs
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180509235037.5876-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the newly introduced compatible string for the Meson8m2 SoC.
The existing Meson8 Kconfig entry is updated to also provide support for
the Meson8m2 SoCs. The Meson8m2 SoC is mostly identical to the Meson8 SoC
with just a few peripherals being updated. Both SoCs currently
share the same pinctrl, clock and GPIO IRQ bindings. Thus the existing
Kconfig entry is re-used to avoid duplication (the only cost is building
a few extra DTBs).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/mach-meson/Kconfig | 2 +-
 arch/arm/mach-meson/meson.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index d90f61e6254f..2bc630471beb 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -19,7 +19,7 @@ config MACH_MESON6
 	select MESON6_TIMER
 
 config MACH_MESON8
-	bool "Amlogic Meson8 SoCs support"
+	bool "Amlogic Meson8 and Meson8m2 SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
 	select COMMON_CLK_MESON8B
diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index 4e2357178625..c8d99df32f9b 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -20,6 +20,7 @@ static const char * const meson_common_board_compat[] = {
 	"amlogic,meson6",
 	"amlogic,meson8",
 	"amlogic,meson8b",
+	"amlogic,meson8m2",
 	NULL,
 };
 
-- 
2.17.0
