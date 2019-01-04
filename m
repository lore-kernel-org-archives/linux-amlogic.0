Return-Path: <SRS0=8QoF=PM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777DEC43387
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 14:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446B5206B6
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 14:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYVE9cJI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IrYsG6v4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 446B5206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KKP7uHom1bkGuGvTRq3K54jBisLb9djMTsrRL/vQK5w=; b=nYVE9cJIfXi+7z
	VFNFRUNbLJ2qEZRTS8egwncyB62eJURwn+NEJTCyCN8K1wax0zgVhSktAZ/ALO8OPchkBMT9RPKKs
	EN6k7BmLjEUwOZJkBbcAtbszfAe9UAMdPIqtSMzhF9AJJ4eM6awtIZLX7XMhLEK33MSkhNujRn8uP
	b63wGqzwFm6JUJX84hg614Ku2e+RlRHTbot9FWgH87SFb9L6nUlKpZe8erbyurNmnQ67+M4KUl/l2
	aqhdcMDcuDZysiqbWAH2BBNedTAli7g5NNOQrlOTSHzcIOFaJJa1tl3nzqR1Cmhaj8amQ+VLkGBDI
	bHoJ5rMKCCkX50tzuAPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfQiL-00029Z-Pz; Fri, 04 Jan 2019 14:44:45 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfQiH-000299-5M
 for linux-amlogic@lists.infradead.org; Fri, 04 Jan 2019 14:44:43 +0000
Received: by mail-ed1-x543.google.com with SMTP id d39so31962559edb.12
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jan 2019 06:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv04QqPECaxVM8Sw6KXSVOAbVxSEehcXLLlssHTSp+U=;
 b=IrYsG6v4q1eVCM0J+LdTIidEevSwbnB/uX9iq9JxMwEbBcGf29B+NCdhV76tfR7SuA
 1D8Uh+cBf4vJVfKxUFIorhfll1HpoMMv1xm9v7mkY6QJ0lGmpVZm1N1FepDldipMYtkK
 T6+C6hF+TJG3o6RNjPRdMpqBe0SiAOcSMhydLO0Zf7USP0NDwzgG2L9Jcfi+v6yg8oEl
 I3BVhnFnwADajMYn9xMu3igVtz81CaG3XvWTWzGtBUnqaoxusy3+3pxr4TilTi/kGVRh
 jqi5K15Bei43CRTX8OHKqlBxMN53cETAL7QCSdLrPexKrzEYx/luzjPf6HQ0WPoflzgp
 7bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv04QqPECaxVM8Sw6KXSVOAbVxSEehcXLLlssHTSp+U=;
 b=XxyookJ/3GQAecaBVDDJ17j3u8mJukc+uQBWbZGKvlBML43ySfDQwTi3m4nKuMUQK4
 2uW3hr5J5kxGTA4ZARAb8p3tVHdoT+l6m9/GLOaK/TE+Id4TwtmiXWqj4BroS7N2cAwQ
 JJi86EZ7htOAdZ9qozNu4D4g0RAcPbWp7XcXpm6ete5n6kpsUb3Ars7bJdEpHU5CN+QJ
 FNKlQsU5f11HYxsoJKMQ6hoDcEer7tJCVzxVeXiUoMuR6BOGwRnMcOzzMkQSmtGu5/so
 2pJ02H/OKaR6j+0Nf1u2VuIuPACNpgKsLF4BLvrrGd4GskjpAJZ4eCsjzzEh81D4cZDW
 17aA==
X-Gm-Message-State: AJcUukdMpt8FZFyDRuDJBs5C+wH4/K2d+oSGwQQVCTr/rqgDH9RUO7o6
 NbzyvBFLHWO9sGthO1ohDV1jzw==
X-Google-Smtp-Source: ALg8bN6hxRC2MNvb6FNxleu7u7AYFV8aW6Y74ByIAgkAEU0x2caYUQpmk69nkCWuBCpG8GsK+q6yNQ==
X-Received: by 2002:a17:906:48c2:: with SMTP id
 d2-v6mr2908066ejt.244.1546613078974; 
 Fri, 04 Jan 2019 06:44:38 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id f4sm23148840edb.21.2019.01.04.06.44.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Jan 2019 06:44:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	trini@konsulko.com
