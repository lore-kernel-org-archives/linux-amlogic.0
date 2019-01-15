Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B8C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 08:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6E620656
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 08:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lGnb9Aee";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=CAVIUMNETWORKS.onmicrosoft.com header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="EOksdIfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6E620656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cavium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9k9uewHtxi0yyxBEUjswO8xnxLUnXZvKi29ZjJYebtA=; b=lGnb9Aee/KrkiU
	WWnmQZcjQMp1BngsQ2ay4VDOj93SU5+nCIVDuUS2nF5m6hXk+sAMemlnUzmBpjXFNCFnCyLd6p7tU
	/s1DdsDVElZpsnPlWA+3jT8o7QlcH9ut77ta58JR2NYR+GOlhDhSb9Xa1icKchgKJk+/w/s29qi6j
	TWNM9QgMrTyRBxJtDZrdli9k9nczBcDLWFVd9zzEjAUR5WC3z+GgpJEx8QnD8c352Viw9u5HTYDTw
	EfKEXJI+JFsLavNb4Jv8ZJ+80r+VPqNMczpFKxgwGXsOB7XFbmK+xyVYGsyUw75OeXYJG8H4hlctf
	J99b0TbqPtznziRdjwvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKSQ-0008Hg-7v; Tue, 15 Jan 2019 08:52:26 +0000
Received: from mail-eopbgr770072.outbound.protection.outlook.com
 ([40.107.77.72] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKSM-0008HB-Km; Tue, 15 Jan 2019 08:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE/jlRbjiFQupd2ihH5RFotk9ej21sxmIdOgDF4q/kk=;
 b=EOksdIfmh8vfmhxjrTIghEsS1sct7cQY+2iuyc+TaRuoJzu4VkwBUcD2QratsB/co92JdEf8V9cHUYvQM0wHWg/8b35l1kWYShOQYS/HkOYs92SIaMoBi607wL3qRsGh9y4NRZ6sSCjzKKwpoPLCUUOhftB7txYDS4qMByVVxys=
Received: from SN6PR07MB5326.namprd07.prod.outlook.com (52.135.105.33) by
 SN6PR07MB5791.namprd07.prod.outlook.com (20.177.249.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.19; Tue, 15 Jan 2019 08:52:14 +0000
Received: from SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7]) by SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7%3]) with mapi id 15.20.1516.019; Tue, 15 Jan 2019
 08:52:14 +0000
From: "Richter, Robert" <Robert.Richter@cavium.com>
To: Rob Herring <robh@kernel.org>, "Nair, Jayachandran"
 <Jayachandran.Nair@cavium.com>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Topic: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Index: AQHUqFoPLrHRVLG6+UOUMPoBHyYQvKWwDnSA
