Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1628C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZumPTpj7tvBYHo1qVhG/Qq5f37xquNaT/4JO23vN8Y=; b=zibreY1vXm1g+O
	wPIpvxUZyx0A5UgpvXEz2z7ZlC+GT/xGWHuAsyt5A59Pa8qq2GWqTUEWVShJiXNqaWbq0cbBenj8B
	QWvf66+owJ9YowG1vX27uaiTGgMuRPkjEHf6ZGivkm/vI9tKmbS2tSZWMTDe7IbEdke06LkSGWTDq
	ODrnc62NeZeZHeF1DrZkBW8iyB98wXgeTHy9Oc2EQRmSxGJ9hZB6vJZ3gSP6hFbskhWHcJVVtfwlw
	cB+BPiyfa3jU57yhFw69d80xpyTpVXOclm+xJimoOjb/QMFNnUyZ28SdGlg3As36iPXpsR4FAnX5Y
	1Mw8ND87PnZZ1JKt6x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqy-0012ey-1a;
	Thu, 23 Mar 2023 06:55:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqt-0012c4-1F
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r11so2539132wrr.12
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXOHldVjiKihy6Mya07M2G4oF2hn7XlNIO9GH0IBmjI=;
        b=ARn2TaF/HoRk4igezYcsCbGy0bLgTg3Cu4aRfHrLP8RalDXJecW1cJmALLEZomfAig
         NZgz9OF3LxuHaZFTfgbELhJNGS1Lc7R2pMpbY2BBzHvqL768M+P2HJJU+nbn/4qiR71k
         U3dAv/wibOjzPJ+QCbA+IzKsoZFVJyvlB48PgHK1hpVSBXbUSqSOIYia/wVLN9sz40nh
         CbCM7jLOwJ8ZrRAxBNODbP67cHfy97BXkO9OldP+J2dy+4L25wYditjAOi6qVJ1SVUIp
         OkVka60cNzGftgZF1gNxBwCMyEM4soiivfyzzqWA8PpKcPAg6rnaVgakP7fpYFWKpU5q
         efWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXOHldVjiKihy6Mya07M2G4oF2hn7XlNIO9GH0IBmjI=;
        b=w1cGMv+lh+dhT8i7rsRcKghcwQTi0cmZ7q1wrVkQJZSIQYwWFoz1SHEnyg6QaV5T9e
         KLAwJ7UI8AqgqM3OkDII92221hbngljm9PFHN8aRogfPjZ1PwNVDJghtIfgSa4Qb2k+x
         uooCaT4VJbgUFwCo7JcUlrc2xg+01X1VsSCpP+QTmoKYa1K8D8yqDe4eMUyEKYKqm9Td
         IBhzo+bEAr+PyEbxSoPN1aiJx6mZIS7hfyqNq1qSDA96HswjV3qRpZMQMnfQSIQnlWJY
         Xo5amsRUSA9fA3HRgNme3CFHXfqrOsO7DKokcY7+eUVs6COMHMGMiUiGR674K28dg1vy
         yulA==
X-Gm-Message-State: AAQBX9c5xXXrg3gDGjRL57kfgfWEYjDk+TgQuVNSmN7fwA44IBARNObR
	NWytfaTv6lU7LhbX4XlXb9k=
X-Google-Smtp-Source: AKy350ZE1e64g6kdiPVFnSFSxYFQWYrMy5rYFObnhRmJ5lv8uqG0H67MkiB4dJp/gkhDZrn+0T81nQ==
X-Received: by 2002:a5d:6709:0:b0:2cf:e449:1a9e with SMTP id o9-20020a5d6709000000b002cfe4491a9emr1430926wru.30.1679554506823;
        Wed, 22 Mar 2023 23:55:06 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:06 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 03/13] boards: add BananaPi M2-Pro defconfig
Date: Thu, 23 Mar 2023 06:54:48 +0000
Message-Id: <20230323065458.776029-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235511_628558_59517701 
X-CRM114-Status: UNSURE (   9.70  )
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

Add configuration for the BananaPi M2-Pro board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/bananapi-m2-pro_defconfig | 76 +++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 configs/bananapi-m2-pro_defconfig

diff --git a/configs/bananapi-m2-pro_defconfig b/configs/bananapi-m2-pro_defconfig
new file mode 100644
index 0000000000..28b603fe20
--- /dev/null
+++ b/configs/bananapi-m2-pro_defconfig
@@ -0,0 +1,76 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_DEFAULT_DEVICE_TREE="meson-sm1-bananapi-m2-pro"
+CONFIG_MESON_G12A=y
+CONFIG_DEBUG_UART_BASE=0xff803000
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING="bpi-m2-pro"
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
+CONFIG_ADC=y
+CONFIG_SARADC_MESON=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_MDIO=y
+CONFIG_DM_MDIO_MUX=y
+CONFIG_ETH_DESIGNWARE_MESON8B=y
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
