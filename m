From: ldevulder@suse.de (Loic Devulder)
Date: Tue, 10 Jul 2018 10:01:06 +0200
Subject: [PATCH v4 0/2] Fix USB and enable ADC on Khadas VIM
Message-ID: <20180710080108.9976-1-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch series add power supply entry for P212 like meson-gx boards.
It also enable ADC support for Khadas VIM board.

Based on the Neil Armstrong's patches.

Note: it's my first (small!) patch for U-Boot,
I tried to add all needed and useful informations :-)

Changes since v3:
 - fix in Subject... sorry!

Changes since v2:
 - change commit message for DTS backport

Changes since v1:
 - remove duplicated lines in configs/khadas-vim_defconfig

Loic Devulder (2):
  ARM64: meson: Add 'usb2_phy0' in P212 DT file
  configs: Update Meson GX configs

 arch/arm/dts/meson-gxl-s905x-p212.dtsi | 7 ++++++++
 configs/khadas-vim_defconfig           | 3 +++
 2 files changed, 10 insertions(+)

-- 
2.13.7
