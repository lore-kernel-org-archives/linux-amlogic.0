Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FABECCD190
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Oct 2025 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCI/++cJdTKNf6SZIaTmJtzQKU4KFFUBAjo3zzGFIf4=; b=RErV9H4rMt3qGZ
	YTd7FeVDyRxX7VMFZ3kiN6K2PtLEO3q1xHwuaPGeoQ9nRNaDTqA27uR+UYHWXqSX7thoh5q5A8hpr
	v/6VJNLQf0FWEQYXQeaiuYteElzd7dlYcJTJt9r4InOz9ZiiQs+lXYac0dgVjO1ifwplfCBc38jlL
	gIlcwYvJ7+SIIQaF06VOw5qTR4rMeEvrQJ4f8dUGWSD5EdFySScNP8cSrjHMiP9IxRR4rx0m9Q3AZ
	kEwekiqB4x5oII2+9TQFTaDvBo/7JBBitbtLaxH9KEuZizVtfGu9h/zFvQ5mlMPpMzsS7afHxPTDd
	XqMrZwnQJX/mdC085GpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w4O-00000000m34-319e;
	Wed, 15 Oct 2025 07:37:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w4M-00000000m1i-0lrF
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Oct 2025 07:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B745457D3;
	Wed, 15 Oct 2025 07:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44F2DC4CEF8;
	Wed, 15 Oct 2025 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760513829;
	bh=H0wf87Ra86CLHS1tXo0mSuHmiuFU4bbwc5VHjWQQnD4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=p+m+TnsXXJ66DCzZc1D/hV0pjHsH2oa++FULr4MBYdpv2V6vr9UOwcBpG1BYV2fb8
	 vnzqoG1WdYmEpC6NYqbv+J2N4m50BH7cng5ucx1RuZVH/N6g729ney+F4IOLZ3gfMv
	 kR5TKJfOUSnhlo2RVaIKkhSZ9FD4BRHgkH6uBDuziAuscMUy0raQQo1S1oR1B4TFtg
	 Y4eOcBsIjT0FF8vilFC1stXQQSf39phAtM+VEYO2iWg3wRXEv44NO6bEO2XMbbAtEz
	 BKAH0zKMu3k0IWqN2PojRMLxaAGUASkDZvUOTaur3Jjp/zVGXOoJ0pNUn2FwFA537W
	 UAbkWEd7p+j3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3035ECCD190;
	Wed, 15 Oct 2025 07:37:09 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Oct 2025 15:36:59 +0800
Subject: [PATCH] spi: amlogic: fix spifc build error
MIME-Version: 1.0
Message-Id: <20251015-fix-spifc-a4-v1-1-08e0900e5b7e@amlogic.com>
X-B4-Tracking: v=1; b=H4sIABpP72gC/x2MQQqAMAzAvjJ6ttBOHeJXxINo1V5UVhBB9neLx
 xCSF0yyikEfXshyq+l5OHAVYN6nYxPUxRkixZaJW1z1Qbt0nXFqkLo6ifBClBJ4cmVx/++GsZQ
 PwDhbkl4AAAA=
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760513827; l=1872;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ib4K3AKweceHACtvQk2qAu1Cu/KOa08Hppl4rd6zBYY=;
 b=8MdBsfApJXW2O9AH4npOlocTZ3FbpagtH4/ZTFZY9aaslApccjLdZcT/BXHUPBJGo1s0YlV/W
 lFZuormMTOvBtGgqksRN9YUyQZCgOPpnnO2bEryepLQwFmbybNKJmvI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_003710_264865_8861B2AE 
X-CRM114-Status: UNSURE (   9.35  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

There is an error building when
Compiler version: gcc (GCC) 14.3.0
Assembler version: GNU assembler (GNU Binutils) 2.44
"
 Error log:
 WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
 ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!
"

Use __ffs API instead of __bf_shf to be safer.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/f594c621-f9e1-49f2-af31-23fbcb176058@roeck-us.net/
Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix build err for spifc.
---
 drivers/spi/spi-amlogic-spifc-a4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 4338d00e56a6..35a7c4965e11 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -286,7 +286,7 @@ static int aml_sfc_set_bus_width(struct aml_sfc *sfc, u8 buswidth, u32 mask)
 
 	for (i = 0; i <= LANE_MAX; i++) {
 		if (buswidth == 1 << i) {
-			conf = i << __bf_shf(mask);
+			conf = i << __ffs(mask);
 			return regmap_update_bits(sfc->regmap_base, SFC_SPI_CFG,
 						  mask, conf);
 		}
@@ -566,7 +566,7 @@ static int aml_sfc_raw_io_op(struct aml_sfc *sfc, const struct spi_mem_op *op)
 	if (!op->data.nbytes)
 		goto end_xfer;
 
-	conf = (op->data.nbytes >> RAW_SIZE_BW) << __bf_shf(RAW_EXT_SIZE);
+	conf = (op->data.nbytes >> RAW_SIZE_BW) << __ffs(RAW_EXT_SIZE);
 	ret = regmap_update_bits(sfc->regmap_base, SFC_SPI_CFG, RAW_EXT_SIZE, conf);
 	if (ret)
 		goto err_out;

---
base-commit: 4412ab501677606436e5c49e41151a1e6eac7ac0
change-id: 20251015-fix-spifc-a4-0836ee1d0066

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
