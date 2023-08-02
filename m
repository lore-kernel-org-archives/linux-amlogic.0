Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29EDC001DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 03:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sT2yZEioEsewyQfqcCPON8nlO4st4blgfEFrbFjXH24=; b=2qn23cS0KHEk4K
	FAnTXNH2/GA2jwlg9NbXga0dZ+a++iH54rnlRvK+P4RkmRlTVieZ8lSFiVUlu5t0XC+hMoash0Z4P
	tZhxolGf+DmvWRoIlloLDJId5Y0oM5aDLzadvdj/7bLoOGdZnMYsop+ylV07NAT+e/SElPVUhzXZb
	IVxzJB4w0WxzG2lvsZey4/f7Vb1naXetxAZ2jncgvBMTU6hT+LWTKpj/kxc0Md4OzkZSi/CP3TMwZ
	erVJ1jFsnZsC1nnB2RRK/OgtjlhBlVFBYCz//445URcpEyzoIbqo1lxPI/q3d9MziVjsGJEJXy+wg
	Ck1ELAtXJeOlxQt0OWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bc-003sXD-1k;
	Wed, 02 Aug 2023 03:33:00 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bZ-003sUl-1w;
	Wed, 02 Aug 2023 03:32:58 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 2 Aug 2023
 11:32:29 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 2/4] watchdog: Add a new struct for Amlogic-GXBB driver
Date: Wed, 2 Aug 2023 11:32:20 +0800
Message-ID: <20230802033222.4024946-3-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_203257_636459_80896831 
X-CRM114-Status: GOOD (  13.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a new structure wdt_params to describe the watchdog difference
of different chips.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---

V1 -> V2: Rename rst_shift to rst and use the BIT() macro to build
          its initial value.

 drivers/watchdog/meson_gxbb_wdt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 35d80cb39856..18180d91543e 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -22,7 +22,6 @@
 
 #define GXBB_WDT_CTRL_CLKDIV_EN			BIT(25)
 #define GXBB_WDT_CTRL_CLK_EN			BIT(24)
-#define GXBB_WDT_CTRL_EE_RESET			BIT(21)
 #define GXBB_WDT_CTRL_EN			BIT(18)
 #define GXBB_WDT_CTRL_DIV_MASK			(BIT(18) - 1)
 
@@ -45,6 +44,10 @@ struct meson_gxbb_wdt {
 	struct clk *clk;
 };
 
+struct wdt_params {
+	u32 rst;
+};
+
 static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
@@ -140,8 +143,12 @@ static const struct dev_pm_ops meson_gxbb_wdt_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(meson_gxbb_wdt_suspend, meson_gxbb_wdt_resume)
 };
 
+static const struct wdt_params gxbb_params = {
+	.rst = BIT(21),
+};
+
 static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
-	 { .compatible = "amlogic,meson-gxbb-wdt", },
+	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
@@ -150,6 +157,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_gxbb_wdt *data;
+	struct wdt_params *params;
 	u32 ctrl_reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -164,6 +172,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return PTR_ERR(data->clk);
 
+	params = (struct wdt_params *)of_device_get_match_data(dev);
+
 	platform_set_drvdata(pdev, data);
 
 	data->wdt_dev.parent = dev;
@@ -191,7 +201,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	/* Setup with 1ms timebase */
 	ctrl_reg |= ((clk_get_rate(data->clk) / 1000) &
 			GXBB_WDT_CTRL_DIV_MASK) |
-			GXBB_WDT_CTRL_EE_RESET |
+			params->rst |
 			GXBB_WDT_CTRL_CLK_EN |
 			GXBB_WDT_CTRL_CLKDIV_EN;
 
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
