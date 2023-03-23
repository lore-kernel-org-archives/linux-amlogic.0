Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DE2C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxzo533POaFHTFxkuKCcMkwF/YNKceXrHwfl96wL4DY=; b=ceoBOwmN58RXRFsuyDktJ/MXPs
	+qztKAStLI5b64MC6rHIn+vNRuWb/jLCihNi2GBp6k14ZIGmN7309Ni1aRaMG86+q9o772FT0aSSq
	YAJqzzsuHc202SduIndDmrw4qf6R1+Uelbc6rms+vLnhP0sfan26c7RA7IM6+eDz3uoVwkRsZVOvf
	I3fJlyykeJliIwoMyCn8m1RFlhKje2GLNcxYw8uXqWC0Ttoyio6zNAEO3XxWNI1pld0x6E6mHObFW
	gxPoR7LsjYXVierDnhaW/T6bpVicpbuWNNf6bv+4E7iz+wmNJYlGgWb1kOeybrY0hP01TFN7zNKgB
	FxfDnlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGfa-001KSr-0D;
	Thu, 23 Mar 2023 08:51:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGfW-001KR8-30
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:51:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so623857wmb.5
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561492;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L0I7QvM6A80rykBCgEPu2ZMacQmX66lChRyCs0/spqA=;
        b=eeLer/7qGHFgO9ckKbP6uoDrW1L/+Vnxr/GnwuP+ZgN7eElsqUrbX0GbSsQvYLmDKq
         aZUnFNxUuTa+3fbs4E2KvbL0JnU4+5zbQSAHlt4aCOi+gtqxOya8kGXK2zckaR8/Cmwc
         EFaTp80E/ao4isphLC6UQHv7x8Wz2bgJVyKeVy0SvrJJ5kNxJqzojkO2uXCQqQYaSvfg
         gewgzWZFWuxK1MZRbbbclgBG7r50dGL6Bg2tQZQ9eCidH1LRu5dwY4ezx4BRXyUt4Vci
         K3vzBVbo7Bi2f8c0YUlMHWRchq52K3wkDCVcuwa7XywYGnvQuIK5UNA4fOjRlbMMAVWw
         KyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561492;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0I7QvM6A80rykBCgEPu2ZMacQmX66lChRyCs0/spqA=;
        b=FMzEFf3a8xTwJJ9kaOEj8xP4MYOES3xeOb5EpIuahEMQRrGXB64p2CV+EKyFZj7kAA
         3H/iClNDSm9K7ATo+Dd9Xqsyr2/zfwSo+YgfOAEBQz85+OvdtlB+P142KckiTs44SxE2
         +Z2pzXmEfNF+DB7JEz8Lbf8RlBjK1vc2ZGkrA/53OC47io8e4Ai8Ly+uHAPAJyb00jjC
         Gh628cL/hyRNDKzpJDKO3NKVDrrUA0Y9eXqI5a2IODWL0EnYfKFSLTTkW8vEcEM5qp5O
         PxxhLWd2XeRio3VWpZD4E7FaG8TpPX+T17zfcvMKdW60KJLIrMzflpLsptBtydq25M6s
         vMVw==
X-Gm-Message-State: AO0yUKUfnTBBhlnmM4jjsD22GQU72g8eSI0af7H2wzdH66BxFs6G6iuu
	pKqoiSMkdgyauzmMEi+ProlyRt6EjHWD29mfYgBQkw==
X-Google-Smtp-Source: AK7set8NXPbD8ONcQocxEo/pYfOe7bUoYdx5Qe7Vw5tyZc5ZIDyg3L8MabBQHAEDnNz433hpRnX8Og==
X-Received: by 2002:a05:600c:3148:b0:3ed:1f98:670f with SMTP id h8-20020a05600c314800b003ed1f98670fmr1489125wmo.20.1679561491850;
        Thu, 23 Mar 2023 01:51:31 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003ed2987690dsm1220776wmj.26.2023.03.23.01.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:51:31 -0700 (PDT)
Message-ID: <6e069d1f-9382-a708-9c47-ab7563a20a19@linaro.org>
Date: Thu, 23 Mar 2023 09:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/13] boards: amlogic: add Radxa Zero2 defconfig
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-10-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-10-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015134_971367_569F44D4 
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
> Add board configuration for the Radxa Zero2.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   configs/radxa-zero2_defconfig | 77 +++++++++++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 configs/radxa-zero2_defconfig
> 
> diff --git a/configs/radxa-zero2_defconfig b/configs/radxa-zero2_defconfig
> new file mode 100644
> index 0000000000..2218b0db7d
> --- /dev/null
> +++ b/configs/radxa-zero2_defconfig
> @@ -0,0 +1,77 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_TEXT_BASE=0x01000000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DM_GPIO=y
> +CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-radxa-zero2"
> +CONFIG_MESON_G12A=y
> +CONFIG_DEBUG_UART_BASE=0xff803000
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" radxa-zero2"
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
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_MTD=y
> +CONFIG_DM_MTD=y
> +# CONFIG_PHY_REALTEK is not set
> +CONFIG_DM_MDIO=y
> +CONFIG_DM_MDIO_MUX=y
> +# CONFIG_ETH_DESIGNWARE_MESON8B is not set
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
