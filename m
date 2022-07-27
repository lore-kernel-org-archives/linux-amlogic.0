Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB697C19F2B
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2HHM4IooIOjCXibXxK1mGgfq9k9Ci8m7j2A97YDOQU=; b=nzMngrhvH6kO1z
	TyLsafgsihbysV31lD1y0ZOtIsAeV6y8O+kV0QeIoOlVkD0NoI/4IQgTmHFqhnBbrnyWQACRbZolR
	cMp3ZB5oW70NLjW7b17hTQP7sVGXqprSDikFkg0lG7IuUGNUf7Vc1v1iaNCK173SjkDs6ib7+WL6S
	e+Lu1CPeeQb6MeE0ObjxEFihmJHgi6TCBA9mqThwq6FhXnkFMm0OVO75jM+QFZTJaDgTTJP2/wuTc
	UuyAdyLD8a65TIr9NHL6vrJhRzfhZbE9rxb47or8wqcPJ59CR+rEEEDw/gq0SU5L2ORruvQwkdmSq
	DRi5j4WNMYFUKWKSORDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGivc-00F26p-OV; Wed, 27 Jul 2022 15:26:28 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGivZ-00F21h-Uc
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 15:26:27 +0000
Received: by mail-lj1-x231.google.com with SMTP id p22so10399017lji.10
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0mF1oI1pJZmSieB3wXSlOY9epoXI1hphuf7YfBoklfM=;
        b=UNT7Qim9QA+w/2JT+GGYhUKLSQKuXqZrEm5f5ZQZN7pycIf9opQaqjb+mKNaGsFYZc
         ts/7lMlWz6z3PW1L3Uqm7LyZTRkY9FUcMx5V8o8yzif761m8LxIpXTINJM0XZdWK/PdB
         +kaAFZET6+RR/3Q+qLUY1WSsnQZCWqwRtPo0m1ZqDtIZTlQGbhpJrZReuLj7v+Bg75nW
         PX8v3XM2H/aclDwO70+i2xC2zyDNbD+09fPQBpfcBrHLEBRaSx7TIy4cIuwtEVwSk0gw
         rDd/XaRdqplClZ32ww73wlqTFSPhVMviFgCzyWxeEw6iA6KhAWKMchr/o0l/tf0a9UjG
         0Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0mF1oI1pJZmSieB3wXSlOY9epoXI1hphuf7YfBoklfM=;
        b=wzpEyp+So9jjAxlPC9Abx7Jwvt1DVMYwCADHc33LlxAlBSUrlOmgTiaNHwj0A5cl3k
         C+zfzaMEhKQaB3oZcsofGoQgahmUQ3UpytgOkzQPLIsMfsjFM7Yn0rAnBZQLswKVnG8Q
         jLSwH8pmJgm4asPcQI2zcFTN1RfiX74+PD3Qum/1Zmjpraop6DiH6TDL+4z3Yrbp6d68
         SMoxtoDgjv0bDPJm47Z5Rb3fuDf91G4VNPC8vP0z3asD4rbbiIdimIIgE/fqTtL6n9H2
         yR+1iAPmUORfcq2mgKvPrbWmL4M7PkHkmZwqyEwXyERwY2iB+n0VVrtEHNphKj9QaMTG
         LJNg==
X-Gm-Message-State: AJIora+lORZiHB5hrCgZrX7NVnVXB8OR8mqk+qfwzOALfdKaigO9Y8lY
	bDZraDH6JySk1dsDOrSncYfq4w==
X-Google-Smtp-Source: AGRyM1vyqiinwPc4/1VoCNVulna424uhIP0azt/mhoIusJSkQdyKzzPC3faBTIa0mC+S0u8/9vTR1g==
X-Received: by 2002:a2e:2a85:0:b0:25e:1f29:404c with SMTP id q127-20020a2e2a85000000b0025e1f29404cmr1813882ljq.308.1658935582046;
        Wed, 27 Jul 2022 08:26:22 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651211f000b0047f7c897b61sm3846341lfs.129.2022.07.27.08.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:26:21 -0700 (PDT)
Message-ID: <b1aa7835-631b-9380-e529-687ee0c16f7d@linaro.org>
Date: Wed, 27 Jul 2022 17:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 narmstrong@baylibre.com, martin.blumenstingl@googlemail.com, sean@mess.org,
 christianshewitt@gmail.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
 <tencent_27A429274A1A0E0C082FA6C700DA856DDA09@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_27A429274A1A0E0C082FA6C700DA856DDA09@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_082626_020947_89907D15 
X-CRM114-Status: GOOD (  12.39  )
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

On 27/07/2022 16:41, Zhang Ning wrote:
> On Wed, Jul 27, 2022 at 09:06:07AM +0200, Krzysztof Kozlowski wrote:
>> On 26/07/2022 16:36, Zhang Ning wrote:
>>> Add manufactor bindings for Tmall
>>> Add the board bindings for Magicbox M16S Tv Box
>>>
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>
>> All your subjects are still partially wrong. I pointed this out in v5
>> and you still send v6 and v7 without proper patch prefix.
>>
>>> ---
>>>  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>  2 files changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> index 61a6cabb375b..a67af2adf6a5 100644
>>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> @@ -125,6 +125,7 @@ properties:
>>>                - libretech,aml-s912-pc
>>>                - minix,neo-u9h
>>>                - nexbox,a1
>>> +              - tmall,magicbox-m16s
>>
>> Previously the vendor was magicbox... now it is tmall. But you write
>> also Alibaba. It's a bit confusing.
> 
> Tmall is sub-company of Alibaba, if I use alibaba,tmall-magicbox-m16s
> this will be too long.

OK


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
