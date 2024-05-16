Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32111C25B78
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Y87dbjna/ehEwJhCrXn5lA+j8lJhpv72t72XDRficA=; b=ZH0ovJ+rY+55UN
	SPoQSdModG3cDTcfnNIrYfrG8+ggiCBSIKBE68nPwqZYPppipalwbRoPb3TcZSpGGjfuJFeLWmabD
	mo5S446g6dENSjUT182DlPuEq8qPtGTV9jcFHloIJrI+go2FJd44inJx5q4hvnUzfca5ivrPWJqcs
	ztDU4g5Avvx6iVvZMCvr7lQiu+JyCzt9tdG0VjyBWgOuDqKVeQDR7jyqV/rpnw4aFg+nrpXDDPrYW
	+8IkPurH55Jtfej9AokK3iM2gGgy4TmVNiKSN4ZQBZfXD0WviE+gwwteJ64T5jclDWhp99TcwhB4G
	V3uuPIqzOG/tP7hM+MrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjJ-00000005FzE-1Spn;
	Thu, 16 May 2024 15:09:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj3-00000005Fp7-29WD
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-420104e5336so34120525e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872135; x=1716476935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL5f80GGi83nhgomz2kgPXZIzOXSZK09LD8gHLnVu8c=;
        b=gi0vppS+PpDcoLqPvSBQrp4mTLY2t+7wFVgQD4/IxUj8GlhY0Ii3C8ZqSWbWNQpUC2
         AX03gCN8uAGT5jf8ue/eirrkVEcbvuJlqjXn+BXaZ0pA2h1Tb8l4M/UPFq7YF4zhQ1TR
         vOuKFwjUi+n7bDMvaGq+fwA9IqS1Q0VAGSKz+mOvR2YEp36HOcKs7/ZKd3kmacH8wj65
         dq5Ldron3YyUeXG/VIPMVUJBy8BzmUHVZ3tmZvv6q7SEVD0oqBIvGBzP7Kz9xper/Vg9
         N2qV+vnHt6VbG+At1NgLwtD0+iPe7zWfgA3Z+hswYShLrsXdE7eE1+QIgEskipMnFw33
         8sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872135; x=1716476935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL5f80GGi83nhgomz2kgPXZIzOXSZK09LD8gHLnVu8c=;
        b=TQfRbDaJxrBfW919qySEI5w6XhJI6414vxSgQHp7bsGMJRz7NH/oCpoDDocF9/os+k
         faLfTs4zqBl/TiDDsqDZz3HXRNoFSBcODRa4Ae2Z0gArOYOpqN0LxLn/pyoQkOnmptbf
         56aND3CjHkiJaJl9x4y9Q26OO8HcfWv7fGGLQ2DvNUiU1cEGCyffJJRh1UpCt7dwkw1d
         l2nHs2J2v0TohcIAgfk2dKwySBACv413c/JIM5Kgz/ERClUCsj3jv9O+l77ykMirQnVT
         GCEKBqxDbRSA9M4cy7MDZJL8WT5wUrc9OdJXDTdm0SKMiCmg9V0P7yENsSgqUobeyj0F
         IpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmrAUaCV5gy8mWZhSkOS8BXw5fp4oDZ5mTIw2ZQHWBX8JVjEwKD2CdMzkNJuZ0sho5Xg1orQU0Q8j0OjijvLqLBcPrcApmPyr4daT6hHyUhnI=
X-Gm-Message-State: AOJu0YyCcyFzmhbR8CMatJzCLICR/+h9x2WAXc2OlISqakd7nw8rw63D
	0djxfKKkCp4Xc5nVMYY8OlSmQsWgRNV7bqpWO0xyluzwqY8rbXgb9my1D7En+EI=
X-Google-Smtp-Source: AGHT+IF30UqBoIXs9icx2iDgiQ7TuYEvX0q0rV/70GCuE7s1xRKQ4Arx1HOxMSeUsJUlVOSEqHZT6Q==
X-Received: by 2002:a05:600c:358f:b0:420:29dd:84d4 with SMTP id 5b1f17b1804b1-42029dd885amr21620795e9.13.1715872135697;
        Thu, 16 May 2024 08:08:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 9/9] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Thu, 16 May 2024 17:08:39 +0200
Message-ID: <20240516150842.705844-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080858_725691_20711E60 
X-CRM114-Status: GOOD (  17.67  )
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
clock driver and migrate to the one provided by reset framework
on auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 108 +++-------------------------------
 2 files changed, 9 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 6905aa2f080c..b89e769a6362 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -110,6 +110,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_PHASE
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_CLK_RST_AUX
 	select REGMAP_MMIO
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 93e6a6d321be..dc9191a9ab0f 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -15,6 +15,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 
+#include "meson-clk-rst-aux.h"
 #include "meson-clkc-utils.h"
 #include "axg-audio.h"
 #include "clk-regmap.h"
@@ -1678,84 +1679,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
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
 static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,15 +1689,13 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
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
@@ -1832,22 +1753,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
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
+		ret = devm_meson_clk_rst_aux_register(dev, map, data->rst_drvname);
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return ret;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1866,8 +1776,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1877,8 +1786,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
+	.rst_drvname = "rst-sm1",
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
