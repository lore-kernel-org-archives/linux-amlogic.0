Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E8EDE9A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PjBm9aXyZaXZ1WJ5tAO/glwAiHezV98vmqnNIa0C6E=; b=024aL2vZXz8gdG
	zTT50mIoQyuUYnz36Vm4xikk1MlJbBWHa4emj6NTn4K2GIFsR4cWv7o0ayZxbdVv6CofH0KGMGa8j
	drAdKxK9y4Sj2pV0X92IXyOjU4cRoZguUq7AnR7TFlk2MjmEkQ13S1G4mw0aIOGiY3TMrg9rqI7P7
	CmHdq+dbeSniPB+UWMB8j6QjaOuhGBvYB1GQCrZUBaPsCA4pA9vELWEfX6CNKSPoYaYJr35AfDJiy
	j2Q1taptAn7UmpsFvekLKZGdq7aPdHy9JQnU9q0BfN22U826bq+K+o34f2Npf17++1LnL4d+iI7Lx
	ecg00ugX5OUEGnfqE2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3wV-00000006ONe-0QWn;
	Tue, 10 Sep 2024 16:42:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nj-00000006LGQ-27je
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso31330995e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985989; x=1726590789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QSINvKV6nbZV2fQuAbJusgVvaCiwjnmEbgnT95Es5s=;
        b=YZTkQSZPzmltRYe1JG2p8HJuvXuPfIDOLtqpfCyDRxg1nMRiLFHU1Ir/zV9la0JfS6
         XwrVmq26FnRuOp5M4oTGJW8+Ig5FHqvJVFFanPmZKVolmkIKOKZR1pRfoVzrj1Yc+QUY
         DS8BeA16E8cceTQp18pzdh0CNvqGbU/Oi3d/O8qa8etegx1jyKB7qgixKfXcqEKv3LyF
         RszIjeGl3nq/KHJMfPA2/fhRIaxDaZoQwbxi1PrgoQwSVxHMz9x2II2KvaZCTadkjxER
         JfCvMsT49a9TsBBo2rhmu2o7KqbcDsMxqjZ0Fw90Z5p8zXrslyupsTv3KV5fr4xngiqd
         Ovfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985989; x=1726590789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QSINvKV6nbZV2fQuAbJusgVvaCiwjnmEbgnT95Es5s=;
        b=YIEtK7UWe80CIAS/Auqo//y+XH21W6WDibzhAYhmcogYxjCx2GYlKsL72euSu9TjdG
         7jR5M/Ij52mqiA+zN7X01JgGPuOvaLXhPN2A7SqV68qZiMZ5VBi2oKtB2pU2HQPgo8c9
         KdzsV7/adxg7Sgo0f5teD+i/VSG9HI/1T8FZOw9zTnu2vpfm4X9LvM/XhcKjuPBYT840
         4/1Kx3XknGGEuyrU4nko3wEQ2TqRQqfkHjRQGMcYQbjNCPPppe0hUmwpG1pOroiA6rdv
         d/+I2fBYweGq8YWwO6CpTZdHBULdcpYQbfWohY6PaprZ2M5GXX3sqbpAlyVZE42qF94t
         AtHA==
X-Forwarded-Encrypted: i=1; AJvYcCWKEsktOq332NR71quNAGIDRtdGOSsl9Kxk1BIVGlhAvMcHV1exIGkfLhWlqVsJE2R8Is8Zw24IJ5HaXsfS@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqtlg+Gj+8Dr7Yx1gQP1mwxdWGnQL5pM3r4mjnKCY1F8Ij6GB
	TKmVR3n8dpAt/g8E6T/aGSgUBiwJkWAWap/fUBAWyPVrzJbH/CntfESfUrxXORI=
X-Google-Smtp-Source: AGHT+IHiOGsYoN/QOonTnWDkK8vql9LoMqXEvKgjoSQX7zg5og4UwUh7/sOiYoeyGJfrJVS7mxl9Uw==
X-Received: by 2002:a05:600c:3c88:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-42c9f9e087amr145081685e9.26.1725985989123;
        Tue, 10 Sep 2024 09:33:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:49 +0200
