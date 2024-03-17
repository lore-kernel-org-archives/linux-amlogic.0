Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD3C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvAKDvhI0qQL3zjf0BdwHTi+vv0dcHbyi0DEpw2cZeM=; b=0rg1aebvqu7OlS
	KK2pyIStEqGrWz5uB5FfSMUEpfz7V8yoofMXJptfQ5HoXlQZi3y+BjeQoMunD9lgJ6AfcOmDPrp8E
	qPytp6WyQO/KlD6PmeRIOKRrYamT4jlhQqUwDi3N8tk3ZALqYWuuWcsVmZHaWIeQ5gLq8t2ZLmpH8
	XQdlNW9TQe5VcLBMYe2UsEj0tN8cA8nazjhWmL+lqXEKYrnqz7gE0AGZPvekYscwbcyLvPf9243rV
	GiBsSvcYZuaYlPN2nn4jlTM3dvyae0zq/0JdvKtiIjXcINEiwMmhPf2wuiez2iVjpApBGtpYEcsjO
	NZ+09V/dpYXch/DkTzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm06f-00000006lN8-1qer;
	Sun, 17 Mar 2024 23:39:57 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm06a-00000006lMH-2AFh;
	Sun, 17 Mar 2024 23:39:55 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7A96D120002;
	Mon, 18 Mar 2024 02:39:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7A96D120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710718787;
	bh=bKsdI1eMZNCKrRBjX4TwkOfAmnVx5pDlExnmUyzw5I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=d2g4D0qYg7zCodKeZgunyPQ2KHFeWySByW3jsDIdDJPoZ45ddkegxgysUiOXg4C4V
	 dKCzGIMi9BrjxQg67RAkFBWIN4xHn8l6Uzhd1hn2Xqy2zDM7RyVemTuTVMJu1a/ww/
	 BmlnccNSzsyV3U6K4jD9fCGzBve5aCH7TNmBFhdfYFDj803QgXT743kOJdiMWYg+v5
	 1itPRU/yii51uY2BbU2auMmX4qV8ZkTEIqANPaliE4gJ1R+RdMRgGOmDib81FFzL0i
	 ETOVXcFgC+4fVWh/MtRgHAdAfBm8HZtpKBkt5p+NQSWWhxf/tC8zXByk80AicK4rgg
	 RAAcvadico93g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 02:39:47 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 18 Mar 2024 02:39:46 +0300
Message-ID: <7d61700d-bfb5-46c6-bd45-a18aecf06a5b@salutedevices.com>
Date: Mon, 18 Mar 2024 02:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] ASoC: dt-bindings: meson: t9015: add support for A1
 SoC family
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
 <20240317190316.GA2071139-robh@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240317190316.GA2071139-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
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
X-CRM114-CacheID: sfid-20240317_163953_128830_7A596EA5 
X-CRM114-Status: GOOD (  14.17  )
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



On 3/17/24 22:03, Rob Herring wrote:
> On Fri, Mar 15, 2024 at 02:21:47AM +0300, Jan Dakinevich wrote:
>> Add "amlogic,t9015-a1" compatible string.
> 
> That's obvious from the diff. Perhaps what does 'a1' mean? What the 
> difference from the existing compatible?
> 

a1 means A1 SoC family. The difference is described in next commit where
this compatible string is added to driver. Should I duplicate here the
explanation from that commit?

>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> index 5f5cccdbeb34..ee8bd57dbcf9 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> @@ -21,7 +21,9 @@ properties:
>>  
>>    compatible:
>>      items:
>> -      - const: amlogic,t9015
>> +      - enum:
>> +          - amlogic,t9015
>> +          - amlogic,t9015-a1
>>  
>>    clocks:
>>      items:
>> -- 
>> 2.34.1
>>

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
