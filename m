Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E0C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FclygXu+5NMz/3lnFKIdjyShwbN4EaJ2d7po3Sgf4s=; b=d6xQgSBUze5d+w
	84+9yvlW/m6aaasOOLVvdn2IxSvcX2jB419lxJE5Q/J9EYVClBJxEWwDZcaQKcn03UDEevrd+GuQJ
	QqKzuFEpxXJzRTc69rrDeJuzT0Vimxdd5TocrCeVXZG3kykvw/lSJZZM6RPmT7jmvJLGz21GZ6u6k
	x+lH6/Ytqw6a5gkvAuC9vNxGa1GBNE0dojrCc2Jid3OripSt9plT2In4rY/C47kNxVXOZYG6hcdLG
	sDqzqYJ94i4vMu+trYxkQt95s7N4bmoKvxDsOCFtByO26rpVQSalzKaSpyM+4PHUIr+eRi6aFuOyc
	YIG1Ec2cF5gNTG44UtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtSR-00DWBC-AV; Fri, 05 Aug 2022 09:17:27 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtSN-00DW8J-SX
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 09:17:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id r17so2547828lfm.11
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+CMoiOvoALqtlN1eR5gWn8reZtPiBx8t9tCsPV6Dp58=;
        b=OKPNxIev9fG8WJRrJTmLx6z+KVrASNdQbVsclsUZHhIMbt0Mn3Yz6p0XqWv/1gfN4h
         ShtELN23qN9RTsWiGXfiT+LPfD+6jhO7t3AJvkbaZOrwt6pIO5Wt0bDcYs1QHMzDnZ6a
         3LaaBh3Gm6DAclxUyKW6hKCAWgrHfC0aE9XBYc6aFnd+h1S6njPln/RPG92ZPcx3rW+A
         ZVcm7xXu2y0yaHUznvBOtIQTtaF/ck8I4epvOxXDrwOfISXtCKWoMDuAuV1Z8pxMOZZB
         0EBKItKsFEvVvmNaug52ALhoS4R2vfycAtS1o2QOaEuIWEs0qQqd/zPI1gGTyNepOcjl
         1yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+CMoiOvoALqtlN1eR5gWn8reZtPiBx8t9tCsPV6Dp58=;
        b=r1FV+rC/IDhcTwO9FjmPbhk9PGNRYGxyIQvM6dE1xCZK6sYCnDXJo10pPcRZNne3wb
         A5Iso6o1e36daJUR8kUhtsvFxtAbK8wAqHOpJo3t4DWmoHdFQGD7dJD9eQNX/uDcXT1w
         TaqeGfvckDG0xnEc6vXfYyVJMXluPCRWAimMYKndA9krSUR/ZwaKrCyNyy6nl9DDoHk/
         LB/u7Z7HltPHyZ2RSYvQoR6g9x39t2HyJMC3Zc/r2u6nScybO9jdyB0R4wVJ5e47c+a8
         UNarnS8V6I2hX6Pwm86Ac0baiBAZRl7IXWoCgj7/ZR4JzFV8cKSUuemX7SsIjI+Ex4TA
         LSdw==
X-Gm-Message-State: ACgBeo3CChkhhQSO+y8tj7W/urUohFI3+GJEgzcwWoTqDtY8lEnXYocB
	dMe6TiCdIFf90BMx8vtWTMYiLw==
X-Google-Smtp-Source: AA6agR5B0PGL1bwVhuuIxkORg7wFZpXdetwZm595Mjcarj1SUuhQgmBMgOGGJ4/tduXpC+CTDAbqVw==
X-Received: by 2002:ac2:4c50:0:b0:48a:f0f4:9dff with SMTP id o16-20020ac24c50000000b0048af0f49dffmr2229390lfk.318.1659691042476;
        Fri, 05 Aug 2022 02:17:22 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id i3-20020ac25b43000000b0048af3c090f8sm409012lfp.13.2022.08.05.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:17:07 -0700 (PDT)
Message-ID: <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
Date: Fri, 5 Aug 2022 11:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock controller
 in DT
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
 <20220805085716.5635-3-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021723_988713_F8D5811B 
X-CRM114-Status: GOOD (  12.11  )
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
> Added information about the S4 SOC PLL Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ff213618a598..a816b1f7694b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -92,6 +92,14 @@ apb4: apb4@fe000000 {
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>  
> +			clkc_pll: pll-clock-controller@8000 {

Node names should be generic - clock-controller.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
