Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EDEC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wd1snJrSfu22A3gOfS5VEuTBCazTIZ2wp1SScTKz5U=; b=uSz8wCYzzV+9w7r7vXOtedQEM/
	3GV1pY0IrhNpRPRiGXuHfR2VEMz0/v7Y9F/7MR+41szrq1pFqRmCjdKitVhIUDXrylg/rpvkNETCW
	ojfSQ9J+V1A1xyYWe6m1gGNi+PBDi5Oj0Oi+6mkQogaOGIEqByJWVaW8lY9mv//nATn3ykLruFRVf
	Vl93R9wE6Or7Z0ADetFWts9D/Gui9IwM5v5FxiqC6bF9OtRuqjXZ7SJJ/4PpMdy0dCRLPe5qwDrt/
	WLzH4QYRK5t9bPNHduKx8ZqMl67JNygtJceKtc8EjpoCqhqNlop9puuBHybNR/BsGFgme4Ha1qnGa
	uXBXcmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsKC-0087Fn-C9; Fri, 21 Oct 2022 13:44:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsJy-00872m-S9
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:44:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v1so4861757wrt.11
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZpaxMvmEuJPF3OgoDpXULb0R5XqV+uhtln4+RAmmd8=;
        b=HOny0ruFI9g5TTzJ5ZH5qvGL6+UqA9BmO6SUTjvo8lyGP84OduwmM3imoX5TfLfQpX
         ErIPWwPwtiBgh5+cGpZS4bF5gzGh7q4mp3WyPs05jgxYtWDaNdoTT/2RJl3Ma7kZkKeS
         NURZRhHE7c0nbQqwVRSImTCopAdiYUQdWHovO/cJNQtOmeviI63EKOhJFOiZz4XPq8hT
         L5tlfCsV4MNt4gIcoW+NcpqdQMjlmMK/cDQ2SgL+L4FmTvmOtkw9MoR5doYjmgnTSB7W
         l+mBUrZgtjW38JdnhIB4wA/uCMpvxiW68VCkV/I/cmccE3nItp3GMRryTteLFGrfPvP1
         yt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZpaxMvmEuJPF3OgoDpXULb0R5XqV+uhtln4+RAmmd8=;
        b=FtRyqpC+ejJESEpIaI/oMLIA8Cj6NBwudn7wEVRfYDUWVsOm5IDwh7vKCM0UBFmx0M
         QyfUK+m17gJengplmmqmKKdyTxBWAK1Iab2N1KLqUHktkMG4Gt4Wf/etM5Lr/w8b7GHs
         D16+6Kk4V7zrE5wgZz1MQXEo6TvCo8VimyJRzAUejDizmD/7+8V0oWYWpzk7vhwx6DFO
         JNtgVG0Tji77CTGgRYNu1ZzVzCKCCA6XILQLouJYQzHd5iudmV6KBnAWbsANWtsnA47E
         +tZoijfjjJvqPdxCAZe//OhJA9qUwKAs/J5+sYQxlbINX9BxNaspB5FNxf7NiMiGYx8/
         2bMw==
X-Gm-Message-State: ACrzQf3UsRdPMSWU/ByhJBY63FoIRW4oHz+tfPX00QMb1yijKq/WoLwb
	AkeN8pEh6faxa3BljN+gpvdXlvJyTHDlfaXw
X-Google-Smtp-Source: AMsMyM4nd+8JiG4Qbt3OaJ5WL7VTFhfdy3U2bhmHB12MxhIYrGqcodjTvuokWPVyjHYedie2uggWdQ==
X-Received: by 2002:a5d:584a:0:b0:231:636c:de28 with SMTP id i10-20020a5d584a000000b00231636cde28mr12412891wrf.175.1666359857728;
        Fri, 21 Oct 2022 06:44:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050? ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b0022a9246c853sm19016553wrt.41.2022.10.21.06.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:44:17 -0700 (PDT)
Message-ID: <3bc7dfc1-3e26-926f-f55e-bc9e6531e04b@linaro.org>
Date: Fri, 21 Oct 2022 15:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: meson-gxbb: add SPI pinctrl nodes for
 CLK
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
 <20221004-up-aml-fix-spi-v4-4-0342d8e10c49@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221004-up-aml-fix-spi-v4-4-0342d8e10c49@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_064422_938621_EA31CFDF 
X-CRM114-Status: GOOD (  11.82  )
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

On 21/10/2022 15:31, Amjad Ouled-Ameur wrote:
> Add SPICC Controller pin nodes for CLK line when idle for Amlogic GXBB
> SoCs.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 7c029f552a23..923d2d8bbb9c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -427,6 +427,20 @@ mux {
>   			};
>   		};
>   
> +		spi_idle_high_pins: spi-idle-high-pins {
> +			mux {
> +				groups = "spi_sclk";
> +				bias-pull-up;
> +			};
> +		};
> +
> +		spi_idle_low_pins: spi-idle-low-pins {
> +			mux {
> +				groups = "spi_sclk";
> +				bias-pull-down;
> +			};
> +		};
> +
>   		spi_ss0_pins: spi-ss0 {
>   			mux {
>   				groups = "spi_ss0";
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
