From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 25 Mar 2017 11:24:41 +0100
Subject: [PATCH v2 2/4] mmc: meson-gx: use per port interrupt names
In-Reply-To: <aae9e7c7-d8a2-72b1-22f7-f0ad513d4667@gmail.com>
References: <aae9e7c7-d8a2-72b1-22f7-f0ad513d4667@gmail.com>
Message-ID: <235bd63d-72aa-ac25-4a54-0b8ddd3fbc10@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

So far the driver name is used as interrupt description, therefore in
/proc/interrupts it's not possible to tell which interrupt belongs to
which port. Change this by switching to NULL what causes the default
(device name) to be used. In our case that's the DT node name.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index ab1f2d33..0a0f5008 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -734,7 +734,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
 					meson_mmc_irq_thread, IRQF_SHARED,
-					DRIVER_NAME, host);
+					NULL, host);
 	if (ret)
 		goto err_div_clk;
 
-- 
2.12.0
