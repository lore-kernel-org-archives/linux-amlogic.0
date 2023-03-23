Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18ACC74A5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgmnTsYvYswsb3bkRCFckUyRTBStzDpMcS7Pfucbk+w=; b=4cY6sdW+liciWfLCTrWZWWZtl8
	aaYARKd6Fok3s/g1meMqyQa4iXapgr6A0CqrZmU6RLZ7Z7txDQP67sbB5zXRP60zx8Ee0LGba/j0i
	2/0qAeshWi7TXX4txMZKnHS3aouOonyqf9KMGpj06OCSORtrxYAg/IrTTZyOYjrkYX0VPzsk9yeJd
	v5V3p0OOIm3prz0c+27VyFn0pj0rU9HZeeYrRbvF4h+O+P+e0GD7RiTXBCVCiQiT0Z/d/xFbImNON
	fvuLJ/uWdbhJEDGLo+IRZwOpBBNPRi08YLaSYyAPomg1ayjXj1VzZYlqviGaH9BViqfKP2CSmRP1u
	7F1Ol6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGek-001KFs-0o;
	Thu, 23 Mar 2023 08:50:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGeh-001KDx-2M
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:50:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id s13so694163wmr.4
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561439;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lcUcj/Qnxaayk6nRS9LP740lBkBNHZkS3q6ybfWHtbA=;
        b=gPYaWjv4k3NDQLzb139R9WV6HFE+oOUQLSoDfR0cNlSY9DcUgPwL7eYqfD/L2vUKUy
         SsVuQJQLtMWRy8IHykLwX83HTcatnLXA1xaiV+xDN/xwCWs3APYz5A3XQZxdCfgSK2rP
         QdbootX9BlxKNrEcB59ZlbZpQZgXQDScNLippXyUY8X3vKKX6z0sKpo22ILMAPZXDEUB
         MEmE2dxzAlLsrWvIi3Ne1Fi9sxK2yxbIvAdjG4g8vzGmEHEJ/WZ6Z83luuc++ykyuzlS
         TvfGMDxl/cuQDiSI418Qp/8TX+uGSEQDp1C71uTDl/OuisZVBMuYSfzQSeqp/jy8DFwK
         kl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561439;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcUcj/Qnxaayk6nRS9LP740lBkBNHZkS3q6ybfWHtbA=;
        b=SSKSxEm1pDZQuE38BQESkc9UqeepMpSj8Gu93Z3kTfxChCetcjSizGqQRzc8HcUBC+
         J0wspu7vUfGBnVIOxyVGWdhRDZkgZSvkyNNrK30sEFUcJJyyJ7QWWOYHf2hEggPdL6MR
         4h6fJ20qZlhl+dwyxS1sedl/ddP0dfsdGGb+61nLVOkJELV5jv7pm6NOw5uTkm52doqS
         VP+ZZb+ZZK3J5HH7h0bpq7Yn50t5e6JBe1UOJZBq6sqLxTwkSSh9FANjTsVjC5GS7o4l
         T18jet0R6VBeiEFib9a8OcUfSLaiLNOF6mykGShDsgmnnzGkOhJUTmD2WfLXrC34VkVh
         qwaQ==
X-Gm-Message-State: AO0yUKX25aO++bBQhOJKAz5ReN8P5cf293gWRAq4LMH3MkSY7McLGc2z
	vLXDzJcgxCNxA3gZNbL27UqTZw==
X-Google-Smtp-Source: AK7set9nPbh0cqPtoTUVsMSTSiMgM5t2LDNUoCEZqsRtw3L4cQrb598zR1Ar1XRxbS8wiDi94Rqf0g==
X-Received: by 2002:a7b:c4c3:0:b0:3ee:7022:5eda with SMTP id g3-20020a7bc4c3000000b003ee70225edamr1729245wmk.7.1679561439607;
        Thu, 23 Mar 2023 01:50:39 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c00d100b003ee2bed222asm1218481wmm.32.2023.03.23.01.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:50:39 -0700 (PDT)
Message-ID: <fbb47878-dd7c-bbc4-ef09-16aab3471538@linaro.org>
Date: Thu, 23 Mar 2023 09:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/13] boards: add BananaPi M2-Pro defconfig
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-4-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015043_775546_0EDEBD76 
X-CRM114-Status: GOOD (  11.80  )
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
> Add configuration for the BananaPi M2-Pro board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   configs/bananapi-m2-pro_defconfig | 76 +++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>   create mode 100644 configs/bananapi-m2-pro_defconfig
> 
> diff --git a/configs/bananapi-m2-pro_defconfig b/configs/bananapi-m2-pro_defconfig
> new file mode 100644
> index 0000000000..28b603fe20
> --- /dev/null
> +++ b/configs/bananapi-m2-pro_defconfig
> @@ -0,0 +1,76 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_TEXT_BASE=0x01000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_DEFAULT_DEVICE_TREE="meson-sm1-bananapi-m2-pro"
> +CONFIG_MESON_G12A=y
> +CONFIG_DEBUG_UART_BASE=0xff803000
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING="bpi-m2-pro"
> +CONFIG_SYS_LOAD_ADDR=0x1000000
> +CONFIG_DEBUG_UART=y
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
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_USB_MASS_STORAGE=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_ADC=y
> +CONFIG_SARADC_MESON=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_MDIO=y
> +CONFIG_DM_MDIO_MUX=y
> +CONFIG_ETH_DESIGNWARE_MESON8B=y
> +CONFIG_MDIO_MUX_MESON_G12A=y
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
