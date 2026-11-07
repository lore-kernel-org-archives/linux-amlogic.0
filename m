Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D2606EE86
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mt6RIYGs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jsGuwT3z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVlbN9k3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hrfhFGR1+VipmGX/4LFJxHawBu+wq0xe5Agqxk7aYsM=; b=mt6RIYGs3E5Yy0APvhsKih4ApU
	9eG5lD3K0RNWkgfS10qPjL/jfpnjjcPz3aFKcSFB+XZhM65joRPd7+rXRlPGJjMQvf9AAHn/7eCl1
	cNySJcoxLmHx45PzMYduIzPt4pkZgF5m7s1xxLlzgUbKWvsDD43729FSp3nDWkt8mOgjj5mZs3eSI
	NOhc0ca/Y0NOtVwMjuKtUw0qGI0mdplHgDqhNGfMu/oF9GxT8iiux3WW0AK3RNNo8Zg1i85zCO/NR
	UJxuaCxJ3/K4Y1bRZV7xeD1qNR7t2koAUMjovjIns3T5DH/jQweIGyZSGX9CFKNHBq3jdGX8HWdXj
	L4RFdeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVX-0000000EVV1-28Vc;
	Sat, 07 Nov 2026 10:18:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUO-0000000EUHs-1AKo
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=; b=jsGuwT3zdktWBGANuZjIEknQwZ
	N0sy+34dfrRkS4cKjmX80wUyPmUSADNAIDUITqwrGA4n6KXPJrntZt4omhW3kqz/MW8cVHRF0UAmc
	5bE6Jo+A4+1bZkLMyUWZDazcAzuBg+YQBZEPhzhaVAPPizwBxf4CaECSTsOhAQzndQMcWBA9nSy7i
	723NYwpXgYCfvHqBeuYmg4gGDTbT/fJrDYpmyCHVT9UucRwGf0gdZ1DXtd9COhvmtPU/uk9N0kVfw
	GKWO0ZkUoUcn0YRBF/a+agy9RXbAQLdYCNAZzAewEGhxT/5q7O9dAGHZhnXMZ2hMJ8KELGH2lyoxY
	gaJ4ISXg==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUL-0000000583K-0b3Y
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:35 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-843ea301d60so936974a34.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=IVlbN9k3UqfnG8b5zdLFAdPw+n+qDXiKjqQEiZdXOZhl+HnZw1bFF9XsC+n+iioixj
         Qy29+do0ktowbQPPdLyBNjuEqX8sV7dduM48hyUg/kQDD1kZ8/GhWE4YgELQ9hHM0FoE
         7NqqIxveZgLVPM0kTBy0FwPc57ncWghD2f+HOn/p1agwQAyi6iRHKC3asp7V2yoplwQB
         YlDiO67kyz87LwS/5pOmR5fG/Dtv0LvOGPjrxZcTzdUyb9CE3ApuhJm1qKYdcLxkH5DV
         z83DmqmrmM35mUC3q5jj9JsFq95+n5kME2TWRG5gZ8hjam3R79dWd2dMra6MpbHi6ljU
         HRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=OOTT19+R8aM5QRB/n+gQefz8rXn5rTkcZ8L9vDGKyYE1aPVueBZSgk/ElCjD8BBpKI
         xjvrZ+LeS03IBU6mJB2/jpxAHyiB2cF3P6xLXATxt3+VL85RLPG2wIzQp2cUOn46OA1F
         Qzwys9yz2YoO6San0lt1zobDe2HuSSkehCJOdXMcnDaWfSz5Hf/V0oR8xkKuibbH17+c
         ZeVKk2tJzdiAbkDmf5/7LWN+O3xrUF959xBi0WnPXchgA/W+Om1haSQnNsbLBRg5v1V4
         7MBUfF3ty73fLvJwpY8ezDmsacensvZGyQzStVvVeasXVih9/GcMF4+FM2cUj0aITbmi
         Ifag==
X-Forwarded-Encrypted: i=1; AKwUvBwg3qwgYrPm2RkLVpMpfDgB7z10zCcgar91wfunDgtmfgf1G7h+/VVgVwVhZcfriwHGyaXlYBYYJux3kzDS@lists.infradead.org
X-Gm-Message-State: APuU4Z+dFdZNCDroIQPl+5AUY8XpFjEwUGLVCJmQFq73iENRiEnsxkqS
	9yj+nXgueGD85wDH8donxLPDEuXv/cSb+MHCRG/iiSlhy2mAx8r448Xa
X-Gm-Gg: AYBFou031d9ZoZS0QeBiyN53BphlllngFUK9mV1VYDEMAgubLkzrwtTIHv0r7a7mUaa
	9yuZ7EkdQUajKLp5EDhG6UCRFnEAPGB2hVnD6SVhESfU3HyLjqPZ2LRkaXjauMwfHulROkmIlHt
	3LO9ykPh6g6/Gf/Vrkl2I9E9EVp4vMDqsrAsoFZeDdJ9zaMenQQw9E1LOoQy5GwL7zrLzGD9agB
	39/aKNf/WGCSobVCzxJ484KX67Mqs8jo4Yq1bPmmlaIjVFyvWeLtcBLZ++/U1OsyCshc+o6lFIk
	lItExJKV5m734qcJ6qMKljJS0y4UmJxxwznn3vGKMULrpYwrGNRBVpUWRbui8GqHPvkjca5Vle9
	eIVM+XaK0o49moDFGvlAbaC6UlMIKlPB6SDn8+GAM+2d2/iyxGx0nvOZNjMwkmDP2atxFEPEtHu
	E51mnC8xNChynrp/jU55bLvYxt7XN79V6gxqeh015tT4ePPam8rbGZyPkh8UnDuZ/pXtDHq2jji
	xtV3Tc/2UnBYmUe9DXrGaoL8Hc9ZnDF8z0C5d3gjvEZiHYBd/jYQRBXBcltY1T6FjsF4vVzM0Cg
	VbuT1O/+Grr72pwu8fruJrYua3Zi+LFFWeKU5RkLDK+8RVwJTXzz+6oFyhYOLAVqrO1tgovTK8c
	a1tB6yaO9VTbpIDw/LNlwD36L4qBYI6RIZRydXp8oTFd5n2o5OQ5SYA2USJhrbk4WrvWiCK1Vx6
	/Rue3cEpiD/qahxwkqUF3VJ8jMffTuQVRc94aBFhIvFoTIi8yTtvdN1mABgo3mQ4WJFjEsHbe1I
	6k=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101733_080647_3A648EC2 
X-CRM114-Status: GOOD (  17.71  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
