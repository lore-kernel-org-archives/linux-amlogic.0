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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68637C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 444A2212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJtCpwQ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aC3QJv4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 444A2212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKjKlcUDsfFHANxAp/l7Gc0yPfs8+9nH4A+8999RTRs=; b=lJtCpwQ3ucZoRl
	vkcZAwLhnm6wj0naLG2gL7y2Ez+LBH1pWJQ8TcEwfrJ+haRskpCMWbwz5K1XqdNVJbG4HaH5QTvfQ
	85rPGudT++cRZirw98vI900AkfNDtow1/IpD/ZjC8cmJEr96rNZAsk/MVhL0FSMDVgjK2JIkC2WpV
	6SYf4Zj69fmg1uvWeLuqrRO9GQfU8ZZPogNppFTz/KotMZlj5Oxrp0hPBGH9hf5x9XahMmGXsuNlp
	GoF3oi6xooZSc4+jZmNlRecOOW84eBQCP88UA0al9KwTy1oCxpCcNv1ErYtIckYyCsk0G0vwU+5S5
	N7AH5ACCXen7agXb25fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfmk-0003fb-Qr; Sat, 08 Jun 2019 18:09:46 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjt-0000uT-Dw; Sat, 08 Jun 2019 18:06:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id s15so2233017wmj.3;
 Sat, 08 Jun 2019 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gus9EVUSXiif9myhzplFWmWxo5iVjcg4L/R7PzfQr/4=;
 b=aC3QJv4yV2M2NgE+T6iUkKFAXQ4b82UbBPPWeG20gvtlZaDZHm3hTWpaeGbwCRPmnh
 tCrc1f60ZSqkOlQ7wiEvVW5FMKplDfQM6TJRDMM7fMvvbIBfRyf+Vq/Z0jQLJubciKMt
 kqTMk5ZpTVpEDBPQnRlznSLsUQ6wHGBe8LfcF6sWel+B/tfcmJlrXabelYHCkfjqpJmq
 sPFobFtjwwPwPpbw7ss0q3uaMjBfUFuGxp9gN33lDkGl+oJ7QRB0S+51GZQl4clO46vF
 EOtSTUEgT089LkWHdq5C0jFy1quBzOWByO2XO/EU0FcYpXn3kLcdyQlWRx8IiBIKs22z
 CLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gus9EVUSXiif9myhzplFWmWxo5iVjcg4L/R7PzfQr/4=;
 b=lR+wA2s3cTdu3qweYByLJGMF3PgMJTzYfzI7vgSmEs+q7LUqdUcmdj8xtNqNJvzA1p
 tzpNC9xTNXrVSR48Uj4nL/5WFqGdje/AZEppG9Xd6qQ024SliLN+cN8+6ZDe4/z7H/2S
 2RrHxIIljF5C4iauBNY0L2ISzsndLU29osDmS1ox+TSvYwT3T23qgHV4mPEqcB07c9Al
 aay+0JSN7v4a0fQZWDXoUbbZCIbIugg+AIyd/0DJDWyhySji75xY5pJhdRlOzTEqoDpf
 QBkLhr2RPkLd7k7ZuVTMVi8MRCNKtD1io0/u6+6JtauQp4Or6YasiHF/ghQJg2PNZRBj
 2pKQ==
X-Gm-Message-State: APjAAAUIh39+JiPjZZnjiCyw1tDXAvL7hLQcHFfUE3wzInYe8fPlYrBn
 ip8ChkEAcpFIXkN6Nqy773PN7P22
X-Google-Smtp-Source: APXvYqzRGcVvHTQ7ACECA1v/MRk4nF9YNeywKueh0QL3/1P6th9zfIq6Kc07vu6eLxFOilV6x/wiNw==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr7924649wme.95.1560017207452; 
 Sat, 08 Jun 2019 11:06:47 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:46 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 13/14] pwm: meson: add support PWM_POLARITY_INVERSED when
 disabling
Date: Sat,  8 Jun 2019 20:06:25 +0200
Message-Id: <20190608180626.30589-14-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110649_558232_BC34E160 
X-CRM114-Status: GOOD (  17.09  )
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

meson_pwm_apply() has to consider the PWM polarity when disabling the
output.
With enabled=false and polarity=PWM_POLARITY_NORMAL the output needs to
be LOW. The driver already supports this.
With enabled=false and polarity=PWM_POLARITY_INVERSED the output needs
to be HIGH. Implement this in the driver by internally enabling the
output with the same settings that we already use for "period == duty".

This fixes a PWM API violation which expects that the driver honors the
polarity also for enabled=false. Due to the IP block not supporting this
natively we only get "an as close as possible" to 100% HIGH signal (in
my test setup with input clock of 24MHz and measuring the output with a
logic analyzer at 24MHz sampling rate I got a duty cycle of 99.998475%
on a Khadas VIM).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 900d362ec3c9..bb48ba85f756 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -245,6 +245,7 @@ static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   struct pwm_state *state)
 {
+	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	int err = 0;
 
@@ -252,7 +253,27 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		meson_pwm_disable(meson, pwm);
+		if (state->polarity == PWM_POLARITY_INVERSED) {
+			/*
+			 * This IP block revision doesn't have an "always high"
+			 * setting which we can use for "inverted disabled".
+			 * Instead we achieve this using the same settings
+			 * that we use a pre_div of 0 (to get the shortest
+			 * possible duration for one "count") and
+			 * "period == duty_cycle". This results in a signal
+			 * which is LOW for one "count", while being HIGH for
+			 * the rest of the (so the signal is HIGH for slightly
+			 * less than 100% of the period, but this is the best
+			 * we can achieve).
+			 */
+			channel->pre_div = 0;
+			channel->hi = ~0;
+			channel->lo = 0;
+
+			meson_pwm_enable(meson, pwm);
+		} else {
+			meson_pwm_disable(meson, pwm);
+		}
 	} else {
 		err = meson_pwm_calc(meson, pwm, state);
 		if (err < 0)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
