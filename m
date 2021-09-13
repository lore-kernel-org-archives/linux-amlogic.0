Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3895EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 08:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8267603E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 08:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8267603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w36SqraezqvHDM+pY5Wn2CSWcs5FNd44ERL5JfAKCNA=; b=oUdb7/16ELU3km
	XN8LWFxPNlQWUWV9FO2qJk9SStUEQC0jnxgICqTS+pKDAMFT5bvC3dpsgeUM9y5LBG5Wle48NN99R
	jfPIzGLmuAnq/ef0y42znivLYVExl9uXCX1XKHua5YqeuEeEdgbwxe3DN6svxJQ5Wfivgw5OH3WL2
	lKjxaR3cg6+mITGNUTAGrAeomM5miyHB3UFSki71iyHQiWAbkA7v6IxP5qNGTBYE0HITFHb/m5jgB
	Jzlhtfrb/ZQ3qID5rdc+qTzlkJm3peSSxX1AjuCn8EcFhAj6D7y+n94DoWF0v3TdEO0QvJ868Faqm
	RiYO1FaPiXqxF3g9ikiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPgxt-000d3K-Jk; Mon, 13 Sep 2021 08:05:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgxg-000d06-A5
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 08:05:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id x6so13171990wrv.13
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 01:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RXY1tPoSEl+8M4X5lxSarpt4hpv0pzy83yCKr/zoENA=;
 b=rNr+O/67esY0hgWf0Yp7SJb5ajXLS1aQHjGismtobxw0LiOLBEVEoJRv5cEIfZYgDQ
 6h3WJ6pJU/LRWfyvBVRDh6kwM+0INwPbDiCVGz/y5UZMzuve7jAR36220/VugQRGD1nr
 ta5WennfAkM39TwlyoZNRoBFtRZpkNbHxUtIUdCqRFWaDGF/tApqq3TE1uYKc+p9ot7G
 0AZr5MM+/74kX+WRU7sCoqNWWLJ7NuaPycXiQOSweuwEMwqlW4y6OXa3aBV71jKHSm0k
 TxNxptBp+ZbYwtPLELx8bd12b3u39FPvRltoMjB4M+tRtqMFFrI5Z1fG9+bZQx17hhB0
 Kywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RXY1tPoSEl+8M4X5lxSarpt4hpv0pzy83yCKr/zoENA=;
 b=3IQAgZQKc+PRFOOnklZy1NlTVZjnonP60cw949YFn+ZGj+fjpOv2irCTrO4kBWGdEv
 aw/3UAgu/sHTzjsR1GlVPq/WmeZ8CtlN6Edlvjkc6NVARODHjTw/g13QD6H4CHhHGcow
 T3CMCXypAVPp/zkAy6ID9o7dcD6h//EADzcne5kHbnOIJu9xqORA1rIos+ZFrkhMSNeH
 1mEBQRPYD7JN6R0U++9n9ZNBCvcNHCIyui3vTRhY7aNybrKEn0JjsXkLDW5cNJfaYbKr
 SDKZHxYJoboPwpzaKG7YQtRkGUtBBtQzwC2EwJfeSy7gMM502BbGfjl4LqqJOvqTFIig
 y2YA==
X-Gm-Message-State: AOAM531QOGDaUeaLvg3wp0TpN+z/MT853xQOghSuTrwu1+5Dp0NFejTS
 zeex4a22DY4VOCL8FRArxYqFKA==
X-Google-Smtp-Source: ABdhPJyLCvPRKQ03gErPB5bBmXZHp2i4sRtxA8fP3GXkRBSqQAEjYgMydM9st3NvlemeyZCZpyLwyw==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr10689307wrw.311.1631520305736; 
 Mon, 13 Sep 2021 01:05:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id a10sm6770449wrd.51.2021.09.13.01.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 01:05:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] mmc: meson-gx: do not use memcpy_to/fromio for
 dram-access-quirk
Date: Mon, 13 Sep 2021 10:05:04 +0200
Message-Id: <20210913080504.832521-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_010508_380281_7D36EE8E 
X-CRM114-Status: GOOD (  16.95  )
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

The memory at the end of the controller only accepts 32bit read/write
accesses, but the arm64 memcpy_to/fromio implementation only uses 64bit
(which will be split into two 32bit access) and 8bit leading to incomplete
copies to/from this memory when the buffer is not multiple of 8bytes.

Add a local copy using writel/readl accesses to make sure we use the right
memory access width.

The switch to memcpy_to/fromio was done because of 285133040e6c
("arm64: Import latest memcpy()/memmove() implementation"), but using memcpy
worked before since it mainly used 32bit memory acceses.

Fixes: 103a5348c22c ("mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 49 +++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 3f28eb4d17fe..08c0ff0bfa8b 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -746,7 +746,7 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
 	writel(start, host->regs + SD_EMMC_START);
 }
 
-/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
+/* local sg copy for dram_access_quirk */
 static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
 				  size_t buflen, bool to_buffer)
 {
@@ -764,21 +764,34 @@ static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data
 	sg_miter_start(&miter, sgl, nents, sg_flags);
 
 	while ((offset < buflen) && sg_miter_next(&miter)) {
-		unsigned int len;
+		unsigned int buf_offset = 0;
+		unsigned int len, left;
+		u32 *buf = miter.addr;
+
+		if (((unsigned long int)miter.addr % 4))
+			dev_err(host->dev, "non word aligned sg");
 
 		len = min(miter.length, buflen - offset);
 
-		/* When dram_access_quirk, the bounce buffer is a iomem mapping */
-		if (host->dram_access_quirk) {
-			if (to_buffer)
-				memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
-			else
-				memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
+		if ((len % 4))
+			dev_err(host->dev, "non word multiple sg");
+
+		left = len;
+
+		if (to_buffer) {
+			do {
+				writel(*buf++, host->bounce_iomem_buf + offset + buf_offset);
+
+				buf_offset += 4;
+				left -= 4;
+			} while (left);
 		} else {
-			if (to_buffer)
-				memcpy(host->bounce_buf + offset, miter.addr, len);
-			else
-				memcpy(miter.addr, host->bounce_buf + offset, len);
+			do {
+				*buf++ = readl(host->bounce_iomem_buf + offset + buf_offset);
+
+				buf_offset += 4;
+				left -= 4;
+			} while (left);
 		}
 
 		offset += len;
@@ -830,7 +843,11 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 		if (data->flags & MMC_DATA_WRITE) {
 			cmd_cfg |= CMD_CFG_DATA_WR;
 			WARN_ON(xfer_bytes > host->bounce_buf_size);
-			meson_mmc_copy_buffer(host, data, xfer_bytes, true);
+			if (host->dram_access_quirk)
+				meson_mmc_copy_buffer(host, data, xfer_bytes, true);
+			else
+				sg_copy_to_buffer(data->sg, data->sg_len,
+						  host->bounce_buf, xfer_bytes);
 			dma_wmb();
 		}
 
@@ -999,7 +1016,11 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	if (meson_mmc_bounce_buf_read(data)) {
 		xfer_bytes = data->blksz * data->blocks;
 		WARN_ON(xfer_bytes > host->bounce_buf_size);
-		meson_mmc_copy_buffer(host, data, xfer_bytes, false);
+		if (host->dram_access_quirk)
+			meson_mmc_copy_buffer(host, data, xfer_bytes, false);
+		else
+			sg_copy_from_buffer(data->sg, data->sg_len,
+					    host->bounce_buf, xfer_bytes);
 	}
 
 	next_cmd = meson_mmc_get_next_command(cmd);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
