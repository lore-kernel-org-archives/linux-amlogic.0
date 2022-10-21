Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC00C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9E8FsXfNHVJ1tDZuQNFEID1RwEeTApbfB2RDZCjQN0=; b=KUJSd2Ogaqc0sH
	6CgVBV7Q8RShpInicaabCuqXzLotGgGAh968ofem9rmzzNkVwaVWyVGXoNK2uYh38HsWtKr3vthzp
	hI0Seg/jxRsiuVR1D/4d7ZG8uDnhInCFBNi0yaIaCJxvTK5eSgbMRm84DHd8ClbB6S7/GwgENNixW
	15M80XhCdrMuW954MOEEQCBz990H5MF5/D63fCqG+PIWkbutppgkVXYxbyojKzQAKoSzk3gBXhDT3
	xH1/Uye+Mzkd9upXz2WK0PYWc4CfVAdfRM+niqB18nY63e8lnzXByHj990G1ElzT6mh0RpzyrpZLJ
	PusC6OrLEd4Ck34AOy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols8Q-007zsP-Ke; Fri, 21 Oct 2022 13:32:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols7g-007z8g-1W
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:31:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso5013145wma.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXtmdU2m8NPlsXlACt9Yoh64s/n7OnQvTgCv7hxG1ZE=;
        b=ebnTLIdzs1rcTFMiza2xIJxAz+pnlLeF5fNXQP6n8Lz1GDVw/qWd/L/WKBn81+0RnC
         FI29EzJMGqkgYAR0mudIuY0bshwjs6cwNZx+c+MxBykDx8kKHBtbUkhVs9GRlrlCXDPH
         KV1yeScQEe31yuOmSpaj51HPUMypvPmoaftgdCY0iM1w5JbrhXHoj4lRVclu+eBDaVAS
         eINikcQpj4BZbkfz5mIQ25JH5Is66WFYIjZVlZXahmXcHmXIwXOfOe4jSW9rhLc3b95f
         hemW6K4CuzBlmuhfE5Uk2X8CDe6bavpzRPkMSCOcQ8HnqBwnVh96fuDh1Bi0YzYTY5B5
         vS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXtmdU2m8NPlsXlACt9Yoh64s/n7OnQvTgCv7hxG1ZE=;
        b=lKNXGNr2z5iq6KIIgIvye+HWUv3DDl/u02mALoPG7NUZ579CZ5iRN22OZG/9dukbo5
         SQasGmxwi78bSyp4HUc5TCCJ6NeN4twQitMMVEzdh/NjcHM/O7dK6zMuNUNB2y8MEe6w
         eFVBKoNIZFzXu0/+2nJezpPUEb2wl9RCq2J43aksYVLDvG9+hXzZAGyS9tUZKg+KtzBs
         pU4bR+d/EGD6pEbDYjckXxfms0PP5uSncRc7QO+7g3QeTDFFpkVed4eqapUn+kCagVKo
         dUgVNtJhhTPLDlPFNpfh6xz9rvPJ5DQVh1Nw/kJyu6MZNtl9YWYvjeGA9kHoFWZUqmOn
         yi4g==
X-Gm-Message-State: ACrzQf2VqKlAqco5Wr4PeW4L9TSBJtmZCi9KGRQS8qvYaYaY9/CQlg4W
	yUBwIdvJPNHENUNNMt6L6klFVg==
X-Google-Smtp-Source: AMsMyM4y9SqyCAcklyqTWranyJ4HsqNMQgY0nqnuxSdRrjsShRsZIwxSqN1EZRJydRH0oUAVAW4qNw==
X-Received: by 2002:a05:600c:4f54:b0:3c6:edec:2787 with SMTP id m20-20020a05600c4f5400b003c6edec2787mr13367112wmq.109.1666359098225;
        Fri, 21 Oct 2022 06:31:38 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10325280wms.0.2022.10.21.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:31:37 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 21 Oct 2022 15:31:26 +0200
