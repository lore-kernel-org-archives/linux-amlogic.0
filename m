Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63DDC43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jun 2022 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQdISKoV3PsefZB5ct7Ubditt2q7Luwqgl5iHQhTMtc=; b=cBxxkn9Yq43qD+
	3I9R/dTONx7IlfImjidie9quyLe4HscehZBmmb4hsk/fwKFG0gz6D/iZPVafoF5PmqdcqOE2fy1/t
	6ToAPfud7W/K/F8C0heRIgookggkSUHoY08lh6njkjKrwBQ+dL+aeuS25xLWxNfNCBT6AQ+6eSP8/
	gWiVYK3l4YLHxoXQfg8q/srYhdVBUI57zmWCitHJlSSGEXVkZrra0/XgX6/P3pJ1+7URK3/oISfrT
	qQehKYySet7+rFiRS9KElpzI55E6FikEkx501fVrbRFmBM/7ueGnds6KVhap/Cx7OaCHoOEN5CjcV
	gcoQ08zRI97EXbnk5oXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjEK-002ytR-QR; Thu, 02 Jun 2022 11:43:08 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjDw-002yht-Oq; Thu, 02 Jun 2022 11:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654170164; x=1685706164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r59DOTKfmbD3UfLH7+rNLfWtHDf0kEEy8/nDrqC2AX0=;
  b=WY2oHUCXQ5ONfqDXi8TKPMywRsRM6tZQy1EPooTFOUzXscrdWYLdVMuF
   h+pzw1UVN7NfoGGq3/92/8IjtjFvDfgEiWO9sJpvlOXZlQMDxT7ntFQ0P
   d7PYd5zUdSzlexQBgzEOEEx61J/0xm1r7zNDOQjT/4T9cEo45y3xEh9XO
   sMfOka4080x/+D8tO0NY7Pr8f2/B75h8FFLyEtIBudc0FaQyjt8hZKhxN
   biS08mzH271hdMogNDrOhjK/qsbT+DX+WLHzrpzCLKmQ6RvD125Jbhvyg
   y3SD4AMOWB70N8Sr+G2U3qCLBtHjfqGs8Dak4z1UBk5fUpa/e6gMKli9F
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="336579825"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="336579825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="582056609"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2022 04:42:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CDC1667; Thu,  2 Jun 2022 14:42:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 2/3] iio: adc: meson_saradc: Use devm_clk_get_optional()
Date: Thu,  2 Jun 2022 14:42:40 +0300
Message-Id: <20220602114241.12601-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
References: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_044244_951558_03C5F3B9 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
v2: added tag (Martin)
 drivers/iio/adc/meson_saradc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index a2e83eca03e8..e0762103c869 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1225,23 +1225,13 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
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
