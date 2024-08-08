Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABEEC52D7F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVzccMT96ADqUlm7P8Gykanaf4YRrSblX5ywI2AhsjM=; b=ui1Af4pN4tmtEE
	Oza/NUGBZAwpY5UwWOjQgPf7yQj9okcjV5fhg4XruDisIygf2f//i/Gwo9WcO13c4M5kcdP2mYM/a
	06RpM5de8BRRAsr/ZIyN7UcovQ8kdLzstDH0dqQ5pKTZJJaj495wS+64iKqU6SqEcZ41yBDtwHsDv
	205frMTkZM+2wFZaJd5mcBim2leQm+OYW+//q6XhqCsAGGX6ZjmPxT83kkcEPGTAW77b+TRU2CrFL
	krwxOE8J4/GMzgW2cIgjpQLUlh0h7zGtz5uBWrTA+I6fRgR/jKbdpgHILrVDboWSVzXWO7aIEqXhI
	icClcqbkx7U8Mwz9BpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NQ-00000007tRK-3tk3;
	Thu, 08 Aug 2024 10:28:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NM-00000007tKz-1ZF4
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso5773545e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112887; x=1723717687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99vHG6KBBSHLQN8ohhXjHSjQ/wjLWpAkbUWnRIGsOKY=;
        b=pWa0cfcisQLuZKDO6GcUi4iUrJAoczsD8Og1WvzwqLLiuKYNQaeC6R3jvZ0rZ4AVoy
         TPD4m0PSyDtSgad16VahEMdkbDNODLdcGaS1ljAKA/dWz9XfUbtH3elK8i62DCPd3m6x
         XCZGE22g3NqV/fJZU5HP84L++iX+IphJyC6mB3foYE2cmPTQYyE4m8t7KGjR1jBLXh9X
         qXb+Hck2S4JNtnM7T6ynVPlO60m3OI1vPowXflpOPglBzLGCHBultQa702I/LGnVY4YO
         9E7C1GRtRn0xkGnj5zMvVtC5vBmKlCrKQcE50fbytwhx57TebUlfPru/O6pg6zSN8ITN
         xDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112887; x=1723717687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99vHG6KBBSHLQN8ohhXjHSjQ/wjLWpAkbUWnRIGsOKY=;
        b=mo43opjyCohyDjguB1K1TnW1tNOruASisYiTlxTZCy0wJGIwjMsvNJ1FaWL9UR5EUW
         OEf+Hmsnic4+5io1L0E/lACJtv0upb6iPPfCEWRVBfNuqGlWoP/Uk3/cavZGAvt4bXob
         oF15g71kxKHHGdukg8f4P1IFcIO3aimswsO1hUF1RwIlCOFd66mkttDs88XRQJMOoNo8
         pn9H9nj9B6FC8iMQFsYJo1yq+c7xGKVmKDWmG88CqVBTbIvEJl6jffVTpK7xCZJfB4Se
         ykyBqyIC7BeFzg+qyKQfaTRulAhnz+Fc7LRT3fTEG33o2/bbpdVJrDD/ChvMxAH7Qt2+
         gTMA==
X-Forwarded-Encrypted: i=1; AJvYcCUE+oEpw4LtuGOVmnHcsLTwVZsYvV0N2/Re3Q0GJfIgTlmRx68pI4GhwYPyyrBevRQp0beDMfQZmTyhz9bevJy+YF2GTwPGXYegKu4336A/RAI=
X-Gm-Message-State: AOJu0YwCGRRHHpBeTmTZauai0PhuoypszIujCPOaw3aYlVlZD1aBc3hi
	7/hlS1+E/M2qo4nU7uUt+impnIdNT9d681nwo/vszBLgwJFflR1vaoqfJwmrZVo=
X-Google-Smtp-Source: AGHT+IHozoY21BcuIdPpefQDlZte6viZbFzsG4azJdBTs++YWZDu6Dyunzbq/tZpmybC31GPCvae9g==
X-Received: by 2002:a5d:5910:0:b0:368:6336:6051 with SMTP id ffacd0b85a97d-36d274dd07bmr1051331f8f.22.1723112886546;
        Thu, 08 Aug 2024 03:28:06 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/9] reset: amlogic: move drivers to a dedicated directory
Date: Thu,  8 Aug 2024 12:27:37 +0200
Message-ID: <20240808102742.4095904-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032808_462976_F50B246C 
X-CRM114-Status: GOOD (  15.30  )
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

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                             | 15 +--------------
 drivers/reset/Makefile                            |  3 +--
 drivers/reset/amlogic/Kconfig                     | 13 +++++++++++++
 drivers/reset/amlogic/Makefile                    |  2 ++
 .../reset/{ => amlogic}/reset-meson-audio-arb.c   |  0
 drivers/reset/{ => amlogic}/reset-meson.c         |  0
 6 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 rename drivers/reset/{ => amlogic}/reset-meson.c (100%)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 67bce340a87e..0c092ae1b411 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -140,20 +140,6 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
-config RESET_MESON
-	tristate "Meson Reset Driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	default ARCH_MESON
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
@@ -343,6 +329,7 @@ config RESET_ZYNQMP
 	help
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
+source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 27b0bbdfcc04..bf089176c9f4 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
+obj-y += amlogic/
 obj-y += hisilicon/
 obj-y += starfive/
 obj-y += sti/
@@ -20,8 +21,6 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
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
index 000000000000..7ed9cf50f038
--- /dev/null
+++ b/drivers/reset/amlogic/Kconfig
@@ -0,0 +1,13 @@
+config RESET_MESON
+	tristate "Meson Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	default ARCH_MESON
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
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
