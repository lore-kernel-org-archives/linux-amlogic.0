From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:39 +0100
Subject: [PATCH u-boot 00/19] Amlogic Meson cleanup for AXG SoC support
Message-ID: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset will refactor the Amlogic Meson SoC support in order to
easily add support for the Amlogic AXg SoC family, and later the G12x SoCs.

In order :
- Cleanup the mach-meson configs
- Move board support to reference design common boards
- Move board Kconfig into mach-meson
- Add AXG pinctrl & clock support
- Add AXG device tree and mach-meson support
- Add support for S400 reference design
- Do a final factorization of the code
- Add USB boot support in U-boot

At the end of the patches, the board code is lighter and we maintain
only the reference designs, where each board will differ in the defconfig.

It will be simpler to add custom board support for future boards with
more changes against the reference designs.

The complete AXG support depends on the :
- mmc: meson-gx: Add AXG compatible
- net: designware: add meson meson axg compatible
patches submitted to the U-Boot mailing list.

Jerome Brunet (12):
  ARM: meson: clean-up platform selection
  configs: meson: remove unnecessary MESON_FDTFILE_SETTING
  board: amlogic: remove p212 derivatives
  board: amlogic: factorise gxbb boards
  ARM: rework amlogic configuration
  configs: meson: change default load addresses
  pinctrl: meson: rework gx pmx function
  pinctrl: meson: select generic pinctrl
  pinctrl: meson: add axg support
  clk: meson: silence debug print
  ARM: meson: rework soc arch file to prepare for new SoC
  ARM: meson: factorize common code out amlogic's boards

