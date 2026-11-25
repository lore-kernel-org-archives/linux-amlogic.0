Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C90606A33F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tuqZm1X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dCmbblAd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E7F0sraA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5EYqD8fcRBfonb9TzbkG4scLnVSKl/qvq6WwYUwZKI=; b=0tuqZm1X1l3nEWE9byFSXkEZIO
	RGOf2hrvhB72UQlv4vNANUZTCod3I3YpG65PkvDYjhgLKxlvSeqoZ3EktESlh0IAAtH0CovJDIKrO
	8qSyYoGBHHJd/kFrcubZj7joax4suLDEWQ+v9yig6xOFkURQmjQV+NVk2zY7LrYRwiNxPQrR+amhT
	m27X/5i+/HTRbjmd+CTmXdU3+/rW4OMXWbw5O/Ih7zf6S5WUAjp/MTZ96W0eT/jq5OzM54q1Nj3iH
	QBTKT4HFbncHXregF4B1w9LpkBKzFbLuXsh47FSPBf2uGnxYPmt1naDh7Irid2QWY7z5PvanuYpwD
	9+mMUB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGgt-0000000Aig5-3t7z;
	Wed, 25 Nov 2026 17:21:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGgo-0000000Aibd-0qAa
	for linux-amlogic@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=; b=dCmbblAdnm05wOMn4JR2n79WJA
	8Oy3ARObw7Q1ajArx4RvFEArQuofcyJCU2plOn6Pz6RdGtanDb8A8Berwggll1wZ6phyABSvPlq9W
	jCOX6YoD1bI3y8OMDu+eCcBK7s/bZbzrgzYAdyvXNGqleyrMip4zKQ9q5UoMROygBKQwInXpLTleb
	k199t7WZH+POLuIgbj/AubZAD2Fo75hrWQhN1FQaqPDcL81YLJQ5S5WmHybSqgBavUEHRQUGup+v/
	bU/SKyLzF9Mf7Ihn3AVW1F4Bj5GWzKvfoZhp9YCDOhwC6OyWGmfsi5VsfXH4qe/mdNnt6F/J75AyC
	AZ89FQAg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrf-00000005X3M-27k1
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34882245e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 08:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624138; x=1796228938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=;
        b=E7F0sraAmFq1ozSj5zKtXklrbWKJ/aE450VuY2IohFMDqRVqweMF2ooFm54yNOblBh
         v5diC3C8xWvvH2KPKLFApJFKjzq42bSuA6eIIPR2aXxrXm9i7KcOByooyLCvZEu0PmSl
         hWXdK0GSUUQjEp3ZUVu34mQ7QafoEc9BkQQ5gDyhub1WENCH5iTRF0VpEM1xsiIF6rBH
         TCFp/Oo6S+BVClX97R0LcMcbqiEuLl4KpU8axjJCQh+9q1Z89GNGUZ2hfEeEKoOPoDw2
         ZJsEPwMb3iOu9wNkHjEqQnJm/s7XxhHaujTPL6OFTTWDnb4810Ww3H7AqZGauajoxbdX
         WPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624138; x=1796228938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usivc3aw+SwZhFpcmlLANBBx5LV9rhkWEtYn4/TGjV4=;
        b=pql3WHx/WDvjkXQbacXd60mZ+j3PjVBiflcOnMnBA3MlbiCDfbi0iBSpWr+FnqGs4a
         6jX64mFLHC7ws8WUYNWIFpPabuGNZpEgBzypJfOudAu/+WzF0CzEdQuOLqPCm+645Daz
         UhvLouTyUG4KU4sm+K3icDVKbwfpi5wSNbWNFV73HFwbcyk0dDB/F3xXUOEWYxFxyVAA
         THMkq9IJv05tmD3Bgvv74krASOdfi3rLoolMpNQGSdmvwlyd56Rves0+FhsZEGLKTrPQ
         EPVt2HR+a6/QtLLGjJNxy3rAisNymq8oerRIlxKJG+e05g8Y0Gt5+kLgXju5/g6kWITv
         nE3A==
X-Forwarded-Encrypted: i=1; AL+hErFt6Dj68kWvl5VQKfzPPLo4RvsANkUP9bcScmh6OgpwGLtlIwILDCghbXuGZjzRfmamhzTQtZbUdQ/wy97Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+slgRNfMt5WYyfqqUimEQJSLSvUyGW3WqDNVA9UlulYPGinhsV
	wqN+aXjxtkOCbkpfMdI6OMZeEG2qnTaJdxkk9ZjlkpuJfY/U+ruDff6uYNB9x9MQMFA=
