From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 29 Nov 2018 12:50:33 -0800
Subject: [GIT PULL] arm64: dts: Amlogic updates for v4.21
Message-ID: <7hlg5b8v6u.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:

  arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)

----------------------------------------------------------------
arm64: Amlogic DT updates for v4.21
Some highlights:
- new boards: Phicomm N1 (S905D), Libretech S805-AC
- fixes for pinmux pad bias, GPIO line names
- AXG: enable SCPI, add secure monitor

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson-gxl-s905x-khadas-vim enable Bluetooth

He Yangxuan (4):
      arm64: dts: meson: p230: disable advertisement EEE for GbE.
      arm64: dts: meson-gxl: add support for phicomm n1
      dt-bindings: Add vendor prefix for PHICOMM Co., Ltd.
      dt-bindings: arm: amlogic: Add Phicomm N1

Jerome Brunet (13):
      arm64: dts: meson-gx: add efuse pclk
      arm64: dts: meson-axg: fix dtc warning about unit address
      arm64: dts: meson-axg: s400: add cts-rts to the bluetooth uart
      arm64: dts: meson-axg: add secure monitor
      arm64: dts: meson-axg: fix mailbox address
      arm64: dts: meson-axg: correct sram shared mem unit-address
      Documentation: bindings: Add missing Amlogic SCPI sensor bindings
      arm64: dts: meson-axg: enable SCPI
      arm64: dts: meson: s400: add bcm bluetooth device
      arm64: dts: meson: remove extra subnode in mmc clk_gate pinmux
      arm64: dts: meson: disable pad bias for mmc pinmuxes
      arm64: dts: meson: consistently disable pin bias
      dt-bindings: arm: amlogic: add libretech aml-s805x-ac bindings

Neil Armstrong (7):
      arm64: dts: meson-gxl-libretech-cc: fix GPIO lines names
      arm64: dts: meson-gxbb-nanopi-k2: fix GPIO lines names
      arm64: dts: meson-gxbb-odroidc2: fix GPIO lines names
      arm64: dts: meson-gxl-khadas-vim: fix GPIO lines names
      arm64: dts: meson-gx: Add hdmi_5v regulator as hdmi tx supply
      arm64: dts: meson: add libretech aml-s805x-ac board
      arm64: dts: meson-gx: Add Internal Clock Measurer node

Viresh Kumar (1):
      arm64: dts: amlogic: Add all CPUs in cooling maps

 Documentation/devicetree/bindings/arm/amlogic,scpi.txt       |   7 +++
 Documentation/devicetree/bindings/arm/amlogic.txt            |   2 +
 Documentation/devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/amlogic/Makefile                         |   2 +
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts               |  34 ++++++++------
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   | 155 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi          |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    |   5 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts          |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  |  64 ++++++++++++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts | 248 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts         |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts   |  21 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   |  12 ++++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts         |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   |  66 +++++++++++++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        |  23 ++++------
 19 files changed, 590 insertions(+), 66 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
