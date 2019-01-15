Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56B1C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 08:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9077620656
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 08:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYzEfEF0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=CAVIUMNETWORKS.onmicrosoft.com header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="Hl3rwBVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9077620656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cavium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uH4rxoZWzSrq+Ue847vWJDrBxSgaop3WGihL8/jieM=; b=GYzEfEF0dBLjSS
	89hCCv3gwVZm/G4MMX0xIiS1kAR3PuTUmSr/Ai3x8TKXZyyTqrr4NBC1D/Ej3sgoqEn+XGORVVET5
	Tl/paEF4AbunjX3NIzZq8uG+Dlj6VsX52MW/QthibxtmeN5L6Oq8271Z9CIIlEj5rwpE/TUgOLPPb
	iG8EElo6y1c+UfS9HP+GxUFdm501FLuxnB0QRTWP7nCYq1zwojFw3VXlhtK+H3PF13rAEi2dk6OfZ
	sMctOwE863Vs1lWASMvpZ+jM04Fe5o83yJ7cpJnxpQS8tKvhEfNAC6GqnVwKHPmxg7Fe7S7jwLOey
	x6QUhWeD4BgVVdvNsgUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKMG-0005oD-3S; Tue, 15 Jan 2019 08:46:04 +0000
Received: from mail-eopbgr810089.outbound.protection.outlook.com
 ([40.107.81.89] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKMC-0005nf-3W; Tue, 15 Jan 2019 08:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9l/ijDmmjA4tDb/3SRdAQXLXpbBhEa1ZJyK59KD62c=;
 b=Hl3rwBVoEWdWXSbDO2Hw9MpQ8EKW0CepGyR9y91aPCPC1t3vxOgy19PnlQjvb04RmtEVIntDBvUKbwYpaYKA/vzKP6zpu5vfCAF7aKLqhy/VHWC38claY2EiMySqon6IcsgvQ6ERLRC0BWfN9qDjS4KbJT7hyDI++w6mXbGRgqQ=
Received: from SN6PR07MB5326.namprd07.prod.outlook.com (52.135.105.33) by
 SN6PR07MB4207.namprd07.prod.outlook.com (52.135.96.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.15; Tue, 15 Jan 2019 08:45:53 +0000
Received: from SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7]) by SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7%3]) with mapi id 15.20.1516.019; Tue, 15 Jan 2019
 08:45:53 +0000
From: "Richter, Robert" <Robert.Richter@cavium.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Topic: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Index: AQHUqFoPLrHRVLG6+UOUMPoBHyYQvKWolZkAgAGEzACABfJHAA==
Date: Tue, 15 Jan 2019 08:45:53 +0000
Message-ID: <20190115084537.3hedrtkowg3elzca@rric.localdomain>
References: <20190109202934.29304-1-robh@kernel.org>
 <20190110144537.p5setcurwu6bwrtl@rric.localdomain>
 <CAL_JsqKMYY5RsCjzp4eMnW0YrohcqwmhVj0hfUEVrbGJEFx05w@mail.gmail.com>
