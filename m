Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542F9C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPSxn77LhdUkuiV8ohs9GoBxJ+gr6gsheDGX9lFCtIA=; b=mop5asumFmaZ0PPAYGVeRnVpBG
	K+A/l5fYOnnhcq/upKm7igN719Wwhqg+GGk4XnzkL8ay6Sw1As1YUsucNd1BLvcR/6EMwF+DO/6zu
	KTjUh7zfaJOJzm9lGC9lJkB3DQn/u0/K1TYRjVVWC1prg1cQCJ5dhhaQaqcOdTKOp/Jj7z8B3dudK
	TN4FvHYpHfKFhVDjGhGmeSHk7RyLD0lJsbAsxwnRoF2mSyxhUonoT0pk/O8fFjelyMWLJyw0hX7DH
	RgroOFwrsj7+DF8pMCMiLLbGdcK3Lf+W7IvEIvTVjdm525fPNy8I/w1THQxyrT8duvEd4Qb4H/DI4
	tm0/lGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsY6-00GPbe-7r; Mon, 23 Jan 2023 08:51:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsXy-00GPXp-22
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 08:51:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id t5so10078062wrq.1
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 00:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=22HbhFCoP/frzw0LVOteI3i5o4+fgnftSyLobiyZhNE=;
        b=eoShBrh/9aB0bPJOSCkRoDde/OWXqyhD5G0g66X73uztztr4wIWSQHk+G/M1MkVdbm
         g4X0B3an1wNMhxFqzo42yVy22m0jGXQTezsYcf9uYuP3hac7gLc6MVwMdw9Fx6VfmXAo
         SvbIKdW9mRQ4MlPXpYVzVAQDIrsRb1ABVOcsC20fpdijc8YpfQYRX/OqhWV6ZkGxNDFl
         u0N06Mx8Ib1FFU4QZ90moGpu2KyayhwcHejtmkX9/UGC3loe59U+S0lq2u8gjMtIdskP
         wLLG/+ABG+pbQ2q0+1JGu66kxOcaGt0+dpp5NN5ODR9mhEFV6UCwdmAR36QHgvMOfN6z
         XFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22HbhFCoP/frzw0LVOteI3i5o4+fgnftSyLobiyZhNE=;
        b=2kxobm691cVQaXnVtJvJopkeEvMSJLFBCOtZNvy+v+DCJvXQarzJ5dLDW5sjQ8wIyy
         +Co8zKR7mEYZM7kw+eShwjRQYafxwPsgPvK1EIRJyGQwpvkIEe+jwST20g6FKqpGeSVa
         lYDdVDXOUbfXzA2y/+gcDVFOLV0DTVSeP4VtoRzwzHKR0p26VqbXsUeWlXxneqnb6eQc
         banVd8Hr/rsFT5fIdOwfezSNjdidQ6XtN6NG8KxRxAXt1xWvYfRILVLGTo9ClcLksCNv
         hU6IOSDp7BuoB5Y7wElxBWKd07SJ34FL1jAe5mvQoevX01JHbSiKZoE41T35eTpGtUkg
         VPUw==
X-Gm-Message-State: AFqh2kqGXHC736dS+4cNr8OJb6b72P5utirBibiCQbYSc9SyvxoPbCa4
	TjAWKwude/Kj86ihLYlC5sXXpg==
X-Google-Smtp-Source: AMrXdXsAepFLtbRVd+PBmYG7G51lmeEvUiXA6wUuX0LKhS3sXpHPXAq6vL/HS4qOr8J52dS23f7KDw==
X-Received: by 2002:adf:de04:0:b0:2a9:89e:2b53 with SMTP id b4-20020adfde04000000b002a9089e2b53mr20177577wrm.45.1674463877565;
        Mon, 23 Jan 2023 00:51:17 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600018ab00b002be2279f100sm17261066wri.96.2023.01.23.00.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:51:17 -0800 (PST)
Message-ID: <5e7bd89e-36a5-d52a-382b-16ee28cc937f@linaro.org>
Date: Mon, 23 Jan 2023 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: meson: add Broadcom WiFi to P212 dtsi
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
 <20230123065504.2669769-2-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230123065504.2669769-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_005122_120359_680269F7 
X-CRM114-Status: GOOD (  12.92  )
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

On 23/01/2023 07:55, Christian Hewitt wrote:
> The P212 has a combined WiFi/BT module. The BT side is already enabled
> in the dtsi but the WiFi side is not. Let's enable the WiFi module.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> index 05cb2f5e5c36..7055057d7942 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> @@ -125,6 +125,11 @@ &sd_emmc_a {
>   
>   	vmmc-supply = <&vddao_3v3>;
>   	vqmmc-supply = <&vddio_boot>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
>   };
>   
>   /* SD card */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
