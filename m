Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D77DC4741F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6FF72076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LhSGm3ea";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QE5wCYvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6FF72076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dEWY278crX9NHYTaica/76wq1OevnBg8k57PtNfvYSg=; b=LhSGm3eaoH8Mopoo3cjM6ufZp
	ZKPAbXN7PY4de8IMUazYXnsZw6UAj5Z5STDbvDxvSgdz2URiwwEqMZW2dvQUophurwB5YcqqRNNXd
	osh7i/x85o3HyP+R+Wu4mt65iADTlTUImu7bm+M0R5dpiyt7BF1shqL4Mv4ZxC9tFQPkP8QhImZGW
	UHXRaDl0zRhDn5oaNht+1oYUVkUluLMVIAmnjYhtEpymP5T9OgJMXvWc3/IjHUoVcVJoWmE79Dx+t
	vwiXmJnRE6gOvg/GFBQOO4XV/uzwtTM7vcndoQylHyEJ8t49kYtIop6twFgDQjhXg3KiVLggWM1Da
	0ujaxCMWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Uo-0000Lf-83; Wed, 07 Oct 2020 08:08:22 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Uf-0000Gz-3z
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 08:08:16 +0000
Received: by mail-ed1-x542.google.com with SMTP id 33so1161369edq.13
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9BB7E4iGMc/0xci5wMPtXbQzs5kI/9VbBMLqTlLSE8=;
 b=QE5wCYvx8kvJMvIBqPW3Xjj5S68geqga477qq7uif1HkyevhmAtFMOt/buaJVFfpEH
 jiijKBMvzIka7KNi7BK8/tuFS6+UEIjCz9fz7+Ypbka0repb8XQcAI5hXq6nDoDXhU2z
 tx0IDqrog0nbwdZ2tKtSI05lEYppygDek+j8xKBsG1lX7hEhXlVAb8G6A7QzqDayzsj+
 G+LFf+r8Qsiy1PGjAifRuvdNj8l2eVQW5lgd+i+bfJAc5aq8whixyfoXHtzRKvz8gy3T
 o8eefN8FkN6922LvF5PWy+Xu+VDfrvq0YyNM9t210jFSd2lH0yciRdcWJAmjuGH/q3hm
 QdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9BB7E4iGMc/0xci5wMPtXbQzs5kI/9VbBMLqTlLSE8=;
 b=QkRshUvArM2S+bXmgddph0TexYDhL4ZjK1tYw1ozMVg1vvkGzs6DUN6CN+sH0tZB/n
 08qZqkyN057rX+gOEanv0PQcdtzKU3iwqpFCTYZJvNWikygRR6GZLYrtg8IKX8jTjz7t
 KJY+2gfQmy/u7FZk2RcUfv55uXOUzP7UIDHT3NoZ5q3whxjGrXIN6kYiAVPPbIKBUPVh
 Bk7PSBHVVeIrcC/OsZF3rhE0KggiZ1r8ljqRHkMAFrc/J6cFlV9MZpS7X1fpI/dzcf0R
 KW7mffJVrgb+ca5NhjTv5nFAyxRCQcCvTYJVX2DMbcPwhRb2UKyVttwdjUOhiiQLrTLt
 FrqA==
X-Gm-Message-State: AOAM530F7yjyvFIQb1pDUYbOlZfkRK+OVZQ/yc8FT2hHcljSpPX9HwcD
 HXRfKybGux4ADIWkT8EzVVqcQA==
X-Google-Smtp-Source: ABdhPJypq5afOnV5h1ZSBHO4fnEsWDyM831RAyRh/f+UBTgfm4W7zKgvvkr6dtv2ORMIalObWbBJLQ==
X-Received: by 2002:a05:6402:1612:: with SMTP id
 f18mr2253541edv.166.1602058092223; 
 Wed, 07 Oct 2020 01:08:12 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:08:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wolfram Sang <wsa@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/3] i2c: meson: fixup rate calculation with filter delay
Date: Wed,  7 Oct 2020 10:07:51 +0200
Message-Id: <20201007080751.1259442-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007080751.1259442-1-jbrunet@baylibre.com>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_040813_264537_D5D02C4F 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-i2c@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Nicolas Belin <nbelin@baylibre.com>

Apparently, 15 cycles of the peripheral clock are used by the controller
for sampling and filtering. Because this was not known before, the rate
calculation is slightly off.

Clean up and fix the calculation taking this filtering delay into account.

Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index e7ec2ab2a220..ef73a42577cc 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -34,10 +34,8 @@
 #define REG_CTRL_ACK_IGNORE	BIT(1)
 #define REG_CTRL_STATUS		BIT(2)
 #define REG_CTRL_ERROR		BIT(3)
-#define REG_CTRL_CLKDIV_SHIFT	12
-#define REG_CTRL_CLKDIV_MASK	GENMASK(21, 12)
-#define REG_CTRL_CLKDIVEXT_SHIFT 28
-#define REG_CTRL_CLKDIVEXT_MASK	GENMASK(29, 28)
+#define REG_CTRL_CLKDIV		GENMASK(21, 12)
+#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
 
 #define REG_SLV_ADDR		GENMASK(7, 0)
 #define REG_SLV_SDA_FILTER	GENMASK(10, 8)
@@ -46,6 +44,7 @@
 #define REG_SLV_SCL_LOW_EN	BIT(28)
 
 #define I2C_TIMEOUT_MS		500
+#define FILTER_DELAY		15
 
 enum {
 	TOKEN_END = 0,
@@ -140,19 +139,21 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 	unsigned long clk_rate = clk_get_rate(i2c->clk);
 	unsigned int div;
 
-	div = DIV_ROUND_UP(clk_rate, freq * i2c->data->div_factor);
+	div = DIV_ROUND_UP(clk_rate, freq);
+	div -= FILTER_DELAY;
+	div = DIV_ROUND_UP(div, i2c->data->div_factor);
 
 	/* clock divider has 12 bits */
-	if (div >= (1 << 12)) {
+	if (div > GENMASK(11, 0)) {
 		dev_err(i2c->dev, "requested bus frequency too low\n");
-		div = (1 << 12) - 1;
+		div = GENMASK(11, 0);
 	}
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
-			   (div & GENMASK(9, 0)) << REG_CTRL_CLKDIV_SHIFT);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
+			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
-			   (div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
 
 	/* Disable HIGH/LOW mode */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
