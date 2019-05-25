Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CAEC07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B662085A
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MObuQ8IJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NLjJV2J0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B662085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKKyZDrzjVPsNny+yB+Up5kIjLxKa4aqNSWW0Kdm7Ss=; b=MObuQ8IJbV/JGE
	EpFg113PEg0aMtCp9s+75nrHHJVC/orUR36fBOkq/MPiw+opeLqIXmpmMxPXZwwCaftpAvcFDeNEa
	5fPRnB/TNJkSv72omf0JiY9b4roIgnGjLXNSUhIoN2ZgBW6dB88lwTfz3eiSkYSLSXbve5nugbxN/
	aPfsPj24d0e4/gYFzVORGwv5ZSDNa23If0q2GuqVr6JDJbWmcXbrHwf720f1g/nvC01blQ3Q96hyI
	AQ6Vuy0zjRsDBSjBD5SuhY1OF0bcGx9appqBXqGJpgtD81biNvK/x2wla5NqcsOztLAi3XRgy0tbk
	mOj0YT8odvWjuBqp1Aug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbG0-0008Vz-6H; Sat, 25 May 2019 18:19:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUb9C-0002QH-Gs; Sat, 25 May 2019 18:12:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id v22so4816629wml.1;
 Sat, 25 May 2019 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGmx4EPee47ZcnAwDDemernEH2nzHCt+ROW/DzQRqH4=;
 b=NLjJV2J0js50+wwDSBN8P3m7XcjsHo8yqeLMaiBAwg5FW+Up2vKGQV0dKoyFT4UXAa
 siH1WlwloOBvqzH32foCJ/epwz61M5yX6TLfRv9o615KmxHQ8Xw5rc2ahEciTImkGFjr
 LGHIieMVbRQiw5h4qWM584X8DuCqJfd/ySn30BOGD1vRgoDN1Ophe9fAzHmhtQNo/nil
 8FD4TUn/ZtIJXhl3gy1GmdxJvD95z2y+n+Y/js4E8+GIETsqZFLnH6ejlAZRiJ8oNYXu
 12t/vknGV4hM0IXIjVnSj0T+Pk9cWjjbxtUILt04A0FLFTD9tR6asqRlaPPHiHr1N2Gj
 iKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGmx4EPee47ZcnAwDDemernEH2nzHCt+ROW/DzQRqH4=;
 b=V0xDNd0NdxaPG7XjgxwUblZeNK2THMFFv2XFzVGB5FBZbzQkNc7Qli0XE/dD3ar6s9
 O8+d2qnSqJ4LcYyW5PE/Ni7cuF7YGuX+A0ISszwmF0wu+h4j1TTt0X14xSQBKREEyAva
 kGg/JZnuh6wvR88oBEpAOOEuNaC8xJKv6Xt+1A/n4fmfYJhS0BPr4ClxQikoraFdT0AT
 yngI4xju1eJB+pEoIauH8V0aeMN1fa0DKln5nlDoJ0bZi0F6y7w7uDYtuzFwwy9X7xNH
 Ku7scYIPvcHGj+J0kEbNrtiqmGwQ+FMPQLIqCRZN57CwGsIklHT3UIRiWbMAhPbU4NU/
 mhUw==
X-Gm-Message-State: APjAAAXi6B0ppIaIOI5o4Bb2eCEaEH54voV+47NG7T2dh4LIy6iNt3UN
 WojXw3iIIxwKnvormDiq7CUHeCgC
X-Google-Smtp-Source: APXvYqxQULktAEL5DQ5YwcPwKLm/Q3r7ZI5mvk1sKtDOcewCJUj8+P0/kbO8Gvty/fop1JttdwlRqQ==
X-Received: by 2002:a7b:c92a:: with SMTP id h10mr4034024wml.172.1558807916826; 
 Sat, 25 May 2019 11:11:56 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id o8sm12794540wra.4.2019.05.25.11.11.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 11:11:56 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH 11/14] pwm: meson: read the full hardware state in
 meson_pwm_get_state()
Date: Sat, 25 May 2019 20:11:30 +0200
Message-Id: <20190525181133.4875-12-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_111158_663037_225A6A00 
X-CRM114-Status: GOOD (  16.02  )
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

Update the meson_pwm_get_state() implementation to take care of all
information in the registers instead of only reading the "enabled"
state.

The PWM output is only enabled if two conditions are met:
1. the per-channel clock is enabled
2. the PWM output is enabled

Calculate the PWM period and duty cycle using the reverse formula which
we already have in meson_pwm_calc() and update struct pwm_state with the
results.

As result of this /sys/kernel/debug/pwm now shows the PWM state set by
the bootloader (or firmware) after booting Linux.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 52 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 9afa1e5aaebf..010212166d5d 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -287,19 +287,65 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
+static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
+					struct pwm_device *pwm, u32 cnt)
+{
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *channel;
+	unsigned long fin_freq;
+	u32 fin_ns;
+
+	/* to_meson_pwm() can only be used after .get_state() is called */
+	channel = &meson->channels[pwm->hwpwm];
+
+	fin_freq = clk_get_rate(channel->clk);
+	if (fin_freq == 0)
+		return 0;
+
+	fin_ns = div_u64(NSEC_PER_SEC, fin_freq);
+
+	return cnt * fin_ns * (channel->pre_div + 1);
+}
+
 static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 				struct pwm_state *state)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
-	u32 value, mask;
+	struct meson_pwm_channel_data *channel_data;
+	struct meson_pwm_channel *channel;
+	u32 value, tmp;
 
 	if (!state)
 		return;
 
-	mask = meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
+	channel = &meson->channels[pwm->hwpwm];
+	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
 	value = readl(meson->base + REG_MISC_AB);
-	state->enabled = (value & mask) != 0;
+
+	tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
+	state->enabled = (value & tmp) == tmp;
+
+	tmp = value >> channel_data->clk_div_shift;
+	channel->pre_div = FIELD_GET(MISC_CLK_DIV_MASK, tmp);
+
+	value = readl(meson->base + channel_data->reg_offset);
+
+	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
+	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
+
+	if (channel->lo == 0) {
+		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
+		state->duty_cycle = state->period;
+	} else if (channel->lo >= channel->hi) {
+		state->period = meson_pwm_cnt_to_ns(chip, pwm,
+						    channel->lo + channel->hi);
+		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
+							channel->hi);
+	} else {
+		state->period = 0;
+		state->duty_cycle = 0;
+	}
 }
 
 static const struct pwm_ops meson_pwm_ops = {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
