Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9DBECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Srn78f8U7WbypHR45Q6Yp+cNT4s1iCiQv51Yx30PW7I=; b=KDiwzJA2pnxuSa
	pQdcbpKtN8HjT5Cqrhk7cPyHcKjZMtwfENYrIGPpfKMPTkNBDf9iEYnGLC/Xeu6AlzsFKF+HuvHHR
	GT1y8nH4BGsilRvgPXJlBiQGt/xVqiKMCGjmFdKCl63ipflN/yKNA55aW7HQxxouNuX23DgHTX3An
	CehyFANyendklLb0PMQra3mem9M/Sm237DnWgEtHVpxDuCVJj7pYS3kuEm03wdG6PJ5zBBos+1ICi
	kVFs6Eg8S3XwR8ThjVpiuJ7SYFhmyuk9O+HIgvqaiJGefeCPKYxSEy+WmxApA4YDphYAxQhGMsByb
	BQZxwx56BTtgAkWgp6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV70c-00DskN-Rd; Mon, 05 Sep 2022 07:59:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6LS-00D6jv-RU
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 07:16:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so6420304wmk.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=OpQqWL8WvGzI83++gnFzgrRYABYCTMP3dKLDI17AllA=;
        b=t+KraOsZb8QLSYN2xE+n+kuux3MLwiZEohl+B7PwFQlv1ii2NdiuQ5N0xAZvAphpr2
         QF77nBOs2cGaMzIzDxSyxEncO0639tatQRfu8LbvYqkb0FB0n5Gxg5BOQGQhAn6B2LkX
         GuyrFfaP86UXBUcXRk96wlJuRtIvlb75gW/g9Hrij6pH+BUZ/zyNxCc7JJ5qooHgIJZR
         xgEaVR1deyYKk+75eJCxuM2TMvOBkp3NYkFana/WdiBK0Xw/NghHyFPK2r9gvs0zowMn
         rF7RVXW1cOSbaH2iGkl6KwNesKtK9iQ55wS8/4vDz6Q3ZhXFtLXpsPTjYIWFN/CPd8Oz
         j6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=OpQqWL8WvGzI83++gnFzgrRYABYCTMP3dKLDI17AllA=;
        b=kYDbRJEsQ1SWGOVuMX2t79x8dDU+1AyuO79JIIMAaq7NLn6cy7wJp2OW1GX6vF/Om4
         qCGozfZN5UVdjPL8gaVMKAJ4SqzJdVLqiwn/smH/5Zw/ETcF+3HtVudAxT9xmrbMyg8U
         xW4Nd+AI6mrEpU6jFI8qBN9EnW8LFNce8qubIR0wFZMtpnHvw3Syt4al+mKXkOkNmIC/
         EkVTOuRM7YV9E/39PgHNQO4i2dYaR4lhJbgctrEcsoD5f4E8z23jtcrMpPao5sW/tGM2
         Tnd8bzPCPFcSc805/81XoslvEYE2eNVEWhXWH24Nu2ka0Zz+Rcb8knZOBgpKidD3+8hv
         tmlQ==
X-Gm-Message-State: ACgBeo2OiK6c5RC9iKxLLc2F/6kPbo7AYA+SUNVA/OaqYi98Y7ZZtz+z
	F6asx4OLLfXCPV7GWqJg8PTz/A==
X-Google-Smtp-Source: AA6agR5YENFPKSSDPhkvVU7fdBOJYL4EKvRTv/FKMghakW/GuaHJEZ8YMPpu5YrIDMGTcjZObagZdg==
X-Received: by 2002:a05:600c:1c19:b0:3a5:a3c7:3800 with SMTP id j25-20020a05600c1c1900b003a5a3c73800mr10152570wms.69.1662362191945;
        Mon, 05 Sep 2022 00:16:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id h21-20020a05600c351500b003a502c23f2asm17310702wmq.16.2022.09.05.00.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 00:16:31 -0700 (PDT)
Message-ID: <35c2cf9f-ef18-f735-9869-0b70dc1e860b@baylibre.com>
Date: Mon, 5 Sep 2022 09:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 4/4] arm64: dts: meson: Add DDR PMU node
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220901024526.2833232-1-jiucheng.xu@amlogic.com>
 <20220901024526.2833232-4-jiucheng.xu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220901024526.2833232-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_001634_967853_065594C5 
X-CRM114-Status: GOOD (  14.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/09/2022 04:45, Jiucheng Xu wrote:
> Add DDR PMU device node for G12 series SoC
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v6 -> v5:
>    - No change
> 
> Changes v5 -> v4:
>    - Split reg into two items
>    - Alphabet order location
> 
> Changes v3 -> v4:
>    - No change
> 
> Changes v2 -> v3:
>    - No change
> 
> Changes v1 -> v2:
>    - Remove model, dmc_nr, chann_nr properties
>    - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
>      identifier
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
>   4 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..9dbd50820b1c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1705,6 +1705,12 @@ internal_ephy: ethernet_phy@8 {
>   			};
>   		};
>   
> +		pmu: pmu@ff638000 {
> +			reg = <0x0 0xff638000 0x0 0x100>,
> +			      <0x0 0xff638c00 0x0 0x100>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>   		aobus: bus@ff800000 {
>   			compatible = "simple-bus";
>   			reg = <0x0 0xff800000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index fb0ab27d1f64..0e8b57283f31 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -133,3 +133,7 @@ map1 {
>   		};
>   	};
>   };
> +
> +&pmu {
> +	compatible = "amlogic,g12a-ddr-pmu";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index ee8fcae9f9f0..18791ef51f58 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -139,3 +139,7 @@ map1 {
>   &mali {
>   	dma-coherent;
>   };
> +
> +&pmu {
> +	compatible = "amlogic,g12b-ddr-pmu";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 80737731af3f..c307b34ccd72 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -520,6 +520,10 @@ &pcie {
>   	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
>   };
>   
> +&pmu {
> +	compatible = "amlogic,sm1-ddr-pmu";
> +};
> +
>   &pwrc {
>   	compatible = "amlogic,meson-sm1-pwrc";
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
