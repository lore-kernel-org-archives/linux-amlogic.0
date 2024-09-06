Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55176CE7B17
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLC74m0bII41eSn4lCsq2rscWWnD5VXvbSul1xjimKs=; b=hu8gtrJCa3NbEP
	quCGJkkURBUFv0Wu/W65K0A8PojcuYKHEvFYuna0ZCoJnXVHXMNiC5KKPB+i08a/g00BUhnWjOkw/
	pq5eLNGlzGZ+L5Wygj6FPwXbRX8nmFjmyBFWxS8+jlIxn4aElicXTvpYaqB50bmcnIaORNdIoU1t5
	z3L2EsaoQ2C2Br0ODNjCt0a5GkZTNNNrOs2WPZIvROKWDMAc2uBliti8Bm4AdTL4fLQHn1Yuq/0+Y
	a1UT/sovHpnRx97BtK2EEV8DV7/WDjN/pky+krHwiv0H+ZVOaryLaV7Ce24stht5jsGXf09alT7Tt
	2eu4j2vg/QtfKTH5oEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZGu-0000000COSi-00kK;
	Fri, 06 Sep 2024 13:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7c-0000000CMH0-43UG
	for linux-amlogic@bombadil.infradead.org;
	Fri, 06 Sep 2024 13:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A7e2t080sCK0X27JFCHbHxpErVD3WPN9VMtlJLZs3BY=; b=BnQdKWJeHpVt5Y9jsfTTvKxRhE
	Z43sZu+4dERWHxm3CnYLvBEVR5Ren4fGZiS1HknruBzS81rqwusd+gzKYpuHdjYGgfVUqjdnirYlx
	2I/9NuUO/gt8CwQY1Axis6qqImMMoZ+bhLUX6PV6+GL21rJ2kPTN0WgiwWZT3nNwUNIGYJGgn2t+X
	lNKu1o6WOuG2MhEv7MIeETKMRrKTBUgdA82tbBM7cvqZG+TlW/m0Zv+jaWITEU21hFyvNiMrFyEg+
	VHRrajC2gSc0jRw/Tp+3DPrLolo1jj0VJyzgUznUrKeQDf+oISmdHR9uv0eGacaUGMZ2kbhzE4JDZ
	kT1H/SYg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1smZ7Y-00000000fh6-3zb6
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42c94eb9822so15567975e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629725; x=1726234525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7e2t080sCK0X27JFCHbHxpErVD3WPN9VMtlJLZs3BY=;
        b=R+ByeKAEFK4GYtbRS5c4MR1nfURZSzxZxspZRbkVSkSsL8Bor6icP3ZNed4AJ10c1z
         h01YRtDroM8ijbx9vbpOULEKLucq59m+Pe/uVwcUl93g3l9A+Lrr+wLCeomo5jH/5tpe
         RUrl0SexwD7ZRRzXIDALLqoZJzp7srs+40Xgs/7K1PlA/y8ll/WrG9QSGxw85SMQi3Qb
         zAAf4ggWCWe205yu34Y6WKayikaqKSMtPGI9ixaXsRQewB1WKJdKN6kyVE+yNRYQQCxx
         WLX+uDp6eq2V0BRu8r8YwYjAElPZe2FI4qgYvNztX9dgFeviUIYAAOmzG8o2Uj3DU+6Z
         ELUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629725; x=1726234525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7e2t080sCK0X27JFCHbHxpErVD3WPN9VMtlJLZs3BY=;
        b=jtGzTVGLJ1B2KmDsDUhgYEFzJ2rpHBxbDOHkaMun8r7KNTEbhh0SNgj3eDgGVwN8El
         lidGu5OyiumTrlba9TKee0wtBB0BVpRpi7/tGavOwmKyNLq4f2pYlzvQTg+laye4GuVt
         YmjInlDHWtSpWNoSZuX9tTOKlJ8EtFZk+qNHcSzQTS4pPmW3az+ci0TN18VihdpExDqH
         yMZveBZhsvMMo+Ahxy6nlWnId70/uLkVWM3hXPyuWVc6N+PAiWP8bn4ymSby/kCOKE1H
         f/c3DZG4u/Xa5H3WEYaJmTwg4ZkqTkkV4mPzoNd+xxbqyUiPFCZ79PSlvLm4e6B6wMgF
         bMFA==
