Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C583C76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e33Uu5hxUmyEstcn1bMQt3sBMx5dfwG7nRWy2Ku4TCY=; b=Ho29e7kbdEEN/5AdD9YP+qlNJd
	lzA7+0lS2KT8vLmUJ5mmEN1LsH1cDT42h968I+V0atSmD00ZtqcTjtWqB9jc61DsOUURrveq8euox
	clJkdoiDM/bnSwzaMslBI3zrBilfvi6rJ65zMSk8AmYqzDgMbmz5E+e+H6s/B10XPy/eX+ipynyJO
	eKoxR4x5z9a6Xekx2i6aZUuUeoDaqqVGgGqkfk3bX54Aqr4ksDSGAmvBaR4s5+DpXqFjXaQOlwT3D
	EXl1XIIDjE14ziIAPF0cEYPoQTvX/zq9uMy1R8z+cTcFNvnzI4Ry+do6qzK8DAcPlUqPBjaWQlApF
	tOiqvWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRh-002HrE-2L;
	Thu, 23 Mar 2023 15:01:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRa-002HmH-2G
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id i9so20846918wrp.3
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583693;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VAKbXSHHB1LlrufQKB12VQknREQUqL04W6kkZXm4SAs=;
        b=hrAwTzfTP4vNOyDiN5sqXdm0u+M37WfZwOx441yAjQxrVH6oHCNcN/26PMH2o95Ir4
         4IX50VSaTi8cDhjeBXk3AmJhiOwOmZXbxSa4RqnqKmRVcjsk7i47FWpBDpfV4sPvO1to
         cBGuhUURAg6wQJKtzACs22JE2w7JCVeWF/UcAxLf969nl7AnJO6vz0/nqrePh3Nnctuo
         xD/CR27o9vy3X1c72kxvYoB/yd8uy0x0PbOry9Ouoyjj/w9M8wu0F+EXsCQcw0LlKSAm
         bq2jl+IE6W2xyhmcJxPKb3scdcs8+3XJLUA9uC0vlR0ddWGtUlMDa2wLvwJsIBjUnZPr
         1tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583693;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAKbXSHHB1LlrufQKB12VQknREQUqL04W6kkZXm4SAs=;
        b=iLoPr0VcHUmFGfCZqnqknLYhnCgxmu2wdTjsSc1T/Za5nhuRW5tPittS3xODSSIEaG
         4uqjz14/DvPh+GKyy2wL02OJes+JA3kJupXCWRf5sPvcL8BWbPNHOEXLZBuTgd5GI8Wl
         7Vba0lR1WY78JL3G3bGnr5Rqs/SuaIF4d7EcUYRJSwiJ1BT8cBuX3nCxEOwHoq/wTCfC
         KEegWVTQX4GZNy3u7RyHQ36euMq9wwbTVAVuCcaRO7oRulWC6S9oNVlWcHG2L62VWjJj
         vA2lH0R/HSIBckulrh+1LRK4UfwXTplb6EENIkeQIC9EXpHlhdDgcnbPo07lV6xI4+/o
         Xl6w==
X-Gm-Message-State: AAQBX9fyN59hdzJDYINTq3TXC5yrgNZMeQqzcdxLzgWvBFF9oc8isZZm
	pNSARAZDLXm7jpdGdBTFgmV44w==
X-Google-Smtp-Source: AKy350ZXzBAgYQtRBDdJIPNoCnPnFF+xIf2/rHQHz4fMIIvG/DuDKkHOt1RhrTobMDbIbd9XfyPRbA==
X-Received: by 2002:a5d:4e85:0:b0:2d4:99f:66fa with SMTP id e5-20020a5d4e85000000b002d4099f66famr2982505wru.14.1679583692597;
        Thu, 23 Mar 2023 08:01:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b002d431f61b18sm14573425wrs.103.2023.03.23.08.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:01:32 -0700 (PDT)
