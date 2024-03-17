Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B898C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ0cLRe72GWoFuj4rIIL7bcTyffXkAsNpNeqWIuUauk=; b=PIZvEP88mqmZm0
	A35Lu8IG92cWrIVlKlfVyK0WGc8wLoAIhLkVJnRVXnevP4exKZlbENC0VEREGhAtZZrCMygwjXAVY
	r7BEW/J926Yewm3KYH4Stoz4U/6r1h7HUG2KkuoJ0kPnfmt+ZoIkzEGT4r2dsgK1is8Yhnwp//EEI
	f1Hbx0yNsKLdCqFxdbkZuxJPR5Cs9ZZMHGK6epZMK+HE+Yhp9ReGn5Rq3ctzfS5QSxROJlzEBEgLQ
	/y0YWMIyIrpuvjNiuO9okncEKlcfIexwHsA2PSqh85Lamr0OEmMcpTRcPdJ6S5B5i/4xMkkdcUvGh
	6H5B/US/tYz7ufrt85hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsJJ-00000005YcY-1lDR;
	Sun, 17 Mar 2024 15:20:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsJE-00000005YaE-2P8C;
	Sun, 17 Mar 2024 15:20:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7F206120006;
	Sun, 17 Mar 2024 18:20:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7F206120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710688819;
	bh=V0nv3zgvdKj1Lp4YbBHZoSBadq2eA8+xFKoUJSBsE9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Z4kUHGOpgIiCzFmKxPX172UziPQP3MmtXzVPzlvesuZGwluMZX/bjigs7i5+lXJYO
	 6b9FqZ+r6vlAHIU/wzGgGT94z6UfCoYQUXHy1xTxSn2HrLAmTz0ULFYTXfO4LfiOFc
	 9g4taKa3wMlaJe2D6Ef5VK6K0BRWjGOal61J71l3vdKiIeUCeY/wEVD7xdvf7moVIw
	 PXvUnF7/gcArytcKWO4A5rnMV/2ILBDsztpsrjWVROQ4dGjUvvTcvA9veec4CWA4B3
	 BxdjImQ9mx8cJ7OZigIn9MNGcZA5hCaFuXaJDFIQwPfrH4Jr7BO3VQKepAodb78gkQ
	 cNLMfIrTdStog==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 18:20:19 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 18:20:18 +0300
Message-ID: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
Date: Sun, 17 Mar 2024 18:19:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
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
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_082025_410202_97F7B2E8 
X-CRM114-Status: GOOD (  11.85  )
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



On 3/15/24 16:33, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:
> 
>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>> -	.reg_bits	= 32,
>> -	.val_bits	= 32,
>> -	.reg_stride	= 4,
>> +	.reg_bits		= 32,
>> +	.val_bits		= 32,
>> +	.reg_stride		= 4,
>> +	.max_register		= TOACODEC_CTRL0,
>> +	.max_register_is_0	= true,
> 
> If the maximum register is 0 how does the regmap have a stride?

reg_stride inherited from existing code. Apparently, it was meaningless
even before my modifications (the hardware has single register
regardless of max_register declaration) and it should be dropped. But,
is it okay to remove it in the same commit?

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
