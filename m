Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A30C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQgLH5LvKgrwusdJCs+N6AAVIunrhapzQnK4ifI2ALQ=; b=i2DyST8/hMxg9kC/c98Nb9wowz
	l8QSJyyCM5H6XspYdd/6aEDaHA1M5LJailBTz0pL5aQGt7kD2/o83ZhTNfw50EpUqZWXPK3x8z95h
	4nJ/RtB4VT1PpocRWaZV8K+qg/smaGOaf8gVD9226MYM/S88UKU0TOEssG7ZOr+j6FdqKjY52M1HQ
	ftcOFUU1cBCNhT2xlmaYGyYz2vlNcxWyS6iHfbbF5Eatpq7dufJdzPfWzQdwBRGmKs+mQ+4MdYNeI
	kS2gUkQHdTN/TJFRmSzd5hqgcGWDfgsrlCaJc4srOzKmpAgVzXmJCS8AxCmBVxOHLJDmtWDc7/SOJ
	TYGFa9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGfJ-001KOW-2s;
	Thu, 23 Mar 2023 08:51:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGfG-001KNE-2s
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:51:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so586701wmq.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561473;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q0r2e+fFea9wwtstm7SkPOZ41kGt5l6iiNmJhtDerY=;
        b=eEHoSG6N4HNCRopOH3T8hlVYMMPf/Z6pfmyTzajuMAh4IILKx4lFFaBlOYXZIdjH6j
         xsHPc309xZiJiJK7SuMFFGjyq2P1wv8sgzXKB1csLA4SnCfC7vSfd48mO4wu90n2dSpV
         mD5sTT00wFtLtjSxVDgA4/p59YS98QN5KHAOeyn5QM50U2alncEXYgNPxtujWDMUVot+
         BNcyn9Im/HT5EqdYmZfeaEwajMWOLcAMBz5B9LL0Y/YB5/pJVrlubW+B/HQxN0THxnT+
         x3tmHbTSKfqCI2YBRBamrdhAojkdd0AAZEEHkbhhvcLFgThzL0LZAndSbdfaqqpRoq9V
         fH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561473;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q0r2e+fFea9wwtstm7SkPOZ41kGt5l6iiNmJhtDerY=;
        b=bWesYPuGy/Pd/G3c+t/4x7VdO7yrS7iKt9SD3UOFaNB2obHjEdpORI/RzHPxM5e27Y
         XGJM2rRIQ84qRy9aXqR6C5LBO2xAE9vmBaEvEPjIAwJ1YdTna9XBc3g1vhYdD/gzYW04
         A9G8xA4HpZBSmpDaiEtyZPdSJRKGaAotlVsvRIuD1qsazl9ALqkjr3ABA5WT3fZvg4mS
         wMH8WSsTHzzXuDUa9z7Mpyr9taPOEnkeR+w85AgSkMY9xX9XiDAezMJm68B21d0fXyiQ
         3W5xkd6Wy/beU3eP5jclWknDi6zL+oLSyOeiXsN/cnL4tlU9oROrblpVARnwUJmtk6Tg
         fxTw==
X-Gm-Message-State: AO0yUKXSRoKZbDjW+5NqOYb8pHTX8656TrSsYvDNnq/iyQqwjddxSuxD
	ePaoWDn2BK3o90wMsYr0kFWVGg==
X-Google-Smtp-Source: AK7set8HSkbmSVl28ajfDnPc7VrLV8pkA+nuVjBPpef0A7jEUguD8cttS1O8I0UQ/a3wrGYmRKxQvg==
X-Received: by 2002:a1c:7c17:0:b0:3ed:5eed:555d with SMTP id x23-20020a1c7c17000000b003ed5eed555dmr1646351wmc.10.1679561473662;
        Thu, 23 Mar 2023 01:51:13 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c3b1100b003ee5cc90fa3sm1265863wms.8.2023.03.23.01.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:51:13 -0700 (PDT)
Message-ID: <88e79b01-8f2d-e1f5-12aa-cf628e622b76@linaro.org>
Date: Thu, 23 Mar 2023 09:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/13] boards: add BananaPi M2S defconfig
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-7-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-7-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015118_925092_72D640F3 
X-CRM114-Status: GOOD (  12.12  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23/03/2023 07:54, Christian Hewitt wrote:
> Add configuration for the Bananapi BPI-M2S.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   configs/bananapi-m2s_defconfig | 82 ++++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>   create mode 100644 configs/bananapi-m2s_defconfig
> 
> diff --git a/configs/bananapi-m2s_defconfig b/configs/bananapi-m2s_defconfig
> new file mode 100644
> index 0000000000..3109e0ce48
> --- /dev/null
> +++ b/configs/bananapi-m2s_defconfig
> @@ -0,0 +1,82 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_TEXT_BASE=0x01000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-a311d-bananapi-m2s"
> +CONFIG_MESON_G12A=y
> +CONFIG_DEBUG_UART_BASE=0xff803000
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" bpi-m2s"
> +CONFIG_SYS_LOAD_ADDR=0x1000000
> +CONFIG_DEBUG_UART=y
> +CONFIG_AHCI=y
> +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
> +CONFIG_REMAKE_ELF=y
> +CONFIG_OF_BOARD_SETUP=y
> +# CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_MISC_INIT_R=y
> +CONFIG_SYS_MAXARGS=32
> +# CONFIG_CMD_BDI is not set
> +# CONFIG_CMD_IMI is not set
> +CONFIG_CMD_GPIO=y
> +# CONFIG_CMD_LOADS is not set
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_PCI=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_USB_MASS_STORAGE=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_ADC=y
> +CONFIG_SARADC_MESON=y
> +CONFIG_AHCI_PCI=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_MDIO=y
> +CONFIG_DM_MDIO_MUX=y
> +CONFIG_ETH_DESIGNWARE_MESON8B=y
> +CONFIG_MDIO_MUX_MESON_G12A=y
> +CONFIG_PCI=y
> +CONFIG_PCIE_DW_MESON=y
> +CONFIG_MESON_G12A_USB_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MESON_G12A=y
> +CONFIG_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_DM_RESET=y
> +CONFIG_DEBUG_UART_ANNOUNCE=y
> +CONFIG_DEBUG_UART_SKIP_INIT=y
> +CONFIG_MESON_SERIAL=y
> +CONFIG_USB=y
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
> +CONFIG_VIDEO=y
> +# CONFIG_VIDEO_BPP8 is not set
> +# CONFIG_VIDEO_BPP16 is not set
> +CONFIG_SYS_WHITE_ON_BLACK=y
> +CONFIG_VIDEO_MESON=y
> +CONFIG_VIDEO_DT_SIMPLEFB=y
> +CONFIG_SPLASH_SCREEN=y
> +CONFIG_SPLASH_SCREEN_ALIGN=y
> +CONFIG_VIDEO_BMP_RLE8=y
> +CONFIG_BMP_16BPP=y
> +CONFIG_BMP_24BPP=y
> +CONFIG_BMP_32BPP=y
> +CONFIG_OF_LIBFDT_OVERLAY=y

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
