Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7B6C76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX8cm8e9rvnlyvR8ZOEC9vEIW26yp+MAgk6BAxNnVHM=; b=IFExlZB0gqMhCd8qEMaQdlwUy5
	RiqueJN2j1o8HM24n1eYnYYzdfvVkL3MIJxjK8c+82rdMtghv5yPrpQDhrJ1Xpjh0baekF9De0tRL
	J/MdCk4fbT5dsSkSKcgsY1lkoP3n7hZ6xWiFxrmOwv+uLND+hw8+hKCM72q9PdfqfnsaEbdVi44sg
	K63nV/yiSc3/uB153SlMH16teuazgm8QAs5MVMfVeV+lDKDf03LGoxl+Y+mX0kWzkp+6RcYdsCv4u
	GfUXg9zDdJAPpIM+ocnuM9WRr0vlZOqFBntNAV6dDReeMOnTlBRcXQq/4AqDlfBm4z9eMQ0CCmlof
	3PO2t7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRz-002I26-1c;
	Thu, 23 Mar 2023 15:01:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRu-002Hyd-0V
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id r29so20825110wra.13
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583712;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uEHvgVa+LMqKq7QEat5OceTqZ/J0ejozXR/RKqCohbU=;
        b=TrGatbLPt+7oXQgTgKiavdyRQskWVWYwahHszJiy6iY13ZbNxGgtAqYCGmoUVu14w7
         /HZUSTkPuaQ3CFe5IqWRe539+f3+NRrzqfuuWMxeteUvJDN4CLIwEl3SY7G32hsWcnHp
         GpF58NKuWfudeNh4YHO6BlSVhpkyciCBpZ04nxHPA/iTKypvEw3VfEZBBu/6DmSYYdmo
         hEgA4UbR88je4mFFltZCviMx7m1xpZnVefKeONwQckHGTFFp090MePTjUKEX5XX2IQxB
         f7mD0nmtdxIEn+xnXJpLzS/DjzpC63oaRcxmF4O1ijI+rIr02aJ3/4N0O88LbSDfr0fM
         Ko/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583712;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEHvgVa+LMqKq7QEat5OceTqZ/J0ejozXR/RKqCohbU=;
        b=oWz0ZQX3dwCX/9v25YUcP4O621EnoNaMVtps1vr+uDDryO4nb8OUpZc6B4+t5D5q4M
         rQS6F4jthiLK72cJWTYa19k1qqR37xDdZfH1okiYLSl4ReqHKEUpaWfAfGGR4QL/xIHa
         UnnOEtxBEvGzAyB+qx6jg4M0U9wevjTlkoIUX0pO+fWwLct69jBVYBTMWBsisFt8tils
         9A+ntFlrqkhH22N05Fi9CEfjMCtVbFFWRUJNYWdddSoFBEkrXTs0Edkx/BPvmiehBn79
         L1fRw9pmBqBoNtx+INWmo3EflRF+eTNXv3E02Rbp0MhyTbXuGTb0/quzmOVT8CFETm2j
         hhPA==
X-Gm-Message-State: AAQBX9eYA9sOhjCsCZDph439FPKnaBwpbpYgNeFwYSa2uGzdLmm/J3nx
	jUWtIHNJH+g9b0OmArFOctPFlg==
X-Google-Smtp-Source: AKy350YR9Dlr1iDtpazU2Q/bnLRFpRMs9VGHcUjD128d2dlPC9blsO7PpujbABpEov9rernRDANPRQ==
X-Received: by 2002:adf:f641:0:b0:2ce:a8e4:bb79 with SMTP id x1-20020adff641000000b002cea8e4bb79mr2664225wrp.53.1679583712318;
        Thu, 23 Mar 2023 08:01:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d65cb000000b002c55de1c72bsm16325430wrw.62.2023.03.23.08.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:01:51 -0700 (PDT)
Message-ID: <5debe002-5973-58e1-8e86-ea2732c2faf5@linaro.org>
Date: Thu, 23 Mar 2023 16:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 11/14] doc: boards: amlogic: add documentation for
 Radxa Zero2
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323143142.780306-1-christianshewitt@gmail.com>
 <20230323143142.780306-12-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323143142.780306-12-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080154_193307_89FD7D08 
