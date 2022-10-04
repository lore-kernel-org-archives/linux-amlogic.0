Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB521C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Oct 2022 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2G8eaVcnQNJLMTpFqiBAnDehjZ3Ger6mSzd8BfgNlk=; b=cinNJCw7dCm+/f
	ls1lOMzgSEDbvldxTyU3YT5GLBcKZC5YM0mfkhPNIj0dhqpfGkU2DollVAQ8PRxJb1yeBFrWWPZqE
	8EE9W0Ir9bED7n8JTQGXa7XtW7ROoUPhrTo/yjEnlCOx1A+2qv6f4bkYcPcmtNtXgd4zdJySfAusQ
	nkW0JHxbD3uDIYW7bswAwvDugYnuMYl1auWo9T9RjjcCjoGcJR2FvZcSz4WSWXoNwKoY7L4r998sO
	4wZgHNbd/nFyQityWzQAKr3NZYS/P/2JKtxlOqoBA6KPdzz4JyTrlRZ7MAIL2SKXMLqmJYlmY7hfb
	Aq+3nXvV2YNFcYA4YNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offqK-009TIL-BT; Tue, 04 Oct 2022 11:12:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offpm-009Szc-Ha
	for linux-amlogic@lists.infradead.org; Tue, 04 Oct 2022 11:11:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso571949wma.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Oct 2022 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UJJeF3sZho4I3jRzyDgsCpW+xzw8EC4+Woo4EIRjhI=;
        b=KHLlACe35Mt0YeI5e0xlhWAhl2sdUfS56qWu5smFZ4A68YYNa4E61YRaBQtFSrAEXY
         yyh6xYRXK4APj0XRiQJvvhee9i1zHNJDqEtVZpZfDBd8lz52N7J2vk1GUeOYgjeP/2dn
         wQuXDFJuH8zp9ujEVAB83+I1eTbBpsQYE/yB3U76hnYJdxYS6q+NCWRH76b6frzVzgQz
         +k9UFPJSsLjax5MtvJuMlqz/4RPhQ2gVWaiCqFM1WltK9j9J+Tj5YdJx4QB9w7cvtlmF
         1+k6bFa43fbpFS4vzjZWBHularItcdxR4osuQrkGJUV8ypb06XAX72nurvhEWZ8nHneq
         Rx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UJJeF3sZho4I3jRzyDgsCpW+xzw8EC4+Woo4EIRjhI=;
        b=uWEaSu7XloyK/E8NlsE+T2L2ARu9KYoxwJcOJ11ick7G7Aa6Yta2iI4YozhBhvB4tN
         PliQR4PgzFid5GvDGJNURJhcqEmE0AmR5I5CUV0fdYjLxnGYijWjYg3hrzmNiRD+MBKp
         L/UKBCOiWAgpzFi0MB8Jpoa7I5s2gZYTfquVozWxa7XtisfGrobFQtAce6NSqm1Pz2v9
         sWhvQfmdWfFk44dJS0Xhrp10MLkjYU5p34beVtwbkV8Mm82rWv2pktnjXdH+Ffmx8alE
         G0mfcxi0+64IA54R6VLWbUuy2/7aumcOSheBzNhaLPsnnGQw8ZJpDAxVeSHoOUg5yZxi
         R+WA==
X-Gm-Message-State: ACrzQf3th6sABr2l3tnjo/qLgzWl0OqBuUel51H395MQiHt/h7CXPao0
	vqwb4+0nM+SEehpkdOsvcIREZw==
X-Google-Smtp-Source: AMsMyM4lprZEpHTZymzZDyAyeL37GQbNRWZDIhkLoxsLstNxTH5VirriI4pGn0cdfLfduLDfEj2H3w==
X-Received: by 2002:a05:600c:1f06:b0:3b4:86e8:bd21 with SMTP id bd6-20020a05600c1f0600b003b486e8bd21mr10028543wmb.7.1664881890873;
        Tue, 04 Oct 2022 04:11:30 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j2-20020adfd202000000b002285f73f11dsm15361698wrh.81.2022.10.04.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:11:30 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 04 Oct 2022 13:10:37 +0200
Subject: [PATCH v2 2/2] spi: meson-spicc: Use pinctrl to drive CLK line when idle
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v2-2-3e8ae91a1925@baylibre.com>
References: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664881888; l=4316;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=nQpkgGjqWbrM00eFiyFqQsdlJkaQwuIgVz9GJtl+aH8=;
 b=l2gvdzyi3u1EecI5XIadzmWGWdV37GSawLpg4eQliIlv74HpWJ8aYWZjLW4I8iU8mgyE0FCBBwH3
 7FR3jqPEDOVxf7WWD7pWTVmbV1IXXGNAk+3hjfEnoMJ/h/hKrZhS
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041134_601213_9623E5D0 
X-CRM114-Status: GOOD (  21.02  )
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
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 14 +++++++++++
 drivers/spi/spi-meson-spicc.c              | 39 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index c3ac531c4f84..04e9d0f1bde0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -429,6 +429,20 @@ mux {
 			};
 		};
 
+		spi_idle_high_pins: spi-idle-high-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-up;
+			};
+		};
+
+		spi_idle_low_pins: spi-idle-low-pins {
+			mux {
+				groups = "spi_sclk";
+				bias-pull-down;
+			};
+		};
+
 		spi_ss0_pins: spi-ss0 {
 			mux {
 				groups = "spi_ss0";
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index e4cb52e1fe26..de89577319ec 100644
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
