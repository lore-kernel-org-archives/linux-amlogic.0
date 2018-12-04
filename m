Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93CAC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 19:53:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA1232082B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 19:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtw0kjsN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0BrZdJgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA1232082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o02tD9mSVXpDTe0gzXKB60akakOnU2dDWdJXAZb7iq8=; b=qtw0kjsNumXX1v
	U/aETKne2otQmFf/sBtSevWRV82z2oYKS+i0Xdrc9MFHu2u5S9Eq4GY+Kk9SnY1iLlSYx/JelpcjY
	p4NjGQ1bXbdgl7p/1YePmYkkynUq1e2Ks4vVT5860uymUVOdwHrR9rIwCsHdOXv/goq32PS2l0BkO
	jOMUnIaKqn7Tets/rXhTo6RhCPzmSd8DGP+ycyBiL6uiTyl3J9n7ZikRvwl9FGVe9LxELFI+HHOJS
	7BqXVwSO+lGndKI3smvdJVJ6Ghiy7Ik+1r8xlkNtPE0d/amrG0OYyrfg1UQkYRmDt4vozR/X4wkgC
	Iz28OXcJAVG55cYJ9PVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUGkh-0005bq-RF; Tue, 04 Dec 2018 19:53:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUGkd-0005b4-S4
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 19:53:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so10558591wmd.2
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 11:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:subject:references
 :in-reply-to:content-transfer-encoding;
 bh=3xd1Bg6itxV2aJ5QBPr+TjLD9YHOJAmHH09WUH85rfA=;
 b=0BrZdJgFtcSqJ2jctmdnZO+eX03Uiio0rIUDX5aKg4G5qZZjh13jWNEwhq7QHdtHkS
 8yWUqIJ6bnLMSraKfXzhZebuqj7gt7q/p9nY+i7B9uibQ5K6vRXZPknGA9Fv0iuXuxOa
 b0Hb0rSwbIo/8/pYz0aferaeeYr+S7DJjpZvn+26EXAniZlDiJlk2vO1w6d+mMtoEiqo
 BgDlNFIyqR7WP2pAGNBfl8mZHP10nuvX8meNmE+lNgqVIOY9WXa8Ad4w9E4aUBKRSYh+
 1+9XkzA6GiE34hdYZIQBFC3lWJ048ByLAeCr025zlc7vEam8ge3XGX20o2VF85OWLzCt
 kcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :subject:references:in-reply-to:content-transfer-encoding;
 bh=3xd1Bg6itxV2aJ5QBPr+TjLD9YHOJAmHH09WUH85rfA=;
 b=k2wYQFVOUYz+deahk+1JWTduvuuXNWxGAYpcgN5acbxT7Bl18hPL5QgnwAuLB4MFMJ
 eAhL472t4owCGQoFBsQhphjjKwVr1WGLafbV5SS1GgbBAHjlZ50PitHimHhXBeflZhu9
 fQ50/rivAF+GsGOYTfBZCo4SSETh0vaRW5DUR6rWVoQ+l7qLbd3WUnaYZtqo7gyFp29B
 YCz0BKsANKlz/GfwLxh8M5CKDhyrr52BjLkoBeDoA7t1JDCnEXyx/ACRjowodCIP7MIY
 WpOXX34qYLN4t8Gje2u0siM3Gy/+iqwyG06v9dpeSholjAJYqyBHvZ3wKUA6SoNbV6LC
 /KBg==
X-Gm-Message-State: AA+aEWa1qDBRxZ8GppDBoKr4zWb8iRPDuL/7IvW2Rllx1vkIkjHexvJj
 1moyYqaqn3x/1+Xo5jzF75vq7w==
X-Google-Smtp-Source: AFSGD/UMfOxBoy8H0Z1CxMymZZ9V9NFEb5PwSviNV9EOdrbwBtiDYPGkAeygdu+kpg12cFrdQIHBZQ==
X-Received: by 2002:a1c:d988:: with SMTP id q130mr14238437wmg.41.1543953167753; 
 Tue, 04 Dec 2018 11:52:47 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:cb1d:4ce:ea00:457b:c7f4:7108:f8c4])
 by smtp.gmail.com with ESMTPSA id v19sm25411386wrd.46.2018.12.04.11.52.46
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Dec 2018 11:52:47 -0800 (PST)
Message-ID: <5C06DB0D.3010306@baylibre.com>
Date: Tue, 04 Dec 2018 20:52:45 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <20181204160447.27869-2-ccaione@baylibre.com>
In-Reply-To: <20181204160447.27869-2-ccaione@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_115259_906578_A22DB894 
X-CRM114-Status: GOOD (  16.15  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Carlo,

Le 04/12/2018 17:04, Carlo Caione a =E9crit :
> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
> =

> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.

This is a good news !

Kevin,
What's the best procedure here to make it apply on the 4.19, 4.14 and 4.9 s=
table
trees ? for 4.14 and 4.9 it will need to be reworked to apply correctly.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

> =

> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm/boot/dts/meson.dtsi               | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 0d9faf1a51ea..a86b89086334 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -263,7 +263,7 @@
>  			compatible =3D "amlogic,meson6-dwmac", "snps,dwmac";
>  			reg =3D <0xc9410000 0x10000
>  			       0xc1108108 0x4>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			status =3D "disabled";
>  		};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot=
/dts/amlogic/meson-axg.dtsi
> index df017dbd2e57..b1a42e99cb67 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -143,7 +143,7 @@
>  			compatible =3D "amlogic,meson-axg-dwmac", "snps,dwmac";
>  			reg =3D <0x0 0xff3f0000 0x0 0x10000
>  			       0x0 0xff634540 0x0 0x8>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			clocks =3D <&clkc CLKID_ETH>,
>  				 <&clkc CLKID_FCLK_DIV2>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-gx.dtsi
> index f1e5cdbade5e..58e6bcaac1d8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -462,7 +462,7 @@
>  			compatible =3D "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", =
"snps,dwmac";
>  			reg =3D <0x0 0xc9410000 0x0 0x10000
>  			       0x0 0xc8834540 0x0 0x4>;
> -			interrupts =3D <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "macirq";
>  			status =3D "disabled";
>  		};
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
