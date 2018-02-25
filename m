From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 25 Feb 2018 12:38:51 +0100
Subject: [PATCH v2 0/2] Meson8b: fix requesting GPIOs greater than GPIOZ_3
Message-ID: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

GPIOs greater GPIOZ_3 (whose ID is 83 - as a reminder: this is exactly
the number of actual GPIO lines on Meson8b) could not be requested. Using
CARD_6 (ID 100, "base of the GPIO controller is 382) as an example:
$ echo 482 > /sys/class/gpio/export
export_store: invalid GPIO 482

This was discovered by Linus L?ssing when he was adding SD card support
on the Odroid-C1.


changes since RFC v1 at [0]:
- dropped RFC prefix
- instead of adding a hack to override the "ngpio" field this now splits
  the register definitions as suggested by Jerome (and based on the
  discussion of RFC v1). see the description of PATCH #1 for a more
  detailed explanation


@Kevin: PATCH #2 is based on my other patch from [1]:
"ARM: dts: meson8b: add the I2C clocks"


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006259.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-February/006473.html


Martin Blumenstingl (2):
  pinctrl: meson: meson8b: fix requesting GPIOs greater than GPIOZ_3
  ARM: dts: meson8b: the CBUS GPIO controller only has 83 GPIOs

 arch/arm/boot/dts/meson8b.dtsi          |   2 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c |  20 +++---
 include/dt-bindings/gpio/meson8b-gpio.h | 121 ++++++++++++++++++++++++++++----
 3 files changed, 121 insertions(+), 22 deletions(-)

-- 
2.16.2
