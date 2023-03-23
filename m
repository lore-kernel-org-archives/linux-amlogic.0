Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB1C7619A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hOcK5bWLm9sscelqh0xX0c+l/AIBmYsopXK8iD6AGw=; b=g7Kk2wVx1hDKn2
	fmqJ0wG7lGr1ytH1Lh5HCogBdVznYFXOOoEaPKf5WW+NGHPlKFWJYXqUgixiBfARcHnO/Gw7/L5NF
	ix1CF7n9pcnvqPQPhFmNtPtfzfvThMiXLcGsZ3S16SEIFnOLF6KmKcpn5HLEyZWMRvARsFiUfsGrt
	H3mwQd97kdyBJBw4DC0ThIJq8at7W9V6UwXaVHAFerxK0s6cW7/S4gTAx+PtgTd3A/RVjRbPDTZ0I
	5miwXSYWk0U7akL2K6AT/XLR2I1nIVuXWRBn1UIa9s3FzGT6SNMWHQO5vBgf9JUa8x/ch4N5+y18X
	tHH3v/NGYFHNQEZ56mHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLzF-002BtM-35;
	Thu, 23 Mar 2023 14:32:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLzA-002BlN-2N
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:32:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e18so9197341wra.9
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA9OzQtLNXUEwNbCzftIms+7+m5IIZ5knAsN9Ujyc9M=;
        b=VaqMoFC33MWf/1hj2Olz1PHIpkbcc21DVaUK8NEiyrSddhXGAeizFSvSxJ7JaqGH4b
         c2yuCVGluLxg72DNbBnVI95oEfeYwxx4h90alZOepYObQUql3cOK9C5t6rmZj0+R5k67
         2mRK84iGr9P+KulZ7pS9eZie6klhH51crlLcqEyvTVaPpGIJ3TdJdog9p6VWlkEB/Qw3
         W0x2pwMYODldzgYZFtybGKECc+hJDYAC1SEthsgTFeh2e35nUZuopGCSijobNYpMkiVY
         Z++YA4mY9a3XOS5DDYcOtNb9zYv0PZg76xHj9n7y7lwLPej3BpT3f9s9N4Ab0yt/w6va
         gcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EA9OzQtLNXUEwNbCzftIms+7+m5IIZ5knAsN9Ujyc9M=;
        b=BmS2csUWLYKAiU43ZQ3KYUCNBK/ancVg4FkyE7G5Tj+ra8fgMmZuHzM4RTl2oa2S3v
         72SD2dHjdES5+VgDlr0h8ZEnF4TjZRZnWvoxMtgNPRN1j2/aal0Yfn4t++v4MBLJL25t
         yN0baw/aIsIAGi7kuItbg3M8aCTNmFJAsj9zvBNfMSfEZ8uzA4SEzrIrsyw7nT6GBImQ
         U88mPdPLcrPfN28RwpmwBIbdqJuRgUPWQdzTN0Zk9XLtm/gCxGyVxDm/9q1rKUklnW/n
         cX5o/Jr2WrAVa3BESWxGRVAnQcQeEACsxbE4Shqnpwsn0HI0KqZJIz2Ebvgc/NTi2O2Q
         sIYA==
X-Gm-Message-State: AAQBX9etEz+8/oQrr0xBmLeW86z/Bn3e4oPScb7NzGmFK9EQnSCXthlg
	3sLxmiGLVdVoiBRpWXkU58w=
X-Google-Smtp-Source: AKy350b+4SsS3FSmkFVIDypeXAAo/W5+9ebqcmS7nQ4W33EshMoUR/KdaRi3zw7n7n2KoFO25PzOww==
X-Received: by 2002:a5d:460f:0:b0:2ce:aeab:da98 with SMTP id t15-20020a5d460f000000b002ceaeabda98mr2710181wrq.28.1679581928929;
        Thu, 23 Mar 2023 07:32:08 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:32:08 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 13/14] boards: amlogic: add WeTek Hub and WeTek Play2 defconfig
Date: Thu, 23 Mar 2023 14:31:41 +0000
Message-Id: <20230323143142.780306-14-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073212_790324_0939C932 
X-CRM114-Status: GOOD (  11.13  )
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

Add configurations for the WeTek Hub and WeTek Play2 boards.

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
