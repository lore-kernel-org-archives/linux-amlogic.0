Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A143CC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6261320672
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RTcydRG0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="eqzvmghc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6261320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jdheTjEWFT1CBl74cdH2TEqoPl6wk0pb3tFxHrisf6I=; b=RTcydRG07dLHDfym15Tre2eBg
	xEcaYtoRJQ215Y9bft2b68N2njaeyF4jgE6wajMeHbC0PffiZV8+e/vaB9wkRwoAjmnyBS0tUBnfn
	elD+hMmiu9qnoEQ760Hy5K05TMPSjmKR7hzI4lJMqxunYi2IJjDYIK3TrjZ7s6uUiaJNUjQSy3c7l
	2hAjASlBENf5NiVrbMHMS03zj5wR4fBfagELAmVWBwKkfuxEMwBtJ/aTUfEL5oXV5vAgG6Yo4SKzO
	+GWKmsOh79mESKeX3w/yxOwN0YGc7ZC8hTorQetbMYLbJLo5Gx2u16VuWt5AAmrOpH/UL4wC5dAiD
	wa3aSiHxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Toi-0007Tk-DC; Mon, 03 Aug 2020 06:19:24 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ToW-0007Nf-La; Mon, 03 Aug 2020 06:19:14 +0000
IronPort-SDR: 3j72IsD0bgIa/u4KA+dq810Yn0deqXqDeJ0B01WkXesQHdOf8A1zgbRA+U5EPux+YYa/ZQU1Wo
 /HFK8LbOK6Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="131616640"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="131616640"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 23:19:08 -0700
IronPort-SDR: VorP2sWIBlJ3KXlf1eQVIi+9gDDW4i39kcE8KNFzzDu1VBeeHzL9JDd5p+iBDHA5wb10pZao5n
 //wCCrTTQnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="314552450"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2020 23:19:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Aug 2020 23:19:08 -0700
Received: from fmsmsx103.amr.corp.intel.com (10.18.124.201) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 2 Aug 2020 23:19:08 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Aug 2020 23:19:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 2 Aug 2020 23:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED+XUpClelRihYh4FlOqnpDkejGMdiMWC6Hxd9bQC7XS0TiRyQED2zrIljLKS6TeshZiaNghz+EYaCypRUrbohir8qofdt2kv+/kdd+v3DFTev8XZmOC/+XuFKx5kd2oMsADjEDtXRowgBCc8Wvl87uy+R9VwrgYdqlTRbUR9lRgCli3LtavOs5GHfMet1WLtgOq5W2AQyBQlkaVCk4SbVytwtWnNMtLYSpKA1faLK5OJmtxSIpEgMnOP8YO3K1PkPyk6QbuwvhJvKUJX1rZ5XeDbsormkroEhy5+4/mRlchIfGsK43dBt2JS+d8GBuc/3Bn+ToGQGAP47P8M5vkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib8JpDAXhOJFLyHKFsq1MmMj3n0CGGNpAYR2IqxwvWE=;
 b=hz2XtmRV23cGBpPDm65OLYIB0IMcaxqm1Qq4lN3WvSgwRp7/78DmV34uSPlyj7U+kVtu1Eqf0G1X7/sbHM8cc3bRzCESQAgmtUu7Xwg4fdtazIeYCs4n4lMKwzZae4H65VZwQtK0C165YZztF35yFL5YytW6VgdD3Vi3nyLTyDmFJJGZQMm+vssDWTSlp5DruGkS82LkChGEqmkTCi53CrN3TJSUn6fKrFJmTZqVRxc52o90sZB+tB82Qoerc4ED23fmnh4lWO6xWynBGTiq+Ph81m2mIy8XygImB6MBHMTFG7ALrO+K+FUc8fdcOivsnyMm6t780jVI6/aVK+5jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib8JpDAXhOJFLyHKFsq1MmMj3n0CGGNpAYR2IqxwvWE=;
 b=eqzvmghco5YyVa6sWqe9arUnsGVLrRv4uYmkdOxis7SJn/n3Uzw7Cx0sxTgb2BUpgDMd8LVyXqb4731MxdH5gLPvc5+/1c60xDCs0uGnmiL6W14qIYwtwwxwdtBLKFzktr43sKmjsvXBo73kCb6Gd1Lc9iVt+lDkch6ydbqx7PA=
