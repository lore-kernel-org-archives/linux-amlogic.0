Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C06C04EB8
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3880320700
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T42WLTaf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NM1hsxe2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3880320700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gr565SL9KRa0ZYGzJgRkUsEyicm2sYbl1GkwKvbWrgQ=; b=T42WLTaf8KmBEO
	GBlH22RgFOzYT/X3s3YHSqso8UaXfAi6SgtRHtjz4XjcqKUQzZUfXC0QKnMreofQcsOLxSRGv+O1g
	ER05Lz6q4XMS4hmH0kiYTFOmJ3dbkHodZfnZaDh54xLYo6P4vyqpvwAlwYUo/MZAMjqUTHlZjyz1d
	vdJF1eTWLTePMqXOKKccHxGSNpstKDj5aiNdM/b5oO2TZX3//VoBbPYSplLFAgP3uNSF2ldZ6HNO8
	rSU3WHV0kbOLmmeJXzxQ2OqfRSTrX+tzK9T/H7dpL37QmP4klhT1bolb9RMMg7kOTN7Ivo2Napan2
	vLfBBDvWZPSfOrvVgl8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvQX-0008IY-MD; Thu, 06 Dec 2018 15:18:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvQT-0008AL-J5
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 15:18:56 +0000
Received: by mail-wm1-x343.google.com with SMTP id f81so1416288wmd.4
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 07:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFuzQAonVH5LBUCWgd9kxnQqOxUMhbJSx8M/Xm/UTNE=;
 b=NM1hsxe20rGBoKEM0JaW2QIYofsAFl0EeGKtnT2NnuqP0PzMp5TF7JSaBz5V3odkY3
 pPUQ76CO16LVvd9exqW4s3b97+TfNK/ryjW27OvZSy9ZFvPVjpKhogSbJFp5ORBm/k9n
 j2raMNxBEMjSFw0SR4qLVdn1Stzi42R+3CC0WiLZDBJeJJR6zJt5nlFOVbUg/pR482Tx
 gWHDv+xH78uosEKO/46RRa3OYXlErksskp29L6ga6u2/A5BsTOr/bD5Ed9bY9HDqZLUg
 /fwB9HtbEAcuFr99Ga2DnOxcLWTVYWACBChB3eNYyZvmpY/xYZmabqLcfLIrfYO9I+1y
 0Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFuzQAonVH5LBUCWgd9kxnQqOxUMhbJSx8M/Xm/UTNE=;
 b=I8KFlERW6tX526BnSUpLIRs9RG6cEq5iJ8dZ/TyUkqDJVorf7VJueMddQ0ha5H6Gxs
 EMdc1LYZfOBLf/rzQWE1geN5c+cKYsHVwRw9JY+EZPMNDF8UW/Q7adZFGPfTPsozCGot
 uUVuzTMdbdqTdWEzpgqyeTm0bxT7hOaB6N7aWatxg8MqJfHSjwnFVh0eIlqkcI+bOrAm
 vInuSiBkn2UDcg/qvEp1HTkVOkEkLbkxbbsG7YgmS80Q6oTSeqyHx35+IED2Ex4Yklh5
 87uJR+jpsscn6EgAYvBnCYJnA25RHpnyaCXU4677EuARrlaVU03HoOAXdQ2v7KRItbtS
 NtIw==
X-Gm-Message-State: AA+aEWab3c+cj8BKp56uqZnxn0c/xxGlwwxtsC5PYFNX8yysbVBaQKJ8
 SDKZ06YMEA3bbkL8yXPCpvFGyA==
X-Google-Smtp-Source: AFSGD/WPuB8R+c4BlfluBlJMpa2T2e3fr20rQlDhnG1K/3zIfrNTc9/AYDvHDgs3Zf4DS2ZlivQvbQ==
X-Received: by 2002:a1c:e513:: with SMTP id c19mr21131061wmh.101.1544109522035; 
 Thu, 06 Dec 2018 07:18:42 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j33sm939652wre.91.2018.12.06.07.18.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:18:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [RFT PATCH 4/4] mmc: meson-gx: add signal resampling
Date: Thu,  6 Dec 2018 16:18:28 +0100
Message-Id: <20181206151828.24417-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_071853_649795_FF34F00A 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With some eMMC devices, there is still issues with the new phase
settings. Enabling signal resampling seems to solve the problem
for these.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 837bed0b8c01..c2690c1a50ff 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -66,6 +66,9 @@
 
 #define SD_EMMC_DELAY 0x4
 #define SD_EMMC_ADJUST 0x8
+#define   ADJUST_ADJ_DELAY_MASK GENMASK(21, 16)
+#define   ADJUST_DS_EN BIT(15)
+#define   ADJUST_ADJ_EN BIT(13)
 
 #define SD_EMMC_DELAY1 0x4
 #define SD_EMMC_DELAY2 0x8
@@ -143,6 +146,7 @@ struct meson_mmc_data {
 	unsigned int tx_delay_mask;
 	unsigned int rx_delay_mask;
 	unsigned int always_on;
+	unsigned int adjust;
 };
 
 struct sd_emmc_desc {
@@ -1162,7 +1166,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
 
 static void meson_mmc_cfg_init(struct meson_host *host)
 {
-	u32 cfg = 0;
+	u32 cfg = 0, adj = 0;
 
 	cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
 			  ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
@@ -1173,6 +1177,10 @@ static void meson_mmc_cfg_init(struct meson_host *host)
 	cfg |= CFG_ERR_ABORT;
 
 	writel(cfg, host->regs + SD_EMMC_CFG);
+
+	/* enable signal resampling w/o delay */
+	adj = ADJUST_ADJ_EN;
+	writel(adj, host->regs + host->data->adjust);
 }
 
 static int meson_mmc_card_busy(struct mmc_host *mmc)
@@ -1396,12 +1404,14 @@ static const struct meson_mmc_data meson_gx_data = {
 	.tx_delay_mask	= CLK_V2_TX_DELAY_MASK,
 	.rx_delay_mask	= CLK_V2_RX_DELAY_MASK,
 	.always_on	= CLK_V2_ALWAYS_ON,
+	.adjust		= SD_EMMC_ADJUST,
 };
 
 static const struct meson_mmc_data meson_axg_data = {
 	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
 	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
 	.always_on	= CLK_V3_ALWAYS_ON,
+	.adjust		= SD_EMMC_V3_ADJUST,
 };
 
 static const struct of_device_id meson_mmc_of_match[] = {
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
