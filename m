Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D3C54E90
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 May 2025 07:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTLPOoR10A+ib8mV82oIFVO+I7x3j9IJyg7IoWMbZYU=; b=wV3dCnQp+5uPic
	9PScp5p5jL3NE3eVE5ZPa7agI0fCRg1AmtmurF3SwtB/UWUenPT6ccCFEJY+fATSBPK1bkaQavayb
	83la7sTm8U7jffXiX6rpUVdhakDlA/5doqhpZPCiVBQ6GYxIybRnuFFkviZqxS/Wy8Sk6DPXIFQRr
	gtbsNfkCC9gyboZuxLwy83A9OpwOUD9qE0NiHTu0t1HkW6gi4yndkfhd95jcSRsmTJJE6wQ91DSS5
	fsdSCcMECCWl9xv7yujuIEW4FVPtoTvtGZvKLoZr15RHod7DCBghOU01LfdWCt1D3czkEb6ICWjV8
	RcmEaZjdbWdw1p9mmsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzzL-000000004ee-3MTn;
	Thu, 22 May 2025 07:05:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzuk-000000003sS-1udk
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 May 2025 07:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BBJdRuKnAhO6ylDNvHwhRd/lPQP3K0ISIcyTSPsxjzI=; b=HcoJsxq9P+3hPgyN5/a7oZO5uz
	+WQPBoQf3sbtFTZcM3RRQxsIC41hOWtWJvAiCfBQ+BMdkZaLAd7DUm6mMcVQtdTctyf6crua7NY3e
	uoy2dcR/52N7OkVzu8m+Yqxu89DO3bN7vvO7HVpCWU/3wDhPqo0D+IFGgLvBVnvAWKrD3+EAYB6x9
	NBacSXV4kmIKKdz4WvQ8WqWKtsJ+/z9lwD9QDtNvojN1SvxAw5yojUY08ohcikFbqRhXc8YQBGEEs
	pzppKjQF921OysRxIMhmPl7pWfuL5OMRxvKYSko4TKPLFEaXNclvgSZGbbKZssBN9nk5lSlzGW9vP
	FXkfcEfg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzuf-00000005lBl-2gul
	for linux-amlogic@lists.infradead.org;
	Thu, 22 May 2025 07:00:24 +0000
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8CxyuB5yy5oRSL2AA--.4773S3;
	Thu, 22 May 2025 15:00:09 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCxLcV1yy5oEnLnAA--.499S3;
	Thu, 22 May 2025 15:00:08 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 11/36] mmc: meson-mx-sdhc: Use devm_mmc_alloc_host() helper
Date: Thu, 22 May 2025 14:59:52 +0800
Message-ID: <ee53a3dbe497a11dc390f82cb404724a06aa6519.1747877176.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747877175.git.zhoubinbin@loongson.cn>
References: <cover.1747877175.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowMCxLcV1yy5oEnLnAA--.499S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw13Zr43KF1xAF17WFyDArc_yoW8WF13pF
	ZxCFy7KF4UJF1fW3yDtayqkFyrWw47KayxtrW7Ww1kua4YkrWDtF9IkFW0vFyrGFyvyF4f
	uFs8Gr1j9F43JrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3
	AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0fhLUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_080022_196718_207BE67D 
X-CRM114-Status: UNSURE (   8.30  )
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

Use new function devm_mmc_alloc_host() to simplify the code.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index b4e56ccffca2..fb49ea71289e 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -757,11 +757,6 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
 	regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
 }
 
-static void meason_mx_mmc_free_host(void *data)
-{
-       mmc_free_host(data);
-}
-
 static int meson_mx_sdhc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -770,16 +765,10 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret, irq;
 
-	mmc = mmc_alloc_host(sizeof(*host), dev);
+	mmc = devm_mmc_alloc_host(dev, sizeof(*host));
 	if (!mmc)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
-	if (ret) {
-		dev_err(dev, "Failed to register mmc_free_host action\n");
-		return ret;
-	}
-
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
