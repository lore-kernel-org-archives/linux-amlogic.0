Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8677FC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uti5VOCRwL2QUvvCdt/QAvtkn2u/E/EndSJSkpDqKBc=; b=JtMJ3f8Z3SxqAP
	s1BzKm54eYuKitDwxku0Tl0mzAZS0bUEK36Lp4CnojIIA07aDiH462QeQe59CApK/eS1rq6EK8rQU
	HwX+MkYo5YAh1Hb2lJMY2fkJ3vGhvt7tGCjlKJ68Ef3oJZVJXJ81rUbjW7BNLMl47i3BWAbUh6kDl
	kOjQgJlQAJRzJMOFsFYcw52UZn/8Pxc6jZ6TYIFjryP1LolrQKWHVHMF27QUTuIWmThtcDTOEK7Lz
	FBWXWTJmWfH1JmcUozcyTFw548/I2xMPOGTs7urxIIYkYXoofD8EDU4nDfC3zDCbGQWGC65dia+gn
	U6E8ul5/WZpC/5o9DiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAQJ-00000008BQc-41Wa;
	Mon, 18 Mar 2024 10:40:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAQD-00000008BGf-1F0G
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41412411672so4271155e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758445; x=1711363245; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=YjQbzuFkNQPfsO/4ZOF8nf2qpGli71Sj/ugH5Sw7P9kLieKjMeb3YgeswisD0Fp3Qs
         tm22D8Uvnr0sQYUA2WvJA7gM5mk4Zob+A5y6Aw7ZU6CojJTQ6B8X1DbKzPlNPH/aueQj
         FcDLc5W7OXGk2K1FiIg/5lzlWF8B1PmnbgxrN5sLplO/Sk3FamNSWmGBAVuDTmEebbNZ
         LuWCOMkpZ2GYPOTZQfbxO+zqQDu2RijcLsn4nB6klmBLglLVWabvrU8TyoSRxI1Lfgsh
         JHI2kvNprp2EcSe/iJ7dp+SSIuCHeiF+rEFVom6WpMd+xdhRVaCJFd3r60HYJJv222Ur
         AHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758445; x=1711363245;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=h3XVt+HD+X5hPdtLi+Sxd7UIXDl6Kk8o24LtoGipiuaR0VVZPArJbpW+x+pjnnu/HM
         SLli/bpM4ZJGCjX9x3eSK7G8wVB6hNz4ruVatNBU4XptPJxyIhn3ag1+LVqwdMGfNHRv
         zJaj8NkiE5uce50rKyC/sW2QEpfOKrZLTYA7yBVPW+9fmsq20PAHzIl2pJGsU5i5WkD5
         huCW6fEijJdISp+IxRd85CEkQRwOkCVv7/q13I2lLcQJDqNFW8RUHFlRIcEBHy6Zjx1N
         O4WIjo/6WxUjlWBDq9vVoce2mYjSnrqmJc8gjqyOk6+XVdh5NVVJGOeqJgEjDKAEWwvN
         6HAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyP8dE9vm8j4eTs99dpqkP0UCs6f6H5JO7eZi7zP0yk1FqDNWGRuPnrulqBhqzPBPOMVLxe9Ft1UUeY/2GLfdv0186k8sJ53IyUAp8SHSOWJE=
X-Gm-Message-State: AOJu0YxkFf0oIpXGaqwCFgkYR2FSKIYfcxd3pPkSTC82xw7Vpia81X3z
	AscPI4Hlfcj35uCbZZ5c/XlEVr6uoS/tUYvB3SU1meUMff/B0mv8IRvjUSgrNFY=
X-Google-Smtp-Source: AGHT+IF2NPmkDgNrJwjlDs0dlEQjbzK0dB/C1p7NsE17fQtvvBPtrHxeI38T1w1hQ953d1PS97HQkQ==
X-Received: by 2002:a05:600c:4707:b0:414:ca1:6531 with SMTP id v7-20020a05600c470700b004140ca16531mr3050478wmo.41.1710758445095;
        Mon, 18 Mar 2024 03:40:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b00414105c4cd9sm2909256wmg.21.2024.03.18.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:44 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Mon, 18 Mar 2024 11:17:14 +0100
In-reply-to: <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
Message-ID: <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034049_792942_809D43EB 
X-CRM114-Status: GOOD (  24.76  )
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


On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 11:58, Jerome Brunet wrote:
>> 
>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> Existing values were insufficient to produce accurate clock for audio
>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>> rate.
>> 
>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>> to a single setting.
>> > You've provided no justification why the PLL driver can't reach the same
>> setting for 48k. The setting below is just the crude part. the fine
>> tuning is done done with the frac parameter so I doubt this provides a
>> more accurate rate.
>> 
>
> You are right, it is not about 48k only. However, there are two issues.
>
> First, indeed, I could just extend the range of multipliers to 1..255.

Why 1..255 ? This is not what I'm pointing out

According to the datasheet - the range is 32 - 64, as currently
set in the driver.

The change you have provided request a multipler of 128/5 = 25,6
If you put assigned-rate = 614400000 in DT, I see no reason can find the
same solution on its own.

> But I am unsure if hifi_pll is able to handle whole range of
> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
> pretty sure that it works.

>
> Second, unfortunately frac parameter currently doesn't work. When frac
> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
> support of other rates than 48k requires extra effort.

Then your change is even more problematic because it certainly does not
disable frac ... which you say is broken.

That parameter should be removed with a proper comment explaining why
you are disabling it. That type a limitation / known issue should be
mentionned in your change.

>
>>>
>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>> ---
>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>> index 4325e8a6a3ef..00e06d03445b 100644
>>> --- a/drivers/clk/meson/a1-pll.c
>>> +++ b/drivers/clk/meson/a1-pll.c
>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>  	},
>>>  };
>>>  
>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>> -	.min = 32,
>>> -	.max = 64,
>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>> +	PLL_PARAMS(128, 5),
>>> +	{ },
>>>  };
>>>  
>>>  static const struct reg_sequence hifi_init_regs[] = {
>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>  			.shift   = 6,
>>>  			.width   = 1,
>>>  		},
>>> -		.range = &hifi_pll_mult_range,
>>> +		.table = hifi_pll_params_table,
>>>  		.init_regs = hifi_init_regs,
>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>  	},
>> 
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
