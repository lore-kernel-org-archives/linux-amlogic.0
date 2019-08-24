Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9B7C3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 21:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3582146E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 21:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIfbCjAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ly3Kf0Vw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3582146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5KSt7xe8lPmXpRpamr//G4EbvZVyS5Pw98nEXxQjXg=; b=OIfbCjATj+82s0
	Yp+JaHoyfMONUrq08ZmdfnnzYpsyvPFpMEoBeoeTZjCTeaN8QVzwCN1ktCmcvkGdvBkAE9SwTa93c
	dseVN9pzmKtohTucn9gEAqac3VRcbYW2PQxnnYf6NI7Xs8qWGH0jarZNjbhup/8w7tab6bEzun2PE
	8KI+CYVXYxmLDQGDkpPSV2HsLezvjQpMU2WT9rUs26glXEnrGSdmlHca5M6kUx7Ooq/vAs1IDEGZE
	TDVE3r3BDFzDI9bMD0NpJdZD36Mvyi2yf1zBWEfwshGfJGXghSaTl2pLGWAoMJHP+H/A0ZI9U/F3V
	LgllNbtsekBm+HAAxUlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1dbM-0004Pb-OP; Sat, 24 Aug 2019 21:29:36 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1db4-0004DZ-6O; Sat, 24 Aug 2019 21:29:19 +0000
Received: by mail-ot1-x342.google.com with SMTP id 100so1121924otn.2;
 Sat, 24 Aug 2019 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NeHDDT5xeUM288NKVamfGsJVmVu1XwAAe3AxKH60utQ=;
 b=Ly3Kf0VwR9LsyZVVa+EOsomX2wAFjqIU390PXXa0DK62nLZ7VpXD9zwowzBPiCUpsU
 7vOQLVMMyyTzHyZrdA/epH1UICSqFzTgv6nLgchp/hjQceNFxDd5l4ctmjrFmwEIrWAq
 5PO2uzSBkIyWPsTzqgmxQKtOaWSasqLiHv4jOIKop84uYrOd/9JSIjQjFCYwiOsFu7eQ
 GG8eqns023jFpz+s1KEungiE53ci+4RT9Ze94r7A3fsaO2lIXr1ev1hUaYLzO30do51e
 vg3UcQc/KEZttKjF53nZpt+yHC5s0sSctlG3CTsj0J3WP1S4++a5z36kxS2aEM8hOOak
 ASNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeHDDT5xeUM288NKVamfGsJVmVu1XwAAe3AxKH60utQ=;
 b=HfZUmtJEXeFHiwfeMNrqsvbjR/TkiZi3LhpU5UZk7DLVa8mfHQzuV10NyZbGFpkdtQ
 oJI7bAJKZD/925Cnpg4yqpXvZwPEXUd/uTcBhPeMltYf5iWq/IlPfI8F8gy0Pk+kyo1q
 BYf3hNoxedtms74v6y7cAVQolXFaA2ILo8Dp6qFtz7l3xzZXSueYvQGW1WQInK+Q3jxX
 i0VsJfc4vDnWDUMgZF4HqjJ3PTVnooRM7yvAC4LmMI4/fwrG72jSF/FqNTS0WKP07/6X
 CHDBXrcUcEDzSjgCI4pZIJ+qMvl51+G1qdtykWxYtsHc6MZuEI3w+mmx+UZR7ctqwMib
 Q5cQ==
X-Gm-Message-State: APjAAAUXOw8rROkAQryf7JpPkiP8EKyzZMwR/+Zh2nuGUOQKwtm6NSXi
 PQSxLjFmNnXgG44OVhWIUgGhHCrGcU8paHCnI/k=
X-Google-Smtp-Source: APXvYqwZ4LtTbx1t2uEJ3OH/npfUf1S1SQtV0TTY+uuc+2k/bBVJu0K2vv4Zrs3bIWzAMsVuhirsdW09fdbogEOTKAg=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr9347623ote.98.1566682156724;
 Sat, 24 Aug 2019 14:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
 <1566633850-9421-4-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1566633850-9421-4-git-send-email-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 24 Aug 2019 23:29:05 +0200
Message-ID: <CAFBinCC-ncHtni9-Ve1_eQROTrJg0WPkA_rOi1We7T-uSOyYHg@mail.gmail.com>
Subject: Re: [PATCH v2,
 3/3] arm64: dts: meson-g12b-ugoos-am6: add initial device-tree
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_142918_257351_A4F56188 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Oleg Ivanov <balbes-150@yandex.ru>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

On Sat, Aug 24, 2019 at 10:06 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
> S922X chipset. Hardware specifications:
>
> - 2GB LPDDR4 RAM
> - 16GB eMMC storage
> - 10/100/1000 Base-T Ethernet using External RGMII PHY
> - 802.11 a/b/g/b/ac + BT 5.0 sdio wireless (Ampak 6398S)
> - HDMI 2.0 (4k@60p) video
> - Composite video + 2-channel audio output on 3.5mm jack
> - S/PDIF audio output
> - Aux input
> - 1x USB 3.0
> - 3x USB 2.0
> - 1x micro SD card slot
>
> The device-tree is laregly based on meson-g12b-odroid-n2 but with audio
typo -> largely

[...]
> +       tflash_vdd: regulator-tflash_vdd {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "TFLASH_VDD";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
do we need regulator-always-on here as well, see [0]?

[...]
> +       usb_pwr_en: regulator-usb_pwr_en {
> +               compatible = "regulator-fixed";
> +               regulator-name = "USB_PWR_EN";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               vin-supply = <&vcc_5v>;
> +
> +               /* Connected to the microUSB port power enable */
> +               gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
the photos I found don't show a micro USB port (but 3x USB A 2.0 and
1x USB A 3.0 - just like you mentioned in the patch description)
does this regulator exist?

[...]
> +&ethmac {
> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&external_phy>;
> +       amlogic,tx-delay-ns = <2>;
> +};
is the PHY reset GPIO not wired to GPIOZ_15 like on Odroid-N2 and X96 Max?


Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts?id=dc7f2cb218b5ef65ab3d455a0e62d27e44075203

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
