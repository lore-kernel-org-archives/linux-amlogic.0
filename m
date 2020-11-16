Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC471C55ABD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:33:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2802224B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9jI4Jzr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RSJQOj6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2802224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5pusAnpVabpwm+CqDYk9cmb2kRatcxGVgQciqn3zxQ=; b=d9jI4JzrpIE9ZAwpYx+q7pe6y+
	Slnul7Fw7HgomkJaB9lO6ER7J5ZTJp65Vz8/ddz3K2GUDcZJjqG6VJNGXLQWUGxMGC9EHuz+3wxmj
	qrSrBj1ErwGZs/J1e/a13jHNAXS+Rrk+zVkQnj4tM/84nfpkxa5WiBqeQHs+GxdxJJL2P4b23XnQ9
	ET/9LK0STEzlZ5HZj8MjICCrZCBRyyPuLrfT+JAgPn0lKkRIrq0vKYDfivJnONuqWC/wY+L2MirIw
	2hwitd1AnI12ZOZzwBSL/J1zPqD7SUPpu3Nh9Je07CBgHR0gJvFGiL+EFRaCnnuGcJt0V0BVzdrDo
	vtRmobMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZwr-0000C3-5w; Mon, 16 Nov 2020 08:33:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZwn-00009u-Pv
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 08:33:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id 10so22892014wml.2
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 00:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rpyHnH1kRRZPZrtXD4WkiTG22J/+k9qhuhbiORLkYck=;
 b=RSJQOj6qNNc5WM2jBQtain0ccAnLkFbn4OmVa1bluxeNOTK61ukFIjRsPQjUoYwq/M
 27ehNIbzj0tzmvi8v1fDkZAsqVocqTdfpBWajLOHfrdfPpfSgxAwMSYwaqZOtH2Seh/Z
 jum6/bJ1RrrwLh5Xsa8hYqOJUaAoax1cLY9+EGIDGtQIxwwMkT1H6Y2pIAqrenv8CYnY
 rHthhbzh4N1EGOMzlmnFPFNZ0jvh65JL5JS/BUVHmPhEww1mvZk0psHwc7MSwlukeW9g
 GN3FNABFu4q1+4rmfKbw05d6vf2+Fv3zn8LlEUgoOK3abyaP/zuOfEAwetC9KYTf9WTP
 cBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rpyHnH1kRRZPZrtXD4WkiTG22J/+k9qhuhbiORLkYck=;
 b=AqqW3dee34JyESdlvAJsAb84eryu+HX4pcshtg+hkFd4E7BS1UVhpHGIBTJ59tmUlU
 osuOUS3nj2HxwWaHP2oaLCE89OfiuCLIxytAj7Bf5j2wlEXYpccMgS5kv/NKGt49VfEf
 a1S1OWRi/W+bp5x+Tmg+fpEQl43S81dy3QJeb0hMGFOEnTfd2A8sRi7ZhQmpiaj+KRQH
 JmeulNa823NnYl/Zy8mRcUN2Fc6kVoNMIf6v57/D/Hz8PCbo+ceCYj0PoqvH1GcznBhs
 Pkv4dyt3aKUzH3Iq7JF7SLyUANwRBcMphKMk+1mWtAkS//+srEPEB6jfeVGxFfbyRp5D
 nsaA==
X-Gm-Message-State: AOAM5333xNRTBQMg180lT/qkzKGbiPJ8zE8JmxuTVrX91/DGTZdTgk/G
 3vLIrH+qNjW4CvvIcXpXmSWBiw==
X-Google-Smtp-Source: ABdhPJwTlnMdZOTsiOyRrUcrAHx9UvwR02u8xqptyRTMzv2NqLUbQuBclSAHmGhHe0oveMEonf3FzA==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr14060024wml.31.1605515585199; 
 Mon, 16 Nov 2020 00:33:05 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb?
 ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id f16sm22260522wrp.66.2020.11.16.00.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 00:33:04 -0800 (PST)
Subject: Re: [PATCH RFC] arm64: dts: Use separate dtb for Khadas vim3 usb3 and
 pcie controller
