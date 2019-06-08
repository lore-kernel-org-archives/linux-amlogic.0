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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4738C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3366212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNyKX7IQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HYY27Tka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3366212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpvTwQ3lqm9RvsHZ54vwN85ue6PpztWnTRXC0M9wbMg=; b=TNyKX7IQ+lau8S
	GxoeWM3xnE0ONruAZCl8kyc2vic4t7WSnxe1espnIflhF9lpmHuvelyssXjOuQwmiEuFUzYSxHFB5
	/2uwm0VUylOc65EdlvRdXT6gruflqoZePrcpyKdIMeM5f8dBSZKs6FuH+JzbpmMmB3SVEn3gz96it
	Zzs8ZweifFOhDNsBORrNFa4Eb3JgRU3THPLBqOoOdSCMYoFmRQHX+QOEbdSl6cGIf6sTFUvEPnfJS
	fkV6rP1hftysHNpOE7xSSgzuYNHN2rjJgQPzCs968zlrA5+0YpenQs86sAj71I6Wi3e7NHYNzaARj
	9Rw2qIXQK/9xU8RuseEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfmB-00032G-7T; Sat, 08 Jun 2019 18:09:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjp-0000qU-Cw; Sat, 08 Jun 2019 18:06:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id w9so6231871wmd.1;
 Sat, 08 Jun 2019 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZO7qivBo434TSsVVa4YbzWhWwMZ6z2njZ7atSZyZUE=;
 b=HYY27Tka+Zve8oOw3M3LuURDsY4EXX8qUIvDs9nN77A6hMV7RdCJiqmMLzVYd24D9J
 NZ8KEuhugImjFpMm7IKgsJss/+2YogqQ42dMk1K5h+cxpN+5BjKguyQjRRdTnj1ywhnj
 x7wWEg0obaSdlV2gdVABueOS6ybEMlzo0clHpc+g7ePBVyE6/1Z3b67B7pHgvH8+EM3Y
 EzmvgWJuyTW02VMwmV19skNhqBH+K6mAW17IGIK0PuCQZVH8UobD84u5oEt2ypzgUoE/
 g0i+CfD3HBjY9u0FgqOJDWHlfS2GqDIWKD/m/IpXYxEApSvMYhGUekx+G6x7rb+jNK6/
 7/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZO7qivBo434TSsVVa4YbzWhWwMZ6z2njZ7atSZyZUE=;
 b=XPmm8H7uCfWRzkfmz+D6qX36HmSA93zLFTROMIf54jgrexn6vDj3M+iH/uKfdqorB1
 Qmn3hQpcIvmlh8Yt9fRJ4DWgN+7iVrEuEkhqstMJvrVh/4as8KIN51yDeWPqlX4PV5sW
 z4sHyb5MU2hJt2m9RJ7JYT1P5yXMR4OttPlUQGBJ2KUum1B95o3ppvCWCZ0RIdfmvhmh
 LSf+R7GLBU7a/aGUahCCll/Cs+mdZvj/BdW4EW/787rNNehShUq1yWsb89Nokq9khNSR
 4NZZ4kORBD2fGNjd0LEvwyS3Xe6KemUaT4NPNIlo+HOm1mc8v8XNCLDXsAmBmuc0Mm+p
 QgfQ==
X-Gm-Message-State: APjAAAV780yyIePTft84s/Qkzg2glhhw5tWwFV11sX51yN7nu8SG1VZ7
 iARxvRu0KaYdld0mEYngvXjUQrZD
X-Google-Smtp-Source: APXvYqy5gBo0+pcOVgy3Rvl4MUPwN7blfDUL7OIOL3mmZBtcEZnBu9vQTKJGfmXPerM5g/iu3ZkI5Q==
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr6173542wma.48.1560017203368; 
 Sat, 08 Jun 2019 11:06:43 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 09/14] pwm: meson: move pwm_set_chip_data() to
 meson_pwm_request()
Date: Sat,  8 Jun 2019 20:06:21 +0200
Message-Id: <20190608180626.30589-10-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110645_481254_64B9F852 
X-CRM114-Status: GOOD (  13.89  )
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

All existing PWM drivers (except pwm-meson and two other ones) call
pwm_set_chip_data() from their pwm_ops.request() callback. Now that we
can access the struct meson_pwm_channel from struct meson_pwm we can do
the same.

Move the call to pwm_set_chip_data() to meson_pwm_request() and drop the
custom meson_pwm_add_channels(). This makes the implementation
consistent with other drivers and makes it slightly more obvious
thatpwm_get_chip_data() cannot be used from pwm_ops.get_state() (because
that's called by the PWM core before pwm_ops.request()).

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index ac7e188155fd..27915d6475e3 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -98,12 +98,16 @@ static inline struct meson_pwm *to_meson_pwm(struct pwm_chip *chip)
 
 static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
-	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *channel;
 	struct device *dev = chip->dev;
 	int err;
 
-	if (!channel)
-		return -ENODEV;
+	channel = pwm_get_chip_data(pwm);
+	if (channel)
+		return 0;
+
+	channel = &meson->channels[pwm->hwpwm];
 
 	if (channel->clk_parent) {
 		err = clk_set_parent(channel->clk, channel->clk_parent);
@@ -124,7 +128,7 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 
 	chip->ops->get_state(chip, pwm, &channel->state);
 
-	return 0;
+	return pwm_set_chip_data(pwm, channel);
 }
 
 static void meson_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
@@ -460,14 +464,6 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 	return 0;
 }
 
-static void meson_pwm_add_channels(struct meson_pwm *meson)
-{
-	unsigned int i;
-
-	for (i = 0; i < meson->chip.npwm; i++)
-		pwm_set_chip_data(&meson->chip.pwms[i], &meson->channels[i]);
-}
-
 static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct meson_pwm *meson;
@@ -503,8 +499,6 @@ static int meson_pwm_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	meson_pwm_add_channels(meson);
-
 	platform_set_drvdata(pdev, meson);
 
 	return 0;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
