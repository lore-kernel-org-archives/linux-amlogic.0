Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB649606D819
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyiANnIp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k9x7h5kJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tN7Xrq1dZGcoKBrGLfLfx5j2SnTI37Tg/Dz53rz8SKg=; b=yyiANnIpEr71UcAFRZnkwJ3tgG
	CvDhG8hq0IRaIWI6U2rSXZZSM163E/vhYEnRbznhv9MHHTGUglHQcwGN0zhpfWhr9s1KESlNRdSQH
	8seqQ0flBM8LZnqSzfpWIoUKccyNkLCxxbcowPcdri4RuXyNxi3d+/mDWg7DtIELom8X8LUxSOs4A
	fr4Hu+36vbwbZ6Oh9xMxSpaEkga7nOrrS7F/Q1gX5vbS5nrhhtAmN9AkS0IXg3DF73Hmt3UYWrtSm
	fhgy5gmm+uAvz3BGgljYmzrspd1gjoUh0dS9WdRDxBr7KcWSwbrZAJR6vroo06n/5o04pF/D0qscw
	kFtf2sGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmq-0000000FHYH-3yex;
	Sat, 07 Nov 2026 20:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmn-0000000FHQ3-2i36
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=; b=k9x7h5kJx+1KmsxQaC1BG3T1KA
	ioauMMATBg9i52x5Q+UMjkMjKzNXGum8eL9H1JAUgnq2sJU+iPp4Fk6r0CTevWk9g3mUcSI9GNIoA
	i8AQ7PVYWAZHQGLMvRFexyQr4G9n/2S5AXeZgEFtMrQJfK/RVLBNhgKZYp0Cg8NO37aa0SU2iHhSB
	eMsANu4zg9nUKaP1RFtZuAp1hcv7uulLTr46YbJWhiVSUkj7QZ53Nop7DTBDeMZ68z6ck3u/U2WXH
	YWywZWPjvnRcJO3bQoWAFjJRhLBSNu8u/yGu/J0V8u/psL1rvAfGLbI1ZnFWZl2q7oq/SvqT8oN3C
	zTTnAqgw==;
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmmj-00000005QMm-1gVg
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:13:12 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adaa0f72abso503258fac.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082387; x=1794687187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
        b=2wafWiTvhbV4PhEpcweylYza2MiCZJkFUEcuAD35/jBm4DA14K5ezMiRBS64KR4oeB
         GaWFcCFvu+2Pr9sE9QULUz+oEDevJ0BJs3wCvbHOToS7TnkOVn06MpE+EDl4Yi8KOChs
         CWKv7uYmBCrWq7oJyMC94XpPVYmKWYDXFA1D7ZkVjo/OaDBmy8pqDl6ZBs/cb3R2TMMZ
         VHFC18U+wwKneRdknoteGYJeippimYFDC2dhnzFKZvOXPljgVSFVGRvXm6a5Xzj+3UQx
         bZOAMRjW4kvmyd/vhvh2tQ8l5BSQi+yBM24Z96rS7perAyNlkkozrHYIWVXa7rL27ZW9
         NM8g==
X-Forwarded-Encrypted: i=1; AL+hErGdaBjnR9FHipoE0ekzFRN4qMs4wBvizWDG9Jf4xweGDa/s4+WpScHg1kpEvsJdeF8htcsg98EL50ZI5gPr@lists.infradead.org
X-Gm-Message-State: APuU4Z+oQWUxdP3KYT/FroTtGX4SXOqkNtucgt3paDmZNQXkBku7AlSj
	ICQpr9vxh267VTlukQ8xTtwZfbnc16u2j/Ri0Dgf3AZpBPfykX+lQNWdZvy7cIiBMyA=
X-Gm-Gg: AYBFou2U8KrtqKLcfkhlT6eMIdh/uh/e7PtyUBSCU0wfP+7i4qkYEa+JFjtOejwaP0I
	5uvF9hXnAOsw2A88gonC8yc3Spb5aEPzOv48PyAQTsz5f78We4iCS6Z9+8B0CwRjH/rgbh8CIan
	TYxKh/dTgnMbIDrgGowOkMYgzCAqFgikF8J8yFzHdsOedOvzUWsI4aVRm4fPwxgPDM6JqMyQmY7
	1qaLFJI2EEhEnbdyW/bg1kH/l1M4ysDZBnOP4JHOhkZFLC+B+bczfiAp4s7lscjgi0Wy+4I/kap
	Pv1LV31r0urzVmGHLc7d9amszdZq2uyEizgVzknMarOCOxXBWVCytZWEAeJVTzQyhXUpwBzzcnE
	VDdiyTXtuvoxxOJo21LzW3kR/osRMQTZuOKspNmZ+tCNoWWCgFa4ZgvXJ1ftT5i0KNebK+Lt1JN
	AYyyUQSdysaKC2/KIS31j8CvGiPXqeWYaqxr/AXlIrpLenLDXtAhnMJHL0ChWctCtU5p4YI1J9Y
	/yAjpy+5erE6qa+H5kQVnuWmJIeK1eSG52xyKFL+SQoljW6T51zgEpC78zOVrmCobsUF4qDvj55
	9NFdizgQ+ej5hXDTYMj2K9h95+A10nzM8BtQHb9cfm8u+mOyNrWMhfdSvxSp
X-Received: by 2002:a05:6870:5b99:b0:470:e96b:43e5 with SMTP id 586e51a60fabf-4adc0c230famr1253184fac.17.1794082387495;
        Sat, 07 Nov 2026 12:13:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:29 -0700
Subject: [PATCH 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-32-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_201309_407259_69DFCC6A 
X-CRM114-Status: GOOD (  17.21  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..ef0738c4cca1 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1024,6 +1024,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
  */
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host;
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
