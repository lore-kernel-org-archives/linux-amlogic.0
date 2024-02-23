Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07869C54798
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A87V2gO58aqRhbHcYJ/bDMjBy2ZhfcENWgEcojXwzEg=; b=DAbqoy0VWGcRGl
	xcIy4zP0qA08SUJKwxoVCqmNz4/I+W0jiz7pvE4GUuqejHw//6CCJNL0sxjxdcRk4QuJkTNVDmAmL
	btZpChxrOdL54BXIWA2PputDg4KPuZorXu/b98D0JjrMPCRFnwuFzlNNkfPeYeocvL/PdfkbfailK
	i9wwHQbPBcgSkE+TyZmjsmGhYRCCsOj9yeNtCB14lcxdrrWPgPz6roc6EKSPJ9ox0m27z8rdywBN9
	f5f43puylMg7tfKg4Z0bMLq1mdUq6fDemdkdyYxgfaXy+pOhJJGM6OHDgpOAiUpjBmcSFwfJb1+4A
	GBz9fox1f5HuPOSfM0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhx-0000000Adm8-0oax;
	Fri, 23 Feb 2024 17:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhr-0000000Adfs-1yZt
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Feb 2024 17:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C1/AGt7uLQCyc0DA39X/n7sIWq1BnWpXSGWjqPrX0bo=; b=aJljQ4JSS5QFcyrhxy5Iq8x4fI
	L1E+iyFPAyDJId13n4LKuauTC9LY9s1bTjT9gXjwZLNK/ULNY0arZ7FyNfkmnuhY/ii/n/+4GTs6c
	jHMTMIFnBRMsx3ZmZnsI5LS2WUEjXO8PyreC4VUjG/4CbWB5NPeZJx6rSRJvX/ydvjKqQuompwyY8
	sL3UcxRIsBJn7oxVwIgNgNF98OZlKY7vqccOs5uiCaigxOOox3YibE++owaD6G2VkGr9WM3PghK+O
	CJ2ghPjgNmIC/BMCExqHMdKwTouWQz+5bhHv7jEP2Vq0xcy+A3XH7uAC0b14RdqUQzl4QoX4T9I08
	H2WuAhGg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhn-000000003vo-0ida
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4127190ad83so7592675e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710686; x=1709315486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1/AGt7uLQCyc0DA39X/n7sIWq1BnWpXSGWjqPrX0bo=;
        b=LFZdBfewPC7GCJXbzU8hFaA4JunMnhduEHSx1GounyyPqzA3P8TzFBijKEr1xza/ZT
         x9AxxxlVFwGT3ckhjKyOVRnKadF9fLwJjKDYp/MQzA01IxT04RDhIJd3QFxGQZE2rjCx
         kDeAmrWfJA8T2ln49wLIuFJg4YbpBw0coYjbm+nWDz/jL7sLrB1UjAg3Gugi7Ajgp+oh
         lweqmRegkEfPGjY3m0wLG3Xh5RwqzQ1EJVbbors9UrP6ZJl8j1RSYFiqrcBFppWhT7rR
         QI5gLHzG3yYV/apvMujEuvFHfYFt4CLlq5GDM00M9R6NJDxCgaG5zfy6a1lFFxNEQ6LA
         IfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710686; x=1709315486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1/AGt7uLQCyc0DA39X/n7sIWq1BnWpXSGWjqPrX0bo=;
        b=WGlaavm+rU+3byui8HwT9Jd2mlQNAQmnVxXGBv37m1L6SksJrL7baU+Hj/QTRVNkdE
         IR2p2fg8UC20Vu3vN8H9S1Snt+uoxnz19e8jvwPpy1BGn2gFVXu3fP4+Rc9lNdHtjXYF
         +f6KVL/lLvLQgAxLGodxvDDTBokB5AJFn52Q607xTRiPiF4Y21qFw6gKELuL5OfJXf37
         0qPBw02ug93EYOATmdaAAFUj/yZmIqQnvTsAtNqCZ7/aSCqlZDp1jalyAFQti5dtBmng
         WMQLmoDO8F6y/tkpmQyJeNOt1CsQg0lE/bvkb5YwFq6eWEsPa7b5xYc/o88cYCNQn2Nm
         2Z6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdERzRlCkCja9/g5tAsMRZauz9UApP7Cw+2KhyMiJ5cYcjKfVsoEfhdZrTaSRiMeVzyfQbtrmANPJlgL53WjjlMdMpGSoz/25OXLTX7l6mvF0=
