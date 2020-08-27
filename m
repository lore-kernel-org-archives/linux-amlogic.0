Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67419C433E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099EE207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZzexeFoM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="em6vO2Ow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099EE207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypbYqApnQw5zs7qCOuDkruM64r0MjJzTBZ9NR27sUBA=; b=ZzexeFoMs5HDy5fr4hrkapxFRT
	XE+pklqcCl45f+ItwPR1yk4zQ6H+aRx4MX4dnuPMuijjfS6C7/nO27ERUgoJc4Y2zrgz1i7SiiOSO
	aOWak0+zGaXiK+l33o9RR6gojNNorHb2tQac9N79PzJO0ELpcYYuCqsz/hRulcebEag3A6T+c0wtT
	x98NNsyh3L2B3uG+C53Eb4DniaSA/aa4frSozYef5hUY7xtuPf8GEouC5wDQO0uhySoiwjUUXfdub
	s2PlIlmDkz/L22aRGNlMSk+U1pIJnWX+rX2Tu/VUTrjd1kC2CL5W7o0fY4aDqjMes5GchXYGwHX2y
	lLmL+7/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNbH-0007Mq-EI; Thu, 27 Aug 2020 19:30:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNZk-0006XH-EW; Thu, 27 Aug 2020 19:28:45 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12F0122B4D;
 Thu, 27 Aug 2020 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556523;
 bh=T5xvC4E4MsMwGEUX1i7xJJFIfrS9fUuZLYOkjgS9wJs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=em6vO2OwZSB6kKK/S2ezhIGI2mfeS6rsgTIRju9Qabve7CfOTbj7wTG8NQXHDrhoB
 LJi16xE4xrJLYdEiSC9v+RYNMd4jSluKkFZBGuNEkYZ1BN/UB7qokxNWc0Fd4y6XZ+
 Tdy6RbrclSrZxz3+tGvj5p2iOfiCxYtAjmLOesFI=
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
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 12/18] iio: dac: dpot-dac: Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:36 +0200
Message-Id: <20200827192642.1725-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152844_667037_74C85E58 
X-CRM114-Status: GOOD (  15.18  )
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
 drivers/iio/dac/dpot-dac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/dac/dpot-dac.c b/drivers/iio/dac/dpot-dac.c
index be61c3b01e8b..2258535b8a42 100644
--- a/drivers/iio/dac/dpot-dac.c
+++ b/drivers/iio/dac/dpot-dac.c
@@ -183,18 +183,14 @@ static int dpot_dac_probe(struct platform_device *pdev)
 	indio_dev->num_channels = 1;
 
 	dac->vref = devm_regulator_get(dev, "vref");
-	if (IS_ERR(dac->vref)) {
-		if (PTR_ERR(dac->vref) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get vref regulator\n");
-		return PTR_ERR(dac->vref);
-	}
+	if (IS_ERR(dac->vref))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->vref),
+				     "failed to get vref regulator\n");
 
 	dac->dpot = devm_iio_channel_get(dev, "dpot");
-	if (IS_ERR(dac->dpot)) {
-		if (PTR_ERR(dac->dpot) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dpot input channel\n");
-		return PTR_ERR(dac->dpot);
-	}
+	if (IS_ERR(dac->dpot))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->dpot),
+				     "failed to get dpot input channel\n");
 
 	ret = iio_get_channel_type(dac->dpot, &type);
 	if (ret < 0)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
