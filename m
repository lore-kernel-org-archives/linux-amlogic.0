Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E2DC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 06:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR9Pj1G2iSKgreugZaXEKM7Ikorzgw7Qh2mLXt8yMJ8=; b=HwoFr9jnnJzrK7ry+0KtN6Btkc
	zwGdm5O2z6CME+/nicUgHB87ES+bzX2xCqa1ew3CQx8T+HSQcUbZOg6ys0VAdw4m9eUW6/3+mpOty
	0r0Nj1LZwBO0KMk9nBMS5Ol7DWwPLbXqtsB7GflP8H2Gb5qjtGHRpmuHPmpOn5O6zTMY4eLO3f9Dm
	CNn8p5OcRL4hfyyEbYqTOMd4M08RvHUeD7dQctz89/p24fi1yHCXuDRANTLHKVdFPlt6H5tX7N675
	hHezNPYIxMWON2m0fGJvHE2WX9HleelidzqCSGtvFEwMxYExmS1zzMfNHclZxwRVEWp5IKR6khURl
	0FDOy6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVi8-00000002mst-0QyM;
	Wed, 24 Apr 2024 06:02:28 +0000
Received: from mail-sgaapc01on2070b.outbound.protection.outlook.com ([2a01:111:f400:feab::70b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVi3-00000002mqP-2Bms;
	Wed, 24 Apr 2024 06:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIW5SZTMrv8ia78AeMghr4tlHE731VKm0DwvL1o4aiLLo8uB82rm4Osc2aJKAggHMK3lbOLZrgEmr2fBKPa7lXmdCEbRBva4cDCIknvhSPtRSBiE1N75XppFOcExVk7XHzRNHTkJcUIhFbhgx+EV37d+VvOJZYhiGSixZtuHHQyCtQyTARysCAhgoxVtjfX9juHSLzsvxuO9Id12z3I569khdJBdCVxLc5V9BFXl97V4FMTsum3y3OX1E0CDYO+mAZWor44zYGLH19mH+TE45H4Zkbxev+Xe4guHOksgtGY0c6P7O+pQpZUcm5ivLqtTeTLH88SarHBdvhfXR5O7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul6S9ex/KQtUwLtSB5gQDfvg0a/OkznGg2X/xc2cmMQ=;
 b=eRx53B23xemJ0YSdRpA/QHyUe6zjPQbJiRXm4WfFfPp3ktg8LP1KH0vHga/yjqeJpkxuWhQ+Fkj3ZSaeQreMX9zWMAheHlz+sFm7nQHBODiNSZRuwvMaO/o9OmzlKk4w2OCLTc4YoSUkt/My5OKNdv3WSwKAFZ8gW86Mekfcslcj7MgWZpvIlKOHo+scnVroJmZgzERHkAfyuof/mUfDW/j0F8iLJUkfMEk1pLesRpEsRdR81kLyuRJzk0VT4tq4JDX1JGN9q2S70AE/z3TRO/IzSy3C6DBRnGVLjYshJb0cO+ZumWU9g88j4EoibjNKzIzJdrauXA9xPADjHp0ANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul6S9ex/KQtUwLtSB5gQDfvg0a/OkznGg2X/xc2cmMQ=;
 b=JkDucVWV3ydm+pDStiZB7ScCrlOQYp7qJCzpM8zyA6ezF8rqxSbthl3iNI+4Zz02NmpR1vNGK4r7+h7KpvUEwnoIWkwL3yfi3gYq+Qanpd+q4VXa/p0JxOGGDQCE3XPNSIw9dhfk7P0Kh0TzH3R9UD55BcKc9JMqg19NMwejeDXXah5TnSlGILrYQJ2/xIvuq+GC5YVKtQcW4j80knqVGj2dqxaqgFYmxaHR0cQlF2qTBYa6KJgvM0OOyVH7W85vRqaClea3tJ6Fd8p1B65+DNMyZACtEXAvbGeTg9W6UwR/vi/Z2vLtU8Zi2VQ7IBjCFZXlvWzDT1sj/6kEEcC5sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB7387.apcprd03.prod.outlook.com (2603:1096:400:414::10)
 by TYZPR03MB8134.apcprd03.prod.outlook.com (2603:1096:400:453::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 06:02:10 +0000
Received: from TYSPR03MB7387.apcprd03.prod.outlook.com
 ([fe80::1569:6058:25d5:5466]) by TYSPR03MB7387.apcprd03.prod.outlook.com
 ([fe80::1569:6058:25d5:5466%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 06:02:09 +0000
Message-ID: <7ae09b97-70d6-4613-bc1c-b58f09f24531@amlogic.com>
Date: Wed, 24 Apr 2024 14:02:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for meson
 A1 pwm
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor@kernel.org>
Cc: George Stark <gnstark@salutedevices.com>, u.kleine-koenig@pengutronix.de,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, thierry.reding@gmail.com,
 hkallweit1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com,
 Dmitry Rokosov <ddrokosov@salutedevices.com>,
 "junyi.zhao" <junyi.zhao@amlogic.com>
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-2-gnstark@salutedevices.com>
 <20240423-wildcard-smoking-90b50f00da50@spud>
 <1jr0ewezvc.fsf@starbuckisacylon.baylibre.com>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <1jr0ewezvc.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To TYSPR03MB7387.apcprd03.prod.outlook.com
 (2603:1096:400:414::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB7387:EE_|TYZPR03MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6e3076-5d04-4489-8f94-08dc642413fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVYyL2kyRnhoK0tvZkRERUNmbjBUcnRBVEQ3Vkp1UDYrR0c0NmU4eThyWGRG?=
 =?utf-8?B?NVVzYllOd1VxbzhodUhKemxmSHltU3VTZXM3cTFlMzhiZlBGL1FKUENqL0pS?=
 =?utf-8?B?NzZod2IxOHpneDQ3NFlMakRLRGpIRUNyTlh3Z1VyUU41QzJPT3ZqQytUcEg1?=
 =?utf-8?B?QUpJNTU3MTE2SUNTVnVldG5BNzhkM0hMZTZXeFNPVlNJZ2JEZ2l4M2twaHhy?=
 =?utf-8?B?aE1XTnRCWG9qN1JrMVZaNnV1V2xXTFB0b2xkR1VJM3h2a0dWenJ0dTRhT016?=
 =?utf-8?B?ZVJ2Rnp4YXJKOXFzSmhlTWVzdTg3Q2RmOEdtbHJJbU9Xa0NhNGhGOFlLajhY?=
 =?utf-8?B?YWVsQzNlaEc0YStTR0hSeGw3V1pUR1Juc3hVblJHcTh6NUs0SlgwM2phaFdk?=
 =?utf-8?B?M2ViNFJyUDFvWEhUYk4zbk5tY1haak0wM0dHbmttS0VzOUdhS1YvRi9lRldn?=
 =?utf-8?B?aStuMm9GWXY3elJ5UDRJbzZwWFNuWEE2YWNIQUdNSlFEWGw4T1VqMXRxZThl?=
 =?utf-8?B?QzYyWTRjclFucU44K2o4MDVpanJyK3JzS25FalErc0NmTm9CdXpHYk9OR2xj?=
 =?utf-8?B?dU1VR0lxRG9CWlNCTDB6aGl2WlVWVzVINCs2bDVMSjRjQVQ3Z1dtWS9zb3Z6?=
 =?utf-8?B?bUdpUy90OUZYT3pTOS9SMGFjMGUyaDd1eVlmeTZkaXlnQ0tjM0l3bWExc2RS?=
 =?utf-8?B?aGJkQ3owaC81VnptOGNUaWNMZWIxOWNHUnVtQ0RWa3ZxQmM1WnlJUTBCemtE?=
 =?utf-8?B?c0pyR3BGM2tmeDJPSHRNakJvK2hXMGVGcHNaYkRxVnd2YTZWakFLMnhhWk0r?=
 =?utf-8?B?L1dGdm9Uc0xPMmEwNW5ySll0NFQ2dGNWZytDb2wwemxQcVBnQkNMajJ3L0xY?=
 =?utf-8?B?KzVmWDZnUkp6MDFGUnBiSXFzS0tDcjNZQ21qRm9qYkFlTEE0RE1Va2VGbE9r?=
 =?utf-8?B?czYvcS9tNmNZc21LbXJsYzB4Y0tQZkVwNmY0aWh5MWNQcjVoVWtCUTVNMVYy?=
 =?utf-8?B?Z0JvbU5ad0dSSm16UWxHMjFMckI1dFlGdDhXTzJiVkVsV1l1K21mWFlnQkxH?=
 =?utf-8?B?d2hNQVUvbTVoZVF2VDNWa0dLSm5vUHoxNnR5Sm1jT3N1dm5vZTVxaTcxY0hp?=
 =?utf-8?B?L3Z2SkJML1o0bjFBeDI2eGVoUmdFcVlRdUtIVUN6ZE1USEwyTkthdFdvbFI0?=
 =?utf-8?B?U3BsS3N0dlJuVXkzWGRXOXg3ZE1KS2Q2ZEpsa1FtVWxHaTBmQVVqWkxlcHBF?=
 =?utf-8?B?VFkrTER2NHN2eFAvYjZSZzNZWktCQU9iQnF6ZmpOdDM5eTBoVE9NbkcyWGhu?=
 =?utf-8?B?R29wS0k5Z01sa1BQSGZKZ2hIOWw2RG9xeFdKZ1hMdzNJYmRRMFFMMVIvZDRt?=
 =?utf-8?B?eDZzaVhxNWorSVZKSTZXUEZYQmFuNVZocFpWT1F4dFVGSFUyVkRNejR6bUhF?=
 =?utf-8?B?K0FtNWdYbWJaWElOcENwdml6Y3FGSnF2bzdMV3dDQXJEQVR5dHhWZWFucFFs?=
 =?utf-8?B?ZFpLRGQ5TTVEQVptekc5VnpZZGhqSk5ReUh4K25xNUluc1Q5NmRaUWl4VFV1?=
 =?utf-8?B?dUR2aEpJNU4xeDVpTnVCcStoN01GN2N3WVBPNHNRSUx3bmlKa3VJTC9lT2tW?=
 =?utf-8?B?N1dMc01qSmhvdGI2Lzg4d2IwdTRMK1lMNXVhOFlyL0hvWERjQUM2YWpwUVBY?=
 =?utf-8?B?TExXZzdSdzlxdlhLaXpGSm9nZ3NtanVWZVlhM3lONjducldUYlpRUEJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB7387.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1ZNDh4WjVEempxN0hKdUZMWlU5TW5SU2lRM2dhek5Jd3hLVWZtWkFibXNt?=
 =?utf-8?B?aWpwaVJ5QjdvNG4wRllkZ3BwTVZBUlI0WG5xM3hIWjVhUm43d3R6WkJVQVp3?=
 =?utf-8?B?TVNZWlRJQld2NEdvZDZKa1JkNWE1cXVLTmJTZlk5TjNUMkRNVG5kcWs4QnNl?=
 =?utf-8?B?Wi9MQlBMVndjb015N0dHeVhBRjI5MlgvRFd2S3VJQ3ByN1JPN29RQUd2QnJG?=
 =?utf-8?B?VU9nckwxZCtkTWNXVWpKV3MyRzBlM0NDVEFGRk1Xb05NMHRjT2hDTFNFVGls?=
 =?utf-8?B?WjAxaUFPekI4UCs5NGVrc2ExZlF0VmZPQUVPMmlVREptTXBZWEdtMWJibEhN?=
 =?utf-8?B?SXNSbUtVc3d5R3VjK3JDdzNNeE45VUZwSHhuajlKK3NXakZ0a04xOGNjYmla?=
 =?utf-8?B?ZUxtUzNtV1FnS1FLaWwrajhSY1FvYzlaTHJnUnNGWG1BblltVEsrQW1vdGR1?=
 =?utf-8?B?Y3FZUkxXOTVZWG9XUWxOOGFaT1hXajlGMEVTNjF2aTgwTnZLTzRPQnV1cHNO?=
 =?utf-8?B?QmUrSVArL2VPS1FYWUR1NG9YMVM0NVQ1NzBWbDJuS2Jta0NsV1Y3VHJEMDB6?=
 =?utf-8?B?L0F0aFlnZjlLSWhYaFI3SEgwYkJaY1JuUm5Qd0ltdTRpZDUyRnRFT1RJZ1BU?=
 =?utf-8?B?YVZjOGFJcnBWQkxkUWJhSmJvTlBYM2NEYnFHbWNBNlpzVE81aEd0OWNOek5J?=
 =?utf-8?B?TGMxVmx3S3lIUzZnOWtwYlRGaUU4eG42clF0TWtZWmJLazhMMGxVS3d0RHZM?=
 =?utf-8?B?OTI3UVRhMjRiREF4bGhlSEZROExzM1N3NVRmVm54WnlXT3ROUlNsK2lzN0Nr?=
 =?utf-8?B?eUIvanp1UkNRTkZkTVNlS3dodlNURndXUERVWXVocG54OVczcWFkR0NCejhX?=
 =?utf-8?B?UjBwQytyeitLM0xJdVlaQnQrOHZxMzJVMDNFV0k5YlhydDMzU3l1aG5XeUdI?=
 =?utf-8?B?c2hobkdCT3ZvYXlqN3ZOaHV6VVdLSmpUMkNvMmdIYklWdjFvRUQ0Z2hUcHV1?=
 =?utf-8?B?ellPK21kUFoyWWwrYm5rQWRwNGJBNkV6V3k5SFNzSVNWdXEvOHU2dkdsZkw2?=
 =?utf-8?B?VGZrcEI2dVZMdEVtNnhUYjRwclI4Ty85T01iS3ZHOGcwRFBhZUpQdS9yK1FE?=
 =?utf-8?B?QUkzZGR4RmZRTEJESDU3TlJHNmhGbGpVZFdMK0ZWYmxpaXc2TStLd0o5bXlM?=
 =?utf-8?B?Ui9CTlRzZkhkY1dkMlVEdEZmTTk0UFNtcEtWM2ZwSHhtR0IzditIOUNJTjVu?=
 =?utf-8?B?N3VHK3NnT2VrenBwaFRNdktBTDRBSlpPSG5TdERTOVViLzhSclNrN0pGbmdI?=
 =?utf-8?B?WkdDTFAzOFd4VWh1NElCa2RuT1BRNXg4MXVNcjB4MTV6ZnpyQVk3aTdnOUEy?=
 =?utf-8?B?Z3dCN3RFVTBRWDg0aVdtWE1CeHl0cTRpWlJERHVyalRKOGFUY0RZNUthSy9o?=
 =?utf-8?B?N3pwa2tRQWVjTURhT2YvM1F3RlJUclBpNFpwRWtEVXRRbGlPOFgxcng0d0px?=
 =?utf-8?B?TXJBb3VzVkszOERHNVNtYUtaZU5QSTR1bEJGc0VEMk9YN0Z6ZlptVm9Ka0Ev?=
 =?utf-8?B?SHRBRWxnMW9aSmlvYlZYaVNrNUpETXEyaTBFWlRDUmx5TUNRcE1mMmtzYm5M?=
 =?utf-8?B?cHJQNUZiS2pwbW43WGdYYytrR0gzSzhGWjZ1eDU0eVV6dFJHcGdDMlNVVytY?=
 =?utf-8?B?TzhzMHNrbkhoSXZzbnlNWDVkWkM5L1U1SU5ZT2ZteURzUUlWS004dFA5UjMy?=
 =?utf-8?B?YVY1S282a0RLRERIdTZuT0VmNXIrOE9UZDRPNzlLRjdoMjNGUzFZTzBOTjVF?=
 =?utf-8?B?dkVwdFpkWnlSY1ZvT0dZWmt6VzRqbkRuMkFoRFcyTVlQZW5uTzJyemlSTWFk?=
 =?utf-8?B?ajk4K3RxQXVpUjVXbVYzSUtFNkwxMUQwVjQwRUFuSVVwajhWbmRPeWM3cDFq?=
 =?utf-8?B?QWNRTGFFOGtLWHdTcHMyTjhpWXhVS2lpVmNiSUQ4b0V1Zys4NmR5Y3hva01W?=
 =?utf-8?B?THNiTlpwZDFGSDNnQmdFU2w2SXZTdVlKUnpVTmNycEY4TDZIcnlyQUQ1RjJU?=
 =?utf-8?B?Z0xMaXhydy9lTyt4U0dYNGdDa2RVbTA4U2RKSUJsalFOR0YrNGhycUd4aGww?=
 =?utf-8?B?MjFLekxqbnA2U21LQW1tUW1BMHZvMUxldGdST3lRbjZwMUpDOS9Bbkg3d29J?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6e3076-5d04-4489-8f94-08dc642413fc
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB7387.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 06:02:09.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XCrhJnQ8/NMgcAGrwn/ZcSIc+Wge1WX9ZkHfr8aoqiw2c6QqS/rw01ca1hZLUvQfB/FYeHMyoz7ah7IEIJ6LWDK45O1kRDNPJVXaW9v5c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_230223_588441_6B9FFF53 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2024/4/24 01:44, Jerome Brunet wrote:
> 
> On Tue 23 Apr 2024 at 17:56, Conor Dooley <conor@kernel.org> wrote:
> 
>> [[PGP Signed Part:Undecided]]
>> On Tue, Apr 23, 2024 at 07:10:05PM +0300, George Stark wrote:
>>> The chip has 3 dual channel PWM modules AB, CD, EF.
>>>
>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>>
>> a would sort before s.
>>
>> With the re-order,
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Thanks,
>> Conor.
>>
>>> ---
>>>   Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> index 1d71d4f8f328..ef6daf1760ff 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> @@ -37,6 +37,7 @@ properties:
>>>         - enum:
>>>             - amlogic,meson8-pwm-v2
>>>             - amlogic,meson-s4-pwm
>>> +          - amlogic,meson-a1-pwm
> 
> AFAICT, the a1 interface is exactly as the s4 interface.
> So a1 should list s4 as a fallback and the driver should match on the s4.

Hi George,
For your information, we are preparing S4 submission.
Thanks!

> 
>>>         - items:
>>>             - enum:
>>>                 - amlogic,meson8b-pwm-v2
>>> @@ -126,6 +127,7 @@ allOf:
>>>             contains:
>>>               enum:
>>>                 - amlogic,meson-s4-pwm
>>> +              - amlogic,meson-a1-pwm
>>>       then:
>>>         properties:
>>>           clocks:
>>> --
>>> 2.25.1
>>>
>>
>> [[End of PGP Signed Part]]
> 
> 
> --
> Jerome
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
