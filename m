From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 30 Oct 2017 00:05:23 +0100
Subject: [PATCH 3/3] ARM: meson: enable MESON_IRQ_GPIO also for MACH_MESON8
In-Reply-To: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171029230523.7355-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now that the GPIO interrupt controller also supports the Meson8 SoCs we
can enable it via Kconfig.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/mach-meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index aff6164b2083..d90f61e6254f 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -23,6 +23,7 @@ config MACH_MESON8
 	default ARCH_MESON
 	select MESON6_TIMER
 	select COMMON_CLK_MESON8B
+	select MESON_IRQ_GPIO
 
 config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
-- 
2.14.3
