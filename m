Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BEDC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUgov0txk84iOKI5hUyHHT8otxBzY2L5Oz2yZjOXzbo=; b=Hfs8iT2Xq194qP
	roFI2FVCCNd24wG40ESOFtBi2HAuhweNXPGrZ9AdLQ1T+OgF+y9ZiRw882jlE5p69Eb1HwpiORrZt
	VzmVUKCeXEndsInaeABdjn/O2WHEdDCQT2xO+ju1sOWFJ/h8A5polXBwIQ+sjKcuiLE4tWoZ+irxh
	ScGpEgTOxVSn83rXOwPFmKg3va3SqZX3zu5nOmPk7MbVa06KEEbadAyFjg6Sc1BmJIFUsS0BN7Gaq
	7hjFeJb7wWh1vVCC2mH8IEXN+Ies0UF6XisR/D8MgC4uC+DQVW8xNWwM133U0dRsc+5hmk8mqBmiG
	OML0D8ckpP35+njd9G7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLz0-002Bg2-1j;
	Thu, 23 Mar 2023 14:32:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyv-002BbT-1O
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:32:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id s13so1399622wmr.4
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRCO82fXwX/PcLGDiEW8cstJv7QLbBEbOxk+gY+h0hU=;
        b=jesxH+w0or+ZyEj1lXSEe9tqMJsnvQRKCH21W1bZQ2LL4KtJ4PlwFhsc3YjCZO3VWQ
         YrhXUpD0Uyf3yjkT/c+1MEbvI4fgWMhLKJjRqNIX2oF4jdAs9GQ3IFkyPM3Er7ZtT+Tb
         3zYrkmf/HeEkCqelA1ARsjKNaO5mTQAAxxwqd3LdDUhEH9BRTH8ulVGNLHFI92qO/U4d
         0dGBaJAXuBmVajmT8OndFdm54/FR6igXebaeMKFWSpa3CY0x5Gc8cH0dMEebprU8t4MM
         obRdFCGvRfCqda+1IRDrFnmx9An4PD6JfDHNfqfJ0Y7Uj4mGJMXJjDThqsFr1JzMuDlX
         +KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRCO82fXwX/PcLGDiEW8cstJv7QLbBEbOxk+gY+h0hU=;
        b=LiOafhMEdu0GzCPLJ7hP1hdKslLynCnZU/l6zPY9LM3GWb5ECEfnNeC7jxa2ZH/CZK
         SFBQr4at4MQy0fpvCLnkTfzjfhNpUBvDlTkH7T+tvY+Z9pomnrj35WcDNoFigt1mD7Oy
         y7P9bNLjHlEmSEKDD04R3K17fuSB893jfccmlFeMmvexu4P+tKNFUx6H32KBpN1kkFZQ
         Y434ytJKsO9lrJgkW5kTo6wf6BLv1enwupScawgZR7DdpTjlNHmVstMnNs0+Ax8iTEfe
         v8pG/HnGbfW56TA0Ayq7gCYEuoYIHy+hbMG2bkvveHxeK/EwNQeP3RKru92jIw4Fw348
         gsag==
X-Gm-Message-State: AO0yUKWAsjHKOieuBbzcdJTItkCHfzcrZglRLZkZgDYQOezkIZbOKGCg
	FpSkpQYbc+Dgbbz8Ky7/2R4=
X-Google-Smtp-Source: AK7set9I6rI7WUyAwDiMi0eoc3S3y737Bi5ZPYuCHTouqNxKNUWkpQIFV7kep/sRvmtCJLMB+P4ZQg==
X-Received: by 2002:a05:600c:249:b0:3ee:672d:caae with SMTP id 9-20020a05600c024900b003ee672dcaaemr2662691wmj.36.1679581913477;
        Thu, 23 Mar 2023 07:31:53 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:31:53 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 04/14] boards: add BananaPi M2-Pro defconfig
Date: Thu, 23 Mar 2023 14:31:32 +0000
Message-Id: <20230323143142.780306-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323143142.780306-1-christianshewitt@gmail.com>
References: <20230323143142.780306-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073157_467947_5B31A685 
X-CRM114-Status: UNSURE (   9.37  )
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

Add configuration for the BananaPi M2-Pro board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
