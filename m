Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE700C04AAE
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A3F206BF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 11:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R34stwiq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eVnhrsbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A3F206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7xcAIm/Vr2mxC+ov76Cl00YBO2rNJ2PXATEeLWB14Ss=; b=R34stwiqxPKx+f6I5XMCzIdHRL
	cPt/opCSAfBfPrWxRLX6RSab2XqH0DnttFnTyDaIAM4ntG89SL23QUmgQbwqD9JZBOhAHV2lsFa6R
	kx423E/tWQmO+A4r/9c53736W4MhL6zqMwdOT0fhSQoeEkeRn926UAlSH3CM8giIbIjYAa9H0HPPw
	S17qJRkE/zDNo0gjnS5ULi26KwmYex1jluhnpcZ7YjceFFMMz0iggCkL7RBeYMiqJ7DzU7Tq6CJom
	By5xPuqhH6xoGmMbI1n83JqHRoLYWS6C99NTuonaYRvJFxjZn89ODEWIdARU/D/YXvw/Md0oWO7Ny
	jqOIz8Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNyj4-0002mr-LQ; Tue, 07 May 2019 11:57:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNyj0-0002fK-BI
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 11:57:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id p21so20085921wmc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/Ryaw0CwF3TL07iEm7ZRTzsdOIYoEQ5xbLX69lpJF4M=;
 b=eVnhrsbD0eL9XxWgaC4xyCq3cICT92y5RNfh7j5ubwQ4rKvO2lpin4vROxI5x7x0/V
 LQ7N3YZAw55ojIg14I4t1OjfbqUv5YoN7mWIRoHIUsxy3l+8CB+adcnjf3BOFB9Rx4bK
 5B8lwt5+7NsdSpzDSYBxqJgrrxb6Ovt7grrBVN3Ct2dcvAgqPIKzzfNhaBOA38WywQcW
 Dqb0MAL751uovhqSYERs+EWp8L2RmC1GXWxYq/gRuFXJeU2x7AOm7Pr/Hy3SmhxR9U2l
 5X2SD9U9Y5LWYpIg+of1Qr5b0Oy7AnfCqkmkg+V+kmphYWFxBbd7w/HTaWVxKecUSFV4
 /79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/Ryaw0CwF3TL07iEm7ZRTzsdOIYoEQ5xbLX69lpJF4M=;
 b=RiKnbARF3z+4zH8sO/iJEQzGJegvpiguciW5Wcw77ChnVimNkNVRKQPOgj6YGD4XPW
 B+ItDj1ore45WDALxQ0hW5hZzgTJaI0G3i/Fw0Bs6VYDj2vxgF5N+ytmeTwh6cRbSj6W
 vzseu3I5MydkIbco1vhzoZdmGJaKxe65iKYmvX1Wp5weeL7D+0Z9+kyvdP4RsZvXHOUc
 99hsnBv7m3NkEhMYJhiKAx+G/e+mHvpQGxNYT3D0rF3riu8zl2dPp5Q99cfs4CHeZowf
 VQs/4tydvYfRHwa8w4l8thkc1QP49lRVCxfwUBvq1FC7fufFVTG2rK6/3knfmI1xRQbe
 k1Gw==
X-Gm-Message-State: APjAAAXqVttLRmzGvuDzgN+vdPakYFzIUzCSh0jRLePuyT5u9oQC0lwz
 +r/zsY446i7r3j2LbUMyX6g+1Q==
X-Google-Smtp-Source: APXvYqzEacsy89ALKCTymPo15I4g3w8N3ARKDejdEEc425gQlSCFtRO3sTNSphkl0j6dxmMWGolZjA==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr19644763wmc.131.1557230252671; 
 Tue, 07 May 2019 04:57:32 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:57:31 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
Date: Tue,  7 May 2019 13:57:24 +0200
Message-Id: <20190507115726.23714-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_045734_631559_2959FDCF 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

rework bias enable/disable part to prepare drive-strength integration

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..a216a7537564 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
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
 static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
 	enum pin_config_param param;
-	unsigned int reg, bit;
 	int i, ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
@@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 
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
+			ret = meson_pinconf_enable_bias(pc, pin, 1);
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
+			ret = meson_pinconf_enable_bias(pc, pin, 0);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
