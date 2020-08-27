Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEACC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F8A22D2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0U6LMcv1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrqYvR2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F8A22D2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqMb+1HrfQM3SMDJ8EIvObjdJykYkYDEQjbuiv/wyhI=; b=0U6LMcv1lERq6HhJrT7J21SX9H
	V734o4+opspOakMPfyAG6SPS+/KyGYqCvAcVSzPot+dj80zch6T+Akblylc8gicNxr2AJQQy1toPV
	GnXwDkF4Nqm58tJDGOnmVlwzhD+oWFkY3T8arOngqsRln4MOUQCHftWuguG60Ml6XtW2oztwzt1x4
	wEdwIk8tTLrHaR0X1YAon0XB464GIzv369nBTn6S3mGz34P8oaVJIF0JIqE3jIqgL3t+WRFyqcqgh
	/e9jU5ras0oW1UTfNTfqB1taAKBPUDlDocej9i/XRG4DwmxiihpjzlazkMdhvKV2cGJkfbjNFF4Ca
	VSw/vfFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNZO-0006MR-9x; Thu, 27 Aug 2020 19:28:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNYz-0006An-30; Thu, 27 Aug 2020 19:27:59 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8553D22B4D;
 Thu, 27 Aug 2020 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556476;
 bh=egvRrbp3SIvUqDFHa2E5ojGok/WhL9H00xW2YWNmE9c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YrqYvR2AFqNkPyVJe8qYG4DwCpi44gE0L+dWdiTNupGsESrLiEdUQ1/dg/fGiy2cE
 aE4M1q2MnNgR1L12x9H27RkOAvWZKejkBXU8LcGWsGJAXulas6ZLM8WZ9HHczVpBtL
 PywOhp7u4UvaZ2baefJuOq1Gta7E5W9ikO03GgvQ=
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
Subject: [PATCH v2 05/18] iio: adc: ltc2497: Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:29 +0200
Message-Id: <20200827192642.1725-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152757_248445_CA1802B3 
X-CRM114-Status: GOOD (  15.28  )
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

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
---
 drivers/iio/adc/ltc2497-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-core.c
index 9b8fd9c32364..d337ed96bbb0 100644
--- a/drivers/iio/adc/ltc2497-core.c
+++ b/drivers/iio/adc/ltc2497-core.c
@@ -180,13 +180,8 @@ int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
 		return ret;
 
 	ddata->ref = devm_regulator_get(dev, "vref");
-	if (IS_ERR(ddata->ref)) {
-		if (PTR_ERR(ddata->ref) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vref regulator: %pe\n",
-				ddata->ref);
-
-		return PTR_ERR(ddata->ref);
-	}
+	if (IS_ERR(ddata->ref))
+		return dev_err_probe(dev, PTR_ERR(ddata->ref), "Failed to get vref regulator\n");
 
 	ret = regulator_enable(ddata->ref);
 	if (ret < 0) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
