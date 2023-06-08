Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D7C7EE25
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEyAGEoVmegVOIFK0MFKCANRuNw1ZlL1Ccode5aANv4=; b=vpqOSM9NqQmXZ1
	0tbLJRHvD+HzWsKl53rioKvg3yNUTZCSiBviKobJzkbnCCiCI/2znDGOZ+TLGHn9u324s3khMiscM
	iOaCvIwPjbMHDjgE2MzPAFAjIwIdzNyHZTM1axZliJXSzHMk9VWnChyPk/4TsAq5+aztQLY8O+1Tr
	UGNmQc8TOuOn7MONTQNJcWqQc3oZ+BaPlezc7hcUIK0ByTZc8fXBUDmpmsQi2QXOWc5noyLUpG8xz
	EbjRDbirFoPteqjYcHmr8ymBSjWJEyz4hayFzzLkT4R1I4hNHXa46bS7xERP/pM2me4rk4v8y348Q
	TfRjCg/d+vGzR9AnFqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BUf-008cpj-1J;
	Thu, 08 Jun 2023 08:59:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BUb-008coj-2Q
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Jun 2023 08:59:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso1908995e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Jun 2023 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686214780; x=1688806780;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HtzbVfqW0SjuZKyPfBVRRJzNRxgu1Q7jWMIx+yfKlSY=;
        b=OwUHzZAfyLsLDi5eRkoShFrB0mdzg2SB/HuM0M9zJVRq1drRtWiHfoQVh7n7y9NpCW
         YOZTGpPhEoS6adlGyclhA5D9QlDJFO0wUFGVEd/exvjOuXJHjPzLDUGMDqRUTixOR4o2
         W6Cf3K6MbNOMKJdDEz48SxlnakQFHbbJF/eDuIunt9jAsTNIBResuP3RVw9Qu1oflCUD
         9d1cHXYHqK2x3oZUtoLqm8ElvlwvvW1D9qnKjprrpvxKerSxrqCbr6QHkYc3IF1cx3cZ
         sFhxK1Y1nLNGXORpNpG23ZEe3e27apENyuu0cMFc3VJY+7Qq4ezwC+S8eom3sLQR7Chw
         ZNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214780; x=1688806780;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtzbVfqW0SjuZKyPfBVRRJzNRxgu1Q7jWMIx+yfKlSY=;
        b=UPjsRJsaBS0xcchxfdB7lkXn07dw03GDmVR6FzMEGDRyzroLGYyWjk3CsviAiKDs0J
         K9ulEFGej6xTnSX6z6PsL2s+GimTdcdDxC8HSSB2rCycm498PK45JIOcR1KN65wWrHMb
         7sGEZiKTs07WHddkYvgRgYhgpQ0CniYQR1JSssKr9+yRS3fsw4cnV3d6lh1WkaCfsWmv
         EEOin8QwDkBIBr4hdLIp45i7pxHBDLaJjth0RuRLsbJIhiDMoOWQ+y9s42/RMKZWFVur
         rHPhv4YS3IwKwXhKhaR1eJ10I8u4GiYq0efN5JlSyDi47qKofP7lSS9bVfO4KKX91i2z
         b7yQ==
X-Gm-Message-State: AC+VfDx7snZIHQ6qe69KTf8bQOI2FUG9XzytUaVDYUvDdEDnCxu3Vh2I
	Qn7CtTOeLCMcTH9EIKAbZCnY5Q==
X-Google-Smtp-Source: ACHHUZ7AJ6r0vLW9SSK7hlu7p9NSBYgD9rpD8nNz7jKun8PAWYhsC9D2tlLPOuzTNzAhNm/64JH+7w==
X-Received: by 2002:adf:e6c8:0:b0:30a:e161:86c6 with SMTP id y8-20020adfe6c8000000b0030ae16186c6mr6060111wrm.51.1686214779694;
        Thu, 08 Jun 2023 01:59:39 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b0030aded83385sm955693wrv.27.2023.06.08.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:59:39 -0700 (PDT)
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-4-yu.tu@amlogic.com>
 <1j5y804q7u.fsf@starbuckisacylon.baylibre.com>
 <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH V9 3/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Thu, 08 Jun 2023 10:53:31 +0200
In-reply-to: <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
Message-ID: <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_015941_990988_CFE5C80A 
X-CRM114-Status: GOOD (  10.16  )
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


>>> +
>>> +static struct clk_regmap s4_fclk_div4 = {
>>> +     .data = &(struct clk_regmap_gate_data){
>>> +             .offset = ANACTRL_FIXPLL_CTRL1,
>>> +             .bit_idx = 21,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "fclk_div4",
>>> +             /*
>>> +              * For more information, please refer to s4_fixed_pll_dco.
>>> +              */
>> While div2 and div3 got an explanation from previous SoCs, they others -
>> like div4/div7/etc ... - have been able to cope with rw ops so far.
>> Why is the S4 different for all these clocks ?
>
> The chip was changed fixed pll for security reasons.
>
> Fixed PLL registers are not writable in the kernel phase. Write of fixed
> PLL-related register will cause the system to crash.
>

That is definitely worth mentionning

>> Requiring RO ops (or fishy clock flags) is usually a sign that a clock
>> is used without an appropriate driver.
>>

Neil is currently dealing with the dt-bindings, please
* Adjust your patchset accordingly
* Wait for his v2 to land, you'll need it.

>>> +             .ops = &clk_regmap_gate_ro_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_fclk_div4_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
