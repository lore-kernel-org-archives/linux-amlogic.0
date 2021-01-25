Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54C4C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:37:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C382522B3F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C382522B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xL8GeRBOKG7RmgMwPBibbRwCzSwrSOps6tRr5o/lraw=; b=hbGxPMLDDeNtHfML7lgvJbWG6
	DMpghYzxdupUFMuBlRRdekUSrrtDXZZgPFGM+zjzYzZe6ycX/zSoLf74oMHmnBelLhr1oHMjehp8i
	uKn5qG3qHr2FxZgS1rYtlhyLFRq+egC6mbRAyc4/jdil6gtJpWMdFkEHrGOqA0N5pXyOx+KAnZXck
	VxdIVVyE5z/acXgC3joQ1+jWE8Uca8CHPCK1H/qvQUM5uQ3dtKyZ+EUOoi6jWQWedKQZDeL5dSXt8
	1zb1eFPI6Byaa2pz7tVQ8N9yVH7/Kg/MYtWesKaN/U5d5d9nz4fWrT8Du9HNJVOuaM5p0VTSEkysj
	6A237LtKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46kE-0006bS-Ub; Mon, 25 Jan 2021 18:37:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46kA-0006Xt-Lv
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:37:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id 7so14026977wrz.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M5QMppfZuDgdfhY0VXv5q68aTd4Df+CNBzCbSZN2S8w=;
 b=X8jiScUISXvMVi/sd3gUeV7pR3QgmpXTSedP03XtM2q+c60bBVEfkzCpy/TtrpYI6K
 uMShmibpVIyHudX6RuPHFXGK/Wu3Q1Vjq1GsEw0q+E0PLcVLBeJPPYteqjbOr82Al//8
 AxEvLXHYct7b2IDy6hb0BWPcK2N/E/49Nu438mjlr6SX9KL3TNlQ2ulJf7eg8fSobN8x
 x2WiAOImMBa4KD4CafHnQsaf86PSFGHKwj2qwM8MGBPgnfGLObB0Qpts++v1B1z30AbG
 nF9FftDMwqPVOZZfQ4PUVIprw9dB7kHKhA06jf0uyn8/ryyFFTawgd3COyKYZb6qrPcO
 NG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M5QMppfZuDgdfhY0VXv5q68aTd4Df+CNBzCbSZN2S8w=;
 b=hTgEZt7gVDLXEzLr99D403Gj6BSGJDwXsKNHYG/P+UtmKYA+c+zCWlbTlun44t8vr+
 /CgpqLxvdRk1nqrgxV0sU7Ic7pAf3bDJ6IvDhnQOODXFZExJWsbsY3mTNPQX2PzdpNFB
 wk+vWybHlj+MwoIr1IjsOjdeC9zMDRyABxLmp+M+DgSTVTLvL+XBpqXrW77MQsdqJxet
 kvJFpG91aKFB02ZkGbN6kAvxJi8Z2qNBenbLaT/PmC2iM3VtrCKABGmb8a31BBskgm7U
 /7d2GFlLAr0bqvw3JzEVDoXR62zIy9QRJ0SJTONQ+UElJuPRqVVqf/L3U/YWhOP4ANDY
 KEtg==
X-Gm-Message-State: AOAM531NJcsgNdbsBfilHhsRvZaFwfDHhgGR8MTrRgVpXUcGP+ASW8V6
 YN2/uNyOGyIaJBAy7q37Qcc/pg==
X-Google-Smtp-Source: ABdhPJw5SKY1H3qDP3tXgZ4h+FKG5UQ5LaaWF/qJJvj0+e/IyZFUCgSxEQsHZtPuFq81foMkoXbyog==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr2410347wrt.267.1611599856148; 
 Mon, 25 Jan 2021 10:37:36 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:b4f1:5ee3:5cac:3232?
 ([2a01:e0a:90c:e290:b4f1:5ee3:5cac:3232])
 by smtp.gmail.com with ESMTPSA id a16sm22693468wrr.89.2021.01.25.10.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 10:37:35 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: meson: switch TFLASH_VDD_EN pin to open
 drain on Odroid-C4
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <CGME20210122055227eucas1p1a61e2ec3e562ed13a6b8decb5069c180@eucas1p1.samsung.com>
 <20210122055218.27241-1-m.szyprowski@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3375145a-a9cc-3559-33fc-a0e0b2d5e977@baylibre.com>
Date: Mon, 25 Jan 2021 19:37:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122055218.27241-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_133742_802978_B0BB78F4 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Dongjin Kim <tobetter@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/01/2021 06:52, Marek Szyprowski wrote:
> For the proper reboot Odroid-C4 board requires to switch TFLASH_VDD_EN
> pin to the high impedance mode, otherwise the board is stuck in the
> middle of loading early stages of the bootloader from SD card.
> 
> This can be achieved by using the OPEN_DRAIN flag instead of the
> ACTIVE_HIGH, what will leave the pin in input mode to achieve high state
> (pin has the pull-up) and solve the issue.
> 
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Here is a discussion on u-boot's mailing list that inspired this patch:
> https://lists.denx.de/pipermail/u-boot/2020-December/435295.html
> 
> Changelog:
> v2:
> - fixed typo in the commit message
> 
> v1: https://lore.kernel.org/linux-amlogic/20201218102228.16211-1-m.szyprowski@samsung.com/
> - initial version
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> index cf5a98f0e47c..a712273c905a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> @@ -52,7 +52,7 @@
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
> -		gpio = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> +		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> 

Hi Kevin,

The same fix was pushed on u-boot and solves the issue.

Could you take it for fixes ?

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
