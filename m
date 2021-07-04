Return-Path: <SRS0=Y0qX=L4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F570C07E9D
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Jul 2021 23:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC016135D
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Jul 2021 23:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAC016135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ8HPEi37SKpqA8Lo4S23vlNVhmvtr8dbLwZSo7NLCM=; b=05E1qs5dqX60WB
	S0s9Y+0iNvmFpRTB2hRrHaT/60A5gAz+lHc0sqqdtQ81Cbb6asrxDK0jzDfm0Ubq6LRi3W9IRchfC
	TLbNhkDSN6u5jj9z5tZ1mrNhm34EC3kl0SxaTWBt1poXu5eOsdUuhKwVRBrL/Ht3Tnd93vsT+0TbF
	jMuIRyD7NjELDVacDu1OcTRTwbZVBwFw/4Hg+EAFq1SZk3McB6jOh1ebwKyTLO+wYvq5CetGkkvHS
	w0R6XWKudax4JpoQ7jGCGgsuLBWLC/hKqQlQPeb/S6oqWn+aUwmUx0HdQ5GQznk4cL7muW7asS5yb
	toDB2ep2+f3G/lAWGdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0BKb-006zKd-DH; Sun, 04 Jul 2021 23:15:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BBA-006t4V-Vn; Sun, 04 Jul 2021 23:05:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22BC0613F3;
 Sun,  4 Jul 2021 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625439936;
 bh=svsv6M47GusGxdoHHlZTnG/iyReb7Lr39eIxDeEHyp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i94k7seWmvmq6MIpa32K9J+S8oOIdSjPYMwSgQ/tQiuV10iFdXUd8j3Q6zzUKjZZs
 tVPS7x0NFNwLat8PfEacsTgBhjk8glgyok4ucQYH2lPQXk3RrlVFg3zhvLkplz6Vrx
 rAdrhMz2nCxkgHnvwEj6ItmXRNIh2++bCRyronJKYeu3GhkKBQmANM+7H/+aOID6zy
 8LIl40P5iBvD9G4dNVix4Q9jA0HuFLVicq6jtpRyoWolpb9ZTEweqVjrnYVSd+9+Zg
 wATZFs+rYNWsn/bQTGutS9/HVZPTMjrKLwAufCBSjCmTyRmSIlChlKAEMZxrxRg2BB
 ysGRroKysQOmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: zpershuai <zpershuai@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 55/85] spi: meson-spicc: fix a wrong goto jump
 for avoiding memory leak.
Date: Sun,  4 Jul 2021 19:03:50 -0400
Message-Id: <20210704230420.1488358-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230420.1488358-1-sashal@kernel.org>
References: <20210704230420.1488358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160537_075892_6D3932F3 
X-CRM114-Status: UNSURE (   9.84  )
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

From: zpershuai <zpershuai@gmail.com>

[ Upstream commit 95730d5eb73170a6d225a9998c478be273598634 ]

In meson_spifc_probe function, when enable the device pclk clock is
error, it should use clk_disable_unprepare to release the core clock.

Signed-off-by: zpershuai <zpershuai@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/1623562172-22056-1-git-send-email-zpershuai@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-meson-spicc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index ecba6b4a5d85..51aef2c6e966 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -725,7 +725,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(spicc->pclk);
 	if (ret) {
 		dev_err(&pdev->dev, "pclk clock enable failed\n");
-		goto out_master;
+		goto out_core_clk;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -764,9 +764,11 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk:
-	clk_disable_unprepare(spicc->core);
 	clk_disable_unprepare(spicc->pclk);
 
+out_core_clk:
+	clk_disable_unprepare(spicc->core);
+
 out_master:
 	spi_master_put(master);
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