Received: from BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26)
 by BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Mon, 3 Aug
 2020 06:19:02 +0000
Received: from BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::c85c:ec78:c650:6ac9]) by BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::c85c:ec78:c650:6ac9%3]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 06:19:02 +0000
From: "Tan, Ley Foon" <ley.foon.tan@intel.com>
To: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Subject: RE: [PATCH 04/10] PCI: altera: Remove dev_err() when handing an error
 from platform_get_irq()
Thread-Topic: [PATCH 04/10] PCI: altera: Remove dev_err() when handing an
 error from platform_get_irq()
Thread-Index: AQHWaNjk5coJNrYjTUiREOlwRIjXfqkl6gmw
Date: Mon, 3 Aug 2020 06:19:02 +0000
Message-ID: <BY5PR11MB38934F2DF0BA55EBF2965B34CC4D0@BY5PR11MB3893.namprd11.prod.outlook.com>
References: <20200802142601.1635926-1-kw@linux.com>
 <20200802142601.1635926-5-kw@linux.com>
In-Reply-To: <20200802142601.1635926-5-kw@linux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.com; dkim=none (message not signed)
 header.d=none;linux.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.178.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f5195da-bced-4925-c1eb-08d837751de8
x-ms-traffictypediagnostic: BYAPR11MB3477:
x-microsoft-antispam-prvs: <BYAPR11MB34774F05953B09019664BA29CC4D0@BYAPR11MB3477.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oST1DNXh6QaKkIbPeXpbPj+v6g+yb//abnO830YFMCUkdW5qaTTcBOsKAdrHdGDUkludhJztddKS8C0FYiUpD7Z6SIMQwHC0z3oqvAKX4xDmrg68uri9rZ0cKI+Sz/G7V+lCU4+slqHkXWrJh/2R2OgPck6+72LNN98BblZRxVmydns7FeAvTALsmVGAsHjfyS7Y7CZPzF8Ko56Exy445TwZjwc6iz3B1uGet8AdMcthT5ecsKE28V0V53VP3fYCKTO5Xf9DIKonaEHH2DcuA6dnB1JeTk38U342Zsu3sLfR0jJT7LCWYp1hX7+x9jxYgi2qZ1ahBhG0sXuvFaMfHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3893.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(5660300002)(6506007)(53546011)(7416002)(8936002)(9686003)(186003)(26005)(55016002)(478600001)(7406005)(2906002)(7696005)(8676002)(52536014)(54906003)(316002)(64756008)(66556008)(66446008)(66476007)(4326008)(33656002)(76116006)(66946007)(86362001)(66574015)(110136005)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YMIxIkMhJCBVWtFoj8Vcowk5F744/f+sCuOlg8wx6/3uBe4wf9HBP/JRf4z7XL3YJawEVmvfvAHm0AI2jrmGVr6/9efGsf24T+u4ihTiO4LHVf/wPxKPQuEuklGI2K1s0g6Pf/KKybzFpmsX1csLOY4Dg8HlMrVivxKr7zjDYcoZAYpy7HAidRL4rLDgfsByXGax0DeX6fDDxg17c6NaFEB5PXKTcYK1xaGCPWZu7Sf819rKE7hrFW92utgBu3TbzvLEwatOgqM+stdj/zppN4kI4HNwikPfCYnJFb9kMG4dodwSAoUtf5AXHmOXMvgLiZwOYmOtSDZnBZDKCErlzyAIqSgmMlcEabnSLctY+yKSKOwmVnK3ANVUL/E6r1LLYxxfz7rFe5dBr/xzzmfdudAUlFNWAazLzr5fdfUsOm+O/nkgce3npJHhNUXcTpMR/drn+RjmSgic1KAwqZT2mVteSNp+dTDjIuEUHOEBflU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3893.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5195da-bced-4925-c1eb-08d837751de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 06:19:02.3980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jencl7SvT20ONAhh1IhuMCYP5xT+Vcoacfl+muvvWbhI8GQVqXZnf94IEhYJkm++fZTdlTJPK9HNzogOe63dxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3477
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_021912_891035_2975A8A5 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "rfi@lists.rocketboards.org" <rfi@lists.rocketboards.org>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIDxrd0BsaW51eC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgQXVndXN0IDIsIDIwMjAgMTA6
MjYgUE0NCj4gVG86IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+DQo+IENjOiBK
aW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT47IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5l
bC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+OyBSaWNoYXJk
IFpodQ0KPiA8aG9uZ3hpbmcuemh1QG54cC5jb20+OyBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT47IFNoYXduDQo+IEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47DQo+IE11cmFsaSBLYXJpY2hlcmkgPG0ta2Fy
aWNoZXJpMkB0aS5jb20+OyBZdWUgV2FuZw0KPiA8eXVlLndhbmdAQW1sb2dpYy5jb20+OyBLZXZp
biBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPjsgVGhvbWFzDQo+IFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT47IEplc3BlciBOaWxzc29uDQo+IDxqZXNwZXIubmls
c3NvbkBheGlzLmNvbT47IFhpYW93ZWkgU29uZyA8c29uZ3hpYW93ZWlAaGlzaWxpY29uLmNvbT47
DQo+IEJpbmdodWkgV2FuZyA8d2FuZ2JpbmdodWlAaGlzaWxpY29uLmNvbT47IFByYXR5dXNoIEFu
YW5kDQo+IDxwcmF0eXVzaC5hbmFuZEBnbWFpbC5jb20+OyBIb3UgWmhpcWlhbmcgPFpoaXFpYW5n
LkhvdUBueHAuY29tPjsNCj4gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PjsgVG9hbiBMZQ0KPiA8dG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPjsgVGFuLCBMZXkgRm9v
bg0KPiA8bGV5LmZvb24udGFuQGludGVsLmNvbT47IFNoYXduIExpbiA8c2hhd24ubGluQHJvY2st
Y2hpcHMuY29tPjsgSGVpa28NCj4gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT47IGxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAYXhpcy5jb207
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IG9tYXBAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcm9ja2No
aXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0NCj4gdGVncmFAdmdlci5rZXJuZWwub3JnOyByZmlAbGlzdHMucm9ja2V0Ym9hcmRz
Lm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMDQvMTBdIFBDSTogYWx0ZXJhOiBSZW1vdmUgZGV2X2Vy
cigpIHdoZW4gaGFuZGluZyBhbiBlcnJvcg0KPiBmcm9tIHBsYXRmb3JtX2dldF9pcnEoKQ0KPiAN
Cj4gVGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIHRoZSBkZXZfZXJyKCkgZnVuY3Rpb24gZGlyZWN0
bHkgdG8gcHJpbnQgYSBjdXN0b20NCj4gbWVzc2FnZSB3aGVuIGhhbmRsaW5nIGFuIGVycm9yIGZy
b20gZWl0aGVyIHRoZSBwbGF0Zm9ybV9nZXRfaXJxKCkgb3INCj4gcGxhdGZvcm1fZ2V0X2lycV9i
eW5hbWUoKSBmdW5jdGlvbnMgYXMgYm90aCBhcmUgZ29pbmcgdG8gZGlzcGxheSBhbg0KPiBhcHBy
b3ByaWF0ZSBlcnJvciBtZXNzYWdlIGluIGNhc2Ugb2YgYSBmYWlsdXJlLg0KPiANCj4gVGhpcyBj
aGFuZ2UgaXMgYXMgcGVyIHN1Z2dlc3Rpb24gZnJvbSBDb2NjaW5lbGxlOg0KPiANCj4gICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtYWx0ZXJhLmM6NzE3OjItOTogbGluZSA3MTcgaXMgcmVk
dW5kYW50DQo+ICAgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4g
ZXJyb3INCj4gDQo+IFN1Z2dlc3RlZC1ieTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xl
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5j
b20+DQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTogTGV5IEZvb24gVGFuIDxsZXkuZm9vbi50YW5AaW50
ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
