From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Aug 2016 15:38:08 +0200
Subject: [PATCH 0/3] eMMC, SD-card and ethernet support for Vega S95 boards
In-Reply-To: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds support for the internal eMMC, the SD-card slot and ethernet on
all Tronsmart S95 Vega boards.
There are some S95 Vega Meta clones out there where the bootloader does
not configure the ethernet registers correctly, leading to non-working
ethernet. This will be fixed in a separate series. Boards which are not
suffering from broken bootloaders have fully working ethernet.

Changes since the RFC:
- added eMMC support
- renamed fixed 3V3 regulator so it can be re-used for eMMC

Martin Blumenstingl (3):
  ARM64: dts: amlogic: SD card support for all Tronsmart Vega S95
    devices
  ARM64: dts: amlogic: eMMC support for all Tronsmart Vega S95 devices
  ARM64: dts: amlogic: enable ethernet on all Tronsmart Vega S95 devices

 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
2.9.3
