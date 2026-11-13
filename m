Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29402606A88A
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Okcc3KnI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bE7DwJHZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sLjVc8UF3L8fsL16KCa5CDAoHdfFXvJ0nF+p+sGjcfw=; b=Okcc3KnIajBoI0lyMalyMI0iJt
	/4/wbuCvYjo2jHRFBSOn/85lOGExwZ2pre6Ly17RiVCxRtijxF9JHLEMqBUmmGwS4mvsedhHmod5R
	fUezHuEjHMsnRIw5FyLFG3xWeLYEV8fiGHIQdIrUjf52yN75fPv4dAFQrrZ6DsTUck6s6ol4FNQSS
	/gaem/zPSqjDq80pgI2644BdESa0TOn4hMK/JpCGW8eeDjntvuCc1wcTFVyUqaG6PX3RkXjXPq0eN
	SJ2UVWYW4aMn0PdKGk2OkqwaevfyJTBtyIGqE6cTv6b62eOpY918PtUT33MAfN03gIF8+fVENfS8O
	uqEaHy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpQ-0000000Dsu6-0ap5;
	Fri, 13 Nov 2026 18:16:48 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvot-0000000DrwV-3jhg
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:22 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-833e671ee9fso2375936a34.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 10:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593775; x=1795198575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=bE7DwJHZ82NUuilqyJASpshIATi6gARk857VTgbhlgjMd8barfI/K8JgDrm4MuvbIM
         /YRGFMNpmWY2cnycHVIycUg85Wv+npzablfko2km6+uJUEPJQnLQsGagNC9L8AOiJqvt
         qa+CSQIdwKOTgq+tKr5P1ttWqcmGBJsXOnACp54KcNBIv2RUTfUQ9pPvPmz08mjCYAh8
         aFh4Vpdj7jbRfjsCL4+8ivb9Wjc8aCpPa91HtuXIzVASLc7ROMF09EIoGGc4zXOEcpFm
         CYNUK2zKv2CVxi79SaBBEu4lFiukEKN1+sP9UhQ2SchSRo9M7N75yPiyAjB6NWlLiD2g
         wnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593775; x=1795198575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=RMuO3VX+zPWWN6F6fzKdeLONvj51qMU03T6MHbgxEHPjVZ31s89o5tfvjwlMd9BKio
         wUQNPvIa+gL/ToiN3lwm5wJpatLuli8P10lRMvIWdu1oTiGCGR4JYNI7GJDAMgilcYhJ
         K26ON3totkALGvwgs/sOFCsOFlBgWGIcF+rPr6m1plf9nYleGGq6q6w2g9KhmXfaPeO+
         yVYdww7w0MJuS+bWr8VmbPRV9BFQ+eLL8DDFOUb/yQSPX0s6ptqOhoKvf6oMgov37IAh
         BPwBNQxvawK/VnG4WRPS+T4jQ33RtTLmIZrulA8hTHQLq2N2W+9U48VTgMgXvzoEJbOm
         NW7g==
X-Forwarded-Encrypted: i=1; AL+hErHBJVyOwgZ1z0IeUM6rkfxvn4j7CKLu8fVzCB5SX/eK79rEBYvfkYJbH4jVPCD0ZTcqnA7WzPcy3e/WJx7b@lists.infradead.org
X-Gm-Message-State: APuU4Z+oObURAsgmfP4OqsV6Q64ewIna084RZ/sAseer3cb9UP90tZfM
	tVR3j1/vGXKda4R1ZRnu0EqJBM1QhmOKW0KXK4epcmk3DCbvdgzv1EKq
X-Gm-Gg: AYBFou0vMuOrsC8+3/tL7TXZXyqz9luiTbj32jnveQoppyFQQfPUIYxnLmAebh75rqI
	pIHDlBpncSTcsmQoAmqvYZ4y5CQoYmTH1EN01MDiFKagGGLFpMYJ2Z/stW1xbeUCO8NfukMujCz
	bhzP2ZbPrYxbXnOaaPj2PYZPz456fPga7YNO/kK2EbD30nYc8M71H0/nENVO60mUsS1DPNsY6uo
	n8pH2JntvhJCsk5pm9KvrpwBTz2mlRrY3rhsPB4S31ORFLULsUUvLw9luqEdSGoKKo9HzMekItl
	saoN4W1wDkeTMS0tl4HfiiO7+xCTqZkOKkc/xUsSKXdII3bQr5i08IAHiHFZZVX52Y1we3aRIph
	wDqkuuK4tN3HqehnUNG7Rkqaxh3KXpv/OeiMon0/Acp6pnGT5zSc+abmEgTjATaYGN8vDvFpV65
	qbErLZKIWm1orZAAEqmjV1mxg/n982YCgBAj68CXQQkdfTa/j7RLe2mpRNvyw2yDKI2/eu+VIl0
	SBYHRXJ1R3rAD0MmTAWv5CvvjAl7Lofdfw4fLD5x9El15aXUstbBSpDI483RJP9X15p7PXXA2KQ
	eL8Pq6VSez1wURmVz8uF9G1QwVfLp0x+GhACjim8IoKS1+5wQMp2N7gw4KixMyPv62X+XlvMlcB
	b7B5s1vv9D9cofQbNI1WXjl+RWniUVW1EjeesOBa2Cw3IKc22qOvQuslnL/DJ8qs1oE1yPBg2Br
	DEJ6STZXLI5CYHgw/eOhch30eGcieV3W/XmIdDHeT8T/BgjF/0N6E=
X-Received: by 2002:a05:6830:4489:b0:81c:37e2:2012 with SMTP id 46e09a7af769-86289870d4bmr3052287a34.15.1794593774827;
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:53 -0700
Subject: [PATCH v4 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-37-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_101616_265694_8DF7EB10 
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
