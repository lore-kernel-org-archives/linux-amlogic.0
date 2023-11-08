Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D93C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OooAuK8eMqxkfazwruqEDcPc4q5A7/VTcXOr/IVU/IU=; b=ocs1I/o5bE3hkM
	HysvAknocyE0n6G8+AqnCo/lcwEQ09J8Tzpzu1ErrfnJY94Gyf4fmBIcfhtR/jMIxSDC8FJu9AVWK
	KvQqPnUDETBC4KnwJ3U8EIKwNPTKWhMVkp8zVn1x/mERzh1fD1zl7WBZCbc8XQWC36uQeBNVbcUiK
	0DcpzF71Pcmad3Klu1bVezjVA7dMFNWQpWj6eN86HwXCKTMiu7Nf5m9SGtnTsS1ORlsc0vcUG3yNK
	Nb39mU8eeodUGSyyLrvlIxfwB+biHiHndlOUDQbhbvqeiR5dJV+dSK3nZ3+OqGZrV5SU8nZQlQwRy
	Uxu7Zp9hJjNvBqJLijyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m4x-004NH8-2v;
	Wed, 08 Nov 2023 17:10:59 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m4u-004NG9-0W
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Nov 2023 17:10:59 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c50d1b9f22so94321491fa.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Nov 2023 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699463451; x=1700068251; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=IFz0eNLwTOarw1Cn3vCdHlCb5O2fB0yCDsA3mDW0SnA=;
        b=oK+JE2XL9saOBneClb1AcW7jJyXWvlLlMegTZTX+uMRpo/elxQJNDk1ZJDntBkfgQV
         ax7NH752ugVZ3NpM2Fe1Wt9tiRy2uqqL//xLzbItr208nnIuucqWNtwtlnjlzkW6vla2
         v5vdLad1Q+iY3HgjYptWNy8w6sXmB1S8xqS/Sy3PB0TC25QNx4bqPg7vy5LpGZ1pTAjW
         lb6lfd8eEZnUkTAm2CVizToFzLulTXF512BOAIoTlDS3s3jkOJ5Zf2YYlvVBBCGqS1UM
         5D+VVkuaUE9/chN7RnejQZckN4QY55fyhl1LTw8aMliCg2sgSSIn8Q6bD5jXLKYbYq8o
         Z8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463451; x=1700068251;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFz0eNLwTOarw1Cn3vCdHlCb5O2fB0yCDsA3mDW0SnA=;
        b=Jn0m9ujBxFtlVQlKxCCOuLcAVPM7kU1Ei0uInaSL5D3koRMz6JxF5Eym6jdrJtSN6j
         uq6DpeY1y6a6Fgf975YveoZ7JZ+hqBsswGz2odSk7zChHTvZ5AwTgcMIFJGoEerXthUw
         PivyBQn+x0tubp8L0xFv7VUZjfyXic9bXc9JtN7xoxuwpbIDC2r5BWf4NMUlnhMohMhp
         3s7hbqsVgutgPIN+rigXotodi4sDS/jeMpsLgR84HCPc9Kmcdnmid8SSLegPBe6mbtHF
         prOV2iFN/fbL1Tx5Dbnbuz5LujvqTpA03PXYIgvQU2XGNhZJwopSi+NgYPYS32ASANXy
         DzDA==
X-Gm-Message-State: AOJu0YziyEDDxs73jG4N4gINh/jAHq+Yeoa69IsKHlmVgqiQikQ/YKln
	T/AGzHFYSxmYnCs8P/kW0tLn/g==
X-Google-Smtp-Source: AGHT+IF1FSTZDOkyqqQddRNlqkjWeUassJy7xXc1gtYTXwCTvhN31qmjvUL0EtDj8GuAWMzO/KdJqg==
X-Received: by 2002:a2e:9617:0:b0:2c5:1388:e370 with SMTP id v23-20020a2e9617000000b002c51388e370mr2282793ljh.30.1699463451176;
        Wed, 08 Nov 2023 09:10:51 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dfaa:8961:ce90:9db0])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b004095874f6d3sm20477052wmb.28.2023.11.08.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 09:10:50 -0800 (PST)
References: <20231106103259.703417-1-jbrunet@baylibre.com>
 <20231106103259.703417-2-jbrunet@baylibre.com>
 <20231108170448.GA2388329-robh@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 1/6] dt-bindings: pwm: amlogic: fix s4 bindings
