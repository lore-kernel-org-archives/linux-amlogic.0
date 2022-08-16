Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA01C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHL8sxPaWu+rjXLc+lk2TK0k8KNnTq8CTn+76V3l96M=; b=kVR+qAaGk39E5b
	XHKO0fWMd+bvsVN8SjZMJD9UzTRBkphUhW4EVyfBBugVTU4+8sJiJwcDAsrVDhJIcofgqWdvvjdt6
	FlVvUYAWEhlHD+TihMdvZz8pCJKWoWZvoixRO2H4XxEvb7pp+QSsw8TJk6q/+8QMy2EdZlCktTuAM
	GBhWSlk8VWRrC5+3wERFYQ+nbhNcr34YhEg1xP1I46yUsqibNTsuAWoYpsp5HIOAjxHJJSZgHasl2
	a9Jljcv1tVmU9TufubMDSZaTcoB954hw74PeKtSH93i9nH0i/763zPqCHAFA/2eR4N2/AMzMXs3h0
	U5a53W+jpUN511kntTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuP3-001O2P-EI; Tue, 16 Aug 2022 11:06:33 +0000
Received: from mail-fr2deu01on2136.outbound.protection.outlook.com ([40.107.135.136] helo=DEU01-FR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuOz-001O03-Pu; Tue, 16 Aug 2022 11:06:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaVdoeYRyYfcDXy3kkU7kObOzTNG0+ljHpqBhlsDl6W+BHT4GK2Ke5HW3sGKPCzTO2BHgTI9x/aUm88IAhfjdoBKmJGxQ2QLPiUArcpTY7tYoELbFePB8Qx1IpbYCFxBm0Ea/LoAuMxlBikVtB/yxNiNBGdA2+Ps/KDMn4Sz+3IpfwHaWzmdmPPqOWbVSxjPkyWjWn8nQe4SSsuk9GJacB8nCNbEMJuBEOzGWepxuUuXKqiGJkgbmN8yd750DvAn/Ru4FkO+IZ+YpbZiR8bu4L9mdkHJ7qMUt/62KirgujGGnscilyHDwhFm3wobSoTJnhPhXqJf+C92DCdUmjweIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN46lB/h2d9WLTHbs42LUjpecfRd/vEfFzqKdcTNWPI=;
 b=Cg03FCL5PVTLtSi7Mq14i0jeLQWERgK5norNjmXu+UWyZz0M670Rybw2gd93ozjGV94HWOzYxIrQzgV2xl/9n0v9Ld8vntpuJDJihvNPrjZdeF1il/3OVL1KLb52hlNloxR/yfJcGiYrwbh+9sgRJYPDBGnQ5pMMFi94wPDCwZ0K9S21UhidZh/r0JHpHqHRPjJ1aouKyvS9lw6MsqlNDjaVw81zmjgLGd6czBftJ4qTfUenomcyX9RzDI2m+asARC2/QLmoG43nosLCHz8QJLbR0dKH5r3IR7mVsEAC6jC948yb6S700ynfeYpiSGoyw9oKcu3J67A8ffy9xRA3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN46lB/h2d9WLTHbs42LUjpecfRd/vEfFzqKdcTNWPI=;
 b=xakJB7/OzBPXN6U91v+g07V42XN0CGEgLwkO+NMQlBts9XGxwwzVoGhf5WXLBxSyVBJTk8UGPQKaIeh8mExh70aPIyZUpAXiDVfFDjWgyJv8FFKMMXybn305VyFgNEw1MI9Xl2UM63GCRIiR1qs7p6kwCQ3ydNlyIsU24BouhDM=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR2P281MB3374.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15; Tue, 16 Aug
 2022 11:06:21 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::140:1f52:1b5a:ff64]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::140:1f52:1b5a:ff64%3]) with mapi id 15.20.5546.015; Tue, 16 Aug 2022
 11:06:21 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>, Matti Vaittinen
	<mazziesaccount@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stephen Boyd
	<sboyd@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Vetter
	<daniel@ffwll.ch>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
	Miaoqian Lin <linmq006@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Alexandru Tachici
	<alexandru.tachici@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Guenter
 Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Michael Turq uette <mturquette@baylibre.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jean Delvare <jdelvare@suse.com>,
	Alexandru Ardelean <aardelean@deviqon.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, =?utf-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
	Robert Foss <robert.foss@linaro.org>, Aswath Govindraju
	<a-govindraju@ti.com>, David Airlie <airlied@linux.ie>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Topic: (subset) [PATCH v2 0/7] Devm helpers for regulator get and
 enable
