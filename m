From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 30 Jan 2017 10:35:33 -0800
Subject: [GIT PULL] Amlogic 64-bit DT updates for v4.11
Message-ID: <7hinowwg3u.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Arnd, Olof,

Below is a pull request for Amlogic DT updates.

There is a minor conflict (moved DT node) with arm-soc/for-next with a
fix that has gone in already.  I could've rebased this branch on
v4.10-rc5 but decided to leave it based on an older -rc since that tends
to be the preference, and the conflict resolution is simple (just remove
completely the conflicting part in meson-gxbb.dtsi.)  If you prefer, I
can rebase on v4.10-rc5 and take care of the conflict myself.

Kevin

The following changes since commit a121103c922847ba5010819a3f250f1f7fc84ab8:

  Linux 4.10-rc3 (2017-01-08 14:18:17 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 249a2243e97edcd2cb0bef01a934d4ba21fb167f:

  ARM64: dts: meson-gxl: add the pwm_ao_b pin (2017-01-27 11:00:41 -0800)

----------------------------------------------------------------
Amlogic DT changes for v4.11

- pinctrl updates: PWM, UART and HDMI updates
- clock ID cleanups, exports for DT
- new board support: WeTek Hub and Play
- misc. cleanup/reorg for sharing with new GXM family

----------------------------------------------------------------
Andreas F?rber (1):
      ARM64: dts: meson-gxbb-vega-s95: Add LED

Kevin Hilman (1):
      ARM64: dts: meson-gxl: rename Nexbox A95x for consistency

Martin Blumenstingl (7):
      ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx
      ARM64: dts: meson-gxm: add SCPI configuration for GXM
      ARM64: dts: meson-gx: add the missing uart_AO_B
      ARM64: dts: meson-gx: add the serial CTS and RTS pin groups
      clk: gxbb: add the SAR ADC clocks and expose them
      ARM64: dts: meson-gx: add the missing pwm_AO_ab node
      ARM64: dts: meson-gxl: add the pwm_ao_b pin

Neil Armstrong (6):
      clk: meson-gxbb: Export HDMI clocks
      ARM64: dts: meson-gx: Add HDMI HPD/DDC pinctrl nodes
      ARM64: dts: meson-gxm: Rename q200 and q201 DT files for consistency
      dt-bindings: vendor-prefix: Add wetek vendor prefix
      ARM64: dts: meson-gxbb: Add support for WeTek Hub and Play
      dt-bindings: amlogic: Add WeTek boards

jbrunet (1):
      clk: gxbb: fix CLKID_ETH defined twice

 Documentation/devicetree/bindings/arm/amlogic.txt                                 |   2 +
 Documentation/devicetree/bindings/vendor-prefixes.txt                             |   1 +
 arch/arm64/boot/dts/amlogic/Makefile                                              |   8 ++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                                         |  60 ++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi                              |  11 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts                              |  66 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts                            |  94 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                                       | 118 ++++++++++++++++++++-------------------
 .../dts/amlogic/{meson-gxl-nexbox-a95x.dts => meson-gxl-s905x-nexbox-a95x.dts}    |   0
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                                        |  68 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/{meson-gxm-s912-q200.dts => meson-gxm-q200.dts}       |   0
 arch/arm64/boot/dts/amlogic/{meson-gxm-s912-q201.dts => meson-gxm-q201.dts}       |   0
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                                        |  10 ++++
 drivers/clk/meson/gxbb.c                                                          |  48 ++++++++++++++++
 drivers/clk/meson/gxbb.h                                                          |  15 +++--
 include/dt-bindings/clock/gxbb-clkc.h                                             |   6 ++
 16 files changed, 441 insertions(+), 66 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
 rename arch/arm64/boot/dts/amlogic/{meson-gxl-nexbox-a95x.dts => meson-gxl-s905x-nexbox-a95x.dts} (100%)
 rename arch/arm64/boot/dts/amlogic/{meson-gxm-s912-q200.dts => meson-gxm-q200.dts} (100%)
 rename arch/arm64/boot/dts/amlogic/{meson-gxm-s912-q201.dts => meson-gxm-q201.dts} (100%)
