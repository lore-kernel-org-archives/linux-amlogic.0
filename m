Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA05BC4360F
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 22:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8143E2082C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 22:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLoSqKGQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HTd5HhKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8143E2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7bL5hGZU2M3ZY6XUL36BrN4FLG+cbIM9ckauRD0X9s=; b=FLoSqKGQJ/BVpd
	C397Vn1er1c3k+oeaQ1OUxNKyxSjX9JEKCQV14WHar2j3HShg3DivFOsjH8aMW1GiU6MYfcXDUg+N
	1ZuCgveapOnf+xiuHaiLnLE3coSd33WIcFw9kX01c5MZi7WFDHpN6rWna/XfhtBI49RPqAl9rBHtC
	oimSKuaAXY3PHztQToga2iIw+lhwaFlzQuP76dWE+LZQo/6z0EOnarQTonI2BvswLSekl432wugGL
	4cVVPlvytl/njmlX7J19uBbdVLOA83P3Bku/3K251llyhaVgc2xyqndEORt/AN3XXMTpwVCeaa2lL
	cyMPSJ3qbqSfYG0vKFJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8BCV-0006by-8W; Sun, 24 Mar 2019 22:02:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8BCS-0006bH-4M; Sun, 24 Mar 2019 22:02:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id o25so6929387wmf.5;
 Sun, 24 Mar 2019 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91HdSPyf9HFmjS95lK9wkN7VvhcgvAMdo9F31XsmQH8=;
 b=HTd5HhKiLz2vyrvOe2BVSJF/wUqAdo9KpqjyisggpqkoGmv6W2wRxcYjHUpOZGBBnR
 iSqONn6Xa/c7rwGKVSLXS21NnbPmMprM0DkTkf7PA9gDn3eKkDs1N/1yshxvLsx/WWJe
 RSHXe0JoVMmq+WsAAPXm/UYD04EzaLa1dfYN2M82mlzew9sm0uBVqreMzjWuYjIyQl0m
 jMjNKOl946qcnWL7ODiqPtHd04jKKX4j/N0WRgDtS0M+2tWMIn/TRGd8XRlj0MvxOVj4
 EwaFqBC/CusuBKTLRAoOtGjtO213VHYYSlbhB5q4CSLnsk/svcOf1tx6rBgxtCYgGS7X
 QFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=91HdSPyf9HFmjS95lK9wkN7VvhcgvAMdo9F31XsmQH8=;
 b=VlpDgtU0//a8tRa/GwRaZgcMuvRqvYt+aDZF0H59K3Qhe2hUI993OxwWr7dyxNkcDL
 Oo0Y6MopeAJ9msCgQ9HycSgxcD4Q/t8BJtvh4myIirtIstiQuSNInMfu+0FT5EMHqB08
 ALIH2P00QJkA5n3aRrbMTJK2S3i9kDWE3J+aPGQXZs/WZq9FifuXhcOMXtnCIfhVpKGS
 bBQaY4ryXVZUIk9PbsC0othl/XSRyrAx4cE67RAnB8r9G2j6mZU8RcPsoK6V0c0rQ3eM
 hNd0jFBrV8CfXWNf6oa0da0vU+mFSnFgInhjGOhVsMJSGgU7t6l76ZUG3WKxP9px+azd
 kCfQ==
X-Gm-Message-State: APjAAAVHqOeRclNnygNDJHPrVG7LZVqLQQaxfu8dBGmd+ccqV9VQNqQG
 iHMc4FvzvhyzIwTprDahwH7aKcwv
X-Google-Smtp-Source: APXvYqwz0lpfo9Nvim+OlD497Z6RpuvSNAV/i6qOhXa7qv449Bb+sK/Ed7IgzYBvS+X/cvtUsUXGlw==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr3249653wmb.20.1553464956265; 
 Sun, 24 Mar 2019 15:02:36 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o13sm12743485wmc.20.2019.03.24.15.02.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 15:02:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] pwm: meson: use the spin-lock only to protect register
 modifications
Date: Sun, 24 Mar 2019 23:02:17 +0100
Message-Id: <20190324220217.15813-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_150240_195070_CE5C35FA 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Holding the spin-lock for all of the code in meson_pwm_apply() can
result in a "BUG: scheduling while atomic". This can happen because
clk_get_rate() (which is called from meson_pwm_calc()) may sleep.
Only hold the spin-lock when modifying registers to solve this.

The reason why we need a spin-lock in the driver is because the
REG_MISC_AB register is shared between the two channels provided by one
PWM controller. The only functions where REG_MISC_AB is modified are
meson_pwm_enable() and meson_pwm_disable() so the register reads/writes
in there need to be protected by the spin-lock.

The original code also used the spin-lock to protect the values in
struct meson_pwm_channel. This could be necessary if two consumers can
use the same PWM channel. However, PWM core doesn't allow this so we
don't need to protect the values in struct meson_pwm_channel with a
lock.

Fixes: 211ed630753d2f ("pwm: Add support for Meson PWM Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index c1ed641b3e26..2b03938039b6 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -235,6 +235,7 @@ static void meson_pwm_enable(struct meson_pwm *meson,
 {
 	u32 value, clk_shift, clk_enable, enable;
 	unsigned int offset;
+	unsigned long flags;
 
 	switch (id) {
 	case 0:
@@ -255,6 +256,8 @@ static void meson_pwm_enable(struct meson_pwm *meson,
 		return;
 	}
 
+	spin_lock_irqsave(&meson->lock, flags);
+
 	value = readl(meson->base + REG_MISC_AB);
 	value &= ~(MISC_CLK_DIV_MASK << clk_shift);
 	value |= channel->pre_div << clk_shift;
@@ -267,11 +270,14 @@ static void meson_pwm_enable(struct meson_pwm *meson,
 	value = readl(meson->base + REG_MISC_AB);
 	value |= enable;
 	writel(value, meson->base + REG_MISC_AB);
+
+	spin_unlock_irqrestore(&meson->lock, flags);
 }
 
 static void meson_pwm_disable(struct meson_pwm *meson, unsigned int id)
 {
 	u32 value, enable;
+	unsigned long flags;
 
 	switch (id) {
 	case 0:
@@ -286,9 +292,13 @@ static void meson_pwm_disable(struct meson_pwm *meson, unsigned int id)
 		return;
 	}
 
+	spin_lock_irqsave(&meson->lock, flags);
+
 	value = readl(meson->base + REG_MISC_AB);
 	value &= ~enable;
 	writel(value, meson->base + REG_MISC_AB);
+
+	spin_unlock_irqrestore(&meson->lock, flags);
 }
 
 static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -296,19 +306,16 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	struct meson_pwm *meson = to_meson_pwm(chip);
-	unsigned long flags;
 	int err = 0;
 
 	if (!state)
 		return -EINVAL;
 
-	spin_lock_irqsave(&meson->lock, flags);
-
 	if (!state->enabled) {
 		meson_pwm_disable(meson, pwm->hwpwm);
 		channel->state.enabled = false;
 
-		goto unlock;
+		return 0;
 	}
 
 	if (state->period != channel->state.period ||
@@ -329,7 +336,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		err = meson_pwm_calc(meson, channel, pwm->hwpwm,
 				     state->duty_cycle, state->period);
 		if (err < 0)
-			goto unlock;
+			return err;
 
 		channel->state.polarity = state->polarity;
 		channel->state.period = state->period;
@@ -341,9 +348,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		channel->state.enabled = true;
 	}
 
-unlock:
-	spin_unlock_irqrestore(&meson->lock, flags);
-	return err;
+	return 0;
 }
 
 static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
