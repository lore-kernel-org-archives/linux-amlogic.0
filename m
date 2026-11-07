Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3460A5BE9
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0U+ipBPK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R91IVKrk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gru9FfAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NEbLbcFdE7v8bMrlti++rrgL69VWw54+7ZMsfKqEsUQ=; b=0U+ipBPKgRXSHD1MME60YvT3mG
	ROMLBEzZcd5MacntVjH60YHEtU11a5NDtDcuk5/508MIe57Ekc2kLUT+dusil81mRIvEdHStBo7gj
	5KRulO3j6e4EnKlUrdR/OPAQ3rbdFanCd+yGA6VjI+6AFHHaRN3/8PbiizWOPpKVjY371/GvBUy8L
	0NHjJx93QpLipcmHEqVqBsrfxb1ILvsyJtOVXtrZ4quZEdM4cbTkhUOE9Pb3jmCVJSjd4Z2dLTccE
	xec1AD1m3dJ68d9o/dvli8B7tXKcOqJXabF3d0ahg3+6iYYm11p2eGawJWamU5lP78ARXDBDekoGb
	6w7UpfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU3-0000000EToH-2B0F;
	Sat, 07 Nov 2026 10:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTj-0000000ETGO-2gSa
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=; b=R91IVKrkAreGrKw+IAov/k/55a
	lTVrIsmdPsbGQeuzwlWmceeB3bKD0cGc+esgL3cIe1WgJYHaeLueAayOdna9sSzFLkwPvieG4f6/c
	y8Yag/Pdb9FCtIWt6VubeSgWAOxjewqzlifzQ7nG9TXNp2rO+BgOuvKMxKzzXIJz51P5/fJjJdvNu
	LfopIg3MW7sv2H1C+ZgqmCX9xjm9rLvnt6OUV8qWRI7RV3BIwyCYE8HDsJXmpyhBMDunnmpyAlyZP
	c0WYzWwy1mIYItqVag/4M7AQZ/HuXWn61iv3O/Pvb90e7/eEBU2O7wl9wg8uCpyTTrZViOGvVKFyr
	69L2FRGw==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTg-000000057fW-3WHP
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:54 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-84a248254f4so881762a34.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=Gru9FfAC/gCMFtGcN/T5HxmLn1sjz/UQ54Sh3JhfsN7jCGLJX4y3FAk7MadNkhIEuf
         wbaIQ3GJLAsCk39Jq6Ke0Kg94FZJdCg36kcEiF15C4CjogDDgBdD3Zof/ZYgrUrdGm49
         uO7kAIsPxuuea2shR1BVuufuNo7tzvBmB8Cd4JL/rZl7nWsisTzf+9QbakNb+OqLhAVj
         ZgG8ZljPcxG4V1D7rtFx1Hg1iGw+iOha149l/vuzjlW3ABQ3P4IS/cyUnffvuF7iHTuP
         WkFO9pp3gPcNvvswBquROO4d3NoZ5lLCJo+kGYYlbaIgjtL5C1XobMu4E1g/273cO+h9
         Om4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=PCjS0ZnI4cm6wTXBUXg2DecN6Gc+2uxlhBl6ji/mvAqv3tmyCTXc6zt9/TvdOmtk6j
         Ohr51mlLsupBaNBG5e+1gVg+8Wuv/u6g16SqSz3NjznXri1YYJQNDArzYMBqX117MzuT
         yaGoDOCVGzj8RAylyRsEaR0mE7pRc/f6cSgnjmTTY/gY47J7F4gg4NWvjeiHtNohXgdk
         Gx1CNI5cFDs9BD7Obz3d5Nkg+LH3XzYWkEbPn6vijnjvubOrfLl+coJ6lQ3B5rF383HY
         F62mmC0trm1u1rk2URc1L01Jt67yREi0/fm2xJFJ0MSWZuEX3LMbYAqQmyghgMRXGz3+
         OvKw==
X-Forwarded-Encrypted: i=1; AKwUvBxB7M54so7j4BFdUd58t6ZjmzgEuya2s9fpqF7+ZcZnQgXO2l3/RgS8JUTdJ+wcgi+Om/Z4J02EUIkR2W7I@lists.infradead.org
X-Gm-Message-State: APuU4Z8OZ5LJydajo+hGJc3tquku00jCnN+nmP7qs2eK3y1rQ/taqHLf
	lLiSp2D9hyD56CkSLs5IRzeEEr1mac38ax6Lm3rfc2S+RbDQGDiT51uk
X-Gm-Gg: AYBFou2T64u2DU26emmOThgr7tBdaaLuupav+5mNJgX1LHvTQEbXdK4KWxgHL9cU4q5
	N8W3WzzXo1eVh+fWHhyYiPTWAvFShD9bDJwlFbk0DkDmI5qMTQkTj0DAQv/RMp0+0jaCdwCd7Wd
	NMdBo6bGnxjuN6zgJWkvllV4/JGusY9pFpmBQpui3SM8dk0EKZQ3MJVx7H5qvfEoAu1sHUKBtDc
	Be46zA/ZR2w4wxMQTVAsJe6J8DKKw/G2b01A6bIs99HSj5S0RjZD6RAOCZh0rmdGdWlowAyeh0K
	4Bg4jwGtpZsABCxmmafKIYRvFFPvSxrWxxsT/7WtNA6KHK3rWId/IpCfZz3jMyAKr0M7BLSoKbn
	jlxT8iLHNPQj7E8hJOPK5TSftTj0/ULyrn72KZKXe+AnYoOIzSDzaDsAoHLIHdkujLb/IDwpLNk
	qxfnihHdHagdrNsOZRwcGiD7nGWb7pJJ0se0cwF1vQpXXtxo7RLNOF3HlWSmEkSpHesXn/Apl4/
	RaV+SJnE3JlNgcoqFV7QoXQEV3XO89Su5JqKxrUnGevrdUON4gcs175SsBlkQEFu7hBdk4uesea
	1lJl5UTGItr6mLum6TrAXkY1DrHnPNDlw9wCyYBz/iyfT2WxcKqp8iQFxacU3gYkA9I0Q8BJ9WV
	CpaCbforH9QAT0uPn2gzsZmKd/MqAWjvJZ/3aqVKukuhJkhBWOewVolNUXNWuC9Ak/TDgzeKwyB
	jFr75GC4fYdN3TAMV/ixf5tM9wN0sbTse7UzdXPP6+HMKUR7PvRb/RqdS1SUXaDkt7L+wOIGeIR
	w==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101652_784695_48EC7B7D 
X-CRM114-Status: GOOD (  17.52  )
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
