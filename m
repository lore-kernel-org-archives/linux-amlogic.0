Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD336C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUep9URhxY7PvrLxklA9wTVu7n8/SUN0KaRVNd4sBO0=; b=2xHIoB4S5ZsVbR
	HdDn72BQpp905J9ermiZ5eUs7bvoeyLzcEQ4TEqC8TXdsovhVLkkclcTtWbnhG1stroHTWjkBAPRl
	EyRGMc14WUPAhu9PVCy6r2t+z1lgmCQPHcRoKqUD1X0z0Qi4AagHVg8I1N9Va//Zj9ljg5n27AQEH
	walNWxvEVbiy6DOWDbKy2CnDG8QK301DWfBA9NyPkTMYbW2vcMsQN6vU8f6i2vmQWa4NbeP65tw3k
	9s/4htJk7/7cXjUbUSwMAVx2EsITeHadKnNzM1inVopgkkefkVaLno0exNZp0qBo04Orf2haWbDC5
	hY8hvPQSfvwPDFpluyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncixX-00FVZf-L3; Fri, 08 Apr 2022 07:23:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciwp-00FVDB-EI
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:22:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id d29so11444096wra.10
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+i3M7I/si8nBTwp4HQFlyF6kBw/Y86O3UtaIOhQqSgw=;
 b=njMPMNppMly5ssPAOWWTMzALhM0HuSZ4dOHB+/r2gqxGyi/nQQNRlus2x/AzAuQrKq
 xCilly7J5UpWytTYHGj/BJaOyWPPe6iScw8BQ1a/oUCPMMw4Yp1CxsDEGRWKgFfd+ykL
 ZGMozqHk83wJ5DmDgszP1Z35wW+R9WleLoi+DIx2nvUQDCefq/HcPuchXIBbwRZ+7wiL
 XuBSOvjFLXquYJb4WPbu2gZnDc+YANvNfHJ9gPYnGlX8f4IANQYMlBC+yG/mThiAUJat
 luu6g5f9FuWplQUkrgYlMMRm0SWFJTby6uL48HZSa1aiYsry0+sbc1tk2fR9A8EfCOiz
 vbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+i3M7I/si8nBTwp4HQFlyF6kBw/Y86O3UtaIOhQqSgw=;
 b=lKgvLs5TrJ8YNpXmKk2qR3REH7AZJb+JpxEc6Rhm9TgUQ/+Kpg5whanJKt9mFmMq+z
 /Ga6Vi44wJ7mjTAWqTgacaI7BQ4PX1HzCAcrJAQKQdjIsfjhb+p9NirIOkYR07MoObTx
 cBWgszcR8liiMzBZThErnLqE1Oowgya+DlQCb5gwpBeSQ77jbW7F2k1s5+dyQ7RfdYa1
 C/ELkfN1+EwT5s50mtjGxZnzZR4IgbIebp+FwUfx00P4ZMMmyVjlQKLx7ghGo+j1rFIz
 Q4GAsk+pbE+t6HKtVCvrMrRoO215stZUQEtE/of8H8xHvwM6KzeO13uEvy4B+mtMP7eo
 LP3g==
X-Gm-Message-State: AOAM533q6gmlrkO7WjsBPFNtqUWrzO3/IfKSoTLeY7Fdge6/pNtsOgjp
 VQG8iXLK85bbJtxE7yF7fyAeWQ==
X-Google-Smtp-Source: ABdhPJzgZitTrYz3M9Cl0bidcrh0p0LPFm7YGEXMIsJOsY8wQ5D2NRTazZW7HoEvc0P98B75WWK8dg==
X-Received: by 2002:a5d:44ca:0:b0:206:893:6b5c with SMTP id
 z10-20020a5d44ca000000b0020608936b5cmr13623307wrr.145.1649402540310; 
 Fri, 08 Apr 2022 00:22:20 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b002060e7bbe49sm17924124wri.45.2022.04.08.00.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:22:19 -0700 (PDT)
Message-ID: <e704bdfd-7b09-6549-5efc-a2088e3490f1@baylibre.com>
Date: Fri, 8 Apr 2022 09:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: remove cpu compatible "arm,armv8" for s4
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
References: <20220408070901.26446-1-xianwei.zhao@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220408070901.26446-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_002223_593160_1E4423EE 
X-CRM114-Status: GOOD (  13.98  )
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

On 08/04/2022 09:09, Xianwei Zhao wrote:
> Amlogic s4 device is already applied, but cpu compatible 'arm,armv8'
> is only valid for software models, so we remove it.
> 
> Fixes: ac4dfd0d1d35 ("arm64: dts: add support for S4 based Amlogic AQ222")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index bf9ae1e1016b..480afa2cc61f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -13,28 +13,28 @@ cpus {
>   
>   		cpu0: cpu@0 {
>   			device_type = "cpu";
> -			compatible = "arm,cortex-a35","arm,armv8";
> +			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
>   		};
>   
>   		cpu1: cpu@1 {
>   			device_type = "cpu";
> -			compatible = "arm,cortex-a35","arm,armv8";
> +			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
>   		};
>   
>   		cpu2: cpu@2 {
>   			device_type = "cpu";
> -			compatible = "arm,cortex-a35","arm,armv8";
> +			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
>   		};
>   
>   		cpu3: cpu@3 {
>   			device_type = "cpu";
> -			compatible = "arm,cortex-a35","arm,armv8";
> +			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
>   		};
> 
> base-commit: fd86d85401c2049f652293877c0f7e6e5afc3bbc

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
