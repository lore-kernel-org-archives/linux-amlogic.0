Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ylx7jdBjj+o2err8ZxED+fcUeV3I9V14Ba4v9C1ClFU=; b=M8UIcD/H8E1Ffm
	n35pd73X/iLHcdCdEzF8FbywgZcZTRDeW4hwXu21l1LWbTVuwIbtCnB3NZH6FkC8NPfpm1iD9diuo
	O/f04XBg24H8+/Jr0+yElVeFt6+RQoRWrgl5/1ycd1sbTlz1nLIdbY2vrNhszEcP95S93V5ZldXAf
	Uo0IPbjRqOKdyM2ZxmhJ7D5HrGCwaLAvqEYpbzrqxfVRe+BPcvboKpAs8xUjnGZ16YPDQ/KLKNmi6
	mt0jxfHaz72QV1S1BzbO0ZDXln2XJqR77B+A8r9Xqhp1rKL5+FL2bFj7EEM7y37YTe3lM/51xwu7I
	l1CzJWfJQUs4NiEJWMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9GY-00Cgj3-Qr; Tue, 31 May 2022 21:19:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9GN-00Cgea-P0; Tue, 31 May 2022 21:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654031931; x=1685567931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5tfAedSxkAxJN42+QB7AqeZ7v7zfuJl7ab7/G0q0y9Y=;
  b=Pj9aSBbwqRPLimh8EgY8dgTOqPBo8IG9q4iKCTrMaYlfuVTHYnJaVNMa
   8Df0Mg8s57Gjt+C1l6SFJVaNGLjjROy+OqmLcNcjTTmH6H/fBsSDeQCJ8
   zuzatz5ItVvDkvtbB74mKF4p8fazmTm28SYDuHb2Qio+Ybm877fEcTpLr
   6l30zBv17C4ka7x4SXMFesLeuTpnSQfgUzkFXnBP3Ct5DQNNe226zmUcJ
   59QXwID1jr81L+n2A9Ns6m+DbxJzZAA3NS/FK0WNYKGonENlcIXA9POHK
   ILSKo4D7fm71kx7rnnNXDxDynNwc9jN+wP0BRAGSuTRfZK3nRBjzSqR7E
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275394332"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="275394332"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 14:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="529771625"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2022 14:18:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F2251D2; Wed,  1 Jun 2022 00:18:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/3] iio: adc: meson_saradc: Use devm_clk_get_optional()
Date: Wed,  1 Jun 2022 00:18:41 +0300
Message-Id: <20220531211842.71998-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com>
References: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_141852_037853_A209A9FA 
X-CRM114-Status: GOOD (  11.66  )
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

Replace open coded variants of devm_clk_get_optional().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iio/adc/meson_saradc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index c2abbfc1396c..2fa384e59d28 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1224,23 +1224,13 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->core_clk),
 				     "failed to get core clk\n");
 
-	priv->adc_clk = devm_clk_get(&pdev->dev, "adc_clk");
-	if (IS_ERR(priv->adc_clk)) {
-		if (PTR_ERR(priv->adc_clk) == -ENOENT)
-			priv->adc_clk = NULL;
-		else
-			return dev_err_probe(&pdev->dev, PTR_ERR(priv->adc_clk),
-					     "failed to get adc clk\n");
-	}
+	priv->adc_clk = devm_clk_get_optional(dev, "adc_clk");
+	if (IS_ERR(priv->adc_clk))
+		return dev_err_probe(dev, PTR_ERR(priv->adc_clk), "failed to get adc clk\n");
 
-	priv->adc_sel_clk = devm_clk_get(&pdev->dev, "adc_sel");
-	if (IS_ERR(priv->adc_sel_clk)) {
-		if (PTR_ERR(priv->adc_sel_clk) == -ENOENT)
-			priv->adc_sel_clk = NULL;
-		else
-			return dev_err_probe(&pdev->dev, PTR_ERR(priv->adc_sel_clk),
-					     "failed to get adc_sel clk\n");
-	}
+	priv->adc_sel_clk = devm_clk_get_optional(dev, "adc_sel");
+	if (IS_ERR(priv->adc_sel_clk))
+		return dev_err_probe(dev, PTR_ERR(priv->adc_sel_clk), "failed to get adc_sel clk\n");
 
 	/* on pre-GXBB SoCs the SAR ADC itself provides the ADC clock: */
 	if (!priv->adc_clk) {
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