X-Gm-Message-State: AOJu0YxmS+DfleL3JdT1H10l+8LjnLA/1BjJCQ9TSbuzEKHvzIdR2vOg
	9DaKrVFMzhSN9QSMNIlXdB4jEu1pWCfqNb58NXFneGVf12L4eAV4lSKWneCtl6I=
X-Google-Smtp-Source: AGHT+IEPePMtPPf0gbB3B54/1cOa4I+uIJLCY5NUhl4hsQw9fY1wMXdm9tzTlTtsJfibzdZNlwi3Gw==
X-Received: by 2002:adf:f984:0:b0:33d:b2d6:b3a6 with SMTP id f4-20020adff984000000b0033db2d6b3a6mr300283wrr.48.1708710686707;
        Fri, 23 Feb 2024 09:51:26 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Date: Fri, 23 Feb 2024 18:51:12 +0100
Message-ID: <20240223175116.2005407-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_175128_470039_3BE39C3A 
X-CRM114-Status: GOOD (  14.19  )
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

Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  | 24 ++++++++++++------------
 sound/soc/meson/axg-fifo.h  | 12 +++++-------
 sound/soc/meson/axg-frddr.c |  4 ++--
 sound/soc/meson/axg-toddr.c | 21 +++++++++------------
 4 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 65541fdb0038..597fd39e6e48 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -145,8 +145,8 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	/* Enable irq if necessary  */
 	irq_en = runtime->no_period_wakeup ? 0 : FIFO_INT_COUNT_REPEAT;
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
-			   CTRL0_INT_EN(irq_en));
+			   CTRL0_INT_EN,
+			   FIELD_PREP(CTRL0_INT_EN, irq_en));
 
 	return 0;
 }
@@ -176,9 +176,9 @@ int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 
-	/* Disable the block count irq */
+	/* Disable irqs */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT), 0);
+			   CTRL0_INT_EN, 0);
 
 	return 0;
 }
@@ -187,13 +187,13 @@ EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
 static void axg_fifo_ack_irq(struct axg_fifo *fifo, u8 mask)
 {
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_INT_CLR(FIFO_INT_MASK),
-			   CTRL1_INT_CLR(mask));
+			   CTRL1_INT_CLR,
+			   FIELD_PREP(CTRL1_INT_CLR, mask));
 
 	/* Clear must also be cleared */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_INT_CLR(FIFO_INT_MASK),
-			   0);
+			   CTRL1_INT_CLR,
+			   FIELD_PREP(CTRL1_INT_CLR, 0));
 }
 
 static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
@@ -204,7 +204,7 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
 
-	status = STATUS1_INT_STS(status) & FIFO_INT_MASK;
+	status = FIELD_GET(STATUS1_INT_STS, status);
 	if (status & FIFO_INT_COUNT_REPEAT)
 		snd_pcm_period_elapsed(ss);
 	else
@@ -254,15 +254,15 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_STATUS2_SEL_MASK,
-			   CTRL1_STATUS2_SEL(STATUS2_SEL_DDR_READ));
+			   CTRL1_STATUS2_SEL,
+			   FIELD_PREP(CTRL1_STATUS2_SEL, STATUS2_SEL_DDR_READ));
 
 	/* Make sure the dma is initially disabled */
 	__dma_enable(fifo, false);
 
 	/* Disable irqs until params are ready */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_MASK), 0);
+			   CTRL0_INT_EN, 0);
 
 	/* Clear any pending interrupt */
 	axg_fifo_ack_irq(fifo, FIFO_INT_MASK);
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index a14c31eb06d8..4c48c0a08481 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -40,21 +40,19 @@ struct snd_soc_pcm_runtime;
 
 #define FIFO_CTRL0			0x00
 #define  CTRL0_DMA_EN			BIT(31)
