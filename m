Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDCBC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVNNV8sgMNqFHL482nzc1fCr32QVp3STaySIpzvKdRk=; b=S50Y5TZ8CNrn3E69NxZ5YgvOco
	hZ2z2S3G1lgkLM63yn1KYggxW74LWd4yIzl9EwRJPRzW8iMyi3iJfZa6/MBDyHCm8gc81aBBX3FAY
	/AJnNI9RQ/pqsxqfOotGNkkalTqqcSN+1WPF9KnHBhyYbREl2azcTX80/pqWs2E+qKwaYSFmVi7qm
	Dbg8ihkz6SMGXQobnViOgdCu3Q2FnLLsa1hLSreMOAJnW8007jf68vDlocp+TkchzQmtwepLuPy/5
	ZOOrDxHiq0+/oj2fVXgffQaO1Zcr5WwWktEQyFnCnf2R03p61+vwq3CwhO4i/k92Sa8rSQH62BAFP
	BDfD8LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGe9-001K77-0Z;
	Thu, 23 Mar 2023 08:50:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGe6-001K6K-2O
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:50:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so585041wmq.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561402;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jLNoDw6pma3I8nwXuPPLrjvN+IRgSB5RYrZ+ink7bXQ=;
        b=DXysjfFet7Qy5sKeGEMuDSyoqiXxWBNwlH5gzHSWIJoplQektLT40+fMrkktkfxC5x
         N/86hMQRC4ti7oLt9lzxmEDw1KoVQyo0eCvKSsY2zK2IHbpQpP5ZzpSBzFf+7TF+0Wcs
         Bpu15rCx/3rYAKgzzhJ26rXhhhABLvisHgXjJ2g34weG8/OVlF32iU9qqc+MwKO232xT
         BU/bEG53fjaAX59zhJvlWwVC6i7g4pDNmFWCWO9AJlsrIQyYOudjgXfkbEKT3Rplhtki
         hbrYv2ihTcJ49wdUZ6rUnd3RNMWTW26puTRKMW22VL9/W/jlb7SNKQvYfzAdNIuGlU0D
         0oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561402;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLNoDw6pma3I8nwXuPPLrjvN+IRgSB5RYrZ+ink7bXQ=;
        b=v6Bod2ZBMy86MoESkVNQIJSzIkHIRmcSlokIY429P+QrMK6nDLU38FUmeVwkagF3ET
         vWEV7WkghRPdkiW1uodYPyUfZHY5gEEAgtw8QIk9P9PebVSb403uT0ho82CBkfLXOR29
         rDM9Slck//Q7mbFdO7bUy6QUdJkWGl49wnN4x0+iRLQPerCNH3FYriBGarluBa8Uq4wN
         WEEGcghKRZEhJmNO1OTo2qKJsZL6Q7VM9gLY+KGJKKCOI6kt5iKlPUIW4PHmByd+1Hyj
         n6SxjLSLOe1I8z0HKlp5JJt8EiDw0G3BWmL1W+i7mthHUkzt4foVwar12GBhJeifgayI
         EFmA==
X-Gm-Message-State: AO0yUKXksV4QgT6jZZmScRJZaNJI0k2yEBP5pTpoPSoIWCfkTNymHOdj
	A3t9BzTbNTAkpgXGyN5xlaUeRp5J90/G0hzn2HaQrA==
X-Google-Smtp-Source: AK7set9X0UsiKLRFTb29FmjiR8/B03hfU/r0r8ZhGL7nX+nxWPhMWcnf8JXWUWycX3mCAMBzKzWQ9g==
X-Received: by 2002:a05:600c:22d4:b0:3ed:90b2:60c6 with SMTP id 20-20020a05600c22d400b003ed90b260c6mr1636242wmg.19.1679561402487;
        Thu, 23 Mar 2023 01:50:02 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id p26-20020a7bcdfa000000b003ee443bf0c7sm1220320wmj.16.2023.03.23.01.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:50:02 -0700 (PDT)
