Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A287AC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 14:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686A420660
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 14:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wrvwb9D6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=CAVIUMNETWORKS.onmicrosoft.com header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b="Ot8XTzvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686A420660
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cavium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhHWxN5dk8thgDKwhh0rqKFe7gWDc43Mc7/H/OZBJeA=; b=Wrvwb9D6iW0dNu
	CLbCv2BPT8X+9y4QCv9hcMTt01K19V2MMAmHH6HqlKHaeMFN3S/u+gVt/ph86USy4ty8GoqBZDI5a
	HdpuxIBgoaEmR7XPkEekXEwIkJDiG1OFBPedXn6Uxo6cK+cxJOX8PZwG2Dg4iN6uF8R5yd1AdZur2
	ZAlzeci2WsOpsN7sqUwenlA+s+MBaPPyeFyMz/zo6Lh/t2o+EvD7ElsZTx51kVsnd82NDMjlrVrBE
	ViYTZABJPPMvcCLKhNjKP9tWthhBuv6XFAu3TeBn2G3+qOgtR5TcGis1qoXWZTjdgsp8BsfoDPDgO
	eXxFGUDUz1CVfK+V22Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghbas-00078s-5w; Thu, 10 Jan 2019 14:46:02 +0000
Received: from mail-eopbgr820084.outbound.protection.outlook.com
 ([40.107.82.84] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghbap-000781-8u; Thu, 10 Jan 2019 14:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO8uUxiz9vbYVEe3Xc8qO5/WuGWbwU3DgSNoE6vAv68=;
 b=Ot8XTzvGxTAmWLWClKd7GkQoYMl1VSqim9Ma5WDju8UPqjk5pg+g0nrfJx19jYBH1KSrIFKyTzeGWvWtWWXAky9izlKn2ENyNf3S4JnmjTDlX5SxHRgunXIwFIiuc6/frt/tQop9WE0nadV52jnc6HcYWzd+Q9za991kwY4Szoo=
Received: from SN6PR07MB5326.namprd07.prod.outlook.com (52.135.105.33) by
 SN6PR07MB4333.namprd07.prod.outlook.com (52.135.90.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.7; Thu, 10 Jan 2019 14:45:52 +0000
Received: from SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7]) by SN6PR07MB5326.namprd07.prod.outlook.com
 ([fe80::40f7:7564:c308:58a7%3]) with mapi id 15.20.1516.015; Thu, 10 Jan 2019
 14:45:52 +0000
From: "Richter, Robert" <Robert.Richter@cavium.com>
To: Rob Herring <robh@kernel.org>, "Nair, Jayachandran"
 <Jayachandran.Nair@cavium.com>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Topic: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Index: AQHUqFoPLrHRVLG6+UOUMPoBHyYQvKWolZkA