X-Forwarded-Encrypted: i=1; AJvYcCWTROpt05l633US914GSUlnvyHGnudqeFYYImD3oZPkXjgOAL/dK8H1/zLR+GDQSsOgkSUkNWwI8y2eUPsD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCJ0O3eQRpdm8Orm/Dc+bPCDjA8nJqjNnJWxkNlLMbgnos0iu
	NfI5VPu65iSfKeVqmHqD+cq4mPZOzYd+HVMQHjmd/rXPr0NT/bWx8+prUA00TarMgyKxw5ykVKX
	g
X-Google-Smtp-Source: AGHT+IHTMY70b2wlGnBeKNWQ1H9t8xY5YyM7J9AJV6VQM+f6aKmz2fjdTwT/C0XAKinvOj3j1jrQmg==
X-Received: by 2002:a5d:58c1:0:b0:368:5a8c:580b with SMTP id ffacd0b85a97d-378895c73d1mr2022486f8f.19.1725629725133;
        Fri, 06 Sep 2024 06:35:25 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:52 +0200
Subject: [PATCH v4 7/9] reset: amlogic: move drivers to a dedicated
 directory
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-7-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yrGWoxCpwHnlg0sdrbvMgawxznUl/m0tFw6lwaYIwVQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUT1wWu7fYlSNotSd/YCXGraANoQxIW+ZEPS
 XPNFQxPKCyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFEwAKCRDm/A8cN/La
 hZihEACuzpcQEZLYGWXGGYjSdQb2I7XyOrvYAwbZ/bhUGUbWntGZO2HkWalrWET3GnMTnCeu1g5
 n3CDJpxVbSOke6/YnOGA86Z6L4QxjDE18SB3x3XvQ7Jx0JcHzVYpULT+Rb/2J/ItXbpe5tiC8CE
 /k75o3tYZuc4KUTQDjjXnenlqbcMupjzGuj9w9PbyXPchrLC7H7qEMuicnD3owMstSeinZtExx9
 KyffddVYX1zkYzI6xQXhbm2Vp6vCYu4kKgtE25HQN3UdqgU+iu/XrT8TDMFwKdSacOWsBuOwXuO
 pAALO6F9cgglE9WFAl+c+hFVkcFIAJ/YhsYMIrWzxekYRsREDZGEBabKt45wp7tdNDueU6UkaM2
 xwG4MKaKjJN0GVOUsjDpGagr2c/sDCHtf/5kOpEtKbkCq99lhftOcHFSfT8iqd2pce1vFjUqfa5
 ZBJONWyc/hUS+l2bUE/KC/C71xLW+juq36/70HAW33dF5wmx1n7o/p7o26G4DF31HKB33gfqao7
 f+6X9ZwK5iZUp2LrlfgtdXE1uqxzwM0tc4vBTSl0TdW7b+6G1LXxEPMWXC4uGdC4TkGw/QaKYj9
 JvsKrF6QE9jR9vSHbdBiqQNjRHdCoJ+QQ3VsncLkgP7MpsXz5AYVHewJyK8/AzOS2JUlzBp3zf1
 a4WeASVXIgbJhjw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_143529_641609_6510C2A3 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/reset/Kconfig                               | 15 +--------------
 drivers/reset/Makefile                              |  3 +--
 drivers/reset/amlogic/Kconfig                       | 13 +++++++++++++
 drivers/reset/amlogic/Makefile                      |  2 ++
 drivers/reset/{ => amlogic}/reset-meson-audio-arb.c |  0
 drivers/reset/{ => amlogic}/reset-meson.c           |  0
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5484a65f66b9..d28c4401a310 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -153,20 +153,6 @@ config RESET_MCHP_SPARX5
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
@@ -356,6 +342,7 @@ config RESET_ZYNQMP
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
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
