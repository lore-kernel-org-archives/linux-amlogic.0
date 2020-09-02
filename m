Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19570C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:38:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01762083B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXuYnkpp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnPu8F1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01762083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5t+Dp+dzNU0Z+56p7HoLkv/jFF+bXvx4i/CJVfIvKI=; b=iXuYnkppaIPyzh6HThAg9I4oYM
	Yn6sXw6hTBw0ao4gos8D8JVuxid8OokftLvumkhLLNjBgIn+TIkxCG1VGH14nn0oDgpbOjIV33z7/
	9E+y5g69xmuBB0WW1gZ63WrF/JUy+C7RzhHy+NIfO2aVrdmJQFypmHUCEbh0tFeOVHeu6WUPn6+72
	HPFep4NVxQwTuSw5v+9AvLlFIpik0Mquf7MiVtKGe+V07FB9gYz/P1COF1IddonFdqRdOYkd6c9Pl
	jENS7LRnji304pSp9E+OR/si/77Le+sX3d67UJ2LnnQ/pK8rQvT7x/hG+eyscM+n7vqDuEpjfOwhy
	XIrusajw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYaV-0008WV-7G; Wed, 02 Sep 2020 19:38:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYa9-0008JG-Uu; Wed, 02 Sep 2020 19:38:12 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F4B720C56;
 Wed,  2 Sep 2020 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599075488;
 bh=SQl/6OS4NtkfhoHM6x57EjikQWPjJp6R4j4puLXRYOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tnPu8F1exJo+uPphLfUjycPSojRrb5lbYJCxy0OkbDJoBIbtJlppeGGRantb0xIHK
 wZTnr9qAwMjHtzjSypym5MrBxUODR9ojVsLzCCi9AExiyKzJmWJ+LpoGJ9xmkVXtgX
 ZyNbL60PgIqbyR0miZYsDgn1IJnK+/B8f+ssAeeE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/11] mmc: sdhci-of-arasan: Simplify with dev_err_probe()
Date: Wed,  2 Sep 2020 21:36:54 +0200
Message-Id: <20200902193658.20539-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_153810_134469_49536433 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/sdhci-of-arasan.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index f186fbd016b1..3aea46db2ea7 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1543,10 +1543,9 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
 		of_node_put(node);
 
 		if (IS_ERR(sdhci_arasan->soc_ctl_base)) {
-			ret = PTR_ERR(sdhci_arasan->soc_ctl_base);
-			if (ret != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Can't get syscon: %d\n",
-					ret);
+			ret = dev_err_probe(&pdev->dev,
+					    PTR_ERR(sdhci_arasan->soc_ctl_base),
+					    "Can't get syscon\n");
 			goto err_pltfm_free;
 		}
 	}
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
