Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27267C25B08
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlwW0cl92sDrPDdH3QGFcs7tKM1F46yolLlvhZH1jyE=; b=jJIZuR6GJVnA8j
	H6d4k8n9/Re2NM5J2NzWkWuFUtoeFFlA9IYCYG0LnaOlSHGLJRdDEoX1dtBsnPDNjqtq1rlwYnbQt
	mVbq2MedJArt8iIx7rWbbtJUCsUFgKZd6hddxiPFIr5ODK2YzWbVbWfjr0Llos7X3g/ROwrKXJ2Oe
	HsBWXf4rNfgQeXPrgHygBcTC5QXyugYCjlqr+eejhBf4EEXXuav7Kko/rXCelTvoBcvB9g1sxYuWy
	qIS5phQEnP/ZK2Dz9r8Y8jidch5hvwAH0/mjlku4oa7OkupQnoT1jLeQIOlXpyfx545pbNzhzkoQf
	XaDn8gR2d1FhvBZi9VNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsbg-00D8Kk-Vt; Fri, 05 Aug 2022 08:22:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsbU-00D8FG-Og
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 08:22:48 +0000
Received: by mail-lj1-x236.google.com with SMTP id w15so2317637ljw.1
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1LJkG8nBPlONg+x2ajiEWGYMKRAAVhUFaBW+yRjYWwg=;
        b=VE7n5YEEOa/h0CyMrnEPdxz2csLw4AH7Q2IY4fzE2wNIzl9m5aWXDCKCG0E79/l6Cu
         dt0JrNlzdJu6Pnb8inJYmBf/mWcPtrZlbOD5KAlrIoDbN8vjxjkCCgC3wsfWKWHw1Src
         YuzQcDSrraqDXLo5IY8Q66Z2DQQcQKbGD0lWlTWTsobBWK5+UJXdIkK2UMJShjiKzVKP
         d3ldbpv0gGslMewtbyKKLi+HymEO9VzGTui9I/O7JxsrDs9y/oy2Ezh6tIrEqZj1F826
         kC61je8BYT8rg35iQwhX9xV3Emg4bog8WeY3ws/6tHV+n98X+QXWHCAdSS9LmCc5TEld
         oRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1LJkG8nBPlONg+x2ajiEWGYMKRAAVhUFaBW+yRjYWwg=;
        b=V4VIuEsJdYpG+WJaW7lP5QM+En9+ClYg7/iTK4XIGB96EOYOpYtxmwOzJ6CJLtqktV
         wx3j+Bp87uc7HWZq1+AONSxznZ+ZLMoq6MwbMXRuD84t9P7UKlKPzX5FxlaTKZGhjSJu
         zWTW2qnQjfoliDjcy0pYX92bksmfkJ/yldyOI2r4/XuN+LXmPATg0AU46L5+gE1U6Q/e
         VPRXXmtkl0CjALVexRY48mt5NOHh/7TdmetkTFsq6FRyD7f+GDRic9GGcjgn0U6CEbTg
         a47jLsAWlRTXhA/XYSWnR5Kn2VLFnL4OPASrrGMzAxFdhKOdINvKaZlnyrK1jFwkFuPg
         ITBA==
X-Gm-Message-State: ACgBeo3AFSxIix0z8T9Kro4Wwtn80EGdM+Qy9NyceS7q5WWguBBDCpr9
	yj5VRuXBO3C1uABctaT9Yw+uew==
X-Google-Smtp-Source: AA6agR7Ea9geoQMbksv44W2F3UjwGOSjIA1BDHbmoxPxU7bOoaGRaiHypXeMwUPEiZCLYO+nt0xYEQ==
X-Received: by 2002:a05:651c:3d9:b0:25e:505f:2355 with SMTP id f25-20020a05651c03d900b0025e505f2355mr1843178ljp.453.1659687760949;
        Fri, 05 Aug 2022 01:22:40 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512314f00b0048aea84fa80sm392189lfi.87.2022.08.05.01.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 01:22:40 -0700 (PDT)
Message-ID: <e963157e-5ff0-f0c1-2299-50528cf291c3@linaro.org>
Date: Fri, 5 Aug 2022 10:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/4] arm64: dts: meson: Add DDR PMU node
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-3-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805071426.2598818-3-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_012244_857835_AE0A279F 
X-CRM114-Status: GOOD (  14.65  )
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

On 05/08/2022 09:14, Jiucheng Xu wrote:
> Add DDR PMU device node for G12 series SoC
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v3 -> v4:
>   - No change
> 
> Changes v2 -> v3:
>   - No change
> 
> Changes v1 -> v2:
>   - Remove model, dmc_nr, chann_nr properties
>   - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
>     identifier
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
>  4 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..7e556fe575be 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2146,6 +2146,13 @@ hdmi_tx_out: endpoint {
>  			};
>  		};
>  
> +		ddr_pmu: ddr_pmu@ff638000 {

No underscores in node names.

Node names should be generic, so pmu.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "amlogic,g12-ddr-pmu";
> +			reg = <0x0 0xff638000 0x0 0x100
> +			       0x0 0xff638c00 0x0 0x100>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		gic: interrupt-controller@ffc01000 {
>  			compatible = "arm,gic-400";
>  			reg = <0x0 0xffc01000 0 0x1000>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index fb0ab27d1f64..4a32e081e70e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -133,3 +133,7 @@ map1 {
>  		};
>  	};
>  };
> +
> +&ddr_pmu {
> +	compatible = "amlogic,g12a-ddr-pmu";
> +};

Adding nodes at the end causes conflicts. They should be added in some
order...

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
