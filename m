Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69583C7619A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fCAV0GqmqDW4Vf3HpxYm2mOl6XYh6Jt3+9q3IaXjyM=; b=Pyuell1FTuIXkbZJ7VrmqBTMsZ
	0Z8kV0CTxRhe6vnnFyea0adrXdabAoZe1uRSXltSPauPXazg6zSn0usz0B207T0OhtxVwJU2OuQHp
	oQvCOTfOhn2hCPAtAcAXfg7aJhvDjL56VjBcyZS9k2afHtoZkFA73emYdQmOLI6+uUxopeEU0UfZX
	vJXMWBMs4hSbyKIVchpctXYCtY212LLuA6nqbDCRTctEjGYDz6UcTZtBag6ijCpLnHfYu9TT3WvN4
	+j38OJOUzJhk/33Sm2+bsr0kj2EhDIBc/mQHFsJPjWLC3cTQSDW9L594XgE30QM13M86SS7GU5rEP
	jnOTsu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMSW-002IIM-1n;
	Thu, 23 Mar 2023 15:02:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMSQ-002IFO-14
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:02:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id h17so20846886wrt.8
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583745;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YuE/aZpyaWKm7h+mg+WnOEwFLwpv96gVOp1whUMDs1w=;
        b=lo5FUpYrKctPMBWmyChGqynpLzQcITxiVqwJWY9ZCa9NVbHxdJsTftpt6454TH65VY
         glTrsmGtdVpVaKpdg+a0R3LBiZBLSYVbzz7+xq6x9PGPwEvt7Y+rp9KSeWIsBAZfNZio
         xsmsGwRimy+C83GKv8Vh3ADrhbBWlmcbqSkc5tVrY6zAtArZLHFPeKsY/f3HWg4z0Z3F
         yQqupA9IjCD8+wZ0Wte+TCWR+FWSqlGwYTn1Dy8udJhq3ad/2c6M7wmPWZwdFJkQ6n4c
         b+jKz/7S/xvXwsPoTOalrvmWEpCyfcmIHHBAQiFdwUG4HzcOftu7xh0b0cZcrtU8oa2m
         eNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583745;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuE/aZpyaWKm7h+mg+WnOEwFLwpv96gVOp1whUMDs1w=;
        b=HnAGvNAfqanLEkjtYOw9UrjM5SWSPYGaXQ4bB4Tz248jW4E1GT/gXXpDALpBD8o1Uu
         Q3dtYPdljQIX5fgGrx5CTNs1J6/OcTJ2OoI6ThlYCvy3BCbizA17bafNLg8oZ7O0toKS
         FK153wBYop5YVku07K4D4ZUnEZtAZ7cUOfgL8SybOixNcplU23e6yC+gxv+Ltjg4F4mJ
         zKLDWJ8YK1MlrRCeYZbfzZ9Y1WIYAoOPOsBAC4NikUpvKy8LH2ss0rvqv/7o2csMCrsY
         K3pg2Gz1iPj1sok/Np1c6A0BoAJHNsSuk4FBIjxRFXuRlMLhJLNGl4UzWazbyfAYTQ+z
         n58A==
X-Gm-Message-State: AAQBX9flisfXkyzLdd/BKdgkY/fNnVLvdICLNCk6uDiZq81hJ7L6rgoE
	mfoN7U7dcnCQTIN5scyfDT27Lg==
X-Google-Smtp-Source: AKy350ZDj8GdawS57sTbF7T7QM+RS4O7aUa9ZD6PIXJmbpBpxWp1NxR50iR3IPqkz9KsieiaxJvlYg==
X-Received: by 2002:adf:df82:0:b0:2d9:16f9:aee3 with SMTP id z2-20020adfdf82000000b002d916f9aee3mr2856203wrl.14.1679583744074;
        Thu, 23 Mar 2023 08:02:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm16252756wrq.16.2023.03.23.08.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:02:23 -0700 (PDT)
Message-ID: <936079de-a532-543d-4fa4-00beb850af58@linaro.org>
Date: Thu, 23 Mar 2023 16:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/14] doc: boards: amlogic: add documentation for
 WeTek Hub and WeTek Play2
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323143142.780306-1-christianshewitt@gmail.com>
 <20230323143142.780306-15-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323143142.780306-15-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080226_371621_58BBA515 
