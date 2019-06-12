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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9609C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A911C206E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bdc1vUdE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hJezs/mh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A911C206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkJYAKUb5tCF9OUivGj8Ltv2avLYYeAoLAytHYwLA2Q=; b=Bdc1vUdEnLqCzg
	EVVIg88ssBZUL22tIoglcr9cBpdGxN+RSal3SKFlwKFy8NbUOVRtcbOTjtZG6jCHZMjL42131QMFO
	ROEouu6fKEuVus/C+m+BU7fgTXYNF+rMq9Di0I5JqHK0LnJQZE8n5hp/P+pK/ujnauZiwSyfHioJ/
	e9pAZ0aB+jrZAfK0ntR/eEURq6ns/UET2ndSPMPRu8e6vdmL01srZgImKwEg8DhNIKD1AqnZFksad
	hE555GiznqnH2VIXsRzoq3Pq/il5LyU1W58SU8GskUhWUX4Mx1pzvhdNplGsgjfddeczxczHQvT5N
	TurQIjNVIsnK6VoLNrkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9TZ-0001sU-4u; Wed, 12 Jun 2019 20:04:05 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PO-0005Pb-Mn; Wed, 12 Jun 2019 19:59:48 +0000
Received: by mail-wr1-x444.google.com with SMTP id m3so18265432wrv.2;
 Wed, 12 Jun 2019 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ozFqFrdOls/tbyfpKPSUD8IXeIqprLYFvxWmhrpcf0=;
 b=hJezs/mhpUzuwKDYnDTkffQSPj1qlqYWTxHyZZCyJGmz9yMf9DCeczOxzmFpD6p02W
 MQ1+rm+WsLeepWr2BiRIvZBMLF4USVKGFSr11rnqEs9XAA6/sdkbic8gz+bSvLuFYkvG
 +eIF+Ta7P+wDId7ny7OtptjJYPXgdVDTzAp7NvYx/o+4id+3a9qlRB09XwADiEWSBmoP
 ZpKVkZumu8yg/mdo5k/swfiCD7e+dMkmGIb51cJAVAVxSJKLnlv65x2rkqVQKFhzEdfF
 Yuyo1AKdxn0C8JFSg31K4H/ZeJn2+6665p5jWIn+3PKlEgzaMLnS0CxLDDuIe4RoRsYp
 HW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ozFqFrdOls/tbyfpKPSUD8IXeIqprLYFvxWmhrpcf0=;
 b=LcvaoPGdgXEJLK05ZgAP12aLoBFfiaGbK/smDtn0E7f3wkdlkBE89cAebJd5Ui9o+/
 HXbIjOzDMJ1VB7TFoKNnsArPeX5nKdaFUeiwcRCaWAfCrLCrsLY0xswve2XxyDn/lHnc
 WVrZbPrwCfe4GBZYf0ZNt6Kjo5xUkPJCPqtK2KD5/H8byxAtmNh+kQ6C3hxg6eQcE5PK
 h31HuJpgfwljwSNnuMprIR/4ZzDx1RuYCKwNexY/Iy/05PmE1S7zAWfH/nCefRJ18qzU
 nCi11mL5Rm9i6iaffzInsxwN0MxmNgv16OdVt5opkQqEYd3emEcYWGFylpn2q4hDUeqG
 1mTA==
X-Gm-Message-State: APjAAAXRQCgcg/1K542HZNfMyeVmKvGVgbbbXVl22WvJOsslAaXvINK/
 hlxS9LtVJL7hII8Hj6dPlEKv75uV
X-Google-Smtp-Source: APXvYqx+I2z01ZACLWNFwKG9uP3GcaI25PwRYsbOfOhifupPiCs73U78vFKZDu77frhlBoTC9raCUg==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr9218749wrn.168.1560369584977; 
 Wed, 12 Jun 2019 12:59:44 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 13/14] pwm: meson: add support PWM_POLARITY_INVERSED when
 disabling
Date: Wed, 12 Jun 2019 21:59:10 +0200
Message-Id: <20190612195911.4442-14-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125946_820155_ACB94D9F 
X-CRM114-Status: GOOD (  17.10  )
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

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
