Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C5606A33A
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y6ybMBxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T3c/U46Ro8GaH1hWBFNjOyy1wGPYBB/0AzAvuge3h5I=; b=Y6ybMBxecvcUcRGOjek/CU9y7r
	LzUEKMW91aX8e2Od9ANklWgmivZ7MXeIQdcYkqUdSyFvOa9Vak0RH+Y/eIA+PyynfmXw6lhnYsW6K
	Be75Tg5lp8KjmaRRgpKa35IpwjpA96XqkSI2SudYGcQHFIIezdpAPqcpy9eFyhViT2Rc8y90p0cWN
	/FnJhT1TjbRnWcq7fhoEYjruJYyaOdUNDonUNF7bdPdv7jVcFqdYxb8K96PL177HoHmdnh1YG9xiS
	jvT4dxfD30bKUN8xS04UuZxGO1lmgkgrgSS2DSNYWA/hsMXGAFvSTp+hO7qahLMvY7ci6Q1ojk2kO
	aqgJGwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmn1-0000000FHuW-27qI;
	Sat, 07 Nov 2026 20:13:27 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmt-0000000FHdP-3ndJ
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:22 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-475920b9ca2so863fac.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082399; x=1794687199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq6FcH8o0pFOh9qagX/8knXnGd4aYEu4wccWnJqnW+s=;
        b=w8Z+uRN9IM+nRXklXFfO8Pv3oA0U08yfuKLVIgPUkAO3ZEXdeWBhAm7IW6OOVP1bGe
         9gT8m+7syid6EP927lPWBwhqV6FtotdKLRcm9UqKdtjpGpjqcEnK5Gw4R7A62p+8VDiM
         akhzGuOS7y4E6W6ODxSLBFjxhtMFd2Fl1cd6Vr1WxkK5zeEtgyUm9gLKGAdbHZLr3MR6
         cWtN9jBeT308S7Vs2TTdIfTYqjm+ji4H57nJwEkswiu5uXaCuYFh0eP3Gdk7fK2gDnlI
         XsMmC8QJ03c/1qQbODv9CyeG4Ap/mQUbihn1sa6QmDmunK61Y4EYDVqybwTdD5SVAhk+
         vV1Q==
X-Forwarded-Encrypted: i=1; AL+hErEGZIu6A/6lXuKr+PvonGk3eVbBqPHOG7vGjzLfuJmMp5jkrjIxi26N27DJ4h22cxUahnwrc96dlvwxa+Pf@lists.infradead.org
X-Gm-Message-State: APuU4Z/87upuT9p7dZtPXQV17lHSvaNN9/mjoNaAD5VHo1kzUwnybNyr
	TasfmeyDxMmz5Usbm+Zbtd6+KPeaDF8LC+Nqh9kLb1jIy0LSGmu4OyrtpPM1DhLSHL8=
X-Gm-Gg: AYBFou0XD3r57ExtLcDpCUzyiLAVsTYjLU1pej/nSGu6fIMK/ej3e4r4aT9FR/1kAA9
	0kj4ewpjHOAYhZ1uFI7wx7Q3SXQEXp3sRiRI+z/U/vZcBXsZNEQpFk243w3B2OqNjAugyejU1vi
	+OmatQ4ovHhYpDKnEK2V3eINcU5aiohLdQLdLIaD7rl+KgQxE7yGT/WL8edfkkNs4ukkbSINExQ
	aejESgUPSp7IOXI2M25YLT7ppfptZ30erjpHiHGatvfldqFiFPsU2hnzyrSH5rKAjO6wR1JYVuY
	G2gBGcnT4Ppl9D4rcMLfX1TN0I/t0GJeRQLKCPGt09ycjVNdpvAu7+5/z01yzEvVQYJa1ZTiiw9
	66/msi7Eq6yMyAlB7WGA1G1c5k95wAF81TvUBamThXSJ14L9usxjLdPY6b9LsP2XPB47UVKBsod
	6rnjh09255wtuPW2HU2nNdm6FX8dYCHi/mTk7EIydwc8N2SLwLfnucxw9P4hH5tbbbV9MSy7Xo4
	NLgYtGdt2Hbipi/SAZefd6qTSOFrRHftnL6G1yHGHuy3Y2VIILB6Ezes2ibJFMSBGLF7hefN4Or
	uf90DOCAvbb0QtnnsKmJn6R6+rqe36DJW/gz88brb4gkcuMOSRPjuWVUf6BMPNjI76BP5UuQFZO
	LCpenZw==
X-Received: by 2002:a05:6870:ed93:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4ad9859e590mr4444729fac.1.1794082398830;
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:33 -0700
Subject: [PATCH 36/58] mtd: rawnand: renesas: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-36-0181ef0cc4c8@gmail.com>
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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
X-CRM114-CacheID: sfid-20261107_121320_214657_C112CEC5 
X-CRM114-Status: GOOD (  16.78  )
X-Spam-Score: 1.7 (+)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_release(chip, rnandc_chip_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
