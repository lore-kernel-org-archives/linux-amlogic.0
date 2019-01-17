Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2F9C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD622054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQrVDvi2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YECdKmns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD622054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AxUEOFlhl7AzIhXBRWHKnPpTPndTJG8pnpu1hfDuiA=; b=CQrVDvi249yK6Q
	tdxOBF4WV/kttLisIRxalXJNiW6DTA+8bnjT3xx3ydK5HKqdb1Bg3X9/Rl43A0ipWy9/7ssePh4lI
	vQQ5rg+PU7C1+tMN7EXd/+fkoRRuJQKaUmJ/3R+VMTCf4wZfRJfLLV/1A+UZarLZpbe8ilS6fYz9g
	a8zd7UZ0MSLI0rS+LE2mVAstMVRW1hjhTZLwfg8GvrTG0cI0pk2oHoPb9z2VKrzfYfjnhhvD1aSPK
	SPDNTc3QBcUHM7GrNbQLL0KGUmh8bBmr71vqWHl6yfM/OefbkOYsK7eOnpI/yPEisAMcwt3ADNHS6
	uLniEy9426+/C4KwzGEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4pj-0004li-22; Thu, 17 Jan 2019 10:23:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4pd-0004gl-Gx
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:23:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so10408863wrr.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Tf+jWcbQvaP/wZHxbjP4tGEHKpoydocGjOeujE6LsY=;
 b=YECdKmnsLma30+5hkWrT0/AErkw+qY1sW+4PEBA5VOPC3jiyD4mfoO7JIHmc8iFBsC
 EtYlOtTc0y7kuXV5Yslhbp/mze3r5AzNYQYCo3oBHahOoaJHA9SuDD+KGTZprnVb7d1y
 gqOR7mOgTpyQmGXveaMybagkJaVIfxpwDvBx3+E8gyDREbSHSX5r3cfb6RJtSnwKI8z1
 D7fiXOrbVWV4H2+l6YnuwFg+mT41dt0DtBtpuFPD5GfjL4JgeWcLSFTV7mEeJiUs21GF
 K6qTTvMdfiG4gfmZsxMq4FknElK5Kt6pS5E3DoKjQYUs9tWhkLvCbfkc6DH2JoJeJ0Eo
 upoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Tf+jWcbQvaP/wZHxbjP4tGEHKpoydocGjOeujE6LsY=;
 b=tf24yWOYyK+WlOkYesV4yiR7D/XFCtqtGJPHzTkD/3CB97z+WLdwIEZYuBP+xlkSVL
 DqsRsA61DSOxu+wa2mgygXbm8nnuuE+p7ho+sa3Fe98NwL2sunWKdAZC4DdgCfrOSKkU
 MY3YX4d+Z/eMxgVrqPryo1EtpMZxjSVp6zjY7eBCt0VH9vShAQKY6RIKJrQLZdgz0/pR
 VY6hAEiVwYFRJRGrtR5Qllr9yIr6rc8X7sZq/tJSKg9EkOXUrrThDElQEsb95c+bpWyI
 qL0BtuPyykQtS1SgSRbODAH5z2pWQGunmHCWNYh2VNPYrg2gZUs7fAfRrOdfBMsiUkE8
 NGgA==
X-Gm-Message-State: AJcUukejSXh/ERL3GbnBisf5vNeykI0TBTmcg1cVGLWKw0c/i54oASRZ
 sKYwyp7cAuLn01QeqI9awgER9uglRp8=
X-Google-Smtp-Source: ALg8bN6gLhA6yd4aO0Nf1n+/DxbTHZN1epiKdGM4gxJ24u11pxa+cNjFrMswgsx6iwMKyyPVXfCrZw==
X-Received: by 2002:adf:9382:: with SMTP id 2mr11151661wrp.269.1547720607627; 
 Thu, 17 Jan 2019 02:23:27 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id u10sm66400530wrr.33.2019.01.17.02.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:23:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/3] pinctrl: meson: add optional region for drive strength
Date: Thu, 17 Jan 2019 11:23:15 +0100
Message-Id: <20190117102315.1833-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_022329_566805_C7CE4D6D 
X-CRM114-Status: GOOD (  11.57  )
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
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the G12a, there is a new 'region' to handle the drive-strength.
This is optional since the older do not have this.

Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 6 ++++++
 drivers/pinctrl/meson/pinctrl-meson.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index a4ae1ac5369e..96a4a72708e4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -507,6 +507,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 	if (IS_ERR(pc->reg_pullen))
 		pc->reg_pullen = pc->reg_pull;
 
+	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
+	if (IS_ERR(pc->reg_ds)) {
+		dev_dbg(pc->dev, "ds registers not found - skipping\n");
+		pc->reg_ds = NULL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index eff61ea1c67e..5eaab925f427 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -120,6 +120,7 @@ struct meson_pinctrl {
 	struct regmap *reg_pullen;
 	struct regmap *reg_pull;
 	struct regmap *reg_gpio;
+	struct regmap *reg_ds;
 	struct gpio_chip chip;
 	struct device_node *of_node;
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
