Return-Path: <SRS0=+Jf1=LW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70403C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 12:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3111861C71
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jun 2021 12:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3111861C71
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZSg0Li3jz0Eg8lahy0qtBFk0uVI6c7dCNOCtt9X2dU=; b=yb4vSjD61Gt+c/
	uvLoS75a6gvDF/mVwFMfpCX8n7GbD06ERX2685JtdaMCU8fhw9Zeih0orbXWC2v+QWD0ddUbvE+TC
	LDi4O65480hp9XgJtxtmdA4jUgdESksyPJTnqtR4jkH/ru0icjXvjGwhVZ3VJTTKfLV30scLpfbwE
	/tPymA0JRvDwqd1ltKRas/aYaazKKEKf/BOyDmFezrHhJ1MgN9asrcoBbSTRtS0h1Y+zJl1j4ru6U
	j80Qpjq9RgRiaDxwsR970jllU6D39tjdRUqsQXr7rgKi2YOo3RbK6wIOWhwPNvAbYiZ8kM7okUCAG
	nAEuDGd3nG2lx32UQ2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxqTW-007zD2-OP; Mon, 28 Jun 2021 12:34:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxqSx-007yzP-TC
 for linux-amlogic@lists.infradead.org; Mon, 28 Jun 2021 12:34:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 o35-20020a05600c5123b02901e6a7a3266cso8671777wms.1
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jun 2021 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVU8ksdsC+XVYHG6Ii2wFQdpGHXdxNGIwH1FktLhWE0=;
 b=rMh4uZ9nvr/h9VpazM6ooNldYywwlfGegmwt2M9QV+5GtRgMf8W642d+IIOfEYw1Q+
 J+sn+ZMT6Y8eTUrE4J9I4LzpB0ghsNr/njpWf/RaQomIdctZGC5tSIKmcfodSwtqtjvO
 2paN31k8ASzujjKNWQBXmrVSH25ubIJmD4KOUr/7hGXCWY5w4HwY1ETk+TkvtNgR3T8I
 IdpHrwJhQTR6bHPkpRi4l9tjueCXP6e7ekKY/8s5zIcys/X0fXUaeHM5MEgRA74qbL1F
 mFZhV8qdRHXqK8sJZwSev8Q5s4TXh7YKx1RIMsd31X90wb+3D4r3lUT3ES7h0Tt7VT+5
 /oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVU8ksdsC+XVYHG6Ii2wFQdpGHXdxNGIwH1FktLhWE0=;
 b=dW7ICeXy2hXjDfW/cxdV6JGy/ceOzPlilgbukkR+eClAbdqoctEfFMAagcQdS5nvud
 5IJxo4xTPz8UMTL40zL0w+C3a6SGwJaYDJrPuGODSwTDZ25RcCmdyM0ygZ5haDVFLmiV
 loAk0BzzQrhLUX5DoXU+dfi28cUD8q0cl7GoICl90LrURm+4nUcxSNYVOnpV6z7UTXy4
 9kCcqgWRVwTiGA8H7/2qcficeEg5o0yDoCU7/bVj/ARTDR5UeeGgwGc1lBqtKZ7eK6pP
 5JF1X+V7JYq81JD8d665tJExVNVOz60da2lgdQl1tv1dHa+d02eEbA4RwDJV2S0UgsqG
 HrJw==
X-Gm-Message-State: AOAM530Vx1xEnqXVaQkmj/lZpq1OeyKRdHCVWjG4yk20UI2R4AMFP2tB
 XJSAr2QpGiWR9IrW1ZtqOwOqgQ==
X-Google-Smtp-Source: ABdhPJx9klALOlzLwyUXrhxNb6Gsy/pGhiZ2wKZ23hTV0TLHksTI/vl4A4xAcaMGwetVptGG6RZA6g==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr26638745wma.5.1624883658053;
 Mon, 28 Jun 2021 05:34:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:e503:e76:4043:c4f7])
 by smtp.gmail.com with ESMTPSA id
 p7sm2357334wrr.68.2021.06.28.05.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 05:34:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jgg@ziepe.ca, leon@kernel.org, m.szyprowski@samsung.com,
 robin.murphy@arm.com, ulf.hansson@linaro.org
Cc: torvalds@linux-foundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH RFC 2/2] mmc: meson-gx: use sg_copy_to/from_io instead of
 local version
