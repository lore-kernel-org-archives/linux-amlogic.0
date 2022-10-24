Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19857C38A2D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Oct 2022 04:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J4vplwxicMdU1z5hdNr5d2RxGQu5ZKhgKb97Y8jgPE=; b=T9UGDS0Vi7mKc4
	8u3K7RFHBrHi7Xba2md214hukZXERP1v9awELKH7rgHgbBHuiV0HcYz+BW/K0KtK4olp/wbAfeQxI
	uRVhZ3ldP5QTR8NzS/7cYk/2BWIGeyQJKbn6v92CZudTZGvnGDA4wb/bjSrFL3Qo7P4FP68p9+WmW
	SlsgjVXsV7jcwNMrI1v5oqb0WilRTzryrWKrHgQ6kdWDUv6X6B8GrG6GxrepBKJ4KkMxkODelpfAd
	ie7fhHxlhYWTDcTiR3MUB/ABEeuzh8PqyY9jWtd2yvSx5AP8UtVswWTe37U5/I6ZxdOR/bhJZTC3b
	s34/6cBiZsM2eFJ/bwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompGV-00H56c-9L; Mon, 24 Oct 2022 04:40:43 +0000
Received: from mail-fr2deu01on2137.outbound.protection.outlook.com ([40.107.135.137] helo=DEU01-FR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ompGE-00H4xg-IL; Mon, 24 Oct 2022 04:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyUdFMwjcp9TYuo7cd5Vk85C4UtpkhPhKrmQ/ipdIpXisGrtHF50FmFawcP9Qy0s1pEfNqsT5GPjZ+weETm9ne2tYYNFz+y44qsASR59zXw7FUhC/oSo8ESusgaSPy62MoOn5eCatxatSSe+iwGixG9RPtfoPgcl4DbkorHcGCXD0zc1pa5ZYg0opWkWkKdI6zJv6UXlfIK4R9tWvNhlO86oh6VU3scb4Wub/hw6CgN7pkBUy5pkCEIwcQgT+iWjkY19zO39coM0b7PEreN1zE0aQZaBPd73Qz+sDsYifwdF29n3fB+DfrnCkljNB24MHGiiKvIkl1ll+4wcdWUPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0PoV6jKiO3XJdvnSEjjiWYcPFGiRO5b7Pl0hdmSr1M=;
 b=cBnIrYkp/SBWf+3MPFV54tAnsCucsYb4/ctNU/Ae5kDK3/+ztUoju7fhbQq1e7ddgeZerf97Xhjs5qgap4J/BLj/FWxlVm3blQCqKPHD2fH9NrawSHUKiEWLsbbnG+SeCTAdhbs2zCXJAKzN6WvfbX0Y6eyzdUN8u4e3elQ9wEQWGZrFZ9Ps/v0ga+BfS0UCte9eOCz/uCxOIR/b2Ez9lyk12hOEepUhpH/ILOTW/SIKfRDWPzNhKi89Ao8Uplu9eIUpMMZwJ4/tkG7Kg5+zbVKay1QuJp2J4sVW5h/M44LcmkGn5jDCubf8URpsV6vm4NbYpJdsPnBntVIWfjOQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0PoV6jKiO3XJdvnSEjjiWYcPFGiRO5b7Pl0hdmSr1M=;
 b=uXTsagmk+6+7+SqUDETJkAa767xbTE6vZcadDGqr7dLkOtogcyzcywk2XHOPBo8pjS4OXQmNchF1sFoAm1ytuu2MKGDRJkfBdPekp8sYSCvuKBN4cXw+NQxPFLzDKxZreohwIWDGxm77CGuKBiSRKh3KvfVUHHctWqmkG17MazY=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR0P281MB2848.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 04:40:19 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::adc3:ee78:7f30:722%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 04:40:19 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Matti Vaittinen
	<mazziesaccount@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Hennerich
	<Michael.Hennerich@analog.com>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Thread-Topic: [PATCH v4 1/4] gpu: drm: meson: Use
 devm_regulator_*get_enable*()
Thread-Index: AQHY5U+UZr58xfb6e0C1JLs5PfsDA64Y8amAgAAHegCABAGugA==
Date: Mon, 24 Oct 2022 04:40:19 +0000
Message-ID: <a7b8c10a-9789-1b7d-da42-9f2138a675b1@fi.rohmeurope.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
 <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
In-Reply-To: <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR0P281MB2848:EE_
x-ms-office365-filtering-correlation-id: f320998d-7094-4dc7-0ad4-08dab579dae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3sRZ0fgdSgqUWSswOEmH6o4P/sch/MCippgZvCyEzusYUugSZSnZgoGifIjfBBZfdayBhXPV1Kz2GlRQDIGXJI+LLlXmLyAp3ZbX1QuXar7ajavQlIdUsHLBk4WOpoHN2tGIhiM15socYY4CStl6ASbhwNGzrN0E07KPeytL6UrXrhjOyRHx3d4fOKW3e5hhg+hUmRJgsoPSjRBbhcjdS1zLkKdOYyrHPO4LETuuszjslttWA9zgG5hNY03xzKCdiHL8HSmieduLo9MW9DlrJPbo7eVQa4cP7PIjDWr4w1f73bleq3yiam2obXuBiu0IxoSgpW3LLwp1DKvz+mdwo7QuQkCHf4ferGmZrGsDEyDAcV4nsnVgo2pliCfKF/7RifpxhmxqSt1Q2/sk+DLI1kCVJmsGWCJaBK8op/3sZgvkODCRbpqe52qtApyfblKyEfO9KAbOE5gqdMhwIBB/+IejUdB/ziwVPcN3Nan/RL8B7ETvpXUVashLkYr3EH2q8zGnBZ/LCORmLxhFII8TQ570sx7l8+hb3WtNb/vSD6W6dWnX/aAD13cduvE6jUCisFqrkLGUm3ndoRpYKMdNe7ltMJaN7OSdbC0gB7rF3Nsq0lc44e9pLwl8zy+94F3XQ56TMvfgSc/KhRfRkhxa/PbYanApMvjX/YQYG+0yV38yikJxkKWASrgSPYJZHiXKxC6vkbyPuguCtzcuoapfLayjgLOBv/qGpKZXdxSGBrymeu9vbG+brYSVssS+d4bln5FKu2QpC6IHT70kF14LYd/nZMr6Y7jabItmNdM3d60UVE9v5++J3ZMijIMUq0iKpVBt596Vchb14FqelLvc+g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39830400003)(396003)(376002)(366004)(136003)(346002)(451199015)(6486002)(478600001)(86362001)(31696002)(83380400001)(71200400001)(31686004)(76116006)(64756008)(66446008)(66476007)(66556008)(53546011)(110136005)(8676002)(66946007)(91956017)(54906003)(4326008)(6506007)(8936002)(6512007)(41300700001)(7416002)(5660300002)(38100700002)(122000001)(2616005)(186003)(2906002)(316002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WHptdFNGMEwvS21lMEpDczNwSFU0Tm5XKzZHN1BrSVBBWXdMeGdCRzhlTVFU?=
 =?utf-8?B?TWhTOTFDSFlVTitQSmpNWENrZ1J0TWVwRkc3ZHl0Q0x3YmdKcjE5b1UzNHNv?=
 =?utf-8?B?WVBLcmRCcDQzR05NWUR2UmhhN3pUVzR6a3ZNdDVhYWJpMWk0OGNLMi9kZUJ3?=
 =?utf-8?B?ZGp2Z01CdFBMQ1hpa0U0WmU0QUpRalh5d002UmVzZFVzNHlCcFB5NHVTRHFC?=
 =?utf-8?B?MWJYUDN4MUFJQUZDdjNZS3NPQkFEY3VHWXFHNEs3TFRPSEZZNk5KalhaeFhu?=
 =?utf-8?B?TGZwM1AydzdYaDdjb2twd2t4WTJkUStGUUlibEZrM1ZEdzE2d2J2ZEtIdWFq?=
 =?utf-8?B?S3V2WXBsTTNsQ09oTngzTGg4QVFYbm0zQlRlZGRZUGRKaEFHdWRUaGxXbnNU?=
 =?utf-8?B?bEo2ZVlXS25SaVlCUjhhV2IxWHEyMmNocTBCZitsSC9UdzBKSmMxL1ZJYnor?=
 =?utf-8?B?bFdaM1dmbGk3M29MNm1PTlNub1lxOTF0NXgyVVhXbkcyZ2d6M3NSYmJodGZE?=
 =?utf-8?B?M1Zrb0FEVmt3bnZ0a21qUG1NN1d1aXhPZXpWZTRHTjNNM1NxN2Z3TDJwSTRa?=
 =?utf-8?B?eDhEODdHbGxFMjRtdzJhTHRSUll6TytoNGI2eGMxSzMwNFJsZ3ZYcEg1amxT?=
 =?utf-8?B?WGRyZXpkNHVuTGpUTExOTXZ0bnpENmpEV2dnQXJWRDR6TzZwaTlCbks4WUlw?=
 =?utf-8?B?aFdEVUxObE5BSkxiZ3paazJWd1N5RWtoTHlvUk4xVzlDbnRycytvd2JiQlZi?=
 =?utf-8?B?TVkxbDFxU0dEa2JCWi9WVHN5dkRsakE2SEFYcjZRUkY3V2pSWHV1TnBNaWJM?=
 =?utf-8?B?dzV6Qy83alU5ZHhEQmRROU9rcVpFWjkxbkVWK1hpZW8xOEJSeUNvNkM2ZlZN?=
 =?utf-8?B?WWw3QnNMblZCcEd1akVOaXNBR2ZhV0p2VmVZeWppa0pHTzNFbVYvMnUwWXFN?=
 =?utf-8?B?ZklKVUd5aHU4eENtZWdlK3ZYcmVuTkdBcjQ3TXJhanhKS1BKZXluK2lxd09Z?=
 =?utf-8?B?Sm5BZDd4VitSQXdqK3FVTno5OFdBUUk3aTY1MHBZSFk1N3dZbHU4cEdNVXZO?=
 =?utf-8?B?QWpCS1YzWjVzQmVIWFJLVmhiY2RmcjRUcnFKRWVyNHdjY3Q1K0RKVTdvSEZY?=
 =?utf-8?B?TnZsRm9ldlBXeE85eEt1bU1NbGNlUUNmUTVWNUtEMnR6b05SR3FBaW13VEpK?=
 =?utf-8?B?T2JrUGF6a2w5TUlJZEdpRVdMU2k2L0F5bnp1dWYwcTRkRURFSTVLNDNzV3lI?=
 =?utf-8?B?Yjlremxqb01TZ1lXWDkvUmFmbzJGNE1KTnBVY0pabFNVRjQzUDhKOVc4WWhE?=
 =?utf-8?B?MUY4OUlxd2pZTW5Xa3lRUms1NmRVdFBldXRkdGlqclFKYW1ZSGFnTkgwb0I1?=
 =?utf-8?B?aUZYY3g3cmZnZHBxd01mOUcyc04zVnJTeWtlRnRSWHVxckhhNTR1ZXpxM2o4?=
 =?utf-8?B?S3hqL0RRRlo0QTBTWkE1b0ZJYnJyZnRBL08yZjVnbHpsNVc2Vmpka2JTQXMv?=
 =?utf-8?B?dzFGRVZxUkovSm43NU9CUW52enRtRmUxTGNjMDN1dzFJUThjdzNZRCt4Tm5L?=
 =?utf-8?B?dUdheWZiekQxN21EOFdlQzFhcnYrUTMvNXJ5czRmdDlQQkQ2OFhia3JvSzBR?=
 =?utf-8?B?RmNpNmxPRmNMYVQyR2lrS283QjZKZHNqS1NVallWR01lR282TUR2dkNKNmxs?=
 =?utf-8?B?MTJNMlFyRmVEQ1p6OVJVRlJncG1wTHQwUzZOblB0bzArMGpzUGZMTlMyc2lq?=
 =?utf-8?B?dWkzTVFhZzgrQm5YZ0ZwaXNrRmE3V3cyb21kaS9pNGs2UEk1UlVaZTZLOFJq?=
 =?utf-8?B?MXZlNUEzaTlRc1h6aXRvNnJ2VVlTZGN2WUdkSE40dkxUTnNKTE5JeFBLdUY0?=
 =?utf-8?B?M29ieVM3c084dFNKRzVxblM1NXhpZzNCMVZ4ZEJtdEJYbi9UWnIwYzNaVGY5?=
 =?utf-8?B?S0pIa1hiTVF2Z2V1eUdtN1lrSEZaVHJnQU5meTIzNEtCallzYXBCeFFQM3kw?=
 =?utf-8?B?SmJDTWtiVk9ueWFYN3ZTaTRGenVzU3lGYXB1R25TOWhpN1FOaUk0QVFSenM2?=
 =?utf-8?B?Uk56enBmVVQyMXpPd1VlMlQvb0x5eEZ1OS9LbUVkVGluaHNMU2dCazcyMURP?=
 =?utf-8?B?VzQ1a2FjclozTUY0cnZFWlVFV3FsSStDOVg2NEJkU1ZBaWZOTlNxSU1BZld4?=
 =?utf-8?Q?rmmsUwRyH92YYrgQPBqhJIc=3D?=
Content-ID: <F77AE48AE4F76A42AD1E12B494156B48@DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f320998d-7094-4dc7-0ad4-08dab579dae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 04:40:19.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsLZUprmMPEJo6HAt9BTKGY5YhYJrQy7tcvcGPlmDvDVeVKXLZ/eF44TplyIoxav7SaeghG3qJRuwLh4pcS1+akBOMrM/eJag/tRiVkGmCNhOBU8RkxSjnMscUJuDOri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2848
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_214026_886421_297F9EAE 
X-CRM114-Status: GOOD (  21.76  )
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

On 10/21/22 18:29, Neil Armstrong wrote:
> Hi,
> 
> On 21/10/2022 17:02, Laurent Pinchart wrote:
>> Hi Matti,
>>
>> On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
>>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>>> seemingly unused struct member 'hdmi_supply'.
>>>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>
>>> ---
>>> v3 => v4:
>>> - split meson part to own patch
>>>
>>> RFCv1 => v2:
>>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>>
>>> Please note - this is only compile-tested due to the lack of HW. Careful
>>> review and testing is _highly_ appreciated.
>>> ---

//Snip

>>
>> As noted in the review of the series that introduced
>> devm_regulator_get_enable_optional(), the right thing to do is to
>> implement runtime PM in this driver to avoid wasting power.
> 
> While I agree, it's not really the same level of effort as this patch
> should be functionally equivalent.
> 

Exactly. As I wrote, I do not have the HW to test this change. This 
intends to bring no functional changes. It is just a minor 
simplification while also making it harder to create a bug with the 
regulator control. (Registering the devm_action and leaving the handle 
to the regulator is more fragile than using this new API which does not 
give user the handle).

I am in no way against someone further improving the functionality here 
(by adding runtime PM) but this someone is not me. Yet, I don't see how 
this patch prevents runtime PM being implemented? The first thing that 
needs to be done is removing the devm-action assuming someone did 
implement power-saving by disabling the regulator(s) at runtime. After 
this patch is applied, the action removal is automatically a necessity 
in order to get the handle for regulator control.

I know this helper is not preferred by all but it is still safer than 
the current code which registers the action while allowing the regulator 
control.

Yours
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
