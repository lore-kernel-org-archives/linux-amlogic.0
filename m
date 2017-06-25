From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 25 Jun 2017 17:55:08 +0200
Subject: [PATCH 0/3] GPIO support for Meson GXBB and Odroid-C2
Message-ID: <20170625155511.28447-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this series adds a GPIO driver for Meson GXBB and enables it on
Odroid-C2.

Beniamino Galvani (3):
  arm: dts: meson: import dts files from Linux 4.12-rc6
  pinctrl: meson: add GPIO support
  odroid-c2: enable GPIO

 arch/arm/dts/meson-gx.dtsi                 |  97 +++++++++++++--
 arch/arm/dts/meson-gxbb-odroidc2.dts       |  82 ++++++++++++-
 arch/arm/dts/meson-gxbb.dtsi               | 187 ++++++++++++++++++++++++-----
 configs/odroid-c2_defconfig                |   2 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  21 ++++
 drivers/pinctrl/meson/pinctrl-meson.c      | 167 +++++++++++++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h      |  63 ++++++++++
 include/dt-bindings/clock/gxbb-clkc.h      |  14 ++-
 8 files changed, 586 insertions(+), 47 deletions(-)

-- 
2.9.3
