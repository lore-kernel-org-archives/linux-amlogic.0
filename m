Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE9C67861
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2024 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pin2PvHFQjR5TnouKbFBZYB+nXWJY9+VQGjy1BA1GBU=; b=1ISantLdis3niN
	417AOBxggPeDX198ZnfWU30yzGetOZmzftUfgA0NHh6hDIy1GF4siev8Zis/YgFgor24GcxFQEfkR
	bRJ5HA4w5OcDbRhVKj4Mk/gDVsNgsA//iDOt6O6Tcr7J8LLHZj9pYa01RN0LOPRaS2H1WGKcYRymG
	OcuoEP373lq7TAb6PvJepkYk2apGXyQmc9r3C3L+JYoYsIK8++FjA2nXsUo+BCXTYrsoNQIKKdCt1
	bE/eRbHFyiTS2Q0tgyEweMra+cUlDALQpca8gwC5rrPzKLmpte/hUFO3U9Y8avYepjJmE1cVSjUHF
	w2c0YwF47jzkuHWUPR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseXf-00000005qvv-07D8;
	Fri, 05 Apr 2024 08:03:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseXY-00000005qoC-0MPk
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Apr 2024 08:03:17 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 13B2A3F274
	for <linux-amlogic@lists.infradead.org>; Fri,  5 Apr 2024 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712304186;
	bh=AAPPJoScNUPwvI0DFQBp84Z3ed0SuoO2+/aZj/UXOg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type;
	b=vjm9vvMFY30VPStbx5avfk17mtS6bxy10+c81Y10vCR0EGvqTElo7SLS9pQlDzwm5
	 9mzWTTdgwMfVBcRU6NnXxaX2KSek9IbAjnD2mAwsAuTpdloabbpt76DWZEGrS58WnM
	 85tEJuJwbCq8i9Ehsv74PF+Opv8WBmmwvk+AGukXV1aMQ25Bck8VPVJTOojroGWsEU
	 4t3ULpcZllpaZjYNqOie/Wcm24h+5bDKKV7i59jy1Jv2FcbW22whNLzcf9+Dq/bKMB
	 OQGP27zvm9YiJsGA2JiOmITO/X3T2Wzbcmu8CqxW7s8amSiEr/4tI0qzYBU4ugRbv4
	 tHrBs/dCFt3eA==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4162b9b1702so6529045e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2024 01:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712304185; x=1712908985;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAPPJoScNUPwvI0DFQBp84Z3ed0SuoO2+/aZj/UXOg4=;
        b=mzCYJ8UQzE7JDU+gJ8mRou1KnXKQQrtNtrx+T7h2NRjJbItNZK6ugNlydzkbl9yetF
         FSyOVOsiwAS3iP/ZEWWfZ524NpNiq8EXzvIj52CJOoBM/4a/kGwepsYbTeHiZWp/v38g
         HOu4oY1fnkaHLaWnoDKuJi+WD82t65WohquGuIpHlMwHj28oIlri6CFj9/gB96y30I1L
         GK6kRBLlvrHfYGjtmHVN22DKLeW9jmxNhO3EfrNqeDpT6tYe27o76rhKXrb+7miANVDu
         GM1LatCVtW+lC5jtzDG78OH2gjYoMl9yG6Q6hKlAx3xrM+MKCiUVwUVtUeHKHSJdO8Gz
         Ig9w==
X-Forwarded-Encrypted: i=1; AJvYcCUz1p7tqKSbj/YjN5D363QcJYUikNsk+vQf5JlVd5gFC/cdbDJRQ+zyD9q4xJBcCRbXZuCJZp+fzP29aM5Lg5V+vpW8wwKKbWCBFcKR8m3d+UI=
X-Gm-Message-State: AOJu0YxMekBBD36iiQBPsYwSVrnHXt+oSxrSqvWNlqO7S0NFgnQun1Eo
	jhwd0O7Ps2kurK6d+F45Xg7uePbnqxryz6iZOTmSI/50lRiokWJ7OsKW1Jib/xWE63L8NSO/N9k
	VnzelEstHFFcoS+wIw913/cUmNPqjXoDaBigx8ZFyTCofCt9n37sgIxp6pOFc9O3OFbe9Q9gorr
	xTa03P79AG
X-Received: by 2002:a05:600c:1554:b0:414:63da:a2a2 with SMTP id f20-20020a05600c155400b0041463daa2a2mr523622wmg.29.1712304185739;
        Fri, 05 Apr 2024 01:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlb0zj8YVjT6ghhGWxWqxYFldl+KAXy1xcq8BLktwN5b4JWYjk34R41kmK0CkvNKlI51mpMg==
X-Received: by 2002:a05:600c:1554:b0:414:63da:a2a2 with SMTP id f20-20020a05600c155400b0041463daa2a2mr523604wmg.29.1712304185337;
        Fri, 05 Apr 2024 01:03:05 -0700 (PDT)
