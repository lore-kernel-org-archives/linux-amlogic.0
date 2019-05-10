Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF08C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AF02173B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GOg1ybA/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PcnekScn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AF02173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FtVm1H4oleJdsnv8GeGjcvyI+/uXWzNCfCzUMRPJG4I=; b=GOg1ybA/8DUENespdMccb8/lGn
	LfDXSR9FrP/GTCqZZNRXTP/Yn8xYFW+rqfUkwlJjdcpzptxlIffG0UXkWFKBktoG0V99PcP4sInAX
	dcQ58wTmjoUhOoUBZN827GUlSt2oNSrBcNpteBULCZtjyDs49ViaYgAX+VHRN75nta2AgC7qwueJi
	SPrUyhwsg6kqCEotsIALPcflpfovOkxGT9K43/YWxtpjHkTcpbksTG86pQuBFHjVFf9t1bOrU8uLd
	m0iieBezEqYw7ffw64CYQyVON6NN1amStQecbmFTC8gx/XOf5p3SCgtmd7WC+qHaLK3+rIvUV5zVr
	c/W9KJmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0oj-0002ik-UZ; Fri, 10 May 2019 08:23:45 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0oX-0002QB-1r
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:23:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so6651449wro.10
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
 b=PcnekScnb36h1KOi6x2STEbqWgdloFg5tbrvRIM9S1Ia55AbG/P7mn8IR/xJzgdIP8
 yOvvUal0wpr1osdHlor69kQUdsIASssP76bNocQowTdDpdkeNU75atIJ1SRt3AbQkO11
 8KnE2GbIO3mf3HBFNfXU/VDiOyNs+oxa0VjOitiIKAFUG8CaoO3InLFdx+7RbOZ+GRJ4
 sAXp+fKZPurq0je7yGWBdNEy2U8RRZzZHe0XCHVIt+5GFxtXXoSKOT704r5hUHuR4alA
 M9F/5xQ3THRGEO4VwcT07cWBUeAyb4j+AACgMcIRiA56n6jtV5s4MbhhBPfUvLlSUNt7
 kZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
 b=IjkYOLPyPo1rtw/CLeR2k50midE1st3Dce55qDCuwepGYDj1Bh2HO1Vj/lV35snu4h
 Xaovv4twe7cch1YyZDst/W3Pvcqwj8ZxfzjrBz800XbwM2qmDbULnjmMTAOukc0ZI2Ux
 xzKjqTF+Qm22SgVIcsiBvfwyWWqWtTnY8h4RH2H+GH6UN5bee9X7avefX38wVzpss8eY
 5VyW2nxeN8dExlI5+KyELxummx3TIDciuK9T91O+PPSpiUycMle3BV6l7eD/SBLkScDr
 AuaJB32F+tSKXBm4c5rudtQc8X/RyHJBbxmWrDrtVdHp/YgLa9KnmRoNNL2YpNIr7OFy
 Dv8Q==
X-Gm-Message-State: APjAAAX38gc2IhY7F+s5sG2zVELgNG2WZUOuoGLOVrF8lW5m61phN+dw
 c3p7VuCxswf72Htfgd8VIkzO4Q==
X-Google-Smtp-Source: APXvYqzXtHdGnLnflP9dbQ8lmUVERHNxuyP/6ag3Cz0jeAm5yjR8xuOEEi5P7YNX9ZXMbXxPviiwWQ==
X-Received: by 2002:a5d:638c:: with SMTP id p12mr3802905wru.61.1557476611712; 
 Fri, 10 May 2019 01:23:31 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 01:23:31 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v5 5/6] pinctrl: meson: add support of drive-strength-microamp
Date: Fri, 10 May 2019 10:23:23 +0200
Message-Id: <20190510082324.21181-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_012333_182599_C26DECD1 
X-CRM114-Status: GOOD (  14.41  )
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

drive-strength-microamp is a new feature needed for G12A SoC.
the default DS setting after boot is usually 500uA and it is not enough for
many functions. We need to be able to set the drive strength to reliably
enable things like MMC, I2C, etc ...

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 99 +++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.h | 18 ++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 8ea5c1527064..33b4b141baac 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -220,11 +220,54 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	return 0;
 }
 