Message-ID: <27cd7e3b-24ba-9174-0154-c61257178a8a@linaro.org>
Date: Thu, 23 Mar 2023 09:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/13] docs: boards: amlogic: add documentation for
 BananaPi M2-Pro
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-5-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-5-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015006_795713_E44E0D51 
X-CRM114-Status: GOOD (  18.32  )
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
> Add build docs for the BPI-M2-PRO board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/u200/MAINTAINERS       |   2 +
>   doc/board/amlogic/bananapi-m2pro.rst | 142 +++++++++++++++++++++++++++
>   doc/board/amlogic/index.rst          |   1 +
>   3 files changed, 145 insertions(+)
>   create mode 100644 doc/board/amlogic/bananapi-m2pro.rst
> 
> diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
> index 919e349922..f429c212ba 100644
> --- a/board/amlogic/u200/MAINTAINERS
> +++ b/board/amlogic/u200/MAINTAINERS
> @@ -4,8 +4,10 @@ S:	Maintained
>   L:	u-boot-amlogic@groups.io
>   F:	board/amlogic/u200/
>   F:	configs/u200_defconfig
> +F:	configs/bananapi-m2pro_defconfig
>   F:	configs/bananapi-m5_defconfig
>   F:	configs/radxa-zero_defconfig
>   F:	doc/board/amlogic/u200.rst
> +F:	doc/board/amlogic/bananapi-m2pro.rst
>   F:	doc/board/amlogic/bananapi-m5.rst
>   F:	doc/board/amlogic/radxa-zero.rst
> diff --git a/doc/board/amlogic/bananapi-m2pro.rst b/doc/board/amlogic/bananapi-m2pro.rst
> new file mode 100644
> index 0000000000..6c2974f323
> --- /dev/null
> +++ b/doc/board/amlogic/bananapi-m2pro.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for BananaPi BPI-M2-PRO (S905X3)
> +=======================================
> +
> +BananaPi BPI-M2-PRO is a Single Board Computer manufactured by Sinovoip with the
> +following specification:
> +
> + - Amlogic S905X3 Arm Cortex-A55 quad-core SoC
> + - 2GB DDR4 SDRAM
> + - 16GB eMMC
> + - Gigabit Ethernet
> + - RTL8821CU USB WiFi (a/b/g/n/ac) + BT 5.0
> + - HDMI 2.1 display
> + - 40-pin GPIO header
> + - 2x USB 3.0 Host
> + - 1x DC Jack (power)
> + - microSD
> + - UART serial
> + - Infrared receiver
> +
> +Schematics are available from the manufacturer: https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Pro
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make bananapi-m2pro_defconfig
> +    $ make
> +
> +U-Boot Signing with Pre-Built FIP repo
> +--------------------------------------
> +
> +.. code-block:: bash

Please add a newline here otherwise the doc fails to build, here and the other doc patches.

Thanks,

Neil

> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip
> +    $ mkdir my-output-dir
> +    $ ./build-fip.sh bananapi-m2pro /path/to/u-boot/u-boot.bin my-output-dir
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
> +    $ DIR=bananapi-m2pro
> +    $ git clone --depth 1 https://github.com/Dangku/amlogic-u-boot.git -b odroidg12-v2015.01-c4-m5 $DIR
> +
> +    $ cd $DIR
> +    $ make bananapi_m2pro_defconfig
> +    $ make
> +    $ export UBOOTDIR=$PWD
> +
> +Go back to the mainline U-Boot source tree then:
> +
> +.. code-block:: bash
> +
> +    $ mkdir fip
> +
> +    $ wget https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc/blx_fix_g12a.sh -O fip/blx_fix.sh
> +    $ cp $UBOOTDIR/build/scp_task/bl301.bin fip/
> +    $ cp $UBOOTDIR/build/board/bananapi/bananpi_m5/firmware/acs.bin fip/
> +    $ cp $UBOOTDIR/fip/g12a/bl2.bin fip/
> +    $ cp $UBOOTDIR/fip/g12a/bl30.bin fip/
> +    $ cp $UBOOTDIR/fip/g12a/bl31.img fip/
> +    $ cp $UBOOTDIR/fip/g12a/ddr3_1d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/ddr4_1d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/ddr4_2d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/diag_lpddr4.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/lpddr3_1d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/lpddr4_1d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/lpddr4_2d.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/piei.fw fip/
> +    $ cp $UBOOTDIR/fip/g12a/aml_ddr.fw fip/
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
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl30sig --input fip/bl30_new.bin \
> +                                          --output fip/bl30_new.bin.g12a.enc \
> +                                          --level v3
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl30_new.bin.g12a.enc \
> +                                          --output fip/bl30_new.bin.enc \
> +                                          --level v3 --type bl30
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl31.img \
> +                                          --output fip/bl31.img.enc \
> +                                          --level v3 --type bl31
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl33.bin --compress lz4 \
> +                                          --output fip/bl33.bin.enc \
> +                                          --level v3 --type bl33 --compress lz4
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl2sig --input fip/bl2_new.bin \
> +                                          --output fip/bl2.n.bin.sig
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bootmk \
> +                                          --output fip/u-boot.bin \
> +                                          --bl2 fip/bl2.n.bin.sig \
> +                                          --bl30 fip/bl30_new.bin.enc \
> +                                          --bl31 fip/bl31.img.enc \
> +                                          --bl33 fip/bl33.bin.enc \
> +                                          --ddrfw1 fip/ddr4_1d.fw \
> +                                          --ddrfw2 fip/ddr4_2d.fw \
> +                                          --ddrfw3 fip/ddr3_1d.fw \
> +                                          --ddrfw4 fip/piei.fw \
> +                                          --ddrfw5 fip/lpddr4_1d.fw \
> +                                          --ddrfw6 fip/lpddr4_2d.fw \
> +                                          --ddrfw7 fip/diag_lpddr4.fw \
> +                                          --ddrfw8 fip/aml_ddr.fw \
> +                                          --ddrfw9 fip/lpddr3_1d.fw \
> +                                          --level v3
> +
> +Then write the image to SD or eMMC with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440
> diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
> index 9b76bca427..8388acdd11 100644
> --- a/doc/board/amlogic/index.rst
> +++ b/doc/board/amlogic/index.rst
> @@ -86,6 +86,7 @@ Board Documentation
>      :maxdepth: 1
>   
>      bananapi-cm4io
> +   bananapi-m2pro
>      bananapi-m5
>      beelink-gskingx
>      beelink-gtking


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
