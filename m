Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B19C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEGTCyN+hNkOPNKzZkGneI+FEhNpAdK6VjHEgoWCe+U=; b=B2Wm9dwd7J+L/U
	Ad8qG6sYW8HJu5lsejjaJ6b2yldREpc6VLc4dAs0RZbOWLwRkKwpyZHLF0KW9lSinP61dM3MU6sSr
	Xwb7ONCVhrldaoGiQ+5t9fIZVP1/VdmCpElal1rMQGv7n03/nEwnZ7oLakN7Uol3+st4DyZHV0bNo
	nbBor8MnIRnzPsGB50/n0BPsj3SNh2gg6XatOxM+vVryqa9KPU7xzcOEM7GPUuPNh8i1+uqSauNof
	dCxpCGanNjUYLwqQm2ekx5CYwKdqURbnF/nfxRygaYwLuiCLN4Ds8BOhzmPFTtiIw6GXV6GxSwQDx
	Q+A5wOoJdkIFhiL6to4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOeGg-004DOE-Kw; Thu, 18 Aug 2022 12:04:58 +0000
Received: from mail-be0deu01on2117.outbound.protection.outlook.com ([40.107.127.117] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOeGL-004D2c-G1; Thu, 18 Aug 2022 12:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSI1rUnlzRvWqQNt6KNLVS82HtJXL7J0ZI8N16ZqCtvdPkdJxigujGTriJI6Zm8cm4QUwCYJJleLusxzq39+GYwVl++udHVj9fiziBn900Ir6MT/25tdixpljylW+6shcPUBPhY7D330UaERoJ29S1rKS24Tx7l2ewoC8QLJQpAWOjg8oJaGTmMsstA3u6GnEevNMIt2ISvbIry7yTthSozaRBFb0cOwr3gaIUYH00nTx/fyl11sJbvb6wcRNXJnLC+YqB8xfSsBakEXwweega/30fKpkHfNC3w10m9Tpb99jYlwTDIzLeTV8OpR2CaiwntSWptJNgJs/86AFRojSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVt0mXibzBFqq8FybJ7m5rMuiIBI3vU3lDrXonK6EBw=;
 b=P62c4pTscvNT8KRGa9gn03je2EeaNHcDJyMp9Y3zU8SgstieWEKyhX1EN0AnmSY1nlSnlgAFgNeC0l+VgghaKIp4cg/ojeIwyRaFVCVM/fgwK2iPHHRz2YOQfCV1QBcgg468oU+jHw0WHLOO6lfNnzTu9AB/glMX2QV9GGeP2YqJAC+Deb6HBxxzC6pPnTQS323SltU9cH5LyIaIStbOLiI+3XAbKPk2tGjEsBSWysvIaoaQ+somd8JlILGblE3Zy2IicdW2ohFtj2MG+HHfeEE7s5LTOgDby/B2W01C38QaY+jx69yZxUA7wQpmIdRVoyzWyhpBDsoHzMH0q84N7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVt0mXibzBFqq8FybJ7m5rMuiIBI3vU3lDrXonK6EBw=;
 b=GWx5VcnUfD/qEnrTqiZTUdZbZ6hddOAbdINYa80Gy7kyXvY3ZMp2jru2jc3CX7sMfubVg/Us6IqDbSpaTUlFvIvKQxiIQywv3jyerzNe12/Grjw1j8D0YmCC18p9y7ACum/tdz2LUAEqkMbMrVEQcFqnPexwCjyYEaDiJhfsTWM=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by BE1P281MB2996.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:68::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4; Thu, 18 Aug
 2022 12:04:28 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::58c1:f1e5:729f:ad7f]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::58c1:f1e5:729f:ad7f%6]) with mapi id 15.20.5566.004; Thu, 18 Aug 2022
 12:04:28 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>, Matti Vaittinen
	<mazziesaccount@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Johan
 Hovold <johan+linaro@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Vetter
	<daniel@ffwll.ch>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
	Miaoqian Lin <linmq006@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Alexandru Tachici
	<alexandru.tachici@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Guenter
 Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Stephen Boyd
	<sboyd@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jean Delvare
	<jdelvare@suse.com>, Alexandru Ardelean <aardelean@deviqon.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	=?utf-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Robert Foss
	<robert.foss@linaro.org>, Aswath Govindraju <a-govindraju@ti.com>, David
 Airlie <airlied@linux.ie>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Topic: (subset) [PATCH v2 0/7] Devm helpers for regulator get and
 enable
