Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D882606DF4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ctJUWu5o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RvI/9aBW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlCTqxCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XJrGuKic+llYL6d/+aHdupbv4m+igdRQ1VnqyJw00b4=; b=ctJUWu5oKil2IxTpGXwCKaNXoY
	md6lpKrStDLrsiOErtGvZVTyLOFKUDj27+zzVVfKy1CviYN7bfuEFUtage5DcY2/Pof1miTmfYYKg
	KHcm4kN1kQ56ndWQ2KBllIfjrnd/tfCcDYcmrH+1U1IawqbHXzN9iuuinZOgRcdv9aHGqSx55UdE9
	vqgXebepFgPIRmAPTFPlglbe5Jrtaxx7aoADsU7AY3yUpkp9tYWLCynN3wGXrc/BGKpI29fhZJD43
	y6/ozqoYGzGkIUA9KiKRmh1G0XdYwvPV6wfJms/RVaZzVMEy46cZQUZcOCOr7iKLMhOArooGcFgkl
	nG+2XMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYN-00000002ySM-3xmu;
	Tue, 10 Nov 2026 07:46:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXZ-00000002xKJ-2PTG
	for linux-amlogic@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=; b=RvI/9aBWXvjdLRrqipwNAiohTc
	zLhLXRB3C42EmLGlND2zJ6GgVvnePQ2wws+DFoytLW8t8gr16PMMBSVgXebl8KmsLa0h6F6t88LIa
	zzkPClLtJORx9Gy5N6L+Ah7l6/ruOPU7KnnKkYeBn1+O8LNKrDlAnnxUgIXqj/I70SV3uWbqbuLsX
	vcgaIIPqxCXPeOWZvGaeKQrj8UvGmJX+dBUtJ2/1pRu1aFz1rBQOs+SCt1h9tFfnETjx8CHMjLlNb
	4faevE/AmBvremc4V/To+AM9YStt1SQFNnyFX93gKYegP6HVxn1lyhwAz0om+L3+w0EF4F2sMCvm0
	APXm7ayA==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXQ-00000007e5r-02Ai
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:07 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-56431524c22so557464b6e.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296702; x=1794901502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=dlCTqxCEYlb95IUNKsnrjB27kEyVqj7CnSMBefJJtqNOKex8QqDMy7dDxVA/2mxlVV
         rXQjg3eccDUGYbitNoVZe5rnFjxg4F5JfdXixT2zbgyeInrMA0oWk9hZuuJDLmidEXU9
         OqLLq/eaFin0k35aXf0JD7jwyaXFRGVJquZd6czQLPm6XOv+I0KFFkGd2TQ+E+htb/c9
         9RVuiPGOJt/SEAZZrItpvFJZxAl9khiZpG2LvhAoGjQ9ct2pGIymF9grEJHB3nrwoFlF
         7C7HRMUIHCVlztPxbyLazCjpy6+n6sv/AZWqJEsLeMANL0K9zP7vwfsaoBw1VjjYHriY
         hzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296702; x=1794901502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=hCFxv/gvGj8L/GwoJE/onE009gzQ4rMzJDBwR2OQAby/4CMsih17mRIUrMa6ooKZfs
         BlOPh63LtNkdUq0GGxAUQhmaQLd7/SwGoa4U3khEwLGFMj/RrL09ryg758PUM+2r4BpG
         n5USX8gEIDVeQ/iUf/KK9a/LKYmMp62pNaWVZ2fwZvHEJdK2b859fQhBi5dU/xqLYCmp
         ktF6ueSwU5+ct4bxFFgzEgjwu68NaAatA1QMJEU0nlQYwvtw72WH/fwBXMnRRoVs38mw
         vT4n5UEqFH3EqxxYXGayMPo+g9x7SYZQkRv8tY1u1SrdelnTap6ECQGg0mVRe8Fl3FWC
         TJow==
X-Forwarded-Encrypted: i=1; AL+hErGQAaWpk7iEuA/eAuU9SSzFeQ5hEEhsuXHtq+o0fY3bu+ywFokomPfdYcpi26X8IEguHchnJMD63QGyJfxc@lists.infradead.org
X-Gm-Message-State: APuU4Z//vfoKoKXYIm0f6AcgDFvNg/gpH9zuhgsHT8oYrQr3J41yo6mg
	CUNgwfAh+5PJgkNiBFKHH4P07QVJXEgb7dZw8/yKEfvKgtLVXgtogEdl
X-Gm-Gg: AYBFou3Tu3rO7ulhgKVDMpM6PH4WN4XA5GEu4zjE/wnfw5OilHhtW6tmK52+fMnONHx
	lZ57+S8TRbdG2W1qrLqrO3JkoKOt0K+4BJ0R+slHTA0R6W7xpHgWx8/7uMr4ByIxz7Iv0LEd/lK
	37bRGWi3A1M112lS90up4w1mWyY/Su4Cw0IQ/N0KOMzO7elCpp5woWd+m9fUEAkqNWL4p8HARqG
	ecUnUDM5ktVDHWyqFOkSUTr4OB2lxHTY7w882ekcUwOW2RZl6MWxfQqeCrYhUjwuzag1tjdG4jp
	dOUfUZG5YFBMKBDF+L9bRtkJq3u/Y04fnRV6x2cqa7215ncpnUQTSxTBiFLkkITof+AOO2pYCEQ
	OA/7mHYu2joLzQjqh+AcsgIeq4PotZKCnXt45a0uWbUowieuoe2MYKYVTOQON3iO8sFtFNtF7tT
	p3mn1qZ00IEb5BohXTdGyBzJK8oISHh4s1PR2Sm3bH7Zeh3eODYyk+Zkbv3+3p3Cxl/A/vNU2LZ
	vmYljKwUt612af5HXCAIUmSLdgZPX6xC6zjrZp+EThqPaZmMdiJx/2BVC5cHOHpOxBG1E1oLXPb
	VRhedNr/NNOiGLt1Jt9IhAOEyseR/UEQXO8GsgKqB/uxlLChydzCUssyAofyEVfTKOHwxPHw3Cc
	eLerIQlOgZs4jFqiZCdp5NIXLttTlNuiCxKm6FLqTMbyOUpBY4mGMUeqPDhdBWZxtT4e7sZStYa
	plKOD4jaCjzfV+J/TiKlHiNV1wBMvq2Gze59ilKYe9qOAlm91g+yY=
X-Received: by 2002:a05:6808:c232:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5683cbbd185mr1424922b6e.68.1794296701713;
        Mon, 09 Nov 2026 23:45:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:40 -0700
Subject: [PATCH v2 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-37-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074505_060134_E378F1FF 
X-CRM114-Status: GOOD (  17.14  )
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

The deferred detach callback only frees heap-allocated transfer buffers.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
