From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Fri, 19 Jan 2018 02:47:17 +0100
Subject: [PATCH v2 0/2] meson8b-odroidc1: ethernet support
Message-ID: <cover.1516326105.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset, tested on an Odroid-C1+ board, enables ethernet support
on Odroid-C1/C1+ boards, improving and extending the ethernet description
in the relative device tree.

In particular:
- enables the Meson8b ethernet controller pin multiplexing;
- fixes and extends the Meson8b ethernet controller description;
- adds the Odroid-C1+ ethernet PHY description and enables the
  ethernet controller.

This patchset depends on patchset "dwmac-meson8b: clock fixes for Meson8b".

Emiliano Ingrassia (2):
  ARM: dts: meson8b: extend ethernet controller description
  ARM: dts: meson8b-odroidc1: ethernet support

 arch/arm/boot/dts/meson8b-odroidc1.dts | 30 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         | 35 ++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.15.1