In-Reply-To: <CAL_JsqKMYY5RsCjzp4eMnW0YrohcqwmhVj0hfUEVrbGJEFx05w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:203:69::14) To SN6PR07MB5326.namprd07.prod.outlook.com
 (2603:10b6:805:73::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Robert.Richter@cavium.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [78.55.2.26]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR07MB4207;
 6:tudETKWVAjtUGUZx7D11UIEMok3nCoV8TUyizke9NSOnbVX/jbsnJS3V2rNPumqCk08cVznnG8M1UO6R5Mog/Lfu8YWjOKkEi2NA9EWPogO0sxrf1e9ztTzfYHyt9Nwcg4jIL74UX1E3yz3qtgGJHFj/dpO7zy4FQNbxIu32zz1Kscvtrh4UYaH2D9/fhJ+i7qfUnMKskvZM7usVKaxetdqJkEzDFyrqAlMrDkPS4ZTgBlTsUGCpGYwsxobbdnu2cI0hBc4a28sf0qvToBKlTRZmSmSAlGAIJ1h6lgTNXO5YbJpiT7/bgh+aoK9l1hie7vuAQes9t51DTTJAKwM6JEH9Z5vDxYlEKeUPNHgHEGdtZ1iJwBCdOS6Fe2NQ9wZ2ctx0tcsrsUhm+Jg5rp+wG3/7e2HCtJG7h2XEnyKQm4+2xBTJCuGF84AYWYlzFkGXo7BR8KVMsvgA+i467iGvgA==;
 5:D5yfTyzw7YGBf+96tdLsyYLcNAGDf/aOVt8FbZ7c/GssOlU2tK7Y8ygi/a/glqhScugGK3gHMRU9Y03wXinG8ARRS/rZ8O+d59YFfy71fzYNkSHIDbgPmx5fDUudYxYQO7A5pTZww6AGO5pX9xOHBGGGbs13MgT4OG/G8mefCS46XXn9wEsugr3P28Peb63XqCTgGmK5LNCGriSsipFgGw==;
 7:2JffAZElKPE/UcYj4W0ikb8aAwosfvjHL/OwRqAroFXTSjvinGjhYioXmNv3seSF1UdsGRNe/XiScG9iTTdqRJUBh+VTT3wFdhk6SpJmtUkt6zudiQKudwRbnDRCgAVe90JEnbNy1nz2A6Sl+aX6Og==
x-ms-office365-filtering-correlation-id: 005cb03a-15ae-4499-8579-08d67ac5dad6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR07MB4207; 
x-ms-traffictypediagnostic: SN6PR07MB4207:
x-microsoft-antispam-prvs: <SN6PR07MB4207F541D680378D6FF1A6A5F1810@SN6PR07MB4207.namprd07.prod.outlook.com>
x-forefront-prvs: 0918748D70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(376002)(39860400002)(396003)(189003)(199004)(256004)(71200400001)(97736004)(66066001)(476003)(11346002)(6116002)(446003)(106356001)(26005)(105586002)(76176011)(2906002)(7416002)(52116002)(7406005)(102836004)(5660300001)(6916009)(3846002)(53546011)(6506007)(71190400001)(186003)(33896004)(1076003)(7366002)(6486002)(72206003)(6436002)(111086002)(99286004)(305945005)(229853002)(54906003)(9686003)(8936002)(68736007)(4326008)(39060400002)(7736002)(6246003)(8676002)(81166006)(25786009)(478600001)(53936002)(6512007)(81156014)(86362001)(386003)(316002)(486006)(14454004)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4207;
 H:SN6PR07MB5326.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JNxUEBlR1O7fX2RR1+aqkdSwFEEfwB2HcpKUpCH1HAv8qWhGFB3s4LSQhbLyvMI2TVd0jNKblzFfu/Ytp7KqA0JJlXkAtq4VZQG5R29Os1FqoINbXeIuIjkI5NGNyezOVZOz/DyEt/k/XtGg0G7Gvt7Ueq025ZzF38b6U3TuC8ABQtUfsbbiYqPNSZ2h7S7AybHi8WRkU2KM6yxQSr4H/bDMTkUX0Npdt/bkdeiSV6t0K6hBZ9gh+C434dxqBy4JNt4V6M+z0j9KJwGTtd/HWVUXQiCi7BCSe3V5WtnKp1VhTZCP5KBIJxn2hp2rjAltqeeGy3NH+KTGuhv5lUxViB/8XgyXlzmIzvmmzlYr89ACo4csbUmbZztT2WrOwWX26bQgz2bl1wSUpRPnqW8+qgZrbvLIHZgcFd9J3X4qu9E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <A7717CEB01A5B3418666A183E6A72D3A@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005cb03a-15ae-4499-8579-08d67ac5dad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2019 08:45:42.8569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_004600_197012_478F573C 
X-CRM114-Status: GOOD (  23.57  )
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
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "Nair,
 Jayachandran" <Jayachandran.Nair@cavium.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, "arm@kernel.org" <arm@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Baolin Wang <baolin.wang@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Simon Horman <horms@verge.net.au>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Kukjin Kim <kgene@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11.01.19 07:57:12, Rob Herring wrote:
> On Thu, Jan 10, 2019 at 8:18 PM Richter, Robert
> <Robert.Richter@cavium.com> wrote:
> >
> > Rob,
> >
> > On 09.01.19 14:29:34, Rob Herring wrote:
> > > The 'arm,armv8' compatible string is only for software models. It adds
> > > little value otherwise and is inconsistently used as a fallback on some
> > > platforms. Remove it from those platforms.
> > >
> > > This fixes warnings generated by the DT schema.
> > >
> > > Reported-by: Michal Simek <michal.simek@xilinx.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Will Deacon <will.deacon@arm.com>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > armsoc folks, Please apply directly.
> >
> > > diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > > index ff5c4c47b22b..c616132f7d6d 100644
> > > --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > > +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> > > @@ -27,28 +27,28 @@
> > >
> > >                 cpu@0 {
> > >                         device_type = "cpu";
> > > -                       compatible = "cavium,thunder2", "brcm,vulcan", "arm,armv8";
> > > +                       compatible = "cavium,thunder2";
> >
> > We are just checking if removing the "brcm,vulcan" string has any
> > impact on early silicon revisions we want to support (see also
> > BRCM_CPU_PART_VULCAN).
> >
> > Maybe you make this a separate change?
> 
> Dropping brcm,vulcan was unintentional (regex fail). Though keeping it
> means we need a schema change as it was not documented to be a
> fallback.

We have checked this and brcm,vulcan can be dropped too. Sending an
ack in a separate mail.

Thanks,

-Robert

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
