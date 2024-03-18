Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8029C54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obpJ2fEfjP29gpL+cjMxl6UL9dk0ixJnI5wqI7a41M0=; b=LmhYiSOpS0xeTy
	D/LaAgzL8IN2/T0P1jKpIlvhXvzmkIBOrL+FEnPOybLulQB/ji3sksutt9L8q43OTVXk1NTw54K3q
	058xK2A4rPH4qvSJxVAfkK2Pi4IwBNg9ZSc1kLRt3eU0TyZYTeBf4KSuvpQ3AU88MTczJhGpffqPq
	LMhcNY7VSi64a/i/iAwEWpAdBKmHIvuPmyCFs3fwD/oi+EIb7yWWkAVoopiFrDeSYcGx/A9s3nxVo
	CruUEZpPrWmpXRqihnroAYCrmzznWZWQ2dZaFCFqXqFqnhkc06iygCGSCx3+9Z6H5AQNlLVtPa8Dr
	F75aHIVTs2ueEbAJntuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLaX-0000000AOQb-0i1B;
	Mon, 18 Mar 2024 22:36:13 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLaR-0000000AOMN-1cYd;
	Mon, 18 Mar 2024 22:36:11 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E086310000A;
	Tue, 19 Mar 2024 01:35:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E086310000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710801358;
	bh=vPcHUQZVimBhgCl8L1f1HwLGGZYqomI6G5dUIYpgXh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=J+aHlngq9//OVD9HE6Ik14KAs5VWEg57NxJNYzD9iYiuWq45OZAyUMhJz0HXqfp1N
	 aiWgMRNxojFULwjNsxw1oxwj7hMwOPIWhNFAlyRdUaWAJ2sjAO32yOD7eR08Ez2QTM
	 Q1390IWLe4lfY9vuAS4IRRhEEkBZejw/XcxM+8ueUzJ6obYKcRjxt6ZKs3QyXMWYOA
	 iziszeAinZ+nPhqlLhc+F20oqkJzqzxrltZ7KkYJuB+7HXer2DxAeDu1YIJ+JyduG5
	 VM+jNFHlsLUB5UIEaMseXMz22VUxYZlykmEziDmnsVkAy1NUdPaNr/ocv17UQOkkTe
	 jPBin7Ojeet1g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Mar 2024 01:35:58 +0300 (MSK)
Received: from [172.28.64.112] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 01:35:58 +0300
Message-ID: <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
Date: Tue, 19 Mar 2024 01:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
 <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184250 [Mar 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 10 0.3.10 53c821b925e16276b831986eabc71d60ab82ee60, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/18 20:02:00 #24276844
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_153608_124457_3DD68D8F 
X-CRM114-Status: GOOD (  31.19  )
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



On 3/18/24 13:17, Jerome Brunet wrote:
> 
> On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> On 3/15/24 11:58, Jerome Brunet wrote:
>>>
>>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>>>
>>>> Existing values were insufficient to produce accurate clock for audio
>>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>>> rate.
>>>
>>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>>> to a single setting.
>>>> You've provided no justification why the PLL driver can't reach the same
>>> setting for 48k. The setting below is just the crude part. the fine
>>> tuning is done done with the frac parameter so I doubt this provides a
>>> more accurate rate.
>>>
>>
>> You are right, it is not about 48k only. However, there are two issues.
>>
>> First, indeed, I could just extend the range of multipliers to 1..255.
> 
> Why 1..255 ? This is not what I'm pointing out
> 
> According to the datasheet - the range is 32 - 64, as currently
> set in the driver.
> 

Could you point where in the doc the range 32..64 is documented?
Documentation that I have may be not so complete, but I don't see there
any mention about it.

Anyway, range 32..64 of multipliers is not enough to produce accurate
clock, and a need 128 for 48kHz.

> The change you have provided request a multipler of 128/5 = 25,6
> If you put assigned-rate = 614400000 in DT, I see no reason can find the
> same solution on its own.
> 

The reasoning is following. I don't know why 32..64 range was declared
for this clock, and whether it would be safe to extend it and include
128, which is required for 48kHz. But I know, that multiplier=128 is
safe and works fine (together divider=5).

>> But I am unsure if hifi_pll is able to handle whole range of
>> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
>> pretty sure that it works.
> 
>>
>> Second, unfortunately frac parameter currently doesn't work. When frac
>> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
>> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
>> support of other rates than 48k requires extra effort.
> 
> Then your change is even more problematic because it certainly does not
> disable frac ... which you say is broken.
> 
> That parameter should be removed with a proper comment explaining why
> you are disabling it. That type a limitation / known issue should be
> mentionned in your change.
> 

Handling of frac should not be removed, it should be fixed to achieve
another rates. But that is not the goal of this commit.


>>
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>>> index 4325e8a6a3ef..00e06d03445b 100644
>>>> --- a/drivers/clk/meson/a1-pll.c
>>>> +++ b/drivers/clk/meson/a1-pll.c
>>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>>  	},
>>>>  };
>>>>  
>>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>>> -	.min = 32,
>>>> -	.max = 64,
>>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>>> +	PLL_PARAMS(128, 5),
>>>> +	{ },
>>>>  };
>>>>  
>>>>  static const struct reg_sequence hifi_init_regs[] = {
>>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>>  			.shift   = 6,
>>>>  			.width   = 1,
>>>>  		},
>>>> -		.range = &hifi_pll_mult_range,
>>>> +		.table = hifi_pll_params_table,
>>>>  		.init_regs = hifi_init_regs,
>>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>>  	},
>>>
>>>
> 
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
