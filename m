Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BEB606D807
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnxH9veG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=biICEFDz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOIlu7SY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q7oOIXjYQACi5d5FKAWGNRPPyHQr5IZ5I+BqzxfFKu4=; b=vnxH9veGTSDeiuWsyVr7JR3KeX
	YjD8la8p2yzDpUJnRKCw6Fya/LSuQRZXJpvsduRO62HPvfPFJxMl2aIlvcq0xepW6D+LbDjVqIPPL
	hvqYVSSCJK3mPDZkWkf2xGWq3+JpQ0c4cgQfXS80CF4DhI+H7tqCHucbpi4CXyU3vnOfPyuxDxhPf
	nggMSZIG3HzjWYkQbbhoiN+vU/4Nt/zuOtCRjTIin+rR/dizxysw1Iy4oIBHTTEmpzIyQbJzQvfkf
	WKa0A0NyZiGjEz60hmr2z9hab+aXrkDGkYJ5AgX36759+ZSKpbV2iJ1UXlBRAdu7PE63ES2t1XGRI
	985bY23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUR-0000000EUOC-0dZX;
	Sat, 07 Nov 2026 10:17:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTy-0000000ETh3-0Hft
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=; b=biICEFDzD2L9LHE3YWg1RNPCeN
	93y96wANPRN2d+HDEh3YsJu6Etq7q5+rn+7vqWNZtqLdvisYjL6Md9JOjTdLIpTHD5BT2dF4mfaKG
	UhIKqHEURJAFv7D/Wsg/KQTkVK7RaKdyFTOwiKbqWqbsmxDR47PIBqtd2zot1+p3iXg9nKPWDwCln
	RwMi6rNpTMTuOOMG16DfbQfzSKy2yicB8jNllPe0A+oa+74/ZHjB0Tt5a3sp8zdnOw4Xj3W+h9hLa
	4C6CKPLGs2SxKJLp6tgbXsNog1FYHTdDQdb8EA6u5EAcnyKecBnXKXD/SsRTNOMSND2QjNoiNkZJH
	mlhpP9Sg==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTr-000000057m1-3cMA
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:08 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-84621d8c7aaso620717a34.2
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046622; x=1794651422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=QOIlu7SYcCLM24VsWGcYnysTAg8cGYuZrVClhlwjQ9DE/ckiMMRpjjUtqvyusr07QE
         5XLYoNd4wLYWZuSymfjR62JWVeN6mwJljdzJBqy0qA0JRD5kYAJL19oPWKfZaUCPziao
         0iM+Psqbxs/ltq2Hnwp96b/nKItY2iTqK1NgJx8hOTiB3IDDDvGLbgUZMl1l1KQ5ajZa
         /9TXgb6FYYjE9kjbR936eunNnjoJLzHRlX1UcyYFHcQ0ZIbW6AJ/RI34lvaIQrXHN+Kh
         pL0lsrQXpKjMC/5Q/MaJKrDGDySqBbWe2Hx+GBt4qJATDqHz3NlxDr3dxwhy04dtkQ3o
         NMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046622; x=1794651422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=ctseD8VCLof6VTUS2vbMFW7ZwI7cA1h33QQ6fMPgrn1Evh8U5lkTL8KyeVTm/o1yit
         WvYc5ln1vOtGNYtuNuoppIEyrOeQUhSrsriJJzpF/oRUrh8gwIc2F5VgNYdgUPiZkFkK
         2aiE0yZrBkiw+Ge7vg+eg/zOajjfbQKURrs6hyyYjK25yJpZPhBCzg1B3b4k2rM5e9B7
         0+c34mlWEV/Kk5b1ki6+Qezbye7VM4/MaVTFL51MoWvjWkKSNGLMJ6tNh3kmjxVKjVPr
         liiZVHkLHjF7/cKQcO/ww15L8tTGpbY3R9KCA7shRrqOeRZl+ffr1t8YIQ+EWJoDYjXl
         FjuA==
X-Forwarded-Encrypted: i=1; AKwUvBwh6c2RcaDeTS5q3cL98id9yVjMFS3iQoy+R1JJoqeryNhXlMwWbtZ2hhSVKmpExxRMPDL0SmIEgJwlRpN5@lists.infradead.org
X-Gm-Message-State: APuU4Z9ESaqcdSbdGvaef1MXLdcr1uaU8SSf8Ikxqmzgv5B1krmJ/0n8
	egT4w3jHT5TUPhAgXg4lOlxm8I1xuO/QCI+b5jFDrG1gFk4R2K8NjIYp
X-Gm-Gg: AYBFou1wvxfe6r/ORlXG6djTpMyGdlb5m8pK3FJh7m+5DOr+TVdiTjRXsj9ey13zCDG
	VB5oj9WNVgbb09LlbKIojNN1M/gxDEykO8IdrRgO82CQDqwK4UDZ/Vr6njGTEDqSIs+K970UHct
	w4i2HrgMZiKw0SQKd73Xo9rZgRGhfMa1PucVA3ZLrMIwHncFpPsrGi2GkuF81atNYqYh10WQypt
	oUEETSyjtzD1p5+pNhrm1Pgfvapk6VfVqd6GfRc9TvT8aKIPu9xxVYNgbCSfCfSOumfQnNEI+H+
	U6yvdW6l/v+myz5n+v33GdgGTwjGdLat3M3OJXLsFhAwHfxKOm/Q5BrShkG6re1SItsMyBU0DSe
	NxNtwLzWGqDb3fkagE9wj9hurAkPi/DkCAFCQkv28k+uu5zBYeXFQk1UHfLssgIMFSlIB8EL6VR
	+TJBa5fbWdvgf1MeTpAt7UGaOxhjASyhw7RWwJI0C6aDraXIlp9LMrVIfPVBfC9nnyOiMGuUnyi
	7gdIkhasyAOB75/v3CVrZfHV3eHPgS/8HfcdKk8kH5tXND/g5NS6zZnu1dsxootepceixmhngO9
	2eQKuCr/+mslK3OgfdmACpEYv1SwnHUaDB/t3aGqS23ebLoz/BowqUThsB8UbLDXD9Ax3Vtn6q5
	158kJiGlCCZy2WWUDBpsvLIQSwHmw9SytNwYTALeTsoS5hJwO4Ij8V1F6H5W/+AdPwapra6qy5B
	UycRkw0+uRCWSzxRNP0RWs2yPDN/UrCnX39nx2+xVcHMIyiT2IMDUW
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85f1d00201dmr4359887a34.14.1794046621892;
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:10 -0700
Subject: [PATCH 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-13-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101703_894575_AF04C132 
X-CRM114-Status: GOOD (  17.55  )
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

A retained MTD handle must not access controller storage freed by
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
