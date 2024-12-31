Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E5DE77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2024 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as2L0f2JUIVjz62sczgZIbLxjZd0qZQrYkpOBr72+hM=; b=HZlEYsxCQuzA5EcR4XMicnoPcX
	JGVGYhum/54bJBeON9knoDMiqSTkMOp0X94AWoLnDv2deja15E9fceUnH91FPOS/p5NGRPSY/IF9v
	Mi3mzTE9CZTKbzw1p3AtfHneJnziqFVvLsHFawnjRVPyVO10JWzntdlAAWKbQXLvJOUpYD5bySRFc
	BXZ1LOUdAmGum1dxrH/sCKQrnxom0R3sUY7eDhlYjDmMKAWkOcB3vXM+xjk9Zj0kUgf2exm6DMzBn
	o0iCexbi3dcUcElOeMOzS5cSd04q08M90gp0ph4MliTiQxfl6tCtUMHROU+9hHaIZbhO8u4iHqW0E
	RvZc+zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXbW-00000006pBt-1lDT;
	Tue, 31 Dec 2024 08:27:54 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXaK-00000006oxS-1yCl;
	Tue, 31 Dec 2024 08:26:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qygXglab36AThAJ8Lmuk/ObIia00MZ0wk+Dhkvn6aqc0NTKOG5/v9XbhK2YyLF/O9I9MQ+bZIr6DrWKaujeqa0bqh8HkyWPqUoJ04lLxnELUwqpN2cKzIvaGVF7sKQohwcsM3GZ201flNbLl7Ow1Pc4Os8cieXXvwbvBvD4E3dz+0FZS985vtrAuzz7CSZO85I50w7u2bpd11EJWk9OM/qJT9dfFVRbIilvY8bVMrE07OZlMDLcBy7ao09/0GWatGBEGCN/YE4CroJTkiLSa2wn1bpvQpBNJ4YeYzvqouF17occIAPlNCjC8u2geEaNQF33dyUKFrB4/PMrYJTYSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+pPClQ0EjatEVLB1gsxZ7ue6rWRJED1BOeQ7x8va0k=;
 b=lOPP1qRvsj91z6EFYNIpQNYTsjDeLfjpvMgsThi6VJlkzXtRt4SG2GkJ+/lscoIF2jhH+tFsQD68yYm60g6G3cBSls73aKtKB3NGCqplkIxKCKxKBntfsPyJa1P+UTa9Y2w4T/aGe6zm7lCLLBqqAdrzwDVURxNyUqGCiLdw3K9c2IfZs6a8w6VyewIi+5JIAiU3dnpTqX8oKs3L5vWruuLwX4weMiS6fU4Kh19rbjgSAN9vPnvU4giRMokofuGc/txv+BSPoi/zGkpaT6tNK7HwKYIYO6Q1C0Gl09dFW6DOqU8crqqelXCYtnwh9JcBKA4P7Od8xl8u4fGXGD9/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+pPClQ0EjatEVLB1gsxZ7ue6rWRJED1BOeQ7x8va0k=;
 b=oarh8sT8kR+zMOhutfrQ6EemDVDIocl4cvqOSvDPGFW93Xt4lv/tb8EoeWJ3xm1kGb77JdGsU8AekH2Fpw1gIqaI231dZcHpjqXERy2y4iCXHvjyuTHyD6scfJ+vANpOY+ix7XRMg4oOpwvaxpAsO79r/OZlqjZKRNvNEoEKcLeG+BbGyFC3HUofnYBWaLc3i9L3R9K5+7OI0yQd94HB0xktGRbrT3VUYK1HD6S9GVqZzya9Lulq30oCGCk4y+x93L9SwhLLznP8hVq+I3rPooIwheFjZIocFSGxLGNWUxUTNYbX1kXrrt7PCxoLOZVUj/1vE8T4FTsfpbBIl9GrMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB6582.apcprd03.prod.outlook.com (2603:1096:400:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 08:26:27 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 08:26:27 +0000
Message-ID: <4647512f-5be8-4ebc-8897-8191e1fb5cff@amlogic.com>
Date: Tue, 31 Dec 2024 16:26:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Huqiang Qin <huqiang.qin@amlogic.com>,
 Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
 <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
 <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1a7958-4ff6-4f8b-3782-08dd2974d232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODk2aW11aWZqbEpoWDRRQU1PRkRxWnJWMjh6WkUvZjF6TmpsdEUvMVA0elVW?=
 =?utf-8?B?MFV4YmRFTGxnNWIrSGQ0Z0NHeDdTNjhLSU5BWjNLTjJNRmt6VlZzbm9WTCt3?=
 =?utf-8?B?NlhTRVdkakdEZ1JIbjk5a01GUVR5NjhZaWVDSnpTcnBDRkdYNlVEVUNLb1Fz?=
 =?utf-8?B?Tjg1UWMxcDFLSjh6cXFVVzZRMklOeFY2Sml5Q2djakZ4U0dWN1BRVXEyVld1?=
 =?utf-8?B?VHE3dU00WmthZFVEcVdoWjBldjAzZHFCZXlUSCt4VzAzMzYvNGVZcW94NU9G?=
 =?utf-8?B?Y0g0K2tqak5MUHJHNUQyeGtneXF0b1hPT0pOcElpWmlJRnhhalBGTG01aGo3?=
 =?utf-8?B?cW1BTjJmaTZiRXlRTzVUZUVVSWxBMUxkYnBhenFQN1MwOWM3QjBLZEF4eTFM?=
 =?utf-8?B?Tk84SjZvVWZoQnF5R2pFTHhYemxlN2VwK3MzOGgxZXJrcmJuSVRkc2dNNEFD?=
 =?utf-8?B?QjREUHhoNExhdzgxUTlqMGJRck43N1E0dFMySmpud2pOcEsrVUJBMnE2bWhY?=
 =?utf-8?B?NVBqeWFOeHppaDlvZnY2Y3RlUXRRRzJpM3ovMG9JWkRDRWRZVU83WlZHcmg5?=
 =?utf-8?B?UERPT1pUNVM2Z1lWVUxCc010Q3dZVmFLYnBnMlpzUWlzdVhNeXNQaWQwdVY5?=
 =?utf-8?B?V1pVWWlsZFVSQjZxc2pkSDJSZERYc0QyeU9wMDIwSTN0RzhSMHFrQVVZK0xi?=
 =?utf-8?B?OEZnU3Z5UC84S2piWUNyazRoSW9Ua3RUUTZoL1pwSEJ0ZkhSeG0xdGwyei9K?=
 =?utf-8?B?M3VpcElLelI3a2c4TXdXaUhmdTFCK0R2Rk9wUm5zeDREU2tTSXJvbklmVnR3?=
 =?utf-8?B?QnpsSEQwa3IzcFhRb2FkZUI4QmxMWlFmdXVCSFVSQUpzdE9CdmhzK0Q0eFI2?=
 =?utf-8?B?bDJkMkREWnZtTTN2QVJjUW03b0hwMjRMWmxSdG4vZWRndmxodXAvdWtuS3Nm?=
 =?utf-8?B?RVRDM2lSdGZ5aXpkQ09PeWNmVDdLRmxnMUtOczd0bHo2TTlmNGE3MVpoL2dz?=
 =?utf-8?B?QUtEbUJxWDBDOCs3akFOSFVnU0RmSWp5MlJab2tRenRCUHBUeHJEeUF4Y2xP?=
 =?utf-8?B?Mm00NWZtWjZDRURtWFpxNnE0TjR0T3Qza1EybG9aRTNCR3lTQkY2ajhGMTVh?=
 =?utf-8?B?bk84ZXlmQ0dwdWQ3MDhZV0Ewams3Z2ZDN0c5N29nM3FZWk9MVUF6RjV0dm12?=
 =?utf-8?B?czZid0d0cWZVdE42UVFOWGhpeW4xS3BDc09wMlBhQzZZSWl3TW54OFRPS2Rr?=
 =?utf-8?B?Z1RWK0tnbFpVY1k0Q1pRMm9zUDA1K09rOTdXVGVuY3RuRThKY0xtd0gra29Y?=
 =?utf-8?B?ZUttb2ZDWGM1bUpteGhqQzdjQ1I2UFVHalc2akZrTjZvRWc2L2VEU3FJVlNB?=
 =?utf-8?B?WUNBL2N5TWwxZk9jUmFFek9ScDN1dGNqWERGQnpmMUFWNVhBcVdpd0tWaUln?=
 =?utf-8?B?cG5qRjN1WFladDlPUVJseFFMZnR6NFdOQmlYWWRERUJFZmhtTWhhTmtqVm1F?=
 =?utf-8?B?MnQ3OUluSmFBSnl4Z3VKSHhVaC90UytQL2JUNjdwL1BiRVdNUy95K0FWRlAr?=
 =?utf-8?B?dDhHbElpUDQ0OEM3ZFA2WXNBVTFrMEpza085M2hVK3MyU3llS091ZERiNWRi?=
 =?utf-8?B?RGhTZk12bmJOL1pPemxvclR3U1o2VVFiQWUwR0piTnlleXMxeGpQVUFzOEZD?=
 =?utf-8?B?aXZjeCtqalFqMnJUeTMxNVhCRlV2bTl6YXhvamFaWWJob21Gc1l3b1FvT3Zo?=
 =?utf-8?B?VkFYTkVtTWpQWDJjM3NZeFJXSlZ2bEZEWThEMEFIRm4vZ2VGekVkeHBvSTBS?=
 =?utf-8?B?TnRueWtCMVV6cUtlYkM3b0kyajNLdDZ2N1A2eTVhbTdaeDJ1SDRxSG8rTXBk?=
 =?utf-8?B?dVE4dlJmM2JFQUF0WEpQYXljR05QdXMzK1M0Kzh2bVZQUGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3psZldEK2VKUlJEcThLU2YwaVZYS2VSdUhiZ1VFL09XOWs2ZGdEQVd4Z3lr?=
 =?utf-8?B?amtJZ1cvYzBQTWp2WDVCZFVFaFhjQnlVRFVvcDkrZ0U2c3BpcUNGTEhESlVi?=
 =?utf-8?B?MExIdDZSTzlSWXJZUmF6VmI5TC8weUk1Z1ZlSkl0Tkc3T0gyZDBVZ0xabVRq?=
 =?utf-8?B?QlVuZmVmeEhLRkh6SGZGcnlXOG5sMGU2T002a2txeDk2NzNrV2pyRnArS2Z6?=
 =?utf-8?B?SzVyS1ZBVE5kdlAwTDc5ZGw3R1k5Y1ZqU3VMMUZwZkU1TUJ5a0Fjd3RVck4v?=
 =?utf-8?B?NjJ6SFRPdDdodWZUckhwL1NReVhLTEZYcksvT1lNRXltQytqRjJ4U2EwU1RG?=
 =?utf-8?B?b0dGNUY4RkhaVjh2cFJuQzI3Q1FaY2Z5Tk1ySzNOVm9UaDNNSTZ4Q3czelZz?=
 =?utf-8?B?cWFCdEZFbGtYZndhcFZZSU9OcitWWFdnZ2ZGcjN2cjhaRnJwazNsd09nSUZF?=
 =?utf-8?B?UFhLWHk2UDd0UW94L1lJdUoyMGNJc2RMbUw0R2lwbzNNMnFlM2RNd081bmFy?=
 =?utf-8?B?dTMySFFhZWJ4Z1dIYkR6bXMvM3BmUURyYk01Q3NLM3hNRUp5OUtKUjVmUVFs?=
 =?utf-8?B?WEZ5MEdTbWlhZFpkU2RQbStiYWZ2ZGVJS1B2ZmtBVW9SNW9PeXJJN0lXTGc5?=
 =?utf-8?B?MXNNa0E4MHlXc2tpV2taTExVQlA5VTQwb2FPRXBVYjlXaW4zR2NQVUtVQ0VI?=
 =?utf-8?B?MjZXTGJHV001c3FNVnE0MDBCVGMzSk90NTlocXBvZEhsUXMyc1MyZkgxLzV4?=
 =?utf-8?B?MThQWGd2cm9hVXZsbTJaY2RpM0F3ZkVPQmhleC9lSllNekxTbUdJcFFQc3Iv?=
 =?utf-8?B?MGkwYithU2VZaXpYZjlTZzBRcUNralFwSkxoaFlweTVHdEJER3pzSGJmMVhj?=
 =?utf-8?B?Qm1jU2g5WCtQYkwzN0dTV1haNEg4UU0xTWhEYjM5MHA2YkUwNC9WOHU4SjhN?=
 =?utf-8?B?eHJhVjFGQ3pnRlJ3b2t4OXU4bmhzSDZUYi9NS1IyU05LS2NFUU5FVUJCaG5K?=
 =?utf-8?B?akZsU3JFVGlHaEJSdmJwUkZBblZITGpxYW9oL1htaXJDQmhCRFBKKzNXZEk0?=
 =?utf-8?B?Ymk4N2pGY3p3NnpnNVZhQk5hNDQrcHdlWloxbFVUdXRleXRINDhoZVBOemp4?=
 =?utf-8?B?eE9kQUkwZXFXTlVpbDZHQi92N3NsZHZVRk5TaDVyMUFQMnhWeUxXOFltMk5X?=
 =?utf-8?B?Q0VBNkhqTGdJZE5mdjBoMHJvU29CeDJrMVBRN0hLaWJzR2x6UjFVSmRYY1Fl?=
 =?utf-8?B?Q1NrY3M0UDVUaDFXVW4yS3pkc0xQbEh6ZGcrUnhBb3FQRlNwVHgwaGphWmgv?=
 =?utf-8?B?WTVYSnVJWUFmaVNZazMrS3NRU2lIZTN0QUQwRlk0dk1QZXFIbnIzeHJLM1oy?=
 =?utf-8?B?OC9SV3NBRVJDM1p3N1hxaGN4RmNjZ3VPYklEa1FhMStpdyt1d2c5ZjNWcm5O?=
 =?utf-8?B?M0cwR0R6Y1VwYW1nSnhmQTBiQk5aOXJTZjRQTndFTzRaYlpvZWtGS0hMRHk2?=
 =?utf-8?B?bjkxSDVyeTlhaEh6OWlIZ1VJSnk5enAxMCtDOUVvcnFPOFRBcFVoQXNpc1Z5?=
 =?utf-8?B?SHlMd3kxSG9BclhyOE5FYWxrTlZyT1kvSE5SbzZaZXY1U2tPOG1jNGt6VDB0?=
 =?utf-8?B?d3N5b0JmWTkzUEFlU1F5SGRZK2ZTbUQ5ZjNOMFdkMHZRTlNESFUvOEYyMzE0?=
 =?utf-8?B?R0N5Q1pBc2ZhRzlWVnBUVmlpc1ZMZW01bGUxUDc4NGR6L2tJdzJmYTJhWHpo?=
 =?utf-8?B?cGg5eFVRNGhmV1plMGluOEFQMDFpd1BwM05LY2xWb3hoL1U3ZC9JWUwwQW5x?=
 =?utf-8?B?YmJtRXFVOXJGMmRCOWtVNW43Tktxa0JGODdpc0RlTmk1eGl0MlhYYW02SFFt?=
 =?utf-8?B?ckk1Vi9vVTYzZnRwZ3Z5cWk3OU1DZGFsMEVBckdkbys2K0ZHTVVZSTNCWE1u?=
 =?utf-8?B?dzRlSFQwZUVId0pMNnFtUjhSQitrcjRWNkVFS1pPWVhFVlF3eFFFbGJIWXRl?=
 =?utf-8?B?N2FjT0dpSzFUYUNDVFVmbE5XK05wVXVXM1ZCeGVkR2RxVUpqOHRpSkswaGNJ?=
 =?utf-8?B?V3VjUmZiYStQdEs4c0QvQi9CSDIwa0w4c1p3anNLRDVNcVZHdmNOTmZmYThD?=
 =?utf-8?B?YjBzdUdkMzNVdDRQWVQzazVyMVdRa204cWNMM0F0cFZzRlVrdnppbXBCRnVG?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1a7958-4ff6-4f8b-3782-08dd2974d232
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:26:27.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HHo7yi+jyiiwEBftGLjLEhXjbD2206EG3vsBCNcfIBwusaf00lOMYSYoMURiWLiXogdT208+VXGfq6gl74cMvYp/21etO/BXQjU44PeDuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_002640_521203_EC7160C0 
X-CRM114-Status: GOOD (  22.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCiAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDI0LzEyLzI4IDAxOjE5
LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE5ld2NvbWVy
cywgbGF0ZXN0IHBhdGNoIHNldDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1ncGlv
LzIwMjQxMjI2LWFtbG9naWMtcGluY3RybC12Mi0wLWNkYWU0MmE2N2I3NkBhbWxvZ2ljLmNvbS8K
PiAKPiBJIGluY2x1ZGVkIHNvbWUgb2YgdGhlIHByaW9yIG1lc29uIGF1dGhvcnMgb24gdGhlIHRv
IGxpbmUgdG8gc2VlIGlmCj4gdGhlaXIgbWFpbCBhZGRyZXNzZXMgc3RpbGwgd29yayBhbmQgaWYg
dGhleSBoYXZlIHNvbWUgZmVlZGJhY2sgb24gdGhpcy4KPiAKPiBPbiBTdW4sIERlYyAyMiwgMjAy
NCBhdCAxMDowOOKAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4g
d3JvdGU6Cj4gCj4+Pj4gLSBSZW5hbWluZyBkcml2ZXJzL3BpbmN0cmwvc3VueGkgdG8gZHJpdmVy
cy9waW5jdHJsL2FtbG9naWMKPj4+PiAgICAgc28gd2Uga2VlcCB0aGlzIHNvcnRlZCBieSBhY3R1
YWwgdmVuZG9yLCBzdW54aSBpcyBhcHBhcmVudGx5Cj4+Pj4gICAgIHlvdXJzIChBTWxvZ2ljOnMp
IGlzbid0IGl0Pwo+Pj4KPj4+IEl0IGlzbid0LiBTdW54aSBpcyBBbGx3aW5uZXIgU29Dcy4KPj4K
Pj4gTXkgYXBvbG9naWVzLiBJIG1peGVkIGl0IHVwIGNvbXBsZXRlbHkuIDooCj4gCj4gQnV0IHdh
aXQgYSBtaW51dGUuIEkgc2VlIHRoZXJlIGlzIG1lc29uLiBBbmQgaW4gdGhlICJtZXNvbiIgc3Vi
ZGlyZWN0b3J5Cj4gdGhlcmUgaXMgc3R1ZmYgbmFtZWQgImFtbG9naWMiIC4uLgo+IAo+ICQgbHMg
LTEgZHJpdmVycy9waW5jdHJsL21lc29uLwo+IEtjb25maWcKPiBNYWtlZmlsZQo+IHBpbmN0cmwt
YW1sb2dpYy1jMy5jCj4gcGluY3RybC1hbWxvZ2ljLXQ3LmMKPiBwaW5jdHJsLW1lc29uOGIuYwo+
IHBpbmN0cmwtbWVzb244LmMKPiBwaW5jdHJsLW1lc29uOC1wbXguYwo+IHBpbmN0cmwtbWVzb244
LXBteC5oCj4gcGluY3RybC1tZXNvbi1hMS5jCj4gcGluY3RybC1tZXNvbi1heGcuYwo+IHBpbmN0
cmwtbWVzb24tYXhnLXBteC5jCj4gcGluY3RybC1tZXNvbi1heGctcG14LmgKPiBwaW5jdHJsLW1l
c29uLmMKPiBwaW5jdHJsLW1lc29uLWcxMmEuYwo+IHBpbmN0cmwtbWVzb24tZ3hiYi5jCj4gcGlu
Y3RybC1tZXNvbi1neGwuYwo+IHBpbmN0cmwtbWVzb24uaAo+IHBpbmN0cmwtbWVzb24tczQuYwo+
IAo+PiBXaGF0IGRvIHlvdSB0aGluayBvZiB0aGUgaWRlYSBvZiBhIHNlcGFyYXRlIGRyaXZlcnMv
cGluY3RybC9hbWxvZ2ljIGRpcmVjdG9yeQo+PiB0aG91Z2g/IEkgdGhpbmsgdGhlcmUgYXJlIGFs
cmVhZHkgcXVpdGUgYSBmZXcgYW1sb2dpYyBTb0NzIHRoYXQgbmVlZAo+PiB0byBiZSBzdXBwb3J0
ZWQgYW5kIG1vcmUgd2lsbCBjb21lLgo+IAo+IFNvIHdoYXQgYWJvdXQgcmVuYW1pbmcgdGhlIGV4
aXN0aW5nIHN1YmRpciAibWVzb24iIHRvICJhbWxvZ2ljIgo+IGFuZCBwdXQgdGhlIGRyaXZlciB0
aGVyZS4KPiAKPiBBbHNvIEkgd2FudCB0byBrbm93IGlmIHRoaXMgZHJpdmVyIGFuZCBoYXJkd2Fy
ZSBzaGFyZXMgYW55dGhpbmcgd2l0aAo+IHRoZSBleGlzdGluZyBkcml2ZXJzIGluIHRoYXQgZGly
ZWN0b3J5LiBJdCBzb21ldGltZXMgaGFwcGVuIHRoYXQKPiBkZXZlbG9wZXJzIHN0YXJ0IHNvbWV0
aGluZyBmcm9tIHNjcmF0Y2ggZGVzcGl0ZSB0aGUgZXhpc3RlbmNlIG9mCj4gcHJpb3IgYXJ0IHNp
bXBseSBiZWNhdXNlIG9mIG9yZ2FuaXphdGlvbmFsIGlzc3VlcywgYW5kIHdlIGRvbid0IHdhbnQK
PiB0aGF0IGtpbmQgb2Ygc2l0dWF0aW9uIHRvIGxlYWsgb3ZlciB0byB0aGUga2VybmVsLgo+IAoK
SW5pdGlhbGx5LCBJIGRldmVsb3BlZCB0aGUgZHJpdmVyIGZvciB0aGUgQTQgY2hpcCBiYXNlZCBv
biB0aGUgZXhpc3RpbmcgCmZyYW1ld29yayAoZHJpdmVyL3BpbmN0cmwvbWVzb24vKS4gRm9sbG93
aW5nIHRoZSBwYXR0ZXJuIG9mIHByZXZpb3VzIApjaGlwcywgSSBhZGRlZCB0aGUgcGluIGRlZmlu
aXRpb25zIGRpcmVjdGx5IHRvIHRoZSBiaW5kaW5ncywgYnV0IHRoaXMgCmFwcHJvYWNoIHdhcyBy
ZWplY3RlZCBieSB0aGUgbWFpbnRhaW5lcnMgKFswXSkuCgpJIHRoZW4gYXR0ZW1wdGVkIGFuIGFs
dGVybmF0aXZlIGFwcHJvYWNoOiBhZGRpbmcgdGhlIGJhbmsgdG8gdGhlIApiaW5kaW5ncyBhbmQg
Y29udmVydGluZyBwaW4gZGVmaW5pdGlvbnMgYmFzZWQgb24gdGhlIGJhbmsgYW5kIG9mZnNldCAK
d2l0aGluIHRoZSBzb3VyY2UgY29kZS4gSSBtb3ZlZCB0aGUgcGluIGRlZmluaXRpb25zIGludG8g
dGhlIHNvdXJjZSBjb2RlIAppdHNlbGYsIGJ1dCB0aGlzIHdhcyBhbHNvIG5vdCBhY2NlcHRlZCAo
WzFdKS4KClJlYWxpemluZyB0aGF0IHRoZSBpc3N1ZSBjb3VsZCBub3QgYmUgcmVzb2x2ZWQgd2l0
aGluIHRoZSBsaW1pdGF0aW9ucyBvZiAKdGhlIG9sZCBmcmFtZXdvcmssIEkgZGVjaWRlZCB0byBp
bnRyb2R1Y2UgYSBuZXcgZnJhbWV3b3JrIGRyaXZlciB0byAKYWRkcmVzcyB0aGVzZSBwcm9ibGVt
cy4KCkluIHRoZSBuZXcgZnJhbWV3b3JrLCBJIG1hZGUgc2lnbmlmaWNhbnQgY2hhbmdlcyB0byBz
aW1wbGlmeSBzdXBwb3J0IGZvciAKc3Vic2VxdWVudCBjaGlwcy4gTm93LCBhZnRlciBhZGRpbmcg
dGhlIHNvdXJjZSBmaWxlcyBhbmQgYmluZGluZyAKZG9jdW1lbnRzLCB0aGUgb25seSByZXF1aXJl
ZCBvcGVyYXRpb24gZm9yIHN1cHBvcnRpbmcgZnV0dXJlIEFtbG9naWMgClNvQ3MgKHN1Y2ggYXMg
QTQsIEE1LCBhcyB3ZWxsIGFzIGV4aXN0aW5nIGNoaXBzIGxpa2UgUzQsIEMzLCBhbmQgVDcpIGlz
IAp0byBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgRFRTIG5vZGUuCgpbMF0gCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI0MDYxMS1hNF9waW5jdHJsLXYxLTItZGM0ODdiMTk3N2IzQGFtbG9n
aWMuY29tLwpbMV0gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTExMy1hNF9waW5j
dHJsLXY2LTAtMzViYTI0MDFlZTM1QGFtbG9naWMuY29tLwoKPiBZb3VycywKPiBMaW51cyBXYWxs
ZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
