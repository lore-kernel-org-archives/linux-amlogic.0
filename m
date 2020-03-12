Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBA9C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB4A2067C
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TvNXjKe4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB4A2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=aV5+qLJ8W+5OFVLpsV5F6KwlvJ2WpZ3B2ZUMtbalH9U=; b=TvN
	XjKe4le3Zovu9gdNTJbhXxGjygaEuMYZOiB132Gr+Bi9rodD9eF5tIauUNvag3fM6vT9CYPvATFbD
	2brmXxotjdBLRga46pKL36WHZEbzIJFTEiHF1Vm/BTvJVYMUWEUfOt5rQjHTfE+t5GhNqac2XJv1d
	eG5oQtbm13QiwqlJVRJDi+qTkgycljmz+/zjhrtOQGVSKj6jN9659DJ1dbQD2XvOokyXMp3WZAMrs
	VpdxESax2lAO3G7WIF/RJNVyTMFQG6GubnwXZa+M/KNY0+yRik1GzzkQ9RQz+aRzMDi/Ribyczy7G
	fli8PGanfrfteaX+paxLtPnHdO0UrTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCRom-0005sq-4S; Thu, 12 Mar 2020 17:40:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCRng-0003ZJ-OR; Thu, 12 Mar 2020 17:39:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79E0530E;
 Thu, 12 Mar 2020 10:39:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F293F3F6CF;
 Thu, 12 Mar 2020 10:39:14 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:39:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Applied "spi: meson-spicc: add min sclk for each compatible" to the
 spi tree
In-Reply-To: <20200312133131.26430-6-narmstrong@baylibre.com>
Message-Id: <applied-20200312133131.26430-6-narmstrong@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_103916_955378_85FF1FE0 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: linux-amlogic@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   spi: meson-spicc: add min sclk for each compatible

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8791068dab979819e01f41736953b9b2e462867b Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 12 Mar 2020 14:31:27 +0100
Subject: [PATCH] spi: meson-spicc: add min sclk for each compatible

The G12A SPICC controller variant takes the source clock from a specific
clock instead of the bus clock.
The minimal clock calculus won't work with the G12A support, thus add the
minimal supported clock for each variant and pass this to the SPI core.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20200312133131.26430-6-narmstrong@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-meson-spicc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 710b4e780daa..b5bd3a897e8f 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -132,6 +132,7 @@
 
 struct meson_spicc_data {
 	unsigned int			max_speed_hz;
+	unsigned int			min_speed_hz;
 	bool				has_oen;
 	bool				has_enhance_clk_div;
 };
@@ -685,7 +686,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 				     SPI_BPW_MASK(16) |
 				     SPI_BPW_MASK(8);
 	master->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX);
-	master->min_speed_hz = rate >> 9;
+	master->min_speed_hz = spicc->data->min_speed_hz;
 	master->setup = meson_spicc_setup;
 	master->cleanup = meson_spicc_cleanup;
 	master->prepare_message = meson_spicc_prepare_message;
@@ -736,10 +737,12 @@ static int meson_spicc_remove(struct platform_device *pdev)
 
 static const struct meson_spicc_data meson_spicc_gx_data = {
 	.max_speed_hz		= 30000000,
+	.min_speed_hz		= 325000,
 };
 
 static const struct meson_spicc_data meson_spicc_axg_data = {
 	.max_speed_hz		= 80000000,
+	.min_speed_hz		= 325000,
 	.has_oen		= true,
 	.has_enhance_clk_div	= true,
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
