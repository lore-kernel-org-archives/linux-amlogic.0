Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00168C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jul 2022 06:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fEtwySSvIjiOGmRp7aHQPjGMmV8I5T0ykv3t6gZbLY=; b=JAL/LT+PNhaHNL
	p47KSv8/4LxxCp5JfncNCm0zzCPMtMI6ir/o8i631GtpeF+THkE7R6w6TWYPMyf5JEuILVoOpyleR
	zKK/6L76bFxrjXzC3yjWCe109xaQ7Q0vwvSduo0F/Szpp9o9orsUFo/NYuIeaP1pryGPwvHNP44F4
	LedeUqYpY+YXP32ohAZ3Ji+jellP03dwKVjCodc0AW7nJsovtV0yTZzmADSglAhDZ8jbfQpfn7FVO
	layrVWksVRXUrXDJX6wssenb23pGNcU7vutZyhWsrjZyHsPMKwegqcG1eOh+ncKZNnNiqwbKjAcwY
	c307XpoSjgqY+U9dv8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgjy-005fPY-6w; Tue, 19 Jul 2022 06:29:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgjn-005fMA-6V
	for linux-amlogic@lists.infradead.org; Tue, 19 Jul 2022 06:29:44 +0000
Received: by mail-lf1-x129.google.com with SMTP id z25so23149077lfr.2
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Jul 2022 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nSjyDxj6i5dF81wArrDQxqLYzLC5767xBBEXb93UcLU=;
        b=On5OdScSHC8+y4IywSQ0PFC0mneZPHUqUD6lB278w4kSg5tTey8c0tie3ziwEs5SdW
         qpm1W7C+Zj0iXDfpZJ4DD3eLoDoeh7w8vneSrH9xu0FEHPTszti8q8PBCnmca9URJIEH
         OExT69La3eS+xOxXch3Y/zgO9Eh+sE7yq+umPUgIpHGNezMAnlW/VUhSzzVmVHD9MEQQ
         +hvClpXRy/GBJzTYrgm1v9peOylCjmxH9eLNmIu7/+jCPz76AJuwYI5bcj0BEUGQi5to
         q9jFSwxqj5ygx47dI70Wb79dpAliin7jNFpYhooLyHK6Av9tFyXC23uIUkMmNZEMT/gu
         jQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nSjyDxj6i5dF81wArrDQxqLYzLC5767xBBEXb93UcLU=;
        b=26py2HY3Q4GMn8Sz+qETrwESqZsJFlJDhw+bGwG5Kh6lpK9BXTawU+SKI4DRFLXFbx
         cqg8vBJ8rrUf/RnxQPRYd8jO8lb2OhWq8cpR+GWijTCsV16qKpt7MK2OnmJNnxidsBZ0
         T6fu0BMmOTtYjcj7dWv86YCEY1tSKe8c22Dvo0OTb0B+JWjmsP6OmsmiUNmRst6vqLtv
         ixsI/NL4/l8StlUBctOostyk6hTEhG7rDFlYMlMGNHgWmtvE6MrLFTND6vOrAxcILImZ
         rfWD0bYOUL5mrRTAED9oBvdkYmuK+WZVU/yjlN8nJtGqPD7F4HtFAZoh5jdGqdogdijf
         A8zw==
X-Gm-Message-State: AJIora+ZzEmI+KXTIUELAry7ctoqzBlHBJg81R6YUtwt/C6vaqxGRhkp
	EQVjdAwRYQkvBEoBeD32Yh+rRA==
X-Google-Smtp-Source: AGRyM1vM/WjC2sRJl9xwLLN4clwPL6yEYjiQfm8ay95D2P4JoNvZM1csxXaLZqA5Sjf8PaQoeHdl9A==
X-Received: by 2002:ac2:4e07:0:b0:48a:18f3:e5fe with SMTP id e7-20020ac24e07000000b0048a18f3e5femr14198113lfr.357.1658212179235;
        Mon, 18 Jul 2022 23:29:39 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o18-20020a05651205d200b0047f987cc158sm3050688lfo.45.2022.07.18.23.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 23:29:38 -0700 (PDT)
Message-ID: <152cee25-9a36-a948-98e7-847d9ee36c1f@linaro.org>
Date: Tue, 19 Jul 2022 08:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] clk: meson: s4: add s4 SoC clock controller driver
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
 <20220708062757.3662-4-yu.tu@amlogic.com>
 <7fe9aab5-73a2-6209-ae65-d955c426f745@linaro.org>
 <f5bf2abd-4d60-523a-3f84-879da2f1c78a@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f5bf2abd-4d60-523a-3f84-879da2f1c78a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_232943_244398_5C686D44 
X-CRM114-Status: GOOD (  13.38  )
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

On 19/07/2022 08:02, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your advice.
> 
> On 2022/7/12 17:44, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 08/07/2022 08:27, Yu Tu wrote:
>>> Add the peripheral clock controller found in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   MAINTAINERS                |    2 +-
>>>   drivers/clk/meson/Kconfig  |   17 +
>>>   drivers/clk/meson/Makefile |    1 +
>>>   drivers/clk/meson/s4.c     | 4678 ++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/meson/s4.h     |  156 ++
>>>   5 files changed, 4853 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/clk/meson/s4.c
>>>   create mode 100644 drivers/clk/meson/s4.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e4ca46c5c8a1..f116ec0642f2 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1772,7 +1772,7 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
>>>   L:	linux-amlogic@lists.infradead.org
>>>   S:	Maintained
>>>   F:	Documentation/devicetree/bindings/clock/amlogic*
>>> -F:	drivers/clk/meson/
>>> +F:	drivers/clk/meson/*
>>
>> Why?
> Warning is displayed when using checkpatch. I will correct it.

What warning?

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
