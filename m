Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F8CE7B14
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/wVLVFIoWgkg/P9OwKqQcYwWmuvphKNVWv8buBKvTE=; b=jX3fPh5PRLW+4U
	SfTWwvdUrsBF2+tyttrfIRfIdzqXUK79ZQ+eYZmokhnu/0zqJGztQpPL6cYqAdofKwS/FMiSayPW3
	EW37X+844X4W++ZCJc4qoXfIwmP1VoDCdp5mjfQRmbjYz9CQKFhYcHri0ogG/RU9ZXVWy6fW+lhNQ
	1EqgbCRhtSC49xY4j3TP44y319uH2y/T68qmLDY4MpAr39aWhhktb1GFp+YOxgVxljKxItzXzdKIl
	1TCdELaKnyeOB5M/MwDlEG9JwlvnyxSR1IQtPfPDZbfGqxc9RPTh60+ouAC1YrvTsSUv/UM8sqBfB
	dXuAwgX+EIXZycTZU/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZEv-0000000CNwL-33AT;
	Fri, 06 Sep 2024 13:43:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7V-0000000CMCh-3itF
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-374bd059b12so1178164f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629724; x=1726234524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tSPL9hjXApUYKXuHpC3lX5106d4gltSKmV8tShxn0Y=;
        b=auBQVUy/CJomTzJoxm2b9pgsN2Mc0xGTmk3eg4TJ1TuUAQ+qK84/SPDCjnQXaqCEap
         M3yDK6gQgnyFloIkLH8iS8/nFaawJp+2vy+1wQCS9Uh5CXPsUzPz/1dIyqPlQxoI6IeD
         lPbyMQpZbWlTu3z7ZoIf0On8JYTjEQF2MYby/qG3ci/NHlU5IYPwk11kGRfGrxQUPxKU
         agHbR5XxUzo/Vop5gzvfLHkTWwMA2QZ/oIKPR3JpHQfzzBsK5qNcP07JHIYfN6yttv+k
         FCMgrzG1dmdZ3Bs4ZS5wI1u6EVbSxjLgzkiU0k9QXuXWugVKmL2g11BfIQW+TsZQIHq5
         P14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629724; x=1726234524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tSPL9hjXApUYKXuHpC3lX5106d4gltSKmV8tShxn0Y=;
        b=LyIdJ/X1Pyh4wh5JPJJx+NEr0z/avYcFTvd7ROTRQhM5bVLmAywFdS53bKvbzmcHbm
         mQ3cud/yYfdnisF1AYwXHsRLOFAMpocElEnsm7AHalYfFLkEwqluuBqDkb7f+B5FMwI9
         GwZSzLMiyC+7EgB2AjB8wTECzJgCJZosIFqRHV4Jg2rRlY+6gkWW6VjxCOvCLP+HxN4+
         V7u78e/Ig+c6pXhgZ4fznB0yT6BnCjWelJkTfhjT4uYoyrBGDKtEYgZIcbVD3q/62hvo
         KxLAm7MV1bOWDgpXQPgh39HKZSNU3dKhWomze9fVQEHr8tHRPF+fdr6KRDa2j1kMo9gn
         qBuA==
X-Forwarded-Encrypted: i=1; AJvYcCXlVK7LA6CfBAZ0F20JGSO4W1zVuNr1RpEFcBaKGpKOnvMU5EY4mve5XR204VJE4ExeSkto1+YPRkYtkl9L@lists.infradead.org
X-Gm-Message-State: AOJu0YzbohisPkfHNGXkijrfnKwQhmtcF0BJiI5nPKIRo3gKXzT9waTg
	sk9t5UuTQ1tH8SccWgQturEaYgWpmcfzdPN2zbdCF6wzfVf/0bszDJiXzZhbojc=
X-Google-Smtp-Source: AGHT+IGh0HbWA2IvTSqHJmBK+lJ8nsE3aksAjKs/B6hcz+IVxN5XBkRPlliYSkbr5ltAj9mYwc0NkA==
X-Received: by 2002:a5d:58f6:0:b0:378:81aa:2662 with SMTP id ffacd0b85a97d-37881aa26fcmr3879235f8f.7.1725629724309;
        Fri, 06 Sep 2024 06:35:24 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:51 +0200
Subject: [PATCH v4 6/9] reset: amlogic: add reset status support
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-6-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=uFpLNDx7axOqsTgkkJPsc6yBsPXI/ygS3MYpVh8ixvI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUSAS3Nbjn5SPm8sfJpgm5HVfxx1YI3Rng9m
 a7emBSfQleJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFEgAKCRDm/A8cN/La
 hX01D/9jPU8wNhdj3cGkbDsDFOcUizWHJTxZQVNcuuvU3YARiZ2ZWZxxVIO2g+S1MEiVC9f1Xg+
 9cILnAENe6RqjcnmegHUjrxB7wHtVTz66G87kwhuR7kp+92TDUF0iCWSiqE7Sh+rOYKFVmmOVQh
 nxdcc3rMZSneO8iie3cV++LFLFWH5wR5rMiU57p0dr6hIBgm+k2OQZUXLvX/JeFcY4KKUg4HREA
 1BsXFzwkMcz/ZgCrVqokLqtODgO/D0cdd/58UU398+ZwDv9AZjAS7l1DBeZu1tW9o8drO8Gcsto
 IuTOrD/lNYTolBFNq0DGn7RdZo+cBrW18ZetSwDCM3F5z7/xA/+aabkyh4WAeLLg4KL9kdtJq5Y
 uk/hOesetOkgJ8gDzcjWPb+suk5mIlbslUCr6FTqomWQxb+Ufdup6FHxTjTpwrQTnpZiJQaBKCB
 QFVaCzFdtouKsSgzkkIAg6a4e7rI4PAb6eU79NX5XovlY+mk6PKINUJ3rQszHUw6/UFltA7w85w
 JA59QJVLz8sbJvgxudM1ULR7wz3qYiAMuhOlgbmBv1UQHXrvymqUKHHFRYgghQD5xIKG5tRIfOX
 5KypBuiGoS2L2Hxe3PtZX5FbiB9eqd7rthdOBIIbo0sCzjqtua+AG6niI+Nfww0xrqV3BwcWi9J
 IHxrsEzom9u9wCQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063526_100933_953EA7CC 
X-CRM114-Status: GOOD (  12.19  )
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

This is done keep the functionality when the audio reset controller
get migrated to meson-reset.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e31c1b7c9e4d..af690d3012ec 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -68,6 +68,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -84,6 +100,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static const struct meson_reset_param meson8b_param = {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
