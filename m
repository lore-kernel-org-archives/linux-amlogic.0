From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:40:35 +0100
Subject: [PATCH 0/2] Ethernet PHY interrupt improvements
Message-ID: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

this small series consists of two patches:
#1 documents the GPIO to which the PHY's interrupt line is connected
   (the name "MAC_INTR" is used in the schematics of Odroid-C2 and
    Khadas VIM2)
#2 adds the RTL8211F PHY's interrupt line on Khadas VIM2

I was a bit surprised to see that the GXM Q200 board seems to use
GPIOH_3 instead of GPIOZ_15 like all other boards.
@Jerome: could you please check if GPIOH_3 is correct or if it's
a "copy-and-paste" issue (Q200 is the only GXL/GXM based board.
GXL/GXM SoCs have fewer GPIOAO pins than GXBB, so the interrupt
offset for the same non-GPIOAO pin is different than on GXBB)

compile-tested: all boards
runtime tested: Khadas VIM2 (unplugging / plugging the Ethernet
cable increases the interrupt counter in /proc/interrupts and the
kernel correctly reports that the cable has been {un,}plugged)


Martin Blumenstingl (2):
  ARM64: dts: meson: add comments with the GPIO for the PHY interrupts
  ARM64: dts: meson-gxm: add the PHY interrupt line on Khadas VIM2

 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts   | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts       | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 1 +
 5 files changed, 8 insertions(+)

-- 
2.15.1
