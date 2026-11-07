Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F366082BE8
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y4gGQyGt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DGcAmHVY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KP/8Itrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6VH7726YPZ+Hr4/7/cLEyfbKMMTo4MpL9DwcYaiDeg8=; b=y4gGQyGtBJ/TE91snE6Raq4/00
	IRy3DsmlMEqgBMxi2a13ZZ5UTXQG2UnmuYo0Bv9A6M+fyR7TrSzOV+m46Eq2HxlEjbg3p1lnXOT5E
	FTgxfNuPMHb/ilQJQiAq5vgG2FN8N5I2V6JCpUCvgs5rvqSl93NSV02+wwRzkqJL26e4CiWCPVchK
	vLVsZk3AmsuTcc4u1gH/CDxLuDLPECXXEdOW59pTQ3gN9y8+eMd7rmBX4e/caHNIUOEBVcdnRguAy
	BmxURpM9moJJAEbtz5SLTBegc2orGd21SlLWlMqF4xz692SLHzBX/mSClP8I34z4e+v8XbqR/MFMc
	AasiV96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUv-0000000EUq1-1ogt;
	Sat, 07 Nov 2026 10:18:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU8-0000000ETwl-0sKH
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=; b=DGcAmHVYa4dTbchvA+0OYhAkRN
	6XjZ3rFOWwlSOtILkjjFZp8CU3m8D7gY3m6RLY7xETHDIddyLYrTM74LuXq5wQg5lS0OsylQ/bBk0
	P2JMOVFDV2eGw7ypWxcOjpwslJeo47RFMsZNi/a8KiaxpH8gLbpvkb8u7/iEj9H6f8uHxWFhxnuop
	jmFXVUWsWtU/uzmostjB7JcN89gd1giCbSm9cVrD/IUNKyd29JOeYSvNLLpGf+NAHeer8aXwqGYTF
	m95GzgKX/As1G5aTZ5Zb58AaBaw2fkZc5+G0LlSuWt4YQu6x4py2u2tyCaq1WLpTnarWOHDzxHEOZ
	zDsAGJLA==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU3-000000057t5-1F24
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:19 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-85a5455bd3cso840021a34.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046633; x=1794651433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=KP/8ItrmRohbjLSMjvQi3fTnLzPf53LG3oji1Qzo21o3V846MrJNtjjiVExlTgeHre
         vEkaY3Un/2bz7YYzhULhPwamWZALsgsjPbvB7yLG7Sy8WhJkyGlPNrwcqc/OcKtsQXdk
         mk5w4OvhMv7scNJjKLER4wv+9ZOlIrAFtbCO2QgCcOAQoXTNWdKsFqgEPFU/zVZZ4Wam
         zhU8IewKodBthfttURW88UWVFOW7bd50TwhjF3VvepXbO8vvNdRt+A3tNHI5tGHht7hI
         WmCAd8mZGtv0E52OsCH222WcLGr6eKJnc6pamOmfJMOyxCPZD5ZFZq1C1XQNkqB1OKoV
         CgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046633; x=1794651433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=xdoA79FUOGqH+OqVgdumVeB464uuALTKtpmrD4w7CnoQIwIaevaTLLMCgZLNRGiNg+
         kpiwXKhb7ZRqqPU5G8vEfO8IwrORcKf6uBLT7etZxoCndJYhvOOGk72tNmAQ2oI1vsyh
         3/vDOGfZgd1DZSgljmlNMuOJIHpXkJ3TRO2exqDU2V5PRPiMXyPYTBZc4aPXDcUUzEQZ
         bquvHxviUozX6oN2SD4fO82vE/MRKnSl7lpbcgVlw1h9jn0d7kXBFBSzqB+yggJDzOcX
         Hfq9D4b5PtHlRNx+6rtiIKMC26nBxDZ2xdfTvTbrLZTjRmT2Alu+1liZgc7Ov8VOoygW
         MbIw==
X-Forwarded-Encrypted: i=1; AKwUvBzc9uBtP3N+l2RppJhSC3BS50yGLpVhCdkCPrEAM4RTU8Y9rwrzJatvIOpUIGVBRAhAeoiINADCVTrCS1tw@lists.infradead.org
X-Gm-Message-State: APuU4Z8mqrFtfi7cA2LLuSGXTfeZa/AR2OewF40Pxz7VuQPbbfLL2vbK
	GD3T1B6tmzG2JXFZFht5QAAKrwqH9OW1A3k+OTg3akeqpIRI7bIoz1B9
X-Gm-Gg: AYBFou2HEX0dPPAV4LeZdWQDDLHaxhvXUinLJPb1WK+0ZEHFgiisSndP04/0jIWWS1a
	cDjyztF30msV1A1mtZDLmEMOrEbG4gaG+7/N3OOZ70jxAwSm17jF0TG1FhkJuhBGeT2qm3ZjOUc
	YDtCg8I+dPfEN472jflIZPKDWJt5uEsD3bl/50rmIzTfVCfBCkjm++a1fS+Ks7RxMXSIOsg1mn6
	RwhZnTlo7ZQFClciEHOWbojQbSVHHJ2c+Bm1ICQ626iaaxDbV+PEBBx2+sGZGNvtQ6wWWzwhtvO
	8816mN4eHIZk6FnV2h+6DfcI6IojyBIH/6RV9onkvK7vqYKBaErOc0wfSgRwQ5zcxDI/qKSW9rL
	U9gSoVnbleOIly4Y4SuigwzLDk8tKrQp6Y+inRzwdzXFOW/L0KQyz4/jxBaecEJJYQ7AI3h995T
	ObXHbSshcIoIiW1zm/PW+v6r3zyvVYSubfn3j0WS1kI3MPgRcjKcTTX6NNF1zCWQ6xsB/Q9eaj+
	FBTBhOpm+8bEN7/+7B6jIWrvtXeqL0pbjm5Qdd2tIoH9og4wRsEIwWY74M8loWPcWVdW6CN0KUM
	yl0s8PS5ZINx8JSgBAIJT6UCeIOX8iHNkeHU+aRKLpRU9NJSVjBSzKt87FHundwfnwmMpPyOHtg
	3Fs5AieSSdPTqSkfaRqoaY4UTfE++Y7hqN9+FclxxyEUUwQ/tgrqqTvsuuDi94kygNAHbyKNSKJ
	9mttZffYoSob6m2+STZPJBrZERZZ0x56TQ9RqNKdtiSUvmslaX1qhN
X-Received: by 2002:a05:6830:440e:b0:812:4cc7:4afe with SMTP id 46e09a7af769-85f1cfe2161mr4589309a34.17.1794046633427;
        Sat, 07 Nov 2026 02:17:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:14 -0700
Subject: [PATCH 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-17-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101715_455157_0BE84502 
X-CRM114-Status: GOOD (  18.18  )
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
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
 
 		rknand->sels[i] = tmp;
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
