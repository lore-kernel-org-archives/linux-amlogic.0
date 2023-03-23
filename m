Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A93C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nM5cDT4nkzsoFBr/FqExADOBBpiyti0SLJDQrti2i8U=; b=ZQ/lXPtFv/tR4x
	wSxxJ3Erf+rWwRLCHXBhg0330X5s3sMjwKqqWBXLykdgUbxnj926SQo5YJIM7rod8ZNljekvBhWEZ
	apruRgu/weK6RZOObBzWIuE5JgEinz8WJCTuhczyZuNZ+jQb4S/4BNMmKg31BLXrC3xUPQVJGUGoe
	m3D5YZ3t6yor7SvAZQI01rztg1NDtKMt50/fi8IW6s6DecEIgv5+om49YbkT5zF+SmdNRkeSRf8hv
	As8oAyAMUK6mYuaRNZa6cKOPhJzLSmVeO8DQiA1FuN3C47Gf3kfiF250amTGhAoP8AFuUrhZYp/E8
	8IT0UZoYXCS9M+i8SjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr4-0012je-23;
	Thu, 23 Mar 2023 06:55:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqz-0012ev-02
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m2so19336108wrh.6
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLMLgbbSZTAJ1quVoBzmOwoPSO5SOkpMjC+Uwc+nkTw=;
        b=ZmaqkgcEIzSScnr3LBQqp2KGthHivx3U4n1+nOCrLfnPlwQTAXNe5zUWmykHwxp96y
         8+JuWUK7bR6BZdRnWEaFFmsr5tHANtXJMaFpABE9Fzlh7RO98L+0HlUbqsyELYClvaF9
         ziJ6IbYtWHmHmvc7sxtO66jlWXnXttyAXidb7DYhrfF+3BUmRMlNcLfCm0ou6Bt7kfUq
         HTcW1JlIVArZfbckrX81CeTQKk4dt3tXVIo972v8fmKfIsCp3BschbkgFui+PfvpANxC
         McXW+QMjkPcLCfZ0pyh+wqo1cI3KVK0vgk7IzXOhOMFm+UtOXYcmlsLK4bd0/w9/pQ+G
         3e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLMLgbbSZTAJ1quVoBzmOwoPSO5SOkpMjC+Uwc+nkTw=;
        b=lNHwC6GoYgyBNZfNj9UM6rLsg+Aywl5HMoAWQ26eg/nJZIhYNBt2f8nEXdAILoS+k5
         zWS/HACA6b2f7dZWetw7rEvA2NjYWhZDDH00cH93VnsjUqhQUdPdjRJf4Qd87UeJBCQh
         KAP5EeW0+iCxYdknE4FU0bl4UYyTzJc+74n7HyHrZYVtReiWSRezMEsqeCQxL1hND71w
         09TEE0wXiO6+hYSruJbFrt/7kSSrmpu9InJgdtryDc3jiK/7xSfHqJDJj1NV+pmGdeq+
         DqP3yPAfGR05DRfygsJG57tCOVs1vKqBRljO7CqkNT79ttb+xI3G/iqoilk9jYdm6wyf
         Spcg==
X-Gm-Message-State: AAQBX9ewdbh3XadXrVdl9bPYMpGVQHLirj5cDewD0X/hmqLtIGpVdvE2
	aZogKWNDKlj6roaYB7o6kVI=
X-Google-Smtp-Source: AKy350axEZDHJgPDq02vwZ6KPONLIPIEyUmyPNfoh6jDQzm8Vgb9EzIrDCYcRUsuv/qIe6VWVeCmgg==
X-Received: by 2002:a5d:494e:0:b0:2cf:ebaa:31a0 with SMTP id r14-20020a5d494e000000b002cfebaa31a0mr1682921wrs.54.1679554515873;
        Wed, 22 Mar 2023 23:55:15 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:15 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 09/13] boards: amlogic: add Radxa Zero2 defconfig
Date: Thu, 23 Mar 2023 06:54:54 +0000
Message-Id: <20230323065458.776029-10-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235517_059452_450EF5E3 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add board configuration for the Radxa Zero2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/radxa-zero2_defconfig | 77 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 configs/radxa-zero2_defconfig

diff --git a/configs/radxa-zero2_defconfig b/configs/radxa-zero2_defconfig
new file mode 100644
index 0000000000..2218b0db7d
--- /dev/null
+++ b/configs/radxa-zero2_defconfig
@@ -0,0 +1,77 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-radxa-zero2"
+CONFIG_MESON_G12A=y
+CONFIG_DEBUG_UART_BASE=0xff803000
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" radxa-zero2"
+CONFIG_SYS_LOAD_ADDR=0x1000000
+CONFIG_DEBUG_UART=y
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
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+# CONFIG_PHY_REALTEK is not set
+CONFIG_DM_MDIO=y
+CONFIG_DM_MDIO_MUX=y
+# CONFIG_ETH_DESIGNWARE_MESON8B is not set
+CONFIG_MDIO_MUX_MESON_G12A=y
+CONFIG_MESON_G12A_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_G12A=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
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
