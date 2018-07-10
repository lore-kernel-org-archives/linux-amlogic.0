From: ldevulder@suse.de (Loic Devulder)
Date: Tue, 10 Jul 2018 15:15:39 +0200
Subject: [PATCH 1/1] Fix README for Khadas VIM board
In-Reply-To: <20180710131539.32550-1-ldevulder@suse.de>
References: <20180710131539.32550-1-ldevulder@suse.de>
Message-ID: <20180710131539.32550-2-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Fix documentation to be able to cross-compile U-Boot on Khadas VIM board.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 board/amlogic/khadas-vim/README | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
index 7eaca724f8..0f912e9fcd 100644
--- a/board/amlogic/khadas-vim/README
+++ b/board/amlogic/khadas-vim/README
@@ -20,12 +20,19 @@ Currently the u-boot port supports the following devices:
  - serial
  - eMMC, microSD
  - Ethernet
+ - USB
 
 U-Boot compilation
 ==================
 
+ > mkdir ~/cross-compile
+ > cd ~/cross-compile
+ > wget -c https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-elf/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf.tar.xz
+ > tar xvfJ gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf.tar.xz
+ > export PATH=$PWD/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf:$PATH
+ > cd <u-boot_src_directory>
  > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
+ > export CROSS_COMPILE=aarch64-elf-
  > make khadas-vim_defconfig
  > make
 
@@ -36,20 +43,31 @@ Amlogic doesn't provide sources for the firmware and for tools needed
 to create the bootloader image, so it is necessary to obtain them from
 the git tree published by the board vendor:
 
- > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
- > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+To be able to compile the *old* U-Boot (if needed):
+ > Remove the *new* gcc-7.2 from the PATH
+ > cd ~/cross-compile
+ > wget -c https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/aarch64-elf/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf.tar.xz
  > tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+ > export PATH=$PWD/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf/bin:$PATH
+
+To compile the ATF firmware:
+ > cd ~/cross-compile
+ > wget -c https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
  > tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
- > export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+ > export PATH=$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+
+ > cd <where_you_want_to_put_vim-u-boot>
  > git clone https://github.com/khadas/u-boot -b Vim vim-u-boot
  > cd vim-u-boot
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-elf-
  > make kvim_defconfig
  > make
- > export FIPDIR=$PWD/fip
 
 Go back to mainline U-Boot source tree then :
+ > export FIPDIR=$PWD/fip
+ > cd <u-boot_src_directory>
  > mkdir fip
-
  > cp $FIPDIR/gxl/bl2.bin fip/
  > cp $FIPDIR/gxl/acs.bin fip/
  > cp $FIPDIR/gxl/bl21.bin fip/
@@ -67,7 +85,7 @@ Go back to mainline U-Boot source tree then :
 	fip/bl30_new.bin \
 	bl30
 
- > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+ > python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
  > $FIPDIR/blx_fix.sh \
 	fip/bl2_acs.bin \
-- 
2.13.7
