Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C79CA9EBD
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpxIDh41ljb6kSF5wIbLVMzMqt+SuymDTMl0beS1KWc=; b=cLwtaOeJ/mJdev
	lyrR3d/wWAKEDcBEtwcGGdQkipd97Ip1MyG3DTk643OfTptoakDaf8sirKWzHcFokvH3JQ9JgeZz4
	wZnYrG87CGH5dNLBJHvy3U8g/eM/FtEEVxQvRt0P1feXF0r0ALn9KhnKW2udfiqtFFSKooEh+LGfI
	Q6/lEIiHm02V8u28SrfTKmwBD2vzbUUfRH2le4tZrS8kGIG8kNhmuDM7LPlGITCPhEbj3tyNcyYMl
	+PDd+dlXruQVyMscz0A7UZkzkRMA9RqnKLAXExXlKmfJOfgSmFWG7QjE/jjvnfi/JGknYQzpckcOP
	0r9ADZ6xCKZsFEV5++Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE0F-00000006kYq-1pUw;
	Fri, 09 Oct 2026 17:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE0A-00000006kXn-3CfW;
	Fri, 09 Oct 2026 17:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FED143D63;
	Fri,  9 Oct 2026 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A578C2BCFF;
	Fri,  9 Oct 2026 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791565402;
	bh=6f1LpMsqYdXKKTwjt33dDc9gd5rIMbQHizaUf5m5oHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qdoBGbBQ6L1e7NCwyAParYqJLZUYJSqENhm8CpY+rQdxUGchaCI8+Byc/q6HnKOxN
	 TQBpQQI6pnDOoHVr3vI1NNP26A4/jP8ivMuOJg/iOoNz0YVn636zO+Y3/sDppiY+oh
	 ZdpFIkTOGg5KkMmKxMD6WxLE7fkSfJHRMniOizJwkeAyB4hApGZo0sNthiEZjzc7Do
	 W03KmJAa/2wp96p0n2omEzhZwcom1ZGXm5ob72dfN2rRoN09/U0fqa9B+qoI5kC5Ai
	 SwIv5BqUgATaBeHMi3aFDTJGCb9vIuOxjEiQ4OlKA29tVK8U42YFR6DAtry+sAlokG
	 QKNZsLgyaIG6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C34CA9EC1;
	Fri,  9 Oct 2026 17:03:22 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 17:03:00 +0000
Subject: [PATCH v3 4/4] mmc: meson-gx: report the longest busy wait the
 controller can do
MIME-Version: 1.0
Message-Id: <20261009-meson-gx-busy-timeout-v3-4-67d0db3a8328@iav.lv>
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=TPNNS8dR7nsAXzxzryfYbpCXwKfJ5cMjVjbSsbsPxOY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkn5cJP7UhOvhl3pJC5+q+JlMjNHnf9cjaBTye3+HiX3
 PK5PF24o5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEzk6B9Ghm36Cqdmbo/T2LWZ
 //H6+Y9mpC1xXH1ukvTRtjRztfV/HiQxMuzR9vGeeOt7c96zj4WrlI16ZQUUF7EFKx9U3CD583n
 vBh4A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The driver does not set max_busy_timeout, so the core takes the host
for one that can wait for busy indefinitely and sends erase and cache
flush as R1b with busy timeouts of up to 60 s and 30 s. The CMD_CFG
timeout field holds at most 32768 ms, so the controller times out first.

Report 32768 ms as max_busy_timeout. The core then sizes discards to
fit and, for a longer wait, sends R1 and polls for busy itself.

Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index abdb12e5f997..49df33bbd8e5 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1183,6 +1183,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	mmc->caps |= MMC_CAP_CMD23;
 
+	/* The longest busy wait the CMD_CFG timeout field can hold. */
+	mmc->max_busy_timeout = SD_EMMC_CMD_TIMEOUT_MAX;
+
 	if (mmc->caps & MMC_CAP_SDIO_IRQ)
 		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
 

-- 
2.43.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
