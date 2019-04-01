Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A9CC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A842133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GM1cSb6B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pbtTnCsW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3A842133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyW4ToPKyfGgbm8jnTqefhFqeZUtCftLjEqX9ebmRoY=; b=GM1cSb6BF3DOrL
	JSj91Z1WoKMRhWJ+Ai1gYtiQrCRpt2T5su1PYIvcyz7B1U74DMK9werGaTE53noXbcdqY+adobWiz
	/LWgjVuPTWQAGjv5kCQPiMJecuHNxidmt5DNanRwCdFqUq7Jvy1W4ZNmVysVpUrK16N8u0MRLDW03
	6amzh5kdptpe3aQX9Mo57fEnqcPxgvtkuo/DAPFY21UvueZwY6K+kgbQdpOXOUGc/y6zS/gN7LNZZ
	uukEYUVMbZ9Vl3dg0k4ShltBkqkahbH5UdCFDNufGtIaJLggC09OA1Id/FSSjZtNuCSY2bqnr4tk5
	rAMM0TiSVilE1MJFIL9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1WC-0006wl-8D; Mon, 01 Apr 2019 18:18:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1Vr-0006Nx-VM; Mon, 01 Apr 2019 18:18:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id q1so13311540wrp.0;
 Mon, 01 Apr 2019 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3qyE9o38IDDNxrUGtndSazeFTGkJiWYDt06NFgE664=;
 b=pbtTnCsWDQS+aT0oYhysB5TgrP5wDENRI6k/RVJRyFf1U5/o1aztpYHNElAbZ8g0s9
 swcHcBB2+wrbL3UzGzwsjSxQEXTIIu5VRW/MZo6+2Y9HyycC0ObQvL1qkw1/ig+TMFNx
 lz+qnd8JRP1ab38lILK1xi9tQzWJwFtIbnawR78ir3t6tNnE79S1xIQq84LntWrUFwwm
 FwA175mB0Z+04Kt06Z1WRbsHR44RJFNVo6s3v5dbDa/VqyFdXaVFZAqZl+qhZ7zFRvXg
 9EjY8ARRjZbj8wrBRTn2eCuVnjlc59bHI1ATZ+dv6s5jNdgQVotCF+7HM9gPO4WrR+C+
 XurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3qyE9o38IDDNxrUGtndSazeFTGkJiWYDt06NFgE664=;
 b=FUB3ZFz2+CJZW0fIO+gXu85PXwE/OfVJO0S8hjQXWVA6JMoJBlo4tQPh1E654hdwtf
 4yTGny0swVH/rLOB+V7UkWLMZiautHTEED8lzwkOx/dFDAL0jf5liuzbKOFa16RcJVAV
 Ziyor6C2gkhkE86DZJIVjPAQEHGzB1V7j5fvRws+TPyqRLQcZUdsagYfcYLSQLfSMzPV
 OttZ4mEAK/Dqr6pxTxisGsZ2IxkICXfjKaWaKXU6aVTiEbsPzG6a0sJvAPra6zhUxPjt
 ZJ6rfWn1CME8ZV0u/8/4I0HG2woW2McLLKPEHY7Xngxl83YXEttDReagrX0T7k1iOibm
 AGkw==
X-Gm-Message-State: APjAAAUy4IqHu/GienYHUvZE3kr8SnCQWRiEIoop5og8UdvUHk+eMBsF
 5/uYDMemk0ZLkjPfNat29cFIH3yY
X-Google-Smtp-Source: APXvYqxtLgmKu8IHhS83CT8F1S3O85W6YkaL6iYFw1+MwLNKYEaYAHhO9W2z5afn1DgfwXFP4SOzYQ==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr28855114wrq.119.1554142706290; 
 Mon, 01 Apr 2019 11:18:26 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73A0800C9C8A7BE25478D36.dip0.t-ipconnect.de.
 [2003:dc:d73a:800:c9c8:a7be:2547:8d36])
 by smtp.googlemail.com with ESMTPSA id h10sm18131127wrs.27.2019.04.01.11.18.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 11:18:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] pwm: meson: don't disable pwm when setting duty repeatedly
Date: Mon,  1 Apr 2019 20:18:17 +0200
Message-Id: <20190401181817.11999-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
References: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_111828_005546_B73EB91D 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: bichao.zheng@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Bichao Zheng <bichao.zheng@amlogic.com>

There is an abnormally low about 20ms,when setting duty repeatedly.
Because setting the duty will disable pwm and then enable. Delete
this operation now.

Fixes: 211ed630753d2f ("pwm: Add support for Meson PWM Controller")
Signed-off-by: Bichao Zheng <bichao.zheng@amlogic.com>
[ Dropped code instead of hiding it behind a comment ]
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 4b708c1fcb1d..e247ab632530 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -325,11 +325,6 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->period != channel->state.period ||
 	    state->duty_cycle != channel->state.duty_cycle ||
 	    state->polarity != channel->state.polarity) {
-		if (channel->state.enabled) {
-			meson_pwm_disable(meson, pwm->hwpwm);
-			channel->state.enabled = false;
-		}
-
 		if (state->polarity != channel->state.polarity) {
 			if (state->polarity == PWM_POLARITY_NORMAL)
 				meson->inverter_mask |= BIT(pwm->hwpwm);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
