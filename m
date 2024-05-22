Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E5BC25B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2024 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zziNJFuoWP3nwSRueklRUtxDlrr/978sjuZexDkydhQ=; b=QUFFEmqFq5WmEK
	MmgJm0uzUYx+aFTXsFphcD5EeB57iGTcKTp9TDk10MZ6Togs7vY1MBo/T57Gnan617YWFNDgzgryx
	mUzQ635iTrzT7dTOgJ8P5MLwTlHq2UuRK+gWteA5LcFh24rHcf5bPdLhzg+tpDcI7yfhpzwE/K5NL
	ePFYE40OqYozQn5x8j9beVE6OcGIAV2ms7E5bQ/eLP0wU7OjpMQ4ixmIQbGVgjtqif+xtdeBefJHI
	Rn0xur1PXiB4xpuvUZiTrae0rFWrsIkxcXcZzVDBPV0Tw2ET0EriqWPWtWcWPh7P97BmZC2a0d7NQ
	zBQ9H7DS4zW4jdcrU7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9pyO-00000003gfR-0jTh;
	Wed, 22 May 2024 17:41:56 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9pyK-00000003geo-2a7n;
	Wed, 22 May 2024 17:41:55 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2FBAE120011;
	Wed, 22 May 2024 20:41:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2FBAE120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716399706;
	bh=ORccFiShbmiAytq5SHZC9Z2mGFe7Gewrl8C0g5tV60s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=NBKw/BeORAvdvC8MqaROXAc1l0DIcDjtIVTtItU5G1ZbPpME7C/gZReDQ3QE+Kr3/
	 e22NzJmm1DYClHQ/vpQ/VzP3eFpf/sljJpjf9SNiqW4n/tdBRxvoI2/UoR5V9rXPQw
	 os+0XDe9M2L9Qyh0kxAYS1WICIbiuTjDSzww+FC2oopTeNtt5owTPgSJ0cjwyDvIMm
	 7rpSOvEgbLaLDhjka7BoQB/I3tsj40PfXzaovQxP15PPFadoUfkRtltIXelfyJjJVw
	 wFZ7xJ0N7vIhKf5KzdU2Tcww46u8RkFviq8Ik/t37q/ZbUq2e44jVd0T56tJ9eE5FM
	 CbI9Ylythhw0w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 May 2024 20:41:45 +0300 (MSK)
Received: from [172.28.128.189] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 May 2024 20:41:45 +0300
Message-ID: <edc6241b-195f-4188-b802-24706ebc9541@salutedevices.com>
Date: Wed, 22 May 2024 20:40:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Introduce initial support of Amlogic AC200 board
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
 <171638551693.3169786.7201121718393921307.robh@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <171638551693.3169786.7201121718393921307.robh@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185427 [May 22 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;devicetree.org:7.1.1;salutedevices.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/22 13:13:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/22 16:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/22 16:29:00 #25238160
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_104153_221252_037CC554 
X-CRM114-Status: GOOD (  19.40  )
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

On 5/22/24 16:46, Rob Herring (Arm) wrote:
> 
> On Wed, 22 May 2024 01:21:52 +0300, Jan Dakinevich wrote:
>>  - Make some cosmetics in existing device tree files;
>>
>>  - Add the board.
>>
>> Jan Dakinevich (3):
>>   arch/arm64: dts: ac2xx: make common the sound card
>>   dt-bindings: arm: amlogic: document AC200 support
>>   arch/arm64: dts: ac200: introduce initial support of the board
>>
>>  .../devicetree/bindings/arm/amlogic.yaml      |  1 +
>>  .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 87 -------------------
>>  .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 87 -------------------
>>  .../boot/dts/amlogic/meson-sm1-ac200.dts      | 22 +++++
>>  .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 87 +++++++++++++++++++
>>  .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 87 -------------------
>>  .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 87 -------------------
>>  .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 87 -------------------
>>  8 files changed, 110 insertions(+), 435 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
>>
>> --
>> 2.34.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y amlogic/meson-sm1-a95xf3-air-gbit.dtb amlogic/meson-sm1-a95xf3-air.dtb amlogic/meson-sm1-ac200.dtb amlogic/meson-sm1-h96-max.dtb amlogic/meson-sm1-x96-air-gbit.dtb amlogic/meson-sm1-x96-air.dtb' for 20240521222155.28094-1-jan.dakinevich@salutedevices.com:
> 
> arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dtb: sound: 'anyOf' conditional failed, one must be fixed:
> 	'clocks' is a required property
> 	'#clock-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> 
> 
> 
> 

These errors were here before my modifications, and they require extra
efforts to rework generic 'meson-sm1.dtsi' etc. But it is not the goal
of this series. Should I do anything about this right now?

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
