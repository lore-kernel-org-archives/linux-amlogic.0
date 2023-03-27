Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD890C761A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWYj+sS1O6VMhupWNPPdKdeaCHlhA1VR85lIW5Z/2tc=; b=N+qCZwEcw2g5Bc
	+Q0tjokr2rdDStAWCWOCY5wjicpgoksoFYZSkuADKawCMVhQojW928xmJBAh6LLiiZB24BdNRpPS4
	VDgo91MMU3TyNbyzvUzeUK6Yk9wvpIVP/s2JI47awfpK+scEJkUYxjGiRj8jFqGT7WnB0mvnReBaA
	taQXqBx1ScPR9bUy4YfI2XL5fGvMp3MNJ8xNsh+EbnzDTT6j2RzXrb2m16ur8QhNPhIdtbduBj429
	o+0E38Z6NJnHf27hx2VpwI9wsUdxQXxacelkJgzcHxvq34wLCYh2JDPLWWwLXnY32Kfo8M1rLm/q6
	6Z6KGSuAIvFATVSz/i+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn6O-00B9uz-2V;
	Mon, 27 Mar 2023 13:41:36 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn6J-00B9sO-2M
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 13:41:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id h8so36369757ede.8
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679924489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BguImQejWs9Xrm9LIQbrEJlaJByblYgam+0cE2D3Eks=;
        b=n+uLWyhAi1YMP5Yovq683+Dtb3SBcW1cDafB20zJ/qEOpvULXcBONEhcTTawGHOrjl
         7zZbEug+ksGt8m/qaOuYEZFTpu2AeeJuKHHaMrtqSheT624NwwAEqTqF0PT82Gg7/crz
         ZSHUzdQjTmGEhE7MP1rKLMQBQpepX+i0MrMgcNVPWxy1AZ1lidk7kCo+AAeXP1IvIEP0
         3+U53diXpK2gH/bqMgjY/1xGJ6C8tjwpFRFwIlS6fTdm/sA00JaS3hqHpq6yWmyfRaZD
         GB6JFjP+bAiiaF4hq6Pdl8Jo2K+LRga/dj0Eq0imrNVTlj/GtmWwN6Ze9FmL6vQ+ogVZ
         g0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679924489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BguImQejWs9Xrm9LIQbrEJlaJByblYgam+0cE2D3Eks=;
        b=e9bajswjpvh/AZO+yL9brU7rQdC42n+q7rLrgECXgRGhhyJXvaHP2tb1GaJ1rjwCTs
         IspAfeKJOvFcRqmP3/D6FebkIzOyTB/Yo2hwhQYA/g6Hcthv9gd+Qewb32eKkpq124PE
         rgsrTSMbKkqb0YoJ6zS5JJzyVnJETmK82QQIKhFUYfkNPUDcoJHz9SJX5KqIDL4VVEhw
         BdFDWAUdWpjcR32NAjz2N805923vxZNWNTWcEQq2HMHbEyhQGF1mJaZDsnMUsrB98t4X
         sWddo6PBCfToOHk4TwWlC8A2dV3I8drcEocW801wDdbf+MBEURSK2jbxAkJaEt1c/7yI
         HDOw==
X-Gm-Message-State: AO0yUKUZAjje+bko1g6bAg+quTHoVo32I7mL307sk6sBpw7QcOJlZiQZ
	EP6xjbKNAQEzMKU+ZRpu1HEFWg==
X-Google-Smtp-Source: AK7set8tmGTSisftlq1JzklWojvkM/aWZ85dTS2Od4qqCfmD7pDm03nVf3rP90Cvx455hEpPlJ2gfQ==
X-Received: by 2002:a17:907:6d91:b0:8af:2f5e:93e3 with SMTP id sb17-20020a1709076d9100b008af2f5e93e3mr22108507ejc.29.1679924488950;
        Mon, 27 Mar 2023 06:41:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id l11-20020a1709066b8b00b00939faf4be97sm9088451ejr.215.2023.03.27.06.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:41:28 -0700 (PDT)
Message-ID: <1f68ff4f-46ab-7d9e-fa57-bb94beb4c691@linaro.org>
Date: Mon, 27 Mar 2023 15:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
 <1jmt3yo5r0.fsf@starbuckisacylon.baylibre.com>
 <20230327105115.ury3w4xpzhcpnqjg@CAB-WSD-L081021>
 <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_064131_766726_51A1C6FE 
X-CRM114-Status: GOOD (  19.54  )
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

On 27/03/2023 13:39, Jerome Brunet wrote:
> 
> On Mon 27 Mar 2023 at 13:51, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
>> On Mon, Mar 27, 2023 at 11:51:21AM +0200, Jerome Brunet wrote:
>>>
>>> On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>>>
>>>> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
>>>> clock drivers.
>>>> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
>>>> bindings and include them to MAINTAINERS.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>> ---
>>>>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
>>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
>>>>  MAINTAINERS                                   |   1 +
>>>>  include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
>>>>  .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
>>>>  5 files changed, 267 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>
>>> There is two drivers (and 2 independent patches). There should be 2
>>> bindings patches as well.
>>>
>>
>> Before, in previous versions I had two versions, but it wasn't bisectable
>> approach.
> 
> You are confusing bisectable and Rob's robot. Splitting patches is more
> that likely to help bisect (and patches backport) - not the other way around.

No, he did not confuse. Splitting patches makes the series
non-bisectable which was visible in the past.

What's more, there is no reason to have bindings patches split just
because you split drivers. Bindings are independent of drivers - we
write them for hardware description.

> 
>> a1-clkc schema depends on a1-pll-clkc headers and vice versa.
>> It means dt schemas checkers will show us failure if we split them into two
>> patchsets.
> 
> Only because you are patches are not upstream yet ...
> 
>> I know, that we can use raw digits instead of CLKID names, but IMO it doesn't
>> look like production schema and it requires one more patchset above the
>> series with proper CLKID definitons usage and proper header including.
>>
>> BTW, there is an example of Rob's test bot failure found in the previous
>> v10 patch series due to chicken or the egg problem.
>> https://lore.kernel.org/all/167769997208.7087.5344356236212731922.robh@kernel.org/
>>
>> Please advise what's the best practice to resolve that..
> 
> Don't use the header in your example would solve the problem and
> still be correct DT wise.
> 
> The examples are just examples, they are not required to actually
> matches a real HW, as far as I know.

Yes, that would work... or just keep them here.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
