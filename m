Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C9CA5FCE
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nL3qCYYkgaNENmiwX2snF8RqCD9xJxXz0aWqHcQzOk=; b=DbbEFGskZsZ2xe
	TuWxkSf3htuKlGYOIl1kEXfZ8RfrkEKw3ZgINH/vGK9NWgxgMCKQZUkZ0vXL4kjsnfz/TzKXMOfCh
	m3JFUgGHH28IhnM1YXAjw/ECQHgnIa48MPRjifTDMV0nTZgsOt02w/QloMsSSN3igzr3qXgY7bwxW
	HwsweNZOMoNSL9x1N5kMJH9ZhyGRqozK6N/MKQii7SBg6uAK8nUUob2cTMbZDICTJm8I4f4hfuxfE
	jfh7Luo5mr/feiJG4L4PJw6tRS4Q2TxqnESNFLmmTJSL5she52sF6H2/rOJDJK4mQXpdUSjOiqnS6
	BlaTRs7gFztMLBGq3C5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMra-0000000EtRd-3xoA;
	Sun, 04 Oct 2026 14:06:50 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMrW-0000000EtQr-3phb
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:06:48 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5606655e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122805; x=1791727605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUXvy50bECQ2jjyhstzsZVcApJzJFF/Z6zq/JzULuvY=;
        b=kZ/804spilm3ojNcenEO4ay/C2jUsTPufavWDd2+sRNUukNW7N0k500apISQxEk5tJ
         rJHRpWtSHEK195DPR/E9ez99l2qRb/GVKzyRhJSlU+x+fcFwF4ccUh9keq7ORHowDs0C
         QJyLNvwfVAs9XK9vJYXW+J7oxB85iqRyT46Ws5q+8ZcP0Slu4Py5oaHwk4ors9m9BASL
         4aQ3Pc4zlpXmo1O0+l+OWLkL1BY6X7xukwWjHQrLtcMroZ8W3xCPSIJtddTGweL+jhb6
         XH/6sVKN4u+6bx86Ayp41jhD41PelYnfPaY2AwwHdWYD/pzFePCfJc9pFDH379xWd8B/
         U/AQ==
X-Forwarded-Encrypted: i=1; AKwUvByWfD28wT+fw4PWozlom2iDPrGIqo/8Dcnhy4zpARJrOetGHsPmEFemm5a+OfuFQBhE6dJgYDS1Fu9AYFcj@lists.infradead.org
X-Gm-Message-State: AFuF++mHbopxWwAjMT572X2Q70VixWK9XrgqcWkoOz3LpLQH+n3occwn
	5sOHn/0P2TTOwUPScp46JnE623FQWoGbxWziW2RsFN0FavDNWjiU6U7A
X-Gm-Gg: AYBFou1QGD0HNg0TXlgy+4GEgkx/n56lVHGxnKELfn7N+hsqSzPvxqX7dtbWKxeMFMN
	KSGHHjobJvVFfC0xUbxJI/l+Vit4kLjA9hQjn8l3fADxQUc3h1hqWXnL06of7qkjn1THu3PJemv
	ueoX2kEs2gNGjHV8L5W8WgT6Q4bi40G8gWlcM8N54osOxE+9EvJIxLlSU21GAq6ugE0Zedd7qJA
	AIQ4oChRW+RlE4WZ6/W21ErUMGe0IM7Gb/6eQwJWyjxVA9hpXJ7uNOfJbhj+XkQ6vaPVq+xdeiG
	9ul7K3bua74zSNY01Uw0X+Gv/uHnTDLsO6WSSSNMcGq2J1/SNmlTxU8OON+eEgTI5MGOjHApt7d
	p2ubnrnWBQMuPsfNf2Tbx0m/xPQT9X+HVNZWBOuFANO39N+ho/vjjwptvNqgW8gV2EbpgSzozEN
	RLO/noh6/NTIKkNo//EvFnB9rN2PEEUo5DGvd7yPdIiZxDQmw+oASo5YhGVM3y9CCHbv76PEj33
	0pQ0lMEnlb10qCu9K1d7OheK74w
X-Received: by 2002:a05:600c:6212:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a0275432f7mr127957445e9.9.1791122804538;
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17125adfesm30902405e9.15.2026.10.04.07.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Date: Sun, 4 Oct 2026 15:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260924-stinger-stoplight-7c327c3225fa@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_070646_997171_68BA0B1A 
X-CRM114-Status: GOOD (  21.87  )
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

On 24/09/2026 18:21, Conor Dooley wrote:
> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add the T7 compatible to the Meson DWMAC binding.
>>
>> The T7 DWMAC controller requires the following compatible combination:
>>
>> amlogic,t7-dwmac
>> amlogic,meson-axg-dwmac
>> snps,dwmac-4.00
>>
>> Add a conditional schema check to enforce this compatible combination
>> when amlogic,t7-dwmac is used.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> index 5c91716d1f21..b529ca5577a9 100644
>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> @@ -23,11 +23,24 @@ select:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>     required:
>>       - compatible
>>   
>>   allOf:
>>     - $ref: snps,dwmac.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,t7-dwmac
>> +    then:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: amlogic,t7-dwmac
>> +            - const: amlogic,meson-axg-dwmac
>> +            - const: snps,dwmac-4.00
> 
> This is not how fallback compatibles are described.
> 
> Instead of doing this, which affects all other compatibles in the file
> by allowing dwmac-4.00 for all devices, please do this the normal way.
> dwmac isn't special, it's just this binding that's weird!
> Can whats currently in the binding (before this patch) be largely
> replaced by just doing:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - amlogic,meson8b-dwmac
>                - amlogic,meson-gxbb-dwmac
>                - amlogic,meson-axg-dwmac
>                - amlogic,meson-g12a-dwmac
>            - const: snps,dwmac-3.70a
>            - const: snps,dwmac
>        - items:
>            - enum:
>                - amlogic,meson6-dwmac
>                - amlogic,meson8m2-dwmac
>            - const: snps,dwmac
> 
> You'll have to check this yourself against the amlogic devicetrees and
> see if this is correct, but with this you should be able to add your new
> device without doing anything special.

I have the same patch in my T7 work and checked it against the amlogic 
device trees: meson6 and meson8m2 use the two entry form, the rest add 
snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example 
needs fixing.

Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
in common.h, so the core is 5.10a, not 4.00. And the controller reaches
DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
so clk_disable_unused switches it off. My node lists it as a fourth
clock. Does the AN400 differ?

I will send my series today so the code is on the list. Not a race: I
will drop or rebase whatever overlaps once you tell me.

Thanks,
Lucas

> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>>     - if:
>>         properties:
>>           compatible:
>> @@ -38,6 +51,7 @@ allOf:
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>>                 - amlogic,meson-g12a-dwmac
>> +              - amlogic,t7-dwmac
>>   
>>       then:
>>         properties:
>> @@ -93,6 +107,7 @@ allOf:
>>                 - amlogic,meson8m2-dwmac
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>> +              - amlogic,t7-dwmac
>>       then:
>>         properties:
>>           rx-internal-delay-ps:
>> @@ -139,8 +154,10 @@ properties:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>       contains:
>>         enum:
>> +        - snps,dwmac-4.00
>>           - snps,dwmac-3.70a
>>           - snps,dwmac
>>   
>>
>> -- 
>> 2.52.0
>>
>>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
