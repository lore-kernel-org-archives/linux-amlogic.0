From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 14 Aug 2018 15:07:51 +0200
Subject: [PATCH u-boot 0/3] amlogic: clean up board files
Message-ID: <20180814130754.19294-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this series simplifies Amlogic board files by factorizing common code
and removing unneeded parts. Also, it fixes printing the serial
number read from efuse.

Beniamino Galvani (3):
  boards: amlogic: remove ethernet gpio reset code from boards
  boards: amlogic: use common function for environment initialization
  arm: meson: null-terminate the serial number

 arch/arm/include/asm/arch-meson/sm.h      |  1 +
 arch/arm/mach-meson/sm.c                  | 29 +++++++++++++++++++++
 board/amlogic/khadas-vim/khadas-vim.c     | 25 +-----------------
 board/amlogic/libretech-cc/libretech-cc.c | 25 +-----------------
 board/amlogic/nanopi-k2/nanopi-k2.c       | 31 +----------------------
 board/amlogic/odroid-c2/odroid-c2.c       | 31 +----------------------
 board/amlogic/p212/p212.c                 | 25 +-----------------
 7 files changed, 35 insertions(+), 132 deletions(-)

-- 
2.17.1