Thread-Index:  AQHYrjODEkpLnjXMEEiLI50ZP+QfK62wH3oAgAACzICAAAq3AIAAJvoAgAAjS4CAAAUigIAAG40AgABkpACAAF8TgIAACF4A
Date: Tue, 16 Aug 2022 11:06:21 +0000
Message-ID: <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
 <YvtzJw3jmocM0JFi@sirena.org.uk>
In-Reply-To: <YvtzJw3jmocM0JFi@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9d10a0-00e1-4730-3b8c-08da7f7759d7
x-ms-traffictypediagnostic: FR2P281MB3374:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JEOHD44VOtNcXEQ3WA1+/ZnR536KQADtE6KysmmiNu6+XuaqZgIHRHm4Moi2I/EyGdjkwLjOA4ahE9VdSLtJW8Tnd2RPdsX/0RmkowY2fx161SywG7TgnPPmXUt5gGOK1vnaoqHMLSan2yZj1bnAP4bX/rxuIDpdvwfk4MD+zF3iUThw4goN6yDgX5ZmtNXd1Yd70/l0yP6h05T49oR/LcJnSU+kelDd8FddB2zR0KJoE5QA8+hdmC59MRdNxfggWL0VdyEVisLFpAmvYlYSwCIbXUNmZci3bxt8pTDewMJvOACTOAbPs3x3U1USo8lAlSpUxI2TLvFcViKCLFvya68BOZstTSf9N3e41tjFSOl/Sgjb8uFcJfc9ReHzn+4TFF5gabZkyA9RUxf45Wru7x9rBcmV0bPARawGJHTnyGas9FsAPCCbpVw+WbMBCJOmdbbld5V5Mb8agfYkJqPc/tyhwoo0MaUNXf2QCCRhuw39ELyj/kB/5XxWYBghlK57az20ZUGYRGEstNLVQMIH1Xs+U1t0t53jNHfwfQNSTuPo0XvpDJxEoRGVgUul3fyKkC5UNTxVgYm4Qu2MP0wxsMAj/aIY9BYONSBIJZiOnodcqr+DTJq0TlDzeVqrlA1rYOfYxS6tvOC058zQewIoe58H5kpzmywE270MNP2bzdDM93Tk2N5TqMbdEuVHWgYKqNVp/tCwNwcSvVyb21szHI6trebwu1eP4V79Z7th2VIkcPHZovqkh+jxYDDLRbFsuXytAL2MRPp4x9wAJ/dPqnDfDrN1Tu7bxCEQMkjPqDxMY3iMYHX4aSy+321GXpTzW4dV3A+mehUJDQSltJCEJeDc2Di6qHiievWaXKSHh/8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(122000001)(83380400001)(64756008)(66556008)(66476007)(8676002)(4326008)(66946007)(66446008)(91956017)(76116006)(6486002)(71200400001)(110136005)(54906003)(31686004)(478600001)(316002)(5660300002)(86362001)(31696002)(7406005)(8936002)(7416002)(2616005)(41300700001)(186003)(2906002)(6506007)(38070700005)(38100700002)(6512007)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L3JlcUVhK0pNWlFQdGR5OXRwZ3RtZ2dHZ0svYWh1RWpwUmVhRGlGQmtMdXI2?=
 =?utf-8?B?eWhsUHAzVE0xS2tObzk2MktCOVlYYXg5MUkxQkx0ZGdTa0VjUkdHM0YvTVZ0?=
 =?utf-8?B?ZzhYcnNuUUZGSGRER21FdWJUYTZBRE5pYTdvV1MzTFVPdHJhYmRwUUMyVTNz?=
 =?utf-8?B?WFZCb2tsZjMxOVBwTmtUTDNRQ2xzV3Z0a25VSFMzSTd0eGUvN2dWblFWdFJR?=
 =?utf-8?B?Z2VxN29pZlE4VnFFYW1pdXc4eFFEMHFaWlIvcVFjSHFGczFBSkQ4MHJldFBl?=
 =?utf-8?B?VE5pSEZBWWtiK0JTYzY5MEJrV1ZpaXcybk85RlpteUtWcGxFOVBIbnJaY0pv?=
 =?utf-8?B?bTNyVXUrUVUwQ015dFV4VzR1OEh6OWl5MjN1SmZ5U2VtaGs2RW5zQzVwU2Rv?=
 =?utf-8?B?UVE5L3BTV0dEWXp3TCtCT25URXNaYmJlNmlsbUtoclEydnVjTy9aQm1qRnYz?=
 =?utf-8?B?L3YrT3VMRUxNbWlYbWl4cStpM0NVTVA1N1IrZXRCK3dDd1BrYkpQYUxnV2tu?=
 =?utf-8?B?QmQ1MmZST1VLQ3NJRERnMjZIckNCeXRGUExhVGhGME5MR0UyZ1ExZjdJbmhM?=
 =?utf-8?B?UkIyLzJLUkpJTXpFWnZmZzBBNnJNWXMwZzFEQXBNKzQ5QVhNZjJsTXloblh3?=
 =?utf-8?B?MWt2cytCekVMWURTR1hpcnBTQktreWtaUlcvMGFPU3B5UnpVSnd3K1I5NHlL?=
 =?utf-8?B?clRkblRxUUUxenpBeVFNQkdLcDU2NkVWVG1hSXZLV1RJUi9ZdFJsOEtoMGgw?=
 =?utf-8?B?ZndQUGNoU0ExVkdGcy85TUlONmdqdlZxd3NqL1FkVnFUdTRuN1ZKQ3N4K3Qx?=
 =?utf-8?B?NXpwTWF4R3hhK2hiSU95MUM3Z3dLd2k0Q28xaU1YVHB1YTNYeS9vQjVBT3FL?=
 =?utf-8?B?c2o0b0hHUWRCaTdEZWxJZ1ZlbTJ0am56cE1ybDVCYkx2MFFDK1RKZlhJRm5s?=
 =?utf-8?B?am1Ia09SN1JkMnh3b1pMWlRjQUVkWWlDaDFoYm5UalBjMW16WklHUDhoY0Y2?=
 =?utf-8?B?L256bHgwdjMrNnpRMEtZM3RQaXpkbUlNeXNyOTI1YTlCRkJ3ZFFjR0hJMGRF?=
 =?utf-8?B?Q1JCYkNtQ3J5aUlSd3gzVEVZZCtQRXZOdk96NjA5bFYwVlpER1o1czNSZ3pH?=
 =?utf-8?B?ejlDcUJxZTJLWjRvM0EwcTREaUVBbmVWV1B2eEE1RThaQXhURGhSMEVsbnVo?=
 =?utf-8?B?eHZVbXdPR0hybW9idE01YzZJdk4rNzhXQkFhckNwQ0xlay94RWYrc3VKUTN3?=
 =?utf-8?B?Q0hNYkZRS2pqRlNnQXFSakpyQXNraVlwNU9CQ0oyeHBoaUl3c3NGTDRzZVpv?=
 =?utf-8?B?NGF4dkpvV3hVQjkzNHJyNENlVjZtd2NUQ1JOaVBJSnhobk10TVVKSlhnT3RW?=
 =?utf-8?B?RGdVdHZWR29aSlBEUkErTGJNUXJPVDNuNU9wV2JBcWJPMUk0OG4ya25OdmdP?=
 =?utf-8?B?RkExbU9qMXF6a05Nc0xaWG9lRnhjcVVxVjVQdXR6U2RDUnhQL1pVVFVHMkpP?=
 =?utf-8?B?VlB4RVdncHJwQ1RjUlpyaUprSzkrMlVwemJBV1M5amM1UTlJK0phT0ZjUHp1?=
 =?utf-8?B?K3A5VUtIMU5taUlqTTQvSDVVMFlmTlNPcENBSWlvN3VXdUtWTFM1VUg5clpn?=
 =?utf-8?B?WnJldTZOUXpEcFY4QTFLYlhVRVQyVHlpc0c4ZHRpKzU5WDFDZ1hINVpNMDli?=
 =?utf-8?B?TlNrY0tXWTdXZVFPYmpOVEtCeHhIVi9VYzE3VUN0b1dpUjdDY3pzUWtzZHdy?=
 =?utf-8?B?N3hDVm1wQ1lPMmpxZG5RaXBuV3gxV2NKZEEwVElvTW9HdHN2RkZPWlJ0am9G?=
 =?utf-8?B?VS9MbHV1akJuVEZnQUJCamlHNVErTDNuVytGN21udGc0L3Z6bWIwNGljb3lJ?=
 =?utf-8?B?M1dESG5ucUJJVEx1QUZIV0hzZDNYUVVnVjU5Mk9kS25rTU9iZkhKYXlnWko1?=
 =?utf-8?B?WXN0cjFBS3I3M2ZqcHZaOGhQV25wR2tRUEhEZkcxNVpDOGtPVzdYV0FaSnJ0?=
 =?utf-8?B?VFh3SFZhMXFReGVDY1ZhaGUranZMU0NDVnk0ZE5SU3pzMGhtWWQ1WXdxdFF2?=
 =?utf-8?B?aHBtbFQzU3k5VE0wWG5SSXE3M25UL2ZGKy9tVFE3VGRSV0hnOFZUa2lDTkpn?=
 =?utf-8?B?UHlXUW1KNE00QVVzU1V3T3BPUzA3ODcwUDlLdkZYdWE5Tml0R3ZhZDdZNlpT?=
 =?utf-8?B?Nmc9PQ==?=
