Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B53C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFr09R3rS/nuMt5uSjY7b+FsW149SQziIDgRW12y6Fo=; b=j8OmFIjaPxSLoO
	gj0CifTA3nTv+iBb/zoNNEKXQ/S1sbvaeA3WX/+WG45cPqPMG9ebOn2+LzXLiqZf/M6vTg+94884/
	vJms+ZqfXnRmk30LvxUYxqWBk+oLx92GX5ubzmS34abb9lHG5kSEAkJIP3NXYG7TT3+RAhYrfM92v
	9FGx15YxO4uizbGPwOHqzl/K6IpfWwgwn0jPpZYhHAno3ClKudna7HfVSYAOOr0vZtahbL63fcOuD
	OO23z/AHOsKfDwt9MUrEiY+PlUJ1+0fuX7aBKCuBbPmOLNDHrPjPu3qTlMZV7b3vYX6MTinl0vVew
	gsMSzBE2xPapUOho0LCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfErA-0012ni-0R;
	Thu, 23 Mar 2023 06:55:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr3-0012hu-2A
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id d17so10890343wrb.11
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7QTlql6gHJ/9dufI5rRY7wtq8yqE56iTyJomQVRJVc=;
        b=Vy4I8CnJy4IL8TZ12Cu3GSzW0ln7RJzyT6mRRYDc0j4n0UoJLBjN1/d060OMh/XS6f
         MLDQma2CmaSmAimPiWEy6qixITn6xMpS8yZJTPwLPqrpEzDXWYIyCxGnGQLBqtYL+IQn
         XzJMTMqDWJIM9o65rJohXJ8kI/ViGGDj07RkUPLMoNpMVc7cT6Pu+f8Z3CXdSPoUs3tw
         LUxIpssW+IAbzBZlWCoRxrst5ASqSksOk0BWZpycdICBJG5j0bwQ3N8tOP+1ZsEBZUML
         n+2FgVTPbFHGFFy2noJOml/1qh2rfp37XJ+ATzWKlArNeEN3C3TDOHM/sWJIzDT4jkZF
         Ir8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7QTlql6gHJ/9dufI5rRY7wtq8yqE56iTyJomQVRJVc=;
        b=B/6JyAAdaNiaQZQ/S9cxiQVQoQAZjTYY7u2gwS2ceRqL4FxSnHtytbuQrfwGtPeRqc
         uy2bOcyO7TuHawngNObGlXfhDyTNT8xZ5RKgmlw6GfXL0PMooE+DuLgdD8Qnj4IuzQ0Y
         tPsC5g1raIbhvLvaCi5hFLtGAzR/6UGYQCPucXjlMdMawVJTNb7cWyPiUZ5cEgoZJqvb
         SBAwUTacMgyBrJYDV9Cvu6pcGSIBzcc9y6zZpQo8m2UbDr0xrcOonUDEpaLAsjI9vK55
         dGk+QzlH+uEbkf0x2H5VqYgJnIojg2MT/oHPXM48NqsJQOU7L7GLyD+U1T02gH8WD4jF
         0gGw==
X-Gm-Message-State: AAQBX9eQEELGE+mYoo9Q3pJEAmjGHOjhZ1GM072LjYmDgZLDyvSJQB6d
	bOraesb3I0FsnI+AVQQGXu8Ll10kWy7HUopD
X-Google-Smtp-Source: AKy350Z9s6dMeMmu/TtB25zgLsZOzhTPNU61WxG+fjIqJb+UJjJYKxq+XrEfwf4kyVh0wJ1gTDpXEA==
X-Received: by 2002:a5d:4c8b:0:b0:2ce:ae4c:c42d with SMTP id z11-20020a5d4c8b000000b002ceae4cc42dmr1842572wrs.1.1679554520288;
        Wed, 22 Mar 2023 23:55:20 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:20 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 12/13] boards: amlogic: add WeTek Hub and WeTek Play2 defconfig
Date: Thu, 23 Mar 2023 06:54:57 +0000
Message-Id: <20230323065458.776029-13-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235521_721540_55181337 
X-CRM114-Status: GOOD (  11.34  )
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

Add configurations for the WeTek Hub and WeTek Play2 boards along
with files for the wetek-gxbb board family to ensure the ethernet
MAC is correctly discovered. Set myself as the maintainer for the
board family.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/p200/MAINTAINERS |  2 +
 configs/wetek-hub_defconfig    | 70 ++++++++++++++++++++++++++++++++++
 configs/wetek-play2_defconfig  | 70 ++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 configs/wetek-hub_defconfig
 create mode 100644 configs/wetek-play2_defconfig

diff --git a/board/amlogic/p200/MAINTAINERS b/board/amlogic/p200/MAINTAINERS
index 33ca3df5c6..264218e3be 100644
--- a/board/amlogic/p200/MAINTAINERS
+++ b/board/amlogic/p200/MAINTAINERS
@@ -7,6 +7,8 @@ F:	board/amlogic/p200/
 F:	configs/nanopi-k2_defconfig
 F:	configs/odroid-c2_defconfig
 F:	configs/p200_defconfig
+F:	configs/wetek-hub_defconfig
+F:	configs/wetek-play2_defconfig
 F:	doc/board/amlogic/p200.rst
 F:	doc/board/amlogic/nanopi-k2.rst
 F:	doc/board/amlogic/odroid-c2.rst
diff --git a/configs/wetek-hub_defconfig b/configs/wetek-hub_defconfig
new file mode 100644
index 0000000000..634833f7fe
--- /dev/null
+++ b/configs/wetek-hub_defconfig
@@ -0,0 +1,70 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_TEXT_BASE=0x01000000
+CONFIG_SYS_LOAD_ADDR=0x1000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" wetek-hub"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-wetek-hub"
+CONFIG_DEBUG_UART=y
+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
+CONFIG_OF_BOARD_SETUP=y
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_MISC_INIT_R=y
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+CONFIG_CMD_ADC=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SARADC_MESON=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_MESON=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE_MESON8B=y
+CONFIG_PHY=y
+CONFIG_MESON_GXBB_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXBB=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_RESET=y
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_SYSINFO=y
+CONFIG_SYSINFO_SMBIOS=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_VIDEO=y
+# CONFIG_VIDEO_BPP8 is not set
+# CONFIG_VIDEO_BPP16 is not set
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_MESON=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/wetek-play2_defconfig b/configs/wetek-play2_defconfig
new file mode 100644
index 0000000000..6d33b09a94
--- /dev/null
+++ b/configs/wetek-play2_defconfig
@@ -0,0 +1,70 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_TEXT_BASE=0x01000000
+CONFIG_SYS_LOAD_ADDR=0x1000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" wetek-play2"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-wetek-play2"
+CONFIG_DEBUG_UART=y
+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
+CONFIG_OF_BOARD_SETUP=y
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_MISC_INIT_R=y
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+CONFIG_CMD_ADC=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SARADC_MESON=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_MESON=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE_MESON8B=y
+CONFIG_PHY=y
+CONFIG_MESON_GXBB_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXBB=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_RESET=y
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_SYSINFO=y
+CONFIG_SYSINFO_SMBIOS=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_VIDEO=y
+# CONFIG_VIDEO_BPP8 is not set
+# CONFIG_VIDEO_BPP16 is not set
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_MESON=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_OF_LIBFDT_OVERLAY=y
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
