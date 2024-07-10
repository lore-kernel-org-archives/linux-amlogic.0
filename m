Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0CC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieb27jJjA0uhQOtXWYTh80ATTJQ2Wm7tgn7t/iP0Oi4=; b=h45c2hM+jF1Q8A
	tSSysEoRLq6KoibgKbkgQi3K0SBM4eBrAtMYm2XW7R2/6eVBl5IK3VG8STMqOVxEnnJBYQhVCYtWj
	1Ueefz73HxJkQKgL0+RFHq8PK9fP4eT1K7UuppyIUolINyn+bdIKBQjLKs6GiLQEuwHhaWJRtkdKf
	anJBKrUcL5ru0y1nB4E1e4ocgc9wKDkaJ3xqiIUoHL1eQ2O9O3ceZndyupKpZWRGb4DmwyJOkRH0e
	K8Ilz24J2UK6n74Js+jg+S8S0Blv1tb6eeX7c6YBloGrCL0pbB6K+4Bvb1iQ0nJbQ2x8tyHpwFTbB
	NP8qsE0dXCsYaLXwk3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8a-0000000B8kK-0uWO;
	Wed, 10 Jul 2024 16:25:48 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8V-0000000B8g6-1lAv
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:44 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so32138241fa.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628741; x=1721233541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pscEsLCW2+xzc/V+pxCdqIstr838YuHky5BjadKIhsg=;
        b=iwolxovZ+jBNB4HC9BRGhspMa2oq3E+lyIsbA0K4m1cVEmmp/gbPtAhwj44LAXl4gx
         IuG4EVrtNHQAE22G7eBGmRUBsbOVZcYdgVZut8yqjboevUkK7P4zdRPOg6FILKdgp6pi
         YvYqJ8q5Vcj19jfwyAsPdK7jt9jyIot6Gt3wC0eF2oH8eYGGn4IeVqZePerTnFsGNj7z
         xxEE28Cdz4DDpVzz/5Sacsi+tiqXMdANmjQIOYLbwn63+5axMVfkxkJmVUYC6XwzjWJX
         u0aW1rlWxqRnXpNkpcMIJWM7BsomFp+O0l/sNRZJ+/Ng68EKxDvYxzvvV3ay52ovMzsx
         Fyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628741; x=1721233541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pscEsLCW2+xzc/V+pxCdqIstr838YuHky5BjadKIhsg=;
        b=bHxo3z3EacMg7+Dlrbt3uOZ250/f+P+e2Ti6egQMPlpfzsWlXM9/2ioX6UgbOcb+NT
         syf7sF8fOCcIoPQwzWkOIaFgiAGHK+B3siWvKdo4CEbc4OE+xfLQsgEJwtCz7pQAEbA7
         zBXTFb3jiKD7GAf3wWRl34xQfsRHtNYJrUXbP6jOzjPoBYm/eC9bmANIUsXXyiStVCBq
         PpY0hcYeI9GSMSl4NH17F6K/BN4g8QmDpBeObzjAXxDl+R+9OkF6vgkLSrH75u2NBB30
         /m1RG2IDLpr7xHWFKGEMrWgmDRvW7kCoHQyQqqvB+PtzFvVq4vo3ew4BpaMQaKEXRn2P
         4NCg==
X-Forwarded-Encrypted: i=1; AJvYcCUzU1CR2kyIhM5Da1B3u0Z2YPPI5gmPhCx31Wt+f6sIeOtAZZAQmrwyWNn2Hjw+pFsqV1x7jfrMUKdXran/0iX1LY7cy1ANUIlAOcU7/L/AMr0=
X-Gm-Message-State: AOJu0Yy37+Vwug+9cK39eAL1p8KJQfJf0sgihshcLijfNx6s4hEoXJ2w
	ID8xAiknRfqDN0bisQGEYY2bNJpQTkIizD2xyWGgTROMnAOf+IMpg8guHt7Wt1o=
X-Google-Smtp-Source: AGHT+IFIOpVSt5nlbmui7fixIPX2FqGConbERPv2cHi/A6AIyFf4bo75VDo2gZeMvyu3iyHJ9ZWGTg==
X-Received: by 2002:a2e:3315:0:b0:2ec:543a:b629 with SMTP id 38308e7fff4ca-2eeb318a0f7mr39237081fa.34.1720628741455;
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/8] reset: amlogic: add reset status support
Date: Wed, 10 Jul 2024 18:25:14 +0200
Message-ID: <20240710162526.2341399-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092543_493631_AF67665A 
X-CRM114-Status: GOOD (  11.37  )
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

Add a callback to check the status of the level reset, as done in
the reset driver of the audio clock controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 3e0447366ba6..65ba9190cb53 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
+static int meson_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int val, offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+
+	regmap_read(data->map, offset, &val);
+	val = !!(BIT(bit) & val);
+
+
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -85,6 +102,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static int meson_reset_probe(struct device *dev, struct regmap *map,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
