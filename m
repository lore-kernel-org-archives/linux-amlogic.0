Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B3C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y32R5mg2cP0Ef/VgCsIjEkAXVzHkDZ03ZkmSVnhgn60=; b=Y+Oldihz4HJW00
	srSn5BdqBK+ZF9KmR3unbm6ehhu6QTETetkWh0t0TAs5cEdNNnlrCK6PZQdsnMKaAWy0INThyFcLj
	GFa1XYXPMna6OWsdnRDB9yyhFJToSs+Tf2R5u5nBpPG7+SYQaPyk4BBcJVCQP7BNq1QTLGdxg+30Y
	0qODMTwoH4EbKdRU0tIoPM7KmnS3gFSMcxk7IBOXoUIm6soADgb+45XgKJE2XNLlx9r2Wi6oKsnX4
	rExiic9MdicKQX5r2GkuvB8iJbrWF0J2z829ZWBsn0T/8J4FVYAVk5ubOfubfLj1SlFWBUU7eYe9+
	ucTU/T4Sa5gSP3Iw33gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLzA-002BoA-0o;
	Thu, 23 Mar 2023 14:32:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLz5-002BhS-1a
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:32:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso1249404wmo.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0W5LfIvSL6UOOcdJmv7aj8I9PtjK4BS9WVUUeMGsM=;
        b=VWQtlq5Rvl9g7asBjn81CQEMRz/tL+V4pxafbWPwWboKHc8pg0M1tutpiV1JNxnSHX
         tH38WnHzxhDkpy1q9h/UV9no7smw25DiNXGpH+jHCpdvF0vZwxl3PB7VjSafScaEDobK
         QnP5F/4diWvyeLtqqBsoLuPsvF5lF6q/3bV2F8zlGo2RYU/M0OG0AducmuHKUHxI/5FI
         KBhoQVgezNOHLDEN8CjafNPlJdycmE1MVb+0vpJysWmBj0QTcNU96iIA8BN/MYr2Mfum
         +Sja3BQJhXaRzDv/L/VQQs2uVJQFDyN9J4CoMk6dnR40poPm03ZvMXHxFCKkbTk/iT2Z
         1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0W5LfIvSL6UOOcdJmv7aj8I9PtjK4BS9WVUUeMGsM=;
        b=r87f1qEd69eSR5ODH89ut/4VZf4bFs1dckMPtxWpqJtWiCD9whs1z0ynTMOVvqr2N+
         3BlHkhWWZesXCUWVQJOFD6xOsOKLWTtt6ll2f5mzHkQ9Z+PdRmjxskKZ51K3G+r6Ss52
         LCg2yv6IOdBbHee6ziyytMlf6dEebLa1o6npG4Ig7Ij2Snc0LaBqCV5bToQLb5Yk9QY4
         na/OdIXASrmKcbIgTR3fN08GZ9axS19fvPrtVuxyNQcqlPrLXZmudoK5Dt77nmXxV4us
         IgBm43w1d8vpvqVCPnbgnJHjkMeX39NcrA+3BO9Y4In7QBV78YPibrC1QvxONG6Y+Qgt
         4dig==
X-Gm-Message-State: AO0yUKUCnDdgrANdNLUUQtAeARDduFfhbrJtATYcekUSQdmNW3bpt+OC
	WLjbbLJJgDX9QGA2y5SR39A=
X-Google-Smtp-Source: AK7set/eVhlVQholcGw1KiH/LJGVaLtfSahr185cQqlQtUlw+q9UzbdYqJ+TpTmBcfmehXSrRhQQxg==
X-Received: by 2002:a1c:790e:0:b0:3ee:95c:b73e with SMTP id l14-20020a1c790e000000b003ee095cb73emr2337020wme.24.1679581923585;
        Thu, 23 Mar 2023 07:32:03 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:32:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 10/14] boards: amlogic: add Radxa Zero2 defconfig
Date: Thu, 23 Mar 2023 14:31:38 +0000
Message-Id: <20230323143142.780306-11-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073207_529034_55197D53 
X-CRM114-Status: UNSURE (   9.77  )
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

Add board configuration for the Radxa Zero2.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
