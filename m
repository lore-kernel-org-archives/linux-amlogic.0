Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC0C25B10
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TxmCGw6hXYU8nZntMWCjdngWl4xx9GoF51Uul3w5Gds=; b=kdgj2J7iT1fTF5
	z7gEm/Nh/ryaw+uCyw2kOp4L9f9pWlJQJKdNDY85SeIOnY9H64c9oDt8LmpCQny0mUlRU09pXGyVM
	YhNMi2+zShvYuM0TUo5bIn3lXIRkxBBbqoQdmdjRjWqL0KKXkq/Yr/iZlVwR90KbWIzB1SpDz5OkU
	ZmBrbIg3HQYyx50mgNaR0dQvI3ZU5ti6bGkzOCsbmpVLKGiBFUisrRLmG1Neq0geH6f+Q8v6tE+J6
	jIFfXq+LDEP9sr9ZNM03ZEHyn62RCDsB7T4RCTKVaQS+04VUoMX9di9LXMNVFSmjV2w69rXk37k4u
	vESVq9Cn5LorvsewPvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MK9-00000004e6x-48re;
	Fri, 10 May 2024 09:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJO-00000004dV9-2u4g;
	Fri, 10 May 2024 09:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bQgoaZsfgswFdd7mMDy6KL8G+EznVwjqFXmnJMgJs34=; b=bqpPWdR9EF9pgajXk1mAzYhhhs
	N3/ev+eWRduQ3CAJDk661qQlTiMg7RqBRPQr8Pna99ftsWlzJamyeJ+YnWvM21XWCmljMysxhIXsy
	09bYyCPufHXpNy95pRBXgOvi+GXWqvQkGXmrx8jZFtltvVJQ7H7fpGE4gCaujZzDIIr61h3zgaFxz
	cUAm2phPUw2AniqLPaoMoCAiQ7iPJ7T3dBZiLYEyL0+yoQfqmXLUSStXtJfCmq0T21IfUboq26PE5
	9lf2sblTjebN/56wIGdgT3gtlnAlvgJdUAvuaVdtYVBwwYL9akJqYVkM1hHXn995DbfrugSCwPCe4
	CVevPM1g==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJK-00000003KQk-0mGw;
	Fri, 10 May 2024 09:13:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8CCEF100006;
	Fri, 10 May 2024 12:12:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8CCEF100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332378;
	bh=bQgoaZsfgswFdd7mMDy6KL8G+EznVwjqFXmnJMgJs34=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SB7tzLbjeRYjJr5ZPWIDixYFHw1uxlnctqwlLu7W8pdJ8OFyzjyH/JW2skgB5NZgN
	 Zn+2G851sjzl2LkP1eTc+JRgC2Ibo5WjPwzPUzK0pc9yqkNfsk8nZ1xe5jUYYuoBYM
	 KzYDvhqZGPAvUMc3PtXsUtjo7iK7WFkke9T0oBb1Xl8m65nS5ijb+gyrcniQUIiR+9
	 LcQ/D7z+wBP3O9R5OHLv3sZZehB3AAdbga4b07xum7gSs/fKtreBja1pKkS4U++WXi
	 v13x7Gd2MYtOC1YIVXFd+ghnP53iZCn/lyoEvz4zlnFuR+MTn2zI4IIpCBJWqCDMlF
	 FIMKN5Hb/QvOw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:12:58 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:12:57 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v2 0/4] arm64: dts: amlogic: a1: Support CPU Power Management
Date: Fri, 10 May 2024 12:12:22 +0300
Message-ID: <20240510091251.20086-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/10 08:35:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/10 08:36:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_101302_542498_E269F7D9 
X-CRM114-Status: GOOD (  12.05  )
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

The Amlogic A1 SoC family utilizes static operating points and a
PWM-controlled core voltage regulator that is specific to the board. As
the main CPU clock input, the SoC uses CLKID_CPU_CLK from the CPU clock
controller, which can be inherited from the system PLL (syspll) or a
fixed CPU clock.

Currently, the stable operating points at all frequencies are set to
800mV. This value is obtained from the vendor setup of several A1
boards.

The current patch series includes:
    * CPU clock controller declaration
    * syspll setup in the PLL controller
    * operating points
    * CPU special power parameters: voltage-tolerance, clock-latency,
      capacity-dmips-mhz, dynamic-power-coefficient

Please be informed that the AD402 vddcpu PWM regulator does not exist in
this patch series because currently PWM A1 support is under development.
However, it should look like:

```
vddcpu: regulator-vddcpu {
	compatible = "pwm-regulator";
	pinctrl-0 = <&pwm_f_pins4>;
	pinctrl-names = "default";
	regulator-name = "VDDCPU";
	regulator-min-microvolt = <690000>;
	regulator-max-microvolt = <1050000>;
	pwm-supply = <&dc_12v_in>;
	pwms = <&pwm_ef 1 1500 0>; // 667kHz
	voltage-table = <1050000 0>,
			<1040000 3>,
			<1030000 6>,
			<1020000 8>,
			<1010000 11>,
			<1000000 14>,
			<990000 17>,
			<980000 20>,
			<970000 23>,
			<960000 26>,
			<950000 29>,
			<940000 31>,
			<930000 34>,
			<920000 37>,
			<910000 40>,
			<900000 43>,
			<890000 45>,
			<880000 48>,
			<870000 51>,
			<860000 54>,
			<850000 56>,
			<840000 59>,
			<830000 62>,
			<820000 65>,
			<810000 68>,
			<800000 70>,
			<790000 73>,
			<780000 76>,
			<770000 79>,
			<760000 81>,
			<750000 84>,
			<740000 87>,
			<730000 89>,
			<720000 92>,
			<710000 95>,
			<700000 98>,
			<690000 100>;
	regulator-boot-on;
	regulator-always-on;
};
```

This patch series depends on [1].

Changes v2 since v1 at [2]:
    - remove holes from the beginning of cpu clock controller regmap
    - move sys_pll_div16 to the end of the clocks list

Links:
    [1] https://lore.kernel.org/all/20240510090933.19464-1-ddrokosov@salutedevices.com/
    [2] https://lore.kernel.org/all/20240329210453.27530-1-ddrokosov@salutedevices.com/

Dmitry Rokosov (4):
  arm64: dts: amlogic: a1: add new syspll_in input for clkc_pll
    controller
  arm64: dts: amlogic: a1: declare cpu clock controller
  arm64: dts: amlogic: a1: add new input clock 'sys_pll_div16' to
    clkc_periphs
  arm64: dts: amlogic: a1: setup CPU power management

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 70 +++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
