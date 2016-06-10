From: carlo@caione.org (Carlo Caione)
Date: Fri, 10 Jun 2016 20:18:23 +0200
Subject: [PATCH v2 2/2] board: amlogic: Rename folder for Amlogic boards
In-Reply-To: <1465582703-20895-1-git-send-email-carlo@caione.org>
References: <1465582703-20895-1-git-send-email-carlo@caione.org>
Message-ID: <1465582703-20895-3-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

s/hardkernel/amlogic/ to have a single place for all the amlogic-based
boards.

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 arch/arm/mach-meson/Kconfig                         | 2 +-
 board/{hardkernel => amlogic}/odroid-c2/Kconfig     | 2 +-
 board/{hardkernel => amlogic}/odroid-c2/MAINTAINERS | 2 +-
 board/{hardkernel => amlogic}/odroid-c2/Makefile    | 0
 board/{hardkernel => amlogic}/odroid-c2/README      | 0
 board/{hardkernel => amlogic}/odroid-c2/odroid-c2.c | 0
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename board/{hardkernel => amlogic}/odroid-c2/Kconfig (85%)
 rename board/{hardkernel => amlogic}/odroid-c2/MAINTAINERS (80%)
 rename board/{hardkernel => amlogic}/odroid-c2/Makefile (100%)
 rename board/{hardkernel => amlogic}/odroid-c2/README (100%)
 rename board/{hardkernel => amlogic}/odroid-c2/odroid-c2.c (100%)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 77d3cfe..af3be59 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -26,6 +26,6 @@ config SYS_SOC
 config SYS_MALLOC_F_LEN
 	default 0x1000
 
-source "board/hardkernel/odroid-c2/Kconfig"
+source "board/amlogic/odroid-c2/Kconfig"
 
 endif
diff --git a/board/hardkernel/odroid-c2/Kconfig b/board/amlogic/odroid-c2/Kconfig
similarity index 85%
rename from board/hardkernel/odroid-c2/Kconfig
rename to board/amlogic/odroid-c2/Kconfig
index 687d9c6..2b16889 100644
--- a/board/hardkernel/odroid-c2/Kconfig
+++ b/board/amlogic/odroid-c2/Kconfig
@@ -4,7 +4,7 @@ config SYS_BOARD
 	default "odroid-c2"
 
 config SYS_VENDOR
-	default "hardkernel"
+	default "amlogic"
 
 config SYS_CONFIG_NAME
 	default "odroid-c2"
diff --git a/board/hardkernel/odroid-c2/MAINTAINERS b/board/amlogic/odroid-c2/MAINTAINERS
similarity index 80%
rename from board/hardkernel/odroid-c2/MAINTAINERS
rename to board/amlogic/odroid-c2/MAINTAINERS
index 23ae1e7..699850f 100644
--- a/board/hardkernel/odroid-c2/MAINTAINERS
+++ b/board/amlogic/odroid-c2/MAINTAINERS
@@ -1,6 +1,6 @@
 ODROID-C2
 M:	Beniamino Galvani <b.galvani@gmail.com>
 S:	Maintained
-F:	board/hardkernel/odroid-c2/
+F:	board/amlogic/odroid-c2/
 F:	include/configs/odroid-c2.h
 F:	configs/odroid-c2_defconfig
diff --git a/board/hardkernel/odroid-c2/Makefile b/board/amlogic/odroid-c2/Makefile
similarity index 100%
rename from board/hardkernel/odroid-c2/Makefile
rename to board/amlogic/odroid-c2/Makefile
diff --git a/board/hardkernel/odroid-c2/README b/board/amlogic/odroid-c2/README
similarity index 100%
rename from board/hardkernel/odroid-c2/README
rename to board/amlogic/odroid-c2/README
diff --git a/board/hardkernel/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
similarity index 100%
rename from board/hardkernel/odroid-c2/odroid-c2.c
rename to board/amlogic/odroid-c2/odroid-c2.c
-- 
2.7.4