Date: Thu, 10 Jan 2019 14:45:51 +0000
Message-ID: <20190110144537.p5setcurwu6bwrtl@rric.localdomain>
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::12) To SN6PR07MB5326.namprd07.prod.outlook.com
 (2603:10b6:805:73::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Robert.Richter@cavium.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [77.191.60.191]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR07MB4333;
 6:DLuqaK4cjzUBnzHDVnIuAeo2//8hafoFB/7/2YuaTLutfJL09aHmCY2vJj+wG9sDEOsqNHi8dJhBystIfvlAUIW537vaUsMO+LfL3a48gowxKggoWtLkYLc+NxXOCvaD41W6BEHT0JNTBVlfSwpimhq37pW1wL7m6Sigpg/j3DfkCcVuod84u1vkVM3M50S+beZqawtAQW3OlInSLaGbjKQoJmBJaDi29MiEmP8XIn/b5PpmS6MflIum0dVeXKsBvGuo/dXCe6C3Jo+UvIgtWMDleBUBJmvq+i/b4wdVbjJxxGWWS1kvrMYGyj/DcyvBb+Azh/q5/3KgcCgFwX/72+DhlYjWbdI0h/LAUGS9G7zoSSauwU+fT+6/CbOxmGj8fpNK3jGZISg52jWitU+58tqgQSZfItO3iuOS74M70gXsP7vU0h0LNfpJxiOyxQ0K42EzExLFXoZ4Mna6JYQzYg==;
 5:zlEGKXjDlu9cWkE3oV+kjxJYRNFAir3vusmXoCgpGTpMYXJCCo7ZhBTSbc7AwpeGTPSE/b1rNHRPmlzyoVHiQXaaiMxjuxk96m5HDMaS+JwEVuhaS8O7lX0HFG5m88YuYFF+zfUJ2yO8VGxHyWT9cfUQVN+iS0j6YJmOdFiwe0+qECNmfY7Axd/GPoTaQhdXhuc0zdPRae3mv+O1XUlYpQ==;
 7:aB0hHGG3puGL3eKfxM/BUuIyVM4APqpX2q0/S1VT+ZHk8Cj5caF4jM2ChNJXY91Uyn5/wAz7GY21MSmXgDgdCbFFiV0pc7oFjiTEaqskDUynFPYq7dOeLx57I8rR3RMzO6MjFzCjB33CiW0u/cltGA==
x-ms-office365-filtering-correlation-id: c9cd2d87-a61d-44b6-7950-08d6770a50cb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR07MB4333; 
x-ms-traffictypediagnostic: SN6PR07MB4333:
x-microsoft-antispam-prvs: <SN6PR07MB4333FA71EFB6A1542C4C43EAF1840@SN6PR07MB4333.namprd07.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(136003)(346002)(396003)(39860400002)(199004)(189003)(8936002)(106356001)(3846002)(53546011)(256004)(71190400001)(97736004)(99286004)(71200400001)(111086002)(386003)(26005)(6506007)(14454004)(186003)(6636002)(102836004)(8676002)(81156014)(76176011)(33896004)(52116002)(81166006)(2906002)(66066001)(105586002)(25786009)(476003)(5660300001)(305945005)(446003)(1076003)(316002)(110136005)(7366002)(7406005)(7416002)(54906003)(11346002)(7736002)(68736007)(72206003)(478600001)(6436002)(486006)(53936002)(86362001)(9686003)(6512007)(6246003)(39060400002)(4326008)(6116002)(229853002)(6486002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4333;
 H:SN6PR07MB5326.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kI/I4zGjygmeh2iFLczAofsUAuK1/q+wiqX5flLF1WUz/76We4+MHpCD8LXWZCmYr/yzXYxCqT1zGFhQB57E0DXUpnGz1QsFEV1Bsrg1kotsAFDQoDfkJ/Cs+oK/9vhuo19urPcjv6I0THZunoz9AQT0JiA81v5mrC57sT5xLoTu1ok0f4Kv9oP5n/17ftVcfE75msACVsO1vHK23X5PNGxiQHYi/7wrgj4Rhrxom/QlSLiFJBCZLdvd9iRxnzftrZssLaJoSoFIbIKKSjnQcrAs+UPc2MtLD7v0k1WCB1Abu+Gzq+RsUZ05CM+ma54M
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <09F322A8707A4F4AB2C73BCBE4014E40@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cd2d87-a61d-44b6-7950-08d6770a50cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 14:45:51.9792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_064559_359495_96F7678C 
X-CRM114-Status: GOOD (  17.42  )
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

Rob,

On 09.01.19 14:29:34, Rob Herring wrote:
> External Email
> 
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

> diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> index ff5c4c47b22b..c616132f7d6d 100644
> --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> @@ -27,28 +27,28 @@
> 
>                 cpu@0 {
>                         device_type = "cpu";
> -                       compatible = "cavium,thunder2", "brcm,vulcan", "arm,armv8";
> +                       compatible = "cavium,thunder2";

We are just checking if removing the "brcm,vulcan" string has any
impact on early silicon revisions we want to support (see also
BRCM_CPU_PART_VULCAN).

Maybe you make this a separate change?

-Robert

>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
>                 };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