Subject: [PATCH v5 7/9] reset: amlogic: move drivers to a dedicated
 directory
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-7-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9xw/UbuAm3lkXdgMs5mApQR/yO7d5t0DYqss2FrWhZc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS6n8wPd2WR3HfaoRCWgNRnfZ+NRpRnOiLOc
 gAnCM4mHzuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0ugAKCRDm/A8cN/La
 hQFxD/41k1AeedXrANqdaPu5EeRp+u77A08mMOLI6TEPmKy78HrTQcdOxHVrKcDr8fS3UXuQpiq
 G91PrZSzurQS90IKgIJ0Av/JrTh+2mE3OvHKujuIiYVGlgY6WjgUUtgHUi4y1stDgS16uEe34Mo
 vtRCxFAlmof9ZbyvysEuChKlDYUEyxR/gBkDDiYt0Qy77IgzgbLCRe1tkVIYE/t3twvlvD0X/Qg
 jWSporf9EsnYygm66tqilaxGpM/cbm2XnN9tn0xQVMsDkRz/MIeTBBqMb3PTR8zmXqfB/cjf488
 F52FSaiAd0AYrFUE4hrX19SqQ2jBtkGnjp2LlMTZu13ul8BzP8e9sqcRoJpOM7blhfyPxMRsBYl
 2dc23+DtkT1/H4ehS68Gaw5j12vnQBzJoTTmApHdL5uuZubGWjwdvJ3TZMUUeOgNqiKGBLhyn43
 sh74BNUBWYYQS/kOgml9e3zfIWwmXUZjlEb6AoSFvP4Zfdti5v3mF2ZMrSvtUIlqsgzo41xCuRH
 JxYNL7F4WKu+qflzt27jHYlQDhWaXYdX8tAPg8hWIXzitmThT0F+9vJ6QOZaCiBE79SAvVCJAO2
 8TLxJ9Mp7CSnvDaMTm/9SzQIYal2+E2FOI6aIpgsD43HGluEjwguD/PasFJUafhw5B8FUdNMqH3
 9e03/zOgRtnHjMQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093311_632428_917707B0 
X-CRM114-Status: GOOD (  14.99  )
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

The meson reset driver will be split in two part, one implemeting the ops,
the other providing the platform driver support. This will be done to
facilitate the addition of the auxiliary bus support.

To avoid making a mess in drivers/reset/ while doing so, move the amlogic
reset drivers to a dedicated directory.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                               | 16 +---------------
 drivers/reset/Makefile                              |  3 +--
 drivers/reset/amlogic/Kconfig                       | 14 ++++++++++++++
 drivers/reset/amlogic/Makefile                      |  2 ++
 drivers/reset/{ => amlogic}/reset-meson-audio-arb.c |  0
 drivers/reset/{ => amlogic}/reset-meson.c           |  0
 6 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index c730ba6f678b..d28c4401a310 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -153,21 +153,6 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
-config RESET_MESON
-	tristate "Meson Reset Driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	default ARCH_MESON
-	select REGMAP_MMIO
-	help
-	  This enables the reset driver for Amlogic Meson SoCs.
-
-config RESET_MESON_AUDIO_ARB
-	tristate "Meson Audio Memory Arbiter Reset Driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	help
-	  This enables the reset driver for Audio Memory Arbiter of
-	  Amlogic's A113 based SoCs
-
 config RESET_NPCM
 	bool "NPCM BMC Reset Driver" if COMPILE_TEST
 	default ARCH_NPCM
@@ -357,6 +342,7 @@ config RESET_ZYNQMP
 	help
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
+source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 4411a2a124d7..677c4d1e2632 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
+obj-y += amlogic/
 obj-y += hisilicon/
 obj-y += starfive/
 obj-y += sti/
@@ -21,8 +22,6 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
-obj-$(CONFIG_RESET_MESON) += reset-meson.o
-obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
new file mode 100644
index 000000000000..532e6a4f7865
--- /dev/null
+++ b/drivers/reset/amlogic/Kconfig
@@ -0,0 +1,14 @@
+config RESET_MESON
+	tristate "Meson Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	default ARCH_MESON
+	select REGMAP_MMIO
+	help
+	  This enables the reset driver for Amlogic Meson SoCs.
+
+config RESET_MESON_AUDIO_ARB
+	tristate "Meson Audio Memory Arbiter Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	help
+	  This enables the reset driver for Audio Memory Arbiter of
+	  Amlogic's A113 based SoCs
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
new file mode 100644
index 000000000000..55509fc78513
--- /dev/null
+++ b/drivers/reset/amlogic/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/amlogic/reset-meson-audio-arb.c
similarity index 100%
rename from drivers/reset/reset-meson-audio-arb.c
rename to drivers/reset/amlogic/reset-meson-audio-arb.c
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
similarity index 100%
rename from drivers/reset/reset-meson.c
rename to drivers/reset/amlogic/reset-meson.c

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
