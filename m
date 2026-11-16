Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5B606A8B8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBuhoGeS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDsCzf+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sLjVc8UF3L8fsL16KCa5CDAoHdfFXvJ0nF+p+sGjcfw=; b=YBuhoGeSogXNmokquqJ/hNDgoR
	SHuZc2gGcuGSn/30tYOb7fqvW9eRJXEmHLxHu/9rxTysst5IJkvPe/8ZVIf/Tl6XhSC4AjB0gLi8B
	iMWfZuNstATM7ClR474FJ0xM2icVfOR023q0wAoYyDlmCnKZo4fBlroMdQ4qZnDxwB/A8IYfApk4U
	LTnvC/hL+3FFDNjitgqmboqMHuBORVE6CdweqilqCT6yMZ4Wr/XPYbhFkunQYkKXe6TxUfYEFrsmy
	NeT9rgbFQPketphMo0kWmVX2JWPhn8YAqaFxpM79OXkyBLaGs8dfpz487CbSedI5Ns/NZsxikyiRB
	daJlQGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEs-00000001GPu-26QS;
	Mon, 16 Nov 2026 06:30:50 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEa-00000001Fpj-0G8U
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:35 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-86156cf8a7eso3337394a34.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810631; x=1795415431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=PDsCzf+tbx8hiiI1BiE/NGSkEYdbf+GqEC29ZI9oFzNKu2ocTKxSEmRWvZvGH3erj9
         SoLFen5+u78SDjYwYrarB335r+0aPD+9j0GguV4FFuTv3mBrJ9Hz4j5jlU9aLVtCSJ4k
         IlUwqC8RC9oQX+0viX2QR1o8F5yh4PJZlXV8V9TnbhsgjOIa5OPpeKlOGR4a0zzhOYom
         epyWOD9gEK826aYwI32yHgfCKNY0aXD3zdiYN59uc7SFDDg6+gFFBXfyAc4oOZQfkU0I
         XNt7mX27EaNGUpAvi6lqs11wVfjxIcfNnWCtpub3p6jXDyKfikAOTZXLroE8fsZ+zK9d
         VXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810631; x=1795415431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=KVGzTJi6rsFKqkVj0G/V+EIBdwVszv3VDogzx5C159HLukChgnIU1vl6wQNC4AM/RG
         ym4czd9QsJO0yimoQL6GmfG5kA2yuIMjz68QFBDzYfdkx39kkD2Xe+/DdX9V58o/seEm
         Z22YFaBbPSZAWgzepP8l3kd7s3kTRRFeaStDZU6Dor43exb3rctBZYYxp2HpAAamSHO9
         1iGm4ZCmamu5L+9iiVkzhlXC4Iv0LqoZxHsA4sDxxDGCNtlGsp308d08v/Rjr40Lw1IU
         fZy69D0+zeQ4+RZTpRne6AlnR+UqDofG1SNpFqjaJJvgaLh+shnX0wE9tW0t1yTmSMIn
         T5Iw==
X-Forwarded-Encrypted: i=1; AL+hErF3Jt/XVr6YWIKO/cuTiKRxJjWPWO1xIw4Y8rWLHSN1pE3hFoNcr1URzClCI9Iwo0JOnM8bO1U+khIgvfjg@lists.infradead.org
X-Gm-Message-State: APuU4Z/NfUvdB18gjScgstBS/QC7Bf+vFf/8VLAaLYrgR4l2MnBs51X8
	QVfd44djAjRyoDRTmW3flXhZLf5fU1M1ZRehii1fsu2rH1eEQvB1w6QfwiVoMTxK
X-Gm-Gg: AYBFou2ZretrNHFPnLyA/hQLMWquFCA7F4dZw2mLyLmUi/YKG72dP3WOpwTTQaVUlzH
	4nmojHsflFCi9LPx1+qRBV9aIfI8TQKx6haMGLjZNHGmOdnV8IsP+QUHJTT0iSZpg82PbAhn2j9
	uW92Gp7obzDDUX8A8YVOjG4ZVgWFVVoMEk4SRzrevWdbHbj0WaLncXKfkEhd3581TbJ+y0HMMZn
	xPvuN6YvkwrWwjYoswHQpbeHFBYhtaJ4cXjPsrN2A8PJjEYvbo8YwdbK7KmQ3hQhdrb7+dftzZH
	WF/IlUQTcSSoe3ll3gkGo6dnNwOmF+GvDm7EkNe5qr0U+cpQghNJIs/AZG+3GlVdK+qjj9uQhIV
	ksQRusMcXHPZllTlbZvZ6EGK95++i5JGuEEDaiFxJJjOKFJuP6ysX857FCR/e46ccL52qVk3pyf
	YBpeeV1oBJ2GYMftYqQiWjMJ8J5AaymLEdO2zqIj5L7dfS0tLXV8alZCmYl9t8qJkSt2WUXzCx+
	uQP9L7PrzTkdEfKAJuewXXRIxmFEvq+4YgXLnjOcxVz1meEpThzIPvSxwgBXS7LyhrEe8wW+JVT
	LQu+S+crxz2AWq0vrk7d8vG/ZZVBE07arzFcuuPsk3tBqj/wNqwYSxpTB+NomtCh6NHC0v+XA37
	l1o+5IjPq/BCx01/+RItKJ6DXEfhK8fvLBstG0qtrV4sBScy5K4KxTPjh3xRTAmyFFC6cPEFBgb
	q0ATsvvfN0kGO9dCHeOlSvKskP8tqjlxv+WIjoCu3DX6oyWdJi2Ncz
X-Received: by 2002:a05:6820:1c8b:b0:716:b936:7cf6 with SMTP id 006d021491bc7-71ab4d8584bmr5458319eaf.4.1794810631234;
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:52 -0700
Subject: [PATCH v5 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-37-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223034_245002_09D4F087 
X-CRM114-Status: GOOD (  13.79  )
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
