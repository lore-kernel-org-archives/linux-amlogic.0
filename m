Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96844C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6776321741
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gf+PPDBF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzMRM9Oq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6776321741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8DLkhdmwsbIFhMoBdcG8WTAaSsPJwVyV9zEmEDUv0s=; b=Gf+PPDBFg2MGuC
	khGVr28JOHomrLUUlpRClXlOYkTFyVoRNnIo2+2AlNpRJtvfO8G8MQd30INY8XMMX7+Cd5LOky6On
	oJEbEG06VkVC6gQX0m1nM2MNWMOrO36jN6UjSZ829CMX7eca7QpU1aOBHmF8PqheQwC8xtXL4zoDj
	0qhFlub4WKiIT3UCq7MZ8FNV1QTEYXmA5IYUaoL8IusKKlcGQodTo1p2TST2FsQOUai8J+PuXBfCi
	HT7ep91hJe3N36jQloW6D5ClN02DQ84JelwclfRa5HSJ7Ase9a01isb6/FHr+l/Rs/JRwUAKTbtvT
	lBvShFwRxXM5RstBl9+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9DF-0005mi-QZ; Mon, 28 Jan 2019 15:52:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9DC-0005m2-Q8
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 15:52:40 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92AB62147A;
 Mon, 28 Jan 2019 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548690758;
 bh=t7OKagoTEg1jECAU8BrwOYNSjjB9Z75o2sHSWw6MdPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bzMRM9OqHVLL5c1d74cpbpisvupVBbjFGKg1clqVCGM4bfQ+0J4ikQO2aW3274kd3
 hBEvMgORr22x9V1AgROPln0T1Y5ulsPgtzf8j6UMFfR1W/y7FAiUmoXZBO4oj2K9X+
 yHQA1EY4oYS/bxak7vUmNxfAokjZARsJ5PRry74s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 184/304] mmc: meson-mx-sdio: check devm_kasprintf
 for failure
Date: Mon, 28 Jan 2019 10:41:41 -0500
Message-Id: <20190128154341.47195-184-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_075238_920310_EAF0DF8A 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Nicholas Mc Guire <hofrat@osadl.org>

[ Upstream commit b0d06f1cb0e2079a3c64fb6e27c19d9a55c723a1 ]

devm_kasprintf() may return NULL on failure of internal allocation thus
the assignments to  init.name  are not safe if not checked. On error
meson_mx_mmc_register_clks() returns negative values so -ENOMEM in the
(unlikely) failure case of devm_kasprintf() should be fine here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: ed80a13bb4c4 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/meson-mx-sdio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index abe253c262a2..ec980bda071c 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -596,6 +596,9 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
 	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
 				   "%s#fixed_factor",
 				   dev_name(host->controller_dev));
+	if (!init.name)
+		return -ENOMEM;
+
 	init.ops = &clk_fixed_factor_ops;
 	init.flags = 0;
 	init.parent_names = &clk_fixed_factor_parent;
@@ -612,6 +615,9 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
 	clk_div_parent = __clk_get_name(host->fixed_factor_clk);
 	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
 				   "%s#div", dev_name(host->controller_dev));
+	if (!init.name)
+		return -ENOMEM;
+
 	init.ops = &clk_divider_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &clk_div_parent;
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
