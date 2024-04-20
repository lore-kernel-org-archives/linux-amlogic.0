Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C676C4345F
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2024 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXMVvVie8CUGToNflsliiZSQavJmTcqRmbDDtQDQNZQ=; b=Ka24ZnST7C6jMT
	yjAoENahmvXq3RCVFODZuzpZP49MKsr5NEzQbUCzBdWcwJHXNu1CKZp41YcZhkpdd43Km8GoD2HCg
	8I9RpRExx1+d2qvmIonPCrsbOlnlGyM8du/+5ybYUkdtfeC/tL/lLp1QruJr9TyyEAdVCiAe52hWg
	oQWAH7m764KLyzMzZvWAxGEbRodAZ42NLvKshdJyCAVo+MsYvDJngyw2GwJQjK3V43G46j5BC2pZw
	irUA5kfwuA7n/OCocEFBCioxaLC+uCdpeNfY7ChyYVjxDxp9LX2twTlz7k3nIATfJygKH4snARp6p
	lJ06Kwbxlnyr/DsC/HNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryDPJ-00000008nDg-3QIl;
	Sat, 20 Apr 2024 16:17:41 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryDPF-00000008nCt-2Gxj;
	Sat, 20 Apr 2024 16:17:40 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 94CD3100004;
	Sat, 20 Apr 2024 19:17:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 94CD3100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713629851;
	bh=YQM/E65b0JoCQ9Wg7VXR6vW/9rP+s/n1hEAq4kHNsBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=AvBHRQKtwfpRpdLIxZPs3o3JyKMssFxhXaUw7EI9ruK05c6Ycv0ynKHpJllojJ1pI
	 UbvxAWicnjjJx5stAIPO8uYjoAUydgkg3jd4IjejMuQTRHICcxSg4yXHLp27enK4MV
	 qzaegTC48AbvWI6+cUriFe6BheMzU4kxO1EC/X8zHQmvVTp3ztd7/vyPTeqnfuTxsn
	 RB8zwPR15iH/ZIcRVvT+Qwg4yLNMSCxn8vfZzpKMFsyCIB5/yQ6LrCLPKg8a5s9BAS
	 sd+HTnAxH5vmlyaQj7d2G851ssVJmvG6rXaaFg6MV5sSB58FmRuE9FKb8UDBhn1Why
	 QMnNhl6AIfvWg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 20 Apr 2024 19:17:31 +0300 (MSK)
Received: from [10.8.0.14] (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 20 Apr
 2024 19:17:29 +0300
Message-ID: <b86f1058-da53-4a9c-bc12-e7297351b482@salutedevices.com>
Date: Sat, 20 Apr 2024 19:15:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <20240419210949.GA3979121-robh@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240419210949.GA3979121-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184817 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/20 14:16:00 #24891574
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_091738_311128_23FC7246 
X-CRM114-Status: GOOD (  21.24  )
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



On 4/20/24 00:09, Rob Herring wrote:
> On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>
>> This controller has 6 mandatory and up to 20 optional clocks. To describe
>> this, I use 'additionalItems'. It produces correct processed-schema.json:
>>
>>   "clock-names": {
>>       "maxItems": 26,
>>       "items": [
>>           {
>>               "const": "pclk"
>>           },
>>           {
>>               "const": "dds_in"
>>           },
>>           {
>>               "const": "fclk_div2"
>>           },
>>           {
>>               "const": "fclk_div3"
>>           },
>>           {
>>               "const": "hifi_pll"
>>           },
>>           {
>>               "const": "xtal"
>>           }
>>       ],
>>       "additionalItems": {
>>           "oneOf": [
>>               {
>>                   "pattern": "^slv_sclk[0-9]$"
>>               },
>>               {
>>                   "pattern": "^slv_lrclk[0-9]$"
>>               }
>>           ]
>>       },
>>       "type": "array",
>>       "minItems": 6
>>   },
>>
>> and it behaves as expected. However, the checking is followed by
>> complaints like this:
>>
>>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>>
>> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
>> do it right?
> 
> The meta-schemas are written both to prevent nonsense that json-schema 
> allows by default (e.g additionalitems (wrong case)) and constraints to 
> follow the patterns we expect. I'm happy to loosen the latter case if 
> there's really a need. 
> 
> Generally, most bindings shouldn't be using 'additionalItems' at all as 
> all entries should be defined, but there's a few exceptions. Here, the 
> only reasoning I see is 26 entries is a lot to write out, but that 
> wouldn't really justify it. 

Writing a lot of entries don't scary me too much, but the reason is that
the existence of optional clock sources depends on schematics. Also, we
unable to declare dt-nodes for 'clocks' array in any generic way,
because their declaration would depends on that what is actually
connected to the SoC (dt-node could be "fixed-clock" with specific rate
or something else).

By the way, I don't know any example (neither for A1 SoC nor for other
Amlogic's SoCs) where these optional clocks are used, but they are
allowed by hw.

This is my understanding of this controller. I hope, Jerome Brunet will
clarify how it actually works.

> As Krzysztof pointed out, you either have 
> the clocks in the h/w or you don't, so saying they are variable is 
> suspect.
> 
> Rob

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
