From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  6 May 2018 22:57:47 +0200
Subject: [PATCH 0/2] IR remote (input) support for Odroid-C1 and cleanups
Message-ID: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

While testing my Odroid-C1 I found that the IR remote receiver was still
disabled. While enabling it I saw that the nodes in meson8b-odroidc1.dts
were not sorted alphabetically.

This small series:
- first cleans up the sort order of the nodes in meson8b-odroidc1.dts
- then adds the configuration for GPIOAO_7 so it's routed to the SoCs
  "IR receiver" and enables that in meson8b-odroidc1.dts


Martin Blumenstingl (2):
  ARM: dts: meson8b: odroid-c1: sort nodes alphabetically
  ARM: dts: meson8b: odroid-c1: enable the IR receiver

 arch/arm/boot/dts/meson8b-odroidc1.dts | 68 ++++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi         |  7 +++
 2 files changed, 44 insertions(+), 31 deletions(-)

-- 
2.17.0