To: Qu Wenruo <wqu@suse.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 gouwa@khadas.com, nick@khadas.com, art@khadas.com
References: <20201115033917.83302-1-wqu@suse.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <25b4bbb5-07e8-4d82-a4cf-43f4d64c8983@baylibre.com>
Date: Mon, 16 Nov 2020 09:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201115033917.83302-1-wqu@suse.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_033313_904737_D27CFAB4 
X-CRM114-Status: GOOD (  33.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 15/11/2020 04:39, Qu Wenruo wrote:
> Although the plan is to make the bootloader (U-boot) to load overlay for
> the device, but currently the board doesn't have the upstream support
> yet.

No need for that, automatic PCIe enable is now support on upstream U-Boot
for VIM3 & VIM3L:
https://github.com/u-boot/u-boot/commit/adbff64af7b7cee3e0007b75df2644090edaafcb

Neil

> 
> This means even upstream kernel supports all the needed drivers, we still
> can't initialize the pcie controller.
> 
> As a workaround, make seperate device trees for pcie controller and usb3
> controller.
> 
> Now user still need to go into the factory bootloader to switch the mux,
> but they can easily boot the kernel with PCIE support by just swithcing
> to the pcie device tree.
> 
> And since we didn't modify the original dtb, the future upstream uboot
> can still use overlay to switch mode using the same dtb file.
> The added new pcie dtb will just be a workaround.
> 
> Tested on my VIM3 pro board, now I can boot the root fs on the NVME
> drive, with upstream kernel with the new pcie dtb.
> 
> Signed-off-by: Qu Wenruo <wqu@suse.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../meson-g12b-a311d-khadas-vim3-pcie.dts     | 39 +++++++++++++++++++
>  .../amlogic/meson-g12b-a311d-khadas-vim3.dts  | 23 +----------
>  3 files changed, 41 insertions(+), 22 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-pcie.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index ced03946314f..a0b8d30539e2 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-pcie.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-pcie.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-pcie.dts
> new file mode 100644
> index 000000000000..93641a32eeec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3-pcie.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-khadas-vim3.dtsi"
> +#include "meson-g12b-khadas-vim3.dtsi"
> +
> +/ {
> +	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
> +};
> +
> +/*
> + * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
> + * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
> + * an USB3.0 Type A connector and a M.2 Key M slot.
> + * The PHY driving these differential lines is shared between
> + * the USB3.0 controller and the PCIe Controller, thus only
> + * a single controller can use it.
> + *
> + * This is the PCIE device tree.
> + *
> + * Until upstream uboot can boot the board and modify the nodes before booting
> + * It's much easier to just choose this device tree file to use PCIE controller.
> + */
> +
> +&pcie {
> +	status = "okay";
> +};
> +
> +&usb {
> +	phys = <&usb2_phy0>, <&usb2_phy1>;
> +	phy-names = "usb2-phy0", "usb2-phy1";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> index 124a80901084..9c111d76baec 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> @@ -16,26 +16,5 @@ / {
>  };
>  
>  /*
> - * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
> - * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
> - * an USB3.0 Type A connector and a M.2 Key M slot.
> - * The PHY driving these differential lines is shared between
> - * the USB3.0 controller and the PCIe Controller, thus only
> - * a single controller can use it.
> - * If the MCU is configured to mux the PCIe/USB3.0 differential lines
> - * to the M.2 Key M slot, uncomment the following block to disable
> - * USB3.0 from the USB Complex and enable the PCIe controller.
> - * The End User is not expected to uncomment the following except for
> - * testing purposes, but instead rely on the firmware/bootloader to
> - * update these nodes accordingly if PCIe mode is selected by the MCU.
> - */
> -/*
> -&pcie {
> -	status = "okay";
> -};
> -
> -&usb {
> -	phys = <&usb2_phy0>, <&usb2_phy1>;
> -	phy-names = "usb2-phy0", "usb2-phy1";
> -};
> + * Vim3 default to USB3.0 instead of PCIE controller.
>   */
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