Neil Armstrong (7):
  board: amlogic: move khadas-vim2 as q200 ref board
  clk: meson: add static to meson_gates table
  ARM: meson: Add support for AXG family
  ARM: dts: Sync Amlogic Meson AXG DT from Linux 4.20-rc1
  clk: Add clock driver for AXG
  board: amlogic: add support for S400 board
  ARM: meson: Add boot device discovery

 arch/arm/dts/Makefile                              |    3 +-
 arch/arm/dts/meson-axg-s400.dts                    |  554 +++++++
 arch/arm/dts/meson-axg.dtsi                        | 1589 ++++++++++++++++++++
 arch/arm/include/asm/arch-meson/axg.h              |   52 +
 arch/arm/include/asm/arch-meson/boot.h             |   20 +
 arch/arm/include/asm/arch-meson/clock-axg.h        |  104 ++
 arch/arm/include/asm/arch-meson/clock-gx.h         |  117 ++
 arch/arm/include/asm/arch-meson/clock.h            |  117 --
 arch/arm/include/asm/arch-meson/eth.h              |    6 +-
 arch/arm/include/asm/arch-meson/gx.h               |    1 +
 arch/arm/include/asm/arch-meson/mem.h              |    3 +-
 arch/arm/mach-meson/Kconfig                        |  132 +-
 arch/arm/mach-meson/Makefile                       |    4 +-
 arch/arm/mach-meson/board-axg.c                    |  118 ++
 arch/arm/mach-meson/board-common.c                 |  118 ++
 arch/arm/mach-meson/board-gx.c                     |  138 ++
 arch/arm/mach-meson/board.c                        |  130 --
 arch/arm/mach-meson/eth.c                          |   53 -
 arch/arm/mach-meson/sm.c                           |    1 -
 board/amlogic/khadas-vim/Kconfig                   |   12 -
 board/amlogic/khadas-vim/MAINTAINERS               |    6 -
 board/amlogic/khadas-vim/Makefile                  |    6 -
 board/amlogic/khadas-vim/README                    |  102 --
 board/amlogic/khadas-vim/khadas-vim.c              |   57 -
 board/amlogic/khadas-vim2/Kconfig                  |   12 -
 board/amlogic/khadas-vim2/MAINTAINERS              |    6 -
 board/amlogic/khadas-vim2/Makefile                 |    6 -
 board/amlogic/khadas-vim2/README                   |  103 --
 board/amlogic/khadas-vim2/khadas-vim2.c            |   62 -
 board/amlogic/libretech-cc/Kconfig                 |   12 -
 board/amlogic/libretech-cc/MAINTAINERS             |    6 -
 board/amlogic/libretech-cc/Makefile                |    6 -
 board/amlogic/libretech-cc/README                  |  102 --
 board/amlogic/libretech-cc/libretech-cc.c          |   57 -
 board/amlogic/nanopi-k2/Kconfig                    |   12 -
 board/amlogic/nanopi-k2/MAINTAINERS                |    6 -
 board/amlogic/nanopi-k2/Makefile                   |    7 -
 board/amlogic/nanopi-k2/README                     |   99 --
 board/amlogic/nanopi-k2/nanopi-k2.c                |   55 -
 board/amlogic/odroid-c2/Kconfig                    |   12 -
 board/amlogic/odroid-c2/MAINTAINERS                |    1 +
 board/amlogic/odroid-c2/README                     |   66 -
 board/amlogic/odroid-c2/README.nanopi-k2           |   99 ++
 board/amlogic/odroid-c2/README.odroid-c2           |   66 +
 board/amlogic/odroid-c2/odroid-c2.c                |   16 +-
 board/amlogic/p212/Kconfig                         |   12 -
 board/amlogic/p212/README                          |  103 --
 board/amlogic/p212/README.khadas-vim               |  102 ++
 board/amlogic/p212/README.libretech-cc             |  102 ++
 board/amlogic/p212/README.p212                     |  103 ++
 board/amlogic/p212/p212.c                          |   16 +-
 board/amlogic/q200/MAINTAINERS                     |    6 +
 board/amlogic/q200/Makefile                        |    6 +
 board/amlogic/q200/README.khadas-vim2              |  103 ++
 board/amlogic/q200/README.q200                     |  102 ++
 board/amlogic/q200/q200.c                          |   50 +
 board/amlogic/s400/MAINTAINERS                     |    6 +
 board/amlogic/s400/Makefile                        |    6 +
 board/amlogic/s400/README                          |  110 ++
 board/amlogic/s400/s400.c                          |   21 +
 configs/khadas-vim2_defconfig                      |    1 -
 configs/khadas-vim_defconfig                       |    1 -
 configs/libretech-cc_defconfig                     |    1 -
 configs/nanopi-k2_defconfig                        |    2 -
 configs/odroid-c2_defconfig                        |    1 -
 configs/p212_defconfig                             |    1 -
 configs/s400_defconfig                             |   38 +
 drivers/clk/Makefile                               |    2 +-
 drivers/clk/clk_meson.c                            |    6 +-
 drivers/clk/clk_meson_axg.c                        |  316 ++++
 drivers/pinctrl/meson/Kconfig                      |   18 +-
 drivers/pinctrl/meson/Makefile                     |    3 +
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c      |  125 ++
 drivers/pinctrl/meson/pinctrl-meson-axg.c          |  979 ++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-axg.h          |   66 +
 drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c       |   97 ++
 drivers/pinctrl/meson/pinctrl-meson-gx.h           |   48 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |    6 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |    6 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |  109 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   37 +-
 include/configs/khadas-vim.h                       |   16 -
 include/configs/khadas-vim2.h                      |   18 -
 include/configs/libretech-cc.h                     |   16 -
 include/configs/meson-gx-common.h                  |   52 -
 include/configs/meson64.h                          |   73 +
 include/configs/nanopi-k2.h                        |   16 -
 include/configs/odroid-c2.h                        |   16 -
 include/configs/p212.h                             |   18 -
 include/dt-bindings/clock/axg-aoclkc.h             |   26 +
 include/dt-bindings/clock/axg-audio-clkc.h         |   94 ++
 include/dt-bindings/clock/axg-clkc.h               |   76 +
 include/dt-bindings/gpio/meson-axg-gpio.h          |  116 ++
 .../reset/amlogic,meson-axg-audio-arb.h            |   17 +
 .../dt-bindings/reset/amlogic,meson-axg-reset.h    |  124 ++
 include/dt-bindings/reset/axg-aoclkc.h             |   20 +
 96 files changed, 6038 insertions(+), 1625 deletions(-)
 create mode 100644 arch/arm/dts/meson-axg-s400.dts
 create mode 100644 arch/arm/dts/meson-axg.dtsi
 create mode 100644 arch/arm/include/asm/arch-meson/axg.h
 create mode 100644 arch/arm/include/asm/arch-meson/boot.h
 create mode 100644 arch/arm/include/asm/arch-meson/clock-axg.h
 create mode 100644 arch/arm/include/asm/arch-meson/clock-gx.h
 delete mode 100644 arch/arm/include/asm/arch-meson/clock.h
 create mode 100644 arch/arm/mach-meson/board-axg.c
 create mode 100644 arch/arm/mach-meson/board-common.c
 create mode 100644 arch/arm/mach-meson/board-gx.c
 delete mode 100644 arch/arm/mach-meson/board.c
 delete mode 100644 arch/arm/mach-meson/eth.c
 delete mode 100644 board/amlogic/khadas-vim/Kconfig
 delete mode 100644 board/amlogic/khadas-vim/MAINTAINERS
 delete mode 100644 board/amlogic/khadas-vim/Makefile
 delete mode 100644 board/amlogic/khadas-vim/README
 delete mode 100644 board/amlogic/khadas-vim/khadas-vim.c
 delete mode 100644 board/amlogic/khadas-vim2/Kconfig
 delete mode 100644 board/amlogic/khadas-vim2/MAINTAINERS
 delete mode 100644 board/amlogic/khadas-vim2/Makefile
 delete mode 100644 board/amlogic/khadas-vim2/README
 delete mode 100644 board/amlogic/khadas-vim2/khadas-vim2.c
 delete mode 100644 board/amlogic/libretech-cc/Kconfig
 delete mode 100644 board/amlogic/libretech-cc/MAINTAINERS
 delete mode 100644 board/amlogic/libretech-cc/Makefile
 delete mode 100644 board/amlogic/libretech-cc/README
 delete mode 100644 board/amlogic/libretech-cc/libretech-cc.c
 delete mode 100644 board/amlogic/nanopi-k2/Kconfig
 delete mode 100644 board/amlogic/nanopi-k2/MAINTAINERS
 delete mode 100644 board/amlogic/nanopi-k2/Makefile
 delete mode 100644 board/amlogic/nanopi-k2/README
 delete mode 100644 board/amlogic/nanopi-k2/nanopi-k2.c
 delete mode 100644 board/amlogic/odroid-c2/Kconfig
 delete mode 100644 board/amlogic/odroid-c2/README
 create mode 100644 board/amlogic/odroid-c2/README.nanopi-k2
 create mode 100644 board/amlogic/odroid-c2/README.odroid-c2
 delete mode 100644 board/amlogic/p212/Kconfig
 delete mode 100644 board/amlogic/p212/README
 create mode 100644 board/amlogic/p212/README.khadas-vim
 create mode 100644 board/amlogic/p212/README.libretech-cc
 create mode 100644 board/amlogic/p212/README.p212
 create mode 100644 board/amlogic/q200/MAINTAINERS
 create mode 100644 board/amlogic/q200/Makefile
 create mode 100644 board/amlogic/q200/README.khadas-vim2
 create mode 100644 board/amlogic/q200/README.q200
 create mode 100644 board/amlogic/q200/q200.c
 create mode 100644 board/amlogic/s400/MAINTAINERS
 create mode 100644 board/amlogic/s400/Makefile
 create mode 100644 board/amlogic/s400/README
 create mode 100644 board/amlogic/s400/s400.c
 create mode 100644 configs/s400_defconfig
 create mode 100644 drivers/clk/clk_meson_axg.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg.h
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gx.h
 delete mode 100644 include/configs/khadas-vim.h
 delete mode 100644 include/configs/khadas-vim2.h
 delete mode 100644 include/configs/libretech-cc.h
 delete mode 100644 include/configs/meson-gx-common.h
 create mode 100644 include/configs/meson64.h
 delete mode 100644 include/configs/nanopi-k2.h
 delete mode 100644 include/configs/odroid-c2.h
 delete mode 100644 include/configs/p212.h
 create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
 create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h
 create mode 100644 include/dt-bindings/clock/axg-clkc.h
 create mode 100644 include/dt-bindings/gpio/meson-axg-gpio.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-reset.h
 create mode 100644 include/dt-bindings/reset/axg-aoclkc.h

-- 
2.7.4
