Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E8606EEAE
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mzlJ7ieU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oCgKBhFZ4DliKUGHaOhMrpIuMFpSbPAu3O0BijxApoE=; b=mzlJ7ieUSsEE/EksL2KBjRMbHB
	Aaw6SZ2dx13Oc8SKFhPrnBxslO8qcSMupPiwWEOAl/P28MXB9NQ3TeEcZxWHVBUoNRsaE3+IUspwu
	6AtV1JOs/moSf3mHGLNpfIjtyynewnA2gpZDW4Xciimd/eeB0TGf+4ycHCcfuad0AL2B8w6s1ent1
	oUiLvu6N4C7MWC5NqaXwYZfKt62rtZaUPKTMXarZ8TTf8zbHd1SwsmijJO5656XtehetG8q9Lt4hm
	rux42rhCn6Ag7VRckwUR6grRi+CWZCg4VXKzxzjTPtAHcGm6AjuT7KgjWMtLx4rkUwV43P9e5iQMP
	R/F2FFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnp-0000000FJNu-39Tv;
	Sat, 07 Nov 2026 20:14:17 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnQ-0000000FIh5-3UHS
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:56 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-46556b9e02cso12759fac.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082431; x=1794687231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5AWpefGP8ugvxCrGcFnv88cfzYJY+wSyEyfHqNeTTo=;
        b=m6vxEu9lThph4DRTFLJwbre8gIdm7ZmbcjENpSfmW65opJVdbTpWBReUZYpQoEDzCC
         ko3Mbfb8n1BxkWEZBiUwOvXv2sFPOKo2/AZko5+UZSOFQ+URBjxi89SHX8pO4IGtP5T6
         lRbNbz4USHlpHDh6lmM7UKLzS0RC9gLnwpZAnN8HW/+HcssmF7yYtiiebmbDWmSwX+Q+
         19CSZD0z0mRFnT1UrJkjT876X36B7Nyf4hLr/ExbeKbw2qwca9LENKKddYPeQhCOQ3Jt
         eUF2+oUN0BQ81pkFJ662TfCu9BVhjVtUfKFwsTMRtmGmbWOlNuimaOvLz7e+qUNzw0kP
         Vh0Q==
X-Forwarded-Encrypted: i=1; AL+hErESF++fiXM2CWUF81dOa7Ns57csx7ZOCHCut5s06oMebT2DpKdfBBZwShjMKRUA1947N1vvfZr/+kj9ZyAF@lists.infradead.org
X-Gm-Message-State: APuU4Z/i4spnb9hKXHk2DIAee6UVl5aZZnL7JPVGkLqu9DCUU0SaHMNw
	jhXTdtXfZBeX1bHqnVXySEOzhyKCOyRstKszZlVp+uBc35TE43CqMyzkwI2hRlfk7qc=
X-Gm-Gg: AYBFou2e//ImkMW6BRYtfvMT3ZHH/BFF2iAbdneyrhD/tN4KTYnPjQDVnd9Sbxdilzh
	PjSMp0pJ1tVYlJBNNtWTdcesz5H1W/wK81CM70h8OSk0eRY1iDvmdlYH0ywCVUuAt7dfb4JqCnj
	pizoRW1wJkZYlDHhwR/jx83LF4zsPoYdfl9N8lRRwRa3F/KEIrKRRCulwRtQURru//tb+tSdf68
	BKv+iHoSm6O8yy4Rl/HaUwqDzW6nq6Ki2AjjflplxZEcV3lOPnzq8MnO7nFs25ipVFkF650rK1S
	l3oxKAGgPXmovf8+V34f+vy+l70MbRVJ/xaQi3wywE0+TiUcn1625EM8gvhjM2nWPh7M4lT4lAL
	kSFJsh1J42rTd3i2I2Zh4xkXotYoawC17bWtWWpHbDmREFxevo2kKwxtm22FLR8RopQ4lTI77bp
	UMFnkGeV9OroiQd6yDV1OPOKn/1Nz8RgsIU6udOOO9g0SjojjtBU+edMlMRtPOWeMCZXg2kDpaa
	h6T3+M99d+9N761fpIdOfaozvIcQKvj+47v4+2cpP5kSGasjEMIoutfm9uzilzQFz5Vx5Rr5Qec
	QwzSDaEttsOwAg/7CAh8ENKQE8BbWVj1lTlTyDKuvToOtTKHLb27HSE0PgLOROEyHl9Z6YZgO0+
	u8+mDxg==
X-Received: by 2002:a05:6870:2418:b0:4a7:20e8:8d1c with SMTP id 586e51a60fabf-4adc106e03bmr1313869fac.27.1794082431205;
        Sat, 07 Nov 2026 12:13:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:44 -0700
Subject: [PATCH 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-47-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_121353_214323_C6568053 
X-CRM114-Status: GOOD (  16.52  )
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

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
