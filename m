Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65C6C54E67
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bKPXuhDstywnfe82icvuVYev89/EmwKj6Gd34ayE2Y=; b=w3tPw2m50MZC7p
	Y2YmYbant6PbhYtG55SL3XhqfKlBZz3UGL4M9gGbHALaq62HWKbv+Es8Hvy0T/0kI+QuWsSlHgyd8
	ciK+9vM9BlEGefJl4ICS2Q/5uxpwowUDGEnRHtsSJwpjeRb1L6CiiqFSHjfJlCXFUDeh1bME4Gfq4
	HWujv1EnKaqhL2kzJd7ITO+5mutt0B7CGzcyeRehBnIIjkE/90GJ3N730HqNCtN4QqPdSVwuSwqmJ
	kLC3DIjbdZEoj+95XRslCmm5tvh8vTGJEBTn2IyrcEqyiJVf7F4uc44ZpsMe85iVrHci4hlXpKFyD
	QmuKefslrmRX8+21vR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlrWZ-00000005P7b-1VNQ;
	Sun, 17 Mar 2024 14:30:07 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlrWW-00000005P65-1t0V;
	Sun, 17 Mar 2024 14:30:06 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46CC2120006;
	Sun, 17 Mar 2024 17:29:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46CC2120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710685797;
	bh=U7iGhIFEEZJr2pptTT9ef5adqscsVQVXDtlJaym04/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=o04TGxXHCIs+xdCGFZjuqAqJVDHx6+acGPFOJSTYaI6LnxXuT8PcQ2yvRfSAbQQIk
	 4meOHYBpCBtgy/6fctGtrJgHf9RoHbQC5eYtno1SL599F8tytgg/CiwhCp8Osay7L9
	 Fic1MUlA5kG6N9L8C5c8T1boCun87MWSgBEP5oNEUUhBfjk/xX7tJvibi212XHDZqB
	 kgeVfleDZbV3+LhqdLQKJr06dAulZcGzbggyE5O2wYng6Y4wBesR6mKm1yxL4aMynW
	 OVCBmur3qSylI22aidgBK/5UDVhbBzQZBBzNmjILssrsGHJQV25KrvxHzWRuz+Kvr0
	 WFngVLFSl9yvg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 17:29:57 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 17:29:56 +0300
Message-ID: <5a541ea3-ac4b-4606-9b6a-b103084b30b5@salutedevices.com>
Date: Sun, 17 Mar 2024 17:29:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] ASoC: dt-bindings: meson: g12a-toacodec: add
 support for A1 SoC family
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
 <20240314232201.2102178-9-jan.dakinevich@salutedevices.com>
 <f91ea77c-8170-4ae6-850f-3d5715d83855@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <f91ea77c-8170-4ae6-850f-3d5715d83855@linaro.org>
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
X-CRM114-CacheID: sfid-20240317_073004_879965_64309079 
X-CRM114-Status: GOOD (  18.01  )
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

I mean the following... This commit adds new defines to
meson-g12a-toacodec.h header. These defines are used in the following way:

sound-dai = <&toacodec TOACODEC_IN_A>;
sound-dai = <&toacodec TOACODEC_CAPTURE_OUT_A>;

So, can you make an advise how to call something like "&toacodec" to
which I declare new parameters.

On 3/15/24 12:58, Krzysztof Kozlowski wrote:
> On 15/03/2024 00:21, Jan Dakinevich wrote:
>> Add "amlogic,t9015-a1" compatible string and new device tree phandle
>> options.
> 
> I don't understand the second part. You did not add any options, no
> phandles. You added some defines for something, so say what are these
> "something".
> 
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 1 +
>>  include/dt-bindings/sound/meson-g12a-toacodec.h              | 5 +++++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> index 23f82bb89750..c47604aa590f 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> @@ -26,6 +26,7 @@ properties:
>>        - items:
>>            - enum:
>>                - amlogic,sm1-toacodec
>> +              - amlogic,a1-toacodec
> 
> Keep alphabetical order. Don't stuff new entries to the end...
> 
> 
> 
> 
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
