Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F0C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 18:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD022173E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 18:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvgdIA8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BBjwNz6/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD022173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ykfiDcOS/wNzJGzqfefNQZpft9dlCz8fN9So6K72KY=; b=pvgdIA8S2xf3Wz
	PwcDKMTLwkdY2JCfnM8H5MpUjzogJGNigRr3qtJnR3LCxkpT0F/hap0hRgrAG5VCMmb0bn+UHLBaU
	EV9YRe67/VacPV/XWAwwt7Wr3q5/sq4vQ/dKEVVsxjQNo9PX8wH4KKLVciBg/3XLX/sNRr4i+JHQL
	nQmzrXjHviTZTv/rYd/Q1cDFpeSluIzqNiNHFXn2hKQFufnddZUlW3VpaHu8m5bC7XY/7265uXcZD
	Pseo1iaN9uSXtl0vJ2Jr1+zJHVSoNc7XA5YMzIU6zlcgZOH7/ZcDpN8j1jdihHm06+59OmLC3JZJ1
	J7Cd6rsaWYAtx0f1LR8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5E01-0007MG-Oa; Tue, 03 Sep 2019 18:57:53 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Dzn-0007BM-7n; Tue, 03 Sep 2019 18:57:40 +0000
Received: by mail-oi1-x242.google.com with SMTP id t24so13624339oij.13;
 Tue, 03 Sep 2019 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgbHG9a6GXDkb4b1cfc7DWlhQhBIRzQTZmisxCwqGGs=;
 b=BBjwNz6/3fHY8rDgOLaY/yvXdKRFVZYsTKXVNmSCdFQ/dNCCQaIxnHsBYJNXuvGDEO
 f9mhEh0pQsmWCi0WPzFVoH9nnjfu8vXvgOVunnuSyq+JSUS3OZxc3vlh3RbLPsn2uj+g
 83AIFfkIq6703Z9yiKBzkU/OMHLJP2prYdP7/hlMO4e6Tu/3Gd3D61uqMkjjpnOVYAUR
 3GCIBZhbJvtnnIbHiGasPrLYVLFIdACc1YzVDcv3Mt0i43nif1+dwPa4yqT5M/WMMTE1
 y1wckMubmHTCC4MKZZg3F79DWmkhh106OP5dJ7uPM2r3INuheTXdCbR9czXpkNQICRnQ
 vvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgbHG9a6GXDkb4b1cfc7DWlhQhBIRzQTZmisxCwqGGs=;
 b=UWRrvugBMWG+rjX1P/89XSlVGNnbLBKrqYS2X4AdMabnXEVK0jWQnlRjkD12t8oilD
 UzaTBdZeQuEL6Z0N8CN/oSM8EYmK3v19tiGQ4giYBq6xmjVqsqGALIO2U4LIeMb2PXJD
 ermw+zixFRCMkfK2f5qIYuYh322BVwcMyznQtnLRPXaqU66c1W1KS4mGCpU5MYNG1NKv
 sZJYwOYNXmxkqvwJjsVpskP57UHbGBTShlMRM73bLLhIE1qnSxDyap1y7Po2apYNfmWW
 BR4mNFm3N+PG/kSOvj8PQxx/ZYs3rEfPukCHY8A7HmGKKDry3qDM5btzKwPOAomNziw9
 /ZQg==
X-Gm-Message-State: APjAAAX+Fr11MDubl0Sw9yI7/j/ml02mxzF4L6/vIVxe9wzaSTAS6IIu
 rXnJSUryyL1vG+8EX69uDqjyQviByocdGPEOM2w=
X-Google-Smtp-Source: APXvYqwo6lyzOAn9MpdsDInLIzODZQbZKHJLy/aDmR2MVsl116zAO58OI7Yc8xhhDiQfZHa1Jk+N4bjw3Wv9fE7kATU=
X-Received: by 2002:a05:6808:48a:: with SMTP id
 z10mr574467oid.129.1567537054417; 
 Tue, 03 Sep 2019 11:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190902054935.4899-1-linux.amoon@gmail.com>
 <20190902054935.4899-3-linux.amoon@gmail.com>
In-Reply-To: <20190902054935.4899-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Sep 2019 20:57:23 +0200
Message-ID: <CAFBinCCyWn+3unD8Ch-UBRve6jt5FtE9r0dSpKV3izgh1a6URA@mail.gmail.com>
Subject: Re: [PATCHv4-next 2/3] arm64: dts: meson: odroid-c2: Add missing
 linking regulator to usb bus
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_115739_283358_42055370 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 2, 2019 at 7:50 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing linking regulator node to usb bus for power usb devices.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Re-base on linux-next
> Added Ack from Martin.
>
> Changes from previous patch
> [1] https://lore.kernel.org/patchwork/patch/1031243/
> split the changes and add the comments to power source
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 0cb5831d9daf..d4c8b896dd26 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -36,8 +36,15 @@
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
>
> +               /*
> +                * signal name from schematics: PWREN
> +                */
>                 gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
> +               /*
> +                * signal name from sehematics: USB_POWER
nit-pick: should be "schematics"
I hope that Kevin can fix that up when applying

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
