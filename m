Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE2EC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPwD0D04sx7HedxiIr5uK5M4FygaOyyW8b++G9Fquj8=; b=OFGcd8HXf1osjb2B6ztpZMpztN
	kkwRsWyX4/iyd06wzpp72gFswvlh0tw0ukPmS8ScCyh4Yn0UrSkcxWjklxO40+lJ4pAoy2T56Hzxg
	4Wa+3KBDaTZSCcrPeIhYsNJYTG6KauZh/a3Y6j2BG+ZLJ1+gwsg5aLfIMJTdXYOhKDJjVJMRFQMkf
	XTYXPGi6jWAl0PkID2gidD+YnCpV6hS9GCwmbfewsIqXAFGRsZeK2FZAHWwUY/e2n/xdCKO50Iq74
	8Dywyd/TKDlIiLx7uZMoE5lqQbPktr1mI3cL2pbZX3xxltYPPUW489vew3y5jXrNWjMV5tdkb25gh
	XWJxfu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGZU-00C7c3-NJ; Wed, 02 Nov 2022 16:26:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGZJ-00C7XE-4a
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 16:26:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id v7so5222105wmn.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zv7Fq5k50QWQLxnPbss2vXizhHRaHgo0CLWyEMOtNXY=;
        b=XLT+2bOf52xM6JdQqN+Tbi3UN/LLLCaptLMtL5KvSTYPvI/lUr4ONN2+m47aatNmUE
         rdrtReOAY4RmLpenQiqcMEofRRUhxktec1oIjlF4j6H6wmkxi5XEDnpOZ9QGJaSBxv+F
         LhWZTjMyJ0KzHsT2tice4ZplDy8smvhGjPpxQ+xekviGu2gOZfr+P+dYshaOnkeqsqVi
         uLKwI/Sm12ueV22i0iRvO64/ABCyk4cZb6c2neFCEhma60LYtaOmfJBEUoWMY7xkEKJ/
         WLGsayqA2AIVW/hhoObdJU0oqJ/+fBkdyyFvsfYKhIOtXxaDfx5ozca5oUxePLiG0MUO
         U5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv7Fq5k50QWQLxnPbss2vXizhHRaHgo0CLWyEMOtNXY=;
        b=eNu04OUhsSCUdydaM8VuirTm984YtFCZWfuAgJV7X0BIZlqfiWTOoB8Hiw3v4vuSOC
         P0XN2CGoUR/qg9E7S686L1uJUbLyrtjxn5PLisG1UjHr/8KsIb2KgJYuwoKg7SVkyf5D
         Fk9s4EDudtjbuMppubrLihRIn2bJ29ExI55iwsunSzR0pJ2QrrJmlCL8l608ksFjNgrS
         OKF2Qm+ShrEBNxCOo/1mP8hXNRqtiSdzTqvdX3r6MdLMFcsru+P354pexFb2K1L7/7pw
         Z3vuuurlHGbXyLebdLbG1imCVoqQHy/kla3ffaDvvx7jIZ+hkYyV7yx4BCLoj2zpcZ6S
         81Aw==
X-Gm-Message-State: ACrzQf0QCgv1tFKrPAUSKFgi6LMuI0TeLMWTMu4eb8XMEVXyZY+bdXfq
	wegV1g8iXBMoSuDE6TmWDFAAxg==
X-Google-Smtp-Source: AMsMyM58DL/hkAn4DnGcSmAn4Lnobs2eqhlbRBLy1/I33qod5riKNI2cBWPxvRt82gxskj2IR0PZIw==
X-Received: by 2002:a05:600c:4ed1:b0:3cf:86ab:3a0f with SMTP id g17-20020a05600c4ed100b003cf86ab3a0fmr2853053wmq.106.1667406377451;
        Wed, 02 Nov 2022 09:26:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3541:e8cb:4c8c:e204? ([2a01:e0a:982:cbb0:3541:e8cb:4c8c:e204])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003c70191f267sm2844571wmn.39.2022.11.02.09.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 09:26:17 -0700 (PDT)
Message-ID: <f7f0ced5-d8b8-08cb-e354-780dc69a68cd@linaro.org>
Date: Wed, 2 Nov 2022 17:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: document Odroid Go Ultra
 power-off
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
 <20221102162344.GA3993882-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20221102162344.GA3993882-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_092621_232866_2ECE7E6A 
X-CRM114-Status: GOOD (  16.70  )
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

On 02/11/2022 17:23, Rob Herring wrote:
> On Mon, Oct 31, 2022 at 05:47:25PM +0100, Neil Armstrong wrote:
>> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
>> to its two PMICs in order, this represents the poweroff scheme needed to complet
>> a clean poeroff of the system.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../reset/hardkernel,odroid-go-ultra-poweroff.yaml | 42 ++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
>> new file mode 100644
>> index 000000000000..65e42258717c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
>> @@ -0,0 +1,42 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Hardkernel Odroid Go Ultra poweroff
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
>> +  to its two PMICs in order, this represents the poweroff scheme needed to complete
>> +  a clean poeroff of the system.
> 
> You don't really need a node for this. Test against the top level
> compatible and then find the PMIC nodes by their compatible strings.

Hmm ok, indeed would be simpler.

Neil

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: hardkernel,odroid-go-ultra-poweroff
>> +
>> +  hardkernel,rk817-pmic:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the RK817 PMIC node
>> +
>> +  hardkernel,rk818-pmic:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the RK818 PMIC node
>> +
>> +required:
>> +  - compatible
>> +  - hardkernel,rk817-pmic
>> +  - hardkernel,rk818-pmic
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    poweroff {
>> +        compatible = "hardkernel,odroid-go-ultra-poweroff";
>> +        hardkernel,rk817-pmic = <&rk817>;
>> +        hardkernel,rk818-pmic = <&rk818>;
>> +    };
>>
>> -- 
>> b4 0.10.1
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
