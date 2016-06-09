From: carlo@caione.org (Carlo Caione)
Date: Thu,  9 Jun 2016 16:45:41 +0200
Subject: [PATCH 0/2] Prepare U-Boot for more Amlogic boards
Message-ID: <1465483543-2240-1-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

Refactor the Odroid-C2 support code to prepare U-Boot for more Amlogic board
submissions.
The goal is to reduce the redundancy of the configuration files and unify all
the board support files onto a single amlogic directory.

Carlo Caione (2):
  configs: gxbb: Introduce a common config header file
  board: amlogic: Rename folder for Amlogic boards

 arch/arm/mach-meson/Kconfig            |  2 +-
 board/amlogic/odroid-c2/Kconfig        | 12 ++++++
 board/amlogic/odroid-c2/MAINTAINERS    |  6 +++
 board/amlogic/odroid-c2/Makefile       |  7 ++++
 board/amlogic/odroid-c2/README         | 60 ++++++++++++++++++++++++++++++
 board/amlogic/odroid-c2/odroid-c2.c    | 67 ++++++++++++++++++++++++++++++++++
 board/hardkernel/odroid-c2/Kconfig     | 12 ------
 board/hardkernel/odroid-c2/MAINTAINERS |  6 ---
 board/hardkernel/odroid-c2/Makefile    |  7 ----
 board/hardkernel/odroid-c2/README      | 60 ------------------------------
 board/hardkernel/odroid-c2/odroid-c2.c | 67 ----------------------------------
 include/configs/meson-gxbb-common.h    | 45 +++++++++++++++++++++++
 include/configs/odroid-c2.h            | 34 +----------------
 13 files changed, 199 insertions(+), 186 deletions(-)
 create mode 100644 board/amlogic/odroid-c2/Kconfig
 create mode 100644 board/amlogic/odroid-c2/MAINTAINERS
 create mode 100644 board/amlogic/odroid-c2/Makefile
 create mode 100644 board/amlogic/odroid-c2/README
 create mode 100644 board/amlogic/odroid-c2/odroid-c2.c
 delete mode 100644 board/hardkernel/odroid-c2/Kconfig
 delete mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
 delete mode 100644 board/hardkernel/odroid-c2/Makefile
 delete mode 100644 board/hardkernel/odroid-c2/README
 delete mode 100644 board/hardkernel/odroid-c2/odroid-c2.c
 create mode 100644 include/configs/meson-gxbb-common.h

-- 
2.7.4
