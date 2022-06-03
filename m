Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8277CC43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZI+zVxwI0d7thM0DS/qy8BfZ+St3MRB7W75zIHHHAU=; b=Dp5KDO70h5CNPF
	rCwTdZ8//5r3ai0XbwNK9kyBobni9N9mTX4VmXK/b0xvIeiEAFBAY4BkhpV3fjv/8qlsM337mLHAH
	KfkQdvqDzGs7ZAuH7rmxU4rkGH7sjP85Hf91GW3rGFo5pJTJyASYNptXOxKKGtM/8/995DV2SssxG
	Omggk4eTj7wGtzGR6+WDCd8pGAtMuKSrJjxVV/qny06osxg9hSZXoUXCTshUFjyqWmFkYkwIsYKm5
	8MQSMdhesF9NG2vRBjVF1qdAGT4d5HyhMbnIdCsfOQOLKuRF2Vb4WalPD8NJNExw1O5zWUYYYoqYd
	knkSwZUw+h/eRA7whPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46x-006wTP-RN; Fri, 03 Jun 2022 10:00:55 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx46F-006w3L-FI; Fri, 03 Jun 2022 10:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654250411; x=1685786411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WyWSCsSWPZ0+t965uEl8LVT+rA2XTwyfQj8wcm8FGQI=;
  b=hWb6ovYYJQNydF7cQj7aAjlj443qWgKQK26/pFaTIuApJJ1lJ+tvypII
   iB0f/XlE3HXYEZSEwAtKqHoTwYISZ5uHMhnq+H7iRPHXd2f5wL3hYe7ks
   qc44Msr+5flCDI27ZkRgk2L7sJIf1sCB2BU7u3jVqnFFUHK2pPiieUBjG
   rALK5e1FnB5QaqxRybd27YYuz4/auFQuSrd5FU20ejP7k8M/Y07ZyKqq1
   C3j/qvabUn42grDP0OTkJ8KzURt3+rVokYeSoPUAGCMTIw3A2ES+jRUhI
   h34/hrZE4GvMYTD9m+HvvBhi/oDr2RpwuSuNKdVarV5vXdvxrg8/wks4w
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="273781468"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="273781468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="681081150"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2022 03:00:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 34FD3A97; Fri,  3 Jun 2022 13:00:07 +0300 (EEST)
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
Subject: [PATCH v3 4/6] iio: adc: meson_saradc: Use devm_clk_get_optional()
Date: Fri,  3 Jun 2022 13:00:02 +0300
Message-Id: <20220603100004.70336-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_030011_611905_1A40D5D0 
X-CRM114-Status: GOOD (  12.82  )
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
v3: no changes

 drivers/iio/adc/meson_saradc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 0d9aef362c5d..337517a8e1ac 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1222,23 +1222,13 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
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
