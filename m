Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAA06083626
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKvTwDKy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw6X05he
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bsoihpaUoADGt+7+Vl3iAiXkmN2ZUi7qt/ymW8Anhtg=; b=QKvTwDKyNb9bDKmy5Z/0tmUlWs
	2miyjp+u2CYmVcyUU0DWOF3BSk+O8y7v+xdNFylDj3QRNzxVmk7HwAzRhsuwbSf1DdTCy5qc/+KDn
	5pCpVWsdk10pCD5psgg0eDPTaejNXE0RXbzehequOuHi18iczfZbllbPULnkOtfBNjumCD00jU+kf
	SYVv0HZS8l9/rTKqIp4HSx9RusHsCTT204m1hnzSE4XW23q0U65gd67AhtF8Koe6DodeigmECG9NP
	ORP3XVSVPM90nYKubaIO4IaVg+D6WgamiobF0wNG1kcbWF11AfYwrQ+6BcKxc43SNANx+yXPbRyen
	qRyDLk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVK-0000000EV8D-1aTZ;
	Sat, 07 Nov 2026 10:18:34 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU5-0000000ETpd-1oM6
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:28 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-8439fe796ebso990619a34.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046636; x=1794651436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZhmXh2sTJWMyX9gtP0zRdy0goXPy7ysG+XXcBHxYuk=;
        b=Aw6X05he5+EunRjLH660Upr9OeALXAn/NtiihGd61SWZmMLaZ7zWAFMLqTPnzGKIgw
         FVIK4WQWqrqoBGGXAUrIAXx3JDPbQQ/olTy4bgRioGf33NN0HPOyakApxyfIqFQwejpN
         QU0fVU5gIL0OMfLm4SooD1MLvAcfaX38OYMVvsR5kKYi/i+pt/fEebR9SQ3eiWLJtq2H
         g9z/jFCl5eKWu83l3P9MnRdAorWKFFn0H5m0WWdLCeQckTNEB6l/0ySqNevKHRiLQeuZ
         TYQiUOe64EZG3+W9Pvbyf+M5rkde2oLJ8ybYBW/pYjniDOSZTOAuaUAPVLh3TyzyOS0U
         RdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046636; x=1794651436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZhmXh2sTJWMyX9gtP0zRdy0goXPy7ysG+XXcBHxYuk=;
        b=YxCE7LCQFL0PAglrzrXeCrxXQDYxcefM28ts5nXKuCRNoo9ugfQT+jUwmD2OdhSlk9
         y97I046HyubRc5OHM3mtiDSSiP989ukruYPjdGAVPIru6U97i2PlmJSqhoxYx+glojTt
         celoUILYDoUlnLiDDfHul5vtFcjJHtWKG2Tg7TsLxh4bjBKqG0rCwt6Gmm7kYlTpOZGP
         Jzq49CRQBiv64GFRjU3VQAnqR/C+6dn4qzwfZhp4zp2gLsCTTIC2v/+QUpCVImPSuy8i
         /Y+9YnPgBsMCSf+ebZIZ7EzB8jd5zY9fv6VpmWoK916AAU8Y9E57nPbQ30BizxzuuA+H
         5TjQ==
X-Forwarded-Encrypted: i=1; AKwUvByj9B2HJ6byVI47cc9qvLT1YpC6J0ugwSrGVno7qHPXw8GB+Y9XuUNKbMITRCejVxbDPbjzSkNaBWAMCeuH@lists.infradead.org
X-Gm-Message-State: APuU4Z8hZ4AO+uclOyHgAkks4VV6XN71bkCpZKklynkz6ADNalyI2dgM
	Od4KGg4xvh+bm0fE6/DnJVJzXxBDlm4TLHyADw957GSzjculXAZSuSyB
