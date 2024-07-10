Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBEC3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwkkcYXs9R1sDxNuefIDx5tJCNEWjUQo/yIFnq/Ata8=; b=1vca52dnhcbG+l
	aGrMoaXT2oRpoEJdR0CF0yXNYISxay9Y733ZU7GTrBDsya1px8OkiEBp/YUCO7S5H50P1mIWiR+dj
	WJITxNlISRO7Ij5CvgkbjXdWoFmRegjxFqvqoXKyGCj+YCCkF3xFOq81EeBMIYVoP7B5YkyAIe1ip
	DAuy63m39VpEN+RR1jN2bBciC+epP2bbJbOotKMOeaigJ7orO8kwBlXyQO6NGj2ng2wBmtLC5H2uo
	WEfke5hA8mT6kAVURmgYPm8GYXvroKDOeHT1/XajWkY5/lTDd3NYd8MuiUOMUr6ZP023bHYu2N7q0
	/i5/svz05N7Uec/yFLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa6A-0000000B8F5-2INW;
	Wed, 10 Jul 2024 16:23:18 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa66-0000000B8Cy-2iY0;
	Wed, 10 Jul 2024 16:23:17 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DEEE8120007;
	Wed, 10 Jul 2024 19:23:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DEEE8120007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720628585;
	bh=UxMw2H1wG2rrssfdT9EsTgjW0YQUtwZBVo4IjBGhuDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Le+UP53VKWyjsNKvjJgUKyOymUoG36MmvHSPk7PRogpzaDrQZ43vsoGUjivZamoCQ
	 t20QV3BJ719mrKod+eijBV7UyKY2IzEDIgvYNapM48kA7OhT3TT+nyY0h2ug2GZ4Pk
	 vVXEtk1pH+EqgoPWyUYo/6PvYl5ArD73LPFqTbN8YkWnCtkRQM1BkS1tzN1QQf1PJ/
	 VFDzj948BE4228CQUmv/uSH27ePYiouFerz1TRrA7qc/gCGslu3DyDZxkxVoaOKFlC
	 rAGqkSE/uExLF2C7Gf/R/bOZpYRUCe0wVeNHKX144o+EhwHqUTnHgJIcw2L7R7ccUk
	 zbMW5tqCqvgFA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Jul 2024 19:23:05 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jul 2024 19:23:05 +0300
Message-ID: <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
Date: Wed, 10 Jul 2024 19:23:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>
CC: <linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<krzk+dt@kernel.org>, <hkallweit1@gmail.com>, <glaroque@baylibre.com>,
	<khilman@baylibre.com>, <broonie@kernel.org>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<lukasz.luba@arm.com>, <b.galvani@gmail.com>, <mmkurbanov@sberdevices.ru>,
	<rui.zhang@intel.com>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, <conor+dt@kernel.org>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
 <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186445 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 14:21:00 #25942305
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092315_411563_4E87D607 
X-CRM114-Status: GOOD (  11.94  )
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

Hello Krzysztof, Neil, Rob

Thanks for your reviews.

I'd just like to clarify things a little on that matter. On A1 most of
periphery has either dedicated power domain (ir, spifc, spi, cpu etc) or
several peripheries share single PD e.g. pwm, temp sensor, i2c, adc
share PD 12. Appropriate PD must be turned on before the periphery is
touched and be on while periphery is used. Experiments confirm it. So
power-domains property in dts nodes is really required. It makes kernel
to control PDs when bound periphery is used.

If I understand bindings thing correctly we should make power-domains
property required in bindings too in that case, at least for those
peripheries which has *a1* compatibles (some peripheries use compatible
from older SoCs without PDs).

What you think?

On 7/8/24 22:51, Krzysztof Kozlowski wrote:
> On 08/07/2024 21:48, George Stark wrote:
>> SPI Flash Controller has dedicated power domain so make the
>> corresponding property required.
> 
> That's an ABI break. Being part of power domain does not necessarily
> mean it must be required, so your commit msg lacks rationale. Especially
> on the ABI part.
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
