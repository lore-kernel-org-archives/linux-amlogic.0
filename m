Return-Path: <SRS0=Y0qX=L4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D63C07E9A
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Jul 2021 23:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF0A613D0
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Jul 2021 23:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF0A613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALDlNL24sbihB6RkHUXt1za11WJM7rOQPg31mPog/wM=; b=HjD1t/PPnXHIBv
	rIL4p+I/P/vuNYN+iHCtFSqACQ7G5Et/0wxmJhYOrzsB9cikLlTBYoXus64wOHC6nYT5vcw4cHblA
	qIr4Wsut9/yTF72czL6Ief3namfPS5AGrYegiACBuOMXfoFj8zsFLO01JpGSlF430tXrihpK8tLKk
	LwpSEtvWSApbm8H63DYzES5VwPJ1GO+1lLbLj6NM1ALREY0oAny64OMAEJ3PCt7xTI2HP6kvZurCm
	GLFH3aZLry08+zt2bf1XXMQXT892WypVYrZFnqwzogA0pZPPRU/t97l2AN2jql3ZuPLNyYcKlHae0
	LZ59/QizAyiUfs5rokNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0BtU-007GFD-Vq; Sun, 04 Jul 2021 23:51:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BEc-006vrA-F4; Sun, 04 Jul 2021 23:09:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DE1461973;
 Sun,  4 Jul 2021 23:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440150;
 bh=FWdpgeLZjTV3yUDS9DmJf5529C3/nxBDlPw9YGo3gao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W7zNWvIxumvZ08vQaMrHxATGEh0ww9QpXfzs3wuYGJlJfFTHDmwS3y4LHOAKCX93V
 CmeEHkjVmdPywBDQe96dOdobWLQp0cnaQYwMSssVvVCaxIITuBAlcyAcEzO8rFKCvA
 kgp2V6aJ7N8q+QTPFK7+a8VHhvXeh3eYYst5gg+UAzDi1pcWh/VY+e3Y27MouWpLTu
 OdprazkyvO7Xn4C5DuIApBFoVw4qO3zy3/9QY1M4u8DyFe0wVQ/7gOX8XywEJ8tU9k
 7n08StqAITnQQwrGm2sjsuhLj+aTSsVTVxlU8RCLr6lH1kph71ytBzdBPeGsFIHZ78
 e5EqSwyBmOkrw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: zpershuai <zpershuai@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 49/70] spi: meson-spicc: fix memory leak in
 meson_spicc_probe
Date: Sun,  4 Jul 2021 19:07:42 -0400
Message-Id: <20210704230804.1490078-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160910_537617_A95286AC 
X-CRM114-Status: GOOD (  10.54  )
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

[ Upstream commit b2d501c13470409ee7613855b17e5e5ec4111e1c ]

when meson_spicc_clk_init returns failed, it should goto the
out_clk label.

Signed-off-by: zpershuai <zpershuai@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/1623562156-21995-1-git-send-email-zpershuai@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-meson-spicc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 51aef2c6e966..b2c4621db34d 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -752,7 +752,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = meson_spicc_clk_init(spicc);
 	if (ret) {
 		dev_err(&pdev->dev, "clock registration failed\n");
-		goto out_master;
+		goto out_clk;
 	}
 
 	ret = devm_spi_register_master(&pdev->dev, master);
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
