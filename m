Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFA7C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUwn2FmrKqFBwE9Lpxo08tEt6QMyYY8Q2XApm40dFMo=; b=nlgFOR0BPRwuu8rvadzLVSEOZO
	o39z7yrEhNORpHDN5xe9DEgtU2Ue7ePVKNGW3UBbGicdC8Z2/JZa2QnFWTt0eULM9xnLI5LaBFuXA
	29rP4gbClR3xWdEVcKctBtQOYmQE4IUt5LKcQwsH+ijVCqy7OPArfQI5fj1XMPzTnKJLBwJgyftVQ
	FmEXOHFMqJOVGwUaAGg86G5Urh7ZeglrE2veMkHSKgdk+zzNr6gySpri9KTw7s/5ObL1M2UJrn8mu
	DijNT+Z9iGYZCog41GyK6UzZIx0ZIMn8NMQGuxTOIldhVKS/id19b9dHrJ0gaXDkvIeGXuvPevzpB
	T8m6YPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVB3-00Gzey-Up; Fri, 27 May 2022 08:18:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVB0-00GzdX-DK
	for linux-amlogic@lists.infradead.org; Fri, 27 May 2022 08:18:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t13so4875411wrg.9
        for <linux-amlogic@lists.infradead.org>; Fri, 27 May 2022 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Mlq0w9Sq3JAXLiq6IKhnHlUUJ+iRXBtNrFRhNgWew5s=;
        b=rqDgQ/xG2NU4MxSBvqKUCi8BfTiMBmKzGuJqymLNx/P6r8Ygk6b/uNL7tAFv3T/Pl9
         hHkuZ5L1OoGwXcznnrPtr5IIKBdU2UfgPoMa4hLydT6SBOQZ7+X7xK2t4Z9K3UnDSito
         6UxRheR447juFCnK1od/iMsKLAmWlkjbAJYXi0QnO2MmqL3ZJ/Vj99HB5HH0GxBz/xM+
         dFUyhfC0oVDkB3rbWbon/vFqxJI5VaHfFgmgFHMrIxT15SbCtYS/PkXEc8mSGg96ilAA
         rDavvVRqb3fIqM4xEmJF319s4jfwUl198h+I+E+BpdMR0D6D/B3K8qec81fmXDny0aNR
         ub6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Mlq0w9Sq3JAXLiq6IKhnHlUUJ+iRXBtNrFRhNgWew5s=;
        b=fK7bNVH0IavFkveeiJm9fB5j+kXXe+SuBbkXrkzpHzBV45oHVRfzHdMCTHBNt4JrjR
         pEwGeBO34K1hWRQypGfjMSDPCeWlYOhklQK09rHoX61lNboqJsAifayQHa8mhgIlg5nL
         VuNxzE7rm4DP9fNQy0GRDaKuR1KUCtmt5s7Ev+yLN4vnDdo0lG4Si4nYViILHJlRAvhs
         2ZzjAGB8jjHaflK83BsDfZQR4cfdcs15I4YH64mvTOjwI3SevDnlSwcudZ2/01DVo/n0
         55nj2r5xqO/eWgxt3/C9w/wsz87NAweZkMbB5Zt8UUunTyP2v3kKdvn+4yfVsA8jocv8
         DRFw==
X-Gm-Message-State: AOAM530SCkTx1hBr4KNbYyZ/M6aJ3giHkak16k9EiDOlCsQEtwn30yww
	pEWV3tMX4ZZQ7T5y4SJe385Q4Q==
X-Google-Smtp-Source: ABdhPJyYzDfcTwaDTmQ8hJx/lTQ/NCKoiSSHk/AYU3xNnZteyuNsH7HPgEVmJ+crsBlwaPJ1cqlX9g==
X-Received: by 2002:a5d:6041:0:b0:20d:8e4:7bb8 with SMTP id j1-20020a5d6041000000b0020d08e47bb8mr33591979wrt.652.1653639507562;
        Fri, 27 May 2022 01:18:27 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:f081:5ded:fc86:365d? ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id 129-20020a1c0287000000b0039748be12dbsm1439480wmc.47.2022.05.27.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 01:18:27 -0700 (PDT)
Message-ID: <4b3aa028-fd29-0053-e8d3-ce16c5d4b078@baylibre.com>
Date: Fri, 27 May 2022 10:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
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
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_011830_721981_A55B93C6 
X-CRM114-Status: GOOD (  13.39  )
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
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       | 2 +-
>   .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 3f5254eeb47b..04f797b5a012 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1535,7 +1535,7 @@ aobus: bus@ff800000 {
>   
>   			sysctrl_AO: sys-ctrl@0 {
>   				compatible = "amlogic,meson-axg-ao-sysctrl", "simple-mfd", "syscon";
> -				reg =  <0x0 0x0 0x0 0x100>;
> +				reg = <0x0 0x0 0x0 0x100>;
>   
>   				clkc_AO: clock-controller {
>   					compatible = "amlogic,meson-axg-aoclkc";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index aa14ea017a61..023a52005494 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -450,7 +450,7 @@ aobus: bus@c8100000 {
>   
>   			sysctrl_AO: sys-ctrl@0 {
>   				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
> -				reg =  <0x0 0x0 0x0 0x100>;
> +				reg = <0x0 0x0 0x0 0x100>;
>   
>   				clkc_AO: clock-controller {
>   					compatible = "amlogic,meson-gx-aoclkc";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index fcb304c5a40f..6831137c5c10 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -216,7 +216,7 @@ &uart_A {
>   
>   	bluetooth {
>   		compatible = "realtek,rtl8822cs-bt";
> -		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
>   		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
>          };
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
