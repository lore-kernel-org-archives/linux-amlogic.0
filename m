Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA58C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iq3AhVcgnQjlKH7cZEhoF+fxCfYXH1IM2a9sNxl9fm8=; b=NybHkLJDtR4+lb
	EvD4edifALzKP572OuTfOZbWigKyfpUMFmMlbdDNWFjGgRL08Qkt5RP535zUYravB/KnUVqTlMkTh
	0L0O4Z0Y+hOW6CPkcXcyRm7vMPi6/MazWmWfscJ0Cqx80thLgdanjdc3NZyW5+VtJ9OzXNxfLHt2s
	OJI4g0GTX5HxZc1u+rSWdIbavpfK/rSS18VulgROdsCeDftO30YKnDeXTC+04obw7YIbSYXyW9+Fu
	Mf1MJ6aZP3A/URAsfRpx4U3qhLOG5iAptpOD3Fa+kup0wmpE6WWixcvJll95C+zBrpfcWca/2ASZB
	tzzjpHPVvQXqjbCXpiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaPG-009ChE-AG; Thu, 16 Feb 2023 09:18:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaP8-009CdX-9Q
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 09:18:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id dr8so3505032ejc.12
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0OaMl2j24ssPCY78+tQ9h2rBFC0lvbgjl9TBRcDzuE=;
        b=WSk8SkTl9EoyJJ6lWRhrOy4GIRLG55z7HOikjpJK9gD3ZnNWyV8WiBs28KD7Vxtvmf
         5JJfNhqL/frGPEeRE73OuIH2lc2P1S1yxBYBfZ+f2HZt846a+pViAAcQAb27QdlR94F0
         ppdwMJIYaskjEZbuXw3ZsZrvlmJCFC+k1+80ekw6jc+gHQrFQjIUOMSaW6CzG1VMgE6Y
         sTQ9bNByHWroLquA6MkenemTD0BrPDskjgOrWfxu1uaZeZm8eOEmkBFLAeN/AXJV7r9/
         lI6MQXztcBQjjuLsU/2KOLCMOxRxbIEc1JvqQMEoFSAy8n7PiYePWIsgzBrfG0mH2Rcj
         dwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0OaMl2j24ssPCY78+tQ9h2rBFC0lvbgjl9TBRcDzuE=;
        b=0+vXop/lQNM2WImb27GJ8gAqoVOAh5p4Es0apV3LzKYIjhBiBAGrVpCo7uFROmjiQS
         8PS7uU3JvktPpzrbulTbNRocvRzNgl/kuo//uIFcdxKvm5Vn/buMqTNwDKzJiQ0rvlMi
         rrSnrIth+PouwJAG6bS0BaxB8fvSUhrttcif64ClzeK3YIZ5V+u3ZVJPqIuM9ijXjaEj
         U8uC0Amsoi1dD3m0K73TIt05ybFytgqpH1lY0B0TCwMTtyEvJtywG4Fd+lyQ/+XKbZgI
         woWdja6ycrFBbsHwQGFi+syscNxyhcRJTKYIJ8tEgDuxg/wVewzYcBP8Cf1JI413vUjk
         jQtQ==
X-Gm-Message-State: AO0yUKUGJ6I1vgLLXe9DkLQ3Pu0cgdTxdjB7XD4tVGypIKoI0lINc/fh
	ly+bSqEvAwPEbe0e1GQYCmKJhA==
X-Google-Smtp-Source: AK7set/0yZSEl0O3Eolg3vrUoRP0zKyWipe/qhUAkIfNDz34VhzrmmAd1oAq71N9MXp54mBNbA5Kqw==
X-Received: by 2002:a17:906:379a:b0:88f:9f5e:f40 with SMTP id n26-20020a170906379a00b0088f9f5e0f40mr5071128ejc.68.1676539088937;
        Thu, 16 Feb 2023 01:18:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b008b174ef3cdesm111131ejb.27.2023.02.16.01.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:18:08 -0800 (PST)
Message-ID: <b87003f6-02a8-64fc-80fb-b90ca6bec37c@linaro.org>
Date: Thu, 16 Feb 2023 10:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
 <1c5996a5-491f-39d6-b120-bbef86473729@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c5996a5-491f-39d6-b120-bbef86473729@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_011814_340859_BE5B2B4C 
X-CRM114-Status: GOOD (  12.61  )
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

On 14/02/2023 22:42, Heiner Kallweit wrote:
> Support passing a second interrupt as card detect interrupt.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 46e235bf2..c8c30300d 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -28,7 +28,7 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    maxItems: 2

Wait, you now *require* (not support) cd interrupt, so this looks like
ABI break.

Second, you must describe the items.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