Received: from [192.168.123.161] (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
        by smtp.gmail.com with ESMTPSA id l8-20020a1c7908000000b004155387c08esm1981349wme.27.2024.04.05.01.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 01:03:04 -0700 (PDT)
Message-ID: <52ad00c9-bd87-4384-81de-133c79c4e6f4@canonical.com>
Date: Fri, 5 Apr 2024 10:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] doc: boards: amlogic: add documentation for
 ODROID-HC4
To: Christian Hewitt <christianshewitt@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-34-christianshewitt@gmail.com>
Content-Language: en-US
Cc: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20230320114609.930145-34-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010312_704885_7DCDE2AB 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 3/20/23 12:46, Christian Hewitt wrote:
> Add separate documentation for the ODROID-HC4 board to ensure
> users build U-Boot using the HC4 defconfig that enables PCIe
> SATA boot. This avoids user frustration trying to boot after
> using the C4 recipe which only works from SD card.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   doc/board/amlogic/index.rst      |   1 +
>   doc/board/amlogic/odroid-hc4.rst | 141 +++++++++++++++++++++++++++++++
>   2 files changed, 142 insertions(+)
>   create mode 100644 doc/board/amlogic/odroid-hc4.rst
> 
> diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
> index 7c4c161e0d..9b76bca427 100644
> --- a/doc/board/amlogic/index.rst
> +++ b/doc/board/amlogic/index.rst
> @@ -101,6 +101,7 @@ Board Documentation
>      nanopi-k2
>      odroid-c2
>      odroid-c4
> +   odroid-hc4
>      odroid-n2
>      odroid-n2l
>      odroid-go-ultra
> diff --git a/doc/board/amlogic/odroid-hc4.rst b/doc/board/amlogic/odroid-hc4.rst
> new file mode 100644
> index 0000000000..94c3312022
> --- /dev/null
> +++ b/doc/board/amlogic/odroid-hc4.rst
> @@ -0,0 +1,141 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for ODROID-HC4 (S905X3)
> +==============================
> +
> +ODROID-HC4 is a variant of the ODROID-C4 single board computer manufactured by Hardkernel
> +with the following specification:
> +
> + - Amlogic S905X3 Arm Cortex-A55 quad-core SoC
> + - 4GB DDR4 SDRAM
> + - 16MB XT25F128B SPI-NOR flash
> + - Gigabit Ethernet
> + - HDMI 2.1 display
> + - 7-pin GPIO header for OLED display and RTC
> + - 1x USB 2.0 host (micro)
> + - 2x SATA ports via ASM1061 PCIe to SATA controller
> + - microSD
> + - UART serial
> + - Infrared receiver
> +
> +Schematics are available on the manufacturer website.
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make odroid-hc4_defconfig
> +    $ make
> +
> +U-Boot Signing with Pre-Built FIP repo
> +--------------------------------------
> +
> +.. code-block:: bash
> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip
> +    $ mkdir my-output-dir
> +    $ ./build-fip.sh odroid-hc4 /path/to/u-boot/u-boot.bin my-output-dir
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
> +    $ DIR=odroid-hc4
> +    $ git clone --depth 1 https://github.com/hardkernel/u-boot.git -b odroidg12-v2015.01 $DIR
> +
> +    $ cd odroid-hc4
> +    $ make odroidc4_defconfig
> +    $ make
> +    $ export UBOOTDIR=$PWD
> +
> +Go back to mainline U-Boot source tree then:
> +
> +.. code-block:: bash
> +
> +    $ mkdir fip

Thanks a lot for providing all these board descriptions.

Prefixing with $ makes copy-/pasting multiple commands impossible.

I personally feel distracted by the prompts. But if you really want 
those $ signs displayed, please, use

     .. prompt:: bash $

       mkdir fip

Best regards

Heinrich

> +
> +    $ wget https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc/blx_fix_g12a.sh -O fip/blx_fix.sh
> +    $ cp $UBOOTDIR/build/scp_task/bl301.bin fip/
> +    $ cp $UBOOTDIR/build/board/hardkernel/odroidc4/firmware/acs.bin fip/
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
> +                                                    --output fip/bl30_new.bin.g12a.enc \
> +                                                    --level v3
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl30_new.bin.g12a.enc \
> +                                                   --output fip/bl30_new.bin.enc \
> +                                                   --level v3 --type bl30
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl31.img \
> +                                                   --output fip/bl31.img.enc \
> +                                                   --level v3 --type bl31
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl3sig --input fip/bl33.bin --compress lz4 \
> +                                                   --output fip/bl33.bin.enc \
> +                                                   --level v3 --type bl33 --compress lz4
> +    $ $UBOOTDIR/fip/g12a/aml_encrypt_g12a --bl2sig --input fip/bl2_new.bin \
> +                                                   --output fip/bl2.n.bin.sig
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
> +Then write U-Boot to SD or SPI-NOR with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