Date: Tue, 15 Jan 2019 08:52:14 +0000
Message-ID: <20190115085201.kkdz4azpw6qmegiz@rric.localdomain>
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0601CA0026.eurprd06.prod.outlook.com
 (2603:10a6:203:68::12) To SN6PR07MB5326.namprd07.prod.outlook.com
 (2603:10b6:805:73::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Robert.Richter@cavium.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [78.55.2.26]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR07MB5791;
 6:sr1tQPs9GOyT4l5DE8iEajFAZheRMXohOg++uINwZanI8FcJpo4gv5vMqWAroLb86e79XoHS1+10+fJJf3R/OMn6m38Sz26kQ4mNwecfZVY68jbghCjcCMRHuAf2lHNxp2rPaWIq2507P00vyMX26Cw7nlQH5HOuiYTsDo1UfjjWV2n866Y51cywaYmWP+GjmtDEipdEYisvlzbB8AVby4HrtArgCTcgDPwLqqe7UYGBFZZ+EOFSkpWOvaNirGw3f4+xfuYZhtqIcG7YtsDz/FFZL3q+rDa31I/c+ctwHZQTPSItiupKr2mu+GVueoV0yVtT63cgo88E5lr9/EHs5HmFlDf9ukqSgluyZaNHYaS/rl3uVRLXnsD+f3I4VYTHIkJMCeSQ0fhUtP7q37aMXIcsChb3qKCcj6Gbym2766hFxKSNd5/RQVuViOTa84cXGVNwzPk31fD3x7BWCbDWrA==;
 5:c6G13/IuwKQ74bmNa9WDUuJIT96QWcR67zBpv8FS5wkOZtZW+s6VYEt8G1sZQuucsZCODAst43Xz/kNSuEbf7ezAoPrlfddnFvx2oNOqbxsmbjz0itI3OWPDO1n1blbMHiPCXzhH9PqRQE5dX/7FPNY4K7/xCKFmpvx3JCbS7vYVGAOJBBEJh4sN1q19d3DTR+HYmnjeORE2p90ckBmZAg==;
 7:bUCo5PQCGphkI2KFM1WT0/3+WPHoMyrlMC3x7G75Ta/sMMZUGUxproW4OdbrCVM8oNbfGtRdUPv2Z8WMfoseu4jQpzEMh6IFfwQ6NQCWbIKuD34a4N6DEE0/9FzQfir3FXSZRDmACXQyY218wLK4DA==
x-ms-office365-filtering-correlation-id: 0924a94c-8f91-4743-d322-08d67ac6be80
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR07MB5791; 
x-ms-traffictypediagnostic: SN6PR07MB5791:
x-microsoft-antispam-prvs: <SN6PR07MB57917AB4A3A8178D068E82E9F1810@SN6PR07MB5791.namprd07.prod.outlook.com>
x-forefront-prvs: 0918748D70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(366004)(396003)(199004)(189003)(1076003)(110136005)(54906003)(4326008)(111086002)(316002)(386003)(6506007)(39060400002)(33896004)(53936002)(76176011)(305945005)(7736002)(52116002)(7416002)(6512007)(9686003)(7406005)(7366002)(5660300001)(68736007)(66066001)(25786009)(6246003)(8936002)(81166006)(2906002)(81156014)(8676002)(105586002)(106356001)(99286004)(6436002)(186003)(102836004)(71200400001)(71190400001)(6116002)(86362001)(4744005)(26005)(3846002)(229853002)(6636002)(6486002)(478600001)(53546011)(97736004)(72206003)(486006)(476003)(256004)(446003)(11346002)(14454004)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB5791;
 H:SN6PR07MB5326.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5iBrCZ+JRp4XDYk3nQnclRgUGJotVnaeI4HzaB9TxBuGQ9/sV+ywCpxtEK16d8NtQaLRDfEowZEta7LH87DAECemlkBd7P3j610ZGv7t+Bg8uFX7E+UcOAtp1eh6u1NUyjJKGtfvqcXpufTsJ/Nqo2PkyomFqnEQIYyBXIFm9OLVrkR6idQBJlPiTE7YlhwYesaHVivh2h5g/TPB+UteTsII1z5ValbU0YaOHjE2HbcpJ89+4KcMk0PavEnTnAhGFepOnHPp3v+iVLtNV/TS2pifCW4GenTFM3o/OKrpJzYmX5RxMbZd+G1ImUrnZv5Z+m59orDSSnb1SunitYQhp1F6otWNuDN8/kRznFcgutRdOwFNR5zw7yE1CqscFeuacE3FWqFG+i4KP+RluPWS4yBblb2gmcdAWYA0aAluIYo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <18D894F4658C7F4B85E3834DBCAF4807@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0924a94c-8f91-4743-d322-08d67ac6be80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2019 08:52:04.8878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_005222_681917_A5A00185 
X-CRM114-Status: GOOD (  16.06  )
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

On 09.01.19 14:29:34, Rob Herring wrote:
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

>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi  |  96 ++++++-------
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |   8 +-

For both files:

Acked-by: Robert Richter <rrichter@cavium.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
