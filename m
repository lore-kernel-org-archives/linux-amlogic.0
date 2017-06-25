From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 25 Jun 2017 17:55:11 +0200
Subject: [PATCH 3/3] odroid-c2: enable GPIO
In-Reply-To: <20170625155511.28447-1-b.galvani@gmail.com>
References: <20170625155511.28447-1-b.galvani@gmail.com>
Message-ID: <20170625155511.28447-4-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

GPIOs are now supported on Meson GXBB, enable driver and command in
the config.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 configs/odroid-c2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 547cd52..cf06715 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -13,9 +13,11 @@ CONFIG_DEBUG_UART=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
 # CONFIG_CMD_FPGA is not set
+CONFIG_CMD_GPIO=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_DM_GPIO=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_DM_ETH=y
-- 
2.9.3
