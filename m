Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D3DCA1017
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Sep 2025 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNaUl+619+MB9sBDnjraXD6+sr0kzqPfp1jmKhcRV+c=; b=AOD/2UHiKrKgwC
	TB0CO57TijlF+YAQy3wZhcNeU8htJFRKljsG5rApOvA66sKZcAt4ai3v2zJMb60cVHwJI5EwaUad4
	2bWEt75Ex3TxfGdVKYdvhDqwFQaIVHZE3ouBeCN2QmtP6v1HHQ6qcQBFYyj3oDIvq5BxlQutBvcQD
	DsuvGjl1Ux9L/SyksUALyvPF8yH4DaiuxOMouadb8NWEtX2udivn+3xU2cxRVAI4SLmBrQC12e/kc
	FQgVWnXLrRaioy7m1LlDn1DSwau1ify1iiiSF4vvzGc1H6Cl/yTqA9a2PnSaqRQk20mmK2WssYwS0
	yqi3RONCZ3FqAvrC/ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK2t-0000000CHkh-26YC;
	Sun, 07 Sep 2025 18:23:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK2p-0000000CHj2-1WKV
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Sep 2025 18:23:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b9853e630so34656755e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Sep 2025 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757269397; x=1757874197; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJFVpcWLs8hzJhZRxA8jQtAdYhxmsHzd/bzdk6pJg5A=;
        b=pyCOF1XsJtxZ5J2vYgvDT5esnNS8hkFnm3owgDqhuhz5n26rLKobm0x0HUKRDf+2+z
         cKxb1TL6XMuqzO3jWgG028QIcso0dlf9mazjDBfb8FdiQX78wO+1xNkn57T9nIYZCNgU
         BLQxcfxwtOP0cIld5CtEExKArq8yfNlfE3ilhmYl5iWPON/6ONGaQ5LEWMjZYsK7OKDL
         6xx7oG8kJlhqBznEPHxOZ0o2k6AAZBwQrkvqADf01RIMSRCMyVMb8Hq0mJg5iSDSR4Um
         4LmM2p/g7bDte2n0rHjkJ9PCkZmHqMJRCfSxvajLugiyTcumYxv2y76mcyJaJC39fKg7
         X6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757269397; x=1757874197;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJFVpcWLs8hzJhZRxA8jQtAdYhxmsHzd/bzdk6pJg5A=;
        b=popB0bbG0rdYc+Y3OUvJ3xPby4jF5Tz0yTpIRU6wewmCxZuN2+ma6Qa3ZpPhOsF+el
         WSv/PRGL2KrIF+ZUNcB5UncjFIuej54aRCnBP7KGFrhG8PPos3H+xVGgaoXyCXkeksfx
         ERoErDDEUqE0Fc8Uhlg/61hxvshqKmzg5sR/36xtBJ7J6l+zq4Eum3aZhSJ5I7lnz6Jp
         UhIe7bvIUl6zkroX+86n8TDjwgmO4twSUXhpSO1uBwN+f7hQVjDEcOrYjHWNrAVaSTTm
         AOE5SYbVsxPJzK+M2qmYTYDH1AElCpRjjXZ/6JHwq2pPN9vlGy2thzbWtbrqvTOx8NW8
         dwzA==
X-Forwarded-Encrypted: i=1; AJvYcCVDm+yc9Ap1hWR2vAWt3oFfFM9Kp+2fACvDvTOiByxgqAzjs9GZ/KORT0ocjLSFd0dnaNZzdlRhM5poeuDg@lists.infradead.org
X-Gm-Message-State: AOJu0YwRp8wyzuzz1CUQ1kuMPgs9ds6XlKBv76KgI038RvtuajITxZkQ
	mTnUho0ceP2SlRFBUg5yYTkSaWjHkiT3e2uXuUUTu2cxVJvthO352+Ut9Znnp42Oe5M=