X-CRM114-Status: GOOD (  20.90  )
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
> Add build instructions for the WeTek Hub and WeTek Play2 boards.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/p200/MAINTAINERS    |   2 +
>   doc/board/amlogic/index.rst       |   2 +
>   doc/board/amlogic/wetek-hub.rst   | 110 ++++++++++++++++++++++++++++
>   doc/board/amlogic/wetek-play2.rst | 115 ++++++++++++++++++++++++++++++
>   4 files changed, 229 insertions(+)
>   create mode 100644 doc/board/amlogic/wetek-hub.rst
>   create mode 100644 doc/board/amlogic/wetek-play2.rst
> 
> diff --git a/board/amlogic/p200/MAINTAINERS b/board/amlogic/p200/MAINTAINERS
> index 264218e3be..fe451dd7db 100644
> --- a/board/amlogic/p200/MAINTAINERS
> +++ b/board/amlogic/p200/MAINTAINERS
> @@ -12,3 +12,5 @@ F:	configs/wetek-play2_defconfig
>   F:	doc/board/amlogic/p200.rst
>   F:	doc/board/amlogic/nanopi-k2.rst
>   F:	doc/board/amlogic/odroid-c2.rst
> +F:      doc/board/amlogic/wetek-hub.rst
> +F:      doc/board/amlogic/wetek-play2.rst
> diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
> index 71b7e1f3ed..deb7976436 100644
> --- a/doc/board/amlogic/index.rst
> +++ b/doc/board/amlogic/index.rst
> @@ -118,4 +118,6 @@ Board Documentation
>      s400
>      u200
>      wetek-core2
> +   wetek-hub
> +   wetek-play2
>      w400
> diff --git a/doc/board/amlogic/wetek-hub.rst b/doc/board/amlogic/wetek-hub.rst
> new file mode 100644
> index 0000000000..378c6a6497
> --- /dev/null
> +++ b/doc/board/amlogic/wetek-hub.rst
> @@ -0,0 +1,110 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for WeTek Hub (S905)
> +===========================
> +
> +WeTek Hub is a small form-factor Android STB manufactured by WeTek with the following
> +specification:
> +
> + - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
> + - ARM Mali 450 GPU
> + - 1GB DDR3 SDRAM
> + - 8GB eMMC
> + - Gigabit Ethernet
> + - HDMI 2.0 4K/60Hz display
> + - 1x USB otg
> + - microSD
> + - UART jack
> + - Infrared receiver
> +
> +Schematics are not publicly available but have been shared privately to maintainers.
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make wetek-hub_defconfig
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
> +    $ ./build-fip.sh wetek-hub /path/to/u-boot/u-boot.bin my-output-dir
> +
> +U-Boot Manual Signing
> +---------------------
> +
> +Amlogic does not provide sources for the firmware and tools needed to create a bootloader
> +image and WeTek has not publicly shared the U-Boot sources needed to build FIP binaries
> +for signing. However you can download them from the amlogic-fip-repo.
> +
> +.. code-block:: bash
> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip/wetek-hub
> +    $ export FIPDIR=$PWD
> +
> +Go back to the mainline U-Boot source tree then:
> +
> +.. code-block:: bash
> +
> +    $ mkdir fip
> +
> +    $ cp $FIPDIR/bl2.bin fip/
> +    $ cp $FIPDIR/acs.bin fip/
> +    $ cp $FIPDIR/bl21.bin fip/
> +    $ cp $FIPDIR/bl30.bin fip/
> +    $ cp $FIPDIR/bl301.bin fip/
> +    $ cp $FIPDIR/bl31.img fip/
> +    $ cp u-boot.bin fip/bl33.bin
> +
> +    $ $FIPDIR/blx_fix.sh \
> +              fip/bl30.bin \
> +              fip/zero_tmp \
> +              fip/bl30_zero.bin \
> +              fip/bl301.bin \
> +              fip/bl301_zero.bin \
> +              fip/bl30_new.bin \
> +              bl30
> +
> +    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
> +                         --bl31 fip/bl31.img \
> +                         --bl33 fip/bl33.bin \
> +                         fip/fip.bin
> +
> +    $ sed -i 's/\x73\x02\x08\x91/\x1F\x20\x03\xD5/' fip/bl2.bin
> +    $ python3 $FIPDIR/acs_tool.py fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
> +
> +    $ $FIPDIR/blx_fix.sh \
> +              fip/bl2_acs.bin \
> +              fip/zero_tmp \
> +              fip/bl2_zero.bin \
> +              fip/bl21.bin \
> +              fip/bl21_zero.bin \
> +              fip/bl2_new.bin \
> +              bl2
> +
> +    $ cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
> +
> +    $ $FIPDIR/aml_encrypt_gxb --bootsig \
> +                              --input fip/boot_new.bin
> +                              --output fip/u-boot.bin
> +
> +Then write U-Boot to SD or eMMC with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 conv=fsync
> +    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 seek=9 skip=8 count=87 conv=fsync,notrunc
> +    $ dd if=/dev/zero of=fip/u-boot.bin.gxbb bs=512 seek=8 count=1 conv=fsync,notrunc
> +    $ dd if=bl1.bin.hardkernel of=fip/u-boot.bin.gxbb bs=512 seek=2 skip=2 count=1 conv=fsync,notrunc
> +    $ ./aml_chksum fip/u-boot.bin.gxbb
> +    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=1 count=440
> diff --git a/doc/board/amlogic/wetek-play2.rst b/doc/board/amlogic/wetek-play2.rst
> new file mode 100644
> index 0000000000..cd7759f7f4
> --- /dev/null
> +++ b/doc/board/amlogic/wetek-play2.rst
> @@ -0,0 +1,115 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for WeTek Play2 (S905)
> +=============================
> +
> +WeTek Play2 is an Android STB manufactured by WeTek with the following specification:
> +
> + - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
> + - ARM Mali 450 GPU
> + - 2GB DDR3 SDRAM
> + - 8GB eMMC
> + - Gigabit Ethernet
> + - AP6335 (v1) or AP6255 (v2) WiFi (b/g/n) and BT 4.0
> + - HDMI 2.0 4K/60Hz display
> + - 2x USB 2.0 host
> + - 1x USB 2.0 otg
> + - microSD
> + - UART jack
> + - Infrared receiver
> + - Power LED (blue)
> + - Power button (case, front)
> + - Reset button (underside)
> + - DVB Card: DVB-S or DVB-T/C or ATSC
> +
> +Schematics are not publicly available but have been shared privately to maintainers.
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make wetek-play2_defconfig
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
> +    $ ./build-fip.sh wetek-play2 /path/to/u-boot/u-boot.bin my-output-dir
> +
> +U-Boot Manual Signing
> +---------------------
> +
> +Amlogic does not provide sources for the firmware and tools needed to create a bootloader
> +image and WeTek has not publicly shared the U-Boot sources needed to build FIP binaries
> +for signing. However you can download them from the amlogic-fip-repo.
> +
> +.. code-block:: bash
> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip/wetek-play2
> +    $ export FIPDIR=$PWD
> +
> +Go back to the mainline U-Boot source tree then:
> +
> +.. code-block:: bash
> +
> +    $ mkdir fip
> +
> +    $ cp $FIPDIR/bl2.bin fip/
> +    $ cp $FIPDIR/acs.bin fip/
> +    $ cp $FIPDIR/bl21.bin fip/
> +    $ cp $FIPDIR/bl30.bin fip/
> +    $ cp $FIPDIR/bl301.bin fip/
> +    $ cp $FIPDIR/bl31.img fip/
> +    $ cp u-boot.bin fip/bl33.bin
> +
> +    $ $FIPDIR/blx_fix.sh \
> +              fip/bl30.bin \
> +              fip/zero_tmp \
> +              fip/bl30_zero.bin \
> +              fip/bl301.bin \
> +              fip/bl301_zero.bin \
> +              fip/bl30_new.bin \
> +              bl30
> +
> +    $ $FIPDIR/fip_create --bl30 fip/bl30_new.bin \
> +                         --bl31 fip/bl31.img \
> +                         --bl33 fip/bl33.bin \
> +                         fip/fip.bin
> +
> +    $ sed -i 's/\x73\x02\x08\x91/\x1F\x20\x03\xD5/' fip/bl2.bin
> +    $ python3 $FIPDIR/acs_tool.py fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
> +
> +    $ $FIPDIR/blx_fix.sh \
> +              fip/bl2_acs.bin \
> +              fip/zero_tmp \
> +              fip/bl2_zero.bin \
> +              fip/bl21.bin \
> +              fip/bl21_zero.bin \
> +              fip/bl2_new.bin \
> +              bl2
> +
> +    $ cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
> +
> +    $ $FIPDIR/aml_encrypt_gxb --bootsig \
> +                              --input fip/boot_new.bin
> +                              --output fip/u-boot.bin
> +
> +Then write U-Boot to SD or eMMC with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 conv=fsync
> +    $ dd if=fip/u-boot.bin of=fip/u-boot.bin.gxbb bs=512 seek=9 skip=8 count=87 conv=fsync,notrunc
> +    $ dd if=/dev/zero of=fip/u-boot.bin.gxbb bs=512 seek=8 count=1 conv=fsync,notrunc
> +    $ dd if=bl1.bin.hardkernel of=fip/u-boot.bin.gxbb bs=512 seek=2 skip=2 count=1 conv=fsync,notrunc
> +    $ ./aml_chksum fip/u-boot.bin.gxbb
> +    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.gxbb of=$DEV conv=fsync,notrunc bs=1 count=440

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
