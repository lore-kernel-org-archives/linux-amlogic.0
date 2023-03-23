Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79DDC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtsJ4g9HmSZPAwrN+akNzanZPomUyFpQv9KCflJyCTQ=; b=2GpOaRzKnUYiUrsLzqPPPyV/n8
	w4pHpfBgtHcdVCVntAWkHZ/V7BUPdSNWrY+ufHbvz11CKUMUsG9Oi43XUQP8ZQrXz2rivsm7fujXX
	FZjmK6FhTWJVlzl4qH9b0P5WlJ0eD1f7z0QykR51ZO1pUPc7zC5FE0z08qVebjr6lotZP/x2j13aB
	NmT4VEcLM1FYwPTnK1wJgOp0DpZsNUtMrUIX/UeEPO+mc9CBT5gV1ditqCBBaTvkkplIePCuvl9CW
	Fz5Nk70LRm5juyfgaSLzCjzSolGrZaXNpj6A8VxWcKVwv8TVnjN6HgF0HXiNJYxWiWMXKsNVesXMW
	kO/BG6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMSI-002IAz-19;
	Thu, 23 Mar 2023 15:02:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMSC-002I86-1j
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:02:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so1300814wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583731;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C4A6Nr9KkQBOWVUJyqV9UJbQdXq4Pz/FbNPkIJmT0Ao=;
        b=cmwHalRhBME2w5J4WJJOfz0pcRO/0miKACZlZtbILeKOTr3z931anTCW5q2K13KfJL
         HqdlyXaDZ8G32Z07IHiyNdXRVMSAxqObZRQQuqv7H4J9YYxcP/GMX9BalmJt0q9qsMfd
         GkdLuvEuBD3TXXgFSACBJzhW4AdwcZ61lQHyad/6K48tZQn8+OOjh42BAwdSvtduf3pu
         VJbM/7G6/57+tqVGjmZ9GOZ2guTtjA08rMhvSQs09D6ttOUMBoK1Ie/DmIhrx9B0AAT+
         9leY28dTIUDtGlnOSSNXyGXvE1qnmmvSt8H0tqJ3Ae4T11F4iSH6rSUstj5zHzvKSTOZ
         7Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583731;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4A6Nr9KkQBOWVUJyqV9UJbQdXq4Pz/FbNPkIJmT0Ao=;
        b=GwaoBHke7//yPr8a2m9x0dyjHftK89wj14ye3S4G0uiwwGR71JEpzd/1XIO3Xuwzhn
         KR3MjcS2G5LYPKYi0RJrg7C2BEhc6QB6yy0zirlcSIM9rz1u/fkFMbbkmR0u+GrmzEjN
         YJTROCvoW5Q3e2UK479ZBRBZ8SmaiQDo3UCLaNd2Cxzh0gdyGexl+aXgWwoD5UinlQ9f
         bEjQ+j06XNNJm3lMCkyWhnvXFkt0CQPpdZUNS7lriD4yB2OFkqvnUSHSPQQIpCU4jgjN
         v/gPLfgd2UGJdKXyJNFbH0IdoWeYfyVxPusRjugsO4VDAA6Nz0F1gKbL6xCgWOgslnDW
         eZaw==
X-Gm-Message-State: AO0yUKVJT3yehmnFM5WfB+h3WSqC3DEL1ClikhJ9CserbKXJAv1ZPAsm
	iVKXJLaiDRWKZ+ap0CtmM3ZX6wXjGoHPMjbDi1NrWw==
X-Google-Smtp-Source: AK7set/9r5j2Z0TiqMwu/Xvy0fpWDG8+4wa/0Z/HmsR5GUtughAGFl0MIRNM49o/VVdUUmNXUXgPcA==
X-Received: by 2002:a05:600c:218d:b0:3eb:a4e:a2b2 with SMTP id e13-20020a05600c218d00b003eb0a4ea2b2mr2560609wme.4.1679583730309;
        Thu, 23 Mar 2023 08:02:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id fm15-20020a05600c0c0f00b003ede3f5c81fsm2082387wmb.41.2023.03.23.08.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:02:09 -0700 (PDT)
Message-ID: <6ef3b7a4-c740-77f8-dfe5-77906a172cc2@linaro.org>
Date: Thu, 23 Mar 2023 16:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/14] boards: amlogic: add WeTek Hub and WeTek Play2
 defconfig
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323143142.780306-1-christianshewitt@gmail.com>
 <20230323143142.780306-14-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323143142.780306-14-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080212_575251_DF972DDA 
X-CRM114-Status: GOOD (  12.87  )
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

