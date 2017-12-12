From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 12 Dec 2017 14:23:39 +0100
Subject: [PATCH u-boot] ARM: arch-meson: fix writel arguments order
Message-ID: <1513085019-8071-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Using writel causes a "Synchronous Abort". Invert the arguments.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Thanks Hans for finding this stupid error !

Neil

diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
index 2debe93..8c6577b 100644
--- a/arch/arm/mach-meson/eth.c
+++ b/arch/arm/mach-meson/eth.c
@@ -38,8 +38,8 @@ void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
 		/* Use GXL RMII Internal PHY */
 		if (IS_ENABLED(CONFIG_MESON_GXL) &&
 		    (flags & MESON_GXL_USE_INTERNAL_RMII_PHY)) {
-			writel(GXBB_ETH_REG_2, 0x10110181);
-			writel(GXBB_ETH_REG_3, 0xe40908ff);
+			writel(0x10110181, GXBB_ETH_REG_2);
+			writel(0xe40908ff, GXBB_ETH_REG_3);
 		}
 
 		break;
-- 
2.7.4
