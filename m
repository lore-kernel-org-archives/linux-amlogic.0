Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB221C3DA5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+cZMY4XslIl4ys4NsoJt0QUsZxDTNK9h188+k6h5vo=; b=HD+NGyaK/+EDsC
	sI3WIpKarz+wNWdwk74YAAXDQ/2MrcpMCGBEbnzSO8n6lRXHESuaURt+2ngzdzLCBH/1AAJJv6G7+
	Uocp5QtVOJXkc1doXKiLdFKJF0C5VxucDfx5TD+hhnxmxCV31L64owsQpJCCi4vQERfxK9rZXKzf6
	13qLFChBcBAX/e8oRy02kAy81AcpyQ/dOtL7YpbdZrSz5FbLk3yd7YhybxjshAAwDNzUsJE8I/KjI
	0Woho+BGS41kK2ED50VcaDxMrO4UoUL1PhkHtt0agTMgp/a17vt2FcuRNg5ROX6NXNOcmxHn+KtWF
	M+eZtJNGhQhQLOQ7+kVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkF0-00000002IrU-4AOY;
	Fri, 19 Jul 2024 09:49:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkEy-00000002Iqf-23jr
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:49:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-426636ef8c9so10018345e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721382567; x=1721987367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zq2RQGZuDy6qYpeBCpDDmOGgnGZyyaD1WUEcAiHg4k0=;
        b=fCHr3AuEiUry9lNVRlqcPWC9rUB5EZknC2GCOl7EdvJaUR49n34yMEb6ciPxPq/uwo
         TuZfIZJjxQJOova8NgslNVwiLETa1hShmm3MIrV0T22JZOfbh/BtcxXqHEegp1I7d2zH
         V4N5Mip2jkPaH2LmpDDhtxn6tUlZVrOGDfEb126LwOophfsciymwIUBoBdJT/ycSYT6C
         sQugxM0SvixozUeL6pWWV8eLKl6YnMqQM+7s0DctuvgTCOLtrJW7z1EBBUNoR9ETqyA2
         qGZlRWUSH2gmqVBETLGFeVLdnw1YWFOU3QnXGEcNTGKv5B7zTlaFBhRFcuG+mE941H4e
         YdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382567; x=1721987367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq2RQGZuDy6qYpeBCpDDmOGgnGZyyaD1WUEcAiHg4k0=;
        b=aQD5C24r60hgBt6vWfDVa6mOrUxTtHA2CCgD7vRIADKomxfKpPwmtrZWsIoM01yzPN
         qs/xPCvavBNIcMRohIuawYL4v9FuNLNdlMGKo3su+DM04bevDmeZx71HB+AocY+sr4Sr
         muIUUtWWwFKcIWW3O4n/vyUJMJf3xpOQWj0IDzikBeSsNPMzgVlKY9utt0D18mTogSko
         oLBT0leqJyv8QwBjNdj40v2v0ldMl4uYUTeVlmZ3jPdX06TtDwcV7K1moIb3ZY0pjNRE
         wo23JIimE7GrgbvB75f216KrPzWvD6LJL1h6cvoHgjMLcEMWfIUGqegHUYoRWKyRQiyY
         FQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzd8ZJ7TFwCD/UM5JFjiTUpWLdX0eFK8/siciJq1y77LyEMs63mcddTCCsdWqM2ROhW06oaMC68JquXSdz7wWxfcc9vIfa5FiLLHDQmSuqKNo=
X-Gm-Message-State: AOJu0YzCqslijMblD0UW/v4Ryhd+hz+5IoXv8vGLkBFksc/Pf/ZDu75n
	ImnFMgOXNjuc2eVsJaWQ2egMLWo2AURMO03+K3vBoJnaRlr3YgxJU/u8jQROjVs=
X-Google-Smtp-Source: AGHT+IGRKBl1lSL0UQrFZiYoZM+nJVDbvxjGEQmi1be9dpn1ik4Ql/UT3k5rut4+VYEiE0/gmd6RDw==
X-Received: by 2002:a5d:58cf:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36831745e31mr5263732f8f.56.1721382566978;
        Fri, 19 Jul 2024 02:49:26 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-368786848basm1140202f8f.15.2024.07.19.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:49:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Fri, 19 Jul 2024 11:49:07 +0200
Message-ID: <20240719094910.3986450-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_024928_562287_BB7160AE 
X-CRM114-Status: GOOD (  18.16  )
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

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by the reset framework
on the auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Note: This depends on the amlogic auxiliary reset patchset.
V2 of the patchset is available here [1]. A v3 will be sent
but it does not affect this change.

[1]: https://lore.kernel.org/linux-clk/20240718095755.3511992-1-jbrunet@baylibre.com

 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 109 +++-------------------------------
 2 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 78f648c9c97d..7cb21fc223b0 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,6 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index beda86349389..9887ac8b51cf 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -15,6 +15,8 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 
+#include <soc/amlogic/meson-auxiliary-reset.h>
+
 #include "meson-clkc-utils.h"
 #include "axg-audio.h"
 #include "clk-regmap.h"
@@ -1678,84 +1680,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_earcrx_dmac_clk,
 };
 
-struct axg_audio_reset_data {
-	struct reset_controller_dev rstc;
-	struct regmap *map;
-	unsigned int offset;
-};
-
-static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
-					unsigned long id,
-					unsigned int *reg,
-					unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(rst->map);
-
-	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
-	*reg += rst->offset;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
-				unsigned long id, bool assert)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_update_bits(rst->map, offset, BIT(bit),
-			assert ? BIT(bit) : 0);
-
-	return 0;
-}
-
-static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int val, offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_read(rst->map, offset, &val);
-
-	return !!(val & BIT(bit));
-}
-
-static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, true);
-}
-
-static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, false);
-}
-
-static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	int ret;
-
-	ret = axg_audio_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return axg_audio_reset_deassert(rcdev, id);
-}
-
-static const struct reset_control_ops axg_audio_rstc_ops = {
-	.assert = axg_audio_reset_assert,
-	.deassert = axg_audio_reset_deassert,
-	.reset = axg_audio_reset_toggle,
-	.status = axg_audio_reset_status,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,16 +1690,14 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
 	unsigned int max_register;
+	const char *rst_drvname;
 };
 
 static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
-	struct axg_audio_reset_data *rst;
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
@@ -1834,22 +1756,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Stop here if there is no reset */
-	if (!data->reset_num)
-		return 0;
-
-	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
-	if (!rst)
-		return -ENOMEM;
-
-	rst->map = map;
-	rst->offset = data->reset_offset;
-	rst->rstc.nr_resets = data->reset_num;
-	rst->rstc.ops = &axg_audio_rstc_ops;
-	rst->rstc.of_node = dev->of_node;
-	rst->rstc.owner = THIS_MODULE;
+	/* Register auxiliary reset driver when applicable */
+	if (data->rst_drvname)
+		ret = devm_meson_rst_aux_register(dev, map, data->rst_drvname);
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return ret;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1869,9 +1780,8 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1881,9 +1791,8 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
 	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
+	.rst_drvname = "rst-sm1",
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
