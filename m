Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05846C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u45vkzP46QN6mNMiUu8IjzY3Xf8e0jAZwMW40nQGiws=; b=yFpaKjav+TLzcPXO4lAAXwulN9
	sTsYdjU5jEjDEEnh7R0qnL1grlO/WzBeum/3ylboR4yNdW43Owtie+rxPLcFLxTTTuq9BQPCDSR4z
	pDbrNoQTdMER28aP8SPIHTzIxX1tTIxG4rMvQJadWVvvNEF0HPZOa9jBtD3vHEd87/F6kkJ9Nwhxh
	pCzPNTZE65JoNIIqnlULGp8LZFybb3VxdaZSaQsR3hN7Na1GVknqPRXWMGW8UwwZdPCFGqv/L0hxU
	C0XjgjUSPlqXIk3usBY0yy8m2eta2+WjF+EbBoVJ4HsbTT6jK6WZOkd80+qDulE0RBFVYATbsE6vI
	xkY6haug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVBN-00GzkJ-NE; Fri, 27 May 2022 08:18:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVB9-00GzfZ-CR
	for linux-amlogic@lists.infradead.org; Fri, 27 May 2022 08:18:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id u3so4900850wrg.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 May 2022 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=ZkFo19yN9FE8l6w1oc0IJiQl2EoWP33mdxcOBd2mVFc=;
        b=Fq9c32hxcx2ufnuS5yUUdwgf84fJ2V+HR5zXjKcBgRRQOBn4Oo+Y8PIBAAJ0eAGKis
         BFq8Tk+WkMh/OpMKqPxu/qDH20z/0g2Bu6S8gNtK+qUGjyVeDQ+QCHdDUEIhiM69KTww
         kB3Put3kNcCckMhB+JJdnh7Xq3M0LVZC8tIFMlpEgP3SxokQvFGjVw/RAL3kY8sTL1Kh
         pqEWSwQcYGhjLE01TMhH1jN7uXz6ebJsZ4yeKtRSOIOJpljU58WV9IlzyfOLS+A16ABz
         9GQnTG5cJGDEJHaTbumnaHlKut9Gc/NSmWOT5otOpcjqqnNXttpKcqTJXWtIV6XqOQYg
         iHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ZkFo19yN9FE8l6w1oc0IJiQl2EoWP33mdxcOBd2mVFc=;
        b=Q2ardixVDITC84NvpL3N+06cJG2bpdXN9WkhQCbfEldlGR6Sq+1msYjevj1xXBbqOS
         n502s36aVdiJul8+xNKKrxkQVsFOkxj3vxGvjYbSbANMCwKvYLxQdEPhlNr+tkHrBDuu
         NAlhundbSjcfRPdQosvOVjjLuiRmtcIgeT1HaJUpZhfj6bZ8Zz/yIK1s0wkQTZgsZ/Gf
         5hOt3/AgarmlxlAe2ZfjwZ9ZKj3bTkTlj6I+17ltmCO9dOw2VnrNvZ073GJVINp3asn3
         9c29/Ukl3D/27k88v4LEPnvhrLX1Jq+oYTZf6eqbUOoRvos1YVAgLzvudPj+O6bihrIH
         bONg==
X-Gm-Message-State: AOAM5332WboWKnV9tYn65Uj1vQ+zGUMHqda5qQ2JCit1WcZ5Ny2Jad7n
	BbMKAFQgOjCn+jt4gK/93ata8A==
X-Google-Smtp-Source: ABdhPJz+oqbBEG4R4LguW/AlVaAt1T7SUCg4RxJCopLYPsk+CUpf7UJyCqHBCjs0nVw/onX+8/KQFA==
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id v10-20020adfe28a000000b002100b310722mr5408462wri.65.1653639515570;
        Fri, 27 May 2022 01:18:35 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:f081:5ded:fc86:365d? ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id v18-20020adfebd2000000b0020c5253d8besm1130050wrn.10.2022.05.27.01.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 01:18:35 -0700 (PDT)
Message-ID: <19a9260c-322b-10e1-e361-cc2d5fdd8ff9@baylibre.com>
Date: Fri, 27 May 2022 10:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] ARM: dts: meson: adjust whitespace around '='
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
 <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_011839_452850_5A8A29B0 
X-CRM114-Status: GOOD (  14.00  )
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

On 26/05/2022 22:45, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>   arch/arm/boot/dts/meson.dtsi   | 4 ++--
>   arch/arm/boot/dts/meson8.dtsi  | 2 +-
>   arch/arm/boot/dts/meson8b.dtsi | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 26eaba3fa96f..8e3860d5d916 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -214,14 +214,14 @@ aobus: aobus@c8100000 {
>   			ranges = <0x0 0xc8100000 0x100000>;
>   
>   			ao_arc_rproc: remoteproc@1c {
> -				compatible= "amlogic,meson-mx-ao-arc";
> +				compatible = "amlogic,meson-mx-ao-arc";
>   				reg = <0x1c 0x8>, <0x38 0x8>;
>   				reg-names = "remap", "cpu";
>   				status = "disabled";
>   			};
>   
>   			ir_receiver: ir-receiver@480 {
> -				compatible= "amlogic,meson6-ir";
> +				compatible = "amlogic,meson6-ir";
>   				reg = <0x480 0x20>;
>   				interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 9997a5d0333a..0f8bac8bac8b 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -430,7 +430,7 @@ mux {
>   };
>   
>   &ao_arc_rproc {
> -	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +	compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
>   	amlogic,secbus2 = <&secbus2>;
>   	sram = <&ao_arc_sram>;
>   	resets = <&reset RESET_MEDIA_CPU>;
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 94f1c03decce..cf9c04a61ba3 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -384,7 +384,7 @@ mux {
>   };
>   
>   &ao_arc_rproc {
> -	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
> +	compatible = "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
>   	amlogic,secbus2 = <&secbus2>;
>   	sram = <&ao_arc_sram>;
>   	resets = <&reset RESET_MEDIA_CPU>;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
