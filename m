Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7676C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A45206E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOwb7WlW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TGB+JGND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A45206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSiJd2Yju2f7tS9dubOF4o3FuQlirUn5CaJL4IgMIlE=; b=bOwb7WlWKQ2uet
	mdfwbUg0NYnKaESEnzs+4rUCnJIrV2UNVp5IkFt7W7KlxHWG85UO1nW9+0jENfdBvyECOtK+2Lcid
	vrDqFDPoCscVJrg/ZS6o6vprPOMkkOuswxNsc3JpQNFwYkXFRxF9UOMXC1TgR+TZupl/rkmPeny2Y
	POjyHElGuIuBzSu5Vj5fh/70edgrGbPQLK5HGt7hfjls7TX1+fXdZ3VdzHg/kohNHdOcCaAI8pQwi
	mwjqiMWQhtLILHYbuZ8/fzkbz7jNgwxIyGR08UdeB2bN6G/A4kaQU8xw4MbEaxJrRvANRA5a8u8WV
	ySNnZzRxdvGLMQAE/r/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9Tf-00028v-E6; Wed, 12 Jun 2019 20:04:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PN-0005Oh-KT; Wed, 12 Jun 2019 19:59:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so7755596wma.4;
 Wed, 12 Jun 2019 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLy7MuNNW7ZLGj2GLiOb+ot6OCmiebBg8TF4amKVb/w=;
 b=TGB+JGNDKNqhzbggSZ0+62hx471mt0iNXoEb9V46P1WPYT2PTURINF3pQrUmVHZ0hM
 t4UgW199o7Tdq7FWC2Qkw6s5T2mEmS5SGqr6efsqME9Xa/7HQ33rnVFcPtQmoPr1nAZt
 FHobdnn5yq1EFpmxTLoHoKBT7gXzsP0BXWBwGX7vgftqJgViLCFZUX3VtQXlnQK9pKTO
 jicD8mSNxUsh8LGULZKSHY7iZAmygk9onDkMPvfWm3p80e9mxXmb7kB57bTSAtfpqJR6
 YwM/duwTlk8KsmHvX+3384kgb8tik7oCTyyf8jekjf+2rjc1l+quLzmwEwZRNo0QF9SN
 hIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLy7MuNNW7ZLGj2GLiOb+ot6OCmiebBg8TF4amKVb/w=;
 b=ETStVwdcwmC/ZVC+aNRywi9LkosxTcrj/ZJ1EPcifnhaTjhytyF8hw5CGuaVHlrAyn
 Lv02k9RqC23BOVe1egcdN+AfGtX/MoNBBvGvzbwf2bDCw/uH1q6dW6CDR6vV8cYllgGs
 ypqygzxc9f2Q0U0EVWBxunfiDTOk1P4OOOrBbh62zLfFDqgPanaAc9hPZaBY7aolWJ7a
 8WgNp84wY9DhadAwuYdNggpB/KgWMjChKtvZdMy3En9Ji+g87ARY0vWyvsdGXz2d5Sg2
 UiNTGGJe9VwS0+WQZiDfHu9P5kYZpfPMgDLei5Ljex5rEjrz314Jl/d96vIrTOIy6tCU
 NcOA==
X-Gm-Message-State: APjAAAUy++lYGck0kbCkUQbh/xjZQyWpBwf0C3FDPhA7ci2MmOwmCmIM
 olqBru2MzmlqFj03Pjgq1eFgLI6f
X-Google-Smtp-Source: APXvYqw2DhiiYjSAa1cfWXxQ/DMMAcmz5W+waI3fkKgc2wp5Bsn4Qbqb7vj0emhQduFyIQIGuCx/ag==
X-Received: by 2002:a1c:7a15:: with SMTP id v21mr633916wmc.82.1560369583959;
 Wed, 12 Jun 2019 12:59:43 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:43 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 12/14] pwm: meson: don't cache struct pwm_state internally
Date: Wed, 12 Jun 2019 21:59:09 +0200
Message-Id: <20190612195911.4442-13-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125945_698128_15955A6D 
X-CRM114-Status: GOOD (  12.68  )
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
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
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

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
