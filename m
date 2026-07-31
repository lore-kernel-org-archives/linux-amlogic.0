Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCB7C55174
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8IOiE/rlS6dZspU7G2/Xh2uHfql/Offt8pntx1Na6k=; b=O4qmXXWZwK1q74
	BFSyAijFTPHZuf9ZVG65x3ZvFDDoDbucHa7ZK6t4JONoNCSBPxBbKgSXmxjlFb0pC+Q2gc8QvNWzg
	ekUxurnEmpZ4/X07xt7NQWyy55UFyogTWzCqmI5+STdrjCO2EWqvklLosJMLQwTI8gghbbNaK6JvS
	UvxDivSh0eIwAugJNNm73UKb7D24yFkiSrEpnYVACihZN66qE13YD/hOV80gqxYKJM5jjmkRHVuiN
	01A98Hj27fEclcR5UpewREqDrJ/dBWhPXwoGRG04k/uwYuDTIRqLZtq7vP8+1XUi6k05DiMLgy9Ur
	gCj6uQRk0qR8P94EG45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEG-0000000C8V7-2Zgt;
	Fri, 31 Jul 2026 09:08:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjEE-0000000C8UR-3VK9
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F16643FE2;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B41BC2BCF6;
	Fri, 31 Jul 2026 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785488910;
	bh=3M0OnshwTVK0UfKz0PIBYXEPXb40nt8Uug0ad6cJ1QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rm6XMt3BqhNnLZhuJ9S6awLugRr0iCduxdZoEQO6NLulWvmwrs/x8mXcZgVfNh+hz
	 goLBGMRjNhZtE0qBMMgqNX7tMTpLo0AcfRnT5OPnSVNJDEOu6OzpJI0hlXPm3JBbdV
	 CSFPh7qPJ0xn6Nmj4cgPhPohyraYvUxtEN6x/ne/neJgKerrM5T3vucDiGr+WTpRYw
	 tsnoXXcqMgBJXcxnZ/fYYgL2gG5QOmLVuZJO3GCWp6pk6hQ3aGGdlX01I9X1PJc68z
	 rLHusd4uXMaAYZaaw+mAc4ezKA25FJkvGFN56DchKWrRRGtsXqmzXYlMDuwNtxM5rw
	 u+F9FoN5jVJEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D97C55167;
	Fri, 31 Jul 2026 09:08:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 31 Jul 2026 09:08:27 +0000
Subject: [PATCH v3 3/4] spi: amlogic: spisg: Fix the incorrect keep_ss of
 the last descriptor
MIME-Version: 1.0
Message-Id: <20260731-a9-spisg-v3-3-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
In-Reply-To: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785488907; l=2503;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=GYCmSYjNwUITh84G97V/SeftRuFlV+MEyMTKnf7GhHw=;
 b=lVAECaJvKgRMeRQSJ7cp31B0ZizVolRGdEKE+PFOZtDrv/2SYTmQ4/QTrKnPlX+s1LWxeHXp+
 5z/IwXUGxwCDRghrAStVH/NvNhKxbNOVHRyxX4xiExFtRDAnj/Z84ci
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

From: Sunny Luo <sunny.luo@amlogic.com>

The driver currently unconditionally clears CFG_KEEP_SS on the last
descriptor, causing the last transfer's cs_change setting to be ignored.

Record the cs_change value of the last SPI transfer and use it to
program CFG_KEEP_SS on the final descriptor. When a null descriptor is
inserted to implement the cs-hold delay, keep CFG_KEEP_SS set on the
preceding transfer descriptor and apply the recorded value to the final
descriptor instead.

This ensures the controller handles chip select correctly for the last
transfer regardless of whether a cs-hold delay is required.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/spi/spi-amlogic-spisg.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index a6123975a37c..2d66f00dccd4 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -489,6 +489,7 @@ static int aml_spisg_transfer_one_message(struct spi_controller *ctlr,
 	struct spisg_descriptor_extra *exdescs, *exdesc;
 	dma_addr_t descs_paddr;
 	int desc_num = 1, descs_len;
+	bool last_xfer_keep_ss = false;
 	u32 cs_hold_in_sclk = 0;
 	int ret = -EIO;
 
@@ -529,9 +530,11 @@ static int aml_spisg_transfer_one_message(struct spi_controller *ctlr,
 				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_setup));
 
 		/* calculate cs-hold delay with the last xfer speed */
-		if (list_is_last(&xfer->transfer_list, &msg->transfers))
+		if (list_is_last(&xfer->transfer_list, &msg->transfers)) {
 			cs_hold_in_sclk =
 				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_hold);
+			last_xfer_keep_ss = xfer->cs_change;
+		}
 
 		desc++;
 		exdesc++;
@@ -539,13 +542,17 @@ static int aml_spisg_transfer_one_message(struct spi_controller *ctlr,
 				       xfer->effective_speed_hz);
 	}
 
-	if (cs_hold_in_sclk)
+	if (cs_hold_in_sclk) {
 		/* additional null-descriptor to achieve the cs-hold delay */
 		aml_spisg_setup_null_desc(spisg, desc, cs_hold_in_sclk);
-	else
 		desc--;
+		desc->cfg_bus |= FIELD_PREP(CFG_KEEP_SS, 1);
+		desc++;
+	} else {
+		desc--;
+	}
 
-	desc->cfg_bus |= FIELD_PREP(CFG_KEEP_SS, 0);
+	FIELD_MODIFY(CFG_KEEP_SS, &desc->cfg_bus, last_xfer_keep_ss);
 	desc->cfg_start |= FIELD_PREP(CFG_EOC, 1);
 
 	/* some tolerances */

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