Message-ID: <f8555a7c-8dfb-d803-e422-2534a4df2c8e@linaro.org>
Date: Thu, 23 Mar 2023 16:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 08/14] docs: boards: amlogic: add documentation for
 BananaPi M2S
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323143142.780306-1-christianshewitt@gmail.com>
 <20230323143142.780306-9-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323143142.780306-9-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080134_769973_09E8E4D3 
X-CRM114-Status: GOOD (  19.03  )
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
> Add build docs for the BPI-M2S board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/w400/MAINTAINERS     |   2 +
>   doc/board/amlogic/bananapi-m2s.rst | 153 +++++++++++++++++++++++++++++
>   doc/board/amlogic/index.rst        |   1 +
>   3 files changed, 156 insertions(+)
>   create mode 100644 doc/board/amlogic/bananapi-m2s.rst
> 
> diff --git a/board/amlogic/w400/MAINTAINERS b/board/amlogic/w400/MAINTAINERS
> index 26a4c2c587..042b523056 100644
> --- a/board/amlogic/w400/MAINTAINERS
> +++ b/board/amlogic/w400/MAINTAINERS
> @@ -4,5 +4,7 @@ S:	Maintained
>   L:	u-boot-amlogic@groups.io
>   F:	board/amlogic/w400/
>   F:	configs/bananapi-cm4-cm4io_defconfig
> +F:	configs/bananapi-m2s_defconfig
>   F:	doc/board/amlogic/w400.rst
>   F:	doc/board/amlogic/bananapi-cm4io.rst
> +F:	doc/board/amlogic/bananapi-m2s.rst
> diff --git a/doc/board/amlogic/bananapi-m2s.rst b/doc/board/amlogic/bananapi-m2s.rst
> new file mode 100644
> index 0000000000..4a1be47b35
> --- /dev/null
> +++ b/doc/board/amlogic/bananapi-m2s.rst
> @@ -0,0 +1,153 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for BananaPi M2S (A311D & S922X)
> +=======================================
> +
> +BananaPi BPI-M2S ships is a Single Board Computer manufactured by Sinovoip that ships in
> +two variants with Amlogic S922X or A311D SoC and the following common specification:
> +
> +- 16GB eMMC
> +- HDMI 2.1a video
> +- 2x 10/100/1000 Base-T Ethernet (1x RTL8211F, 1x RTL811H)
> +- 2x USB 2.0 ports
> +- 2x Status LED's (green/blue)
> +- 1x Power/Reset button
> +- 1x micro SD card slot
> +- 40-pin GPIO header
> +- PWM fan header
> +- UART header
> +
> +The S992X variant has:
> +- 2GB LPDDR4 RAM
> +
> +The A311D variant has:
> +
> +- 4GB LPDDR4 RAM
> +- NPU (5.0 TOPS)
> +- MIPI DSI header
> +- MIPI CSI header
> +
> +An optional RTL8822CS SDIO WiFi/BT mezzanine is available for both board variants.
> +
> +Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-M2S
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make bananapi-m2s_defconfig
> +    $ make
> +
> +U-Boot Signing with Pre-Built FIP repo
> +--------------------------------------
> +
> +.. code-block:: bash
> +
> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip
> +    $ mkdir my-output-dir
> +    $ ./build-fip.sh bananapi-m2s /path/to/u-boot/u-boot.bin my-output-dir
> +
> +U-Boot Manual Signing
> +---------------------
> +
> +Amlogic does not provide sources for the firmware and tools needed to create a bootloader
> +image so it is necessary to obtain binaries from sources published by the board vendor:
> +
> +.. code-block:: bash
> +
> +    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
> +    $ wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
> +    $ tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
> +    $ tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
> +    $ export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
> +
> +    $ DIR=bananapi-m2s
> +    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b khadas-g12b-v2015.01-m2s $DIR
> +
> +    $ cd $DIR
> +    $ make bananapi_m2s_defconfig
> +    $ make
> +    $ export UBDIR=$PWD
> +
> +Go back to the mainline U-Boot source tree then:
> +
> +.. code-block:: bash
> +
> +    $ mkdir fip
> +
> +    $ wget https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc/blx_fix_g12a.sh -O fip/blx_fix.sh
> +    $ cp $UBDIR/build/scp_task/bl301.bin fip/
> +    $ cp $UBDIR/build/board/bananapi/bananpi_m2s/firmware/acs.bin fip/
> +    $ cp $UBDIR/fip/g12a/bl2.bin fip/
> +    $ cp $UBDIR/fip/g12a/bl30.bin fip/
> +    $ cp $UBDIR/fip/g12a/bl31.img fip/
> +    $ cp $UBDIR/fip/g12a/ddr3_1d.fw fip/
> +    $ cp $UBDIR/fip/g12a/ddr4_1d.fw fip/
> +    $ cp $UBDIR/fip/g12a/ddr4_2d.fw fip/
> +    $ cp $UBDIR/fip/g12a/diag_lpddr4.fw fip/
> +    $ cp $UBDIR/fip/g12a/lpddr3_1d.fw fip/
> +    $ cp $UBDIR/fip/g12a/lpddr4_1d.fw fip/
> +    $ cp $UBDIR/fip/g12a/lpddr4_2d.fw fip/
> +    $ cp $UBDIR/fip/g12a/piei.fw fip/
> +    $ cp $UBDIR/fip/g12a/aml_ddr.fw fip/
> +    $ cp u-boot.bin fip/bl33.bin
> +
> +    $ sh fip/blx_fix.sh \
> +         fip/bl30.bin \
> +         fip/zero_tmp \
> +         fip/bl30_zero.bin \
> +         fip/bl301.bin \
> +         fip/bl301_zero.bin \
> +         fip/bl30_new.bin \
> +         bl30
> +
> +    $ sh fip/blx_fix.sh \
> +         fip/bl2.bin \
> +         fip/zero_tmp \
> +         fip/bl2_zero.bin \
> +         fip/acs.bin \
> +         fip/bl21_zero.bin \
> +         fip/bl2_new.bin \
> +         bl2
> +
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl30sig --input fip/bl30_new.bin \
> +                                       --output fip/bl30_new.bin.g12a.enc \
> +                                       --level v3
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl30_new.bin.g12a.enc \
> +                                       --output fip/bl30_new.bin.enc \
> +                                       --level v3 --type bl30
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl31.img \
> +                                       --output fip/bl31.img.enc \
> +                                       --level v3 --type bl31
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl3sig --input fip/bl33.bin --compress lz4 \
> +                                       --output fip/bl33.bin.enc \
> +                                       --level v3 --type bl33 --compress lz4
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bl2sig --input fip/bl2_new.bin \
> +                                       --output fip/bl2.n.bin.sig
> +    $ $UBDIR/fip/g12b/aml_encrypt_g12b --bootmk \
> +                                       --output fip/u-boot.bin \
> +                                       --bl2 fip/bl2.n.bin.sig \
> +                                       --bl30 fip/bl30_new.bin.enc \
> +                                       --bl31 fip/bl31.img.enc \
> +                                       --bl33 fip/bl33.bin.enc \
> +                                       --ddrfw1 fip/ddr4_1d.fw \
> +                                       --ddrfw2 fip/ddr4_2d.fw \
> +                                       --ddrfw3 fip/ddr3_1d.fw \
> +                                       --ddrfw4 fip/piei.fw \
> +                                       --ddrfw5 fip/lpddr4_1d.fw \
> +                                       --ddrfw6 fip/lpddr4_2d.fw \
> +                                       --ddrfw7 fip/diag_lpddr4.fw \
> +                                       --ddrfw8 fip/aml_ddr.fw \
> +                                       --ddrfw9 fip/lpddr3_1d.fw \
> +                                       --level v3
> +
> +Then write the image to SD or eMMC with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
> diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
> index 8388acdd11..fa1b362731 100644
> --- a/doc/board/amlogic/index.rst
> +++ b/doc/board/amlogic/index.rst
> @@ -87,6 +87,7 @@ Board Documentation
>   
>      bananapi-cm4io
>      bananapi-m2pro
> +   bananapi-m2s
>      bananapi-m5
>      beelink-gskingx
>      beelink-gtking

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