+static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
+					    unsigned int pin,
+					    u16 drive_strength_ua)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, ds_val;
+	int ret;
+
+	if (!pc->reg_ds) {
+		dev_err(pc->dev, "drive-strength not supported\n");
+		return -ENOTSUPP;
+	}
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	bit = bit << 1;
+
+	if (drive_strength_ua <= 500) {
+		ds_val = MESON_PINCONF_DRV_500UA;
+	} else if (drive_strength_ua <= 2500) {
+		ds_val = MESON_PINCONF_DRV_2500UA;
+	} else if (drive_strength_ua <= 3000) {
+		ds_val = MESON_PINCONF_DRV_3000UA;
+	} else if (drive_strength_ua <= 4000) {
+		ds_val = MESON_PINCONF_DRV_4000UA;
+	} else {
+		dev_warn_once(pc->dev,
+			      "pin %u: invalid drive-strength : %d , default to 4mA\n",
+			      pin, drive_strength_ua);
+		ds_val = MESON_PINCONF_DRV_4000UA;
+	}
+
+	ret = regmap_update_bits(pc->reg_ds, reg, 0x3 << bit, ds_val << bit);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param;
+	unsigned int drive_strength_ua;
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
@@ -246,6 +289,14 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			if (ret)
 				return ret;
 			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			drive_strength_ua =
+				pinconf_to_config_argument(configs[i]);
+			ret = meson_pinconf_set_drive_strength
+				(pc, pin, drive_strength_ua);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -ENOTSUPP;
 		}
@@ -288,12 +339,55 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	return conf;
 }
 
+static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
+					    unsigned int pin,
+					    u16 *drive_strength_ua)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit;
+	unsigned int val;
+	int ret;
+
+	if (!pc->reg_ds)
+		return -ENOTSUPP;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+
+	ret = regmap_read(pc->reg_ds, reg, &val);
+	if (ret)
+		return ret;
+
+	switch ((val >> bit) & 0x3) {
+	case MESON_PINCONF_DRV_500UA:
+		*drive_strength_ua = 500;
+		break;
+	case MESON_PINCONF_DRV_2500UA:
+		*drive_strength_ua = 2500;
+		break;
+	case MESON_PINCONF_DRV_3000UA:
+		*drive_strength_ua = 3000;
+		break;
+	case MESON_PINCONF_DRV_4000UA:
+		*drive_strength_ua = 4000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *config)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u16 arg;
+	int ret;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -304,6 +398,11 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		else
 			return -EINVAL;
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		ret = meson_pinconf_get_drive_strength(pc, pin, &arg);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 5eaab925f427..cd955fb7c2ce 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -71,9 +71,20 @@ enum meson_reg_type {
 	REG_DIR,
 	REG_OUT,
 	REG_IN,
+	REG_DS,
 	NUM_REG,
 };
 
+/**
+ * enum meson_pinconf_drv - value of drive-strength supported
+ */
+enum meson_pinconf_drv {
+	MESON_PINCONF_DRV_500UA,
+	MESON_PINCONF_DRV_2500UA,
+	MESON_PINCONF_DRV_3000UA,
+	MESON_PINCONF_DRV_4000UA,
+};
+
 /**
  * struct meson bank
  *
@@ -132,7 +143,8 @@ struct meson_pinctrl {
 		.num_groups = ARRAY_SIZE(fn ## _groups),		\
 	}
 
-#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib)	\
+#define BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib,     \
+		dsr, dsb)                                                      \
 	{								\
 		.name		= n,					\
 		.first		= f,					\
@@ -145,9 +157,13 @@ struct meson_pinctrl {
 			[REG_DIR]	= { dr, db },			\
 			[REG_OUT]	= { or, ob },			\
 			[REG_IN]	= { ir, ib },			\
+			[REG_DS]	= { dsr, dsb },			\
 		},							\
 	 }
 
+#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib) \
+	BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib, 0, 0)
+
 #define MESON_PIN(x) PINCTRL_PIN(x, #x)
 
 /* Common pmx functions */
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
