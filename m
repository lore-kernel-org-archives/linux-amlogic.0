Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEF3C433E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1196822BF3
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3JWyVR8c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6Q7J25k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1196822BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSjaLQwOgJ2qDjFnoHT/l9QGlg2ymEIfCmQE0wbWjns=; b=3JWyVR8cfYnzaDNDEdt8H7VN9h
	+av+IH55wWdRTbbTTnLZJEQGUJiNFzV9xtDFOxDabmma2rTh5ZL+lSMdcz+1OFcSeyK/JSR9i8r7Y
	yozRIBtuxigK44Hodz2ZWALJUzWOna5T2dO6iNVORRKVUov8WkzzOH37U2yYoJkzhj6BAnc0oRr3e
	j9HWfrXoS/f5o+VxcJY/CvQQqWNYqA1skhmb7WFBB60nn0xNYuwlx1FIc9cy+1PD9KYLvoTFRq4n2
	QfeY6zU1mATQ7/q+7eOOzLbLnQd3cMAG3IwPqicDZ2/nwwYW1bwuOH0gpWs+00oI54l9sQYyXdgrx
	JideEYnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNYp-000665-4a; Thu, 27 Aug 2020 19:27:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNYm-00064j-5W; Thu, 27 Aug 2020 19:27:45 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF29C2087E;
 Thu, 27 Aug 2020 19:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556463;
 bh=2a8/YOtRFDrJLGOTtzPGzhFaeGOWai1RDmXhY1cRslc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z6Q7J25k98Sjltn3kKVmRfAFPnk32TztVSQ2MQ1odu7N0mYdVVDUD5jyYthEDiszv
 ERZWYggDXKSB9nvjMYM1M26IgSWnhSv5mKJhEXNXk6YBAJooLV5iK0W0D0TnJ3A7Re
 DYU737J89uHX9e1aQ68cQRFTHh06qAw7BE4KE0wk=
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
Subject: [PATCH v2 03/18] iio: adc: envelope-detector: Simplify with
 dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:27 +0200
Message-Id: <20200827192642.1725-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152744_335719_FEBF03D4 
X-CRM114-Status: GOOD (  15.51  )
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
 drivers/iio/adc/envelope-detector.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/envelope-detector.c b/drivers/iio/adc/envelope-detector.c
index 2a4fd3bb64cf..91a7be4a3f1b 100644
--- a/drivers/iio/adc/envelope-detector.c
+++ b/drivers/iio/adc/envelope-detector.c
@@ -348,11 +348,8 @@ static int envelope_detector_probe(struct platform_device *pdev)
 	indio_dev->num_channels = 1;
 
 	env->dac = devm_iio_channel_get(dev, "dac");
-	if (IS_ERR(env->dac)) {
-		if (PTR_ERR(env->dac) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dac input channel\n");
-		return PTR_ERR(env->dac);
-	}
+	if (IS_ERR(env->dac))
+		return dev_err_probe(dev, PTR_ERR(env->dac), "failed to get dac input channel\n");
 
 	env->comp_irq = platform_get_irq_byname(pdev, "comp");
 	if (env->comp_irq < 0)
@@ -360,11 +357,9 @@ static int envelope_detector_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, env->comp_irq, envelope_detector_comp_isr,
 			       0, "envelope-detector", env);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request interrupt\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request interrupt\n");
+
 	env->comp_irq_trigger = irq_get_trigger_type(env->comp_irq);
 	if (env->comp_irq_trigger & IRQF_TRIGGER_RISING)
 		env->comp_irq_trigger_inv |= IRQF_TRIGGER_FALLING;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
