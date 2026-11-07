Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4D606EE95
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kV/+JMQw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WB6forK9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkJoHxck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FCp6CkbvvcVmYNCCQn0MoJQ3vkGbNHJkGtRGH/DQWBQ=; b=kV/+JMQwYQqtU4n6U8xH3bbW82
	AbBArPvJjLi8wKnGPpks4ma4V2paHWrBwcBDZkWSvGXCfms9qft1RmmFvHjMPH7CMGZxbKuzmgW4/
	gc6+a34R2vnSn/Kl86VNaPIjyNMwxncz0uotxIRtCCh/7M6cG1xeeiUI3ol7ly9LFc8mnaoYOS74H
	43Nq4P5lNTP/WTSgBnVs6N/8OzcnNFh3KpRCD/BePD0FCLpHyAo31lgwML4e2AGzCc+Zc7G//jxUb
	L6MZ5+ncd3qmQXYHODQeYLceKY14D+MIOK7yCAiPqNardLDcbKJ50Zby0Z4STE4AQIlvw4/csZXXB
	V13Cdexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTw-0000000ETgA-2xNS;
	Sat, 07 Nov 2026 10:17:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTi-0000000ETDL-2peZ
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=; b=WB6forK9s5mqcdMqIQvw7yPgHf
	c0VsuuKrXG2B1HkUYMuCGbIARL/LRmA5S4kM69kSvMHGPOMev44OSTD5JXAiGLs//Fs7Mf3x020pG
	+Ag4pxJqTiNP3AwicPk/kTsSV+tbg2uS08cjcckJz7U0vm/ZhHV+UC2rReorG3LGjHnLCl1VCG3s6
	BiRNM4w/vl6YZonqgDMVQHn3lEDWxi4juYQFhsDBr3HTSjtxajb+8euGj+eS6T42rg8IS47drTZzG
	NwkzFxnf2+CQ7K4YI72BlXBcm9x013zQBAWu5Hwz5jrRCGesCYRZU2es2cLTovosck1gsUeH08Eds
	G/NwfEug==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTe-000000057db-0dt4
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:52 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-85a5455bd3cso839891a34.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=OkJoHxck+VMcTAS0xnYrL0kSobzuhN0x1WA5xRhxBAHU+OyCZKud98NbDtRUUIbBmr
         +y9zeXvTg4i1B0lUFRCErba040dKP41m5yOowPP9jk9FHmrKTayrkTlbHyw5SMBdH/Cg
         jQqi2EMOOGIA1IiMjIzFnz6l7aVcTsVX8nKjG/Bo0bLhPMj2U0XQChZHHImmsa166uae
         qnX5DLUQl84zFqp4j7cNCvhimBQzdB29Ih0S2NyP0G4bj8ULOIpD/bxlcPR/G3rFS+xL
         85uMyUKmH0BuT/1gc/LCE9JdzyrxMla51IGFCHupG6hoLt+s35JcMvz6ZpD6m+ppVTY6
         pTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=d8Vu30KE1M83wj7JgU/3B7eWEQDSDUIyz1dOj8/nA+L92+Y0f8al8ME0MjMVBYYU0Q
         ypEYg6xjUhdq5Etbh1g0PfHhT7Vlo166s2QbhSLC04jrFn7JxnE1atMBC9JfL4ODfz5F
         k0QCDtTXQlmBWvJsvd9iWbx3JzF5IBo0PcamC9ndDisHZZotZU8wQDqTJPf/pdmeG7P/
         WsgFgQxudP/fBYGN7BhLpeHQCig6oYjLsPcXkoIn6fY+MftwFQTqQF/6SCILF/eoVVQk
         dth5UDWpRSheAzZQE7uYo4zzC0J5zmnRg5tS7JE2mOqbq2JtP6U4h0dTbNyjo8XIrSBq
         a/0A==
X-Forwarded-Encrypted: i=1; AKwUvBwRFI8RC+xQ87UrSRV7Nxv4DB9F6bvH2VRGsHKIwZWScWgSNXFMYOrFJjW4Yeg4HU2AmeDZ5IIxveTkepvX@lists.infradead.org
X-Gm-Message-State: APuU4Z+YZQkEj1wS6mn7SpDUVuS7hv+FkWW9lZ+E7qtvDrsHxyUgRmyg
	0AOBr9384qvwGR2puCkPiroKqocaNeeA8FJ7I84bYiXFQiynHctHrBtl
X-Gm-Gg: AYBFou3yDpABhvHWVhx6wDJW1G+obIqaLAcXfNe2A2yFyFgT5GMrKWrHrdfh8vr56/9
	DLQ+T3OsGGf60donva6fGZQBniGSPWvCnj7fHfi06002j0+bSECGBIYNCFUn8O1+WT1N9cdOwvr
	mW3o2SK/lefYAaOpdy5DZGWygh4UZK9aWk/QjW9How0lOTLMa9glOVMDIYyJoGzAkzbG1pIEncc
	nQPjs7h2M7oDtLtZWTNlQHgRIipW7bhjASDTk/0GP2ljLvPrLHaJUym50bvl3a9VJZ4Zdhy7xIt
	zAahOhbyHMqdjiPNwaoSEuxO6wQzb/LYzN+APxsBxTOoUUgsxAn2bbfV4OcPXYSCNq2aLztOGWp
	BFmdQnNgrqTmh5loW0TlXkeelXzlDgzQf7AjFHntlrQODKPAcc/9+ww+DRrefJHlpMeN8552PC0
	qf5Ov2u4drOC3eytBxekJfJSBqkjQQ8WGXHZUqdJw5BXwN438+T7cEcoPcmPuO+pmuLwZpwPS6d
	fu7yJCF3i1TSFafRUDHaQ9PQXzWojZ8ohjlKTP0cz179/i6E42boLLvpyGcpa79ad3IZrcnQi6R
	ICzJqkOp1diT4N8Erog7FVM9rZIjfNhsVITqi84S2vVuGIDL/I0bvxllqdvqeeqfcSuBpWPwCvI
	gMJFwZToiZ19hT6yMy6y3r6pX+vuWGqph/KVDc9jUSXwPO5MGrefBPVet6gIoDxibvprkCDV93J
	kJTFq5Lk1zfPWNQh00uUydTba5rXg0lk2MfEy3S6jSpG3L6ZrrYcm1
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101650_123030_253FF73C 
X-CRM114-Status: GOOD (  20.42  )
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
