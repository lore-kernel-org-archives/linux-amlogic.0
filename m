Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6C1EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viL+xyeA+k3LmC/HbUV/XETMBBMTjdfTdlm966T7lH0=; b=mCiyj0z1yWWtwm
	SBMZRGc/d1AeMG1vP5bunJYxivxP311lNrD6z8aRGk36Wh/eMu96OQn7ZYU+KAROFA0ffQAVvG7I2
	JZ1iyNlf7UJwHfQplz23uM4Bff+lENLOUC7szDwjoUrexyTRMZIKBQFZuoo55/R1dZ92Okoxquidd
	ZFr9mgKYgG/N//Mm2hlRyV7Vd/5fOgRh1lQFQu5zEFU/BeW8okYeCT07CxuKLF8X4i8GfG5Gj4pph
	T/C/IffkilLmOgiVe7J/1kuW++VUIFTYjljk6gply4h+qMw7kGXstqSdBIRHqXwnmwE3Dk+7ZwgOD
	k12c9ilf6jNOwRtJJf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJmA-000r2K-0E;
	Thu, 06 Jul 2023 07:51:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJm7-000qyt-0o
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:51:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e34ad47eeso134452a12.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688629897; x=1691221897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XPuUPdPd4IL646MDP7xQxkm1mxaIaMz/LLFTlhEzpE=;
        b=jeihfA3SSlUzxo1jmrNrjXL158/UeCT7uZNbXEIqrzTux9MU7iS5WGGbJDTyncIKef
         a5qOL8cxKFTRDK1JEAQhioSHbp+K3JShdU14BfRA+g8bPiK13EUwSpK51+ZbTJLqGH+U
         EkbIsgnUJso8nWScVjexmDbyyM5QWz0enpCjUOis3Eid+Al+yBXkdYxC/W4mwXD4SIFi
         P3JuNpBuLAB55CRQAjYRboSOBZmUO0sh3I7xfVVVEj/UYh1WFZX9UyGz5piDNVQyz1Qk
         EoJTv3RTM97sM2FRGR1Wo0dHQYvUlmcT974XIJe1mdkkhrmFuB4q6NhcjLQUsOyjyc8X
         h7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629897; x=1691221897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XPuUPdPd4IL646MDP7xQxkm1mxaIaMz/LLFTlhEzpE=;
        b=MaPRgy6vQ4/aiDLm+B7LDt7HeFoN+DNraL5CFMR0x/toaCtlaX01fyvWteG98iLylw
         lchokcC5+PJGJoII0aYu7zCKx9Pr73LmHChiZu09yaFLOIOkxeGlHbRhjP3e9pRiQzyO
         J8To7GwCA76P5lF1qn4PN+jnS8fMay86d8O4PeoX5hPNANOw12ulWOrNQouGxSI3VHYS
         +SQUxV58Y16FP8+xjxx/7uxfs5w0IlrRjwou3vE0Iz8pApWIADDiQHHXfl+z4JryzgWQ
         udh7jDUvXx9k+meIHBlwNihbcZ9Gni5AtwbuLF8PzAbleT5D4AIC5rfggKWvWND/uxDP
         xMwA==
X-Gm-Message-State: ABy/qLbW+BHFtgmdvNXfSscXv0/29Y4yg5ufR3M5m1vNr3iz+9M3UtPr
	xubQ1wthYOapRMFw2oX7phHKbQ==
X-Google-Smtp-Source: APBJJlE1GzFFS11/BQZeeuoEMCqQI7WOCjyS5Cnvkbo7+aWcUl/LnigXelgXFEqsiJSV/bIfhHuY4g==
X-Received: by 2002:a17:906:5346:b0:992:13c7:56d with SMTP id j6-20020a170906534600b0099213c7056dmr708586ejo.33.1688629897001;
        Thu, 06 Jul 2023 00:51:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lh6-20020a170906f8c600b0098e48ad11f2sm462030ejb.93.2023.07.06.00.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:51:36 -0700 (PDT)
Message-ID: <e1e12c86-da0d-0ae0-0542-86bdc4c81bb3@linaro.org>
Date: Thu, 6 Jul 2023 09:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-2-22be915ddc3b@linaro.org>
 <20230705195631.GA1732680-robh@kernel.org>
 <1jttuh5www.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jttuh5www.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_005139_317394_537D6887 
X-CRM114-Status: GOOD (  12.69  )
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

On 06/07/2023 09:15, Jerome Brunet wrote:
>>> +    then:
>>> +      properties:
>>> +        clock-names:
>>> +          minItems: 2
>>> +          items:
>>> +            - const: xtal 
>>> +            - const: mpeg-clk
>>> +            - const: ext-32k-0
>>> +            - const: ext-32k-1
>>> +            - const: ext-32k-2
>>
>> As the names are always the same, move this to top-level and just set 
>> the length here (except the constraints are the same as top-level, so 
>> you can just drop this if/then).
> 
> If this is done, aren't we losing information ?
> 
> For example, "ext-32k-1" would become valid with a g12a as long as the
> number of clocks is alright, which it is not.

How it would be valid? It would be fourth item but only three are allowed.

> 
> I'm not concerned by the automated verification, more the information
> provided to the users, which we used to have in the txt format.

No information is lost here, unless you claim that entries are entirely
different?


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