X-Gm-Gg: ASbGncvCcyc9vxfCB4fFnD7eO1zGgMdhOi6l6GLd66Zkx0EIYs5gGvl1Wv2gHKOvEN2
	zbKv31A8NtOSA9bymUkxC7qhKeHmQdXFI8LZlZ16q/Nc6ShVt21K8rDpGbgnTm8tyuTxZxFnXTa
	S2plQox/hITfiIeV53R/GemL7ivsRok+k9sq2IHCOQHlgOokq/RbEU10hgCMIACcpa0yZi3qgHb
	VOrDrITN0GloNgzXMql9g4WHT0WabyraZefHlpCBaIrcu9Tnb921fkuMR5VFQwWlKz7vs1YlDC/
	TjLn6jXGmsV3cJgOH0TucLOuKzIFPSWnWIpYEVmAsU9RA/5GB+oqCajIvYRpeKpao1Y/r+0AhIk
	uTmaPfGmyMKT5wMdfv1EzyKQFOJqhNqRKuENAvvw+5tU=
X-Google-Smtp-Source: AGHT+IGOULUshdeLRil6HKEu9zZo7J9O1jxxfK8N+bL8o+p4kBnHT1aasX29KcGupM6Cw5i6XsgkhQ==
X-Received: by 2002:a05:600c:4e93:b0:45d:e0d8:a0aa with SMTP id 5b1f17b1804b1-45de0d8a342mr47706135e9.17.1757269397175;
        Sun, 07 Sep 2025 11:23:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c6e0:b19c:fab9:63fe])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd296ed51sm154484725e9.3.2025.09.07.11.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:23:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  vsetti@baylibre.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: gxbb-odroidc2: remove UHS
 capability for SD card
In-Reply-To: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com> (Valerio
	Setti via's message of "Sun, 07 Sep 2025 14:29:21 +0200")
References: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 07 Sep 2025 20:23:16 +0200
Message-ID: <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_112319_639246_4EA47EAD 
X-CRM114-Status: GOOD (  32.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun 07 Sep 2025 at 14:29, Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org> wrote:

> From: Valerio Setti <vsetti@baylibre.com>
>
> This is meant to resolve reboot not working on this board.
>
> The problem is as follows. In order to be able to switch from HS to UHS
> mode the bus voltage needs to be reduced from 3.3V down to 1.8V and this
> is achieved by the "vqmmc-supply" regulator. The ROM bootloader is only
> able to manage the card in HS mode (3.3V) and the switch HS->UHS happen
> at boottime in the kernel. The problem appears when the reboot command
> is issued or watchdog expires because in this case the "vqmmc-supply"
> voltage is not returned back at 3.3V before rebooting the board so the
> ROM bootloader will be completely stuck.
>
> Therefore this commit removes both "vqmmc-supply" property, which is the
> one causing the reboot problem, as well as all the UHS modes which would
> now became unreachable due to this regulator control removal.
>
> In terms of performance the main drawback of this commit is limiting the
> SD card bus speed to HS (25 MB/s) instead of UHS DDR50 (50 MB/s). However
> this comes with the benefit of being able to reboot the board, so it
> sounds like a reasonable compromise.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 959bd8d77a82ebc78c5e0592d7613e692e4ede4e..331a0a62b884389b4e0d4d157fff7f9c8738c89d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -348,17 +348,16 @@ &sd_emmc_b {
>  
>  	bus-width = <4>;
>  	cap-sd-highspeed;
> -	sd-uhs-sdr12;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-ddr50;

That's a compromise we had to make on other boards using similar SoCs.
With the ROM code not reseting the GPIO used for the supply, It don't
think there is way around that.

The above should be enough.

>  	max-frequency = <100000000>;
>  	disable-wp;
>  
>  	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
>  
>  	vmmc-supply = <&tflash_vdd>;
> -	vqmmc-supply = <&tf_io>;

... but do not remove that.

That way the description is complete and the kernel is able to verify
the regulator is properly configured.

It is also easier for a bootloader to alter DT to add the UHS modes back
(it is safe to do so if booting from another device that SD, such as
eMMC)

With that
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> +	/*
> +	 * Control of vqmmc-supply is intentionally omitted because it would
> +	 * prevent the board from rebooting properly.
> +	 */
>  };
>  
>  /* eMMC */
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250907-fix-reboot-04e0fc919ae0
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
