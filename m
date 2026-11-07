Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21F606A334
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uj9atx2X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OvX85cpB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx79icWi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MUOVdYX+0maq/b+dMxABK+NUsZkhUBxVkQmQgCQGifE=; b=Uj9atx2XloZem0mgfBIwQOthuy
	xM9zMKuuKUT9j0D+YXW2WmCNpbWOe8b8GIdHptAAQpgxPaVCrxfivmOmnw9WvRuTHA7AFBsiWoDN5
	2batO/NUNLTF9a90JSo+gCGxSXTwv7bmWa6X0dQvZXrgK6nC/Ee7Bwf5O9duJqDwtNOhVnY3GrYFM
	aP6DKDfOclLsLQS4SzuZSE8gBN4IXDPI0CfPpfnLAd+ezFcaLOjZuMyn/f5TqbWE94wopTtDcfirn
	jRTnXEBQLhKTxyOE0Kh8+HQhiNZKvFIz/O4czL1+uhLGc0UpU/3PACf4uGtvoZRzTpNVZFin5Famz
	0S3Jw7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUc-0000000EUbN-3F1K;
	Sat, 07 Nov 2026 10:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU4-0000000EToh-28K3
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=; b=OvX85cpB+vUssaWkyAFQ+TGLbE
	oVBZX9MtSUy9CmeMi5OWnYmS10MYRKZhKrPpz8ty72l2eeZ/v3oyrnCIxUBRKt7SxPevyVl/LUG5a
	hSwQ45/lAdLz3/kgfQaGH3M0rnQNt3Ep7/C5R/G//0tFZi+k4lE3CGKWmMcbRmYQMAUE2VL6PKG0W
	bmYuZhkeRdFqyck9Zn9/eKrNzEVXUF/U2qu/wi5YHQHIByol+1DsHDOPdUfXwqtAuFa5jurlwQDzU
	12PggBeYBJnxj/+abHCv29bvrFgGPl0TP3xrSahYf+zZ9J20UWknxoK3ocUDNm5f4bSthIx0a24Fn
	kWsh29qQ==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU0-000000057rX-2NHt
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:15 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-823b938464fso1112727a34.2
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046631; x=1794651431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=nx79icWi1yQdLug5dZq7UHca32iZV3OnbA22a59e5TAu/7UeSKZhrjCO2WknFAneiu
         FfwPb3eaSIcEpl10IuoEAG+pGE5eD58lecftxt/xcC4/KNnFuAOBRpbnGqcJOlEPUq4i
         HcJU26o8CFNl93B7H2jgzI8qaxPTQ9ExNoub3z7KSUVAFPAM+Y9WSvtGPxR6BLxJ4sVm
         qufmjUPUPSGMNUpkM9CgETiQEnW0IlaQnrWmnIGAcv0WZhekU98JfW9opRnJGahHstTF
         dEreySyVEC6w4dqoEtSGbJJrPLaYRQjc7YtYKWhjjTmYBJgjqCzkME5fJzMRP8mDzzMQ
         K2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046631; x=1794651431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=oxp3/3spMiVQ7n7d3pJIP7yPi/XwT5eVtUF2T0nhxxCiRU1+nmcP6navHmjKGP4Oo1
         HnLYJcSO+rJd8dFQE156bsu6cmJkoRDjlqiMQ0XbiKEXu7bViD7EI2zpxYt90NPpDNxv
         G1MvbESKgIwihM+zmCyDB1/bCeCB9pzqXQxXzmyHiXOcIv4ztnxsIhPoiwl+zzuY5B+9
         B7tMhJQp1Ur0su8ShOpepn7/RPNdnGrQailJivFImyBnypwuZ+4yKAZHe0LrOu/nukrS
         ux+H9hFxQTMRTdL8a/mX89ZNC0cEpOs2z7NNoakrEVuRfRCG9i974+0mBDG0FrV0KN2B
         +9zA==
X-Forwarded-Encrypted: i=1; AKwUvBxWaUMFJQn1Hh9aKsPKRaXuUnwSzpLqKBEJ21DBNNLBMCaFrgIeopVAshkCQsxR6at2YVzTuFHZq3pTSctE@lists.infradead.org
X-Gm-Message-State: APuU4Z8d2UWrFpb0za3qSDZA9APv+bSSCIr0MGOURAspdVf6LpSf5NYd
	Fgt3FbDP0MhxCBdxX8+nAfCrWxjkmP0N2Ki9x/tF16HFYEocv+BWf1n7
X-Gm-Gg: AYBFou3dXiBL0VK9OBZJ9ePb6wYQV/8maAntyAQRswL39Ues9IbBQsu6CbrWColJmov
	zlpEcQZ0/GtANn4xeBmANC5jQYCL8tq6z7CzCYb28f+yZ+WkWwvolw4+g1cNC5AYQR/me0inIfs
	zVvu3EJkHzXwtQZl233+DEESvle1tBQlByc0VuzZC0t+p85hUR2/p3vvtx4ZZ8Zsqm2o+6HDMvu
	qgcNkYjzONWpuUlxSCee1szpvRunmzqAWHmV4gclzrkF5QSkor77KIcYd/J7JZvvf/1LfWHWGYm
	9Sy25xuK/P2IJWZ32BR6H3m816Z6NnC9AmrJVjq/eHkVdoRqUDVl1GKs0JM2QcyLyDsfoNImX1n
	wGe25vmpIwMcnhUm+ZjiMbzmcwpqgcs9zf3l5VBqbmC7dDLsrku0BdSVlG2M1GFp6ScEjmbvF8m
	xPJrBBF1Mbd2peDZcjqoxzsBW4kr/UtNEaSLmva5z7ys5vZy5J1rVvqaVVXNUi/9iDTuRSWMXfP
	82hDFIB5Lv+P8CU1mXQ00VGzvCGvAzBDvvCS9BhUfaxKLL6EHC3oalBzRyWVst8qTWDHXblRkLb
	fXRIbKXRrzp/x7ADkERZHNEiwF/ZpMDJY6K/CNyDRc0SkAP0fq8k87gCsP+NJAgpIAgChkjUHj7
	tgMhYM2ztFuEA+NVAiqVCaqdJTD76mfaJsXGJRVSqpBkMqcKRPzIY3P9vJt7aFahymcMN+O5w7J
	M56tJkJRVzDXGHXN+i+HGx18Vy1MQ3VB+IKwUEtMOhMzgzuYNpdTvO
X-Received: by 2002:a05:6830:82f6:b0:844:ce0e:e43 with SMTP id 46e09a7af769-85f1d0da35dmr4740933a34.29.1794046630781;
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:13 -0700
Subject: [PATCH 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-16-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_101712_625165_94FE163E 
X-CRM114-Status: GOOD (  17.46  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
