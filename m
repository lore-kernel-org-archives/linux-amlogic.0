Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E439C25B4F
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2024 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fi+cWIgqr+g3QQhoWb/oBPQlPudpzpIqoqvzTjlz72U=; b=aTp2GJi7ML5cwt
	Fsmhp7QzSOoPNL1kLlyVmE+EWkS3v0hE3aY5gwLnTJ6x29YA3pTFr0eDvt+0vaHv4uc9Ut+wEHoPh
	AmOZMlbtasyAI67cqk7UJ1wv2ctaybLooRK7yRKLd1zvYyS6NIcnW3at5pqujzZUeKU2rJXnaoutb
	qERNLp0Xp3d4KW93iFfjxZMTDFT6dPrYMU2ZIJRXhh3Uk8xFks/r4pcX13AypfPa/qpRG/d/ArsQw
	IScQRyUfJERCqcAHMVe+aXM34bJNdPgNYv/zgrZslWQ6+oF4VJJPmBwHbXinIrfHvXI5c9c43p0Mf
	kqbTry4+lRHLOoiCX/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6EXs-0000000Acac-3JHw;
	Sun, 12 May 2024 19:07:40 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6EXo-0000000AcZ1-3IG1;
	Sun, 12 May 2024 19:07:39 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 84E37120003;
	Sun, 12 May 2024 22:07:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 84E37120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715540845;
	bh=2rLH5TzP+km5UCLaOhbG3t3/0duKaiLCAy3iw53i790=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=k6xk3aN1sH9YnprLNrA0TrGzy+pVwxtShIrPAHyKUyGn5V7eBIURawthug715H4O8
	 8bzbaLRl3JXui/ROukePFD3A/QHqUOIYGwhLbogg+gXGZ//ngX4gkghaWjP7YlONAr
	 1FB+O2eSxFUGUfbZl8D2oTdVkAlEMTrKzJZK/drYvPP8YWDRPiOAVfMGbLyLPnj/cS
	 TgnSI00sivc8BHlr/+L0uVgbTCQmc9R8xYJ0/2j67w7RwN/kB4pZ1jKOE4wYHbnxE2
	 I2ptCygTTK9xfyNm7rpXTjV7BL+ve0n6qsSLP5rq8a1QbDLR8lMq6MIHVLlT8pvu5Y
	 yphCnkiyFOg0A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 12 May 2024 22:07:25 +0300 (MSK)
Received: from [172.28.66.92] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 12 May 2024 22:07:24 +0300
Message-ID: <3fa610c2-1f69-41d4-b06a-035980483b3c@salutedevices.com>
Date: Sun, 12 May 2024 22:06:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [APPROACH 2 1/2] arm64: dts: amlogic: list all slave clocks for
 audio clock controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
References: <20240508144259.191843-1-jan.dakinevich@salutedevices.com>
 <20240508144259.191843-3-jan.dakinevich@salutedevices.com>
 <20240508175013.GA2244257-robh@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240508175013.GA2244257-robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185167 [May 11 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/12 16:13:00 #25178084
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_120737_381461_C0045633 
X-CRM114-Status: GOOD (  15.23  )
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



On 5/8/24 20:50, Rob Herring wrote:
> On Wed, May 08, 2024 at 05:42:58PM +0300, Jan Dakinevich wrote:
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 27 ++++++++++++++++++++--
>>  arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 26 +++++++++++++++++++--
>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 26 +++++++++++++++++++--
>>  3 files changed, 73 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index 6d12b760b90f..28f4ec5f39b0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -1342,7 +1342,9 @@ clkc_audio: clock-controller@0 {
>>  					 <&clkc CLKID_HIFI_PLL>,
>>  					 <&clkc CLKID_FCLK_DIV3>,
>>  					 <&clkc CLKID_FCLK_DIV4>,
>> -					 <&clkc CLKID_GP0_PLL>;
>> +					 <&clkc CLKID_GP0_PLL>,
>> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
>> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>;
> 
> All 3 cases are just unused clocks on the end. I suppose that's not 
> always the case. You could just set 'minItems' in the binding to 
> avoid needing to pad the end and the dts changes.
> 

You are right. I mistakenly thought that 'minItems' can not be
redefined. But not, it is allowed to redefine it and it works. Thus,
this patch is not needed for this approach.

Anyway, what do you think about first approach? As for me, it is more
simple and readable.

> Rob

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
