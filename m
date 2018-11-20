From: ldevulder@suse.de (Loic Devulder)
Date: Wed, 21 Nov 2018 00:50:17 +0100
Subject: [PATCH v2 0/3] ARM: meson: Use syscon/regmap for clock driver
Message-ID: <20181120235020.14812-1-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch series modifies the meson clock driver to use syscon/regmap
like the Linux kernel does. It is needed if we want to share the same
DTS files with the Linux kernel, as last changes in clock-controller
break U-Boot.

These patches also update all meson DTS files to last versions from
Linux kernel v4.19.

It was successfully tested on kvim, kvim2 and libretech-cc, both with
the old and new DTS files. I don't have any p212, nanopi-k2 nor odroid-c2
boards to test with. As kvim and libretech-cc boards share a lot with
p212 I don't expect any issue with that board, but if someone is able to
test on nanopo-k2 and odroid-c2 it could be great :-)

I opened this patch series as a RFC, as it's not a tricky part (for
me!) and pretty new to me, so any feedback are welcome and wanted!

Changes since v1:
- rebased on the "Amlogic Meson cleanup for AXG SoC support" patchset from Neil

Loic Devulder (3):
  ARM: meson: Add regmap support for clock driver
  ARM: meson: Enable syscon on all supported boards
  ARM: dts: meson: Update dts files from Linux v4.19

 arch/arm/dts/meson-gx.dtsi                    | 31 +++++++++++++----
 arch/arm/dts/meson-gxbb-nanopi-k2.dts         | 48 ++++++++++++++++++++++++++
 arch/arm/dts/meson-gxbb.dtsi                  | 14 ++++----
 arch/arm/dts/meson-gxl-mali.dtsi              |  2 +-
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |  5 +--
 arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  8 ++---
 arch/arm/dts/meson-gxl.dtsi                   | 26 ++++++--------
 arch/arm/dts/meson-gxm-khadas-vim2.dts        | 24 +++++++++++++
 configs/khadas-vim2_defconfig                 |  1 +
 configs/khadas-vim_defconfig                  |  1 +
 configs/libretech-cc_defconfig                |  1 +
 configs/nanopi-k2_defconfig                   |  1 +
 configs/odroid-c2_defconfig                   |  1 +
 configs/p212_defconfig                        |  1 +
 drivers/clk/clk_meson.c                       | 61 ++++++++++++++-------------
 15 files changed, 158 insertions(+), 67 deletions(-)

-- 
2.16.4