X-CRM114-Status: GOOD (  17.91  )
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
> Add build docs for the Radxa Zero2 board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/w400/MAINTAINERS    |  2 +
>   doc/board/amlogic/index.rst       |  1 +
>   doc/board/amlogic/radxa-zero2.rst | 80 +++++++++++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
>   create mode 100644 doc/board/amlogic/radxa-zero2.rst
> 
> diff --git a/board/amlogic/w400/MAINTAINERS b/board/amlogic/w400/MAINTAINERS
> index 042b523056..117f79ea04 100644
> --- a/board/amlogic/w400/MAINTAINERS
> +++ b/board/amlogic/w400/MAINTAINERS
> @@ -5,6 +5,8 @@ L:	u-boot-amlogic@groups.io
>   F:	board/amlogic/w400/
>   F:	configs/bananapi-cm4-cm4io_defconfig
>   F:	configs/bananapi-m2s_defconfig
> +F:	configs/radxa-zero2_defconfig
>   F:	doc/board/amlogic/w400.rst
>   F:	doc/board/amlogic/bananapi-cm4io.rst
>   F:	doc/board/amlogic/bananapi-m2s.rst
> +F:	doc/board/amlogic/radxa-zero2.rst
> diff --git a/doc/board/amlogic/index.rst b/doc/board/amlogic/index.rst
> index fa1b362731..71b7e1f3ed 100644
> --- a/doc/board/amlogic/index.rst
> +++ b/doc/board/amlogic/index.rst
> @@ -112,6 +112,7 @@ Board Documentation
>      p212
>      q200
>      radxa-zero
> +   radxa-zero2
>      sei510
>      sei610
>      s400
> diff --git a/doc/board/amlogic/radxa-zero2.rst b/doc/board/amlogic/radxa-zero2.rst
> new file mode 100644
> index 0000000000..dccf592459
> --- /dev/null
> +++ b/doc/board/amlogic/radxa-zero2.rst
> @@ -0,0 +1,80 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +U-Boot for Radxa Zero2 (A311D)
> +==============================
> +
> +Radxa Zero2 is a small form factor SBC based on the Amlogic A311D chipset with the
> +following specification:
> +
> +- Amlogic A311D (Quad A73 + Dual A53) CPU
> +- 4GB LPDDR4 RAM
> +- 32/64/128GB eMMC
> +- Mali G52-MP4 GPU
> +- HDMI 2.1 output (micro)
> +- BCM4345 WiFi (2.4/5GHz a/b/g/n/ac) and BT 5.0
> +- 1x USB 2.0 port - Type C (OTG)
> +- 1x USB 3.0 port - Type C (Host)
> +- 1x micro SD Card slot
> +- 40 Pin GPIO header
> +
> +Schematics are available on request from Radxa.
> +
> +U-Boot Compilation
> +------------------
> +
> +.. code-block:: bash
> +
> +    $ export CROSS_COMPILE=aarch64-none-elf-
> +    $ make radxa-zero2_defconfig
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
> +    $ ./build-fip.sh radxa-zero2 /path/to/u-boot/u-boot.bin my-output-dir
> +
> +U-Boot Manual Signing
> +---------------------
> +
> +Amlogic does not provide sources for the firmware and tools needed to create a bootloader
> +image so it is necessary to obtain binaries from sources published by the board vendor:
> +
> +.. code-block:: bash
> +
> +    $ git clone -b radxa-zero-v2021.07 https://github.com/radxa/u-boot.git
> +    $ git clone https://github.com/radxa/fip.git
> +
> +    $ sudo apt-get install -y gcc-aarch64-linux-gnu device-tree-compiler libncurses5 libncurses5-dev
> +    $ sudo apt-get install -y bc python dosfstools flex build-essential libssl-dev mtools
> +
> +    $ wget https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf.tar.xz
> +    $ sudo tar xvf gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf.tar.xz -C /opt
> +
> +    $ export CROSS_COMPILE=/opt/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
> +    $ export ARCH=arm
> +    $ cd u-boot
> +    $ make radxa-zero2_defconfig
> +    $ make
> +
> +    $ cp u-boot.bin ../fip/radxa-zero2/bl33.bin
> +    $ cd ../fip/radxa-zero2
> +    $ make
> +
> +This will generate the signed U-Boot binaries:
> +
> +.. code-block:: bash
> +
> +    $ u-boot.bin u-boot.bin.sd.bin u-boot.bin.usb.bl2 u-boot.bin.usb.tpl
> +
> +Then write U-Boot to SD or eMMC with:
> +
> +.. code-block:: bash
> +
> +    $ DEV=/dev/boot_device
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> +    $ dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=440

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
