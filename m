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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA1EC28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797F1212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nfwue8kJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D/4RsKmz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797F1212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yM7/kU74EGrOROxYztwnKGevNLYPTrwW28Hzf/xGkS0=; b=Nfwue8kJv7fULH
	gZbHNdPiXGf6NEEybzeOvti3lE2UYDKuxLAatoz8gdW8z6Rgu6q/RBmEuRC6nwtWwAmB9IsUrimM5
	FUjy6HihJTMB26oG8qHxxCOC3RppYrw3+nd0H/3sjzRGExjJUw6YaP3wZG7TEvuFr1X9jtnYx7Q2S
	hjT21kV8cYbzMoz+Xc/od5Nx7j3brp2QWXfjteaFHCunL6vwkVi720IlEPRx44Uwug0XMa7dR30iO
	EOg6PBFu1h5wmE9pLT0BfYF+QDpNtznGBgArVOjEn9SK8qwiZ2OED020dB0FML2dHWKv+WZzL2cIQ
	kOaQ+rhbw00HWMVvQtOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfmO-0003I9-5I; Sat, 08 Jun 2019 18:09:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjr-0000sk-6b; Sat, 08 Jun 2019 18:06:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id a15so4933460wmj.5;
 Sat, 08 Jun 2019 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brzPVQYJGO5+8pQRVV1qIooN3xRwnjhrtAnJ9r3iNOY=;
 b=D/4RsKmz0dAGeE7le8UugYLcUi/q/08AKyLYw034gyyUTG2UnreTOfwxzk/KJu/+eJ
 si2x16KSj0Dug6WijoeyeTf9UP+m5GEk4oaWLq2VduPcp8SKK4L15IkTC+clRcdFiVlb
 w/5d9rSLIiIG0FvG/g10eSe9bKQrWMdH+UGfe6ixk9mUF8hCl3JoZmiASyGgGtM1/YQL
 vyKlFJ86kuShoUqStQheLbR8rMYhuMoVzR862F7gfEMirLwtlbqUmz3U29pnfS1R3U4U
 OyfUzDG0StsSejZNrAc7V4spjYy76C+DlffoHZ0Do7MBtKs8dnk4RKmy3K1z7E6pWs8X
 B+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brzPVQYJGO5+8pQRVV1qIooN3xRwnjhrtAnJ9r3iNOY=;
 b=Q9dTNloDmvb4UBjOcooSuoP0yk4pVX24S8UgJH8IKGrPbgUwhp1285QsYreezYN/ms
 Kyr+Cx1fsWY9a4E0XZ9W8t6tszcvEp88xTbiiwhXNe2hxISzIDdHAAfut3VOEpqnGimk
 X/GahlLi5o/58G9TGAx6hE/kjacgjUUXHLDr6da4b3fCIXmFXL9Eb7zb1u/X3JrwdYef
 hebZc3hTUjDZd/KFZTh8iURYLeIZYsodopqfm0GV/XhR6uHhS83nj3wDwAM3ViG+VYfw
 ozatB05GwRtXA6Hts295/C5/93rPrxvCi09VDrgsj5wDNbgM/nqhtQ5m5G/pdMbnMF3U
 T+6w==
X-Gm-Message-State: APjAAAXcsuXQlw0cJ+buQVeiMxgNJd3XzJktCLORR2UHBhJLUs7z7In3
 TknzvEBooo0BJ8L+U8Ye2k9HBDhR
X-Google-Smtp-Source: APXvYqx37P1AY7EEr7qrvDbgENYYECOqQftclIqpO+G5gI//TwwFkpfqgIcpB8LgchQYDvPTDT+A/A==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr7763216wmg.112.1560017205383; 
 Sat, 08 Jun 2019 11:06:45 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 11/14] pwm: meson: read the full hardware state in
 meson_pwm_get_state()
Date: Sat,  8 Jun 2019 20:06:23 +0200
Message-Id: <20190608180626.30589-12-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110647_323250_1DE42B08 
X-CRM114-Status: GOOD (  15.39  )
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
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
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
