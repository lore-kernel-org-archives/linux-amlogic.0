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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348ACC28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10392212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M1zwH4ui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eywnowT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10392212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeAzXG8/bFVDRmsa9mmSfG13kf7MKvYCriIB55lR7q4=; b=M1zwH4uikfPOLQ
	wqso564YyPb8yW/UmhoA8MqyTeOBQ0Jn5uDjytxM/nr/BMQBGWAE5WHRqWdqqvvYd3ShCznbdW6yw
	BKmhEXCA9DUySLu1bSqxWIsCnYdolOMbbs6k4Mhp62vKaq/KDnNh7zf76LXjzcuSn46agOGwhbyAe
	k9I0K0LR7MRyhKIHNl1ugVgKmIQlIcTDAdbwKoXMoS/MmtIZUzuGtA9hdgJ418nPiQFlv4ayQtZgu
	9UJ47ilT0VBV6kr/1OlbOHmj0hAmT/xYIvNuVOmKCKYUvQ1pFuOGFXWxuRXJtetrSJN/99HBsUAgO
	QYyv2xNeG/0/QjvSbDLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfnA-0005E4-Fo; Sat, 08 Jun 2019 18:10:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjt-0000tO-09; Sat, 08 Jun 2019 18:06:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id w9so6231937wmd.1;
 Sat, 08 Jun 2019 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2ToPp43IDqJY9ruWYlbIAIk8rREDtHiEg0Zr2a3p3U=;
 b=eywnowT3FV8czlQzFI8M3KB61zx8ksV40JxyuUI2r0EVZJvHfST15EcsA3sliMrZqt
 MftDg+tCTBg1Ttq9RgZaQLBOYrdZC+h7/KpBFeHy+i4NpfluFC4NW7p2e7SaJ4aRcFw2
 CoOuaBKztBKR+/tFZdOsg1+V6AejWVG40dLV5QUvJiAad/ZL/jUauFyabADWZzPeSA6I
 Z1/oZCilwF9bkCEl4k2ywVy1KGL2x3IAUET8gmZDKZ0Eh8w8NT/JHQBnF+Rp7AkAcm5r
 Sd1BnAwBQQJW+pDMvHxGOASFKKBJDhzJPSYIkTx9kdVYKq0D162b64xeaih0ssDBJqoX
 kGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2ToPp43IDqJY9ruWYlbIAIk8rREDtHiEg0Zr2a3p3U=;
 b=JOYZHTqkUKWuA+nMSa7enKVuyZZ3YkJRffZ/HricHIn557j3EOc0BxLFUBKZBILq5s
 klc+ufNWSafHLza7kap+TPRKbhC684gGC3OdOkAf5HAp0VbivR2BmqpvtIVLihuIfDF3
 XbtktwC0mQsV78o14K6iQxXDsVlPh0Zp69+l/7a4SbhT/dNSj3mvS8L8iODxl11OricK
 Ty1Np/6knbySznHE5vCrH8/vBOmMeQ4zar8Pv9UR+kMlCl/WW2IHstW/mAi0+cfltiBS
 CqXzSBf/PRdDP+7Wlb080We/XUYHbZ53GyMxfPmTsBuOuw2wm1EzwhJ7lAmqSbP9Qv6H
 XOIA==
X-Gm-Message-State: APjAAAVwemHsgorPiTLh12vyEwIWV6gVFUSWI1YAxPE49AB1wqS2ECkg
 3NgbcNb380VqM5YFJu42okF9iFWr
X-Google-Smtp-Source: APXvYqzKbhVwCuFbTgMQsfzH5DhqyH4Vq7yYLlluv4xdq4kBEVhrp4ppQhvp/iNKP8GbfnN5So4iEQ==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr7436969wmd.33.1560017206430; 
 Sat, 08 Jun 2019 11:06:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 12/14] pwm: meson: don't cache struct pwm_state internally
Date: Sat,  8 Jun 2019 20:06:24 +0200
Message-Id: <20190608180626.30589-13-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110649_067267_9C44AD25 
X-CRM114-Status: GOOD (  12.66  )
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

The PWM core already caches the "current struct pwm_state" as the
"current state of the hardware registers" inside struct pwm_device.

Drop the struct pwm_state from struct meson_pwm_channel in favour of the
struct pwm_state in struct pwm_device. While here also drop any checks
based on the pwm_state because the PWM core already takes care of this.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 010212166d5d..900d362ec3c9 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -68,8 +68,6 @@ struct meson_pwm_channel {
 	unsigned int lo;
 	u8 pre_div;
 
-	struct pwm_state state;
-
 	struct clk *clk_parent;
 	struct clk_mux mux;
 	struct clk *clk;
@@ -127,8 +125,6 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 		return err;
 	}
 
-	chip->ops->get_state(chip, pwm, &channel->state);
-
 	return pwm_set_chip_data(pwm, channel);
 }
 
@@ -153,10 +149,6 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 	if (state->polarity == PWM_POLARITY_INVERSED)
 		duty = period - duty;
 
-	if (period == channel->state.period &&
-	    duty == channel->state.duty_cycle)
-		return 0;
-
 	fin_freq = clk_get_rate(channel->clk);
 	if (fin_freq == 0) {
 		dev_err(meson->chip.dev, "invalid source clock frequency\n");
@@ -253,7 +245,6 @@ static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   struct pwm_state *state)
 {
-	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	int err = 0;
 
@@ -262,26 +253,12 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (!state->enabled) {
 		meson_pwm_disable(meson, pwm);
-		channel->state.enabled = false;
-
-		return 0;
-	}
-
-	if (state->period != channel->state.period ||
-	    state->duty_cycle != channel->state.duty_cycle ||
-	    state->polarity != channel->state.polarity) {
+	} else {
 		err = meson_pwm_calc(meson, pwm, state);
 		if (err < 0)
 			return err;
 
-		channel->state.polarity = state->polarity;
-		channel->state.period = state->period;
-		channel->state.duty_cycle = state->duty_cycle;
-	}
-
-	if (state->enabled && !channel->state.enabled) {
 		meson_pwm_enable(meson, pwm);
-		channel->state.enabled = true;
 	}
 
 	return 0;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