X-Gm-Gg: AYBFou1BRyReeiBHh2kt6880RLabWUF1ngi4/POQix1tU/k4eqUnmN+uiVw2Q1VjVYj
	r/2XK36v5/vM+xdM11LSbCr+/J1IAwOz/kNJcuIX2Gb/T4JXcMTaiH9/s2HVRYUq/cP7AYxOrQn
	kDx9E/ZEbTIwfheVbBxTl3G7OPrPkIX/YPtz+9YWZJALEEwW3ODpf98KInh/KbmSflciY6Da5zo
	sCzJKbHx2BNr1JZkb8efbcoYsAZXtrqJixjfqvYClkOg5i0sM/+BTjThQlFyrP0UT8O+ihTSyHR
	FYVIaq4eJP5NZyFaBWRajOp9aGkiDJOSdWQCWT/Tqz06gaMuXdYl3zU9dwI4rxzzFGtlSOjU1Q5
	YlhHSZ39K/op+de01QJfig6pbSei9wEupf7aDLy1WSPu2F6fx+BbwJFdmDyIagYd2pqAOtp7DT1
	tB21UH8aNqmb54AJ0QdMC2ElNb+OXHGuWjrbtwjBgaHcMGUx1lcdHoux+jI9GrgkVbOqF3c0zkc
	CWarVhCoKSoG5/wuvZ/7XqymvI6J/5X8ZrsoEGgO0mvvFTAoY4tPzQk0pDCvVP4EvQmmnc0wO9y
	MLB/7DdaXJVMgpHXJzm0dC3yFaC5VH8xaW2XupshtNfuhs54B2WP7H2O06rn7UfmDYFU/2RtJe9
	xjiPHEd/qb3V1OiI5d+ED9cS9lvIf/AQZsktH/WTyDEMikFOzqWpweZYMaBMskXitHv7EAjrBIU
	IyDStYHNoQOL8YiZXStHlUzSAGtpaIqJOV2EUgpTs42cztiPDQUhLdqW+jwQj1Purb57k+yHL28
	g==
X-Received: by 2002:a05:6830:25d1:b0:85b:c75:dc59 with SMTP id 46e09a7af769-85f1d07b56cmr5673247a34.29.1794046636308;
        Sat, 07 Nov 2026 02:17:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:15 -0700
Subject: [PATCH 18/58] mtd: rawnand: atmel: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021717_540425_38766191 
X-CRM114-Status: GOOD (  18.61  )
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

Keep NAND chip metadata and SMC or HSMC controller storage until
retained MTD references have been released. Disconnect registered chips
before releasing DMA, SRAM and clock resources. Give chip initialization
ownership of its allocation on both success and failure, including
absent SmartMedia cards.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 59 ++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..10b725fa61d8 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -62,6 +62,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <soc/at91/atmel-sfr.h>
 
 #include "pmecc.h"
@@ -1628,8 +1629,9 @@ static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 	if (ret)
 		return ret;
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	list_del(&nand->node);
+	mtd_put_master(mtd);
 
 	return 0;
 }
@@ -1638,7 +1640,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 					    struct device_node *np,
 					    int reg_cells)
 {
-	struct atmel_nand *nand;
+	struct atmel_nand *nand __free(kfree) = NULL;
 	struct gpio_desc *gpio;
 	int numcs, ret, i;
 
@@ -1649,7 +1651,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
+	nand = kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
 	if (!nand)
 		return ERR_PTR(-ENOMEM);
 
@@ -1734,7 +1736,12 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
+}
+
+static void atmel_nand_release(struct nand_chip *chip)
+{
+	kfree(to_atmel_nand(chip));
 }
 
 static int
@@ -1748,6 +1755,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1756,19 +1764,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, atmel_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->node, &nc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static int
@@ -1791,7 +1809,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
+	struct atmel_nand *nand __free(kfree) = NULL;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1799,7 +1817,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	nand = kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1857,7 +1875,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2043,7 +2061,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2349,6 +2366,11 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_hsmc_nand_controller(controller));
+}
+
 static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2356,9 +2378,13 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_hsmc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2426,6 +2452,11 @@ static const struct atmel_nand_controller_caps atmel_sama5_nand_caps = {
 	.legacy_of_bindings = true,
 };
 
+static void atmel_smc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_smc_nand_controller(controller));
+}
+
 static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2433,9 +2464,13 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_smc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