Content-ID: <DE09DB7109145549B96B378A5A8EC059@DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9d10a0-00e1-4730-3b8c-08da7f7759d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 11:06:21.0992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I2m4IuNo55QdlrmrAhlrVILgMjktx5+QC6No7RkaoEERBWroBNEpkJshgZDawKe5Cl0qgGmQGTKIeZn+LZKcOjeJSIoe5Gm6k0vFR2vdMCPS/+jZ/B+cFhZvrXJU1MK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_040630_259462_03A2C367 
X-CRM114-Status: GOOD (  34.55  )
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

On 8/16/22 13:36, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 07:56:06AM +0300, Matti Vaittinen wrote:
>> On 8/16/22 01:55, Mark Brown wrote:
>>> On Tue, Aug 16, 2022 at 12:17:17AM +0300, Laurent Pinchart wrote:
> 
>>>> These devres helpers give
>>>> a false sense of security to driver authors and they will end up
>>>> introducing problems, the same way that devm_kzalloc() makes it
>>>> outrageously easy to crash the kernel by disconnecting a device that is
>>>> in use.
> 
>> I think this is going a bit "off-topic" but I'd like to understand what is
>> behind this statement? From device-writer's perspective - I don't know much
>> better alternatives to free up the memory. I don't see how freeing stuff at
>> .remove would be any better? As far as I understand - if someone is using
>> driver's resources after the device has gone and the driver is detached,
>> then there is not much the driver could do to free-up the stuff be it devm
>> or not? This sounds like fundamentally different problem (to me).
> 
> If a driver has done something like create a file that's accessible to
> userspace then that file may be held open by userspace even after the
> device goes away, the driver that created the file needs to ensure that
> any storage that's used by the file remains allocated until the file is
> also freed (typically this is data specific to the file rather than the
> full device data).  Similar situations can exist elsewhere, that's just
> the common case.  There'll be a deletion callback on whatever other
> object causes the problem, the allocation needs to be reference counted
> against both the the device and whatever other users there might be.

