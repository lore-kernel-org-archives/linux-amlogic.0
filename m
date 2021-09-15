Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E60CC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED30161211
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED30161211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksWmAcGG1P5anw2dsLHxssqoBkwTq4opur7ui5MuGYE=; b=Z/7kRcStV84taz
	gEHpiSlxYOTXCLOnX5+6VXvIJ80Qke0ASJ2Q6LJuwwNZKTH5lWkalck9lWKSzANJA9SXotVrWxsXW
	FS5FWxU0KespGlCUt3rdt3aD+KEj27JQSV6SfronDvR7KhspF8oT90hNp2tAk8dxFK4QVXPwAggmm
	Srrekjj+BMlypcsgdg4N20nY9kUzqfazth+V4b20L28i22ZX1Ru/ecJgD7PSmS+MQOVZMdDtPq/X4
	lYsHY/cAC2khP2XkeURjuXsufF5At3H/cdzCY/atOvj2bpysbIlUEzo863z+/WLrtnXgNdJ0VUkR7
	DQcKASU27xw/t1HyFyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQK12-007qxy-1A; Wed, 15 Sep 2021 01:47:12 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQK0z-007qwp-2Z
 for linux-amlogic@lists.infradead.org; Wed, 15 Sep 2021 01:47:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ho42so2564269ejc.9
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Sep 2021 18:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E5nY9KV8CXiXQZmJFUhKHvx39wwJZFhnllAAOAzJVO4=;
 b=BIvCfR0ApO7Roul7Y/iJ5H8B2CZzrHLr/CZ59PTMQG6S2DWPz9akSnyUjGcjDUaBtl
 Y19XR9uNhRQqVXko/aVt2BufvXT1uiQWwqe2gbHKhR1pMjl4Uy69xLqdnvtg9e2wrTLm
 13Vs8Azk/TXHGelMqFfGrcd4WJsFiKevAC+cphd4HIJr32/ucZP4tZUINYR/YSmwzUoG
 WXJ0epuRjzMDbGK0t7+kS4L8/W64rVIvCX2aw+yKhu1U7j6HnsTa3IeMk3mczkPvo+Fq
 mY2svdjgs+DBU1QwBdLwCdP5TLY1vuA196qObjL5VLjteADmM361Y6ibBUwrcUbi52qf
 4z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E5nY9KV8CXiXQZmJFUhKHvx39wwJZFhnllAAOAzJVO4=;
 b=wfK5ku+aoKX8ulftQLFHLG5s+Jcvy3MSEUy9aRu3gF7wGBdwOmZRui16qgnxkNduUj
 1bsiT7AqEgW8umauUFPoWah7GkuYoociobbdvWNZKiyb9mEDXY6ZzwTNlYXXCwtxwl1N
 zor89PLSj70TasRzgrW3Z6AHdhUKCiI4KR3iMQzXzlG2NnOa46wLRN0sZszkSqTzqMuD
 mQQ45wEbbfcabfSnoye1ozOj4D8tc3925ClIhDyXCC+SMHiULwFMZIVD5ADSS52FFZKd
 Pe8xowSMLYN+D4oAF9370soWh+YbDGVLR9CpLeTi5whE8EhrA5IzxJZjUbiRcusezb3R
 Hl8w==
X-Gm-Message-State: AOAM533xHomu1ZAd2X8wNYt23AIS4XbZUV6v9Oex0XVUWGsf49q5TFpw
 eiQiIwL3xRct/Rk93wX4jes=
X-Google-Smtp-Source: ABdhPJwIED9ywBrHplplSNUg82/opYujxf1574XtIaQ+Je8nrQSghj/lt+pFYWndXCG3Djizgf36zw==
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr22416103ejm.325.1631670427707; 
 Tue, 14 Sep 2021 18:47:07 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a15sm6601835edr.2.2021.09.14.18.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 18:47:07 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 3/4] boards: amlogic: add Radxa Zero defconfig
Date: Wed, 15 Sep 2021 01:46:58 +0000
Message-Id: <20210915014659.5336-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915014659.5336-1-christianshewitt@gmail.com>
References: <20210915014659.5336-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_184709_146364_9B06A959 
X-CRM114-Status: GOOD (  11.43  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a defconfig for the Radxa Zero SBC, using an Amlogic S905Y2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/radxa-zero_defconfig | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 configs/radxa-zero_defconfig

diff --git a/configs/radxa-zero_defconfig b/configs/radxa-zero_defconfig
new file mode 100644
index 0000000000..acd13f1c6b
--- /dev/null
+++ b/configs/radxa-zero_defconfig
@@ -0,0 +1,70 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEFAULT_DEVICE_TREE="meson-g12a-radxa-zero"
+CONFIG_MESON_G12A=y
+CONFIG_DEBUG_UART_BASE=0xff803000
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" radxa-zero"
+CONFIG_DEBUG_UART=y
+CONFIG_OF_BOARD_SETUP=y
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_MISC_INIT_R=y
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
+# CONFIG_NET_RANDOM_ETHADDR is not set
+CONFIG_MMC_MESON_GX=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+# CONFIG_PHY_REALTEK is not set
+# CONFIG_DM_ETH is not set
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
+CONFIG_DM_USB=y
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
+CONFIG_DM_VIDEO=y
+# CONFIG_VIDEO_BPP8 is not set
+# CONFIG_VIDEO_BPP16 is not set
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_MESON=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_OF_LIBFDT_OVERLAY=y
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
