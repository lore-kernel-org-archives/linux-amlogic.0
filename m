Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C591C10DC1
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaLIrWaxmMXUwix1zP9lyf+o8hLwBUUYOezIp3wbA9I=; b=eCK4gh5X/gPwpY
	htzuseSUwvQi8syGMELpMtx9NAHN6MxXBstFKKpHSBN+P+ycDhKDVo2EQGddApT3coOYn2roUFw+A
	cu/UsVgBddksijRerEWIKmVelb6C+SNhygHKITaQjwnc8T+bm8LpefcETFx8VrVyivYB2NuehP3LT
	oywXknXe867eHvXBwlLMWFCj6xi+bgVgX72rGpFj3wrMt1MRhz5Vy1s9tUDIMvX21YWBmINA/Knss
	QUIrF+vSOemN0/9Y2ftlaDG1PVkT6ab4Hegp6pIlJaYtuT9/R8IEjJ+kIml6+Ycn6giA5kSk2VOT3
	FVcwLkhYE0PLu7/o4t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZnQ-00Fa82-0A;
	Fri, 08 Dec 2023 12:17:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZnM-00Fa7b-1a
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Dec 2023 12:17:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54cd8f5bb5cso2695439a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Dec 2023 04:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037845; x=1702642645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9izsQCcCd1CE106RU+2IMRNg5srUJ2uTg6mjoa3meQA=;
        b=LpIRkyPCDZMtSuAm0iXCJh1V7q3sOnKVY0HlDpFHGnaFJo0jnQhfTwXhwN8iTDge9A
         BOntFbw9dDR9b0oI7Wkn2djyMOW33KgU51AUBOZQLHoHBLwhDBUAO+p4/v1Dzr6G6gCm
         vChDzm9GvSTipl6tvVcZ+J5ECkohUlnjRixH0DJzKd9orOpO9SdZ6BpO34p/cBuzuRnO
         rZVbNKcnooOlHXiJ/0IJ8/b9M/2WFESJDQqK17jSWsyr7z8/K729xKMNuVtTUiM65YxL
         hgenyssTFBgoiGdX7n/aX02SSPkRDbLoTLlyuxkPBmfisjMJ2T2pi0KT4+TYVygYfSEf
         y7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037845; x=1702642645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9izsQCcCd1CE106RU+2IMRNg5srUJ2uTg6mjoa3meQA=;
        b=U6GjpskfEBgntqk7lnVLd21TsyOvtosUMXD21l7McFmRW/LKCzj/SF2WLNHr5ON6qz
         BKluIAZ5hdZcd7w1FeRo9PnyebWYwxNrzB/97l0HoZV84Tp3HgK6Xe5y7O0vaLCcxg41
         ylNdOdDkM35NyxZfBgvgOzSH7ynhXsZ6O1WW06xQ/x+j6dl96x2ITBz8HmFKbzviiKpp
         bTTSt/55XUXNT9YzSWPm+rUmKu7WFdLsEq/x9CYTx/vYiy7hp5xzO2OL66j4povejKAH
         GZ7/96p97n1jryIexvmZfXlAsD/MGwihCbGjMUfujAfhGtlSrRXzeyyfA3QS6haMDfNi
         VuhA==
X-Gm-Message-State: AOJu0YwRyRf8tHW+72mjGcdorFZ+Tgtm3Tx3Rw0fff6UBNSpJO1zmu2S
	GvXAHPXiSsmXnmXE8+WWBFMuCg==
X-Google-Smtp-Source: AGHT+IER6W/fDD1Ek54GW5WjcFgQL6SdwO+xnVfxaF8Xad512jmtPAkd6aZarE3UM1Co7yJt/QXdKg==
X-Received: by 2002:a50:85cc:0:b0:54f:5278:c2e2 with SMTP id q12-20020a5085cc000000b0054f5278c2e2mr16131edh.63.1702037845686;
        Fri, 08 Dec 2023 04:17:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id o29-20020a509b1d000000b0054ca1d90410sm790428edi.85.2023.12.08.04.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 04:17:25 -0800 (PST)
Message-ID: <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org>
Date: Fri, 8 Dec 2023 13:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231204144429.45197-1-linux.amoon@gmail.com>
 <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org>
 <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org>
 <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org>
 <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org>
 <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_041728_551412_1C9C0486 
X-CRM114-Status: GOOD (  12.64  )
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

On 08/12/2023 12:19, Anand Moon wrote:
> Hi Krzysztof,
> 
> On Fri, 8 Dec 2023 at 13:14, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 08/12/2023 01:24, Anand Moon wrote:
>>>>>>>
>>>>>>> If I move reset-gpios to required, I observe the below warning.
>>>>>>>
>>>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
>>>>>>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
>>>>>>> hub@1: 'reset-gpio' is a required property
>>>>>>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
>>>>>>
>>>>>> Where are the properties defined? If you open the binding you see:
>>>>>> nowhere. You cannot define properties in some variant with "true".
>>>>>> Please define all of them in top-level and only narrow/constrain when
>>>>>> applicable.
>>>>>>
>>>>> What I meant is the example below, required meant applicable for both
>>>>> the binding
>>>>> But it shows me the above warning.
>>>>
>>>> My explanation stands... So again:
>>>>
>>>>>> Please define all of them in top-level and only narrow/constrain when
>>>>>> applicable.
>>>>
>>> Apologies, But I have tried this multiple times but have not been able
>>> to fix the device tree warning
>>
>> Did you document all properties in top-level "properties:" block?
>>
> Yes, I have,
> 
> Can you suggest a couple of examples to follow?
> I looked at some of the YAML files but could not fix my issue.

99% of bindings. Look also at example-schema.

You can also attach here complete patch for fast look / short review.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