Date: Wed, 08 Nov 2023 18:08:55 +0100
In-reply-to: <20231108170448.GA2388329-robh@kernel.org>
Message-ID: <1jbkc4cgrp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091056_390928_65E5AE2B 
X-CRM114-Status: GOOD (  22.86  )
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


On Wed 08 Nov 2023 at 11:04, Rob Herring <robh@kernel.org> wrote:

> On Mon, Nov 06, 2023 at 11:32:48AM +0100, Jerome Brunet wrote:
>> s4 has been added to the compatible list while converting the Amlogic PWM
>> binding documentation from txt to yaml.
>> 
>> However, on the s4, the clock bindings have different meaning compared to
>> previous SoCs.
>> 
>> On previous SoCs the clock bindings used to describe which input the PWM
>> channel multiplexer should pick among its possible parents.
>> 
>> This is very much tied to the driver implementation, instead of describing
>> the HW for what it is. When support for the Amlogic PWM was first added,
>> how to deal with clocks through DT was not as clear as it nowadays.
>> The Linux driver now ignores this DT setting, but still relies on the
>> hard-coded list of clock sources.
>> 
>> On the s4, the input multiplexer is gone. The clock bindings actually
>> describe the clock as it exists, not a setting. The property has a
>> different meaning, even if it is still 2 clocks and it would pass the check
>> when support is actually added.
>> 
>> Also the s4 cannot work if the clocks are not provided, so the property no
>> longer optional.
>> 
>> Finally, for once it makes sense to see the input as being numbered
>> somehow. No need to bother with clock-names on the s4 type of PWM.
>> 
>> Fixes: 43a1c4ff3977 ("dt-bindings: pwm: Convert Amlogic Meson PWM binding")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 68 ++++++++++++++++---
>>  1 file changed, 59 insertions(+), 9 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index 527864a4d855..754b70fc2db0 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -9,9 +9,6 @@ title: Amlogic PWM
>>  maintainers:
>>    - Heiner Kallweit <hkallweit1@gmail.com>
>>  
>> -allOf:
>> -  - $ref: pwm.yaml#
>> -
>>  properties:
>>    compatible:
>>      oneOf:
>> @@ -43,12 +40,8 @@ properties:
>>      maxItems: 2
>>  
>>    clock-names:
>> -    oneOf:
>> -      - items:
>> -          - enum: [clkin0, clkin1]
>> -      - items:
>> -          - const: clkin0
>> -          - const: clkin1
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    "#pwm-cells":
>>      const: 3
>> @@ -57,6 +50,56 @@ required:
>>    - compatible
>>    - reg
>>  
>> +allOf:
>> +  - $ref: pwm.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson8-pwm
>> +              - amlogic,meson8b-pwm
>> +              - amlogic,meson-gxbb-pwm
>> +              - amlogic,meson-gxbb-ao-pwm
>> +              - amlogic,meson-axg-ee-pwm
>> +              - amlogic,meson-axg-ao-pwm
>> +              - amlogic,meson-g12a-ee-pwm
>> +              - amlogic,meson-g12a-ao-pwm-ab
>> +              - amlogic,meson-g12a-ao-pwm-cd
>> +              - amlogic,meson-gx-pwm
>> +              - amlogic,meson-gx-ao-pwm
>> +    then:
>> +      # Historic bindings tied to the driver implementation
>> +      # The clocks provided here are meant to be matched with the input
>> +      # known (hard-coded) in the driver and used to select pwm clock
>> +      # source. Currently, the linux driver ignores this.
>> +      properties:
>> +        clock-names:
>> +          oneOf:
>> +            - items:
>> +                - enum: [clkin0, clkin1]
>> +            - items:
>> +                - const: clkin0
>> +                - const: clkin1
>> +
>> +  # Newer IP block take a single input per channel, instead of 4 inputs
>> +  # for both channels
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson-s4-pwm
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: input clock of PWM channel A
>> +            - description: input clock of PWM channel B
>> +      required:
>> +        - clocks
>
> What are the 'clock-names' in this case? Because it's still allowed.
>

Indeed, it should not be.
I should add 'clock-names: false' , right ?

> Rob


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
