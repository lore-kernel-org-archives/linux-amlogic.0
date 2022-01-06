Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E37FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jan 2022 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHIy4rHDtFt/77h4rBc4hQ2Asw7cJv46ESpbsXGgWoQ=; b=Yy+P9TXy5LSDXP
	xEKcGrZEKcqoDOCneh4BbbS0/UmSOgF8befMliNFrZJvQc8CqZxw48y/W9VTesCe+xBAhZqSkutg3
	E2OYAYKIGmYnN/+MGcv3CP8zpiWrnY1ti97iXV/8WmpuR7kurJxK9IOM//ZigJTbwKLsabl3wEWpD
	SUclr7PnPiWOyxFSG961Q7DMNLA3wVN5lWpvdmvuj6SQEpJQ+Cx3ndnUtFcAhNxcYYhH9/rGZgLYA
	3J26rvLKw/+npV44U+90rIUNk1Un7IFflGNN+yb9lxBvuUzHdrqEoiW4fFgJME18p/64J/qFw2Am0
	0xzxB0eOGa9hHDosWk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5QQI-00HOrU-La; Thu, 06 Jan 2022 10:55:10 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5QQ7-00HOp4-Uw; Thu, 06 Jan 2022 10:55:01 +0000
Received: from rd02-sz.amlogic.software (10.28.8.43) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 6 Jan 2022
 18:54:55 +0800
From: Rong Chen <rong.chen@amlogic.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <1131046452@qq.com>,
 <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <45581586@qq.com>, Rong Chen <rong.chen@amlogic.com>
Subject: [PATCH] mmc: meson: Fix usage of meson_mmc_post_req()
Date: Thu, 6 Jan 2022 18:54:53 +0800
Message-ID: <20220106105453.3875119-1-rong.chen@amlogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.43]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_025500_044524_5E68A3C7 
X-CRM114-Status: UNSURE (   9.75  )
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

To ensure the DMA moves data correctly from memory to
peripherals, DMA unmapping when the MMC request done
with calls meson_mmc_post_req().

Signed-off-by: Rong Chen <rong.chen@amlogic.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 8f36536cb1b6..6a9554ae4b1c 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -173,6 +173,7 @@ struct meson_host {
 	int irq;
 
 	bool vqmmc_enabled;
+	bool needs_pre_post_req;
 };
 
 #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
@@ -663,6 +664,8 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
 	struct meson_host *host = mmc_priv(mmc);
 
 	host->cmd = NULL;
+	if (host->needs_pre_post_req)
+		meson_mmc_post_req(mmc, mrq, 0);
 	mmc_request_done(host->mmc, mrq);
 }
 
@@ -880,7 +883,7 @@ static int meson_mmc_validate_dram_access(struct mmc_host *mmc, struct mmc_data
 static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct meson_host *host = mmc_priv(mmc);
-	bool needs_pre_post_req = mrq->data &&
+	host->needs_pre_post_req = mrq->data &&
 			!(mrq->data->host_cookie & SD_EMMC_PRE_REQ_DONE);
 
 	/*
@@ -896,22 +899,19 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 		}
 	}
 
-	if (needs_pre_post_req) {
+	if (host->needs_pre_post_req) {
 		meson_mmc_get_transfer_mode(mmc, mrq);
 		if (!meson_mmc_desc_chain_mode(mrq->data))
-			needs_pre_post_req = false;
+			host->needs_pre_post_req = false;
 	}
 
-	if (needs_pre_post_req)
+	if (host->needs_pre_post_req)
 		meson_mmc_pre_req(mmc, mrq);
 
 	/* Stop execution */
 	writel(0, host->regs + SD_EMMC_START);
 
 	meson_mmc_start_cmd(mmc, mrq->sbc ?: mrq->cmd);
-
-	if (needs_pre_post_req)
-		meson_mmc_post_req(mmc, mrq, 0);
 }
 
 static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)

base-commit: 356f3f2c5756bbb67a515760966a40fc7043cdda
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
