Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745E4C433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:51:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4546220E65
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fd/idVTB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmM8YX57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4546220E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8795E0DFyYuJjZ7n5nG1+JCup2iv7XMoEopiVq9JzEk=; b=fd/idVTBZFoHHOTO9SSS43fTJT
	CJMm5yMOAjoGmstE3W4gZya6cVomSQUazHU08836i7dFBlJxpLdJtLmPiKqvsiEjlkxZGVmpFycK3
	HEXn9iSG5pQampfQN80ogOJKOQ7vbcmj0kQsKVIPTGUgyd84aGKcaUx8/wCBEoy1Ii3EbXsjGl2IZ
	npMqJ/dojxxC3mRli/NOhGZvWEePKnieTzOIIz0vjRHSo6tobmFC6PU0QkLD7Or2JPvWtRvCfghUQ
	jbp5RZr5wxx0AJ2E0AHSRDRRnhWAET25ZEPIQyOaIh7y0wAeqIyYxT6xVlImnDZn55I+dhC6EhRTL
	GvZM0TPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuhh-0004GG-Tb; Sat, 29 Aug 2020 06:51:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBufX-00031w-Eq; Sat, 29 Aug 2020 06:48:57 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D0CE212CC;
 Sat, 29 Aug 2020 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683734;
 bh=Ym0N3VTA2R8uEoTy0S3kC6MZCE3aShX6Tex766l0+mk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fmM8YX57p3s8ZfNbfV6nCkznu7Oni1aE4jqlFp/H6b7a1auwvuqk32QlRTG16kMUQ
 ijJyI8RGhAxMkVqcuO6jnZ1TH1cngDD6DTqh2ixkR6apiLIzv78FcjmjsdzsBMheSV
 Dd7txRnlpZusLR3xv5DLG4Ln13BFVxGpE/BBrGS0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 15/18] iio: light: tsl2772: Simplify with dev_err_probe()
Date: Sat, 29 Aug 2020 08:47:23 +0200
Message-Id: <20200829064726.26268-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_024855_656192_D1F3F6A0 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
---
 drivers/iio/light/tsl2772.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index 735399405417..d79205361dfa 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -1776,14 +1776,8 @@ static int tsl2772_probe(struct i2c_client *clientp,
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
+		return dev_err_probe(&clientp->dev, ret, "Failed to get regulators\n");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->supplies), chip->supplies);
 	if (ret < 0) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
