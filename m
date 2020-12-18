Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B1C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 07:54:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E4A23A1E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 07:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E4A23A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N4exlkOcAciKWoTZ7tFKNyLDvynFUfikeuycuvxr3rw=; b=tFbQv02iAOZPialZ4Kf6Ae+8/b
	7NY670+YsA1Zec33b8OZWt/5nwK1R8sBLmQJmEpWAHtHGf6pfjXufYMwQPxIw1AuxatpDb53TtYco
	kKvvUyfcs2C/ZGgyZVto4rBSFPTKJr1+Vk/CaG7ZucPOkdeGqeEW5nRAvPzVbFTxw/ARL/U+o/qPh
	DITr/TgtuPYL9TTrCzomjJ/IByqZJvlAflSyqh/JXMUlGZCpKhvE0dZmsdJCYy+eUMrlUWCCIDBr4
	3/sdBKbpG+ZahdOCZ4ipPjJI4HOwDg3Z5w3KdfBLV9i0DGQKjJbTkl4oYDuDt51JR+tGSV90oTdY2
	9JMFHz/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqAaO-0003Wh-S2; Fri, 18 Dec 2020 07:54:00 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqAaM-0003WD-HH
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 07:53:59 +0000
Received: by mail-oi1-x230.google.com with SMTP id s75so1983693oih.1
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Dec 2020 23:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5MgUC7paGHE4/Tl28P/ns0cXKXhaheAa+ameYMg2Gs=;
 b=pUo9UJvb0kipZ84NNhdDxR9A4qx6b0JX53ykBFpB0AAchDKYDv9aQf3jWiT+SKPMYG
 FXsIdjRJXcKkA22d6R3BXVryDzgmYeCaW7PEpstmuJ5GRkIjmc/2xCVoWrHRmsIWcdQ6
 sGPJX3x4d9wn7lUGP4zwnb+eidetFQBl/xvypy01+GG6yiU5KALxOViwDnsxKQ86yvxo
 x7IqaeJoCLWtHhmZjaelJ7C530fuLWykLsJ+UGyXublyeY/ede5r2ikds/sNRTyh4XlI
 yZ0QPNF8x8wRbB31gh62GdPtB8NVqoKQ1SRYfrltXiGduH4PNk1Vm+sV3uVe4NUlUzaD
 lAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5MgUC7paGHE4/Tl28P/ns0cXKXhaheAa+ameYMg2Gs=;
 b=q/I8tVGhuQt6VzOyVuhzOKzT4N98m2cS3dgEPNGWZPw40Gb0Ke3SGamDl7pQCAVZla
 znp0ZG3Yb/PQd/X85M+ARwTcT0jtKRS2wO8xERiQXuU/Uvh2Oeoso+jdLvQs+4L30FTM
 950QPWAwcB/TE7N3iDL5b3ziHOQPhaKkgerYRFlSW9owkGL+MudKssiqPY1CqpwIrfWC
 GqFaLW4TXYbKaw54wjrWq34YClqR5GW/MR+hGTSYenr6Wo35vRbDhJ1p6uOcYYM8Q0Df
 Uj2Ey0bHT3gKFVXqzGpL1KHXhHN1qwCcTFYiAqDNX9aBZ3CwPbmAtbQL5MDhjlXXR/kD
 jIqQ==
X-Gm-Message-State: AOAM530gu0efE/RAAEQlsnkKpmOs7wcPsLXiE1QGvDWBYPU/44KGaX7h
 LePT8ipZArRt8GavzkzJqZDWgM5N1ZGZyiYr
X-Google-Smtp-Source: ABdhPJxUCbV4sKygbvNBCtFvaKwRR6uZavTE8HCLzFIree5M8LpYcK2DrYTvuviROegeHH8owUmi5w==
X-Received: by 2002:a05:6808:7d0:: with SMTP id
 f16mr1955164oij.109.1608278033799; 
 Thu, 17 Dec 2020 23:53:53 -0800 (PST)
Received: from Dmitriis-MBP-16.attlocal.net
 ([2600:1700:5ae1:8180:69ca:e94d:4a3e:3e73])
 by smtp.googlemail.com with ESMTPSA id g3sm1376615ooi.28.2020.12.17.23.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 23:53:53 -0800 (PST)
From: Dmitry Lebed <lebed.dmitry@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] mmc: meson-gx: check for scatterlist size alignment in block
 mode
Date: Thu, 17 Dec 2020 23:53:12 -0800
Message-Id: <20201218075312.67338-1-lebed.dmitry@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_025358_635204_1940B3C3 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: martin.blumenstingl@googlemail.com, Dmitry Lebed <lebed.dmitry@gmail.com>,
 linux-mmc@vger.kernel.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable SGDMA support for SD_IO_RW_EXTENDED and add proper check
for scatterlist size alignment in block mode.

According to documentation, in SDIO block mode meson-gx DMA could
only handle buffers with sizes that are multiples of SDIO block size.

Some SDIO drivers like brcmfmac use scatterlist API, but do not enforce
proper scatterlist buffer size alignemnt, this looks like a root cause
of non-working CMD53.

Some minor style fixes.

Signed-off-by: Dmitry Lebed <lebed.dmitry@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 37 ++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 13f6a2c0ed04..eb6c02bc4a02 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -227,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	struct mmc_data *data = mrq->data;
 	struct scatterlist *sg;
 	int i;
-	bool use_desc_chain_mode = true;
 
 	/*
 	 * When Controller DMA cannot directly access DDR memory, disable
@@ -237,25 +236,33 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	if (host->dram_access_quirk)
 		return;
 
-	/*
-	 * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
-	 * reported. For some strange reason this occurs in descriptor
-	 * chain mode only. So let's fall back to bounce buffer mode
-	 * for command SD_IO_RW_EXTENDED.
-	 */
-	if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
-		return;
+	if (data->blocks > 1) {
+		/*
+		 * In block mode DMA descriptor format, "length" field indicates
+		 * number of blocks and there is no way to pass DMA size that
+		 * is not multiple of SDIO block size, making it impossible to
+		 * tie more than one memory buffer with single SDIO block.
+		 * Block mode sg buffer size should be aligned with SDIO block
+		 * size, otherwise chain mode could not be used.
+		 */
+		for_each_sg(data->sg, sg, data->sg_len, i) {
+			if (sg->length % data->blksz) {
+				WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
+					  sg->length, data->blksz);
+				return;
+			}
+		}
+	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i)
+	for_each_sg(data->sg, sg, data->sg_len, i) {
 		/* check for 8 byte alignment */
-		if (sg->offset & 7) {
+		if (sg->offset % 8) {
 			WARN_ONCE(1, "unaligned scatterlist buffer\n");
-			use_desc_chain_mode = false;
-			break;
+			return;
 		}
+	}
 
-	if (use_desc_chain_mode)
-		data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
+	data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
 }
 
 static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
-- 
2.24.3 (Apple Git-128)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
