From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 21 Dec 2017 20:40:52 +0100
Subject: [PATCH 1/2] soc: amlogic: meson-gx-pwrc-vpu: don't print error
 message on probe deferral
In-Reply-To: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
References: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
Message-ID: <0ca085b2-0a0a-be51-2873-5f5a5ca2d2da@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The error message may be misleading in case of probe deferral
(happens on my Odroid-C2). Therefore don't print it in this case.

Fixes: 75fcb5ca4b46 "soc: amlogic: add Meson GX VPU Domains driver"
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 2bdeebc48..3adb2f2ec 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -184,7 +184,8 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 
 	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
 	if (IS_ERR(rstc)) {
-		dev_err(&pdev->dev, "failed to get reset lines\n");
+		if (PTR_ERR(rstc) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get reset lines\n");
 		return PTR_ERR(rstc);
 	}
 
-- 
2.15.1
