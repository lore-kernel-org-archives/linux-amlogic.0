Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD6CF55139
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XfvZN0IYDZJ/jdvYV3Fsv+Ih++yImTVCxVnTqvpnxgc=; b=J0FtdOVHR5LyZp
	875TQwYQxBsxXmnAJSomk5GDBijmqBrj1B7lLZLiQSeJayUG4my9sXy7xVc0MriL66p9A7IOVQ05e
	hkDr5osToP+A87KJb/wywGDKespcEZXVJAlcTPK9w9tKK9nmCYKvJ6ZsPmjRNNGx6wtvQ1iU5voDq
	IeZhso/xmVaMBFiwb42aIyTf1oh5y+h7RdbkGAolzKnOvrvuBK29D/g2OBrw37xGJpGhB28RaUXeb
	os62EqLlaTNfXV2YBrsFQfEoo70EyaSL5dUPJDJT/QibpieWyhfoWXYv2hlHyY+WnRnD1qUZIYnzj
	z+u/TaZPpd2xXAJgwQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEHg-000000063fr-2V3V;
	Sun, 08 Mar 2026 13:35:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEHe-000000063fW-2Lij
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Mar 2026 13:35:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8296dabef74so4607672b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Mar 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772976901; x=1773581701; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JltE6+8Ow4XXeaqmNG/IJKeoUqa+n358vgCzVseFfy4=;
        b=AdI4pKuKUbt6XQAuslSwaJ2irQj8/2cnCddJCL+fQmC4SHWjgNXmT3iEIkUGl7uzJd
         B6PclTFb+U4WFt57eBUcRz8FGwxiVgd54H6Dwl8pX8MMLBGhVneNfh/j8eQoIJlELUz4
         DgvfAlCvV2kNgpuTR9IAW+EWF6A+IDkUJR7tCTYjKoTdfUFgIzOpjDxJYFRMnQrF4qTn
         QZpPVgeVsEns+e4yU26yT0nG87pLiWo9MX60iSKIXTmol8FmSEAv8F1EXJ1i73LJRYW4
         JSSRLOprRzhxXOkPQj5iIJP4VBOesIAcNNSoWDuqjZSX722SkU24y/5PuaD0itJ2iwp3
         nPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772976901; x=1773581701;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JltE6+8Ow4XXeaqmNG/IJKeoUqa+n358vgCzVseFfy4=;
        b=Hb3G69PJfOX5FkWlKzOEXUYqMrnmuoymDw7s7fzy9UHXXHms7ecb0l3k+2Uv/UV0nn
         sESFEs/xzq9m0aNnm4o99aO3PPJ2scxzXa+mg6cCiKE/OvKOJlKe2dXoKh89GEuvI1ff
         0u0qOnQBWCQCBFYC3dw6AmWdjBL2tppJR6C7rZCvS9ZBRZxvCRnxWi2AGfzz+9kSX6n8
         iUFXlv9FDJ4ybn5SCVqfbXGZt+yhMRnM2sU5hzXmciTk0vcJTnslou/QLHRbQaDdHfh0
         Y8YcY0csE4jCd8RFehfiEtEydSIn91+u8jt71oRuH6RNhbPrc3kMb8QXzLoER3ydWl+X
         YB/w==
X-Gm-Message-State: AOJu0YwArafng5mzF2eaMjbnNPvmzrAmmh2ionER7QSSaY/vpIqxs1VX
	jTsWyY9odafoBIaOK+lFJJyqXky6z4UetboOvr8dyspLkaZfRzpcHAVG
X-Gm-Gg: ATEYQzzVMyjE/Fi6AxdhKG+O5CIHOaxapf2QJY4v9dQNLnRPoUQds1l4TJFiK9y66Bs
	IoEBT4mxWroOkYA+TU/kitVOlgal4P/JXzJAJV+mGXgyXMsD8Blo53KgOM6lkbeyRfmytxEZ2zG
	ZIZQ5dJXqaEuWaDcznbPVEwiGwUr3HFOxkkq4A17bU2SQ3I4+yP4/5+PAQxzaKbEB14tq89X4sB
	MQsNKHD6hkp+qDUq72aiVceH76KXssWOmYlWtIxHBmiy6npecxv5cYZBsMk3cNZ1B6Q9Xit1UhB
	tL0TSCMwRMUvddyHPETL/CbllT0CymMsoDvx0j6R3X5gOqLLwoOxpCxxr3cUinAn9BrKXYZlQdD
	UYp+ad8gYopn/ned2onWGnGu7jxmIlmqX9EMP7jmLfzQnvF2AuIv4m9C37pVey+Hf403EfeC9O/
	k+ufbNWaSzFPsulDHBx/LmOGKWZ9Jj6BzjBmih