X-Gm-Gg: AZFdTZch/kTySRhK1m5rtSfYVcuD9A2l2BmcRo19AHjLHyoDiyyf58ZHawYVX3Kg3n+
	7xVuedwDDr6Izb8kmcqrj0FGgt6XHE7KHSk008dLVs2QswVf/f6ZcvcF9QnMVEXyjWHoZLZcRla
	XLtQxK/ODWvIHKEBbj2+GTpZxIF3A30/8prj1eju9Se1VZiRGzp0yEjMdAO5Lg6K1JisZ7u+fKY
	reJGACMRh8CELDDXtzIDK5b5w1rf5aVXAgH/OosUhG5nPhL6+xzusYABnXHJPLXJkiZq1boHnwS
	iJQseq6SHmWpITNBPgOcap+C4rdkfelxvth2UmlaFcEX7UOYGU3LdtsNei6a5Y6DPLdjYLWQFGl
	aULJx7pUqMmSe82gFA+hif4z6uUzerWzNrw28XPbod3qC64zHvfGrD+R0e45nr7jHTS0yaGLjxK
	yTQgv+1HLqU92hShOiuXEASBLYpY8cJMKWcyY6eEI3pW/FhDKqHDC4UczZhzVvFwdSrkZlNdky6
	V7eTMgOFTzqS4SKIyTzVQ4JSIoIbG0MPAB5bpy7OkltzMOO/ytxW4DEgcY9PNLImDVHiFDeE9Gj
	IJynABltqkdRcLv25PFKV9lxCCOlBBoLW7Nq/WnexyQzzw==
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr326163005e9.33.1795624138113;
        Wed, 25 Nov 2026 08:28:58 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:57 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:35 +0000
Subject: [PATCH 09/10] mtd: nand: Unify list terminator for *_device_id
 lists
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-9-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=3557;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=9ka96uW8uhmroEA/0ZZ34Gp8KmZZTisL0Zd9lgRMCU8=;
 b=yB/JEeg0v8nqIyAE1Ke9wfd7YSoLKw89W0zAl6SaarFMyVewyRV7wv5K6GuML97H9SyfICVK7
 YkN/iHx9aUKBHks9vSsfAxGp+5LM/eiSvtDjgwuVeS/5BBkSfzY+erw
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162859_584312_EF0C50AB 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/nand/ecc-mtk.c                 | 2 +-
 drivers/mtd/nand/ecc-mxic.c                | 2 +-
 drivers/mtd/nand/ecc-realtek.c             | 2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c   | 2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c | 3 ++-
 drivers/mtd/nand/spi/core.c                | 4 ++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index a3a285170fcd..854f513c4952 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -530,7 +530,7 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
 		.compatible = "mediatek,mt7986-ecc",
 		.data = &mtk_ecc_caps_mt7986,
 	},
-	{},
+	{ }
 };
 
 static int mtk_ecc_probe(struct platform_device *pdev)
diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 41ee49419798..30434ec8f6a0 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -859,7 +859,7 @@ static const struct of_device_id mxic_ecc_of_ids[] = {
 	{
 		.compatible = "mxicy,nand-ecc-engine-rev3",
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mxic_ecc_of_ids);
 
diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index fb573c7f2280..a59b6ecbdd19 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -448,7 +448,7 @@ static const struct of_device_id rtl_ecc_of_ids[] = {
 	{
 		.compatible = "realtek,rtl9301-ecc",
 	},
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rtl_ecc_of_ids);
 
diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index 4c1379343fbd..9efde604e0eb 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -587,7 +587,7 @@ static void omap2_onenand_remove(struct platform_device *pdev)
 
 static const struct of_device_id omap2_onenand_id_table[] = {
 	{ .compatible = "ti,omap2-onenand", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, omap2_onenand_id_table);
 
diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index 8c2d3866a6d6..bf516130130e 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -984,7 +984,8 @@ static const struct platform_device_id s3c_onenand_driver_ids[] = {
 	}, {
 		.name		= "s5pc110-onenand",
 		.driver_data	= TYPE_S5PC110,
-	}, { },
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s3c_onenand_driver_ids);
 
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 22756832eacf..75a012770f63 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2104,14 +2104,14 @@ static int spinand_remove(struct spi_mem *mem)
 
 static const struct spi_device_id spinand_ids[] = {
 	{ .name = "spi-nand" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, spinand_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id spinand_of_ids[] = {
 	{ .compatible = "spi-nand" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spinand_of_ids);
 #endif

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
