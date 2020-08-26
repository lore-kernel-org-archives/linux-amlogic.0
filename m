Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98ACBC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6798521741
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxKx1xwb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Md7DxAOl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpJqNogr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6798521741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBIHybrjuxEQ/jCGI5/Z77NAL1DoNH3zOzSDSiy5e5k=; b=nxKx1xwb9p94/83AWPfPALVUN3
	S41iN735hOV+d1oB5G6QNq3OHEqK1jN16jPlp4WS2Skdm+TuIPPtlGcNgGjMrejx1zY25Nz9zXLEX
	g+DjX18MJQ8EIBKeECN7jGCRpFh62uHr0PKR8yvbn0jwV8nUOpdP1GdRSnigfRZgdluGsVqtiuhFN
	B7F+95yVji1paV/HOVWhdXKjJxGSW0qrIPrS1t9j2NGpZ/xmFpxiTiofJnGtyZ47pjG0lXKgjfmFa
	AJXZOV7ZsfOnMCMZDkIZ6pqfjmHDv35lNZlBKrTMwgvh0BtYIkxTG9wg9s9kSxiJ1P+Hmwc4A0buM
	VqVdHtlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwsk-0005Al-EW; Wed, 26 Aug 2020 14:58:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnx-0002UA-6k; Wed, 26 Aug 2020 14:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jCSaLTd+mmKwDiFcTCoUhbB0Gz9IWZNmxk16QuhfYGo=; b=Md7DxAOlfjv9Z20PZqxvF14rtI
 CrymATXu9XcmIuV3D+T9ycI467cFTzRDwBWgMNveUf+CS1gRUiZM/KPrz6ftSqsJ9ZbfUwDlWJQGo
 jfQaK3Pkg6kdf4apQPaS/0rZNFDEa6aAeAnQ+MDiJ6uwzGGar+uEyHHStzMIMgvx+x6bLNm5sJWAh
 mLWIXZa33Gj+9AyfTEJrQHFFG+7+QcmDwagCFgDO5UhO5+GhRpMflqku84xvWa5W6gxQZKIlInxfV
 Ya9qEB0vzseOrere5kfHmIU3GIWSYU/eHhmXTwvQJqfOALDn4cdt8cYmuHaDo9HYA5Z9nOBBJW+zi
 HwepkT6Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnr-0001qB-5w; Wed, 26 Aug 2020 14:53:34 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 045DA2078D;
 Wed, 26 Aug 2020 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453609;
 bh=J8VgXHUUZP2pCXXB1Ijbi0zWjJmibqmGMPN7gfP7amg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QpJqNogrcmlIGvb4oSew7Gtwl5VPXjukXCXYclJ6UOVEGs06JEbRVTgRxwLro9q62
 ADpxRrdQhRq5jU8PZrmfqvjl/YGPxs25o142b1BzCgT5UUTbRXSHIdJJ8PL0kEme+y
 Fkm7I6YSAVvX2QO4Fik8Br5k9Gus3sl77yPC/kyo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 15/16] iio: light: tsl2772: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:51:52 +0200
Message-Id: <20200826145153.10444-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_155331_946878_7A158C7C 
X-CRM114-Status: GOOD (  12.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iio/light/tsl2772.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index 735399405417..00073346ad1e 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -1776,14 +1776,9 @@ static int tsl2772_probe(struct i2c_client *clientp,
 	ret = devm_regulator_bulk_get(&clientp->dev,
 				      ARRAY_SIZE(chip->supplies),
 				      chip->supplies);
-	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&clientp->dev,
-				"Failed to get regulators: %d\n",
-				ret);
-
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&clientp->dev, ret,
+				     "Failed to get regulators\n");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->supplies), chip->supplies);
 	if (ret < 0) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
