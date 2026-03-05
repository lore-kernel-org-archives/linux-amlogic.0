Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD5EF8FE4
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZtFkQEdnjh3dXarjwbORTBEr6lKtY756vy0+8xn7Ga8=; b=rvCTi9WInAXOM9
	ImeZQiESMHRzOqz8TUZxxAGcqyzI1Ido7vLRBoSgfohrmyg5brJKS2XpS1akVlCfgy2mKZEVJmJ/T
	ILw0OphCna6cmsu4pnUL9Eh3QOvU52jP8unUsx0KPln5LPKpLcF/TS7JmusNgk94N2Tgz9hZu34Wn
	UbvkMbPorFmuxfEFRWlVhvNJfESVBMUMyPCMBFF83jC4+I/zt93xgwPA71zjsp3jNznG1l2ktPEfB
	dSk8rlpV2swdfmzZomw7Tjom1iQTBOpjF/zaR//5ZNZb7p5ymDcH2Z9HsPHUldYn6/G8BXPq5nfJ5
	CK6JXtZKU6u1cXljNfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRD-00000002I01-3Pda;
	Thu, 05 Mar 2026 17:24:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRB-00000002HzS-3BOC
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 17:24:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ae50a33ff8so37485875ad.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731477; x=1773336277; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JT0/L3hjO8bWyA1TdT+7Z0rwF+foYA9hR/6cSM0pLp8=;
        b=bv7m9SWN74aP0+3fnflvXxJ9/wHErFETR/bhzNsW/oXjD8joiNBCTkOpnbA/EQNlos
         YJ/JF+GaGxIWOyC4vyW6vTmeIkCylRaAowaG1Ftj2jvfs6cXm5eMhoTyp77HdIMqRkjj
         qZRtnpdvCMX/31urqfAo9w1IongtObl/VKdliowK1hcuTn8nTPWKiEpxnJ+6t+eUMl/p
         frL/9ln/lt+nUQ/LDCJg1qyLeGxbluIHfdqB/AZKOzgtzMCL7rvv7JvGNxas60zRxnzB
         uN0G6/8LGwQmRplBnECFqhPBuqM4Y0MpvKpcNNbUrcLAOVvv2w1uhJFlY8w6TUw1d+jm
         EIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731477; x=1773336277;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT0/L3hjO8bWyA1TdT+7Z0rwF+foYA9hR/6cSM0pLp8=;
        b=cn2wRTY1Znid8PcR07DzPJTpARWAxtDoLacUmdlUV0/2mL7rQCUqycPcpQUT/gh2+Q
         vIopRns1NEyEcndT//Ty7rbTrbzizmDGr3h48pPJOawsevWRR7ywb0DGp6NsrFgMTQqq
         m/VcphKPqOm5I5vARL3O8/In6nBd1U2LNPt0SRHLYTwV3z33gybMyZgmnGK8MFlScYmD
         8qmcOQH6qT9INfcLuzQOmP0/D5cDN0HwL1JwqO8zw6PFw8JkgtbVchV+JBgBrskCe8yW
         ti5aR2qE5AaXQWDjdFWsWGDVY6pVhP42PzFydNfqQ5bu5vkHybmAQ96b7iUL8MrSzIir
         L/Ig==
X-Gm-Message-State: AOJu0YwOOw89joGU9o2fzvLfC2klvNdUj4SVWJzNU5blZYwBOuqCp6pT
	MLqjjfOT/g5afQymaTeD00JSnoHrXHbT/iibU7zZ6QsQ+gIhQRQXCJ8ikhAQRDTMqzo=
