Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE07C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:43:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9B623A63
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9B623A63
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJCzpwy02U3WwcVkWxDU+g+A+u1bTVs8SFflXBoI/BA=; b=gs2gcFH934+/vszR6muJXSV32q
	/iWRMRCbmOGjZAzEF1qgbEWQAc9U0sE3xc27BIxZvkRXj0PkR811anJIGl3FXV9Oy+S6pE+YcZ9Hs
	WCk71XhUQCMn++m7Sb7ywj0j0zrryLHf+6V38egYAV3HnMQYHTgHr8SgBK9oRpDF6608yVNqphlG8
	LZ4BqYBmTR08BDMi7mljAhUEU+zqT2EqarTQ5RLHWTAZWkfZslRmMC+HpWIRn9bFbt2wqKuLEzwMo
	+aD93xrC6RU142aMLxHoEqmu4mqdWvtlU49pu/2hZ4TQVvLhWU0JUpntX8VajbR1WzbYwZwToWW0K
	mOSpqbyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCIc-0002jn-Mv; Fri, 18 Dec 2020 09:43:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCIY-0002iP-EQ
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 09:43:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id t16so1439618wra.3
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=riXNhwu6QVUbvAIBHSYPEHu4XiopFfLuVH7acrDam/I=;
 b=RUvlccjfRgnIuajclJR08gYlt8t2m8T5iLeIcpf5HJ6asyk/RBHK6CVvkhfwxAJerz
 e+CPBe/N2iTsqZTP7P46xltksVlzfinS48UYsdB2XwoDlJzFszqwapawhb5+5R2EqhC5
 UuPkvx7tFtRbKFikouyJ/i/+n+XMmYmXiukRFukQCYl54zSTLGoouyFmY/Z+RQnbicRB
 Ks6XRi3B6MO15s7Sc10OT0hxeyajOj8NCBuIdICiTW5xdccZO/6boPXmMr6pgGJuKDBP
 Oq02jCvDL4UB4rBDyLnILbPDULRjaLZNo0TxBfoSH+JII+9+GnOc+J3e7pyTjHd9FgXV
 lzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=riXNhwu6QVUbvAIBHSYPEHu4XiopFfLuVH7acrDam/I=;
 b=KCeFxttkXqx5+1Yxi0oMGJJ4JuKnJWZGI21yk9s0X+4VA6eGyMDrjmojg9iwjxcIkF
 67vxJUQxj98yrQEtUVhEG9FKGQK6qmeSMNqQHXHnX7gh3Z/r3yXQ7KiihSyiEphxH7TP
 juYkqG7GXtFZjx0Fb4k3Hs63WtSCzOnbEeOPGPzyTlkW14YEUl1AP79rOvp7yFqgb9Nc
 DFiKmO8ZJ/BvrgV9ov2B6NPjIF5N1f+Pfwffg7k7JE5whDkuvQPfYwwrCcYUB5kLOOC5
 W0QXQhrM7QyWl4gYH2gCK4z8ebt4XrFdozTuzz1PA+D6SA+8CPYgeMxakU8hpARz0OIa
 tVAA==
X-Gm-Message-State: AOAM531GtFMKLJMXpcFll8YW/hcLoD+sjuws4rLR0CiXq1Fjbf/I6hio
 wlooTfbU1SZl/5RTlUD7qsyo3l9nmS6yOx1w
X-Google-Smtp-Source: ABdhPJyLzkuxzrWmKVVSle8E9O4ChnLPJLpLRgSyW/uIOWEEsrZZSLI2Ecrdk1NXtbrbECLA+IAOwg==
X-Received: by 2002:a5d:42d0:: with SMTP id t16mr3419268wrr.230.1608284620728; 
 Fri, 18 Dec 2020 01:43:40 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad?
 ([2a01:e35:2ec0:82b0:d897:20cf:5b8c:50ad])
 by smtp.gmail.com with ESMTPSA id i7sm13178047wrv.12.2020.12.18.01.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 01:43:40 -0800 (PST)
Subject: Re: [PATCH 4/5] boards: amlogic: add Beelink GT-King Pro defconfig
To: Christian Hewitt <christianshewitt@gmail.com>, u-boot@lists.denx.de,
 u-boot-amlogic@groups.io, linux-amlogic@lists.infradead.org
References: <20201218084545.29135-1-christianshewitt@gmail.com>
 <20201218084545.29135-5-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <732fdedf-269c-6574-4b80-49a2f432fb4c@baylibre.com>
Date: Fri, 18 Dec 2020 10:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218084545.29135-5-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_044343_320170_7A414B45 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/12/2020 09:45, Christian Hewitt wrote:
> Add a defconfig for the Beelink GT-King Pro Android STB, which is based
> on the Amlogic W400 reference design.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  configs/beelink-gtkingpro_defconfig | 71 +++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 configs/beelink-gtkingpro_defconfig
> 
> diff --git a/configs/beelink-gtkingpro_defconfig b/configs/beelink-gtkingpro_defconfig
> new file mode 100644
> index 0000000000..569031600a
> --- /dev/null
> +++ b/configs/beelink-gtkingpro_defconfig
> @@ -0,0 +1,71 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_BOARD="beelink-s922x"
> +CONFIG_ARCH_MESON=y
> +CONFIG_SYS_TEXT_BASE=0x01000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_MESON_G12A=y
> +CONFIG_DEBUG_UART_BASE=0xff803000
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" beelink"
> +CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-gtking-pro"
> +CONFIG_DEBUG_UART=y
> +CONFIG_OF_BOARD_SETUP=y
> +CONFIG_MISC_INIT_R=y
> +# CONFIG_DISPLAY_CPUINFO is not set
> +# CONFIG_CMD_BDI is not set
> +# CONFIG_CMD_IMI is not set
> +CONFIG_CMD_GPIO=y
> +# CONFIG_CMD_LOADS is not set
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_SF_TEST=y
> +CONFIG_CMD_SPI=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_USB_MASS_STORAGE=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_DM_MMC=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_MTD=y
> +CONFIG_DM_MTD=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_ETH=y
> +CONFIG_ETH_DESIGNWARE=y
> +CONFIG_MESON_G12A_USB_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MESON_G12A=y
> +CONFIG_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_RESET=y
> +CONFIG_DEBUG_UART_ANNOUNCE=y
> +CONFIG_DEBUG_UART_SKIP_INIT=y
> +CONFIG_MESON_SERIAL=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_DWC3=y
> +CONFIG_USB_DWC3=y
> +# CONFIG_USB_DWC3_GADGET is not set
> +CONFIG_USB_DWC3_MESON_G12A=y
> +CONFIG_USB_KEYBOARD=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
> +CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
> +CONFIG_USB_GADGET_DWC2_OTG=y
> +CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
> +CONFIG_USB_GADGET_DOWNLOAD=y
> +CONFIG_DM_VIDEO=y
> +# CONFIG_VIDEO_BPP8 is not set
> +# CONFIG_VIDEO_BPP16 is not set
> +CONFIG_SYS_WHITE_ON_BLACK=y
> +CONFIG_VIDEO_MESON=y
> +CONFIG_VIDEO_DT_SIMPLEFB=y
> +CONFIG_SPLASH_SCREEN=y
> +CONFIG_SPLASH_SCREEN_ALIGN=y
> +CONFIG_OF_LIBFDT_OVERLAY=y
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