-#define  CTRL0_INT_EN(x)		((x) << 16)
+#define  CTRL0_INT_EN			GENMASK(23, 16)
 #define  CTRL0_SEL_MASK			GENMASK(2, 0)
 #define  CTRL0_SEL_SHIFT		0
 #define FIFO_CTRL1			0x04
-#define  CTRL1_INT_CLR(x)		((x) << 0)
-#define  CTRL1_STATUS2_SEL_MASK		GENMASK(11, 8)
-#define  CTRL1_STATUS2_SEL(x)		((x) << 8)
+#define  CTRL1_INT_CLR			GENMASK(7, 0)
+#define  CTRL1_STATUS2_SEL		GENMASK(11, 8)
 #define   STATUS2_SEL_DDR_READ		0
-#define  CTRL1_FRDDR_DEPTH_MASK		GENMASK(31, 24)
-#define  CTRL1_FRDDR_DEPTH(x)		((x) << 24)
+#define  CTRL1_FRDDR_DEPTH		GENMASK(31, 24)
 #define FIFO_START_ADDR			0x08
 #define FIFO_FINISH_ADDR		0x0c
 #define FIFO_INT_ADDR			0x10
 #define FIFO_STATUS1			0x14
-#define  STATUS1_INT_STS(x)		((x) << 0)
+#define  STATUS1_INT_STS		GENMASK(7, 0)
 #define FIFO_STATUS2			0x18
 #define FIFO_INIT_ADDR			0x24
 #define FIFO_CTRL2			0x28
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 98140f449eb3..97ca0ea5faa5 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -59,8 +59,8 @@ static int axg_frddr_dai_hw_params(struct snd_pcm_substream *substream,
 	/* Trim the FIFO depth if the period is small to improve latency */
 	depth = min(period, fifo->depth);
 	val = (depth / AXG_FIFO_BURST) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(val));
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH,
+			   FIELD_PREP(CTRL1_FRDDR_DEPTH, val));
 
 	return 0;
 }
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 32ee45cce7f8..5b08b4e841ad 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -19,12 +19,9 @@
 #define CTRL0_TODDR_EXT_SIGNED		BIT(29)
 #define CTRL0_TODDR_PP_MODE		BIT(28)
 #define CTRL0_TODDR_SYNC_CH		BIT(27)
-#define CTRL0_TODDR_TYPE_MASK		GENMASK(15, 13)
-#define CTRL0_TODDR_TYPE(x)		((x) << 13)
-#define CTRL0_TODDR_MSB_POS_MASK	GENMASK(12, 8)
-#define CTRL0_TODDR_MSB_POS(x)		((x) << 8)
-#define CTRL0_TODDR_LSB_POS_MASK	GENMASK(7, 3)
-#define CTRL0_TODDR_LSB_POS(x)		((x) << 3)
+#define CTRL0_TODDR_TYPE		GENMASK(15, 13)
+#define CTRL0_TODDR_MSB_POS		GENMASK(12, 8)
+#define CTRL0_TODDR_LSB_POS		GENMASK(7, 3)
 #define CTRL1_TODDR_FORCE_FINISH	BIT(25)
 #define CTRL1_SEL_SHIFT			28
 
@@ -76,12 +73,12 @@ static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
 	width = params_width(params);
 
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_TODDR_TYPE_MASK |
-			   CTRL0_TODDR_MSB_POS_MASK |
-			   CTRL0_TODDR_LSB_POS_MASK,
-			   CTRL0_TODDR_TYPE(type) |
-			   CTRL0_TODDR_MSB_POS(TODDR_MSB_POS) |
-			   CTRL0_TODDR_LSB_POS(TODDR_MSB_POS - (width - 1)));
+			   CTRL0_TODDR_TYPE |
+			   CTRL0_TODDR_MSB_POS |
+			   CTRL0_TODDR_LSB_POS,
+			   FIELD_PREP(CTRL0_TODDR_TYPE, type) |
+			   FIELD_PREP(CTRL0_TODDR_MSB_POS, TODDR_MSB_POS) |
+			   FIELD_PREP(CTRL0_TODDR_LSB_POS, TODDR_MSB_POS - (width - 1)));
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
