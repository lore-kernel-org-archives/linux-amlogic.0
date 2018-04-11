From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 17:40:39 +0200
Subject: [PATCH u-boot 0/2] ARM64: meson: Sync DT and Bindings with Linux 4.16
Message-ID: <1523461241-30436-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Synchronize the Amlogic Meson GX Device Tree and bindings with Linux 4.16 to
beneficiate with the new DT nodes.

The pinctrl bindings has changed since 4.13, so the pinctrl driver must be
updated with the changes.

Neil Armstrong (2):
  ARM64: meson: Sync DT and Bindings with Linux 4.16
  pinctrl: meson: Update pinmux with new Linux bindings

 arch/arm/dts/meson-gx.dtsi                    |  87 ++++++++++-----
 arch/arm/dts/meson-gxbb-odroidc2.dts          |  56 ++++++++--
 arch/arm/dts/meson-gxbb.dtsi                  | 137 ++++++++++++++++++++++--
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   |  63 +++++++++++
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 108 ++++++++++++++++++-
 arch/arm/dts/meson-gxl-s905x-p212.dts         |   7 ++
 arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  24 ++++-
 arch/arm/dts/meson-gxl.dtsi                   | 147 ++++++++++++++++++++++++--
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    |  12 +--
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     |  14 +--
 include/dt-bindings/clock/gxbb-aoclkc.h       |   1 +
 include/dt-bindings/clock/gxbb-clkc.h         |  75 +++++++++++++
 include/dt-bindings/gpio/meson-gxbb-gpio.h    |   2 +-
 include/dt-bindings/gpio/meson-gxl-gpio.h     |   2 +-
 14 files changed, 658 insertions(+), 77 deletions(-)

-- 
2.7.4
