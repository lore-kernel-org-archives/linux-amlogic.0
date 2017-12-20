From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 20 Dec 2017 20:15:03 +0100
Subject: [PATCH 1/2] soc: amlogic: meson-gx-pwrc-vpu: fix error on shutdown
 when domain is powered off
In-Reply-To: <943d2b32-86ad-d1d5-b798-12c3ae54a0fe@gmail.com>
References: <943d2b32-86ad-d1d5-b798-12c3ae54a0fe@gmail.com>
Message-ID: <315cd169-ca9e-badc-a27f-f43dffb62907@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

When operating the system headless headless, the domain is never
powered on, leaving the clocks disabled. The shutdown function then
tries to disable the already disabled clocks, resulting in errors.
Therefore call meson_gx_pwrc_vpu_power_off() only if domain is
powered on.
This patch fixes the described issue on my system (Odorid-C2).

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
