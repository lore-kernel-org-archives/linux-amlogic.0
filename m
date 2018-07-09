From: ldevulder@suse.de (Loic Devulder)
Date: Mon,  9 Jul 2018 16:45:51 +0200
Subject: [PATCH 0/2] Fix USB and enable ADC on Khadas VIM
Message-ID: <20180709144553.26161-1-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch series add power supply entry for P212 like meson-gx boards.
It also enable ADC support for Khadas VIM board.

Based on the Neil Armstrong's patches.

Note: it's my first (small!) patch for U-Boot,
I tried to add all needed and useful informations :-)

Loic Devulder (2):
  ARM64: meson: Add 'usb2_phy0' in P212 DT file
  configs: Update Meson GX configs

 arch/arm/dts/meson-gxl-s905x-p212.dtsi | 8 ++++++++
 configs/khadas-vim_defconfig           | 5 +++++
 2 files changed, 13 insertions(+)

-- 
2.13.7
