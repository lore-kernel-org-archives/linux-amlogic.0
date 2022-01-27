Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C10DC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U2ytBrApsLDSt4AHdcZUEr2mDMD+8aJFqfVgDb0luok=; b=G7ojcJDy2hPMkzwsmle4C7exim
	iNX+pNyezGY+r1rWc77z4+JRzgwaeLI53FEW2y5NdKzn4NBdWenBRt36TkWz/LQkZocjUJScltOhx
	FDZjE1OHiikFoGaDZVd5xrwEy+rx+9/8NevZdC8ohgWbyKUYVK+i0TdD/KRbzlyD9XUVV/HictdBg
	JJWvQELirQXPwZ+hM5n3pEpQJUc2nNotcG+STjDgOza6AbeOszwmFdxEfVdDHYDVsS5CLAqXWLmzg
	dtAIu8D1f4UV6zrxN4WDUyvaU2feE2T7FiufH3vpOGsuRy2TQvF8X1wPiy43DB/15itD+QeqrLgXu
	BYTpYR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD4NF-00Fnl4-Kr; Thu, 27 Jan 2022 12:59:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD4N3-00FniY-Sc
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 12:59:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id s9so4614533wrb.6
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=goAS13FfsIswMixhhU7FnHrHF/d//rIXdJjcvNJfBh8=;
 b=xOHBT25R2/N8GX16UDxtFW2KxwjzMw43A/uPabB9GcqRPOIO9x13pPiJbFlsMxZGIc
 Bb/UpNvnFFiKaA82i0Po+oyXd/1n+eEvRHVr2AjhtZPJHPNpjSsedPbGtni5RhOfQZb3
 TdYQXoyDAnaMYLPThpYbpUc1vxbFDvsSFWPC689N7FX1ETFMXC8qEQ1xivV/4UhyZ6KR
 GZ5ttztUPKE12n2R2229ccJmNGjsfGSsY259FWCYj5oFE8/Be939bKWJ28WijXA4/HPv
 5HyvHctTud7INUJJB6rNJbc4/yIMq9XoGNO26SNSr79WBBR7HedIbw9P4+BTlkgeoArR
 VC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=goAS13FfsIswMixhhU7FnHrHF/d//rIXdJjcvNJfBh8=;
 b=g/6SnUCSigEbupsJDbwpkbXI0E+wy9UPHycO1ZUpUt1C8opHk3goya61uOryJnnRvE
 e9P3/O3Q0YAeEONzrkyR1Oel9wkWpUQVmJTcGIzV7ql/XuieJroZ22N+6tNs0RuyJ4NU
 kOsJtlxFoNrkWEBg82mr29Vj56A4xcvX2JRglNAk2RtvRd2W6KPkaN2keqBmhvj5iFju
 kWBqq6MTcsHr2O5Q4SskmLawxfFkmAmRT4JPsjOHOCSat0bTIRlI1kqkqHhv/qWl7b6g
 AmxBFVPtaDX/EbuL3SfQXd3iQMhoF7YEOxZKz+Az5YHQ2T5KAem+Af2vbNqt3cNwfnf5
 K8Rg==
X-Gm-Message-State: AOAM532HnOaE5pB9ZxKNmIkZTYRONCTWOuKSRa8WkFRykbdaQsmPQ6JH
 GaF8E2AM10gO+F0cAQQyiOtOjQ==
X-Google-Smtp-Source: ABdhPJwF0/lm3OD969oVAnjhwbzTL7tcqIA9l1PfpN/YK36p3CPP8/bYLvFn9nuKtkh2mcycBjDegw==
X-Received: by 2002:adf:ffd0:: with SMTP id x16mr2774150wrs.489.1643288361219; 
 Thu, 27 Jan 2022 04:59:21 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id z13sm2389547wrm.90.2022.01.27.04.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:59:20 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
To: Dongjin Kim <tobetter@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <YfKQJejh0bfGYvof@anyang>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <51093ba3-b562-d2de-07ef-e4af8dfdffac@baylibre.com>
Date: Thu, 27 Jan 2022 13:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YfKQJejh0bfGYvof@anyang>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_045925_941582_04FF4B93 
X-CRM114-Status: GOOD (  14.84  )
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

On 27/01/2022 13:29, Dongjin Kim wrote:
> Typo in audio amplifier node, dioo2133 -> dio2133
>

Fixes: ef599f5f3e10 ("arm64: dts: meson: convert ODROID-N2 to dtsi")
Fixes: 67d141c1f8e6 ("arm64: dts: meson: odroid-n2: add jack audio output support")

> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index aa5898a58b89..120f2551a28b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -22,7 +22,7 @@ aliases {
>  		spi0 = &spicc0;
>  	};
>  
> -	dioo2133: audio-amplifier-0 {
> +	dio2133: audio-amplifier-0 {
>  		compatible = "simple-audio-amplifier";
>  		enable-gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
>  		VCC-supply = <&vcc_5v>;
> @@ -222,7 +222,7 @@ sound {
>  		audio-widgets = "Line", "Lineout";
>  		audio-aux-devs = <&tdmout_b>, <&tdmout_c>, <&tdmin_a>,
>  				 <&tdmin_b>, <&tdmin_c>, <&tdmin_lb>,
> -				 <&dioo2133>;
> +				 <&dio2133>;
>  		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>  				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
