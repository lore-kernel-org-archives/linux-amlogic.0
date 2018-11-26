From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 26 Nov 2018 09:59:33 +0100
Subject: [PATCH u-boot v2 00/19] Amlogic Meson cleanup for AXG SoC support
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <258ad68f-a711-9998-71aa-a3521709cf44@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Tom,

On 22/11/2018 10:07, Neil Armstrong wrote:
> This patchset will refactor the Amlogic Meson SoC support in order to
> easily add support for the Amlogic AXg SoC family, and later the G12x SoCs.
> 
> In order :
> - Cleanup the mach-meson configs
> - Move board support to reference design common boards
> - Move board Kconfig into mach-meson
> - Add AXG pinctrl & clock support
> - Add AXG device tree and mach-meson support
> - Add support for S400 reference design
> - Do a final factorization of the code
> - Add USB boot support in U-boot
> 
> At the end of the patches, the board code is lighter and we maintain
> only the reference designs, where each board will differ in the defconfig.
> 
> It will be simpler to add custom board support for future boards with
> more changes against the reference designs.
> 
> The complete AXG support depends on the :
> - mmc: meson-gx: Add AXG compatible
> - net: designware: add meson meson axg compatible
> patches submitted to the U-Boot mailing list.Hi 

Would it be simpler if I send you a pull-request with this patchset and all dependencies ?

Tell me if you have any comments on the patchset and the 2 dependencies !

Thanks,
Neil

