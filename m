Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26127C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+BBk2I6Q4ozq7CCqVSpaEIJVUiPUOUhc5vmqn0TZyg=; b=Bk4T1rQ3CVbL2U
	EUr/F8ae6RxN9Pxo7QV7X+lxtLLfhWRYV7gDm4t5EJms/+BFD7gUto4AP8+7bL7syhm5Z/yo217vK
	+UUQdT+XH2dx1E6wDvTyHoi3pZTzJx7xKKvsIzgfR5QGuBBgXSlCrMGNaF+1lZ1N62wi9X0nWPgL/
	1SaQzWe2ioltEz0llU3GCOihSTekUhL5niygSJsZ0q0CpeyOeexRV2oB+2yxtqzhiRKFWZjRdEQis
	n9RHhvnCnoe9MtTQ/jEUliU2GOKmAeEKrHB0ZxNYzfwEkGYRD2q+IcqMKzWLAtRPxSFMWGiJoEK00
	az5bKMF0kKAzNLDH/o/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8c-0000000B8mt-3qkY;
	Wed, 10 Jul 2024 16:25:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8Y-0000000B8i7-1tN0
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4266f344091so18225915e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628745; x=1721233545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWAYmRVC1zdYp+5kEeD3DX2tiXmWy9shCUGw6lB/NDk=;
        b=K0JAoxmmpWQh4PMEF9oSchJ3EZhvKHt40iiGeS2/8FSKDIhLlpZWpj9BtDZOt/bPCc
         E9/5Zt+/LGMQsl/qewkBrb8mF89BZhtOgKXjAC4J0xWz8tzS6nnrRcDV0ZA/AxBHmF9J
         7bFucf8nAC1tJqadzUuojtAyouBEI07YK1CLxiq5moqonvqAKlODz130DrN5NyAc5MWa
         zGiCMMZ5CNVEgSNkxk0xPN0mFpk4X6KqRuZhSCAQETYgzYb5PCHp4LbfOOYr04elTEeb
         g6d4rTtd6xrb6ltSQGD2qnpqAHqdVgDnQ5qZwm7/6F9m5OiXI9ADrNFflGgGFAEtLL6K
         vGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628745; x=1721233545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWAYmRVC1zdYp+5kEeD3DX2tiXmWy9shCUGw6lB/NDk=;
        b=vbtCTld5QPf/hy7T5myeBIJtnzjhnm1LWb4iCxUfhnyQzaA83sbLRBx2SZIH+rzLpV
         XsRHnKhOUjenRkCx79Ag+ctU0YLAfJcgExeTtvgKwet4QDVTq4dw6fjZLKpFrn4wCYcy
         aJtMCKWZcyVVkue5RI+e8NksG088mbzpoAQjjVAYMHCOeqvTwVZlpM2BbD273JjikrYt
         lzg3PDires5VR7Q50ZSedOOV07OzOiGZq9AmNYfbMx/XIsrAmamv7qW1KxMB9VEdjQUD
         q+1I0mOm+8dGMwFmFJxo05GPQIlYIm2GutjiAHn1xJXAHIbs/2z4+ClAS9Jv7lLG21p5
         vHEg==
X-Forwarded-Encrypted: i=1; AJvYcCUZxcGOUA2MY4a9cMnlaK76bYKu/hzeNpZVjKEVLUGhvvYPC1CQL5YV1L168As8Y5pV4PsRPVALcQut1QIJ35WQsWLy5RbE780tQVfrJGh4ges=
X-Gm-Message-State: AOJu0YwYgzW1DUmb4eKSMX70Qcrvfmn8bIjLVLB+fUGz3RdAMgj2ikp0
	oj9JxTWA23RzWFyCxzSL0Jsb5OYs/fqsGrJkxTuIk71sSvXR+x8XHF+HjxHiAEE=
X-Google-Smtp-Source: AGHT+IGGZi85nj3MyP+JCseFqVZr7mDscU35q6/iFQCn7BlAqB5PjPfA1ynbuw3U8clnF3YPLAROIw==
X-Received: by 2002:a05:600c:4930:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-426708f1f07mr38446345e9.35.1720628744794;
        Wed, 10 Jul 2024 09:25:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 8/8] clk: amlogic: axg-audio: use the auxiliary reset driver
Date: Wed, 10 Jul 2024 18:25:17 +0200
Message-ID: <20240710162526.2341399-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092546_517914_C8D18B69 
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
on the auxiliary bus

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   1 +
 drivers/clk/meson/axg-audio.c | 109 +++-------------------------------
 2 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 78f648c9c97d..b1c0c3ba96c4 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,6 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
+	imply RESET_MESON
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..6e199e751856 100644
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
@@ -1648,84 +1650,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_sysclk_b_en,
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
@@ -1737,15 +1661,13 @@ struct audioclk_data {
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
@@ -1803,22 +1725,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
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
@@ -1837,8 +1748,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
@@ -1848,8 +1758,7 @@ static const struct audioclk_data sm1_audioclk_data = {
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
