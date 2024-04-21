Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A065C4345F
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2024 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI1ajIj63lNU4FEpeGdtWntpUUCEUDgziNKn/tjLW0w=; b=t1ZjoPbHzGXyYs
	WbyUfL6fes/bj5mNtkRTN/1mKAhwLQgvFTMCuJoz2bZdONzdGPusyZjMhy6rOK0uzQYFlVwH6InG9
	EYKfrS35RXrN4NgKQa39tcQbaDDRbmCu3zX0Opf3yQg7WzJo/mHDjPmvxeATX2GfWIOo1/1/DRswf
	kXWXGXR6nFpkCleFowy6WEj0VCYcQdLpifotID3zbu2OBG2gImSrMS8m9J7DJPwq6YxI9JQns025P
	MG1uXugwtclrnkc//3vssB0odeb3p4lUl6LPW9xlSpbfP7Mvq08K7njgISwC5B/eCAeN8IomDEKhB
	P9ZhvybENpOmcnah7HRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryZGR-0000000AkLI-24zR;
	Sun, 21 Apr 2024 15:37:59 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryZGL-0000000AkJt-3dkQ;
	Sun, 21 Apr 2024 15:37:57 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CA84F120005;
	Sun, 21 Apr 2024 18:37:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CA84F120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713713858;
	bh=hogG5LV3BYlzBZpuc6YRB+xya+znZiqbrBBz/0q4CZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=jjmKcyAAMkHb88S6n3mQTDSBb3v0dA3c9JdNCBzllHfsVjlMM6Ir0svf0YlQWeNJ8
	 IYhVDYPyzlOoOV1idB+t0mIOyjsDDe7lWg+8gTld3L9/8VuePjWnSrdbxObtVIW954
	 5FIWG7lEfDNXzWp9/zzPIyIG0inxzxugaGntNvOdnX+UHO8tikUrHBfeSNWv/l2m/2
	 nynf1JK1nw4hbdM1S10TQ374Tn/94UnRiqJGWlyRxJ/g8ixKAJ2YfzmHD//KoBzEyP
	 Gc2/FQLPWWLjaB66exJoRiIKklp/4Q4yMcwTlBesDhRobtILnIcc7C3ff/klIIEuBl
	 /129qqGUTTp2g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 21 Apr 2024 18:37:38 +0300 (MSK)
Received: from [10.8.0.14] (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 21 Apr
 2024 18:37:35 +0300
Message-ID: <ca1b1263-1574-4fbe-913e-f68f6c59608e@salutedevices.com>
Date: Sun, 21 Apr 2024 18:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org>
 <0194ddb8-6e93-4a77-9fdd-93fc79a4e03e@salutedevices.com>
 <7746a6a8-110f-4920-9f15-8fb592e829ff@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <7746a6a8-110f-4920-9f15-8fb592e829ff@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184821 [Apr 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/21 07:35:00 #24905600
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_083754_487511_100E4C3C 
X-CRM114-Status: GOOD (  14.62  )
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



On 4/21/24 17:02, Krzysztof Kozlowski wrote:
> On 20/04/2024 16:48, Jan Dakinevich wrote:
>>>> +                clock-names = "pclk",
>>>> +                              "dds_in",
>>>> +                              "fclk_div2",
>>>> +                              "fclk_div3",
>>>> +                              "hifi_pll",
>>>> +                              "xtal";
>>>
>>> Make it complete - list all clocks.
>>>
>>
>> You mean, all optional clocks should be mentioned here. Right?
> 
> Yes.
> >>
>>>> +        };
>>>> +
>>>> +        clkc_audio_vad: clock-controller@fe054800 {
>>>
>>> Just keep one example. It's basically almost the same.
>>>
>>
>> The worth of this duplication is to show how a clock from second
>> controller (<&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>) is used by first
>> one. May be it would be better to keep it... What do you think?
> 
> I don't understand what is worth here. Using clocks is kind of obvious?
> What's special?
> 

The special is that the clock "pclk" for "clkc_audio" must be
<&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>. This thing is not obvious. I
can keep only "clkc_audio" node here, but reference to "clkc_audio_vad"
will be undefined in example. Is it okay?

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
