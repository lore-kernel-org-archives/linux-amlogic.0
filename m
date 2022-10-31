Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1679CFA3740
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad10f1QvjxmofElNpQlJY4/qMhFR1+/BM9rDegfBEFs=; b=0sP5lGDgcGJsV/J1KYI6MxL0Wq
	3u4/b0pE28/lfg3jUd1xLrfBfgjuAbXnkUmm7kNWekPstQWA737m4XHceFbcxOm4a45uyM6XuRpN4
	lE+QB1V7hwzy9Q5cHqkWDCJ7lxEXtTAn5eSh+emeDlNoV2c6BjjhAEV5M1qxxQt/KIwDEvUB7a82t
	vsbCs14PFaTGO9EfZ1Il68YYbjJXe0+o9yPwPNIQTYY1JRfJzX2sOTfxgdnupbRd3THI8zOFGqx5M
	o/Fr5WCrQ5aPSU9rYrJn/6/NQME1FtjycNpKEiPP3YhwqMB40ZD2H23xCM3MsIJ8tiYle56Cqunzl
	VNnPd8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRSM-00AI7f-DO; Mon, 31 Oct 2022 09:51:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRSJ-00AI1t-Fv
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 09:51:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id y16so15124011wrt.12
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VziB7h28RAb/PpCZNcV8L41sOfQewqSOqnvB/DPlrMo=;
        b=dO28zyztaMfCnhKERLsvk0QYXe0sBp7JybCMwIY0BVbTH+mpWjmP9LeJPs79WlFFIp
         LYLXtm6hGkGke0un9gQljjDD7L5Q/A0OGNwWKPLDzoqauQ1uL1DDrB2ZZtuSDrIDmcc4
         u6xGNwTJFh+iRkSjPBREh8fIG+Hyz1vNPPvJkpsQTfB/0CeCE8353e0V+sGe3eptwS87
         7ptg6A+SYniaM56BZag4C1DQv7Z2jTl3KcifeQZUEs7HRXxmpAjVxnPE4lBOkPksM6go
         /TqgTNdSB33qM1s7yQJxcY57LfNDBGcwK16I79T/0eeDqNbh8ixYobtAK5RhNoypphzN
         bimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VziB7h28RAb/PpCZNcV8L41sOfQewqSOqnvB/DPlrMo=;
        b=q63KJl7ht0e1UI3o+2lJonPv45Jg+UkqXvB2YSI1/7UNDvrXtpnudLTz/OJvCRF/Yz
         sZGvu5YX/J8ebcpVqIi+DnNuid4JLEdwqyAzIQrIgLjTAsqyKh+rqwyLPboa98lWNUeK
         cxyhHC2vif/1ZklSGZQmKg0Z4aibCQ39DW8VrusSbdsm958m5PoUYMItb0zlW5EYwXh7
         9hMYZGCeKldbEzeghfovfQWdZIAJOF7EOJsbbhfHaq72okv5XNK6z2J9yA8r7NW8voM+
         fPkn62MkIraMg9LWrVx0sE7jMdL30aDWPT0pEMa5977ch2zCY6BH54JAou0ttH8PKIfB
         ZtNg==
X-Gm-Message-State: ACrzQf14I6NsxomUSl9tcpqvMLDqmWRCrnFz9quhGONJlQGtEM1ROK9j
	9wFpgIimAiRKP+q3IQuO+/AqLw==
X-Google-Smtp-Source: AMsMyM5zls16f0t/jN719mMXfIpntktnGfwljIHwNt266SKMYSnD9UtUjWxGVUVBVWLB1wDySYE1fg==
X-Received: by 2002:a5d:680a:0:b0:236:b797:5d80 with SMTP id w10-20020a5d680a000000b00236b7975d80mr5876999wru.403.1667209899782;
        Mon, 31 Oct 2022 02:51:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:f572:21f0:736:a7ca? ([2a01:e0a:898:f380:f572:21f0:736:a7ca])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b0023677fd2657sm6571659wro.52.2022.10.31.02.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 02:51:39 -0700 (PDT)
Message-ID: <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org>
Date: Mon, 31 Oct 2022 10:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/20] arm64: dts: Update cache properties for amlogic
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Rob.Herring@arm.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20221031091918.531607-1-pierre.gondois@arm.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20221031091918.531607-1-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_025143_590766_DB0F1E52 
X-CRM114-Status: GOOD (  14.12  )
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

Hi,

On 31/10/2022 10:19, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> 
> The recently added init_of_cache_level() function checks
> these properties. Add them if missing.

Is this tied to a bindings change ? Since I'm only in CC to the 02/20 patch,
I don't have the context here.

Neil

> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 1 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 1 +
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 1 +
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 1 +
>   6 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index b4000cf65a9a..d2f7cb4e5375 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -36,6 +36,7 @@ cpu1: cpu@1 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 04f797b5a012..1648e67afbb6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -105,6 +105,7 @@ cpu3: cpu@3 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index fb0ab27d1f64..af23d7968181 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -50,6 +50,7 @@ cpu3: cpu@3 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index ee8fcae9f9f0..9978e619accc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -105,6 +105,7 @@ cpu103: cpu@103 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 023a52005494..e3c12e0be99d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -132,6 +132,7 @@ cpu3: cpu@3 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 80737731af3f..d845eb19d93d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -88,6 +88,7 @@ cpu3: cpu@3 {
>   
>   		l2: l2-cache0 {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
