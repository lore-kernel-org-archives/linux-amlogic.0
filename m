Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1D6C25B79
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WtXZJ0+wXH5n7Qh3TIoKl/wSdn0X71X1YB8FinEjxM4=; b=C06QxsET+brQ11
	eBDH4PnDYFpIw5gLIgE91VsNVEofCzEg4Ucb34ygZX3tZQ+YqWcEASXi8g5veZpJr7GJjGeYNQdo/
	I9igJ2DhWlwfM6oTbDpSqH0GzaRI1HfiA0231fCJnh6Hj8rH+DpX7TtcO6y8AR/dXLJhoWTh0oaze
	ILg1JrfTrEEI/D1yDZqNNZDkWDVlasrb5rPlVTp02O0s6UBOQsNb9t03h8tzCmzElrPb1CYYMHUo+
	jXVfOcGRDonPVMYspHNvceriJxek51MKGQzAQPCH1u/e80RldTjJhBnYNE5p31YG3qAjIKz5vobF9
	n7muEdPcun9G1xP89uBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K4w-00000002fNN-1otT;
	Wed, 15 May 2024 19:14:18 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K4t-00000002fLO-09Cc;
	Wed, 15 May 2024 19:14:16 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3791610002D;
	Wed, 15 May 2024 22:14:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3791610002D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715800452;
	bh=yh36czi3oiCiH74hnOG7P+ArHnzezMkpMG45lt+1orI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ogkPrCcrKyO61s28WFqtpPmAzLZ+8RRCcNyLeipRWtiAB9OgSZHEjhx+nxfVZP2Yo
	 2Jc3u0nVSA06D379coLls8r/YC4trQbkLdIk3gnkZtyG/W33mD6bKJ+Jf5OIvfqWgB
	 /pW9qJDa0iIcD3W77VwcICQI86RnnxsByZtS4YC9kC/blMxg9GV4hw3jbDvYhNHxOh
	 bRjuAtV5Z9TB8EIaClVXUfaiX4AKjJ8LidnYjwRTDkoJQX83pQXezWIj1G9Z0uhQsR
	 +YrY/Sqlfx0K3GrU5WA0gaJ1eE0yUHuA4KrrMRZPML590LSNOggar3L/qSjUfh8zrp
	 hgJ5+yhJIf8zg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 22:14:12 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 22:14:11 +0300
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
Subject: [PATCH v3 0/4] arm64: dts: amlogic: a1: Support CPU Power Management
Date: Wed, 15 May 2024 22:13:49 +0300
Message-ID: <20240515191405.25395-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185260 [May 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/15 12:35:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/15 18:39:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_121415_446849_B42B49AC 
X-CRM114-Status: GOOD (  12.76  )
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

Changes v3 since v2 at [3]:
    - move sys_pll_div16 clock from a1-pll clkc to a1-peripherals clkc
      as Jerome suggested, so dt connection is changed too

Changes v2 since v1 at [2]:
    - remove holes from the beginning of cpu clock controller regmap
    - move sys_pll_div16 to the end of the clocks list

Links:
    [1] https://lore.kernel.org/all/20240515185103.20256-1-ddrokosov@salutedevices.com/
    [2] https://lore.kernel.org/all/20240329210453.27530-1-ddrokosov@salutedevices.com/
    [3] https://lore.kernel.org/all/20240510091251.20086-1-ddrokosov@salutedevices.com/

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Dmitry Rokosov (4):
  arm64: dts: amlogic: a1: add new syspll_in input for clkc_pll
    controller
  arm64: dts: amlogic: a1: declare cpu clock controller
  arm64: dts: amlogic: a1: add new input clock 'sys_pll' to clkc_periphs
  arm64: dts: amlogic: a1: setup CPU power management

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 70 +++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
