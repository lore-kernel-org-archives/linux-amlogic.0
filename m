Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6EDC531DE
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+hGzi+Onsk5O2FJ4a7OEIsigQh6gswKRxL/cC7m6Rs=; b=33lz5KWz57iA+v
	fB5iHOoEliLNiLXC9iopgXQt1E8hmeT6q1HwWz/vE8409NJJznHydHI3Fu4Q5uE1ZR5nHh+WDVxCr
	jLwgHpBrWwL0+IaoaJwJ22Ht2gxQE8RwXUkjfJ7/bWgJdXPK1LYqMq71HKqW/u2dPAYP9SR8L/7jO
	dPeVcmb64yLmAngwQRzpz/9PqAnXKNDV6VD4zsDh+A2UHYTIVXbWLoUvbdoNmhLl5c9vZsMMMa1zp
	wo2hANLMj2uIAtpY+0PiaKqJG1c2lnJxqdcgGUBsTHU0/twMyHrQPpUl0oOFfBUFToyqKwDVbYbhf
	7qCT3B5Im8FBuQx6VOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqRG-00000003ede-3QmY;
	Tue, 13 Aug 2024 12:15:46 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPS-00000003dzJ-1oto
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:55 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7a1d42da3baso343431785a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551233; x=1724156033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrZdtpz/qyn21riVVQ3i7W1bl9boREamJ7f5SQNbyMY=;
        b=UN7r3H0/jIaJzWQL8+jiaZ0bqBOdrIpgiaASNM9LcYsrTZ6lJPS4WhwMMiYb18okWh
         lK3FaSez170wTAHC/Px2I8qn89In8ds/4JzgCfBYCNR6G1lOdkQgWkJxI9zl1hts70ER
         PnVTX5BsuzzUK7emV6R6OCgzp7M0B9DkEvxeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551233; x=1724156033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrZdtpz/qyn21riVVQ3i7W1bl9boREamJ7f5SQNbyMY=;
        b=M0ghKRC3vNUCUl35U3MYOfQKI9t66J5vz5V4GE8eto/OztvU9UX674i3seMqVVN6UB
         SLjSlTx4piSIZcN76BbR3uwUujYxP5QktlLVwMnQjpFInrEla9+dJ//SJ2BCjwDVbhNq
         hwxiccGP1KhmP2Knvcmo8kDaAU6JGLmlYW4B1bNYNb10H1tBKshSTtCqvBwqxdBKqcTl
         p1HQVTiMNpNfYYc0Wargz32gqp4r8PC3sNrwUBmH7/Mtrrj/sBI8wLuLoKv4AY+jLP6m
         C+hEY7Ik+OGh0atYC5WkrKVez6eqUA/qvS5CpGs6Lb8XSTwkMe7bk/hHVImUJUCAf5ai
         RYbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI1S5sEDc322JCg6LxGi5SUXZDEqO4ZBwgWEyyf2WH4QVOTxHKBT2Puz23fSYP1EYrNzk4nU6iYv5uHuaH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk2MxRMIgcins2O0bq8PuPUUZ3lmRGrdzP0nnibop91BBSpC2k
	9zItDvP6L7i7fc2HS20QzFZMzBLKiPkD8yOyEHHHKexOUzTiXnuNxz1IKMjZZg==
X-Google-Smtp-Source: AGHT+IFw/fFUPyShPG2/Ze40YU4KamjQKDfYMrBvg1bfZRKNcTmejJtMfWfYfhDU5SD5ItOdKzwbXQ==
X-Received: by 2002:a05:620a:4043:b0:79f:515:e211 with SMTP id af79cd13be357-7a4e15bdc69mr410951685a.46.1723551233113;
        Tue, 13 Aug 2024 05:13:53 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:50 +0000
Subject: [PATCH 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_051354_553649_7613F94C 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Smatch is very confused by a clk_prepare_enable() being called in an
error-path. Fix this warning by moving the clk_prepare_enable() to its
own function.

drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index e89e888f028e..7716dfe2b8c9 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1392,6 +1392,16 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 	return ret;
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge into __s5c73m3_power_off() until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void s5c73m3_enable_clk(struct s5c73m3 *state)
+{
+	clk_prepare_enable(state->clock);
+}
+
 static int __s5c73m3_power_off(struct s5c73m3 *state)
 {
 	int i, ret;
@@ -1421,7 +1431,8 @@ static int __s5c73m3_power_off(struct s5c73m3 *state)
 				 state->supplies[i].supply, r);
 	}
 
-	clk_prepare_enable(state->clock);
+	s5c73m3_enable_clk(state);
+
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
