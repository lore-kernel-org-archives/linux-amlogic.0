Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7008C54EE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Sep 2022 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARfUmhc65PfloMmpGPYrxzoshyC2kLmSNz7znXdLYFs=; b=dy+/TiK2oxTG2s
	ex+tMoWWYCLi4geKZUzPiNHuKBdKZpEkeHMqN5limVQ+K+KMiOVS78Pm0it5jWupcKsMzIqTYnLbM
	kK6ZaZ7h/VJ7+bcUCAtC3HIik1u2S6q8TTSRdjNpjybnS7sgRaI01JPFlE04rYvz7XtuZP/bVHfT5
	FTyD6KjE3KHYOoMFdVq2pZSq5elHYH8StShbfXYiHfggRmezeVxpDF9VWU7P1BxiGnxRiFS/+lZQv
	r/tQUnc5Qstj4modf6JhZZl0ftAHAsNcbRTnZHxMGMrRHV9amPpMRvEPaCIicvg8YlX29n1RjOLPo
	nGjiPpgjzm+H+FMfInug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od60t-009B4N-Vh; Tue, 27 Sep 2022 08:32:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od5yc-009A09-Tq
	for linux-amlogic@lists.infradead.org; Tue, 27 Sep 2022 08:30:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so5012049wmq.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Sep 2022 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=BqKb1MOod0APhgvKJiJsziZsDmx0K0c2qqX6KClwNl8=;
        b=gkskCLvsNhU6rPJILVg60kgxjOUQpR6Hq/kMdiieQiqU2RQewtzbgTYSi+OveKmK8Q
         eM84vagUMNZ/sleHwlRfAdyuTdmeMuhgkvwyh3z5m5gz9ntzcEhWYr+MQ3Je4RdTcuf/
         1vIfY61AWydZ1iGHmuNqsSgPbnyCtRXCzPfaPZTdxskoA4H97hlz2WRbWtd0BD8XB6Fs
         TI2RFhAH7Z8dcG4Osv+jgN0vElu30KR/yVBm5+pgyxUrTtR0tGQZmVrWNF+rcXzyrxyH
         q0n2hY1hhIIqYnOA5Ijitb0W/SrK/O1LxvkZKDyXNldW1H/Q7XCRdWTLFcVZvc4SI4/A
         t+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=BqKb1MOod0APhgvKJiJsziZsDmx0K0c2qqX6KClwNl8=;
        b=kufmOkx4bou6coeKH6+SA+RCn6nSzsO5F/CQUsDb/U2tKau0Or6h/wsN31txr+rie3
         PMWrS51a5jGsDHtBdy9BI4/dnaFzCZST86PGPC/QMx24CAR4RxMP/6QJsQBfVfLEHZFK
         G162MElXilX022FBCQaCKPx4ch+4SCDlMSX7dcdTFihe0UyLF9XBQHKIMmDqzlzzpY5p
         a0XtmZCj0GZ4ODPmKaP/8Idx+t7EH7erg/J6zYcnMtyCwsyASqqNwb0NogonMMnOB8Yo
         2XtYyiPxnEv3uqpIZYI3oQ274jJxPLNik+OroxgFHFfJ9L/SqC6I2xUD0Qm00RIaWNx0
         F+6w==
X-Gm-Message-State: ACrzQf3V1OGdwdAnbcsVhAbdEy/77BFeZhOgzu3B5d6chIkXl/SCMS4L
	LGhWZF7ALb+qxpMPvhTn7dlMPQ==
X-Google-Smtp-Source: AMsMyM53efqUnk+cvJ0VgUzsAEsKx6Zwf42B1WU+5vDB7OJ8sHKF6wCrHgxbsKqn5+krOU2a/JQB1w==
X-Received: by 2002:a7b:c01a:0:b0:3b4:a61c:52d1 with SMTP id c26-20020a7bc01a000000b003b4a61c52d1mr1733578wmb.146.1664267400042;
        Tue, 27 Sep 2022 01:30:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b771:c77b:f889:9833? ([2a01:e0a:982:cbb0:b771:c77b:f889:9833])
        by smtp.gmail.com with ESMTPSA id i1-20020adfa501000000b0022a2f4fa042sm1118461wrb.103.2022.09.27.01.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 01:29:59 -0700 (PDT)
Message-ID: <f9bf3f7e-e949-3e77-a74c-74c0eecd77c0@linaro.org>
Date: Tue, 27 Sep 2022 10:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 narmstrong@baylibre.com, Da Xue <da@libre.computer>
References: <20220809172017.215412-1-aouledameur@baylibre.com>
 <20220809172017.215412-2-aouledameur@baylibre.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220809172017.215412-2-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_013003_024895_F26A2EA9 
X-CRM114-Status: GOOD (  13.77  )
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

On 09/08/2022 19:20, Amjad Ouled-Ameur wrote:
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
> 
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Don't forget to CC devicetree@vger.kernel.org otherwise it won't be reviewed.

> ---
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml      | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index 50de0da42c13..10707a8216f5 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -43,6 +43,14 @@ properties:
>       minItems: 1
>       maxItems: 2
>   
> +  pinctrl-0:
> +    minItems: 1
> +
> +  pinctrl-1:
> +    maxItems: 1
> +
> +  pinctrl-names: true
> +
>   if:
>     properties:
>       compatible:
> @@ -69,6 +77,13 @@ else:
>         items:
>           - const: core
>   
> +    pinctrl-names:
> +      minItems: 1
> +      items:
> +        - const: default
> +        - const: idle-high
> +        - const: idle-low
> +
>   required:
>     - compatible
>     - reg

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
