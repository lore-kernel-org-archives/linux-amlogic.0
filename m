Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53888C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pgooZaE1GfiCwTJwtM67Ct4iptCqGMyxvW/tTiInrk=; b=CFOCrOXztWjoLo
	TOkhYs1tSuBbS0UgnQLN6xJ1Wko0S7fBY0A/JYom01x2/mwKgW7LjXdmLOm537+sz7eC2muMw2mS9
	fNBv3tAu+Tl9BETDb71cSIfHy67cppdDpoT48G02kWqc55GUjOd1DoEwbKQtAt63WbZUL9UFZTvFh
	9VqRqTeEA5uYUq0Tj4Z+Hc9vj63w//dwgaofRwRRRhN1PpKPvrPNrtW1kRJUmeuGV5fblzBln42Z2
	47eaQBkQnYMCXpHoF26TbToPSh9zHns5xyoZmI+sWYcUTTsF+njU5tIMt2LOClSMhuyOm7Af1RdhD
	uhUB6ikP3qvYG9CPU7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltYu-00000005mrA-42Si;
	Sun, 17 Mar 2024 16:40:41 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rltYr-00000005mpk-1ase;
	Sun, 17 Mar 2024 16:40:39 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2AEC8100003;
	Sun, 17 Mar 2024 19:40:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2AEC8100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710693634;
	bh=lEq6Kb5vBlzArU0pRaYlg7z55lfmTSD3KSjeJpJTu0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=cX6WFVvUwPP7EJJVC7Yvc9c6ByHDR2+CHSsC0r6Y2Rl7LGFUXFVzGeYI3V/szI1Zj
	 RQQB0n1/eioqV5ehuDnSCJmpCzMnS+PgN846loM74ow4lQtw+YAKEL+ko1F0Y/vWLt
	 blXftJAp1ZnqZQYMFOagvdTc+qDTpXVEut+4LWx/KCPVtvSJWPEmtvXFYO5dk+Dkvp
	 iScd+8DVRSRQEABtMNGzm4nYtRg3dEOYd71UqJ3iB+Ay305ITReeLR84GBaJEmiQti
	 nbZM+0KHX9wiXbINL3lENyc6ygjhxaMe2N9RnUW5Rne1l0kK3/wEIPuRm8WrRgXRsu
	 7LuQz9Th9hROg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 19:40:34 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 19:40:33 +0300
Message-ID: <b6fecbe4-862c-4ebe-9f56-8514a3c226d4@salutedevices.com>
Date: Sun, 17 Mar 2024 19:39:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/25] ASoC: dt-bindings: meson: axg-sound-card: claim
 support of A1 SoC family
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
 <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
 <1jr0gbhkgp.fsf@starbuckisacylon.baylibre.com>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1jr0gbhkgp.fsf@starbuckisacylon.baylibre.com>
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
X-CRM114-CacheID: sfid-20240317_094038_372851_B2880D0F 
X-CRM114-Status: GOOD (  19.37  )
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



On 3/15/24 13:06, Jerome Brunet wrote:
> 
> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> Add "amlogic,a1-sound-card" compatible string alias to
>> "amlogic,axg-sound-card".
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> index 5db718e4d0e7..492b41cc8ccd 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
>> @@ -14,7 +14,11 @@ allOf:
>>  
>>  properties:
>>    compatible:
>> -    const: amlogic,axg-sound-card
>> +    oneOf:
>> +      - const: amlogic,axg-sound-card
>> +      - items:
>> +          - const: amlogic,a1-sound-card
>> +          - const: amlogic,axg-sound-card
> 
> I know the rule about SoC related name but it is different here.
> This does not describe HW in the SoC. 
> 
> The axg sound card is just a name, much like simple-card or
> audio-graph-card. I could have named it "amlogic,my-awesome-card"
> 
> We would not add "amlogic,a1-simple-card", would we ?
> 
> It is purely a software component, which aggregate HW ones.
> 
> 
>>    audio-aux-devs:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> 

So, I can drop a couple of commits like this. Right?

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