X-Gm-Gg: ATEYQzx19vZQToNGFEH7yFbTGv4MJevsID/S7CIJWbVvzhChGV+iy0i+bznA2jsu2hC
	D+N+fuxteguLElBFBxu94y9OQGv7lXZbQpUTl1dRFEkVLShXHT+6MWbU81voHKOquVf1lts8xPa
	SBIQPJaXLBm5xc4mk1X6VOih82caVPJND3W7k9AEnUmP5NmPuJSRpSPYhj0NIuDIdmzc/scuDFi
	7M+P8nMOBTrK3nmQJE88eMUHl6HpTNFt/OgFLpLVJpvRqJ9goTXr/HCRnxjDrnXONSfiIMmWLm9
	nKNKIMntWIF5mdMqfVALyIhG1lc6DckFRHQXUgRRMNkFkrOJH5lRwPL/k96MogeOTT/mkJZc6Bc
	ZkJ2z2PA91MHAe3dZ9fM/s1x95JpImD1vnCVE6RdW9ouaR5dpvMM1nDgjOakzbcGH7XukhvvTK/
	mIE9xZVimUXhiHII/ATyIRjTetEbqp
X-Received: by 2002:a17:902:ea04:b0:2ae:805d:e0b5 with SMTP id d9443c01a7336-2ae805de2famr2542615ad.56.1772731476543;
        Thu, 05 Mar 2026 09:24:36 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm237542815ad.24.2026.03.05.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:36 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 06 Mar 2026 01:24:32 +0800
Subject: [PATCH] spi: amlogic: spifc-a4: Fix DMA mapping error handling
MIME-Version: 1.0
Message-Id: <20260306-spifc-a4-v1-1-f22c9965f64a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE+8qWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3eKCzLRk3UQT3RQTgzQLE1MDsxSzRCWg8oKi1LTMCrBR0bG1tQB
 9ctMmWgAAAA==
X-Change-ID: 20260306-spifc-a4-d40f84506d6a
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731474; l=2039;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=lomfZlVN07CiFEPEXh4wGx1EjgxUHi4bQLkDua2YS44=;
 b=S9kHCyJh41+jIjlilWGWaLPlUEG9e/sEjLAOxgkA0n5AD0EuxwfMPMZi1EaMxSNXIMWAHsQBz
 XiOqxcgGzLOBpmiqgyRAtLQI5uw0ExZAEVIEBMtoTyfHl6wV8GLDmfQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092437_803601_5FEF8202 
X-CRM114-Status: UNSURE (   9.81  )
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

Fix three bugs in aml_sfc_dma_buffer_setup() error paths:
1. Unnecessary goto: When the first DMA mapping (sfc->daddr) fails,
   nothing needs cleanup. Use direct return instead of goto.
2. Double-unmap bug: When info DMA mapping failed, the code would
   unmap sfc->daddr inline, then fall through to out_map_data which
   would unmap it again, causing a double-unmap.
3. Wrong unmap size: The out_map_info label used datalen instead of
   infolen when unmapping sfc->iaddr, which could lead to incorrect
   DMA sync behavior.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 2aef528cfc1b..3956869cfec1 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -411,7 +411,7 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 	ret = dma_mapping_error(sfc->dev, sfc->daddr);
 	if (ret) {
 		dev_err(sfc->dev, "DMA mapping error\n");
-		goto out_map_data;
+		return ret;
 	}
 
 	cmd = CMD_DATA_ADDRL(sfc->daddr);
@@ -429,7 +429,6 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 		ret = dma_mapping_error(sfc->dev, sfc->iaddr);
 		if (ret) {
 			dev_err(sfc->dev, "DMA mapping error\n");
-			dma_unmap_single(sfc->dev, sfc->daddr, datalen, dir);
 			goto out_map_data;
 		}
 
@@ -448,7 +447,7 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 	return 0;
 
 out_map_info:
-	dma_unmap_single(sfc->dev, sfc->iaddr, datalen, dir);
+	dma_unmap_single(sfc->dev, sfc->iaddr, infolen, dir);
 out_map_data:
 	dma_unmap_single(sfc->dev, sfc->daddr, datalen, dir);
 

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260306-spifc-a4-d40f84506d6a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
