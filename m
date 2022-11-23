Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E4BC43219
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoU5qouoPi5Ylw/RKNNtZAvsZoQUyFJNnAPp3cb6on4=; b=GNBfrkfX5mJRp+
	wAbS89gDGq5Z2RaPUgpcDGr0ip5+CJt0btfQKwCxnEqRUtwQ0j9VIl0DGpgcFu2oQJK5SszZuTGN6
	cvQ0sqEJEsDZyCGDJfdv1gv05t7cmChamzrC5rqdf0tfPeain6pjfaoCWUkpB8q469uRWQIq/PReT
	eegLBtUCzpvAKSPpq8NHolDI4YVkiWAOvH0hkZwfQ1bpYdpjJsLltTbOsu6PHjl5nXUS9eeJSFdSY
	pt4oUXpoJqGJqS039hl1j/pkLkZzpPP/hlz1RMGw6FWHBGrIwZqDGwNO2wlqTJg6nUPGBTq8zlJX6
	oGjVrBhT8euoZTa/UpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmi7-00GGTC-P1; Wed, 23 Nov 2022 10:10:31 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmi4-00GGQ7-Tm
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 10:10:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id a15so20809738ljb.7
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqJl1+6YGIooPA5RyCLFMiFhceaRWa4Nlh5Xn0glHTk=;
        b=JH7kpmAlHqFLEvsthwrLXnmFxxjht9kdZM8X5XfWaeEbvoyTx+CqYnZSYxYvuiemN1
         ZPby/Pq4iVzH3CTDRma1EBFYd5IRVOKYJhQPUwpI4Vh1THFJHP0EngW+4pe2aRIpVpj/
         4BZ2hugDECFImf/7nKc7qMOTL0DDP+OpoDkjtY5XEYUf9Zyd6BvDZNp/DsPnnBVeYE56
         vlE0ih1XjONPjhpyGMIRex/dPSNHCeywzGgMaoksmOzNrWudhPGUhyONPfvL3uBUor5Z
         LNEWzGt64TKRf1q7WDtUgMPihWdEpa0ADL/QI3SOZPd2+1L7p4UCwSvvaAG7UYhZ7NwZ
         nGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqJl1+6YGIooPA5RyCLFMiFhceaRWa4Nlh5Xn0glHTk=;
        b=FeqLjSz+Yx+n0DHUlQnydTDQgFrkOsACFj9zlodXltHEH7uS2KEpKlCIFYlbH4dEGF
         MpDrcgl0qpToo+jnXUtEvVT4hX09tLDb6dBa3eTJV9S5gCAlyT2FuaQraAztE7IWfePX
         3LZghK4ASHkD74it+qLUlXN0//MRzW5bPrquOXyhtyef4DXfJEX8K0mHkkMX/E//zDf1
         jhDIRke8PuWQZY8NuxJuMHtNU0U9vSYwHLaiOMFeP/UxzU21bMBZ1rx8+SfLAWWoKiHr
         AHugwxmVoksDgUnScsC1iGohB21QyxiLhIYmtx6VrS0SlgrSabsvPRWSSbqrN1NORM8z
         IYdA==
X-Gm-Message-State: ANoB5pmR6u95zakeuVECFO9XQmlIuGuTK1IaApVQaCDgyAhaw7kJhDS8
	knjeElTUnM+2z5CncSdeISx8tg==
X-Google-Smtp-Source: AA0mqf6XnTP7DKHANKMnVZVz2ILRp+dyk+l4bhA9ENXc6MSPSOQqM8P2qEVwUWegdewfNZkbnQ238w==
X-Received: by 2002:a2e:b5d4:0:b0:279:5fa:8e7c with SMTP id g20-20020a2eb5d4000000b0027905fa8e7cmr8382761ljn.62.1669198226494;
        Wed, 23 Nov 2022 02:10:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s14-20020a2eb62e000000b002772414817esm1429030ljn.1.2022.11.23.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:10:25 -0800 (PST)
Message-ID: <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
Date: Wed, 23 Nov 2022 11:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-5-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_021029_038593_BB1B4BC3 
X-CRM114-Status: GOOD (  12.57  )
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

On 23/11/2022 03:13, Yu Tu wrote:
> Added information about the S4 SOC Peripheral Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index bd9c2ef83314..e7fab6e400be 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>  
>  / {
>  	cpus {
> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>  				#clock-cells = <1>;
>  			};
>  
> +			clkc_periphs: clock-controller {
> +				compatible = "amlogic,s4-peripherals-clkc";
> +				reg = <0x0 0x0 0x0 0x49c>;

This is broken... did you check for warnings?


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
