Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6533C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BB12173B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKZsbzUn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0mH9YjY5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93BB12173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zV0MRpnAkE2seGe1o22VrlE2JsrTu62c13XmkZDTvBI=; b=MKZsbzUnhmKIMeAkLb8p0sGqe0
	Y5GxXLVeQkYSL3zN3uB6PXy1SQFXf5tc1c+pEgnLDfHK087o4a3Qwu6BSiRTUDZzG50du5ToR1Mkv
	Aiv2Ry7Naxu53fYStTwoOvrYs1Z/OcmFh0AUnm0KusAErBSJzg5MmxJzP3JZpUjhS2piwPoFWQMh2
	xfmSaG0Xw6QO+y3ErFa+xs/IkpHw9uBtJ4bekl8ca989eycZCBMrEAPR3NfaU5EqrgBBa4KudvmiJ
	oJclrfhLXtJRNZAu97RvVtWdDwv9YDkPlzS3GLyBpsoyc3U25gUvMVy7JewQJsqz0Bad1KSDkiV0g
	s9K4InRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0of-0002cy-M6; Fri, 10 May 2019 08:23:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0oW-0002P4-9M
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:23:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id 7so419101wmo.2
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
 b=0mH9YjY5pN4altS8m8esAKUXR8IjrVzuxHW1h+AtZQx1kLM9VnfJwqhePnEaJ3+tcQ
 LDsHRX5weQ9wgdfEnAhU2tnojIKrjQyaRKZBpIiIC/6QOSZxzPqq8AVQh0dQcOvopUCT
 MmZPZTadQtHXyNJpU2dKz9hO1m/Kuh7a06sz6g0BzBnVl2JndWzmNQFQgG3WHVB7bBAg
 chdGBxSgbo/1Nwsc6TAmltJjr2DtkcNk0bJl+qbmNHHzu6thGLT7IAxq+ahgEcy8qYHy
 LItGoR6khG+/yWSoyynqqrIjzgfYTQRuqO8gHCKgi8DfrNVIG1F0tbq1XgHLBAZJhHIV
 unFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
 b=J2egPjJ0UvmT4dFx/I5mMo14xSiI2scF3gudOLDGtgAYtnHcrDfz7RLSKQsiivWp14
 aE1eOMczbfl1RJ45p0PQmbzijJs1uzxgn/WFn/qZUL72wDu8L98wD2s+ZraDOmYcMzN5
 92XLQVWekBCL7gliwrAizpRuX7N89LLBz5YfHHIXeATolbJDCK+SEqbWWp34om3lMefl
 JftuXzjdJc8o1g3nSMiP4NNqBJxFBP+kGMKryn6l7A8lpnXG4CGxel+0RujyfnHGxWD5
 1YX7b71a2tDBgivh/F85TDV+vCBELrItJQ3DigT5qnwfFCDQIvyqpz8+EeoRq4D3Trs8
 gzwA==
X-Gm-Message-State: APjAAAWnJ492hF3JZugEIpcdYC9BvNvWoKp5DfN06Eycc4LVf7eUPiwT
 Uku9Fl1kB+LMyzv62q+hN65jPxq+/hc=
X-Google-Smtp-Source: APXvYqzH46oUYeeQfj80hmpJooPiNtx258oSc9+1YhNuanvgtlSfyRKNdwfzGIXGbohEiEHZM9Vyuw==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr6127281wmh.68.1557476610628;
 Fri, 10 May 2019 01:23:30 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 01:23:30 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v5 4/6] pinctrl: meson: Rework enable/disable bias part
Date: Fri, 10 May 2019 10:23:22 +0200
Message-Id: <20190510082324.21181-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_012332_440453_6EEB1AA5 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

rework bias enable/disable part to prepare drive-strength integration
no functional changes

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 85 +++++++++++++++------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..8ea5c1527064 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,62 +174,75 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
-static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
-			     unsigned long *configs, unsigned num_configs)
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
 {
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
-	enum pin_config_param param;
-	unsigned int reg, bit;
-	int i, ret;
+	unsigned int reg, bit = 0;
+	int ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
 	if (ret)
 		return ret;
 
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
+				     bool pull_up)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	if (pull_up)
+		val = BIT(bit);
+
+	ret = regmap_update_bits(pc->reg_pull, reg, BIT(bit), val);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
+			     unsigned long *configs, unsigned num_configs)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param;
+	int i, ret;
+
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
-					       &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_disable_bias(pc, pin);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), BIT(bit));
+			ret = meson_pinconf_enable_bias(pc, pin, true);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_enable_bias(pc, pin, false);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
