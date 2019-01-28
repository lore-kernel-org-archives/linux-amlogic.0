Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1336C282CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 02:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11B720881
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 02:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qfrW7RTf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="FJnl228+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11B720881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgMTd5VPoorc7kSABBmIUMtnKwRrO+GFt7JS2dxFxTo=; b=qfrW7RTfnXT4OH
	bDdb5I289By5V2SWvoPR6mOLzc5/ajA6krZ8LR9NDWopDo1S0ZNbIZUonhtKuZVeOQW5tzAXpbcUG
	QGF+VZc1IuS1AqFqGM3kaXjf7AnvUkKkmEWd7nvt0VvbD7uUGTQEuHbwhN9Rvcgdezw1PgYAtr4+m
	4PA38Ulnv2qkP3HioIW1A2AvVa4G6y03L4A9UfUluai4GhJPLiiBTNq07XWxT24IMqaO7r+dZUj4I
	oSvnAaZYQKt9dv+Ys3BFdOBa787XtoyzFjM0g+ixtcgnfXB9WsmYr4PddP4K0zJRNPKJJSDxonWb8
	3LAT+4TfOwl6d2ylDogA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnwrQ-0006n1-N8; Mon, 28 Jan 2019 02:41:20 +0000
Received: from mail-eopbgr800081.outbound.protection.outlook.com
 ([40.107.80.81] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnwrN-0006mS-04; Mon, 28 Jan 2019 02:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector1-synaptics-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urVwT0/hws//l8OYAgzRy4wO/2fg0fzrwBbznoLPPeA=;
 b=FJnl228+aYEW/45K6k3l+k5HQfAbgzZ5QTOj50eUwx4NCrLHNn71iheIChSlIUevuYoYu+QzjXaAc/MaDha4vMECh/2KNRNEcO751kHCLUruLlRsmHOvXqLEgqqhnwwX7YQMqpiYMi340GHx5dSnCKwghIr8cd45BIcQEqPzDn0=
Received: from BYAPR03MB4773.namprd03.prod.outlook.com (20.179.92.152) by
 BYAPR03MB4471.namprd03.prod.outlook.com (20.178.49.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Mon, 28 Jan 2019 02:41:12 +0000
Received: from BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::e1b2:2ee5:3d08:634e]) by BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::e1b2:2ee5:3d08:634e%4]) with mapi id 15.20.1558.023; Mon, 28 Jan 2019
 02:41:12 +0000
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Topic: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Index: AQHUqFoOEouoq79y5EC8H02OXZaDA6XEE1iA
Date: Mon, 28 Jan 2019 02:41:11 +0000
Message-ID: <20190128103443.2b765f30@xhacker.debian>
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.33.119.15]
x-clientproxiedby: TY2PR0101CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::32) To BYAPR03MB4773.namprd03.prod.outlook.com
 (2603:10b6:a03:134::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR03MB4471;
 6:qwTa3VA2LsA+TrpbgRe/VTYhovDxndzb6GjJuAc7lgpqJdzsUnq4vB9N0xav7SOr3ZNG0K5nTtDAVm1rH66FW7ZSq2qwyTSwrGdExshnEyYhwH4Bu2hUT8B3CZXYjfq3nWB07c2VkP2mGB1IV1qu6+CM9dTHkpIyKeT8uYKt7hClE5UNexrKlY+wIedQcBPrhlcXEbXJtEjnHKqaIIAVQg9h9IZTAd0G2GnouUC9C0kXMueQtD7nSjiDw+RkJ/e7n6w06tQCgGP9zQ4P0Qmkp9EpOh5GnSpWoWk78UkOajldS1XqIFA9jhpxIsJSItZ6Cw9G+rkTQbGNvxZ6PN3BWHVeNt1ajZUyewiMsL4A9zS7TZ5/RAPEX5bcNgRvduIp7kYNGY9ZDFBZXGyaFu0gNPIwkhpHvQdBrZEZsSu8zQasVYS6HzDQfh49La0d7h5YVJcaMh2qmRsUn+0Ig3E2IQ==;
 5:2GVQ+YZYJi6voWZscMeIfcv3MmGnxMk1mFyHFzLxPid+OBymVeOATcyzckqGfBcTCGy2/rVI6LGIQixe2qX3f9I/RWJpDMgCU0Uus4ha2ESaGioS0VrnRIyWCAHrnERksSJA1en1AhNQzeMcrzwZftr2pMY+NmVvdtvjryfqwHQfbaGwwO4pv//xi4gDJ14mOCc8l7bb3eHYzKm1b0tlNg==;
 7:wCkWZaoBJi0OHstmiUIBMYhX6AKbUaIJ+XeVJ8gJkzZsobt1fN5q5bposL7cavMQssNnYK9MgrVK9pminY8RMjW1lwfLyu7E+FJlxgWbTGagztDMq0xSdv97qWX/X1GivfYAoj+IGyR3Onr/lbaHxw==
x-ms-office365-filtering-correlation-id: 36bde970-c1cf-44bb-1f83-08d684ca1073
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR03MB4471; 
x-ms-traffictypediagnostic: BYAPR03MB4471:
x-microsoft-antispam-prvs: <BYAPR03MB447101FA2D3B8FC37F60ECB2ED960@BYAPR03MB4471.namprd03.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(136003)(39850400004)(396003)(189003)(199004)(486006)(53936002)(39060400002)(4326008)(256004)(72206003)(14454004)(6246003)(97736004)(478600001)(86362001)(54906003)(33896004)(316002)(76176011)(99286004)(105586002)(111086002)(52116002)(2906002)(106356001)(6486002)(186003)(7736002)(6436002)(71200400001)(6116002)(25786009)(7366002)(8676002)(81156014)(476003)(11346002)(7416002)(66066001)(446003)(81166006)(6512007)(9686003)(6916009)(50226002)(8936002)(1076003)(71190400001)(7406005)(102836004)(305945005)(3846002)(26005)(386003)(6506007)(68736007)(229853002)(142933001)(39210200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB4471;
 H:BYAPR03MB4773.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1w921yMBUd2AvVKtFLR+6zG+5snclyiyTidN7Y7yb/K0Uov5y+M47rHOShYKSgViiX3pILHK3PV/Gz/F4PVgS6pIHWxjU+zfbK2qFeWKiyBcPLjt+YmSyJvKNlsPAynaPufrpE9HUMvy2I3hOGSy3v9sQ8sk2N4yg4eln7UfI8eDgq6U1+Ulw3bhnpftz/Ff3wJWnPzTbJqU5XWnz/rndeHfn9Y5+EA453x6gtws8kz8SNME4CYJ7hTfDggeXT7GXC/xa7RNL5AHQV9knZYmwPKLfx2DX8K+nQ5NGnAYvKJEJyBXO/7uABfYXYGtIx+OfSVLh2E1mgHaYCqGUmBwnAPbxgkXPecgtQOqd+ZqFgaUBcvqNbc8K9MjuNuzooXUqZj/sGyXXu58wuTlgpJwtvLD3Q+p26KATZYATXTdC74=
Content-ID: <351B42FC5B54A246AEE6DF57AF45078A@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bde970-c1cf-44bb-1f83-08d684ca1073
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 02:40:58.0017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_184117_069247_A70449A2 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "arm@kernel.org" <arm@kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Baolin Wang <baolin.wang@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 9 Jan 2019 14:29:34 -0600
Rob Herring <robh@kernel.org> wrote:

> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.
> 
> This fixes warnings generated by the DT schema.
> 
> Reported-by: Michal Simek <michal.simek@xilinx.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> armsoc folks, Please apply directly.
> 
> Note that there's still a case left in msm8998 that needs a new 
> compatible string.
> 
> Rob
> 
>  arch/arm64/boot/dts/actions/s700.dtsi         |   8 +-
>  arch/arm64/boot/dts/actions/s900.dtsi         |   8 +-
>  arch/arm64/boot/dts/al/alpine-v2.dtsi         |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   8 +-
>  .../boot/dts/altera/socfpga_stratix10.dtsi    |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +-
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   8 +-
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi    |  16 +--
>  arch/arm64/boot/dts/apm/apm-storm.dtsi        |  16 +--
>  arch/arm64/boot/dts/arm/juno-r1.dts           |  12 +-
>  arch/arm64/boot/dts/arm/juno-r2.dts           |  12 +-
>  arch/arm64/boot/dts/arm/juno.dts              |  12 +-
>  .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts |   4 +-
>  .../boot/dts/broadcom/northstar2/ns2.dtsi     |   8 +-
>  .../boot/dts/broadcom/stingray/stingray.dtsi  |  16 +--
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi  |  96 ++++++-------
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |   8 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  16 +--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi       |   8 +-
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  16 +--
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi      |  32 ++---
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  32 ++---
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      | 128 +++++++++---------
>  arch/arm64/boot/dts/lg/lg1312.dtsi            |   8 +-
>  arch/arm64/boot/dts/lg/lg1313.dtsi            |   8 +-
>  arch/arm64/boot/dts/marvell/armada-372x.dtsi  |   2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   2 +-
>  .../boot/dts/marvell/armada-ap806-dual.dtsi   |   4 +-
>  .../boot/dts/marvell/armada-ap806-quad.dtsi   |   8 +-
>  .../marvell/armada-ap810-ap0-octa-core.dtsi   |  16 +--
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi      |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  12 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  16 +--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   8 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         |   8 +-
>  arch/arm64/boot/dts/qcom/msm8992.dtsi         |   2 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi         |   2 +-
>  arch/arm64/boot/dts/realtek/rtd1295.dtsi      |   8 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |  12 +-
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  16 +--
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  12 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi     |   8 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   4 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +-
>  arch/arm64/boot/dts/rockchip/px30.dtsi        |   8 +-
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   8 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  16 +--
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  12 +-
>  .../boot/dts/socionext/uniphier-ld11.dtsi     |   4 +-
>  .../boot/dts/socionext/uniphier-ld20.dtsi     |   8 +-
>  .../boot/dts/socionext/uniphier-pxs3.dtsi     |   8 +-
>  arch/arm64/boot/dts/sprd/sc9836.dtsi          |   8 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi          |  16 +--
>  arch/arm64/boot/dts/synaptics/as370.dtsi      |   8 +-
>  arch/arm64/boot/dts/synaptics/berlin4ct.dtsi  |   8 +-

For Synaptics SoC,

Acked-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Sorry for being late,
Jisheng

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
