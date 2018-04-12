From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Apr 2018 10:13:50 +0200
Subject: [PATCH] usb: dwc3-of-simple: fix error check of clk_get_bulk when
 disabled
Message-ID: <1523520830-13468-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The disabled clk API returns -ENOSYS unlike the reset API returning -ENOTSUPP.

Fixes: ca7fdc8b1267 ("usb: host: Add simple of glue driver for DWC3 USB Controllers integration")
Reported-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/host/dwc3-of-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/dwc3-of-simple.c b/drivers/usb/host/dwc3-of-simple.c
index 54a5f60..1f08208 100644
--- a/drivers/usb/host/dwc3-of-simple.c
+++ b/drivers/usb/host/dwc3-of-simple.c
@@ -50,7 +50,7 @@ static int dwc3_of_simple_clk_init(struct udevice *dev,
 	int ret;
 
 	ret = clk_get_bulk(dev, &simple->clks);
-	if (ret == -ENOTSUPP)
+	if (ret == -ENOSYS)
 		return 0;
 	if (ret)
 		return ret;
-- 
2.7.4
