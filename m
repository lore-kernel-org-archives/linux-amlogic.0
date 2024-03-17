Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9805FC54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lr7uU5R6XOtvLGr2mD+sRjGUlK99iYUI3qVk/VTLbes=; b=MtwJ9A5B5ZVFvj
	7gnMa/5+hoP/bFiuaa14zunlIEREzhsxmS+7MPur8WU7rlt6sBHArYNe0ur7zuCuId1AgxAfjNKDj
	haCVnbR0qUY44hoFea9FcqrwNuM1tIRzkxZzoWi3Iqur49Hbo+Q+euDeqOpnmQOV5ykq86FRPEDJr
	F5YV4tJi/QVsa0JD3aC3zxSxttxYQMjXSkhgEcUyYOO6NOxFGM7avcowLswVy4pUKERKOFgMv7Mvy
	1hF34ZRELohilzBBQIPdwIf0SsACUSzVikBhAEuPLydBFrPJ/9hFcsmUOLw/+yRv/FtJ5+viSs/nE
	jl+t4/vqKFcWEgT1qkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltUK-00000005ld6-1QuM;
	Sun, 17 Mar 2024 16:35:56 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltUG-00000005lc2-3NJ1;
	Sun, 17 Mar 2024 16:35:54 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9E21D100003;
	Sun, 17 Mar 2024 19:35:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9E21D100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710693349;
	bh=Ho5gEdZl2vZzSp+HXgGh6i6bfV8nU1CpEhQEWuG2/+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Ara94oKz7OXqeuBEALrfmD21Q7S2/FkFqw9Rm4p1sWOnZzgnr1kRs62lsXW1DO7ok
	 wu+D+HmHLdD6ji8551aC9cvT/8hgancPp+ia70XsCCIz6BMnQXJl/eXHf2Lxh0rFVm
	 97LlkfOIS0UrIiP67Bji/8E5MyAa3++cbccunkLwfKx+I3E2wnPpWrcjOpgYlxO5FU
	 psBttpHSrNxMsYt3RXhy2z4rNOl72SERA9vopOkTg6XaOar25tzy6d+pLHKHyh61++
	 NGnhmG/bL2V8/zvLGsSGeR+/dwv1SxixreFtfha++c4DlLD7uZZdB8ieCblfJxpV1V
	 c0Y81H3ervWxA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 19:35:49 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 19:35:48 +0300
Message-ID: <54e924ae-4d45-4337-aeae-32eebe773b63@salutedevices.com>
Date: Sun, 17 Mar 2024 19:35:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <827c4f17-043e-4e09-aea6-0fee22d1b234@salutedevices.com>
 <16a22924-054d-4d50-9f32-cc07c0bbbdf4@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <16a22924-054d-4d50-9f32-cc07c0bbbdf4@linaro.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_093553_327966_2905426E 
X-CRM114-Status: GOOD (  18.83  )
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



On 3/17/24 19:27, Krzysztof Kozlowski wrote:
> On 17/03/2024 16:55, Jan Dakinevich wrote:
>>
>>
>> On 3/15/24 13:00, Krzysztof Kozlowski wrote:
>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>> This option allow to redefine the rate of DSP system clock.
>>>
>>> And why is it suitable for bindings? Describe the hardware, not what you
>>> want to do in the driver.
>>>
>>
>> What do you mean? I am adding some new property and should describe it
>> in dt-bindinds. Isn't it?
> 
> No, if the property is not suitable for bindings, you should not add it
> in the first place. So again: explain what sort of hardware, not driver,
> problem you are solving here, so we can understand why do you need new
> property. Otherwise use existing properties or no properties, because we
> do not define all possible clocks in the bindings.
> 
> Let's be clear: with such commit msg explanation as you have, my answer
> is: no, driver should set clock frequency and you do not need this
> property at all.
> 

Could you please take a look on answer to "Jerome Brunet
<jbrunet@baylibre.com>"'s message on the same thread. There, I am trying
to explain what I am solving by this commit.

I would be happy to avoid this w/a, but currently this is the best I
came up with.

> Best regards,
> Krzysztof
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
