From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Tue,  5 Jul 2016 20:48:39 +0100
Subject: [PATCH v3 0/2] AMLogic Meson SoC RTC driver
Message-ID: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series adds support for the on SoC RTC driver on the
AMLogic Meson devices. The device-tree updates are not included
as they depend on the reset-controller support in -next.

The series does not have any build dependencies, but does require
the reset controller and device-tree entries for the relevant boards
and has been tested on the ODroid-C1 board.

Thanks to Kevin Hilmand and Neil Armstrong for reviewing the driver.

Changes since V1:
  <1467039135-26588-1-git-send-email-ben.dooks@codethink.co.uk>

 - Fixed checkpatch and sparse errors
 - Fixed minor locking bug when writing static-control register
 - Updated the code ordering in the rtc-meson.c driver
 - Fixed alphanumeric ordering in on-cpu rtc block
 - Added Rob Hering's ack for the DT binding documentation
 - Added better description to the RTC driver header.

Ben Dooks (2):
  rtc: support for amlogic meson rtc
  meson-rtc: add device-tree binding

 .../devicetree/bindings/rtc/rtc-amlogic.txt        |  21 ++
 drivers/rtc/Kconfig                                |   9 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-meson.c                            | 349 +++++++++++++++++++++
 6 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
 create mode 100644 drivers/rtc/rtc-meson.c

-- 
2.8.1
