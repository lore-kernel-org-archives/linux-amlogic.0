Return-Path: <SRS0=n1R+=FT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F166C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E20224D2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 12:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E20224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVsCsKCaf4XE78k4FVHPJNsmU2zkqiYQneKQ+Zf27pA=; b=VvHunxXdiSKMM6noEr24KV4q44
	K21KAAqSGJJO0fgeWpteo7vGKu9WISKiUIeBuP26hMSIYb1i73N/RXmEoWlVxep8wxmTxRys3Ats3
	Mfiurxs4EPHYUyeN3hRJuMpn52vZ3D9Ym2vsQ0XJSFFEgrNZ/H9vG2Yr2iYefd4chogYKLUoPUdhg
	XnJTY8IrnONT1ssnBLFjn4UFwNPBZg707x//tWdfHKRqqw3RxNwXHUFjt9rTjX0h0qyv3erU6X5ob
	Wsyf8F8gy5BgGyE8nv77hIxWEUlz4bGEXJaFHv4mZjF20Fn1jiz2tSQx+KIUWorw3Azqhqw/Jq/9I
	c2p8JeDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp9VC-00057j-SA; Tue, 15 Dec 2020 12:32:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp9V9-00055v-7W
 for linux-amlogic@lists.infradead.org; Tue, 15 Dec 2020 12:32:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id m5so19657620wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Dec 2020 04:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=onEabqdmtNzjpYK/tr7QwKjGVZ6M4J0y8id46375WXs=;
 b=YU64BV2alvIIxJCNE25UJe+2NWPxNANqkqV6jL6Sx/tDMTP5cTCYN9olyKIXRO8ca4
 q3S5GEtuaqeLFOVQAtEwtZTDk/w9egx29NACpcMtL9bM2V1HPls4/qhJr7vSfGepkATF
 ghL079a15xYro2hY4V54QIOqhlC8KZbgnJw3JmSc0CI+ScryClH7a0ukzyKFsFdeRVib
 VU5JnVl3n+sLfyaF/DJzeqDCsWV8ct/r1zDuojp5hr4xLEy22qYQdkiWBJU2JpW+0sBE
 MhtfzKNdaJxZr1kyVx2q8RB7UM0ap9fHTGJQrbNGrawZkUR1kOmyZiyY+cct9G3ZKB3Q
 HizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=onEabqdmtNzjpYK/tr7QwKjGVZ6M4J0y8id46375WXs=;
 b=SHrJa0iIOeMKcgz0S4282gBWRivuXfPzXYfADqfo/yHb5ukATc0v56SJm1AQvxRzJn
 1vfcufJF/A+VpC+K5NwKwtudpEWFhC2ryvpy3/r0n7LMLgrNe+SYt1W3Ma7HecprSMPI
 WLDfIR4CDaOhtT5IjEdkeQYKhDANuOfaY90gfq5j96mQT3xqDrxN8rZij3XurMMQ0d0t
 0hBdUuW3jQNPh2AYnYzkBwPPVjonw2e4qiUbCdTPesGeBQ6R9hZpmsmy/b0gcXQhbDNB
 PthRZgXQdamwGsXCcpvSqe1DTiCYh+rP0Rhaz/2HScBZ2srZH6yeDiYGIAxMdZdCjRx9
 lN0Q==
X-Gm-Message-State: AOAM53364Rw4KSdxqjV1LKitktLO80kIJKMlZs07Dkdu6EPKxagAcyXD
 Be1XtEhfLuXwRJDe0ADx3veg3YubuS0Ppg==
X-Google-Smtp-Source: ABdhPJwVQb8704rO1fF4GSdOxwCh8yDlh0Qj6MHvE+LJNL8tBNfwwrtfIy2PZAdk2viS/1roA640Eg==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr2574901wrn.12.1608035542072;
 Tue, 15 Dec 2020 04:32:22 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n3sm38488406wrw.61.2020.12.15.04.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 04:32:21 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 2/3] boards: amlogic: add WeTek Core2 support
Date: Tue, 15 Dec 2020 12:32:13 +0000
Message-Id: <20201215123214.18661-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215123214.18661-1-christianshewitt@gmail.com>
References: <20201215123214.18661-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_073223_338661_250DFF48 
X-CRM114-Status: GOOD (  13.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a config for the WeTek Core2, largely based on the VIM2 config.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/wetek-core2_defconfig | 70 +++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 configs/wetek-core2_defconfig

diff --git a/configs/wetek-core2_defconfig b/configs/wetek-core2_defconfig
new file mode 100644
index 0000000000..706abff962
--- /dev/null
+++ b/configs/wetek-core2_defconfig
@@ -0,0 +1,70 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_MESON_GXM=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" wetek-core2"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxm-wetek-core2"
+CONFIG_DEBUG_UART=y
+CONFIG_OF_BOARD_SETUP=y
+CONFIG_CONSOLE_MUX=y
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_MISC_INIT_R=y
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+CONFIG_CMD_ADC=y
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_SF_TEST=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SARADC_MESON=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_MESON_GXL_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXL=y
+CONFIG_DM_REGULATOR=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_MESON=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_DM_VIDEO=y
+# CONFIG_VIDEO_BPP8 is not set
+# CONFIG_VIDEO_BPP16 is not set
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_MESON=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_DWC3=y
+# CONFIG_USB_DWC3_GADGET is not set
+CONFIG_USB_DWC3_MESON_GXL=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
+CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_USB_GADGET_DOWNLOAD=y
+CONFIG_OF_LIBFDT_OVERLAY=y
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