Subject: [PATCH u-boot] pinctrl: meson: add pinconf support
Date: Fri,  4 Jan 2019 15:44:34 +0100
Message-Id: <20190104144434.5672-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_064441_252651_2E528B12 
X-CRM114-Status: GOOD (  15.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: u-boot@lists.denx.de, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adding pinconf support is necessary to enable boot from SPI
without breaking the eMMC. When booting from SPI, the ROM code
leave pull downs on the eMMC pad.

We need to set pinconf provided in DT to solve this

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/Kconfig                 |   1 +
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c |  10 ++
 drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c  |  10 ++
 drivers/pinctrl/meson/pinctrl-meson.c         | 101 ++++++++++++++++--
 drivers/pinctrl/meson/pinctrl-meson.h         |   8 ++
 5 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index ee820a57a0e0..162642d7289b 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -2,6 +2,7 @@ if ARCH_MESON
 
 config PINCTRL_MESON
 	select PINCTRL_GENERIC
+	select PINCONF
 	bool
 
 config PINCTRL_MESON_GX_PMX
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index c82413d08f34..f9065723eea9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -93,6 +93,12 @@ static int meson_axg_pinmux_group_set(struct udevice *dev,
 	return 0;
 }
 
+const struct pinconf_param meson_axg_pinconf_params[] = {
+	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
+	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
+	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
+};
+
 const struct pinctrl_ops meson_axg_pinctrl_ops = {
 	.get_groups_count = meson_pinctrl_get_groups_count,
 	.get_group_name = meson_pinctrl_get_group_name,
@@ -100,6 +106,10 @@ const struct pinctrl_ops meson_axg_pinctrl_ops = {
 	.get_function_name = meson_pinmux_get_function_name,
 	.pinmux_group_set = meson_axg_pinmux_group_set,
 	.set_state = pinctrl_generic_set_state,
+	.pinconf_params = meson_axg_pinconf_params
+	.pinconf_num_params = ARRAY_SIZE(meson_axg_pinconf_params),
+	.pinconf_set = meson_pinconf_set,
+	.pinconf_group_set = meson_pinconf_group_set,
 };
 
 static int meson_axg_gpio_request(struct udevice *dev,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
index fc1538ea719e..cf72576b6ce2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
@@ -72,6 +72,12 @@ static int meson_gx_pinmux_group_set(struct udevice *dev,
 	return 0;
 }
 
+const struct pinconf_param meson_gx_pinconf_params[] = {
+	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
+	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
+	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
+};
+
 const struct pinctrl_ops meson_gx_pinctrl_ops = {
 	.get_groups_count = meson_pinctrl_get_groups_count,
 	.get_group_name = meson_pinctrl_get_group_name,
@@ -79,6 +85,10 @@ const struct pinctrl_ops meson_gx_pinctrl_ops = {
 	.get_function_name = meson_pinmux_get_function_name,
 	.pinmux_group_set = meson_gx_pinmux_group_set,
 	.set_state = pinctrl_generic_set_state,
+	.pinconf_params = meson_gx_pinconf_params,
+	.pinconf_num_params = ARRAY_SIZE(meson_gx_pinconf_params),
+	.pinconf_set = meson_pinconf_set,
+	.pinconf_group_set = meson_pinconf_group_set,
 };
 
 static const struct dm_gpio_ops meson_gx_gpio_ops = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index b539749752c8..fa3d78858a9e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -57,7 +57,7 @@ static int meson_gpio_calc_reg_and_bit(struct udevice *dev, unsigned int offset,
 				       enum meson_reg_type reg_type,
 				       unsigned int *reg, unsigned int *bit)
 {
-	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	struct meson_pinctrl *priv = dev_get_priv(dev);
 	struct meson_bank *bank = NULL;
 	struct meson_reg_desc *desc;
 	unsigned int pin;
@@ -89,7 +89,8 @@ int meson_gpio_get(struct udevice *dev, unsigned int offset)
 	unsigned int reg, bit;
 	int ret;
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_IN, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_IN, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
@@ -102,7 +103,8 @@ int meson_gpio_set(struct udevice *dev, unsigned int offset, int value)
 	unsigned int reg, bit;
 	int ret;
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_OUT, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
@@ -117,7 +119,8 @@ int meson_gpio_get_direction(struct udevice *dev, unsigned int offset)
 	unsigned int reg, bit, val;
 	int ret;
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
@@ -132,7 +135,8 @@ int meson_gpio_direction_input(struct udevice *dev, unsigned int offset)
 	unsigned int reg, bit;
 	int ret;
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
@@ -148,13 +152,15 @@ int meson_gpio_direction_output(struct udevice *dev,
 	unsigned int reg, bit;
 	int ret;
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
 	clrbits_le32(priv->reg_gpio + reg, BIT(bit));
 
-	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
+	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_OUT, &reg,
+					  &bit);
 	if (ret)
 		return ret;
 
@@ -163,6 +169,72 @@ int meson_gpio_direction_output(struct udevice *dev,
 	return 0;
 }
 
+static int meson_pinconf_bias_set(struct udevice *dev, unsigned int pin,
+				  unsigned int param)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev);
+	unsigned int offset = pin - priv->data->pin_base;
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_PULLEN, &reg, &bit);
+	if (ret)
+		return ret;
+
+	if (param == PIN_CONFIG_BIAS_DISABLE) {
+		clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), 0);
+		return 0;
+	}
+
+	/* othewise, enable the bias and select level */
+	clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), 1);
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_PULL, &reg, &bit);
+	if (ret)
+		return ret;
+
+	clrsetbits_le32(priv->reg_pull + reg, BIT(bit),
+			param == PIN_CONFIG_BIAS_PULL_UP);
+
+	return 0;
+}
+
+int meson_pinconf_set(struct udevice *dev, unsigned int pin,
+		      unsigned int param, unsigned int arg)
+{
+	int ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = meson_pinconf_bias_set(dev, pin, param);
+		break;
+
+	default:
+		dev_err(dev, "unsupported configuration parameter %u\n", param);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int meson_pinconf_group_set(struct udevice *dev,
+			    unsigned int group_selector,
+			    unsigned int param, unsigned int arg)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev);
+	struct meson_pmx_group *grp = &priv->data->groups[group_selector];
+	int i, ret;
+
+	for (i = 0; i < grp->num_pins; i++) {
+		ret = meson_pinconf_set(dev, grp->pins[i], param, arg);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int meson_gpio_probe(struct udevice *dev)
 {
 	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
@@ -240,6 +312,21 @@ int meson_pinctrl_probe(struct udevice *dev)
 		return -EINVAL;
 	}
 	priv->reg_gpio = (void __iomem *)addr;
+
+	addr = parse_address(gpio, "pull", na, ns);
+	if (addr == FDT_ADDR_T_NONE) {
+		debug("pull address not found\n");
+		return -EINVAL;
+	}
+	priv->reg_pull = (void __iomem *)addr;
+
+	addr = parse_address(gpio, "pull-enable", na, ns);
+	/* Use pull region if pull-enable one is not present */
+	if (addr == FDT_ADDR_T_NONE)
+		priv->reg_pullen = priv->reg_pull;
+	else
+		priv->reg_pullen = (void __iomem *)addr;
+
 	priv->data = (struct meson_pinctrl_data *)dev_get_driver_data(dev);
 
 	/* Lookup GPIO driver */
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index bdee721fc007..28085a7495d4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -39,6 +39,8 @@ struct meson_pinctrl {
 	struct meson_pinctrl_data *data;
 	void __iomem *reg_mux;
 	void __iomem *reg_gpio;
+	void __iomem *reg_pull;
+	void __iomem *reg_pullen;
 };
 
 /**
@@ -130,4 +132,10 @@ int meson_gpio_direction_output(struct udevice *dev, unsigned int offset,
 				int value);
 int meson_gpio_probe(struct udevice *dev);
 
+int meson_pinconf_set(struct udevice *dev, unsigned int pin,
+		      unsigned int param, unsigned int arg);
+int meson_pinconf_group_set(struct udevice *dev,
+			    unsigned int group_selector,
+			    unsigned int param, unsigned int arg);
+
 #endif /* __PINCTRL_MESON_H__ */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
