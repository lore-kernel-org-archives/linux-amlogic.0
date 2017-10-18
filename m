From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 18 Oct 2017 10:02:09 +0200
Subject: [PATCH u-boot 0/3] Add Ethernet support for Amlogic P212 Reference
 board
Message-ID: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset aims to add support for the Internal RMII Ethernet PHY of the
Amlogic Meson GXL S905X SoC on the Amlogic P212 Reference board.

The Internal PHY needs a specific config then acts as a generic PHY.

Neil Armstrong (3):
  net: phy: Add Amlogic Meson GXL Internal PHY support
  arm: meson: Add supplementary ethernet registers definitions
  arm: amlogic: p212: Add support for Ethernet with Internal PHY

 arch/arm/include/asm/arch-meson/gxbb.h |  3 ++
 board/amlogic/p212/p212.c              | 39 ++++++++++++++++++++++-
 configs/p212_defconfig                 |  4 +++
 drivers/net/phy/Kconfig                |  3 ++
 drivers/net/phy/Makefile               |  1 +
 drivers/net/phy/meson-gxl.c            | 57 ++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy.c                  |  3 ++
 include/configs/p212.h                 |  2 ++
 include/phy.h                          |  1 +
 9 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/meson-gxl.c

-- 
2.7.4
