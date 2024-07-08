Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49DC3DA42
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsxlfOrF4OyHvueh+M5nlcqComiQ8wt7TjrGXASsaZ4=; b=K1SFEyyT/ESEFo
	qUS4dbmh6s8v+KrWbh1I3SPc3wxh9Rhm4kcv7fgKwxlsN/9li9fJL9T6luw2G+Uxsd8cstsFeypsJ
	XdbFidHG4LNfncLhx6QkOvHj/Xy0QrRcq+YiptEVkvAsIm0JPah2APKT6xUyGhcoVgJ0UDQb8jKzs
	2/2zzzpDQ2JZx/QLA20Ix8wDl7sBCZG+eOBvNQsZjXkAzdYbjKtRm0BSd5kvWGzZzwoXh6c4ZZee7
	JA97K1K/BdiYplwWi1fLrYyl2soRESTfxSAeCqGcl1Yrgpjcm8M0uQWNR9AXCpQ6JCVZ4/TPAGlhk
	6QoP0+cfrl+YDFgbsAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqQt-00000004FZA-3DPr;
	Mon, 08 Jul 2024 15:37:39 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqQp-00000004FWm-3cFJ;
	Mon, 08 Jul 2024 15:37:38 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 10192120005;
	Mon,  8 Jul 2024 18:37:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 10192120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720453042;
	bh=Bo/6XCu3DzX8pb2DXto2aIjlWq7K1MB2e/LDCsAwPr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=v1VQQhwlvdIQcefu+5VOdf7ahVdnlEg1GJcsptyzWz02GK5Bj4V/Zer5Fv6yXQOK7
	 02NUnd2qSIJ+LT1tBtFr8Bh6ksotDPwLM9ttqdDOcG/OKEkx4rAkqR/cishfu7iDFy
	 /XczqEpgrlTs+mTlk4aecTuT/Z5STeoIn7pN2Gh5tKCXcCvMBe02X9ZZ5Y/ODo2TYV
	 QK2568OIt1RZrrQ0GisIHSAc1vU7/uWbdTjT8fRaPU5oe0RSJZ5b4FDLxFOB3g2UJU
	 /XZb/XMcGqSyn/c9MZBvd42O0gTRaNGvD3UC1aP1M9f2qot/IWtd1t4+j0hixdeEVK
	 aI3aFVmir5bdg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 18:37:21 +0300 (MSK)
Received: from [172.28.64.179] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 18:37:21 +0300
Message-ID: <4ec6b50e-b915-4e18-a8a5-97ca7ab9e4ce@salutedevices.com>
Date: Mon, 8 Jul 2024 18:37:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <ukleinek@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
References: <20240702123425.584610-1-gnstark@salutedevices.com>
 <20240702123425.584610-2-gnstark@salutedevices.com>
 <1j8qychvv6.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <1j8qychvv6.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186376 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/08 12:56:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/08 14:31:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 12:25:00 #25908179
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_083736_592889_4B3CB8B8 
X-CRM114-Status: GOOD (  15.17  )
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

Hello Jerome

Thanks for the review

On 7/8/24 16:11, Jerome Brunet wrote:
> On Tue 02 Jul 2024 at 15:34, George Stark <gnstark@salutedevices.com> wrote:
> 
>> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> ---
>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index 1d71d4f8f328..e021cf59421a 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml

...

> 
> The change is not only introducing a1 compatibility but also allowing a
> power-domain for the other SoC, even if optional.
> 
> If that is intended, it should be stated in the description and probably
> a separate change.

AFAIK the only SoC with a separate PD for PWM is A1 (currently). I added 
PD to bindings by an independent change in series #2 [1] but Rob
proposed it should be squashed into compatible patch. The only thing 
missed in series #2 was the conditional schema making PD required for A1.

I personally would prefer to add PD as a separate change.
I'll give it a try.

[1] 
https://lore.kernel.org/lkml/20240701172016.523402-1-gnstark@salutedevices.com/T/#m0e004fc0d22e205aa3bf6bdd0284d251f26eb0f3


> 
>>     "#pwm-cells":
>>       const: 3
>>   
>> @@ -136,6 +143,16 @@ allOf:
>>         required:
>>           - clocks
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson-a1-pwm
>> +    then:
>> +      required:
>> +        - power-domains
>> +
>>   additionalProperties: false
>>   
>>   examples:
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
