Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3297C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cysd+5+BcQGzsnSB1UJ7rEKX60cINEO2V2IsM9mPpeQ=; b=XsyaSjUk7Ft+Ux
	T0Nc8rKhj2Bmyr7S9gYJqXsjcb/wDn76jRWpU4Fwz0Dl/Xw3b5Fs/8QHFuXY0ATPeEWPRcOe8lChn
	jpvnZWwqimR+ApEKmFBtq2mv9pNOyUsF6/uKJ9M+C14G2h1O+C7LHu1gArlJhQQnITIPo12hOkBWe
	FzG5mvIsDHEXtsa2Q6462qdfMbrmjyfbSW3LfDH/09X/5rKKPmqk5Oo0yuskPkXb2tc9oZq4zcKqH
	fFvqSQPl5HkpB96xfxdGH+b8d5rQuM5LTbRZ72Co4oxbli1P4uPUEC2ni5upaLK3vBmdSkaueeIbd
	sDuX33bc0lfEjgMlf8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NZZ-008uyl-0P;
	Wed, 29 Nov 2023 16:38:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NZU-008uxT-3D
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 16:37:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so56346025e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 08:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701275875; x=1701880675; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FWyzIycAhixRpcgq6BG+vxReDnTGBpSHfPY7iVZZqyo=;
        b=sLCRznh/OVslSLxwKTTSMd0LZIWeUK89MdQP8sYrDvFmIdKWjbcdyyrm1VOG9V5j01
         luRptZM6utFLYxTJZ5qKBQ/z+Eo3ZtooBT8Qly+uJqQbn4M/8iBHc93a8uOCMWXrtPyD
         cFF95wq0WEw/VZtj63jHutInLGIePX/bFgsKkMoVT4CMkSobB/02ILQWoJrgwPv3M2ES
         hbqulenbqEEiBZzIuqX4aMld+9uTy8NA/nEL45P8bpNMG1MIrEsuk6IQBwq76v+6X8lK
         76fD8Hpj2jCUerzdr9YKF+usGfSiaj+JuFs1BWGqk1VtVu+tLBH8jUXDNVvqM61LbqDG
         JHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701275875; x=1701880675;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWyzIycAhixRpcgq6BG+vxReDnTGBpSHfPY7iVZZqyo=;
        b=ULOI3zhJE63LJ6/4JttYVrwFpCIrtvDzVp3nnqWFPMELhoB+TpzZIDl4+9Z/RVwPZy
         0d+TowBMlMF9IlG82QH/TLMSdYFbqE4248MMhYdnXAYcYMB6mYAsm8M3TVyQgpbuLnrB
         0IeU2s8FB8VUS/lUQZ29Dn+CS/YbGJGKIC2gDpwi2ZEdYRDwK7WO5kopbUKJAjnWfdmZ
         ORj6mi/yD5V9KzpKs6xTDaAXpbPFGCWbf3GD6MmarAtlbz6zO6N1fQz4OhqsGC1kV/0l
         IdYkCao7hppGzbSQBtC+2/DMKpdfZ2XADLyU/owC/3qV8XTlZWS/w0eorcU7exKgnnqz
         fhLw==
X-Gm-Message-State: AOJu0YwgWdR2wvdALeJXOZ3iN4pOJuvc5svzRTfPbO4kwXamQJrZuVZU
	7BVb1vPj1qTR69eW8EDEUoWDjA==
X-Google-Smtp-Source: AGHT+IGPzQLHnNMiY0pGKwSqoSExLd5uE8iP+sPsfVle142Jbb03oHPeUBOVT+9ytx/MlONjkBmq2Q==
X-Received: by 2002:a05:600c:4fc5:b0:402:ea96:c09a with SMTP id o5-20020a05600c4fc500b00402ea96c09amr14591359wmq.16.1701275874667;
        Wed, 29 Nov 2023 08:37:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1885:1b93:1f61:bf1b])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c139300b0040b540ff0a5sm2430843wmf.19.2023.11.29.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:37:54 -0800 (PST)
References: <20231129134004.3642121-1-jbrunet@baylibre.com>
 <20231129134004.3642121-3-jbrunet@baylibre.com>
 <8e78be99-3d4d-4f79-9791-404e60bcb67c@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao
 <junyi.zhao@amlogic.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible
 for meson8 pwm type
Date: Wed, 29 Nov 2023 17:26:35 +0100
In-reply-to: <8e78be99-3d4d-4f79-9791-404e60bcb67c@linaro.org>
Message-ID: <1jfs0ojz1a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_083757_370260_807663F4 
X-CRM114-Status: GOOD (  26.50  )
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


