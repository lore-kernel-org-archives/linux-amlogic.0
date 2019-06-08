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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7187DC28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36985212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoDfhldd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Uzj3vu/O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36985212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIzkBEoNNQTBh9pxZ6NfBFQDoWo/5j2WL2t/d4dZrcE=; b=CoDfhlddmWlrE7
	tj1uTBidfoJOcvF1c7uHfoWbClR9UKy86n9UzRIJQL2aA1+p19d9PN/y6werYRPJAYk5dkn1zMuab
	GD2fcr8I+LEzoBUsg9vXVebdo7iJdVnWC5tUxdbrr6H5LYNXHfGQwK6Xk4ERrxcm4rt2wVNjssZX+
	3m6843g40uK6v4x6cbcXC5XKcUY2YARFm7R+iN4AnPuVKCnahT+wnW4DuERRvFLERnX0q+qdoluT8
	BFded20/259Du7lCiDiN08pHlhtzPE+rSJNKE1sBTLXHTq8GnIA9UfcWo6VVfNO+juMod8wELnoP1
	/RN1BfCrO12mqANyquyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZflR-0002LM-WC; Sat, 08 Jun 2019 18:08:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjl-0000mT-CN; Sat, 08 Jun 2019 18:06:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id s3so4934595wms.2;
 Sat, 08 Jun 2019 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8gcZ7g6SZecaItbHxibQT2XcvF7LxO5AUSQLLhQn3s=;
 b=Uzj3vu/OW9/CR/8CE259GRohUZutqH35BBlg2VgqpcuTLlMkRYRgIIhD1+MO+5/iAc
 ioOI2XtVxuqt7hT1Vav9hCm3LR8AEk03uvyDKvitdv+VtQC6mXDBkihPScFN0xiNMAQR
 qSXJf1czVXvHL67Z1CIG7Qi7TH/MGSDmvj8g2lrnf5JKrN03ndOj0/HVhhTSJKwiMQZX
 5uD5ssP9kOj18DO54FdPmlYtL32qKnZfdJI4cWd4hiBy8JvsJDnl+oJQOPmlmhnFvFwX
 dNuRRnTCwNjVYVNGyLyJKBkqOK5S0NPIbezwCzxSbSjrGzR/mzihY8E28mVSDXD0/1TA
 gthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8gcZ7g6SZecaItbHxibQT2XcvF7LxO5AUSQLLhQn3s=;
 b=gIZHEWRiRwogTHS5SVI3wW7JQ+Lkdzb40/sJ1ZdFvDvk8XDiKs2Uuc1oOlV0FQpX0P
 +yI8x/z4zKy9F9QPSG+vuRa0F9jKZI0myegqL6N3d5qEQL0JuVCsNAnQGSThvSg822QW
 OJcg9ZFd7z00S/SEeZ64lmg5XvkjV2VXnui/dfjF0UxZks+0uFHoluKP/yoSOFGfr6Le
 JdFxITTVxpK+OK28vncTlER64gyk0EKHNnYR+jLBUEBirXfWOt2OFttZmk7VGbMnjwRg
 rGcoRXmVzQMD83GiLkaAwJlQijuiFPKXl05mY8grDvlQo/XI0Zf0Z/jxhER1sTGMKR+l
 /1xA==
X-Gm-Message-State: APjAAAUyrSudl57JqhnQZyVmZAb+mFjkZQTwHgsEDPZGSPnluT8U6Cxg
 tSK5ZzE5eaVzdkA8EaUp7r4yBLO9
X-Google-Smtp-Source: APXvYqxl0lqew1WyedVbrTnaPnS2DMqwoLTa6KuMO3KeqkeWq2hFRkU8aYGCrR+F/9hsRbf3kHKoXw==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr8031837wmg.43.1560017199160; 
 Sat, 08 Jun 2019 11:06:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 05/14] pwm: meson: don't duplicate the polarity internally
Date: Sat,  8 Jun 2019 20:06:17 +0200
Message-Id: <20190608180626.30589-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110641_452077_A5ECE174 
X-CRM114-Status: GOOD (  13.51  )
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

Let meson_pwm_calc() use the polarity from struct pwm_state directly.
This removes a level of indirection where meson_pwm_apply() first had to
set a driver-internal inverter mask which was then only used by
meson_pwm_calc().

Instead of adding the polarity as parameter to meson_pwm_calc() switch
to struct pwm_state directly to make it easier to see where the
parameters are actually coming from.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 84b28ba0f903..39ea119add7b 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -63,7 +63,6 @@ struct meson_pwm {
 	struct pwm_chip chip;
 	const struct meson_pwm_data *data;
 	void __iomem *base;
-	u8 inverter_mask;
 	/*
 	 * Protects register (write) access to the REG_MISC_AB register
 	 * that is shared between the two PWMs.
@@ -116,14 +115,17 @@ static void meson_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 }
 
 static int meson_pwm_calc(struct meson_pwm *meson,
-			  struct meson_pwm_channel *channel, unsigned int id,
-			  unsigned int duty, unsigned int period)
+			  struct meson_pwm_channel *channel,
+			  struct pwm_state *state)
 {
-	unsigned int pre_div, cnt, duty_cnt;
+	unsigned int duty, period, pre_div, cnt, duty_cnt;
 	unsigned long fin_freq = -1;
 	u64 fin_ps;
 
-	if (~(meson->inverter_mask >> id) & 0x1)
+	duty = state->duty_cycle;
+	period = state->period;
+
+	if (state->polarity == PWM_POLARITY_INVERSED)
 		duty = period - duty;
 
 	if (period == channel->state.period &&
@@ -278,15 +280,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->period != channel->state.period ||
 	    state->duty_cycle != channel->state.duty_cycle ||
 	    state->polarity != channel->state.polarity) {
-		if (state->polarity != channel->state.polarity) {
-			if (state->polarity == PWM_POLARITY_NORMAL)
-				meson->inverter_mask |= BIT(pwm->hwpwm);
-			else
-				meson->inverter_mask &= ~BIT(pwm->hwpwm);
-		}
-
-		err = meson_pwm_calc(meson, channel, pwm->hwpwm,
-				     state->duty_cycle, state->period);
+		err = meson_pwm_calc(meson, channel, state);
 		if (err < 0)
 			return err;
 
@@ -520,7 +514,6 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	meson->chip.of_pwm_n_cells = 3;
 
 	meson->data = of_device_get_match_data(&pdev->dev);
-	meson->inverter_mask = BIT(meson->chip.npwm) - 1;
 
 	channels = devm_kcalloc(&pdev->dev, meson->chip.npwm,
 				sizeof(*channels), GFP_KERNEL);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
