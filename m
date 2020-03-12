Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4BBC10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30EF206E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EjNd+x8x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YulRMKVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30EF206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVdiN3Dwr/Wnpc/zOngkgvj/3cfqrj8wm4r+Bh9hN0Q=; b=EjNd+x8xMEktlm
	FR71I7+Lh8kX9u2pinJk6RRJO6kuz6DKu5uy09dbaJw6nkYnNU4XZwjxQdp3SfdN6KBcoJFwlMOIW
	h6oYLr/Jpmux+EVhe/ytJ/NmKshjJGrzfOs4qxEHVObWH45KPpMg2T68IuCTqvCbaehYwgLW6+GX/
	y3UZyeS4Y80TdC2qMWWbJsNgggiMaUgcON4Xz3aYPvlZBQP9FrEqJ/hvCpaJStb2venmu9bySPrdg
	NeSR1YDMXFDjJpIwNYA4IiS1XvzgKFNovdA71bO3gRMgZE6VRPHjVSEX9morF4uc6oYBRBTptwF+Y
	7f9xF4fBbbZ27CrL6iWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCNxD-0004hJ-M4; Thu, 12 Mar 2020 13:32:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNw4-0003TJ-57
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 13:31:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id 11so6106789wmo.2
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSxwbrvkTLQhCnvQXX1HjNSZff7G2HPoi6i2nBxHFtc=;
 b=YulRMKVUILMBNhdYGtTrxVJ+7BW7AY4paeNn1T/pfY9D9nSoD8fqGuY045sjsbxU5h
 hQ0pixA54oUGhTR0jYQB9S5danxRYtlzUqJyDZYZsoYUx0X+efvsf0OdsCg/D1aImZRN
 8axNItGQjFv2xvXC8Z2fQbZQOC4Feqijr7BfKcZpHm6nbZIhiZ8Xuhyg4zw3/6UbsuAo
 KLt30d5dY5soGBfrQOsshd8nQwIvKOsYdwNkij/OGVux17s15SGHzo8bB+irZX4Mbg79
 8GW8UhcUsBjWj1fWPAgTmfugsrl2NLfjlNX69Zxf2MqaT58r5tU81vWCQ+QNFl5x36Uj
 1tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSxwbrvkTLQhCnvQXX1HjNSZff7G2HPoi6i2nBxHFtc=;
 b=cxry+g2BlnOy9vlxMKRNn9jNZgantup6heQPaHhrGAsyw4HgaFXEmcJ+rVwcKwIhMG
 UDWMJ3fcfKv9ygF8RuJyaBeZsjml8JwrGzyK5sIpD9PQEC4UBHuYuku9gmYV+6y4cK+c
 Jn3eVtkij9PzLf0yKmkpRV2dkTn6ZeqfOyjXEw+atu2VrhiZv2hgDESWKgwwlkJXlunh
 /x2+U0zpJyiapbgmEBK9oIDU/nW+9LC0jTNcd0KlB7XfQjdlrVoMlbrs/VYiaMb3FBiP
 9CfUTac5nWuN94vunSEqkMhrEZO8aI2S4Z66dbsAyyhMVPWmnfK4CiJ+GmpGJ+rQwSFk
 h4rA==
X-Gm-Message-State: ANhLgQ2XuEqUqNXcLE09WAd2Nghm5BBgBAnTz5GrrTsCyxQG6EK2xMvx
 CE/yH+TZhhe7wOflC3exDQpnDQ==
X-Google-Smtp-Source: ADFU+vuiXvA7ItIqTn6tHh9dRy8ISscfNKEPxJAkBuAl1GcZMGcUCuRRIWBWKC/j6F3R7b2fLXVfSA==
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr4854913wmd.101.1584019898516; 
 Thu, 12 Mar 2020 06:31:38 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm12242885wmi.27.2020.03.12.06.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:31:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH 4/9] spi: meson-spicc: support max 80MHz clock
Date: Thu, 12 Mar 2020 14:31:26 +0100
Message-Id: <20200312133131.26430-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200312133131.26430-1-narmstrong@baylibre.com>
References: <20200312133131.26430-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_063140_276220_71255CD5 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sunny Luo <sunny.luo@amlogic.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SPICC controller in Meson-AXG is capable of running at 80M clock.
The ASIC IP is improved and the clock is actually running higher than
previous old SoCs.

Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index bd434d9055d9..710b4e780daa 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -35,7 +35,6 @@
  *   to have a CS go down over the full transfer
  */
 
-#define SPICC_MAX_FREQ	30000000
 #define SPICC_MAX_BURST	128
 
 /* Register Map */
@@ -132,6 +131,7 @@
 #define SPICC_FIFO_HALF 10
 
 struct meson_spicc_data {
+	unsigned int			max_speed_hz;
 	bool				has_oen;
 	bool				has_enhance_clk_div;
 };
@@ -693,11 +693,9 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	master->transfer_one = meson_spicc_transfer_one;
 	master->use_gpio_descriptors = true;
 
-	/* Setup max rate according to the Meson GX datasheet */
-	if ((rate >> 2) > SPICC_MAX_FREQ)
-		master->max_speed_hz = SPICC_MAX_FREQ;
-	else
-		master->max_speed_hz = rate >> 2;
+	/* Setup max rate according to the Meson datasheet */
+	master->max_speed_hz = min_t(unsigned int, rate >> 1,
+				     spicc->data->max_speed_hz);
 
 	meson_spicc_oen_enable(spicc);
 
@@ -737,9 +735,11 @@ static int meson_spicc_remove(struct platform_device *pdev)
 }
 
 static const struct meson_spicc_data meson_spicc_gx_data = {
+	.max_speed_hz		= 30000000,
 };
 
 static const struct meson_spicc_data meson_spicc_axg_data = {
+	.max_speed_hz		= 80000000,
 	.has_oen		= true,
 	.has_enhance_clk_div	= true,
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
