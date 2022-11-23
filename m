Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F81C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIfvzmbBRtVgEEqAjIdo54YKIUE7UnDVx4GI/pDvqhI=; b=lcw3NrZqjl/sfE
	liLYzqLViBjUjVv0lf8YdY41Iv6Lx0Ri/zg6jtKSqWghKXbVBbeF3c4w7DOKe+Ftyc0yltkYXyPpZ
	JhBUljHCO1EpeSSaJfa1cVIdmLNA2u3vHMe1lCGLj+Qwl0GOeqKS/TzekPvp/lVX/neQBpf/fjKWe
	ET3sn8biBxa0yNKMxOeqRNWvnxLY1MTtEHUHOtJmMiCXKZzKfIoAP5bi4dakjytRi2b1hCZbzJ77H
	UrEN78jNYrH/wMviTaoX/rIv8NyzEIecsf9mtYCbDJea068FU33c2x7KCgUyIH1oXesqRMs2hBPnZ
	h/kjyqLgAUaUE62pfjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpT1-00H84H-Fd; Wed, 23 Nov 2022 13:07:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpSz-00H81x-6d
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:07:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id z4so4405277ljq.6
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ccqh3dfGzML1aBGj7t/YrqY2QT7pR2uNL+e7DNuF1s=;
        b=NTz8FoNtJ/3ZrpELLvCYWVTs1l2QYVefQOUUa43xmopc3UEmPvePHMJSVKHqy/sqJ5
         qY92VBAkQjFaYJngeKZGTzNUNHJvkBkLJC8lisKE8S/bv/zckV1tg3G7HrQG8steUfvq
         VelhR4nq3DQHY0mQNijfoW149T5Dvz06H48Qhsnq9ajy6PhnZv7jFc0I1hbnGoVHr3QH
         uqccIGYC5o1uugg7zDi5pr1imEa3DLPyPzXFpFhBh/XLh0CCLoelejWsd3ZHd3X6MAbf
         7MHD/5U0VZKi8R7jNpJ/MW7o77ATRMQAfsxc+nfY7XAnOoyh8RCAfBC4hDZbYH8vXgQF
         KiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ccqh3dfGzML1aBGj7t/YrqY2QT7pR2uNL+e7DNuF1s=;
        b=z25CEQJFny8Mn8iP9eII3/kU1/8f4C+lK7YwgDBaUq9Zb14EIs4jS9wnRy2O/Yj71q
         Yq33iW1LuaEcHUL7qlQIMdGTQcxzgS28FxwTzpO3oOwVNGsKR+X7w4v80YSv+MOQsB9p
         EFvpAykwXSWU0mxsDDTfwyWcTI54pRLcOpjuFm4b8JRmC4Gu3NyB2EFU1iX0wDITB/Ih
         dMRkKi027qTZfS59CLoyFuB6OrYdKRb6hKZAGLFvXgyas11UAxvll1cSf89DY+6FInm2
         RRxiatYmroyY1gbrk67js0NO8zAp8rJpIR9L3vEQ6pizRxyqXc4QGO5WDH3nfwsTMbiL
         qkng==
X-Gm-Message-State: ANoB5pn8ewF9Pn9c4zcFSFIRsm43gTp3i89eCYuvZmAJLnuCMJAsalr/
	zO715ztnqh3oNS/kaeZIG1bQYA==
X-Google-Smtp-Source: AA0mqf5NaHTNZWztbivNnH1bVjzcoFbgIS8edaP6RX+ZaLqm31IxoNIMjBsE8vCZBviPdnlqNqQTNQ==
X-Received: by 2002:a2e:bd17:0:b0:277:50a:bd5c with SMTP id n23-20020a2ebd17000000b00277050abd5cmr8965045ljq.6.1669208821202;
        Wed, 23 Nov 2022 05:07:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j23-20020ac253b7000000b004a62ff61b3dsm2904375lfh.252.2022.11.23.05.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:07:00 -0800 (PST)
Message-ID: <2418f79c-ae56-9e4e-46e2-f1ca757642ee@linaro.org>
Date: Wed, 23 Nov 2022 14:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 3/4] clk: meson: s4: add s4 SoC peripheral clock
 controller driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-4-yu.tu@amlogic.com>
 <09a443b3-4e27-a751-ba2c-057d69363a13@linaro.org>
 <cf7295c7-3ec6-3017-0c21-167da06e3214@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cf7295c7-3ec6-3017-0c21-167da06e3214@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_050705_271173_196DC24D 
X-CRM114-Status: GOOD (  13.91  )
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

On 23/11/2022 12:22, Yu Tu wrote:
> 
> 
> On 2022/11/23 18:09, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 23/11/2022 03:13, Yu Tu wrote:
>>> Add the peripherals clock controller found and bindings in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +
>>
>> No, this is total mess now.
>>
>> Additionally, you received a lot of feedback but your changelog says only:
>> "V3 -> V4: change format and clock flags."
>> so you ignored entire feedback?
>>
>> That's not the way to work with patches.
> 
> Hi Krzysztof,
> 	You can check the previous email reply. Now I don't know who to follow 
> your advice or Jerome's. I'm confused. Maybe you need to come to a 
> conclusion. So I can change it in the next patch.

I don't understand your comment. You received a lot of things to change
for your v3. You said here "change format and clock flagS", so all other
feedbacks from me were ignored? They were not contradicting to Jerome's
comments, so either you implement them and mention this in changelog, or
you keep discussing.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