On Wed 29 Nov 2023 at 17:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi,
>
> On 29/11/2023 14:39, Jerome Brunet wrote:
>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs,
>> dealing with clocks differently. This does not enable new HW. It is meant
>> to fix a bad DT ABI for the currently supported HW.
>> The original clock bindings describe which input the PWM channel
>> multiplexer should pick among its possible parents, which are
>> hard-coded in the driver. As such, it is a setting tied to the driver
>> implementation and does not describe the HW.
>> The new bindings introduce here describe the clocks input of the PWM
>> block
>> as they exist.
>> The old compatible is deprecated but kept to maintain ABI compatibility.
>> The SoC specific compatibles introduced match the SoC families supported
>> by the original bindings.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
>>   1 file changed, 46 insertions(+), 6 deletions(-)
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index 387976ed36d5..eece390114a3 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -21,23 +21,35 @@ properties:
>>             - amlogic,meson-g12a-ee-pwm
>>             - amlogic,meson-g12a-ao-pwm-ab
>>             - amlogic,meson-g12a-ao-pwm-cd
>> -          - amlogic,meson-s4-pwm
>> +        deprecated: true
>>         - items:
>>             - const: amlogic,meson-gx-pwm
>>             - const: amlogic,meson-gxbb-pwm
>> +        deprecated: true
>>         - items:
>>             - const: amlogic,meson-gx-ao-pwm
>>             - const: amlogic,meson-gxbb-ao-pwm
>> +        deprecated: true
>>         - items:
>>             - const: amlogic,meson8-pwm
>>             - const: amlogic,meson8b-pwm
>> +        deprecated: true
>
> I think deprecated should be moved in a third patch

The complain on v2 was that it was not clear the new binding was making
the old one obsolete. It looked to me that the deprecation old bindings
needed to go together with the introduction of the new.

I don't mind one way or the other

Is there a rule somewhere about this ?

>
>> +      - const: amlogic,meson8-pwm-v2
>> +      - items:
>> +          - enum:
>> +              - amlogic,meson8b-pwm-v2
>> +              - amlogic,meson-gxbb-pwm-v2
>> +              - amlogic,meson-axg-pwm-v2
>> +              - amlogic,meson-g12-pwm-v2
>> +          - const: amlogic,meson8-pwm-v2
>> +      - const: amlogic,meson-s4-pwm
>>       reg:
>>       maxItems: 1
>>       clocks:
>>       minItems: 1
>> -    maxItems: 2
>> +    maxItems: 4
>>       clock-names:
>>       minItems: 1
>> @@ -58,7 +70,6 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> -              - amlogic,meson8-pwm
>>                 - amlogic,meson8b-pwm
>>                 - amlogic,meson-gxbb-pwm
>>                 - amlogic,meson-gxbb-ao-pwm
>> @@ -67,14 +78,15 @@ allOf:
>>                 - amlogic,meson-g12a-ee-pwm
>>                 - amlogic,meson-g12a-ao-pwm-ab
>>                 - amlogic,meson-g12a-ao-pwm-cd
>> -              - amlogic,meson-gx-pwm
>> -              - amlogic,meson-gx-ao-pwm
>
> I don't understand why those entries are removed

It's a mistake. It should not have been added to begin with in
the first patch. "amlogic,meson-gx-*" must go along with
"amlogic,meson-gxbb-*" so it matches correctly without it.

I'll fix it

>
>>       then:
>> -      # Historic bindings tied to the driver implementation
>> +      # Obsolete historic bindings tied to the driver implementation
>>         # The clocks provided here are meant to be matched with the input
>>         # known (hard-coded) in the driver and used to select pwm clock
>>         # source. Currently, the linux driver ignores this.
>> +      # This is kept to maintain ABI backward compatibility.
>
> Same here, this should go in a third patch
>
>>         properties:
>> +        clocks:
>> +          maxItems: 2
>>           clock-names:
>>             oneOf:
>>               - items:
>> @@ -83,6 +95,27 @@ allOf:
>>                   - const: clkin0
>>                   - const: clkin1
>>   +  # Newer binding where clock describe the actual clock inputs of the
>> pwm
>> +  # block. These are necessary but some inputs may be grounded.
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson8-pwm-v2
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
>> +          items:
>> +            - description: input clock 0 of the pwm block
>> +            - description: input clock 1 of the pwm block
>> +            - description: input clock 2 of the pwm block
>> +            - description: input clock 3 of the pwm block
>> +        clock-names: false
>> +      required:
>> +        - clocks
>> +
>>     # Newer IP block take a single input per channel, instead of 4 inputs
>>     # for both channels
>>     - if:
>> @@ -112,6 +145,13 @@ examples:
>>         clock-names = "clkin0", "clkin1";
>>         #pwm-cells = <3>;
>>       };
>> +  - |
>> +    pwm@2000 {
>> +      compatible = "amlogic,meson8-pwm-v2";
>> +      reg = <0x1000 0x10>;
>> +      clocks = <&xtal>, <0>, <&fdiv4>, <&fdiv5>;
>> +      #pwm-cells = <3>;
>> +    };
>>     - |
>>       pwm@1000 {
>>         compatible = "amlogic,meson-s4-pwm";
>
> Neil


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
