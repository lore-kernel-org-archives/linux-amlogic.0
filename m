Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B11C55167
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuG2eVaYc1Up4ychQlPRmAyCadBgDGbyexkrkt+6kQA=; b=GsVpYTsn79NERm
	NkjAWGIKTSL+5Xv1UeOWgaDgSdenBQOlovPFStkapNXkQxWwi9b9//tN7FRUvgXwq4YERtHdejvz6
	uYIGwjNMfOAEI1Eih2x1Q0nZnUp3xVmLT8Dcc53nrb05YOvdDeE4coAcOzf4Lphguzgd+7rB5DUSO
	pTZ6MMmOvlfVytoZlaf/9HEJYi5nI82Pi3E6TiNabZxW98juQURVhzD/jv9UnA+XvdofjRLTwB4ub
	DyPre2Sa48FxUwULS0JyLeRPN1qxM4axTyplqdWM8qV26TUcIeiWFXF7fB5YmowGiNWxLmvsN9Ari
	iOk0e51q4Qp4s7H0vp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEG-0000000C8Ux-1Ywo;
	Fri, 31 Jul 2026 09:08:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEE-0000000C8UQ-3VLL
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4178343F47;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DEAFC2BCF7;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785488910;
	bh=rq/tb46DP924L/FjVCUkL1FIttRHuK8j2ySAzVvIQZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qHzfLoYGijlNkK5s6v2QAipdIJb70s6BBlSUGJpWG9oiN8o+2fk+LLTw4p9Fp9qNp
	 j/RuJbcBVBjWyM08YY9nlin4F8CcmmY7LcsZDoWRYdLRBXQQ9cIQWOVi4rY2tZdQBJ
	 kgf/RhF3kCbNrVGAf236v8y0SBIUBeH3Am7W6lhqHno7gWTDidr1Qlxc1mz7ZRmTRL
	 +cFE3f3MrAsX/hNZQ8bKLkIJbwxcazFMJW+5ok+Us9FP/SneSdVWv7flQIEbV6vPgb
	 GNFyWUIJPWytR1Ov0GgNFI68wGsv2lYgDZCEQEuz/X/rhnQf/egYp6Xr6yqbGot2eC
	 8WqCkKQe7aC9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FC7C55172;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 31 Jul 2026 09:08:26 +0000
Subject: [PATCH v3 2/4] spi: amlogic: spisg: Fix transfer size limit and
 timeout handling
MIME-Version: 1.0
Message-Id: <20260731-a9-spisg-v3-2-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
In-Reply-To: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785488907; l=1947;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=BRq2nLOiEjtiR+0vj/uM6L8HPr1w32uaAGwS/r33K78=;
 b=+wtwSwKdGJ97TDwEtJc8168Lm+z187CiysDr9iVjlng+UZdwvgQC5anWhFOOEUIIOWvjCGJOh
 +41DdnUizsOCxC9uWXuNOE+9BqV72bytRXuxDN2WxCeKWtVKqyqoXQu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The CFG_BLOCK_NUM field can encode at most 20 bits, so reduce
SPISG_BLOCK_MAX to 0xfffff to avoid programming a zero-length transfer.

Perform the delay calculation in 64-bit arithmetic to avoid overflow
when converting nanoseconds to SPI clock cycles.

Stop the controller on transfer timeout by clearing the descriptor list
register before returning an error.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/spi/spi-amlogic-spisg.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index afc8af04638d..a6123975a37c 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -95,7 +95,7 @@
 
 #define SPISG_MAX_REG			0x40
 
-#define SPISG_BLOCK_MAX			0x100000
+#define SPISG_BLOCK_MAX			0xFFFFF
 
 #define SPISG_OP_MODE_WRITE_CMD		0
 #define SPISG_OP_MODE_READ_STS		1
@@ -175,7 +175,7 @@ static int spi_delay_to_sclk(u32 slck_speed_hz, struct spi_delay *delay)
 	if (ns < 0)
 		return 0;
 
-	return DIV_ROUND_UP_ULL(slck_speed_hz * ns, NSEC_PER_SEC);
+	return DIV_ROUND_UP_ULL((u64)slck_speed_hz * ns, NSEC_PER_SEC);
 }
 
 static inline u32 aml_spisg_sem_down_read(struct spisg_device *spisg)
@@ -565,10 +565,13 @@ static int aml_spisg_transfer_one_message(struct spi_controller *ctlr,
 	aml_spisg_pending(spisg, descs_paddr, false, true);
 	if (wait_for_completion_timeout(&spisg->completion,
 					spi_controller_is_target(spisg->controller) ?
-					MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(ms)))
+					MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(ms))) {
 		ret = spisg->status ? -EIO : 0;
-	else
+	} else {
+		/* stop transfer */
+		regmap_write(spisg->map, SPISG_REG_DESC_LIST_H, 0);
 		ret = -ETIMEDOUT;
+	}
 
 	dma_unmap_single(dev, descs_paddr, descs_len, DMA_TO_DEVICE);
 end:

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
