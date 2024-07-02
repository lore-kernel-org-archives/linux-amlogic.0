Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D90AC3064D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2024 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMNzFPbMpKF9dkgxIuaMiC+VgReqslefi8s6RncLlZk=; b=ss8t+21I9/iriP
	GA9pqGZfndS5hpxL2MRBnIiXcYiehVB2nJtrxETZRmT9vhbjxEYUpdtQHW4N1DVI2rmAo4H8g5OsO
	EGyi04dDngAUyyHXj57EGGrYLtkmZgQwOt/w2T3s4Ua6N341KYGPKbt8BJ8E+n0nVsKP+IYideKzQ
	uwholSHZBOnAouia+SvGu8KtklAWn3lVhvPqresIUO5zDWLp5+OqvJGq3h6HM2bVYy9DQ/KNRZtdj
	CLcbPbI57w5zzFS6WWbdXVQ0MhP69uGv/YH/gMm9QNnQ4yR3C4FaF1zc4ONd3ksAMD1i9zD3gf+KH
	s0K1jt0UJfgDz9D+T29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcdp-00000006gbE-3ZZT;
	Tue, 02 Jul 2024 12:29:49 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcdi-00000006gZT-0Vm2;
	Tue, 02 Jul 2024 12:29:48 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C4E2E12000A;
	Tue,  2 Jul 2024 15:29:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C4E2E12000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1719923376;
	bh=dRg6152bEnilxNCIoE5zA/wmMBOuMDTu0AIr+x54D4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=V7uvODUvcYFk1y+du59hc3HqKuLLj3yNsdafT7CCsNDKzRrbsv5Tl2d0LD0zNxjm8
	 KnM7JwvrnrSvgCAiaLKf3893wX9dwIVfPp5+onT2rRWv0sNZy53dmjdHurpXJ3W5QQ
	 Oa/cneThEv0vMriZYaJrWtlWSZWTZRfEjlL/smfLMphKsfvYxqNa5xGuBdMC+Cym52
	 zkthJ+HqkJkhDXW7vM9qAbIL3Ssjy9IHfoAnUnaPLNjELGVqBZfboX+/6RgANbIbJ0
	 /Vt/C1uQkRYJkvDl6ISRIoiC+j5w9VH3Jlri+LJo5SXZP2NyZjVQxbhxJctfdXfTMQ
	 lTBexzl94ZRGg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  2 Jul 2024 15:29:36 +0300 (MSK)
Received: from [172.28.129.1] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jul 2024 15:29:36 +0300
Message-ID: <66278f9c-3dde-420a-b446-69693690dc10@salutedevices.com>
Date: Tue, 2 Jul 2024 15:29:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: pwm: amlogic: Add optional
 power-domains
To: Rob Herring <robh@kernel.org>
CC: <ukleinek@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>
References: <20240701172016.523402-1-gnstark@salutedevices.com>
 <20240701172016.523402-3-gnstark@salutedevices.com>
 <20240701183631.GA349021-robh@kernel.org>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240701183631.GA349021-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186277 [Jul 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/02 07:59:00 #25796134
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_052942_867339_01F1C1ED 
X-CRM114-Status: GOOD (  17.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Rob

Thanks for the review.

On 7/1/24 21:36, Rob Herring wrote:
> On Mon, Jul 01, 2024 at 08:20:15PM +0300, George Stark wrote:
>> On newer SoCs, the PWM can require a power-domain to operate so add it
>> as optional.
> 
> If required, then how is it optional?

Newly adding SoC's PWM definitely requires power-domains, older SoCs
don't have dedicated power-domain for that that kind of periphery.
But I can't say other new SoCs won't require it too that's why I made it
by a separate patch. And squash the power-domians patch into main one
is ok too.

> 
> If the 'newer SoCs' means the one you just added, then this should be
> squashed into the prior patch with a conditional schema making it
> required for the new compatible.

> 
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index da22cb3ed878..c814d88748dd 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -60,6 +60,9 @@ properties:
>>       minItems: 1
>>       maxItems: 2
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     "#pwm-cells":
>>       const: 3
>>   
>> -- 
>> 2.25.1
>>

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
