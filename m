From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 20 Jan 2017 08:20:23 -0800
Subject: [PATCH 0/2] Amlogic fixes for v4.10-rc
Message-ID: <20170120162025.31806-1-khilman@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Arnd, Olof,

A couple more Amlogic fixes for the -rc cycle.  The reserved memory is
updated after some debate/discussion of the first version.  This one
has and ack/review from Andreas who objected to the first version.

Kevin

Jerome Brunet (1):
  ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage

Neil Armstrong (1):
  ARM64: dts: meson-gx: Add firmware reserved memory zones

 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 18 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 12 ++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.9.3