Date: Mon, 28 Jun 2021 14:34:11 +0200
Message-Id: <20210628123411.119778-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628123411.119778-1-narmstrong@baylibre.com>
References: <20210628123411.119778-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3110; h=from:subject;
 bh=BPfTCGN4I6YQ41hxb4uDuKkhPMuH99t5aMh92aBorsk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBg2cGYprSmh7eQkK8b0Smn83LQZAlmMENEw7F1uZek
 2i7J5qWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYNnBmAAKCRB33NvayMhJ0d8ND/
 wN/x1wUT6Y0c6P2LcYAfrhi0cuARzL3mx00mrqR9K0vL2tmj0w6z0DnOPTVlKzgw/pm3OxT8NcazmA
 U5o8yWVoPWqACBbQgSjlMSG6nfriKiiz2cor/5DoVnTW20ELSLayjVvERcageFnffPArCIOVty+vQu
 hmBKYEzqvdOeKD4Np34Pp5nzc+m/55P2orNBrJkCC/Lo3OTCkY56we+lpHz+FGQPf//FVx/qoMtTpo
 4ohVieXNHfJteDeiuZViO+A5ZP3F7khBbT9Gz+U8t0jMZZctDy8IDDzrtk+CuBQIyDH7FUtVnjeAkL
 y6m0IFG66c9rDhwziMRCghTi/c9oybJBJf6ABz3kdS9sIsiou00OnPR//AjUX5gQPRe72j730k/bTl
 zspYNztdYjhHBHE5SK/Hh9Jm+BDZf/PtW+HdhnQKbJhHPrt6fG+U90KaBr44vLdUmeK+VoDzTAqR6c
 R3aHznEgr90iy+oSasMPAe4u/BqN7gLMwTGSB7aiNhSoWqW5cN2ytK8FV+TzxYX9QmJBXk34EMw6E6
 rVadBWdPRjTeGKl2gJFE3JkPB8BFL7fGZ2YxDCc5jk3VwySG4VLHeuHzIxkOX3snEJPwy69Tu3Cmi/
 MxxFNjWPosVhlFxsWuDXHe5kmj2e5JY4IWhojlAGn8szVazYWWCIua2ynMFA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_053420_009104_C3431570 
X-CRM114-Status: GOOD (  13.84  )
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

Use the proper sg_copy_to_io & sg_copy_from_io instead of having a local
sg_copy_buffer variant to handle the I/O mapped buffer case.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 53 +++++++--------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 3f28eb4d17fe..c13436efb414 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -746,47 +746,6 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
 	writel(start, host->regs + SD_EMMC_START);
 }
 
-/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
-static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
-				  size_t buflen, bool to_buffer)
-{
-	unsigned int sg_flags = SG_MITER_ATOMIC;
-	struct scatterlist *sgl = data->sg;
-	unsigned int nents = data->sg_len;
-	struct sg_mapping_iter miter;
-	unsigned int offset = 0;
-
-	if (to_buffer)
-		sg_flags |= SG_MITER_FROM_SG;
-	else
-		sg_flags |= SG_MITER_TO_SG;
-
-	sg_miter_start(&miter, sgl, nents, sg_flags);
-
-	while ((offset < buflen) && sg_miter_next(&miter)) {
-		unsigned int len;
-
-		len = min(miter.length, buflen - offset);
-
-		/* When dram_access_quirk, the bounce buffer is a iomem mapping */
-		if (host->dram_access_quirk) {
-			if (to_buffer)
-				memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
-			else
-				memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
-		} else {
-			if (to_buffer)
-				memcpy(host->bounce_buf + offset, miter.addr, len);
-			else
-				memcpy(miter.addr, host->bounce_buf + offset, len);
-		}
-
-		offset += len;
-	}
-
-	sg_miter_stop(&miter);
-}
-
 static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 {
 	struct meson_host *host = mmc_priv(mmc);
@@ -830,7 +789,12 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 		if (data->flags & MMC_DATA_WRITE) {
 			cmd_cfg |= CMD_CFG_DATA_WR;
 			WARN_ON(xfer_bytes > host->bounce_buf_size);
-			meson_mmc_copy_buffer(host, data, xfer_bytes, true);
+			if (host->dram_access_quirk)
+				sg_copy_to_io(data->sg, data->sg_len,
+					      host->bounce_iomem_buf, xfer_bytes);
+			else
+				sg_copy_to_buffer(data->sg, data->sg_len,
+						  host->bounce_buf, xfer_bytes);
 			dma_wmb();
 		}
 
@@ -999,7 +963,10 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	if (meson_mmc_bounce_buf_read(data)) {
 		xfer_bytes = data->blksz * data->blocks;
 		WARN_ON(xfer_bytes > host->bounce_buf_size);
-		meson_mmc_copy_buffer(host, data, xfer_bytes, false);
+		if (host->dram_access_quirk)
+			sg_copy_from_io(data->sg, data->sg_len, host->bounce_iomem_buf, xfer_bytes);
+		else
+			sg_copy_from_buffer(data->sg, data->sg_len, host->bounce_buf, xfer_bytes);
 	}
 
 	next_cmd = meson_mmc_get_next_command(cmd);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
