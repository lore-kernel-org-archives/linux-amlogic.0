Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC1C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0MaP+6hXBlIzu2NdtBRfEarD2pFj7OYi7QWC5sO1hM=; b=wF30jRFqIDnvfQ
	5fm6uoMitWv00DzLtcDFSzBJp7eUfd6uwxT6pPuradsFaMocEtmAxuVT5lg/GX5z3ocTVcSs5pYMz
	/BSSM94VVAtFBcNkmNwkycR29+Tq006YYTAPe/GO9seiMet0cgiJc8jd1OlDGIOZmzLa7cE1G5z+a
	WNv1FUQe+azmoQxF5l/kN8WNzg5FJSwKhV91LjyKY3Il3JLQdq+yKS4vsVICQmkqGMFqHgc2DS+YB
	RIyUQmW0iUkycuKUWPpo2SzS7yCAS0I0QGfQaOM7XkQSkDgjLNKxkJtLbecO7asp+0arBBN+Qc0Zw
	YT+Rrn6vRe/JKQH9awqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m5S-004NJi-0H;
	Wed, 08 Nov 2023 17:11:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m5P-004NJ5-2G
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Nov 2023 17:11:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4094301d505so52937835e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Nov 2023 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699463484; x=1700068284; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=eUTx16xBPwlSZNLX67xZHVAtRWSJgwxGWbgEGrxHA48=;
        b=mb+zH94KnEZwwthYlRGYTqUv/Pb2DX+2VJ/m7t1Z2p7LRAmvVWg5ms6iMsBtkZSBai
         ePELjADIP64xq96IWPoyGUY/Wt2tPPsxhheLNhFi0Ax4kUodE/Le1hqBsXuquYmFxwpL
         67FXa0oj67nV8PrTjVpM95DvTjrtDLnvnQL3FRDIZIxLZ199qNP1MY3C+HP+ZXUQdLLG
         FR/fwlfELr3RDbjKYTIKTuxnjyGz8jjfAwzIgbmfVKAqXJRI/7fWDfsx27W/le7z/vri
         GH3s8oaceh8/m1qD63SC+39w2KCWjq2rtCX0uLMvBE4vsENWOLdOtrNrgddfuig44+xB
         aUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463484; x=1700068284;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUTx16xBPwlSZNLX67xZHVAtRWSJgwxGWbgEGrxHA48=;
        b=HX+K6jhVnBBMNv3C45lznSwXJC6sTdxEoKf7q4yFxOaexX0MZ4D4f99+hEiNopJ3Ox
         +e/ASTplbE1uEvOyC/Zq9NlYSj+IuUXQA5q2VRvXuAgl7KsZJ58dX77h+nEaOifGzP6G
         +uBvFZkq6syWC3bo+P2/OzPbsLB0Aowbxrq3FUtONMFO116ceWIe4sRb0L47S/vy8BEY
         W303+GGGfMTMJE+n8ulwakacSd5lfcp4fUL9vKivUFc5j8f13iTVlN4HtIbqX1bLuU/5
         F3Xpv/nFldUaz/Zj2DCN6jU8IW2pDit2C6lHEmwVZYasf8eE3s87fgSWGq8zI6nIMsEK
         3T6A==
X-Gm-Message-State: AOJu0Ywf4mltNUi67H8MYBH0e/nG37sFPrJeTt7g7XEBe1Kr4kCDDEep
	gXeiXJHEPc6Ar/RZHjnZsnu0nQ==
X-Google-Smtp-Source: AGHT+IHkXUfrA1tiasSTEFj1aoP6Rt1HVyFxHeX293YAedpxpxcOfIUTWQPEe2dFIo4RSBo5O6hgVw==
X-Received: by 2002:a05:600c:3544:b0:404:72fe:ed5c with SMTP id i4-20020a05600c354400b0040472feed5cmr2402712wmq.29.1699463484552;
        Wed, 08 Nov 2023 09:11:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:dfaa:8961:ce90:9db0])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4bc2000000b0032da319a27asm5373005wrt.9.2023.11.08.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 09:11:24 -0800 (PST)
References: <20231106103259.703417-1-jbrunet@baylibre.com>
 <20231106103259.703417-3-jbrunet@baylibre.com>
 <20231108170621.GA2417622-robh@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Date: Wed, 08 Nov 2023 18:10:56 +0100
In-reply-to: <20231108170621.GA2417622-robh@kernel.org>
Message-ID: <1j7cmscgqs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091127_739867_166661F4 
X-CRM114-Status: GOOD (  17.71  )
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


On Wed 08 Nov 2023 at 11:06, Rob Herring <robh@kernel.org> wrote:

> On Mon, Nov 06, 2023 at 11:32:49AM +0100, Jerome Brunet wrote:
>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>> 
>> The previous clock bindings for these SoCs described the driver and not the
>> HW itself. The clock provided was used to set the parent of the input clock
>> mux among the possible parents hard-coded in the driver.
>> 
>> The new bindings allows to describe the actual clock inputs of the PWM in
>> DT, like most bindings do, instead of relying of hard-coded data.
>> 
>> The new bindings make the old one deprecated.
>> 
>> There is enough experience on this HW to know that the PWM is exactly the
>> same all the supported SoCs. There is no need for a per-SoC compatible.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 35 +++++++++++++++++--
>>  1 file changed, 33 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index 754b70fc2db0..3aa522c4cae4 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -22,6 +22,7 @@ properties:
>>            - amlogic,meson-g12a-ao-pwm-ab
>>            - amlogic,meson-g12a-ao-pwm-cd
>>            - amlogic,meson-s4-pwm
>> +          - amlogic,meson8-pwm-v2
>>        - items:
>>            - const: amlogic,meson-gx-pwm
>>            - const: amlogic,meson-gxbb-pwm
>> @@ -37,7 +38,7 @@ properties:
>>  
>>    clocks:
>>      minItems: 1
>> -    maxItems: 2
>> +    maxItems: 4
>>  
>>    clock-names:
>>      minItems: 1
>> @@ -70,11 +71,14 @@ allOf:
>>                - amlogic,meson-gx-pwm
>>                - amlogic,meson-gx-ao-pwm
>>      then:
>> -      # Historic bindings tied to the driver implementation
>> +      # Obsolete historic bindings tied to the driver implementation
>>        # The clocks provided here are meant to be matched with the input
>>        # known (hard-coded) in the driver and used to select pwm clock
>>        # source. Currently, the linux driver ignores this.
>> +      deprecated: true
>>        properties:
>> +        clocks:
>> +          maxItems: 2
>>          clock-names:
>>            oneOf:
>>              - items:
>> @@ -83,6 +87,26 @@ allOf:
>>                  - const: clkin0
>>                  - const: clkin1
>>  
>> +  # Newer binding where clock describe the actual clock inputs of the pwm
>> +  # block. These are necessary but some inputs may be grounded.
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson8b-pwm-v2
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
>> +          items:
>> +            - description: input clock 0 of the pwm block
>> +            - description: input clock 1 of the pwm block
>> +            - description: input clock 2 of the pwm block
>> +            - description: input clock 3 of the pwm block
>> +      required:
>> +        - clocks
>
> Again, clock-names?

yes, same thing

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
