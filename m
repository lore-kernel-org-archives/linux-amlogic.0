Return-Path: <SRS0=A0m+=5V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE075C2BA1B
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Apr 2020 19:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F692206F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Apr 2020 19:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I5o9EKQH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="cltb8BbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F692206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwXlg11DbM3ecnumDm89zpU8IEjy+AD+e7umEPSSY4k=; b=I5o9EKQH4IWoIa
	/+7tYnHxazQSUwZCoxBpEd1hXuvgeQUaVEMlSqimj93yXM++fNKC+T2/Hs2qdCdjQ+FG//OsOH27/
	uY5bidwpXGsH1euOscayywNr8Mitz5LXBJjUqLnu+TpScIfBzQy8Iyyo9byp3GiK3Jo+XPFH7sfvA
	vE40vzHSwoavB6KOug65rU4/pjdjg55A7Ksb0YLTgo3YPd3lMi+aiElWem1uanWywgyYbRtkiGimx
	XagStwseGCozwHatzcc60SqYyStQ7FcDqZTbQCt27sQ8wOMIYirTDWCS1JqpGxlGo4XI3bqz83htV
	U+dYEw3/VuqXy5uGcpyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLArL-0000iU-Lc; Sun, 05 Apr 2020 19:23:07 +0000
Received: from mail-eopbgr00133.outbound.protection.outlook.com
 ([40.107.0.133] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLArI-0000fY-Hd; Sun, 05 Apr 2020 19:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlN3sHJwq6Qe2EJB9ylKGdMFI0/tX3PmnrlJRJ8BlpcZ6j5FvrH0M7d0v57C3YVF5UBaG7lpVOTvOJdlpvqZ65/wj1e6iYNFaBuLfhrS5jRYc4ovCpDLlHDYbu6VlDAIRTO0bZYhdkFyrLfSuZ8dqDpTT0mxim4OGjX76wYELFelmADrqrQswdLJevkjA3iIl1LR6mCbyjFWOKmJu0nxu8VqS/NjWyPjesQAoM8vlGuHwU5+GE2vCMsPxlqvB1AknmyzHpZnMQV9TpVgMRRWMbnFmAywEZrrpUBbL/LzE8MJRGSmvBLI469D5heH5vZrYUnGq1KEiJXqXefcCJ4DQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18OcAKEDa7ojfxMhPBEjG7Pe7X9KMR5ikVnvXf50RDY=;
 b=N203R3WvoHU8BIrmwAG29Rm6+MDbg8ylnG+1ABA3+gyDr+0yCkuMr3d4FXZHaEGAPRV6EhnAccYqgyw+SpXjenU/oY/zTe5E0n4Wu0jESPGymB1NAH3fwjiHk3jFivCg7sNS65vQYV7S/ddKkgjNUhvaKc2VeMQZUinuyRgVpg1/6v292gKDSd8fNbBsh64hkrjCifSJrg2+JcRwzYIUvNmGCr4lRV/n5TG8zLH7JGp9PY3CfC3alE+kIlRJN4tahpLwuG00VY1qx/TRjw3pSz294mqo250ck5BTA5y37BqbfhsrvCL3cXLwpWPoQ5zgVvD7i2Lm9Rb0xC12/qQLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18OcAKEDa7ojfxMhPBEjG7Pe7X9KMR5ikVnvXf50RDY=;
 b=cltb8BbV28QSNU+ip/QY8M/Uz5/6/QRQhwkxCur8oXjvx+0ctct4sEGoC3EPe+xA/kWIz5pvREexJdTKkeM9ywqB5jRGVLwqj5i7jFavlh/0tLEK7u5ZysJOXagh22KvBmDJeA4wZWHnuisF0+Cmv5sWIWTKNKZotXH0M8cU9co=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (2603:10a6:802:1c::24)
 by VI1PR05MB5373.eurprd05.prod.outlook.com (2603:10a6:803:b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Sun, 5 Apr
 2020 19:22:52 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2878.018; Sun, 5 Apr 2020
 19:22:51 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: devicetree@vger.kernel.org
Subject: [RFC PATCH v2 0/6] Add PWM_NOFLAGS property flag
Date: Sun,  5 Apr 2020 22:22:40 +0300
Message-Id: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: GV0P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::28) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (82.193.109.226) by
 GV0P278CA0018.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Sun, 5 Apr 2020 19:22:51 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.193.109.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80898717-2240-49df-511c-08d7d996bbaf
X-MS-TrafficTypeDiagnostic: VI1PR05MB5373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB5373EBF367F3816B0A0B7115F9C50@VI1PR05MB5373.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03648EFF89
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB3279.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(54906003)(6486002)(55236004)(81156014)(2906002)(8676002)(508600001)(86362001)(52116002)(6496006)(26005)(81166006)(316002)(8936002)(36756003)(6666004)(956004)(66946007)(2616005)(7406005)(7366002)(7416002)(1076003)(186003)(16526019)(66556008)(66476007)(44832011)(6916009)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhtQDLCwJRCaOiEvFpZvTB/BwVKulkfsJKt2ovRmPN/g7U0OBW6eOGlcxV25kXlNLEfhTO55QqbhzqQBHelXeHWNy2m0zsQet7uFvTD4YtzAxAxSJfUe20dEeFQXh0KtRMIxoI1tFwNwSQZ5d8OyShbteVMIPeaQI9JIi3+VggnCRIcUpCWxLuUDaIHKUFU2zPxeZsy/En8cA0u017TwkY8/O0PVQH1eQojUT1t83n0c37JRmBltngm9M5+RsPvSQTR3u8IEdRVXu46cXBkzN1SZ9scGdF0tgXqqOL0AA5VYpVo+Cl7yCnMM4+GEJFXfWz5ErdXl3YdB76aZPkGSnMeam9UjDfLrWhJn1e3ufHVH1HVDNh23yMrV+Ye0o8v3Z4gNLZjsf5zFotqF+s4FMd333rJBy0nTQJJxSEIGasGvs7LDMgT/gPJyPD0GpZdb
X-MS-Exchange-AntiSpam-MessageData: MzUrI4Wd26RPuJbnJWsu7LYHUN+xtJ5G7U4E1p5eUqYt16Ez0h/OOvLPgQUrbJxp1wgzHWcWasBEqfPr6uWaFPIGLQvgEK6jeNNzmuxamW5FvEtrIHLWBQiXEgzbpFiPSs3bCZSumtRtyDXz7XLEmQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80898717-2240-49df-511c-08d7d996bbaf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2020 19:22:51.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFsPxf7Zp8Rnb2am3DSo0yyas9Dme9dyxX6gaV0ZTRfqdjjltDGvfr/Jl9+MXiFJoAjuRwYb2uR3q3ih8/pqnIrl3xa0GdfKFSM0a+q6uW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_122304_758101_5B9A5E08 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexis Ballier <aballier@gentoo.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sekhar Nori <nsekhar@ti.com>,
 Kever Yang <kever.yang@rock-chips.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, Soeren Moch <smoch@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org,
 Tobias Schramm <t.schramm@manjaro.org>, linux-rockchip@lists.infradead.org,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Hugh Cole-Baker <sigmaris@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-pwm@vger.kernel.org,
 David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nick Xie <nick@khadas.com>, Maxime Ripard <mripard@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Barker <pbarker@konsulko.com>, Rob Herring <robh+dt@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Akash Gajjar <akash@openedev.com>,
 linux-amlogic@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-omap@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Vicente Bergas <vicencb@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Matwey V. Kornilov" <matwey@sai.msu.ru>, linux-renesas-soc@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Peter Rosin <peda@axentia.se>,
 Vivek Unune <npcomplete13@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


This patchset introduces the PWM_NOFLAGS flag instead of '0' raw value
in the optional cell "flags" of "pwms" property, if it is required to be
used but don't need to set any flag.

Also, replace '1' raw value of "flags" cell with the existing macro
PWM_POLARITY_INVERTED where it has not been done before.

Changes in v2:
- remove the driver part of patchset as dangerous and senseless.
- Use PWM_NOFLAGS instead of PWM_POLARITY_NORMAL to avoid possible
  conflict with enum pwm_polarity in <linux/pwm.h>. Also, this name
  reflects the sense of this value more precisely.
- add the example of PWM_NOFLAGS usage;

Oleksandr Suvorov (6):
  dt-bindings: pwm: add PWM_NOFLAGS definition
  dt-bindings: pwm: document the PWM no-flag
  arm64: dts: pwm: replace flag 1 with PWM_POLARITY_INVERTED
  arm64: dts: pwm: replace flag 0 with PWM_NOFLAGS
  arm: dts: pwm: replace flag 1 with PWM_POLARITY_INVERTED
  arm: dts: pwm: replace flag 0 with PWM_NOFLAGS

 Documentation/devicetree/bindings/pwm/pwm.txt         | 11 ++++++++++-
 arch/arm/boot/dts/am335x-cm-t335.dts                  |  2 +-
 arch/arm/boot/dts/am335x-evm.dts                      |  2 +-
 arch/arm/boot/dts/am3517-evm.dts                      |  2 +-
 arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi         |  2 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi            |  6 +++---
 arch/arm/boot/dts/at91-kizbox3_common.dtsi            |  8 ++++----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi         |  6 +++---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts           |  2 +-
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts           |  2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts                   |  2 +-
 arch/arm/boot/dts/at91sam9x5dm.dtsi                   |  2 +-
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts     |  4 ++--
 arch/arm/boot/dts/da850-evm.dts                       |  2 +-
 arch/arm/boot/dts/da850-lego-ev3.dts                  |  4 ++--
 arch/arm/boot/dts/exynos4412-midas.dtsi               |  2 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts             |  2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi         |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts             |  2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts            |  2 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts            |  2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi    |  2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts            |  2 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi       |  4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts             |  2 +-
 arch/arm/boot/dts/imx53-tx53-x13x.dts                 |  5 +++--
 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts             |  2 +-
 arch/arm/boot/dts/imx6q-display5.dtsi                 |  2 +-
 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts          |  2 +-
 arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts          |  2 +-
 arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi               |  4 ++--
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi        |  4 +++-
 arch/arm/boot/dts/imx7-colibri.dtsi                   |  4 +++-
 arch/arm/boot/dts/imx7d-nitrogen7.dts                 |  3 ++-
 arch/arm/boot/dts/imx7d-pico.dtsi                     |  3 ++-
 arch/arm/boot/dts/imx7d-sdb.dts                       |  3 ++-
 arch/arm/boot/dts/imx7ulp-evk.dts                     |  3 ++-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi               |  2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi      |  2 +-
 arch/arm/boot/dts/meson8b-ec100.dts                   |  4 ++--
 arch/arm/boot/dts/meson8b-mxq.dts                     |  4 ++--
 arch/arm/boot/dts/meson8b-odroidc1.dts                |  4 ++--
 arch/arm/boot/dts/motorola-mapphone-common.dtsi       |  3 ++-
 arch/arm/boot/dts/omap3-gta04.dtsi                    |  2 +-
 arch/arm/boot/dts/omap3-n900.dts                      |  2 +-
 arch/arm/boot/dts/rk3229-evb.dts                      |  4 ++--
 arch/arm/boot/dts/rk3229-xms6.dts                     |  4 ++--
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi              |  2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi                  |  2 +-
 arch/arm/boot/dts/rv1108-evb.dts                      |  2 +-
 arch/arm/boot/dts/s3c6410-mini6410.dts                |  2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi                  |  2 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts                |  2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts                   |  2 +-
 arch/arm/boot/dts/vf-colibri.dtsi                     |  4 +++-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 +-
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts        |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi            |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts     |  5 +++--
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    |  5 +++--
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi      |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts  |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts  |  7 ++++---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi   |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi             |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts  |  3 ++-
 .../arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi      |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi  |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi     |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts  |  3 ++-
 .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts    |  3 ++-
 .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   |  2 +-
 .../boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts  |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts |  5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts    |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi    |  4 +++-
 .../arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts      |  7 ++++---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi |  3 ++-
 arch/arm64/boot/dts/rockchip/px30-evb.dts             |  2 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi                |  1 +
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts           |  2 +-
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts        |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3308.dtsi              |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts           |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts       |  4 ++--
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi  |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi          |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi  |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi       |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi    |  4 ++--
 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi              |  1 +
 include/dt-bindings/pwm/pwm.h                         |  1 +
 107 files changed, 183 insertions(+), 135 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
