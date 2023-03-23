Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFE8C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3mGkbgJpZMNBLoG+llNPPFoAbuGfx8Zv32m7+bnBG4=; b=fj/wklIpouxJ4r8SUJuO14Kk+b
	oC740v+iVJNaUMK2JxtM2M8NqP5prJ1Jx9yfak3n/1Ase1Flv4Pnffz+ilFVFGKSvqVwso9T89TAE
	qDMulvSB+C0XW+CBhvU2OrfVLkkj0R07eLVjHkOll8Z93tal28ldtTWgiXq/3rEwItn+moqOmMkN6
	1zUxMe/H+dHPmQKBg6+c0rymcgg0iigTBBuqP+5zyqt8djSxwBqZnx3AyzLbp7aQ+gLGb0Zcd/87n
	bAl9LpQh24r8ZlQfIZ4t6+vH+3HhIfrEFu5RIDzLpu7jsobH3y4Y2nYoXPU017CJ8OFKY1DyaepZC
	ASUHqNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRe-002HpN-32;
	Thu, 23 Mar 2023 15:01:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRc-002HnV-2q
	for linux-amlogic@bombadil.infradead.org;
	Thu, 23 Mar 2023 15:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:Reply-To:MIME-Version:Date:Message-ID
	:Sender:Cc:Content-ID:Content-Description;
	bh=Gsep5xG5dcWlDB2hVZFmo8/ElhTLrVDFg79YDW5G6Xc=; b=FLkJKHOEdNSsgXa3sYYTELWCrG
	ilbQBKEEtJaKBWdFBQsoPPkUwg7CKoipvq6UPoWda6U+bhnaGxm9/+WE0FCgCJ1WuUNxaGkmZOx0u
	VDVoPKFum264dZFj1Wt7PjzjC1RtPqgU7gixXba8BsCHCfNQAgC0eIt+c0QdmdSiSJFcx1RjHVNam
	IFYKROGfffcNosJpTKsoOPyDykg5XEqtfYn2AE0VV2JfwtQL/88Ds7ixDwQ0s6Ddt3/1VJ6AzQoV2
	ydlc2BuNEFCL/qjHtdTwi/oh3iqldWSE7TLFzgABmCfHNqA2gIcSKL58mfJ3v4N7LC6BIrAVjGqZD
	2p2E6YBQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRV-004t0X-2i
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id l12so20835488wrm.10
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583677;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gsep5xG5dcWlDB2hVZFmo8/ElhTLrVDFg79YDW5G6Xc=;
        b=v1uWcfu5FnmzYu/SOwvDuovOGn6gqane9NCMx0l6R3Di9BhSj4abime+8G4Py+A+Qo
         PHoJsA1yJEho8A3LPNg3WAjtk7pC+tya/znxyGQE2CzBfxGxe6OyETHCHp8Lcuef/s0C
         bnNiXZX2MfWHXdEFjFTSBoC+9hFrxciHhFazuT0zlBJpxbQgPelWbsJAswFcBYtNEf8i
         t+9uzU8FAUSGMsoHV9+vTfGve6mxrVl0EGM0YOktOswDepEdxtdY6YQBe0y3aYLzCFRZ
         2Kwf3TplAPr7uenzOafVhqn4cB5DfFwsfcNWL+oY7nAT8UdYZfaZ8qmCECAI/gaZNHLf
         sMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583677;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gsep5xG5dcWlDB2hVZFmo8/ElhTLrVDFg79YDW5G6Xc=;
        b=L7ehOpx9njReUlUxi8FvC7kTa22N4cVgiOFlpRvXD//ZoFijPCafeshFLiEo2e41Lj
         iwXZPC+w1DWAK14pH0gwBiXSdEuexoNGpZrf/bZHXDD5B/fr5hHMHQ0r8d6MXjZTwxt2
         Z23kdneY3dk0QX51sGQVePl3X0NiOFgCN+fdbxIDghG12zNX1DEdELsY4lB8CjPCCUDO
         XrDiW5lrMyIwuzfyaiQs9I197wapJ6D86omVDwy2H3vk2LMZH4gCn6zfpRRk5csISBaW
         kPMggxymAase4RnLdJO32IhOeMmCrAvZuMG0AcGeIX4BIszI9rpT7Z1US1raj1vwX2b6
         N1Zw==
X-Gm-Message-State: AAQBX9dV8su0+/hwQ/LSr4CDu+u9Suocc5ZCcsq7etcpuQ89BDkgLVVM
	3kiTK4nVeB+GGN5M4UFkL10u4g==
X-Google-Smtp-Source: AKy350afi2PIALGaf1AXZ+/TNx4KfwRcJ0j6kwgSEDDyn8x74wgEfVXhUCuMT5Rs1typNNeoZtaLuQ==
X-Received: by 2002:adf:ec84:0:b0:2cd:e089:398d with SMTP id z4-20020adfec84000000b002cde089398dmr2645968wrn.5.1679583677602;
        Thu, 23 Mar 2023 08:01:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id m6-20020a056000008600b002cde25fba30sm16380654wrx.1.2023.03.23.08.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:01:17 -0700 (PDT)
Message-ID: <fe1ff9e4-6e8e-b371-b71b-bcfdd6b8623b@linaro.org>
Date: Thu, 23 Mar 2023 16:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/14] docs: boards: amlogic: add documentation for
 BananaPi M2-Pro
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323143142.780306-1-christianshewitt@gmail.com>
 <20230323143142.780306-6-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323143142.780306-6-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_150130_373840_CD35F62F 
X-CRM114-Status: GOOD (  18.20  )
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
> Add build docs for the BPI-M2-PRO board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/u200/MAINTAINERS       |   2 +
>   doc/board/amlogic/bananapi-m2pro.rst | 143 +++++++++++++++++++++++++++
>   doc/board/amlogic/index.rst          |   1 +
>   3 files changed, 146 insertions(+)
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
> index 0000000000..6c35943bac
> --- /dev/null
> +++ b/doc/board/amlogic/bananapi-m2pro.rst
> @@ -0,0 +1,143 @@
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
> +
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
