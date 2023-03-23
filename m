Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E54C77B60
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbv9us7vRU+Vmm7lNukkIGHyP7WI3NuNRU1RSr2g9+o=; b=0/SwGg7Ql8Er41
	Y++sOH52czxwGtQOZVpweJTMnZvFuu1ELXNLNN9GDrTBJ0YdyRbiYBfgCpl42/vMMJPcpyIv5sWl1
	j1/FvqdvzDRLK52NxBxvfya2X9FqpS2A1VuTKPQRN3yZ04mEuRwikaRrGjcK01rWWhxw+4YYHlVcS
	FIIRSw/MwTFbdZcMv3O+7xqAsjxXMwBnAVknpUHA1hqYqhOrQyCSlWZKX7z0Gpch7P9iTPo16qjUg
	nf69hx5JEtzb4bpl5vWy61KfI2yzM/pVprfYoWT7RWwPeFQ57plimUY74clzXDuRgm5jFmDBUYS+t
	wjxvhhSTmDvhd4FGvcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLz3-002BiN-2I;
	Thu, 23 Mar 2023 14:32:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLz0-002Bdk-11
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:32:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id r11so3941338wrr.12
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aMILWDr8BhFckVZ/XvWyhFwgwF2G3pcTju1ZKvEaRY=;
        b=OA2KAM7QYTClv43cvXtA/vfsC8Wm4PacXkGAnuw3UiBdUZfQrftOOKi824oehlcHUO
         TnjKyiT7w73vLNEYe93n2sKLU7US5NP458BmkZUUezvW/JEbR+n8iySHfLpcbWr7OawT
         7jfiGZ+Wzm20gpDJSZ9RdY42+5TOeN9lDoagCQijgLKVd5+yc4i+jDct6Q1ymyPfHpeC
         MyJSWTjE5pphj39lsuHh/7bwpyAiCHME4hXG2SGqW7v/Z/e0llkb6SOcp92Ay69b7g00
         oHh9+PqhRAV4AgEzCDW2ydoco6VW9fM2fxTlRTtPxqo8ngtCKaLWBdzxxXlzAtRNStJM
         T/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aMILWDr8BhFckVZ/XvWyhFwgwF2G3pcTju1ZKvEaRY=;
        b=IGbWz9MVrNZYMrBsXDNC0Rf6Ml0tCP9Pxfi1RHS1GPBG8kkgqmNqqZ2zoBWaz963EZ
         h+9lwrYf/yG03tixHsO8BXoLdUobf+magoRzQEB+eDxvgR7LZ2DmOBQhllOSNMRxPy34
         wMSDqnMMe/mN2LFu/xJ5Wz4fqHNAPvz+bjuOB1/aREunABJIVk+768w3DXoVZcXPAvaq
         bVrrpYy8pyy0PkyUQsZnrb4l0mDSp9qVyFNRioNppma0YmArgPyg67badQTdhyKm4pYh
         XcQq5yKpCEkp3gc9YAwB0yGNKKW5T5NBrxmqCh0xbGk46dxUu01ZyEibbPn18INmSXGi
         yWkw==
X-Gm-Message-State: AAQBX9dOOWTfsWHloe5itguLKuq2rLzhAZ6ShFnG3084HmuwoMjSvnpg
	cl6O6gy0uyVP0bnNHAUhi8Y=
X-Google-Smtp-Source: AKy350b7vLmT5iWTCYqKrcL80dv08iEQYbqwnD8JthBPTImZ1RvUy1LhFSJIbNThGsIGW2XyL955vA==
X-Received: by 2002:adf:ee02:0:b0:2cf:f279:378f with SMTP id y2-20020adfee02000000b002cff279378fmr2772827wrn.44.1679581918550;
        Thu, 23 Mar 2023 07:31:58 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:31:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 07/14] boards: add BananaPi M2S defconfig
Date: Thu, 23 Mar 2023 14:31:35 +0000
Message-Id: <20230323143142.780306-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073202_394625_9F51C411 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add configuration for the Bananapi BPI-M2S.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 configs/bananapi-m2s_defconfig | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 configs/bananapi-m2s_defconfig

diff --git a/configs/bananapi-m2s_defconfig b/configs/bananapi-m2s_defconfig
new file mode 100644
index 0000000000..3109e0ce48
--- /dev/null
+++ b/configs/bananapi-m2s_defconfig
@@ -0,0 +1,82 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-a311d-bananapi-m2s"
+CONFIG_MESON_G12A=y
+CONFIG_DEBUG_UART_BASE=0xff803000
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" bpi-m2s"
+CONFIG_SYS_LOAD_ADDR=0x1000000
+CONFIG_DEBUG_UART=y
+CONFIG_AHCI=y
+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
+CONFIG_REMAKE_ELF=y
+CONFIG_OF_BOARD_SETUP=y
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_MISC_INIT_R=y
+CONFIG_SYS_MAXARGS=32
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_PCI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_ADC=y
+CONFIG_SARADC_MESON=y
+CONFIG_AHCI_PCI=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_MDIO=y
+CONFIG_DM_MDIO_MUX=y
+CONFIG_ETH_DESIGNWARE_MESON8B=y
+CONFIG_MDIO_MUX_MESON_G12A=y
+CONFIG_PCI=y
+CONFIG_PCIE_DW_MESON=y
+CONFIG_MESON_G12A_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_G12A=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_RESET=y
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_DWC3=y
+# CONFIG_USB_DWC3_GADGET is not set
+CONFIG_USB_DWC3_MESON_G12A=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
+CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
+CONFIG_USB_GADGET_DOWNLOAD=y
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