> 
> Changes since v1:
> - Fixed AXG pinctrl request and AO pin count
> - Fixed tabs/spaces issues on s400 README
> 
> Jerome Brunet (12):
>   ARM: meson: clean-up platform selection
>   configs: meson: remove unnecessary MESON_FDTFILE_SETTING
>   board: amlogic: remove p212 derivatives
>   board: amlogic: factorise gxbb boards
>   ARM: rework amlogic configuration
>   configs: meson: change default load addresses
>   pinctrl: meson: rework gx pmx function
>   pinctrl: meson: select generic pinctrl
>   pinctrl: meson: add axg support
>   clk: meson: silence debug print
>   ARM: meson: rework soc arch file to prepare for new SoC
>   ARM: meson: factorize common code out amlogic's boards
> 
> Neil Armstrong (7):
>   board: amlogic: move khadas-vim2 as q200 ref board
>   clk: meson: add static to meson_gates table
>   ARM: meson: Add support for AXG family
>   ARM: dts: Sync Amlogic Meson AXG DT from Linux 4.20-rc1
>   clk: Add clock driver for AXG
>   board: amlogic: add support for S400 board
>   ARM: meson: Add boot device discovery
> 
>  arch/arm/dts/Makefile                         |    3 +-
>  arch/arm/dts/meson-axg-s400.dts               |  554 ++++++
>  arch/arm/dts/meson-axg.dtsi                   | 1589 +++++++++++++++++
>  arch/arm/include/asm/arch-meson/axg.h         |   52 +
>  arch/arm/include/asm/arch-meson/boot.h        |   20 +
>  arch/arm/include/asm/arch-meson/clock-axg.h   |  104 ++
>  .../asm/arch-meson/{clock.h => clock-gx.h}    |    4 +-
>  arch/arm/include/asm/arch-meson/eth.h         |    6 +-
>  arch/arm/include/asm/arch-meson/gx.h          |    1 +
>  arch/arm/include/asm/arch-meson/mem.h         |    3 +-
>  arch/arm/mach-meson/Kconfig                   |  132 +-
>  arch/arm/mach-meson/Makefile                  |    4 +-
>  arch/arm/mach-meson/board-axg.c               |  118 ++
>  arch/arm/mach-meson/board-common.c            |  117 ++
>  arch/arm/mach-meson/{board.c => board-gx.c}   |  106 +-
>  arch/arm/mach-meson/eth.c                     |   53 -
>  arch/arm/mach-meson/sm.c                      |    1 -
>  board/amlogic/khadas-vim/Kconfig              |   12 -
>  board/amlogic/khadas-vim/MAINTAINERS          |    6 -
>  board/amlogic/khadas-vim/khadas-vim.c         |   57 -
>  board/amlogic/khadas-vim2/Kconfig             |   12 -
>  board/amlogic/libretech-cc/Kconfig            |   12 -
>  board/amlogic/libretech-cc/MAINTAINERS        |    6 -
>  board/amlogic/libretech-cc/Makefile           |    6 -
>  board/amlogic/libretech-cc/libretech-cc.c     |   57 -
>  board/amlogic/nanopi-k2/Kconfig               |   12 -
>  board/amlogic/nanopi-k2/MAINTAINERS           |    6 -
>  board/amlogic/nanopi-k2/Makefile              |    7 -
>  board/amlogic/nanopi-k2/nanopi-k2.c           |   55 -
>  board/amlogic/odroid-c2/Kconfig               |   12 -
>  board/amlogic/odroid-c2/MAINTAINERS           |    1 +
>  .../README => odroid-c2/README.nanopi-k2}     |    0
>  .../odroid-c2/{README => README.odroid-c2}    |    0
>  board/amlogic/odroid-c2/odroid-c2.c           |   16 +-
>  board/amlogic/p212/Kconfig                    |   12 -
>  .../README => p212/README.khadas-vim}         |    0
>  .../README => p212/README.libretech-cc}       |    0
>  board/amlogic/p212/{README => README.p212}    |    0
>  board/amlogic/p212/p212.c                     |   16 +-
>  .../amlogic/{khadas-vim2 => q200}/MAINTAINERS |    6 +-
>  board/amlogic/{khadas-vim => q200}/Makefile   |    2 +-
>  .../README => q200/README.khadas-vim2}        |    0
>  board/amlogic/q200/README.q200                |  102 ++
>  .../khadas-vim2.c => q200/q200.c}             |   14 +-
>  board/amlogic/s400/MAINTAINERS                |    6 +
>  board/amlogic/{khadas-vim2 => s400}/Makefile  |    2 +-
>  board/amlogic/s400/README                     |  110 ++
>  board/amlogic/s400/s400.c                     |   21 +
>  configs/khadas-vim2_defconfig                 |    1 -
>  configs/khadas-vim_defconfig                  |    1 -
>  configs/libretech-cc_defconfig                |    1 -
>  configs/nanopi-k2_defconfig                   |    2 -
>  configs/odroid-c2_defconfig                   |    1 -
>  configs/p212_defconfig                        |    1 -
>  configs/s400_defconfig                        |   38 +
>  drivers/clk/Makefile                          |    2 +-
>  drivers/clk/clk_meson.c                       |    6 +-
>  drivers/clk/clk_meson_axg.c                   |  316 ++++
>  drivers/pinctrl/meson/Kconfig                 |   18 +-
>  drivers/pinctrl/meson/Makefile                |    3 +
>  drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c |  125 ++
>  drivers/pinctrl/meson/pinctrl-meson-axg.c     |  979 ++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-axg.h     |   66 +
>  drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c  |   97 +
>  drivers/pinctrl/meson/pinctrl-meson-gx.h      |   48 +
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c    |    6 +-
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c     |    6 +-
>  drivers/pinctrl/meson/pinctrl-meson.c         |  109 +-
>  drivers/pinctrl/meson/pinctrl-meson.h         |   37 +-
>  include/configs/khadas-vim.h                  |   16 -
>  include/configs/khadas-vim2.h                 |   18 -
>  include/configs/libretech-cc.h                |   16 -
>  .../configs/{meson-gx-common.h => meson64.h}  |   49 +-
>  include/configs/nanopi-k2.h                   |   16 -
>  include/configs/odroid-c2.h                   |   16 -
>  include/configs/p212.h                        |   18 -
>  include/dt-bindings/clock/axg-aoclkc.h        |   26 +
>  include/dt-bindings/clock/axg-audio-clkc.h    |   94 +
>  include/dt-bindings/clock/axg-clkc.h          |   76 +
>  include/dt-bindings/gpio/meson-axg-gpio.h     |  116 ++
>  .../reset/amlogic,meson-axg-audio-arb.h       |   17 +
>  .../reset/amlogic,meson-axg-reset.h           |  124 ++
>  include/dt-bindings/reset/axg-aoclkc.h        |   20 +
>  83 files changed, 5166 insertions(+), 754 deletions(-)
>  create mode 100644 arch/arm/dts/meson-axg-s400.dts
>  create mode 100644 arch/arm/dts/meson-axg.dtsi
>  create mode 100644 arch/arm/include/asm/arch-meson/axg.h
>  create mode 100644 arch/arm/include/asm/arch-meson/boot.h
>  create mode 100644 arch/arm/include/asm/arch-meson/clock-axg.h
>  rename arch/arm/include/asm/arch-meson/{clock.h => clock-gx.h} (98%)
>  create mode 100644 arch/arm/mach-meson/board-axg.c
>  create mode 100644 arch/arm/mach-meson/board-common.c
>  rename arch/arm/mach-meson/{board.c => board-gx.c} (59%)
>  delete mode 100644 arch/arm/mach-meson/eth.c
>  delete mode 100644 board/amlogic/khadas-vim/Kconfig
>  delete mode 100644 board/amlogic/khadas-vim/MAINTAINERS
>  delete mode 100644 board/amlogic/khadas-vim/khadas-vim.c
>  delete mode 100644 board/amlogic/khadas-vim2/Kconfig
>  delete mode 100644 board/amlogic/libretech-cc/Kconfig
>  delete mode 100644 board/amlogic/libretech-cc/MAINTAINERS
>  delete mode 100644 board/amlogic/libretech-cc/Makefile
>  delete mode 100644 board/amlogic/libretech-cc/libretech-cc.c
>  delete mode 100644 board/amlogic/nanopi-k2/Kconfig
>  delete mode 100644 board/amlogic/nanopi-k2/MAINTAINERS
>  delete mode 100644 board/amlogic/nanopi-k2/Makefile
>  delete mode 100644 board/amlogic/nanopi-k2/nanopi-k2.c
>  delete mode 100644 board/amlogic/odroid-c2/Kconfig
>  rename board/amlogic/{nanopi-k2/README => odroid-c2/README.nanopi-k2} (100%)
>  rename board/amlogic/odroid-c2/{README => README.odroid-c2} (100%)
>  delete mode 100644 board/amlogic/p212/Kconfig
>  rename board/amlogic/{khadas-vim/README => p212/README.khadas-vim} (100%)
>  rename board/amlogic/{libretech-cc/README => p212/README.libretech-cc} (100%)
>  rename board/amlogic/p212/{README => README.p212} (100%)
>  rename board/amlogic/{khadas-vim2 => q200}/MAINTAINERS (54%)
>  rename board/amlogic/{khadas-vim => q200}/Makefile (85%)
>  rename board/amlogic/{khadas-vim2/README => q200/README.khadas-vim2} (100%)
>  create mode 100644 board/amlogic/q200/README.q200
>  rename board/amlogic/{khadas-vim2/khadas-vim2.c => q200/q200.c} (85%)
>  create mode 100644 board/amlogic/s400/MAINTAINERS
>  rename board/amlogic/{khadas-vim2 => s400}/Makefile (84%)
>  create mode 100644 board/amlogic/s400/README
>  create mode 100644 board/amlogic/s400/s400.c
>  create mode 100644 configs/s400_defconfig
>  create mode 100644 drivers/clk/clk_meson_axg.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-axg.h
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-gx.h
>  delete mode 100644 include/configs/khadas-vim.h
>  delete mode 100644 include/configs/khadas-vim2.h
>  delete mode 100644 include/configs/libretech-cc.h
>  rename include/configs/{meson-gx-common.h => meson64.h} (51%)
>  delete mode 100644 include/configs/nanopi-k2.h
>  delete mode 100644 include/configs/odroid-c2.h
>  delete mode 100644 include/configs/p212.h
>  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
>  create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h
>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
>  create mode 100644 include/dt-bindings/gpio/meson-axg-gpio.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-reset.h
>  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
> 