X-Received: by 2002:a05:6a00:1c87:b0:824:374a:1424 with SMTP id d2e1a72fcca58-829a2f699dbmr7046957b3a.58.1772976901013;
        Sun, 08 Mar 2026 06:35:01 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4507:7fb4:bc3a:eca9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d696bsm6895996b3a.58.2026.03.08.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 06:35:00 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 08 Mar 2026 21:34:55 +0800
Subject: [PATCH] spi: amlogic: spifc-a4: Remove redundant clock cleanup
MIME-Version: 1.0
Message-Id: <20260308-spifc-a4-1-v1-1-77e286c26832@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP56rWkC/x3MQQqAIBBA0avIrBtQC5GuEi3MZmo2JgoRSHdPW
 r7F/w0qFaEKs2pQ6JYqV+owg4J4hnQQyt4NVlunR+2xZuGIYUKDzjNvxrnAzNCDXIjl+WfL+r4
 fJLtx3FwAAAA=
X-Change-ID: 20260308-spifc-a4-1-68ffb166afff
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772976897; l=3322;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=IdkYZcqSAsfDr/v01fcZng8MKVvKs612Vz+/y2dFwAw=;
 b=ZfSJgryJPy5aIsot/eh+rHeNfAWOTkrwIbpOT+IyH6Dk59HdDBzl90AJrxWPOzvfYj5ChX+9G
 NRb8Zp5gGxUD17R8GomZSUGQhE3vo+0fTosH2TwvmNc8b76FJ2UE1KA
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_063502_612362_72640050 
X-CRM114-Status: GOOD (  12.84  )
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

The driver uses devm_clk_get_enabled() which enables the clock and
registers a callback to automatically disable it when the device
is unbound.

Remove the redundant aml_sfc_disable_clk() call in the error paths
and remove callback.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 46 ++++++--------------------------------
 1 file changed, 7 insertions(+), 39 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 2aef528cfc1b..d3061c870ff8 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -1084,14 +1084,6 @@ static int aml_sfc_clk_init(struct aml_sfc *sfc)
 	return clk_set_rate(sfc->core_clk, SFC_BUS_DEFAULT_CLK);
 }
 
-static int aml_sfc_disable_clk(struct aml_sfc *sfc)
-{
-	clk_disable_unprepare(sfc->core_clk);
-	clk_disable_unprepare(sfc->gate_clk);
-
-	return 0;
-}
-
 static int aml_sfc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1142,16 +1134,12 @@ static int aml_sfc_probe(struct platform_device *pdev)
 
 	/* Enable Amlogic flash controller spi mode */
 	ret = regmap_write(sfc->regmap_base, SFC_SPI_CFG, SPI_MODE_EN);
-	if (ret) {
-		dev_err(dev, "failed to enable SPI mode\n");
-		goto err_out;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable SPI mode\n");
 
 	ret = dma_set_mask(sfc->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(sfc->dev, "failed to set dma mask\n");
-		goto err_out;
-	}
+	if (ret)
+		return dev_err_probe(sfc->dev, ret, "failed to set dma mask\n");
 
 	sfc->ecc_eng.dev = &pdev->dev;
 	sfc->ecc_eng.integration = NAND_ECC_ENGINE_INTEGRATION_PIPELINED;
@@ -1159,10 +1147,8 @@ static int aml_sfc_probe(struct platform_device *pdev)
 	sfc->ecc_eng.priv = sfc;
 
 	ret = nand_ecc_register_on_host_hw_engine(&sfc->ecc_eng);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register Aml host ecc engine.\n");
-		goto err_out;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register Aml host ecc engine.\n");
 
 	ret = of_property_read_u32(np, "amlogic,rx-adj", &val);
 	if (!ret)
@@ -1178,24 +1164,7 @@ static int aml_sfc_probe(struct platform_device *pdev)
 	ctrl->min_speed_hz = SFC_MIN_FREQUENCY;
 	ctrl->num_chipselect = SFC_MAX_CS_NUM;
 
-	ret = devm_spi_register_controller(dev, ctrl);
-	if (ret)
-		goto err_out;
-
-	return 0;
-
-err_out:
-	aml_sfc_disable_clk(sfc);
-
-	return ret;
-}
-
-static void aml_sfc_remove(struct platform_device *pdev)
-{
-	struct spi_controller *ctlr = platform_get_drvdata(pdev);
-	struct aml_sfc *sfc = spi_controller_get_devdata(ctlr);
-
-	aml_sfc_disable_clk(sfc);
+	return devm_spi_register_controller(dev, ctrl);
 }
 
 static const struct of_device_id aml_sfc_of_match[] = {
@@ -1213,7 +1182,6 @@ static struct platform_driver aml_sfc_driver = {
 		.of_match_table = aml_sfc_of_match,
 	},
 	.probe = aml_sfc_probe,
-	.remove = aml_sfc_remove,
 };
 module_platform_driver(aml_sfc_driver);
 

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260308-spifc-a4-1-68ffb166afff

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
