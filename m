Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3BFC05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdNCeHCsduL12AEBlSUeMisIPE3gLZRb+DWeTJkSR40=; b=S+ChcxWHPIoVi7V+J/2fS4N+vB
	bOGtPnaodTnIRfLL8B++fjQH6gdwZcXQsCgeInA7J8pbW3XqYuKnJKSNbnneaOAAjquyHpUSC1bsl
	WbUkFdMxnq6IGjqFQteydu3+KchXvvfdDxZpyJoSYIya8rfiFQMI5WBs9OzcZh1gj09NDORgagbw5
	z5cpaTRu6zwJuK2ID+a8ZvPu57AdZANrLcABszz8VLzMEDJ30EHh7bv9noV3STjYjotzN5I5MWkqJ
	++qUOjsoiss4mHVLKWX6VhGgKnSN7bM+gcnYShJUTvZdQ2A43bQxzi+Kju98tQuAqwdVdYkitHkXM
	Z98ODklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAnU-00BMZs-Sx; Wed, 01 Feb 2023 10:57:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAnK-00BMUt-Lx
	for linux-amlogic@lists.infradead.org; Wed, 01 Feb 2023 10:56:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id t7so8544025wrp.5
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Feb 2023 02:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl7xjwnlIFO9cTPnHakzqSLtSfVZPcvJWgfAb9UTMgg=;
        b=yMwEZzFJds1B31S8gN6Gtf3DXOsheuyX+qdKKzQ1XkldQSxHFEm+qWlYJCE95L51pm
         gmFplAF3bDfpnRBjiuWm7sxaIPnZNbkwY4FHvtv4KquGN8IuauXG1mTjvKXslADq7RQw
         X7EGQSFtfGh2vS9VVUcKMXowGNKmeQbwBymnOoPl0JB7DB/3CVhBYYdJ9KyVIYEjU1yi
         kW2WXgrylGrw4gWvwTBtJrYMFWa2aW3G9PgeRaIETAbdyNhZNnP2dp0sD158O3ieDN9V
         ZQV6FMqiMlKV3/IaU1Zms6aVa9y7DPuxEWuOGAiPmsikz3NJhHpZlQAPW6Tbf7WiNYzX
         nl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl7xjwnlIFO9cTPnHakzqSLtSfVZPcvJWgfAb9UTMgg=;
        b=oUSyDq+0INi9X13qpEY3b1A0FImMBDjcA/5CgRDxR7Mave/TE0lBq6K4JgGlOfaLw+
         30Xj6SdijjtqGZ+ufJRfDqaSxsxcvuX9urNwhIt60eh7i1BCCAGENTRd0SYQsUpLgGse
         vFHS2nUQWz0k6DnxRgwvphYNOzHiyPj85CBznTbUPWgtA+j8RyAa+TGHboffmJ/ihjzt
         252mB1YgvyL4cgu5aIodN9MHCZ3nk58WrvZWIR7lz0lDbEQzxgRUnMBbv6o1HpoWKCkG
         ZWfQdWmnlpdWx29IdFgQMEhjxPedpVoS2gZs6SFcfiRUaklGwPmNdFHxLAfm2EWIyjrx
         OGdw==
X-Gm-Message-State: AO0yUKVv4lOv8pUTSgp5tDSl6yISdJHOx/ASER7QZZqIvjxdRjwDPA70
	Xcp6ZOHx5uWe05QbjBH4CALy8w==
X-Google-Smtp-Source: AK7set+KPB702v3Zc0QEXCUeeDFVfwvU1Lo9YL4UGHj4SIr90S4Y+aj9ttU3Tq07PI/5GAwPH9ZT0w==
X-Received: by 2002:adf:fc88:0:b0:2bf:d137:9945 with SMTP id g8-20020adffc88000000b002bfd1379945mr1887395wrr.51.1675249006727;
        Wed, 01 Feb 2023 02:56:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bad9:621b:618e:38d6? ([2a01:e0a:982:cbb0:bad9:621b:618e:38d6])
        by smtp.gmail.com with ESMTPSA id v9-20020a056000144900b002c3b2afae00sm1870583wrx.41.2023.02.01.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:56:46 -0800 (PST)
Message-ID: <604029c8-3286-8514-ec35-6c5cb1b7a38a@linaro.org>
Date: Wed, 1 Feb 2023 11:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_025650_727655_43A83A19 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Heiner,

On 30/01/2023 22:00, Heiner Kallweit wrote:
> Convert Amlogic Meson pinctrl binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>   .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
>   .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>   2 files changed, 122 insertions(+), 94 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 

<snip>

Please send new versions as separate threads, or keep the same thread structure othwerwise
it highly confuses humans & b4 when applying the patches...

Assuming new revision: v2 ([PATCH v2] dt-bindings: pwm: Convert Amlogic Meson PWM binding)
Assuming new revision: v4 ([PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding)
Assuming new revision: v5 ([PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding)
Assuming new revision: v6 ([PATCH v3] dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding)
Assuming new revision: v7 ([PATCH v2] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding)

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
