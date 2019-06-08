Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA22C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C5C212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lT9vUASU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XOC6FG3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0C5C212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4mYlIvudC2/5Uor2su9hJEaveovUZt7QY2Brv+p4jk=; b=lT9vUASUCwr2FA
	iPO01AGpBZbmdMkuLFfhejSJCtS6X6JwoFe6fMEsKDq9d9AOoiHWmyEj9hHJOYoByC4bPLQPIrug9
	JKX/xB24ON97R8sqYWuPE44wr+2g4Ol9aSiSihEgQ1MbxH0Ww6vUBZwz8v4ONzkGJ8Ayp534L0yxR
	q+Qir3Bz7JU0xl8XcQJEp8YGbewCzzqksWAZEMMyavoRJ+whSYWl/JfyFHKvgPkVb3msvVxGWqDk5
	VjzkJKvWeVHuG0PIBP92AIdXwYYErBOVEBMc0APBi20l7quhl+6pTapyOwT0/8mHACN5PbS82vTuV
	NnRJ+Kfb/Bbpue3Qqx1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZflY-0002R6-Iy; Sat, 08 Jun 2019 18:08:32 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjn-0000om-9x; Sat, 08 Jun 2019 18:06:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id d18so5215748wrs.5;
 Sat, 08 Jun 2019 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2Kzd+gfP4FNDRd81CbW9jNNxdcKoqrgoqbenZAf8Uw=;
 b=XOC6FG3RL+XqM8IRylgcSr4c7yPG45c3Mfkp9EVn9AnzEbDjSC/LqzGfKlU7u+G1Oe
 D77RNYPyjHgGVLDchXgtmbkcBw07+e8Qj02XyS5lAiGJeNICL1BUF89eCiXxTHV37P0U
 LTf3vvrYNE1/YZ0TlbGuepZBJWRUcLuJoGiGjPlu9B/cCOUgwNDjU2fX5C2fv96/P/L9
 Qtidz3IHRMBBY9MgU+hoAJw0NAd4bzAL5qk6FnbXWCjoJnauoA/p3kmhbvfwNSUVZ6Wr
 1eTJ13jRPufn7jCSAmkfPWUyuOfR5tA7t+Py7FRQai3NjwHVAROvxUIrtEgWDgv5WhgY
 Yulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2Kzd+gfP4FNDRd81CbW9jNNxdcKoqrgoqbenZAf8Uw=;
 b=NDOxFpcBKCQwkcCK+2ZDwM1DMpuURgrv4cMuBmv1ye9gtTtgzUVLidcSbSIloTEzoj
 MDqZ1PBjquTkUUCgR7L+S4XLnw0EMkK+a+LWsIoX0DyjezgSMuIs/OW3aa5YgYsEl4Be
 rsviJMoOYJEgo2c1QYF0+7TtGfJjq+jAHndp0ovu30qRFGJhpAgyyXOKe5RpFctC9Lwp
 zV5Dgglnylleg9B1+8EzAWs2l3iwQizveRrnUK44eq8X7mEWNPFE6+Ys+85WVsCmtFoe
 okiOxAxKFjrIMzJb+YpkIp/VxsPqa/O9YPno2kJ6qH8mIfBmxCUsz14nEzX1AWINICEW
 grwg==
X-Gm-Message-State: APjAAAWSt+vWDBjBIaO+W5g3GOMRmdPjQnULwIYO1GFkY2aPXi9OM3UV
 8eAX6LF3TIFLtUgUcOvQ/8Zc6kte
X-Google-Smtp-Source: APXvYqzskCpgZHK48bBTIniJ6+KvBh8PtZJL6Yq+Y5wx77jNwRNxtRKXhTqO6wWBOspc2m0wd0b3Ug==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr14944740wrq.315.1560017201326; 
 Sat, 08 Jun 2019 11:06:41 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 07/14] pwm: meson: add the meson_pwm_channel data to struct
 meson_pwm
Date: Sat,  8 Jun 2019 20:06:19 +0200
Message-Id: <20190608180626.30589-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110643_383891_33BFF6CD 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Make struct meson_pwm_channel accessible from struct meson_pwm.

PWM core has a limitation: per-channel data can only be set after
pwmchip_add() is called. However, pwmchip_add() internally calls
pwm_ops.get_state(). If pwm_ops.get_state() needs access to the
per-channel data it has to obtain it from struct pwm_chip and struct
pwm_device's hwpwm information.

Add a struct meson_pwm_channel for each PWM channel to struct meson_pwm
so the pwm_ops.get_state() callback can be implemented as it needs
access to the clock from struct meson_pwm_channel.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index d6eb4d04d5c9..a4ae3587a3ce 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -37,6 +37,8 @@
 #define MISC_B_EN		BIT(1)
 #define MISC_A_EN		BIT(0)
 
+#define MESON_NUM_PWMS		2
+
 static const unsigned int mux_reg_shifts[] = {
 	MISC_A_CLK_SEL_SHIFT,
 	MISC_B_CLK_SEL_SHIFT
@@ -62,6 +64,7 @@ struct meson_pwm_data {
 struct meson_pwm {
 	struct pwm_chip chip;
 	const struct meson_pwm_data *data;
+	struct meson_pwm_channel channels[MESON_NUM_PWMS];
 	void __iomem *base;
 	/*
 	 * Protects register (write) access to the REG_MISC_AB register
@@ -435,8 +438,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 
-static int meson_pwm_init_channels(struct meson_pwm *meson,
-				   struct meson_pwm_channel *channels)
+static int meson_pwm_init_channels(struct meson_pwm *meson)
 {
 	struct device *dev = meson->chip.dev;
 	struct clk_init_data init;
@@ -445,7 +447,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 	int err;
 
 	for (i = 0; i < meson->chip.npwm; i++) {
-		struct meson_pwm_channel *channel = &channels[i];
+		struct meson_pwm_channel *channel = &meson->channels[i];
 
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
@@ -480,18 +482,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 	return 0;
 }
 
-static void meson_pwm_add_channels(struct meson_pwm *meson,
-				   struct meson_pwm_channel *channels)
+static void meson_pwm_add_channels(struct meson_pwm *meson)
 {
 	unsigned int i;
 
 	for (i = 0; i < meson->chip.npwm; i++)
-		pwm_set_chip_data(&meson->chip.pwms[i], &channels[i]);
+		pwm_set_chip_data(&meson->chip.pwms[i], &meson->channels[i]);
 }
 
 static int meson_pwm_probe(struct platform_device *pdev)
 {
-	struct meson_pwm_channel *channels;
 	struct meson_pwm *meson;
 	struct resource *regs;
 	int err;
@@ -509,18 +509,13 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	meson->chip.dev = &pdev->dev;
 	meson->chip.ops = &meson_pwm_ops;
 	meson->chip.base = -1;
-	meson->chip.npwm = 2;
+	meson->chip.npwm = MESON_NUM_PWMS;
 	meson->chip.of_xlate = of_pwm_xlate_with_flags;
 	meson->chip.of_pwm_n_cells = 3;
 
 	meson->data = of_device_get_match_data(&pdev->dev);
 
-	channels = devm_kcalloc(&pdev->dev, meson->chip.npwm,
-				sizeof(*channels), GFP_KERNEL);
-	if (!channels)
-		return -ENOMEM;
-
-	err = meson_pwm_init_channels(meson, channels);
+	err = meson_pwm_init_channels(meson);
 	if (err < 0)
 		return err;
 
@@ -530,7 +525,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	meson_pwm_add_channels(meson, channels);
+	meson_pwm_add_channels(meson);
 
 	platform_set_drvdata(pdev, meson);
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
