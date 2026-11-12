Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B1606A880
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pn+CCkmB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lGYFhkQ0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moVkKXrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sLjVc8UF3L8fsL16KCa5CDAoHdfFXvJ0nF+p+sGjcfw=; b=pn+CCkmBvyOj9SrYSmbwm30I8Z
	Y4dAr9PZbrkIruEt2oYBf7y69cpupez8+4ESwK/bK1ztF4hzYn3bNQIZBXUvUIssCbur9Ct2l7Q33
	fU6Zh23NYaMemf55/0ydN16WTGWCJ6YauEB2mUu3pkefJ8cRwP417LQ60OoA6Fl1ebJ3+LuZJdH9U
	0Qd6TCPiEtQum9NvIMhfPN0emRVtxeU7q3axaPQ9/Na7hryP1WPWKaN7Bp0DFSrY6FxY+Ts906TGV
	Wrmwf4u8Cg/b9l++nXs0uE2EAGeR4e/vf1UT5ejtB1s29gJO7F/LAXesTF2zrxAhxB2gVPqp42yJ0
	ZLqS1Fcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdL-00000008NE7-3DT6;
	Thu, 12 Nov 2026 01:29:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000008MKh-1u8B
	for linux-amlogic@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=lGYFhkQ0KiY/kT3m+UCqc90vtY
	TYXFcLNrypg1mAtP7JAdBUuzwlYNPPTOZW8gvGzOP3BG+TJhRLh25mDabKdfAqSjpGYe5JeeCH4V4
	we8CSb2BmjiUUN0v2OgeOfo+KMz++SFJvkfTcAUrhNmwVYrZOM3QXMy72fi5/JeKtGVRW04QQLf0Q
	E5nqvXKlomS3MCS3WaISLyrwn5YwQYWnVdo8LZvuQ2vJ90C8BWAq7XNFoM8ipJ69UVn7grIRt3Cr+
	YcxjZCHs2t6liReqpWI3q/LC88qGvKOmPlfjjxYBvtIzmN8N+JC19EmxWXMB5xkVOU/bJ7WtPpRjd
	iS+gYxLg==;
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcl-00000009mqz-3bgD
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:15 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4d7034a99a9so2225910b6e.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 17:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446950; x=1795051750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=moVkKXrbsa6GJv1HfNCTVDMdjCs1oc50kNFoJo63nB/FgQvyYsvcRZvsgwo71VlWpb
         DnsPxWmkydMkqGeb7KS96vncmtP8SCyAIXyojt55dmuO6bnIfbLuxY77vUHcyJWG9733
         qjH1sp0hRbJAPFPn7I8RrUPxX6GzFfhnYOg62ZHpkk7zYV7HEqiLhIf4ZjduonGTaUPe
         jR/v98QCCJu0QXvi0XPsNpU2clLWUPVO7emiiHK6V2It1NK7pmzoMIl4daAAGkMI0uZl
         7qgWf2y8jsc11PRkS2HqpdDwEqx3roGhtsAzQptq6+qI9KCf0oipV4jIRBCx64Hp50di
         4t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446950; x=1795051750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=l6mirEBVPQaHtMNPHwMHQx4IzqgublYnGuyjfsZ5cTqa3tewdHRVBzUEC8WjCMYqhN
         21+fnyd2g4GcRFgOvOZtS+j68nEKM72v4fFK1pJBiDOwxzdLxJA359m+VffW3Ia2FFvV
         kbZk9Ed82c4yGKXEu8Wsd2wODWe+GDUNR4uM/vG8SbYh8X3gK5TRqxwDGDjYPO2TswNE
         urMboOsEeBEcFPCxQrumG9t4ZSl3ytK31HIih8l9bQD05UHwqdGSMdgtP3XdOdLX0WYZ
         RFW1txwsHe9CfFSwC5mXgB1nrlJgYf7B5eXt0Pwt7SiD7HtTiI63RVXNTMi5dt3oqXFs
         4ADw==
X-Forwarded-Encrypted: i=1; AL+hErGo6psZYD9L52tvnsBxzBQEWM3+TA8+DA5ebY0XJb0fn6iT+V7OkIvJh7qq9Avm2ZLpjUU682edd9da5gKP@lists.infradead.org
X-Gm-Message-State: APuU4Z9gglyVAyZ18JD1ZTJOnQT2iTLiesUBd6dug7AhY32mAvmMb//c
	Odm1OJsAJfxha7SpehHVKHFlQyUKxc+oclKNj7vglm/2tDrJAG6SEaXoj5IhTfwP
X-Gm-Gg: AYBFou0VIjUPTxz7k3RnICkI8PcPkq+jMWOjNlkjLQf4UbJUm7R3tAI989b2Ot71dpr
	6tkGcDALook12u5GZ89qcXlLHFgDt23UPx7fD+Aza1M9nmg+LuDaH3i9m9/uuTNOM0z1/tGgIfL
	BiK/NMInstw/QzQjbb/yGqcpArx/Q3ZcuUnHW2pKC4oT4NhwHwvt1uEDT7UxCT9ap7lEgXw1slu
	qJVf4uZS6ujUQmL7NIHBmsqdKh5x0N0auZWLSDyTgHLcATPG0QM+qqkE3MVErVGcW8FwqTL1IXS
	Q7BMVnLeBzpBX754ZxgQfgbhTFwFbV9FYfFXsxqOoPbEqlQPwfJJSAtSRL0wagPlrKROqaldJI9
	wuNEqPvjRrqnskekJw1MMHdN02/BP3jzjZnZFS8o1vROyyWWhBUZCrjnLx9b2AZAhEB/04NoS5A
	KMRC5GvQtii9FMLPQD4SuNEjOW/S0kTX22Howo+k0TzsF7iNNLeQnmZWan0iNYTP7HB7mvlDxu6
	bcPu1jWvLJwVZEqnaRuzEk6I3uLbvof47Dk7vQBn0zTdqNDlateDpp/LTF/GHmd4Wkh8fx+eF6F
	0keNJFpVnfX0lyRFTgDfhMUKL3+In14AvN0DvGlxDFtmdcB7j/zUKAc8C0VAexwKqN7mM6OdnJy
	79Hbb6iXqPKSCH7laP7x5BWITLp5Sigu9cFg8sNR60gCblGm6XlbjOoRBgtdS38MV3kLwe33emz
	c/Y0JcbYWEzpssWnGzfQ0c3vQoHlfJ74cq1Weh5ealgE2qYugBqci8
X-Received: by 2002:a05:6808:c215:b0:4d6:9222:99f7 with SMTP id 5614622812f47-56b98327045mr3914540b6e.55.1794446949668;
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:16 -0700
Subject: [PATCH v3 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-37-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012912_044942_C31C695F 
X-CRM114-Status: GOOD (  15.17  )
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

Free transfer buffers in the synchronous NAND detach callback.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 2a554f62a25e..871dc5e22759 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1398,8 +1398,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1409,13 @@ meson_nfc_nand_chip_init(struct device *dev,
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
 
@@ -1427,21 +1427,23 @@ meson_nfc_nand_chip_init(struct device *dev,
 
 	nand->options |= NAND_USES_DMA;
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
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
@@ -1449,8 +1451,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1459,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_lifetime(nand, to_meson_nand(nand));
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
@@ -1486,8 +1496,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1550,15 +1561,17 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
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
