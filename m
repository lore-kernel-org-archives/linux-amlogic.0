Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA7C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRwOmDjgTDQ+R5rGwNoY41Q9Pb4v0E4JuSbKDXEgW4I=; b=eWqEamsGi7k5+d
	H4bmYrpMiklC1ddIvuGSKHvd/nZmP2etbJ44SbleU3MwlsDeBrrEdZEAMD0sVINn9sDXyqSRvj/EX
	FsUGga5wyYUyQITnOzm2mwewZ+beFnImmDJVAhEqoVNEhlaB0qbtBlI8KOeKtrAvCQYWGSnBTMXIJ
	eZJ7YfQkTGFjtC5veOTxlQPIzOXigzQwZAjO8Ok1g9+MlgDMgDqiDcmoZeqiSUCTwrhezOE948sZs
	6ZTSOozXjh/nSmny+8mhGdxyeq1bFkokmnWUol5HOoB8ZMf+sggOaz7AxqSR/vNthfLbvu+Dty5gk
	AoCVJnQcbfIfR2lReZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk6B-0059Nf-1x;
	Wed, 09 Aug 2023 14:23:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk69-0059LD-2j
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 14:23:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso65127875e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691591018; x=1692195818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wg6FOxvEEY9L/1IDbso6hZjk5snLMFSLKFKVthCzk70=;
        b=tzUoWCmu9Yd0MiB1ikHpKNW54D0sQmYgCrtM26sPuY+1bE9OG1zLPZWDtJe44OUiOY
         3N3AiZMY8lAjF57klVsolAid+GLWZz5rsf8y3rwQhZgwJTiqhGE9Gzoaw82DIxQUa7/N
         K2ckrJqa1vWs6YBHzfjk5LmFP4N+YMBByWj+Dj01b4UYQhmJaUvQhEsLWhKtvb0BY8JT
         Yos+eFL4kT5P00uFJLs6im/Boq5aBPl4R7FlKYFs8FolHHPDxkDI70376Ls/P9T2ExDf
         BZEv9cLu+QhxYMbtKOlAtvaB+MDi9zBFP9w3c+IjYsYyBgA7Hj/IQLV/GBB2iiQBlEdt
         H6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591018; x=1692195818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg6FOxvEEY9L/1IDbso6hZjk5snLMFSLKFKVthCzk70=;
        b=Bm3cH5QNuMSRU6rVQcQcdN+Gg0lQzqCLZg3POCePZtd2EY9ANOD+0GLe4NB0IKfmnr
         ZQ/0wz5CdpFx43Acl+euuROysMF1GdUu9WI71NpE+mQ1HErD/pX1V9nAyL1DJS2+uaZj
         0VnfKrVEayQPTaS/lIG0lwjoOWr1NyDdfBI5+msCH3jQQYQ0nsYL0KPg2kdC+in+vrYJ
         4luQeYBqcyh7Dwoz6WIRGvGccwQN5INmysnh+uUc4R/UJIY2Y8RouVEgNViMs5aijzjA
         WdwMhWjOhlRAYvx9y7CbdR1684DWL0kMCVgWTu9d+xTGe37SLzbJTdONLeENSZGUhQ9z
         RzkA==
X-Gm-Message-State: AOJu0YxBlxvCYkGyPsSXcypq+RtUvvhCbZ/JsQG/ki2xq09aQQjPDtb7
	AAUTvfCxI02WBNGepGSvrtkvlA==
X-Google-Smtp-Source: AGHT+IHSQ27GTB70++fZ9IGftp7XmKQfx3A05O5KmkT0/u9uY06+p8pAZxpcSPRhaQklr8cocB6Cow==
X-Received: by 2002:a05:600c:22d8:b0:3fd:2e1d:eca1 with SMTP id 24-20020a05600c22d800b003fd2e1deca1mr2376394wmg.4.1691591018130;
        Wed, 09 Aug 2023 07:23:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm2210168wmc.0.2023.08.09.07.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:23:37 -0700 (PDT)
Message-ID: <4462f00f-f590-df44-97d0-a657b3da2559@linaro.org>
Date: Wed, 9 Aug 2023 16:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
To: Jerome Brunet <jbrunet@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <1j1qgcba54.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1j1qgcba54.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_072341_899756_BF37E739 
X-CRM114-Status: GOOD (  10.78  )
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

On 09/08/2023 15:46, Jerome Brunet wrote:
> 
> On Wed 09 Aug 2023 at 15:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>>> +      required:
>>>>> +        - '#reset-cells'
>>>>
>>>> else:
>>>>   properties:
>>>>     '#reset-cells': false
>>>> ???
>>>>
>>>>
>>>> You need to constrain the clocks per variant. Probably names are also
>>>> specific to each one, so the list of names can be moved here and you
>>>> keep just min/maxItems in the top level property.
>>>>
>>>
>>> input clock names and constraints are the same for all 3 variants.
>>
>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>> the same, then drop the oneOf and make number of clocks fixed.
>>
> 
> As I pointed out, this section is wrong.

Ah, I misunderstood. Looks good, thanks.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
