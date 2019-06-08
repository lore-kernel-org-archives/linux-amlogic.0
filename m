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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A681C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49675212F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RBdtsUHY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SGwW5Qi1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49675212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhwshLj+dEz3fL92/LPbvHnx7f4lerzMzZjFwTaY8Bc=; b=RBdtsUHYhFuFRW
	0PROSzqn9I3HvVtRUSfYjQLqbCWBzGuPyfJYD5yWY2KytO5pYkXpaqDAFRGGT5swkjppV7ewUWSAJ
	OzCMS3RMv+RYQTxTcCm+W43niVD2sIWmj64BTCcpp10zlUS4hc/fSjTnrXyN0TC0b0c4dCuMnZLu/
	CnBCzPs0gorsWvUam5VGKClYS70gxM2UH/yXw6je9N1IreUuOZoSnKVxlHbvKBKn4zyvaHk7/7dTk
	MI9RuNV0GIBJhSu+0Ea1gY+x3x2F2I6LjsDTYWBfcT9+kTjLqaSxfz0FfkWF/prC6/LGpGvqmZQuz
	FXwB8qWGD689N2gyQFFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfkv-0001ph-Ga; Sat, 08 Jun 2019 18:07:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjk-0000lS-1s; Sat, 08 Jun 2019 18:06:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id h19so6231218wme.0;
 Sat, 08 Jun 2019 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rd/V19A4tSe1xba1SSV3IvSkkngIMc8S68pgolsK8gQ=;
 b=SGwW5Qi1PzRumMlS2QqA1j7twYoUlovyZOMWknzDn6pTP82HtWJ/uWCOPFFY5efuii
 mldnIc38SrCgMBVVcFztt9gliqC7yT8waUWd+5PUYUkxcNRESshBHykogWpLcK/7oQwf
 tLufn2777HA1t+shj1qLcVYNZ8Y9TaxQ+RDm0nQXWyz8InSesskey0ficmQ8msPq/WJV
 /Q8YiM41p5ThKp6nM3+Y4Hn5pXdvl1p7g7AsUQLtiDGuD9i88IWVkmliGoWkAiN6IV9q
 V2ff8upHjPtccfR2sAsdb1ZXTm742aJ/8QvcVbP5OTjmIxeJAV8dwRz7mkCA8zB3zHYX
 dhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd/V19A4tSe1xba1SSV3IvSkkngIMc8S68pgolsK8gQ=;
 b=Hg0Vi4gT+Q90SjhGzG27BBwJR7WNUwBT6YiwQGclxwTSWgLjV2PvrdUI4HCu8nzFI5
 qXyus5S1VZN9L+COe+DBdJSxIdTqbYDX8+T5vvnzD3j3ONtV3ac7nkRHJqXvYJRg/yVB
 Lmj7Iu8esVoZsUa6ps1AwY8Vmas826Xf/9Bh5C9cTY3pGDTrB9cKmjspG9qox5WaPtdY
 t4wp5sEGdh3QgVh9f4FJQ6wE5+yubxiDrDWGePAgUn09zofcl9lU63DkMHQDLc7Q7Xtu
 T+ws9mqX3NW0zoI+QpjC5RYbFhdcnobTHP8dfYmuyUwYfPC+wc9F5iCqNS6OFc7oNxdB
 aN/Q==
X-Gm-Message-State: APjAAAV+VQoj9OGyark9TomIdFT9JhqBWaDe5vf40WbpOZgPnKIopWzS
 P+sCXDB/yrTZTncLIpy5tDuNGycj
X-Google-Smtp-Source: APXvYqzfJ3Inv2tkqe5fNSbVH0w39sIKZ3WEIMfS5tKr2+3pHXqvYD+oKzvYSwXsaNvRbuHQh1DYSw==
X-Received: by 2002:a1c:39d6:: with SMTP id g205mr7273666wma.85.1560017197987; 
 Sat, 08 Jun 2019 11:06:37 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
Date: Sat,  8 Jun 2019 20:06:16 +0200
Message-Id: <20190608180626.30589-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110640_133168_479F5165 
X-CRM114-Status: GOOD (  11.18  )
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

MISC_CLK_SEL_WIDTH is only used in one place where it's converted into
a bit-mask. Rename and change the macro to be a bit-mask so that
conversion is not needed anymore. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index c62a3ac924d0..84b28ba0f903 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -33,7 +33,7 @@
 #define MISC_A_CLK_DIV_SHIFT	8
 #define MISC_B_CLK_SEL_SHIFT	6
 #define MISC_A_CLK_SEL_SHIFT	4
-#define MISC_CLK_SEL_WIDTH	2
+#define MISC_CLK_SEL_MASK	0x3
 #define MISC_B_EN		BIT(1)
 #define MISC_A_EN		BIT(0)
 
@@ -463,7 +463,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift = mux_reg_shifts[i];
-		channel->mux.mask = BIT(MISC_CLK_SEL_WIDTH) - 1;
+		channel->mux.mask = MISC_CLK_SEL_MASK;
 		channel->mux.flags = 0;
 		channel->mux.lock = &meson->lock;
 		channel->mux.table = NULL;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