Oh right. Thanks. So we're discussing (a corner?) case where the freeing 
is done by a callback that was registered by a driver. Callback being 
called for example when the refcount for a resource gets down, 
potentially long after the driver was gone.

I see the problem of releasing something with devm in such case. Still, 
I don't think it is something we should avoid by banning the use of devm 
- which is useful in many other cases. It'd be equally wrong release the 
resource in .remove() or doing any other "double freeing". To me this 
boils down to educating people about the life-times.

I wonder if writing such 'release callbacks' is compulsory? I mean, if I 
was writing a driver to some new (to me) subsystem and was required to 
write an explicit release-callback for a resource - then it'd surely 
rang a bell about potentially double freeing stuff with devm. Especially 
if the doc stated the callback can be called after the driver has been 
detached.

> 
>>> That's a different conversation, and a totally
>>> valid one especially when you start looking at things like implementing
>>> userspace APIs which need to cope with hardware going away while still
>>> visible to userspace.
> 
>> This is interesting. It's not easy for me to spot how devm changes things
>> here? If we consider some removable device - then I guess also the .remove()
>> is ran only after HW has already gone? Yes, devm might make the time window
>> when userspace can see hardware that has gone longer but does it bring any
>> new problem there? It seems to me devm can make hitting the spot more likely
>> - but I don't think it brings completely new issues? (Well, I may be wrong
>> here - wouldn't be the first time :])
> 
> See above, something can still know the device was there even after it's
> gone.

Yes. Thanks for the education.
I'm still not sure I understand how devm changes the picture. I'd guess 
in the case you described above, the user-space would still see the 
device until it closes the file and the call-back cleans-up. I guess 
freeing the stuff (that is used until user-space drops the handle) 
anywhere except the clean-up call-back is wrong - be the mechanism devm 
or driver's .remove() or any other. To me the key is still teaching 
people to know what bits may be used after the driver has been detached.

Thanks for the explanation guys - this has been insightful to me :)

Best Regards
-- Matti

-- 
The Linux Kernel guy at ROHM Semiconductors

Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~ this year is the year of a signature writers block ~~
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
