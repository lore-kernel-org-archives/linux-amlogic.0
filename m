Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75482EB64D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wM6cOfC4j5yi/tWJRWiXqKFHRjpCmTYPtet7LO0nSOE=; b=psDKmFqQvCOCEW
	pbcoLMfBCe+AMh4PEBIqCGw/H6aBqBJkAGyhMZeTyvfXOKcHjvMLM7hoNCzpRmz4IPo8pfZ4CVR9W
	RvZLF0ltvRH3dP5HhXvSp31+12O8NS6nqpxo6Uq5F2QCoCFHFT82EYFF4wnJeyXr4APZVOlJ2mZbh
	ljtsVgV4Fq+HwXoQOLtowhJKHOIeYax9EjBOZ4Z58slMe+vOCX5zSK9noWOOk58bCsV0fRfPQ6UAo
	zRgoU4PCVQ+n+XdIGgjMsvUTkR1x5/6msv7/CCTgphhbL121zSg8NpAVT21dHCHqWddkfpNt6j1j0
	4mMyYubSbYk1sku7a8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVuu-00APvi-10;
	Tue, 20 Jun 2023 07:36:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVur-00APuV-2G
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jun 2023 07:36:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-970028cfb6cso696905566b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687246600; x=1689838600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZI7OnXgmRov3B/rfcu20P8T8XSGe7PYJlAKKXlux4Q=;
        b=Sroa2wN361vfzcjkqvyBWHq0VXchgC/2z/iXAXwaPXZtIdW7yHjowNi7kT+Lm0sLFe
         qg8yi7HLiO8J9wrPzK1zxqtjnkXve9g5zQnbf5jCYmFdw6YKrBu6+2PUDaPACZJjdoXg
         J+ZgnmAjsROoDQ6P5mmJM//3pk96KcYTpo0nuYF2zcVGGyTxdP6Hdr2ucA83BAGvaaFH
         ovXwRpcEsiXpLNoeNbEd59fYs1s6GfQw93a21uUbDdXOKn9d7KXcsys3RPI8oVbu/Hqd
         Uj482yvgUccNAvEYUuvJXELitxGblmPlJSGtW3fsgS8jQd/Z+PlAYuTKSK6SSqpq/sJQ
         cq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246600; x=1689838600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZI7OnXgmRov3B/rfcu20P8T8XSGe7PYJlAKKXlux4Q=;
        b=WLfi5YicYk+WSCu0qab2DvmboxBTehPWpuNjwvQ3HWc6B8yBWf1CKdalNjcJ3EgXnK
         lqH4rvZ/1jy4jWZ1eS3wyoKFped9IPDeCOVMdLhto+7lFNjb5ZTIJphxZJI6gyx+Ait0
         ATkzHHy1usf8vlWzSMPoz9ToNYYmxNDVrVOs3U2q/btB1ERQi0pPyn21UPnyuCi8zJ90
         6JC/AO3NQNIMWwMtdul2AoPnUS2Lk/gkP6ZoK6q1JBzGxEazkCq7uyYWAsVU9g4qxaQ6
         XD0lE52VsbkeRs9gMzJQZmrwUfT9guQR1gDVXUUMjfYm9U/bW8asMCHEuInyeOI9Bepj
         1B1w==
X-Gm-Message-State: AC+VfDwX0te4UFMopzKDL06K3nP6Cbhn/WYO6buTy2bdVyzUviCQ7Z/K
	aSu+2uv4JGejYQVLJUyxO9vpJA==
X-Google-Smtp-Source: ACHHUZ4bE7uxC6DfKv3DJ+TojD1ucypF9vayabg+FgW35ZjeYM2/tm/RLx2cU7O/3vFG2sQVo4IdrA==
X-Received: by 2002:a17:907:1c8b:b0:988:a876:53ca with SMTP id nb11-20020a1709071c8b00b00988a87653camr5352645ejc.65.1687246600386;
        Tue, 20 Jun 2023 00:36:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906125700b0098733a40bb7sm854669eja.155.2023.06.20.00.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:36:40 -0700 (PDT)
Message-ID: <a895bdba-a48e-17e9-043e-9b950bbc1a85@linaro.org>
Date: Tue, 20 Jun 2023 09:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Content-Language: en-US
To: neil.armstrong@linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
 <777cf5df-6358-fa46-66cd-153d29763f77@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <777cf5df-6358-fa46-66cd-153d29763f77@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_003641_741162_D322340B 
X-CRM114-Status: GOOD (  13.23  )
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

On 20/06/2023 09:33, Neil Armstrong wrote:
> Hi,
> 
> On 12/03/2023 22:29, Heiner Kallweit wrote:
>> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
>>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> - consider that more than one compatible may be set
>> - remove bus part from example
>> - remove minItem/maxItem properties for compatible
>> - reduce compatible fallback complexity
>> - add that 8 or 12 GIC interrupts can be used
>> - fix typo
>> ---
>>   .../amlogic,meson-gpio-intc.txt               | 38 ----------
>>   .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>>   2 files changed, 72 insertions(+), 38 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> 
> Gentle ping, this patch is fully reviewed and is lying on the list for the last 3 months.

Maybe just take it through your Amlogic SoC tree in such case? It's less
preferred than subsystem, but still what matters is to get this merged.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
