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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F4EC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705732133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 18:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/9F49ha";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ePKf8xtG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705732133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6Qj7/gtX5aUdt80uuFitjvBg5rgh1ZtWiwCC3TXwaw=; b=h/9F49haGGjZ3Q
	kEwzRJr4slgF8EGU/YntOgHMrj3S47joi/ol5CxqQrre3dssJcIvN1WS0B3JjToE3AINDocJ0S0vm
	d2zIiylmEOdu+xqALLeITOsteB5gd3S+o+lk+7aBNxdZa4o8inkUZKJIlLsaQTezBFsru1PzbcMGE
	U37vt5mdJzWbmoJrx/YraRlVi4sp0+sRQcz4S1KwwKvwT7wYWtdo8PQPnD+GXhkp7a/MZzimFU3V8
	elYG63Kx+giNmUI2d8NZqVecl/0bcWsFOam1TaeAOlkHiWx6LwhBLBgdWCAnHxPFheR0Sldh40gWI
	aAo+uFlDPYM9JFXUSqyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1W0-0006Yu-RF; Mon, 01 Apr 2019 18:18:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1Vq-0006NT-Gt; Mon, 01 Apr 2019 18:18:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id y7so13266092wrn.11;
 Mon, 01 Apr 2019 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ye1/MyKDhSO/ewzuKmbDnyUwPW1RDGDapSOkV4cGL0=;
 b=ePKf8xtGlM3Xw4gBPq6inPPXkjh+VtlbGbMXaQ+Rt6akR6bHQpjYcIcpHHQUMKgpiO
 ftMv3MYpzPta4C8/QU4lCE9u0aFmb88VfFSJRI3xNrOnOyFjmwBFYlBGHCdf6NF5uhHO
 0ZhOtjVUFyHqkFP2qydw4IjkjlcWeUA7yBxX7NhsCryLncF2+EkEX0+EqQJRa6DgYC4h
 RljSZcgokxPGRUI3wu6t+KhSqfz/MlV2LNWLMa2rksEeTCG3UyH835eFf/o0U+lULHAQ
 e8xdATQiAtrKEtH5JWgW0vAvuU2iQzEVBXPHAg/SGVoG0Dy8QX5a8fveEtnkuhgk/xSI
 fsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ye1/MyKDhSO/ewzuKmbDnyUwPW1RDGDapSOkV4cGL0=;
 b=i3/0bR+pzZj2XEKAKyEvFQrwcs4esZXayYhyh7E5wJBqV6Syr+b9Fb6PuS+N2H5aLw
 YfnjWgd13WU/fpgZSnNpZf+0FWNL4fCYsNDVMzK1/0uqOOlINAIa5kQUPIm2E9iSUjma
 8kP4hyns1oRTp5W50RUf0Kd/Rxa9XwcKsP3I25zZaNatK82UIrReNj5PlTMIDYWKwIif
 cNVbZOi2vx6Q+ei1L2Dn+U4+AfoPpLk7NCi9JKynz15Kwny0zE8h4ofqvcevGXaik+RN
 ckGyzPgab9DA3wL1cU5U0yy+D6HL3s0D55/DhS8brDNNs8SZIl6SWoAmS9bAuHOpJpNs
 hNiQ==
X-Gm-Message-State: APjAAAWcwvQYBY8kbtWPfF5EiSy2HY+S/XZMqj//TarFHYfuAI1f+BEQ
 6k6Apm/aFvDyomv5TEVTPzY=
X-Google-Smtp-Source: APXvYqwQGTK6gmoLZn1yNvDpn8+7wW3OyahHbaWJL+s5vbSRarD51UwEVgNOFPyHgLHmZfrS8WXk9w==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr44948400wru.130.1554142705035; 
 Mon, 01 Apr 2019 11:18:25 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73A0800C9C8A7BE25478D36.dip0.t-ipconnect.de.
 [2003:dc:d73a:800:c9c8:a7be:2547:8d36])
 by smtp.googlemail.com with ESMTPSA id h10sm18131127wrs.27.2019.04.01.11.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 11:18:24 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] pwm: meson: consider 128 a valid pre-divider
Date: Mon,  1 Apr 2019 20:18:16 +0200
Message-Id: <20190401181817.11999-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
References: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_111826_555536_23814DD1 
X-CRM114-Status: GOOD (  13.25  )
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

The pre-divider allows configuring longer PWM periods compared to using
the input clock directly. The pre-divider is 7 bit wide, meaning it's
maximum value is 128 (the register value is off-by-one: 0x7f or 127).

Change the loop to also allow for the maximum possible value to be
considered valid.

Fixes: 211ed630753d2f ("pwm: Add support for Meson PWM Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index f6e738ad7bd9..4b708c1fcb1d 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -188,7 +188,7 @@ static int meson_pwm_calc(struct meson_pwm *meson,
 	do_div(fin_ps, fin_freq);
 
 	/* Calc pre_div with the period */
-	for (pre_div = 0; pre_div < MISC_CLK_DIV_MASK; pre_div++) {
+	for (pre_div = 0; pre_div <= MISC_CLK_DIV_MASK; pre_div++) {
 		cnt = DIV_ROUND_CLOSEST_ULL((u64)period * 1000,
 					    fin_ps * (pre_div + 1));
 		dev_dbg(meson->chip.dev, "fin_ps=%llu pre_div=%u cnt=%u\n",
@@ -197,7 +197,7 @@ static int meson_pwm_calc(struct meson_pwm *meson,
 			break;
 	}
 
-	if (pre_div == MISC_CLK_DIV_MASK) {
+	if (pre_div > MISC_CLK_DIV_MASK) {
 		dev_err(meson->chip.dev, "unable to get period pre_div\n");
 		return -EINVAL;
 	}
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
