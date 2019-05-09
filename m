Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06C2C04AB2
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13B1217F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="niu2yWSf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="M7g8Ekqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13B1217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zV0MRpnAkE2seGe1o22VrlE2JsrTu62c13XmkZDTvBI=; b=niu2yWSfmU/T8cjtVxnSJBQaCk
	P/vXHEfk2AwC/ixUOHZsRbWbynsvHlnommFfYLkbqBF7/TEDJHQEbUaWv/IZy8CJMD04yhW50HPwC
	CGUQb/b3/1ofRO6CvrR05hyEvL+M2mCP72JZXKZNziMklJq3jil03CE8Gh5wUr2V2KmxM9GemoHh3
	sUG8pLRTDqzRkcj0IqJb+4dddYTqYWOFp+WoPsv3k7idl2IGxcK/KEuZ5oCZIuqXmV+jJS15UIU3T
	kp++uMwTDdHZSuci4yV+sf4BXXMbUbMjDbgaTxiI3dVQb3eeCuLq8pDQ3IY8SB5uCOzbxPgnAweAd
	eEWYuskg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOlvJ-00065K-KE; Thu, 09 May 2019 16:29:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOlvE-0005xe-5D
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id w12so3959887wrp.2
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
 b=M7g8EkqmvRrEK7koH/I8Kj1kubFPWigS6HT0fcBopuqWq6SnSLdzjd+eubupKFJI4i
 YGDwcdR/5lRYsBsRlACF3H4pHAfoY7mphC1mMDkk881qa6DNjfbOy7jeIjvkLnZcWgxu
 K4L3MBFd4sXJTvkKtg3ODCpogtLmWYr7agApw9asekiBLNjRelZwGw6T6qxEvPnISFJ3
 OO/S+2US00AnP1F7w+N9wTTmLXYfza8zcGcHC0VJt3ikurVHGHm/EnRxNrXO7ELpoRvT
 WeV/R0GQ4ndrXz08DqgjUFzn6R/z1R9K7D0VdX8H23y+bhodq8+c6viI/xYUUktpfBf/
 1p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
 b=g1BsWzcSPbGjMaT73Px83XyPs/kmll8jbVj/gaEAqYZHqbOjXP5j1wCWFHY9K80keZ
 EeICdVWduYZ8WLo87VuWP04x1fFu4nIdvhTPZp2ckxZqpZ1fIw00RSt22MiWiTzYJVOP
 IAV6JgdZ017aqOvYtzhoi9hmBulTcMXed8HHvqI0LNQhVzvb8CnVmY+sdtAwDuBprD2G
 n3QGHxngPNzIDl9/nCJ8UaOWjCy8Je11lv5S1wsF2pwuEQO4IcjWL30hDcSJlRHUgmaL
 zURoAOpeUGBMbtWOF/wl4RPxDfv85aiRrq46EIfTBybT+0gJS5Cy3699oANK9opldVD2
 dung==
X-Gm-Message-State: APjAAAX8YFVIj+waLyXlJy6d3ZK33X0MU4RYGGE99v/kwV16yiztlQ6q
 qb2tkiQddnTs30HL5Efqm//t9Q==
X-Google-Smtp-Source: APXvYqxCuk1s27H8O/HjRxYrETBY3Dle2aP7hp3wHINxTaUhtWUEE3HBtL+EIIDnypQegrvcf8zy+g==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr3858823wrl.216.1557419366867; 
 Thu, 09 May 2019 09:29:26 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:26 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 4/6] pinctrl: meson: Rework enable/disable bias part
Date: Thu,  9 May 2019 18:29:18 +0200
Message-Id: <20190509162920.7054-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092928_407950_949A448A 
X-CRM114-Status: GOOD (  10.98  )
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
