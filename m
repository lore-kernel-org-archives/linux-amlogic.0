From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Mar 2018 21:57:08 +0100
Subject: [PATCH v3 0/1] Meson8b: fix requesting GPIOs greater than GPIOZ_3
Message-ID: <20180312205709.27131-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

GPIOs greater GPIOZ_3 (whose ID is 83 - as a reminder: this is exactly
the number of actual GPIO lines on Meson8b) could not be requested. Using
CARD_6 (ID 100, "base of the GPIO controller is 382) as an example:
$ echo 482 > /sys/class/gpio/export
export_store: invalid GPIO 482

This was discovered by Linus L?ssing when he was adding SD card support
on the Odroid-C1.


changes since v2 at [1]
- added Jerome's Reviewed-by and Linus' Acked-by (thanks to both of you!)
- dropped patch #1 since Linus already applied it to the for-next branch
  of his linux-pinctrl tree (this leaves only patch #2 which should go
  through Kevin's linux-amlogic tree)

changes since RFC v1 at [0]:
- dropped RFC prefix
- instead of adding a hack to override the "ngpio" field this now splits
  the register definitions as suggested by Jerome (and based on the
  discussion of RFC v1). see the description of PATCH #1 for a more
  detailed explanation

[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006259.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-February/006546.html

Martin Blumenstingl (1):
  ARM: dts: meson8b: the CBUS GPIO controller only has 83 GPIOs

 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.16.2
