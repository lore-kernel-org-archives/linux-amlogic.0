Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E531EE4993
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Aug 2023 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c4LLxtgTnRpr13g2WnE5tJ84mWj2GHeDpNRLRbDfck=; b=0x2S/rGdUYfMfo
	Dk2llE5ZcBR0KiBYirg2/z+1VeWeu8h+U1KAb6TqU3klbokYPYoTeZpQ6bHC9oEec+Y4/LvaWCEhd
	+csyjBgkkAx6Du4rHVAGTcXdIRPJAImbOtRXNX4qTdvS6wUPINRElv43KwVuDcvMR7hlHhSPaH1uh
	Bo/5uO3POXR+fveOhj6nDnCSs5AqoverlC5cliren/dCD0+EMnFcrQhf+Z19K/6AEqWMmoz/oj0qb
	uppWltm2DYMSssLl8I/U/crmdJ/gLbKHWBQOZ13iug+3qFgBvLFFIDgdsbGuEBIpwH0CS4d4r8Kub
	pZ4fs3RSK6WEy7nh3ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXMoZ-00Axna-2Q;
	Sat, 19 Aug 2023 14:20:31 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXMoW-00Axml-38
	for linux-amlogic@lists.infradead.org;
	Sat, 19 Aug 2023 14:20:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so27070421fa.1
        for <linux-amlogic@lists.infradead.org>; Sat, 19 Aug 2023 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692454824; x=1693059624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0onguFDScQ28yFTMt4lAsObdKSDFfD8I7t+EctKHSg=;
        b=rd7t09SLqd64aFO6Kijj17CqNF5ymQI2PAWj2iCsjKMiAzR8N6H88qyiCiJekpIk5+
         /8UqWGyJIEsQRdwqxO9k9goNb6Zl7CjrfnXcjn13zHUoPpS7TZ2sDmQ3RpQI6fPWoPt9
         k9KzcnvyW+ca8xVKp6ZSGESuM53YcTCwEiaWSlbr58fJ96PyX11UhQJIYOhHTPNC7SHr
         Myh6VH7Sx0WZUoLgpjBPvT9VhRZQhf47qBUfZyDHmPl4pFdsjMyNpfcLIelghQpvHG8I
         hRF95eOv8L+FXOlK0qKJSTQ1yRxSpeOMY3bwAzQKq/DENBZnHiVXPn/fU8rrV2o4Fc8I
         0ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692454824; x=1693059624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0onguFDScQ28yFTMt4lAsObdKSDFfD8I7t+EctKHSg=;
        b=QmeJbvtHkP2usUoxtpiHrxrpcgVld2VN9e8E7SNCEgKIHTf+xxGsBePfEKxW5AWV/X
         gr57IMLZJJ0/NPHphe0KaS1xJNQW3q3yYLClvKIoMTeWXtnHkU54Wmx6rjQRP3LK49iZ
         FpsimZAQUtRFRBFoxHilt6ap2AKQdaw0JN7g8JYpWtmDMIoyerB+UlqbZ+xckpZFIOK1
         2FLC5GqtZDMUQ1iEa+K+fgkdIuJCbZH10ZPbvgj6MIUq2EB2M6YhVCZeYNW+gXsI6Evk
         zaiKwGWjTwxhfOvVIJ9HsWiL7RZfwX9Uz7fsp/d8SDuMEvPgWC5N584OXW1VVJTtC4RM
         kB9Q==
X-Gm-Message-State: AOJu0Yxas0KiVBHgo6xNL6nxAxF/8UqUfleZo7qfUoyaH7P5ZbspDcZC
	mz9cr8MCIHEUy9Dqj2z0yiQEbw==
X-Google-Smtp-Source: AGHT+IFqpjzQHVRcvUzSqexrAEcVN+laiPOBWxI+WHEn/Fkt4YQ4N9aeescuFTLbC/S4clcsiGzhaQ==
X-Received: by 2002:a05:6512:159a:b0:4f8:6e52:68ae with SMTP id bp26-20020a056512159a00b004f86e5268aemr1661887lfb.31.1692454824065;
        Sat, 19 Aug 2023 07:20:24 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d0c9000000b00523a43f9b1dsm2570080edo.22.2023.08.19.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 07:20:23 -0700 (PDT)
Message-ID: <a2e18e03-a50e-897a-b599-f3b6bfa6af88@linaro.org>
Date: Sat, 19 Aug 2023 16:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/6] dt-bindings: power: add Amlogic T7 power domains
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230817071148.510575-1-xianwei.zhao@amlogic.com>
 <20230817071148.510575-5-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230817071148.510575-5-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_072029_015700_862A7257 
X-CRM114-Status: GOOD (  10.56  )
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

On 17/08/2023 09:11, Xianwei Zhao wrote:
> From: "xianwei.zhao" <xianwei.zhao@amlogic.com>

> @@ -21,6 +21,7 @@ properties:
>        - amlogic,meson-a1-pwrc
>        - amlogic,meson-s4-pwrc
>        - amlogic,c3-pwrc
> +      - amlogic,t7-pwrc
>  
>    "#power-domain-cells":
>      const: 1
> diff --git a/include/dt-bindings/power/amlogic,t7-pwrc.h b/include/dt-bindings/power/amlogic,t7-pwrc.h
> new file mode 100644
> index 000000000000..b7a13eda563c
> --- /dev/null
> +++ b/include/dt-bindings/power/amlogic,t7-pwrc.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR .*) */

This does not look correct license. Use one recommended by checkpatch.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
