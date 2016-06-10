From: carlo@caione.org (Carlo Caione)
Date: Fri, 10 Jun 2016 20:18:21 +0200
Subject: [PATCH v2 0/2] Prepare U-Boot for more Amlogic boards
Message-ID: <1465582703-20895-1-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

Refactor the Odroid-C2 support code to prepare U-Boot for more Amlogic board
submissions.
The goal is to reduce the redundancy of the configuration files and unify all
the board support files onto a single amlogic directory.

Changelog:
v2:
 - Added Reviewed-by
 - Now 2/2 clearly shows the renaming

Carlo Caione (2):
  configs: gxbb: Introduce a common config header file
  board: amlogic: Rename folder for Amlogic boards

 arch/arm/mach-meson/Kconfig                        |  2 +-
 board/{hardkernel => amlogic}/odroid-c2/Kconfig    |  2 +-
 .../{hardkernel => amlogic}/odroid-c2/MAINTAINERS  |  2 +-
 board/{hardkernel => amlogic}/odroid-c2/Makefile   |  0
 board/{hardkernel => amlogic}/odroid-c2/README     |  0
 .../{hardkernel => amlogic}/odroid-c2/odroid-c2.c  |  0
 include/configs/meson-gxbb-common.h                | 45 ++++++++++++++++++++++
 include/configs/odroid-c2.h                        | 34 +---------------
 8 files changed, 49 insertions(+), 36 deletions(-)
 rename board/{hardkernel => amlogic}/odroid-c2/Kconfig (85%)
 rename board/{hardkernel => amlogic}/odroid-c2/MAINTAINERS (80%)
 rename board/{hardkernel => amlogic}/odroid-c2/Makefile (100%)
 rename board/{hardkernel => amlogic}/odroid-c2/README (100%)
 rename board/{hardkernel => amlogic}/odroid-c2/odroid-c2.c (100%)
 create mode 100644 include/configs/meson-gxbb-common.h

-- 
2.7.4
