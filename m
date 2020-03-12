Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3608AC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0A82067C
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpUdALeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0A82067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=UJUYszJ5wBFyGyZC9gELMbHN+UdvMjZPfs13189o2WE=; b=ZpU
	dALeJQca9rOajtlYzP8Pvk74ZYYOvlSi2I6+ge2jr6Anc8qPtsKY94OrY31pyTWQT2RU6w0zcWefG
	Otn8fF3RGUlSKgV0WWNu/NTt61hyMXr9KKAYq81ifD4NuKfL5G5FSdg8IcF7v3bkDU9WC5Ny3/+oi
	wAeC2Sx2NyGHbFst1e/rUnlj1bEzbAgPUNZDO+7l+dtN2XF5Hjuk2Kz7ePanWZZbBUgCcSFBSG7KF
	7HWi4IbHFZmEui04nv7gDGEvUDlh8Pnh5Cz71dI90YKFRwr8hWd95jz96xUsjoJNewxMBl/IkV8YX
	yyFjhgVoKaUIxFa3sF7AGMnkanPZOBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCRq0-00074V-0M; Thu, 12 Mar 2020 17:41:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCRnx-0003pe-MH; Thu, 12 Mar 2020 17:39:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 298F530E;
 Thu, 12 Mar 2020 10:39:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35763F6CF;
 Thu, 12 Mar 2020 10:39:32 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:39:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Applied "spi: meson-spicc: remove unused variables" to the spi tree
In-Reply-To: <20200312133131.26430-2-narmstrong@baylibre.com>
Message-Id: <applied-20200312133131.26430-2-narmstrong@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_103933_799447_6ABE93DF 
X-CRM114-Status: GOOD (  12.31  )
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

   spi: meson-spicc: remove unused variables

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

From b9dfb20eed5c7dab37d6267a985dbe16df9e4293 Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 12 Mar 2020 14:31:23 +0100
Subject: [PATCH] spi: meson-spicc: remove unused variables

Remove unused variables from spicc data struct.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20200312133131.26430-2-narmstrong@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-meson-spicc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 7f5680fe2568..8425e5ae1273 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -130,9 +130,7 @@ struct meson_spicc_device {
 	u8				*rx_buf;
 	unsigned int			bytes_per_word;
 	unsigned long			tx_remain;
-	unsigned long			txb_remain;
 	unsigned long			rx_remain;
-	unsigned long			rxb_remain;
 	unsigned long			xfer_remain;
 	bool				is_burst_end;
 	bool				is_last_burst;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
