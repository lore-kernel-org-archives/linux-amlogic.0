Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38473606A331
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUu9e5nM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6hMGGdC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1efqv5SEI/11YTtq+m0AiBPcWlaHTCgn5uEZAQoHec=; b=DUu9e5nMjmwoekhVSOoe+LwBv5
	KRf3TNDhfO1vdnnFwgga5ylVuRKyvE40DVb95O2nE6wyGA/m2o+A/uQ7wchoj4tBOh5WHNdIotHn0
	C7WAAEHSQOV4EERJUx2sqNokRJTIzQiKg97B3YWYJsvrSFe/VyNjOtQ1d16EOBf0IqAQ2wnMwrbia
	wNICiw7mI9XfnRcnWefn0D1VnrHHrN6/3wDqrkHaYLeXPYtq5euZ4v04NOwT6Cw/DiCRoipCEQZwV
	4Rseb6Uyh5lklv01eVREoVgmqt99ZKKPfOy+rL+qgtoc0JI4HegCuq8h30IaIww/50aK/gGDs8I2y
	JIR5MLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVY-0000000EVXi-226M;
	Sat, 07 Nov 2026 10:18:48 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUM-0000000EUFS-1KuS
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:38 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-85d363fb73cso858907a34.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046653; x=1794651453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=y6hMGGdCWyr6l2K9xeZLGjVrcSrZFfdTYysTwllKj5dty3YtqN5gLNgb2G96gfAq4Z
         /KOJlaOMrtjuK0YmndV4FizEMeo9aacYCcc4A7vV0JbRv5GzTXR2Ezr+uiclPBpQ62xf
         qTV0FrerBYT/tlfnvoUoYsn1oMmX+/jVXQNTCbxBRvI0H6qyjJtL6qmCJnVKrNxdQG3/
         +li8hPmU8rbpRHxH6RsULM+rnVJdT5fFdYJFQrafLua/8d/tMIEUNoywZo/bkoTHN3q2
         TUMmSfNHOgRjQDdDygJH7nAoQBWkIpOWFzzASoC6U/wWJ0nuXx9xPMoRKPWyPxE5CZ+i
         W5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046653; x=1794651453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=tPGxyFxwM9sV7kuE4FUKpCgfa/ImXA72d5GlxyAfgFpVPazV1akIn1UIPoLFB4iYym
         mYCZD6PUDlV3Lr9A/PUXIxcC+3n8SXHYPQcoiGoMslJ70jBfkWZx5oh6yJ/7QwCNOPze
         2YxaZf38FB7oaOnSHfQkRan2jlDlhbjTjD9uC5KCU3cY6FLN/KhQyfNMGd16XXb6hfGy
         Tr+aaHu+E4pqZCHti9Q9a2k2eI9e/F0IjO/7idWN2KuoGldf31U6pQW4rgKzGqYemHlb
         D7NIajnkjJGNrsvMv58K5b0B25ubmbqS17ttTR72e0Ae2uqhA6MNotEtEHo4pUssWntP
         nc/w==
X-Forwarded-Encrypted: i=1; AKwUvByJ552IuD9u7La1yYMCv8J+kV4PStVwd9j96eMf42frKvKmXuOiBfVyLBHpyqrHgJXWgTMRprU3GxrdcEHx@lists.infradead.org
X-Gm-Message-State: APuU4Z9qaMZ/59q7vZcFnQNQCc9iWjSEgwGZyisaje7tVi9E5nM8qpVB
	yq+eZ4Xfp9AX59ezuG5VUnTIZBDo8b74tPqpYVJkt+HEUyTU287wf9Ig
X-Gm-Gg: AYBFou2rhNSSJ0uNwRpoXsyBLBgCC0eA3NGBSRhxCPu68WY87fQDs46VfyzgLN+FoJQ
	CV9AZtOSI5hHo3KMdf5rCOGJnN9rthQPklkH60m3qDsnIzlNnD17ax1iE9kyH/vK5KWTLt6IhmT
	jh7ts9S6qXvcCX+frGK2JK60H/tSk09VJ4oGsAefcCJvm3FZXgFx7auaoUE+w6UwciUfa4IBabi
	iT3K9nzH3oOKQRLNYTKtbVZ/p0nBxUT2B8MOXuHmLFXDFSNuoBBWC+/lOCKENSqaPZpU7JP/CVC
	wLh9WOBSW/2TUrasaPc+PIR8xWO6U8qXMFy+5I/xLT9ziozyALYbwKzcifK/FY0g0p2G+1T2uSQ
	Hb5OqdojR141IJBahj6XpK26HNThwEjJsZxsgzeSoPV5W/ypaQlH6XA0bGifgBBaxkderUfKr17
	4Ew8qHwvSqp61AZ/GvpIyiUky58bdq8uA0mP69CEqM5vI2bgWVCYC+dMeBYRLsXau/GKI18ndi8
	szP0vI4enAgfJmDtafw7sf5p3s9TmUG3FSBHHw8Xgfwoh8GKG9ustkQVjwjFiet4tShi1bVcTOL
	qXTRowcCYyw7tfgm24VWNZEhEy5YqbmzaQunVSjnyUfg0dlThOouLutAzwJ8C84eIHSuD0soZe4
	5vrPE47zMmWBTDr9wHSycKv+KrRGjwvmM9BEUKE1CXjKP4tn43s9Y+orDw1KF3naGtkHOzfkKku
	/w312rRAYqmGDU8BuZj7GuBzM/kIB7668JsP/CFoiOFzD2Trm3aoFyyMhk1LYwMLyJOqp9DeaJW
	w==
X-Received: by 2002:a05:6830:2306:b0:81c:5aac:798a with SMTP id 46e09a7af769-85f1d000dcamr4738701a34.13.1794046653358;
        Sat, 07 Nov 2026 02:17:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:21 -0700
Subject: [PATCH 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-24-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021735_130435_C567F495 
X-CRM114-Status: GOOD (  19.02  )
X-Spam-Score: -1.9 (-)
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

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..4686f28797bc 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -162,6 +163,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 /*
  * Probe for the NAND device.
  */
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct xway_nand_data *data;
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
