From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 16 Jan 2018 01:33:44 +0100
Subject: [PATCH 0/2] meson8b-odroidc1: ethernet support
Message-ID: <20180116003344.GA10560@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset, tested on an Odroid-C1+ board, enables ethernet support
on Odroid-C1/C1+ boards, improving and extending the ethernet description
in the relative device tree.

In particular:
- enables the Meson8b ethernet controller pin multiplexing;
- extends the Meson8b ethernet controller description;
- adds the Odroid-C1+ ethernet PHY description and enables the
  ethernet controller.

This patchset depends on patchset "dwmac-meson8b: clock fixes for Meson8b".

Emiliano Ingrassia (2):
  ARM: dts: meson8b: extend ethernet controller description
  ARM: dts: meson8b-odroidc1: ethernet support

 arch/arm/boot/dts/meson8b-odroidc1.dts | 32 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         | 35 ++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.15.1
