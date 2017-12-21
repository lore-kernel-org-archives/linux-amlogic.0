From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 21 Dec 2017 20:41:02 +0100
Subject: [PATCH 2/2] soc: amlogic: meson-gx-pwrc-vpu: fix error on shutdown
 when domain is powered off
In-Reply-To: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
References: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
Message-ID: <c925832c-2420-10f4-4510-a236384181de@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

When operating the system headless headless, the domain is never
powered on, leaving the clocks disabled. The shutdown function then
tries to disable the already disabled clocks, resulting in errors.
Therefore call meson_gx_pwrc_vpu_power_off() only if domain is
powered on.
This patch fixes the described issue on my system (Odorid-C2).

Fixes: 339cd0ea0822 "soc: amlogic: meson-gx-pwrc-vpu: fix power-off when powered by bootloader"
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 3adb2f2ec..6289965c4 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -225,7 +225,11 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 
 static void meson_gx_pwrc_vpu_shutdown(struct platform_device *pdev)
 {
-	meson_gx_pwrc_vpu_power_off(&vpu_hdmi_pd.genpd);
+	bool powered_off;
+
+	powered_off = meson_gx_pwrc_vpu_get_power(&vpu_hdmi_pd);
+	if (!powered_off)
+		meson_gx_pwrc_vpu_power_off(&vpu_hdmi_pd.genpd);
 }
 
 static const struct of_device_id meson_gx_pwrc_vpu_match_table[] = {
-- 
2.15.1
