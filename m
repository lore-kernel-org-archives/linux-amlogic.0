Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611FFC468BC
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBC1212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLYzi0OL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SBHxrcDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBC1212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZALHeOdd1QKlSiLDuLE1xnW64VGtAJ8fX7XHzOcbGc=; b=XLYzi0OLjeEJqA
	IHBAv/i51qTiPjepOz1DLmnsY7jXtWaGTD+ac3F1L++Qb7nuz/X5o5J7u63xHVnwlJjlK1u+wci5U
	aNCPyag5Jt4hNDdGSIKlSGQUPSYwsPKnBRgdzQFkPerHIZsGls1i2Ixx70xEfcRMeTxHOjhKw4vg2
	ydErDSKvFa5Z9D2RKuXKl/seQrGA5r+rXVCjHlx2oUQIfrcRNkkQFsPYtL5ohFtp1QkvMho6fsly1
	lYvJvhG3EZuZN66Mrbvl4FGZMRgvVzK8vPAw/CXrWzWh2mA7Ix8gopj24NJCdvTW+hXs4Y7v6r/GK
	QOufsjLKf761HeY2NOfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZflW-0002ON-Ik; Sat, 08 Jun 2019 18:08:30 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjl-0000nn-UC; Sat, 08 Jun 2019 18:06:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id m3so5235844wrv.2;
 Sat, 08 Jun 2019 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULxtsw8dujAsYVt5zC7SDOdydkdqEp/VduAIrsjyFQE=;
 b=SBHxrcDiscWsMPlgUe1eue3IB7jYsIcP8LOxKnBLi/mcoN0HQC0c4nr5sRBPn+qmQM
 HQnASudTpyUH2PPAOdA5RAnqmEKhS69NmcTqDzT44DZrxcP533fDz4mFEKQtvzW5bk++
 a+wuFcmv24SnXfkCFwObZfODttniBC8DNtWs9pxov4CzBcUZWO9YnFCUGQP1PvmHtV1y
 3HE7Qo1bZXlX/hsv45hdM/CITvIsAzcYcM8C7/5OH0YtynfhfrEx2TAtQqhdVYw6IHVU
 y62BsUxGetOMUdms3Xu7E8NxIpaBj90SC6YPtntZO9aOJujrK5dVYn+uFlkZAiw7RjR1
 zIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULxtsw8dujAsYVt5zC7SDOdydkdqEp/VduAIrsjyFQE=;
 b=SR5LDi1j+PNNFwu9hA+GsnKyhQtbm+oWhNTSmC9zfU11zUShJFW8+IMpVdnbosNa1G
 GCp13OS/fLplTFZ44WdTPvLZY3vIzq+utbxtqG/rftwKyYD6uc9BO5TxU57bNFmRYT5f
 o33/tmxArVyuIZSzuaJkMY+sDMeHSv/hHB/lS6rmKxvcF5BcKY2I/nCgepW7tQZaMxjj
 0uUhKeow3L9W20a6hLUSYIW6oiq0LwJxxy0BVopgMLbXKSkaQ4ggyNHgkYtzkuFN6fcF
 zMw5YNEOPnt/cb7OgbDxdMBux4FICjNdt2k0zfNcC+O0/vXhyyD5g82uBZovVtGFSnd6
 5Qug==
X-Gm-Message-State: APjAAAXYuiNv5cTNtGWC+8dFEDoM/QGuP5JYOjfAq/rUBXStL7TvYVFJ
 7OqEvMb6gLCc6AF3hQsSjpC52aWz
X-Google-Smtp-Source: APXvYqwpgkhDaAIFoY4aTBBevnRJflkVdXiiIro0E7UPi1OhSmsgF91My8rGM24/7ZxDIpgiuELmag==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr36157030wrp.149.1560017200358; 
 Sat, 08 Jun 2019 11:06:40 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 06/14] pwm: meson: pass struct pwm_device to
 meson_pwm_calc()
Date: Sat,  8 Jun 2019 20:06:18 +0200
Message-Id: <20190608180626.30589-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110642_064461_53857C19 
X-CRM114-Status: GOOD (  13.86  )
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

meson_pwm_calc() is the last function that accepts a struct
meson_pwm_channel. meson_pwm_enable(), meson_pwm_disable() and
meson_pwm_apply() for example are all taking a struct pwm_device as
parameter. When they need the struct meson_pwm_channel these functions
simply call pwm_get_chip_data() internally.

Make meson_pwm_calc() consistent with the other functions in the
meson-pwm driver by passing struct pwm_device to it as well. The value
of the "id" parameter is actually pwm->hwpwm, but the driver never read
the "id" parameter, which is why there's no replacement for it in the
new code.

No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 39ea119add7b..d6eb4d04d5c9 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -114,10 +114,10 @@ static void meson_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 		clk_disable_unprepare(channel->clk);
 }
 
-static int meson_pwm_calc(struct meson_pwm *meson,
-			  struct meson_pwm_channel *channel,
+static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 			  struct pwm_state *state)
 {
+	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	unsigned int duty, period, pre_div, cnt, duty_cnt;
 	unsigned long fin_freq = -1;
 	u64 fin_ps;
@@ -280,7 +280,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->period != channel->state.period ||
 	    state->duty_cycle != channel->state.duty_cycle ||
 	    state->polarity != channel->state.polarity) {
-		err = meson_pwm_calc(meson, channel, state);
+		err = meson_pwm_calc(meson, pwm, state);
 		if (err < 0)
 			return err;
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