On 23/03/2023 15:31, Christian Hewitt wrote:
> Add configurations for the WeTek Hub and WeTek Play2 boards.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/p200/MAINTAINERS |  2 +
>   configs/wetek-hub_defconfig    | 70 ++++++++++++++++++++++++++++++++++
>   configs/wetek-play2_defconfig  | 70 ++++++++++++++++++++++++++++++++++
>   3 files changed, 142 insertions(+)
>   create mode 100644 configs/wetek-hub_defconfig
>   create mode 100644 configs/wetek-play2_defconfig
> 
> diff --git a/board/amlogic/p200/MAINTAINERS b/board/amlogic/p200/MAINTAINERS
> index 33ca3df5c6..264218e3be 100644
> --- a/board/amlogic/p200/MAINTAINERS
> +++ b/board/amlogic/p200/MAINTAINERS
> @@ -7,6 +7,8 @@ F:	board/amlogic/p200/
>   F:	configs/nanopi-k2_defconfig
>   F:	configs/odroid-c2_defconfig
>   F:	configs/p200_defconfig
> +F:	configs/wetek-hub_defconfig
> +F:	configs/wetek-play2_defconfig
>   F:	doc/board/amlogic/p200.rst
>   F:	doc/board/amlogic/nanopi-k2.rst
>   F:	doc/board/amlogic/odroid-c2.rst
> diff --git a/configs/wetek-hub_defconfig b/configs/wetek-hub_defconfig
> new file mode 100644
> index 0000000000..634833f7fe
> --- /dev/null
> +++ b/configs/wetek-hub_defconfig
> @@ -0,0 +1,70 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_TEXT_BASE=0x01000000
> +CONFIG_SYS_LOAD_ADDR=0x1000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_DEBUG_UART_BASE=0xc81004c0
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" wetek-hub"
> +CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-wetek-hub"
> +CONFIG_DEBUG_UART=y
> +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
> +CONFIG_OF_BOARD_SETUP=y
> +# CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_MISC_INIT_R=y
> +# CONFIG_CMD_BDI is not set
> +# CONFIG_CMD_IMI is not set
> +CONFIG_CMD_ADC=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +# CONFIG_CMD_LOADS is not set
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_USB=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_SARADC_MESON=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_MESON=y
> +CONFIG_DM_MMC=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_ETH=y
> +CONFIG_ETH_DESIGNWARE_MESON8B=y
> +CONFIG_PHY=y
> +CONFIG_MESON_GXBB_USB_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MESON_GXBB=y
> +CONFIG_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_DM_RESET=y
> +CONFIG_DEBUG_UART_ANNOUNCE=y
> +CONFIG_DEBUG_UART_SKIP_INIT=y
> +CONFIG_MESON_SERIAL=y
> +CONFIG_SYSINFO=y
> +CONFIG_SYSINFO_SMBIOS=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_USB_DWC2=y
> +CONFIG_USB_KEYBOARD=y
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
> diff --git a/configs/wetek-play2_defconfig b/configs/wetek-play2_defconfig
> new file mode 100644
> index 0000000000..6d33b09a94
> --- /dev/null
> +++ b/configs/wetek-play2_defconfig
> @@ -0,0 +1,70 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_TEXT_BASE=0x01000000
> +CONFIG_SYS_LOAD_ADDR=0x1000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_DEBUG_UART_BASE=0xc81004c0
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" wetek-play2"
> +CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-wetek-play2"
> +CONFIG_DEBUG_UART=y
> +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x20000000
> +CONFIG_OF_BOARD_SETUP=y
> +# CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_MISC_INIT_R=y
> +# CONFIG_CMD_BDI is not set
> +# CONFIG_CMD_IMI is not set
> +CONFIG_CMD_ADC=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +# CONFIG_CMD_LOADS is not set
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_USB=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_SARADC_MESON=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_MESON=y
> +CONFIG_DM_MMC=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_ETH=y
> +CONFIG_ETH_DESIGNWARE_MESON8B=y
> +CONFIG_PHY=y
> +CONFIG_MESON_GXBB_USB_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MESON_GXBB=y
> +CONFIG_POWER_DOMAIN=y
> +CONFIG_MESON_EE_POWER_DOMAIN=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_DM_RESET=y
> +CONFIG_DEBUG_UART_ANNOUNCE=y
> +CONFIG_DEBUG_UART_SKIP_INIT=y
> +CONFIG_MESON_SERIAL=y
> +CONFIG_SYSINFO=y
> +CONFIG_SYSINFO_SMBIOS=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_USB_DWC2=y
> +CONFIG_USB_KEYBOARD=y
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
