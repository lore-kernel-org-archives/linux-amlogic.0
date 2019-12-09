Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CBEC2D0D8
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EC720721
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmTmJmEF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mUW88DZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EC720721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JceTc/ReNslNOwhTlvkx8PZjehI214mnXY3Gv9mhXSU=; b=nmTmJmEFr02gD0
	h9PouCAZagMA3XLVKCN8UI4Zzd/Dzosfa2fQBFm7Ibdg2FufudJzca5QSwAwmPwuNjMnuFc10hR6b
	px6G3AqV3M9SQC/3QWt/U4qwqySrnKupGTFXe1+Hqeu9GHes5q9pQHo6wOyXfRxHjI7fusy9fGy1V
	S08lk/vXUgyYmU5mg7euPguUOOdw2gryIcjKoC15MVF2XlQoY6aNQCp0Pu5/DP1WOsBagZ3HffCeM
	baoCBdA+7PHmR0iXnU2SqB71NVt+bEttR+JUDswiOrMVQjkNeOW7UqjdHH5KQmpYvRncqyVxwM2zj
	gsudb1LTqKLKL9WwhohA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRvE-0005lZ-Aq; Mon, 09 Dec 2019 22:54:32 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRv2-0005YG-Ty
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:54:22 +0000
Received: by mail-pj1-x1043.google.com with SMTP id w23so6530574pjd.2
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GZbS2xfEltGE7F6nx/Sqk3zKGRtEeNKmrbNzg2JwiAc=;
 b=mUW88DZZcUm77HMOxXwdlW6E09GhqoZdMi73UXyZvqXuxha8a/66J2NeEmajC50CRk
 uppHSqsk6KZHN5slwK1hx8E1lS59JSJvffgtzvzQCCxoXvGEDs9g6yOrYKjrRQc0U2VJ
 F14XddSIXzsYYLvZsaRRw8i6eGlXsRTa8DVQOtQgFAg4WGiZIXhzticlJkngYIiqZUiS
 zYvyRcJUcIUxVNQf3PvH7XVTAVQq++X8LmuBCfi53vTg7GhZ2oC5qsbIOHt1PGov85IV
 P+2JlSX9fuav7dYzPqKnHewt2fbwfzjZ+dAb5juXdJEkLzYajGr6Yer6SwKDajIRbAit
 eEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GZbS2xfEltGE7F6nx/Sqk3zKGRtEeNKmrbNzg2JwiAc=;
 b=pPYzMdyr0KOC/jSENTrI7Y1m88/WpcU8fLyS4Gg5a0yGGSz/8zXwKoJUpYfjh0scRc
 vREQ1Mc0UvJCuyPuOHu5q6bmGh2JFRdBPq5HuR5n5GHzu5xrT8Y7aHenV7tsMR5yqzq8
 8sX9nYLGfZevQ90in+AX/JxeVybHHvRFbo0Tzl3I1al4IdAf+ZcpzNGJkJaaxsxXz8uc
 1+dpfCWNC2m9xOvNSaX3GGCmf9ARHJhGFqVUCYqLDR5vxTLWNItJgJGpINnyvcj/86BF
 XKyMrDkWdmCfmK5p3kztmRPCY9giMlQUHTcdZnWYrU/bVbmbnwpvWlMI/ZAznJN8sMAk
 3htw==
X-Gm-Message-State: APjAAAU0BP8lCCp4Xb+su5maEyC+vt8NAOPS3gyV+WCulq6sP55ln2pR
 C2T/jQhZ2xrLKvkCBu/pmm3vQg==
X-Google-Smtp-Source: APXvYqwNJMLkK5JvNCFW6hNtE0esgiRwTzkpNVJU4zltb0IL3k5qCFuUjWhWC1FqrZ+fqHmQWyHuQg==
X-Received: by 2002:a17:902:d883:: with SMTP id
 b3mr1804416plz.231.1575932059858; 
 Mon, 09 Dec 2019 14:54:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a25sm499720pfo.116.2019.12.09.14.54.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:54:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <20191202111253.94872-1-jian.hu@amlogic.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
Date: Mon, 09 Dec 2019 14:54:18 -0800
Message-ID: <7hsgltqfdx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_145420_974498_92703190 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jian,

Jian Hu <jian.hu@amlogic.com> writes:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG.The I2C nodes
> depend on pinmux and clock controller.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index eab2ecd36aa8..d0a73d953f5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -16,6 +16,13 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -117,6 +124,46 @@
>  				};
>  			};
>  
> +			i2c0: i2c@1400 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x1400 0x0 0x24>;

The AXG DT files use 0x20 for the length.  You are using 0x24.  I don't
see any additional registers added to the driver, so this doesn't look right.

> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@5c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x5c00 0x0 0x24>;
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@6800 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6800 0x0 0x24>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@6c00 {
> +				compatible = "amlogic,meson-axg-i2c";
> +				reg = <0x0 0x6c00 0x0 0x24>;
> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
> +				status = "disabled";
> +			};
> +
>  			uart_AO: serial@1c00 {
>  				compatible = "amlogic,meson-gx-uart",
>  					     "amlogic,meson-ao-uart";
> @@ -171,3 +218,105 @@
>  		#clock-cells = <0>;
>  	};
>  };
> +
> +&periphs_pinctrl {
> +	i2c0_f11_pins:i2c0-f11 {
> +		mux {
> +			groups = "i2c0_sck_f11",
> +				"i2c0_sda_f12";
> +			function = "i2c0";
> +			bias-pull-up;
> +			drive-strength-microamp = <3000>;

Can you also add some comment to the changelog about the need for
drive-strength compared to AXG.

> +		};
> +	};

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
