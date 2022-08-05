Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D86C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oex05wHZ+OYlm6sRRF/g9t+6GJwxR2boGYlqvGAJzoo=; b=QE6kMKdE7I3ebD
	oGk59tLK+nDLp2vhDcPkz9f3+ozwaH7gyNPWCTVvC+HdSGjTXAcpHraXJUR4tviE0qcGaslVLVE71
	lyiUMO0T7UsxLF3sxpe0WKaoiE91f1FqYxYK9YtPIj9ouZvV7CwUiHN4a/hR/od+mL9ZkKSDm5QQw
	2QJijLRb3k4etGuB45qsaKs9Y2tOFODxslRUUdF6ehUKzm+XXFdIbZl9suG7cMyqxWsleEo4ldjG9
	JUxcWs5+s3NT2qMs1jqnAhHU5pxoMfx4jqtVbxOzom1Eeb70a74xSBSN7Aju1vsocvUulUCA5+bGJ
	1lXxQ1dK9K2HO5uVBJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtS2-00DVvt-5A; Fri, 05 Aug 2022 09:17:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtRz-00DVqL-7V
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 09:17:00 +0000
Received: by mail-lj1-x231.google.com with SMTP id s14so2483119ljh.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NebOAZsDNUYEnk0zw74zqxdgooxqZ6OXU/cl7Qnopgo=;
        b=PwNdSdJ9vLfHwmC0vxJWGJatV/Psnd2QO3ZilR/uHik+SIXqZRdrG3ojXbOFCIhAKL
         g6Gq8ezk4foZnteWBwbEK4FFPv2qQPPJQliP0QJKmR+PazzsoPcZSmqFoE6tPpGiMO9J
         pBxQJhRyhWK9Ft4KaNykKPISKOLtxvqRqE70dDSyK8Y5es2Ecd+p3jjN/c/Fubqx31ri
         Z4Iy/PalR3/ESly9azFb202102tTADh9V4Ti0sZVR0Btg9v8POhWf5iqJL0gNt8vOSmG
         niRiCeHTB67wmLY/sU6V8nNo06AHisCyKwOeiIFMjAwCMBcedceIe+jg3siREVk43kfa
         /ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NebOAZsDNUYEnk0zw74zqxdgooxqZ6OXU/cl7Qnopgo=;
        b=X/8aKDi0uuCz00dnfoHy/FOjv2WJ3X9n5YQEHdvMYH21MDgRO4Q+j3Bu92hg+gBkK7
         263mIg1o6NTFo7wYLVdOdi6wgmS4G/7hS9qbG4DJ7jN5msfKWQJRVyQBT5M4uDQ1Q0vP
         kANtnuU212k1+1Lf2ZuFKtOPC9ZHtrYf+Jq5tzvqj2roRY8mYgAckwDoPMd5DfHR2iJ1
         49/FtlgpkItFeRehQPkcphLnt9s5/Y5b5brq2iP/P3Ol2WhVB0B1aeerJ6V77ouf467e
         NdqCa8yII0+TldVEPlud7A27ybp8RkKdsO46TK1S73ZtH7VyEUowYI+J/2NhiCFBFrKD
         2B7w==
X-Gm-Message-State: ACgBeo3/BiQNtCH7fI8303CQym3WriaezlYFrKPzxMWefoRRvRZ90QlM
	gvujOAmb6z1pvb3Qd3Ya+J3X7w==
X-Google-Smtp-Source: AA6agR4yVEvRwgIhQrQa6MU6+RgXf6u+bO9zwQ0E+tfgpNd2ldoDmEgjNO26h8O36iiLY01NSXJOmQ==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr1905585ljh.78.1659691011885;
        Fri, 05 Aug 2022 02:16:51 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id c29-20020a05651200dd00b0048af749c060sm403940lfp.157.2022.08.05.02.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:16:41 -0700 (PDT)
Message-ID: <60f30470-ca14-1e12-3ed2-7b34c7a93f8a@linaro.org>
Date: Fri, 5 Aug 2022 11:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 5/6] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-6-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-6-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021659_299553_E7E15A71 
X-CRM114-Status: GOOD (  12.49  )
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

On 05/08/2022 10:57, Yu Tu wrote:
> Added information about the S4 SOC Peripheral Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index a816b1f7694b..71be1dda15a2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,s4-clkc.h>
>  
>  / {
>  	cpus {
> @@ -100,6 +102,30 @@ clkc_pll: pll-clock-controller@8000 {
>  				#clock-cells = <1>;
>  			};
>  
> +			clkc_periphs: periphs-clock-controller {

Node names should be generic, so "clock-controller"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

You miss here unit address. Test your DTS with dtbs check and with
regular compile with W=1.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
