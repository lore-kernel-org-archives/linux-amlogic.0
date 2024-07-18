Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B56C41513
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9L/hnn9MfgKFrT6Xr4wdKGzqC3eioIvVvR3pVlaMNM=; b=zoCthVRhdpZWhf
	NAsLS0gUYfXNXm3LH29yo20m+fiEZK4r9qemBBoYAZsaDLnOrfFUlODSZ3LmcCqcrp9jmknzAngxH
	ISHQ/bGEZzr2/qOd+0N6bRS+FnbJaSxhpFXefW9xUdWjcEVWD+MglEDXpMe6tDjWXa0sj2HcUc4xd
	UfZLabyQWVyXwsj2lJjeQSPd5eHR3IiJmcGqC4jCam4iVxbEptrdMok0e9djixu+UeUnp6gtppWic
	y8jZs1mtXIN+fjdBlOWPs1MjxVvsa89cWwg5/4bvAtMVyvjDKtyPRSMRc6bkmj+s3XukP0ZLVFs5c
	hbosKTtDcCshw8w7rtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtv-0000000Gd8e-2UaP;
	Thu, 18 Jul 2024 09:58:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtq-0000000Gd3i-0r8l
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-368380828d6so420476f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296689; x=1721901489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FraBsn5t4nMihNDzTPwopMxXwcMdzGEUC8JHsJV5Dk=;
        b=ummUJWaidVkEYuAZntOhymusjeeK6BeO9UgwZP8Y8RhM3ifegjsnhV0wMGdz60PaMv
         NgkQvVjHpZwoh4SUvI768erbFAhBrPugw44zjjzQT7fb4l1MWwkQ84fDcS66+jcFXEAk
         UCrhbx4u9uupWgstBmYvrFvqv8tz4rM7r0cgOrsZvTRxUPPIYM2dRf2FSktnzMRfw7yT
         D9eMHe8GN17x81yN9nuLVqQ4TRHWRB4w4/RgQFS8mNVzg5CCJqTodviNlMhBlePeJEg8
         Powwp9xlLqDKo40Xa2xSJCJKNrjQ/EEHzZEfE7Q1NdsNkM9S14eYvPodJLjuvG7uuFcD
         pttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296689; x=1721901489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FraBsn5t4nMihNDzTPwopMxXwcMdzGEUC8JHsJV5Dk=;
        b=sHQ6qlc9dYk86bI+fzfGMLukx21UvFRKnwvdlSXSVw1UoT8ytlyafecWzFERX1rp9C
         YgiYYWNBgXbZtu9sMQhTCNk2nuQ+/oSrWR0BMM1DBqS2WZ5+amsq0mJEvn8onNvI+AkV
         Cf/tsURTLTAjSQmBvNELGy0rZtiwOyUSnxRF7wrrZO90iw9ItVlSJM+ubJqWT2daFTjQ
         u1n4d67I63QudJ6NM8OtHz7jGB81dqpDFSavYtx7w3JqRvpxETyTJRBa1VHCAPZrgH9Q
         oZQ7KunnZ1rQLTyKFO9OY/+RBywOx9wNDmo3y2iduRgzES0NUElpJi8Bp62aMLYc9gG3
         RPhw==
X-Forwarded-Encrypted: i=1; AJvYcCWB1kWNgCuJy1JZlFL1Tsnx7HYEKLTMZ50go+ev6l9pciuc05+cDPrdwTGE0pTUrerO1yb2Pqv0b7bsGegXKtrzrbwAc86+TyyMWRI4OzYQAW4=
X-Gm-Message-State: AOJu0YzL3GkKr/pYfLAlEdzwp49t1egZfPZGi3lonbj8xT9mMbg93G26
	xL8rFV8E38UUYBTinYq5WQgl0KB+g2RZ2rT7w3YWXVkZdN4og7+Bd+ZuMy/1dBM=
X-Google-Smtp-Source: AGHT+IFfFHtbCLCHhNC4eT72EfA+0uRA7O4pqzK1FiqFakwv+5WvN9D5HdNF0I2/90lf698t3MbycA==
X-Received: by 2002:a05:6000:2c8:b0:367:9639:66d3 with SMTP id ffacd0b85a97d-368315f3344mr3179887f8f.5.1721296688962;
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/9] reset: amlogic: move drivers to a dedicated directory
Date: Thu, 18 Jul 2024 11:57:51 +0200
Message-ID: <20240718095755.3511992-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025810_275330_785FDBAB 
X-CRM114-Status: GOOD (  15.05  )
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
index 36cfdb81cd34..3015fb8bb6e5 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -139,20 +139,6 @@ config RESET_MCHP_SPARX5
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
@@ -342,6 +328,7 @@ config RESET_ZYNQMP
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
