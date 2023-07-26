Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCEBC0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgmtlsVVU8T3wBFRn5nexXb4WjBEqFsLGjUCkHv8LUA=; b=OU7X1YYi23wPLc
	lm+ZMhGFyEYsap28MXjn6pACvQQuqmKuAit+BKdwHBtCsiVeA7VGF9gy7YSOW1x3XhqQ+NafXjkVK
	lPpUyoByw70s7s+8HBzIi/MQCMEb04BeYacOgi3AH9Iu7zlEkwiSORGzbSkTPGypLPr06Sbir2kDZ
	EBLafvxGLQaEJEg7ODTPF2giIVtTyv9qbSvc/piPaSrvqSfmXDlCOeOEmraSotyf+r86RXovqFpDl
	g2pFk/9mGpvSbiUj5McYxuSLaRPe4w8HvMIs280Nt+eFGmWKB73YGVZjvyEgv17Rjxqsx/9/H3Hbi
	ZnlBUon7cEHL+iBHhpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd7M-00AG3q-2W;
	Wed, 26 Jul 2023 11:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd7D-00AFyx-1H;
	Wed, 26 Jul 2023 11:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZYvZRTaa9HmNCnS39xZ6WqO7oa0qg3Khkbi5chaJiTY=; b=SehPZ+cxvgjOqvFb37ennXN7ZQ
	sUyBAIY+5KolZrUkASqP3JwTWpqhSlkFUpGo3NPdiwmMvUk1zCStn7M6lTEiqbm14bRwGYL0CHSdA
	1vsXCZwTF1IEhn26/+VLiIfHsOXm76lzZY5MLK85yGK/0qtmVqULpHQ6uJIlMGCBfaCudVVxs5tpY
	Nlf9qqmjhY/XcFXK1GbrjfaKpQaj4Ff4T67Cm+jpO+1pWJ3TjC0Bp1Vljf4P5jXOQWVLAXzj5utcj
	qWAOrpRyJP14ws8uiGDw4JYyL16ySMMFx6OklWLqrnNmWMo6M2+meHZszubfXLEkXcDbm5F/dKVst
	XfjWEKgg==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcbR-005pDe-29;
	Wed, 26 Jul 2023 11:22:51 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:08 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 2/4] watchdog: Add a new struct for Amlogic-GXBB driver
Date: Wed, 26 Jul 2023 19:21:44 +0800
Message-ID: <20230726112146.1127145-3-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_122249_889899_9946CFD5 
X-CRM114-Status: GOOD (  13.44  )
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
 drivers/watchdog/meson_gxbb_wdt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 35d80cb39856..a6c0d743b607 100644
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
+	u8 rst_shift;
+};
+
 static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
@@ -140,8 +143,12 @@ static const struct dev_pm_ops meson_gxbb_wdt_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(meson_gxbb_wdt_suspend, meson_gxbb_wdt_resume)
 };
 
+static const struct wdt_params gxbb_params = {
+	.rst_shift = 21,
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
+			BIT(params->rst_shift) |
 			GXBB_WDT_CTRL_CLK_EN |
 			GXBB_WDT_CTRL_CLKDIV_EN;
 
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