Subject: [PATCH v4 2/4] spi: meson-spicc: Use pinctrl to drive CLK line when idle
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v4-2-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Da Xue <da@libre.computer>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666359095; l=3653;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=IGy2/xUGkATMfFoSdC/ARGihk37oQRhTPB+1EALz76c=;
 b=lVbVZDfVeI3MW+9qrIowJAsQyvBv8U545pKIoqjO0+YgyhER33t3/Zp4VbbqGrx+MhjLkqs7IHRU
 trZgoLn6ClcWt9mGnWI8aZXWutDyPed/A0gmPad7hkEfKs89DPgl
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063140_111197_646403A7 
X-CRM114-Status: GOOD (  20.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Between SPI transactions, all SPI pins are in HiZ state. When using the SS
signal from the SPICC controller it's not an issue because when the
transaction resumes all pins come back to the right state at the same time
as SS.

The problem is when we use CS as a GPIO. In fact, between the GPIO CS
state change and SPI pins state change from idle, you can have a missing or
spurious clock transition.

Set a bias on the clock depending on the clock polarity requested before CS
goes active, by passing a special "idle-low" and "idle-high" pinctrl state
and setting the right state at a start of a message

Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index bad201510a99..ffea38e2339c 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 
 /*
  * The Meson SPICC controller could support DMA based transfers, but is not
@@ -167,6 +168,9 @@ struct meson_spicc_device {
 	unsigned long			tx_remain;
 	unsigned long			rx_remain;
 	unsigned long			xfer_remain;
+	struct pinctrl			*pinctrl;
+	struct pinctrl_state		*pins_idle_high;
+	struct pinctrl_state		*pins_idle_low;
 };
 
 #define pow2_clk_to_spicc(_div) container_of(_div, struct meson_spicc_device, pow2_div)
@@ -175,8 +179,22 @@ static void meson_spicc_oen_enable(struct meson_spicc_device *spicc)
 {
 	u32 conf;
 
-	if (!spicc->data->has_oen)
+	if (!spicc->data->has_oen) {
+		/* Try to get pinctrl states for idle high/low */
+		spicc->pins_idle_high = pinctrl_lookup_state(spicc->pinctrl,
+							     "idle-high");
+		if (IS_ERR(spicc->pins_idle_high)) {
+			dev_warn(&spicc->pdev->dev, "can't get idle-high pinctrl\n");
+			spicc->pins_idle_high = NULL;
+		}
+		spicc->pins_idle_low = pinctrl_lookup_state(spicc->pinctrl,
+							     "idle-low");
+		if (IS_ERR(spicc->pins_idle_low)) {
+			dev_warn(&spicc->pdev->dev, "can't get idle-low pinctrl\n");
+			spicc->pins_idle_low = NULL;
+		}
 		return;
+	}
 
 	conf = readl_relaxed(spicc->base + SPICC_ENH_CTL0) |
 		SPICC_ENH_MOSI_OEN | SPICC_ENH_CLK_OEN | SPICC_ENH_CS_OEN;
@@ -441,6 +459,16 @@ static int meson_spicc_prepare_message(struct spi_master *master,
 	else
 		conf &= ~SPICC_POL;
 
+	if (!spicc->data->has_oen) {
+		if (spi->mode & SPI_CPOL) {
+			if (spicc->pins_idle_high)
+				pinctrl_select_state(spicc->pinctrl, spicc->pins_idle_high);
+		} else {
+			if (spicc->pins_idle_low)
+				pinctrl_select_state(spicc->pinctrl, spicc->pins_idle_low);
+		}
+	}
+
 	if (spi->mode & SPI_CPHA)
 		conf |= SPICC_PHA;
 	else
@@ -487,6 +515,9 @@ static int meson_spicc_unprepare_transfer(struct spi_master *master)
 	/* Set default configuration, keeping datarate field */
 	writel_relaxed(conf, spicc->base + SPICC_CONREG);
 
+	if (!spicc->data->has_oen)
+		pinctrl_select_default_state(&spicc->pdev->dev);
+
 	return 0;
 }
 
@@ -798,6 +829,12 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		goto out_core_clk;
 	}
 
+	spicc->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(spicc->pinctrl)) {
+		ret = PTR_ERR(spicc->pinctrl);
+		goto out_clk;
+	}
+
 	device_reset_optional(&pdev->dev);
 
 	master->num_chipselect = 4;

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