Thread-Index: AQHYrjODEkpLnjXMEEiLI50ZP+QfK62wH3oAgARw6ICAAAW5AIAAAtGA
Date: Thu, 18 Aug 2022 12:04:28 +0000
Message-ID: <cf12a982-7694-76b1-7cb1-6b228f0bb0a7@fi.rohmeurope.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
 <Yv4obo9MUw+Lc+nr@sirena.org.uk>
In-Reply-To: <Yv4obo9MUw+Lc+nr@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceca9d43-fa89-4f90-5083-08da8111cd41
x-ms-traffictypediagnostic: BE1P281MB2996:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zA4MVxUNz/6MoqPUYx+327JtwCSSJAh5QNfG4BGqBiF8RT7hyqZ3wBt8ztrYGXA/ihzqHiYJQ8SLmIb48DkMjI/ug5PuQgBFSfXH0zOVpMNX+gu2bmul2pVQ6VwsBXk/kP9R1oHm83URoF28JPai4xOSOGVH5y8bHx+jbXdoYmbngEvJQnueXJk8H5+R1YdAIP2hVHJ2hfa91LKVJHQwNeWH1BDLf0fVdl/2S4QnmGIz5TukjHpAKSdkmm0hrmDSZDjhrgnRR6nSeb2BcgpmJfnIR0aqWDw8VR/Ymk1wAicaDU5G9EGpNC5K7mRlE5spDCG1RAdb/jMS0MZnacHwtZUxHltaQjaYBtbwp8YvsFZs0CgdXgEblEZ+SDysvSDCtJn4WUE4EIg8gFzgBrSXbyJDYv63675EemYBRdxHA6C7YDTUJFp9t9Qg/UzuM9tvi/YZZ9B1z2kAqPHHZiMObOlLmoZLjw1Y2PD1l+bm1BArJAOzFVS3+X5uqwmpZSxSWGrREVWDrX95Rm76G0TSSoK5PELCXScEy+2ALPEY4mEFE+x7Wxjofom8BsTNCuxtBdSx4qSEwmvFWPWhznK0bLdIjF29JqqrNAxaif6SA2rE9dNzeaf9tUOd6EGBvI7Z9ad7zOxj7Xe8wCXiGCmeLaMvBPukC3TQYo2eTKLYA+XlLWfV/0K8yRaJ3y6vpD6aot+vSzHaI9xx3lknaf+Ci4kPQVVM1xkakuU1Xwow9nnaQMmSzHCSOz4CRPjaT4sLRMJLu8h33v9sB+eAlq1h0YpWv6mbDB0hxZWuC1xGxtBBf6mhcX+Kv3zS9zd5PWBjvHN2M38TVfyPUQjSs9tsfQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(41300700001)(53546011)(4744005)(2906002)(122000001)(6506007)(38070700005)(7416002)(31686004)(110136005)(38100700002)(5660300002)(54906003)(186003)(7406005)(316002)(8936002)(4326008)(26005)(83380400001)(64756008)(91956017)(478600001)(66476007)(6486002)(31696002)(76116006)(66556008)(6512007)(66946007)(71200400001)(86362001)(66446008)(2616005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aVc5WjEzNDI2S3FlZHVibTdzdDRFay95U2Q3WmdWdGZWL2dLR3FYekpvUU5D?=
 =?utf-8?B?UHBxRXZnc1ppdVJhYU01UzdwdXFXNWdJdlJPR0dNQW5BS2VScE5kSGVDaU5j?=
 =?utf-8?B?SURHOXVHN2hLMHJmRjdyRHZJL1pqa0huTmNhYmdyekZYOUsxSktyNDJ0RlBr?=
 =?utf-8?B?d3A0cEVZSGRnQ01hVUw4bFZPOFJZZ1NQZ1lWVmlzZ0NSQ2NUS3EwaXJmYmVa?=
 =?utf-8?B?aXY0K01hUTBaUk5nMUJwWDBUQ1A5c2diNGJXZ0VlU2IyNU5JTWlwOU1yUmlN?=
 =?utf-8?B?YXdkc3hTdkUxUnFXWUNNN29PRHRpb3hpdndVc29YdjZ4TVpmdGFLNUxuRVQ4?=
 =?utf-8?B?R0toWlpidG54MlhlL25Vc20vSkY1L1RkTGd5VkJsSW5HY3M3MXM1cFdPb0dV?=
 =?utf-8?B?UWFMRG4wb2pFR0IvR3ZiKzJBU1dDWk0zK1o0NGVzSDVEZnVwbVZpZG5XNmpw?=
 =?utf-8?B?Y2Q4d1VvTmhQek5MR1dQeDlJcC9oU3R6MWJOZGkwd1R3Uit5ZW5GUFlaUEhF?=
 =?utf-8?B?elFzZElLeDA5cjY5T0ZIZmFNWTYxd2ZtaWtSYlp5ekg5MkVhc0hPWFN1c3pD?=
 =?utf-8?B?ZHM2akIyRXZ5dWE1KzlVcjV1d1VTbmVlN3lTNGVvbnhFNitEdTFjT1p0Rm8z?=
 =?utf-8?B?a0FiemNrNU45K3U3YXY2UUYyb3RBYVBPVUw2eUlRQnZISXI1YkhqZ3hCb1pw?=
 =?utf-8?B?R1JqQXJRbTBFUE9odWROSitKT2tIRjhreGlPc1prNkVwT291OE5BUWdRdlow?=
 =?utf-8?B?Y1FwSGNLUmprbnByUGFlTzJYMEpzNTBNWTdMRkJmK0xINStyYzZoVDE4Mk4r?=
 =?utf-8?B?a2VPM2F0Nm1qbEtoaEtZbHBWN0RGdys3Q0pma1p1Y3ZrN1NXdFpaR0ZKcU9U?=
 =?utf-8?B?bVZIcmIyTkEyc2oyUDRPQitJdUlLdTNCRlF6RUZtMXFzUDBaK1hkcnIwcXhz?=
 =?utf-8?B?OEpUM2F2M2N6dVVMTVc3TUF0aHpLK2dSSk1MUUZGejRyZkZWVWZjWnBJT3dG?=
 =?utf-8?B?bllQNC8vdmJsY25Tb2lwRWhkKzdCZ3d4RjR6UDNOQXFpWTRKOFNsNGtnbzBp?=
 =?utf-8?B?T1Bjd2lySGVKNVE5Sll5WlhBYmg4Vlh0a1JFRmNTNjJIUDNJcGFCSERjNzJI?=
 =?utf-8?B?Um5zd2EycXd3a0JhT1FIWTdwRnRaRUZhMVdwSUlSV2xBTXpuL090L3J3T0JM?=
 =?utf-8?B?OFVhdWRMU2pkSmowZ1VoeDB0NFFGYkR1dFFNaFI5ZExrVXR1eHJMbEs0MW45?=
 =?utf-8?B?T2lZZGxNMWNWQTNqK2FVb2lLVjlSNXhLemlyY1d1SDBFb0hvRDNXSVVldTJp?=
 =?utf-8?B?bGZ5V3RQckgvUGZ3QnpzQlFLc2lPN2VGSFYwRC9IZGJ1WUdadWdyTnFsQlZt?=
 =?utf-8?B?VXgxNUNGTnhzUnJJWTdCRnNtQm9YdDlCOEJrbUZYVEJCRzAwWFlOZWlkbGJs?=
 =?utf-8?B?SWF5UXU5cEJCUm9zTUVVdUNWZ1lDVFhFVTdFMVRFYStvWXlOYW9UUWtPMkt4?=
 =?utf-8?B?bHBXanduYXk2cVEzazEvSU5MYXZVNE9sdjVpOFpOZ0J1dmxiTWhrWGIzdDhk?=
 =?utf-8?B?NlQwZjVybythK3lKaGNqZVpiZTZwZS82YXNyVVpnczl0YW1WZTBsTUkreDRF?=
 =?utf-8?B?ZmpqVTVyQXhUdjdOamVNNGZTSHA3ZVNWWGNvdFVHUmZRSFU1QXlUYXd0Q1BC?=
 =?utf-8?B?SThlMFhrVTZaUitRZ1VWbk90QllwLytJN2hRSkQ5QXNhbGpDbE9PTkJFN2RX?=
 =?utf-8?B?Qm5vcFNEaXVpYzVuNTRtMThwaE5IN3lmTkZVejFJeUtVdCs2MitoUzZpVExB?=
 =?utf-8?B?ZTZYWkJSQnJVSkp4cTRPdXRQMEtOY25CM2tZMGw4dFYvYWlkTWFZdmMrTmJJ?=
 =?utf-8?B?WVZ6M1JkY2ZCWFBuVGovOFZhTXV2aHV4WDY4YTZBT29FcEhNTENFc2RwdmJp?=
 =?utf-8?B?b0hVZVBydnExTHJEeEkwR0hIVTJ3azJRbEU4d1pYMkZwWjI0bktsQlM5KzZF?=
 =?utf-8?B?N1FWUlU4M1Y1TnZJb0RWNGxnZFcrL0h6bDVtSVNFbUdQVnpUSG16dFkvaUhn?=
 =?utf-8?B?TDhGcW05Qm1VSWE1cUJWTjdGTVplQjR2SnBPd040WXg1bi9lUy8zS3J0a0x5?=
 =?utf-8?B?anVDNXpQSmlMSG8wcGtlcW1pQUpyUFZEOSt6aDhJT3lNeCtvOEFVUTh2bUcz?=
 =?utf-8?B?ZUE9PQ==?=
Content-ID: <B502E9C5BDADAB4B9DE28375B14BE2F7@DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ceca9d43-fa89-4f90-5083-08da8111cd41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 12:04:28.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IE6/IfQGl5FkV/wWycoUa6fRnT8Iz70Pk8kzExG1UqA4dX52g5xYxkVke7JBiQ2z0M6nLU1wt3JRh3esG++yUSk1uBgwueUaLbi0kbIWOrZeSqRXbRZButWE2xRpG4WV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_050437_810871_E2F667D0 
X-CRM114-Status: GOOD (  15.67  )
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

On 8/18/22 14:54, Mark Brown wrote:
> On Thu, Aug 18, 2022 at 02:33:53PM +0300, Matti Vaittinen wrote:
>> On 8/15/22 18:44, Mark Brown wrote:
> 
>>> [2/7] regulator: Add devm helpers for get and enable
>>>         (no commit info)
> 
>> I was planning to send out the v3 (where IIO patches are no longer squashed
>> into one). I didn't spot the above mentioned patch 2/7 from
>> regulator/for-next. I'd just like to get confirmation the 2/7 was not merged
>> even though it's mentioned in this mail before re-spinning the series with
>> it.
> 
> It's not there yet (that's the "no commit info"), but it is queued for
> today.

Understood. Thanks! I'll rebase the next version on top of the 
regulator/for-next when it's out then.

--Matti
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
