From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 15 Mar 2017 20:33:43 +0100
Subject: [PATCH 1/5] mmc: meson-gx: switch irq name to DT node name
In-Reply-To: <f1f8dae2-e976-4d42-99dc-34d08cb3d628@gmail.com>
References: <f1f8dae2-e976-4d42-99dc-34d08cb3d628@gmail.com>
Message-ID: <d83833e9-8900-a108-faa9-8b6d58349651@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

So far it wasn't easy to check which interrupt belongs to which SD/eMMC
port (e.g. in /proc/interrupts) because the driver name was used as
description for all ports. Change this to the default which is the
device name (DT node name).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 62597638..f2d4486a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -758,7 +758,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
 					meson_mmc_irq_thread, IRQF_SHARED,
-					DRIVER_NAME, host);
+					NULL, host);
 	if (ret)
 		goto err_div_clk;
 
-- 
2.12.0
