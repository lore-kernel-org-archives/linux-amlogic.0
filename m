Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF9606D831
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SoIjshD3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=om8RwHkK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vfXvKb6xgSJ/QqNxJfjbYvZ1P8c7lcOii3OLqi1/hwc=; b=SoIjshD3TCxApb2uhnVLZfGWqd
	2ATIgMdKNpFdOlMfYCvazjRl318BTgp+sFtnGy4JBIR/MSeoFqjp1c7+6p8oz5o1HwQcCBeEs7e1E
	qaTf6/dGO3gBLMQcKG06mbs55LLtxY35ch1/tDwmWqHBx+vRT864I23NDeA3kWhwbBR4jw4U1jICH
	Wdp9eYQB5zEHp7fzOB7XWQxZczeePYgyLwOi+Z3RhT4x2DsrF4NhtuCDyyzBcI0fg6OhbauLRORDJ
	mk8wiKw+DgkiMfNxWiBqiftrQxU7PBxmiyKogrA230jKtEqVqSXXn7OjZSCOLUFHi4l5UQ2HCCW0N
	59ALmjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmo0-0000000FJke-20Zv;
	Sat, 07 Nov 2026 20:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnc-0000000FJ5D-2W85
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=boAlKmZhAnSEjyKx8nKFVkQ3l/nt4gG98JRt8SYVseE=; b=om8RwHkKY5ydFvXj6f027OPHRG
	nEGOkhrXMxJWnEhZqCArk7XcYZSNf8A9sFrWS2JpxiEDpq3BrYxak4m9DYaTO4tqgOa7NoyR8qVK3
	dlP3Yf/Q2JggwDRvnZajWKudKYHhbLG3vpY7DUqRHTTzNBJTLOSvHP5Ntyt0Akb6FaefgBjBrkrak
	LDIn+CtPdJr66JyIu253wIUss1Q+cmjbTdeINoUyXpSw/QGNC1OPguN7L7+b7M4tfYUFMw5+wDI1I
	ANAB0yCwwzpwLHRLDGw8ztTZ8/QQzUqwAn5up6zfwXhPXK9PlALi74pOFi3uuyQY74LvPnBiNoGHo
	28JKWWBg==;
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnZ-00000005Qtc-12TT
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:03 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad881b6517so2736fac.2
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082439; x=1794687239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=boAlKmZhAnSEjyKx8nKFVkQ3l/nt4gG98JRt8SYVseE=;
        b=LDzA6ROXdhC0bkouzg9M4Hd6YwcgTCT/0ySrKHQfedfheahWdCuzKMODEYD6eV0Iva
         VAlSpCfU00XO5POND9qPNeL7jVwqGVJORo9qBm7yCpihnmtM4e+Ouu5TO+RDPAwOTnVk
         xRGl2bFqPJZ1AzWGlO/iu+rYkXzxqDkW5+LwsWvIsUQEOBub19YrDeMNX8DMmKEwwIGu
         Ie688fBznwWOuP7KrjAFve40+kVEF1VJjytvIN1nNA1qFBRS6swJITHkfrKCMlTKNJS3
         HaUuoxQPBMt1ltClQfqb0AnR6NIBBS92Zhu7TLa3W1RbgwWK/E/9VH44jjviiEEasJYp
         RgSw==
X-Forwarded-Encrypted: i=1; AL+hErEr+kcByTptaaNe+vZzb3jeN58jTioe243SPT3KAwS4ew/aAFiUAso641E9mMS1+nrspezvTNB+ULybIDyf@lists.infradead.org
X-Gm-Message-State: APuU4Z9/3s+W6lQ1DgtU3Rqh1EoYLdenvFjgHx1EduyOonTnmWB1iJum
	61Hm1hPjjRGxWea3YCU3grSj49xIlGGoZNvSroXLdLAFaKkdjDeMgXmKoqv3QV7iu7c=
X-Gm-Gg: AYBFou0GVOgyPwZ/KxZeDEifvevmIrZfF01oImfWRjO2/XAGNgpOq+L3qXrSodzUVgp
	0uUfDd4sXKix3rvaKcigq6JLsUfz6DRbLr2mjJJilIpLFwpFgLpLV/+XER4hwWYkL/sdBwydK7D
	8hhgdbpNHk1v8muVG6mxTaIpgM2B/+D5qnXJo51i3gEMyIOnJdTF226w855rkg7O6Y6n5EtgEXa
	SwAKvBiIagSjOF33uqQv+vsbUew0NKd7kHcUF302d/L0EKk6FCSEQmBZieqAXhimfkNvVZ2ev0O
	dbWWRJsBP4p5vAE6w++Vdr0s5qxIVHgHIQYboa5Yt4aM/I3+bJseAmUlyEf1V1WMLisqtwi5Usc
	v5ccknIb2dv+R3rMD0FO7OlUiDXo/m16xr+jADDsRYSnq3+pR5s2lfuqGU9ht4bjvaHl6gE/k0U
	6C/g/K1AoMK6eK02niOVrwP4nITf0rwggwZek96XeN9E7gPNm2s/RBPkG4eNnTHXlagwUrexmUC
	0po20iVmpAKKDe1gyBI4g6/7RR3l+PrauLSDz2++zheiYJZJPUalJlS4GiuEpGibdxNG3tLyM24
	dWgI8ms6ef7feHiS/L2O4jaMX70asfPPfvtBAMAEEPLvNqctT55N1nxXcAwm
X-Received: by 2002:a05:6871:2218:b0:494:a2cf:8dce with SMTP id 586e51a60fabf-4ad986b296emr3644337fac.4.1794082439518;
        Sat, 07 Nov 2026 12:13:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:47 -0700
Subject: [PATCH 50/58] mtd: rawnand: ingenic: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-50-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201401_559251_C87FB423 
X-CRM114-Status: GOOD (  17.33  )
X-Spam-Score: 3.5 (+++)
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

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..775ebf4dd3b9 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -341,6 +341,11 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.exec_op = ingenic_nand_exec_op,
 };
 
+static void ingenic_nand_release(struct nand_chip *chip)
+{
+	kfree(to_ingenic_nand(nand_to_mtd(chip)));
+}
+
 static int ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
@@ -368,7 +373,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +382,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +390,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->dev.parent = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +411,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ingenic_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +446,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -461,6 +479,11 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
+static void ingenic_nfc_release(struct nand_controller *controller)
+{
+	kfree(to_ingenic_nfc(controller));
+}
+
 static int ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,9 +497,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, ingenic_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +519,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +536,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
