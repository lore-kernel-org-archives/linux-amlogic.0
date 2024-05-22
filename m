Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F531C25B77
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2024 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYQj/GsSzC0FDMetbqtZDfVBcIZ9TtG5M7Ai/ujNBD8=; b=x5aiGl7m/qPUdT0cbPY15tsWh2
	LM82i4nIJskBct9WWdrMGqrAXrNibGV2eyBWfZO3aVjoltb0PwS/4D9UrjLpOzU5Vu00CM6Bafhve
	oe2euVrm1+2XwjH8nHEquSJnVjEhvREi2SeL2f2ypk2AC3xpqZYGlMuVKy2k5kAnV8nYM0+haJSCA
	YQs0qHvnom32d54mlm7mDs+AHGZiDPcLNuaiRvKsR4AtFqLaQk3rkR9rirL6B8sEGp9befGZGvhLD
	gxqyHcco8AbxPd+2SK+Zawlu8aV5NEXeE72KJLWy1t6Ml+Os/VwsfY05XowbxJkMp3QeTNy3Yaj4y
	dsaG9rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9f48-000000024AK-1z0R;
	Wed, 22 May 2024 06:03:08 +0000
Received: from mail-southeastasiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c401::3] helo=SINPR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9f43-00000002475-3RSi;
	Wed, 22 May 2024 06:03:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7l6jHua6bmXSeXb9Yb+RpsnxDiPZxRhi+8u8kjXvCtNvGqZ08eoaI4+X1YxnqRDrcYWFX6lbHgScMgDbyj/+obhnH7WU1mXWPopEiiwN5tCcdtXnvCinHNaoZoujMKAG9/PM9bCOhl9c7R4VVhsDPEGI2aoCLBCCAtSqZbVHSFxAhR+vB4LHgBcRamNO3k3gOVJ/x6NrSLNydD3Qon/TnVWrS+c+rOFEMhDJWF3aCGPMfqcQyTF26yc4DCFLn+NDnIVNJF6jEQx/NmMAXEP65sOOhci8fRRQQ3EcjPODavPH307XH0/tFoMR1Z6Z6ZbmzMeqR7FIoNXHoPv8fYS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NdsCMUFEMUP0t/WCjrjOlu4+egumM9O4MZe0kqf+jc=;
 b=TN7+2Zv6fSX1EIISRh1J2B3imXxbm/MTBMMybwagt6gtsEQnmapkRIM7lwkcgp6hKeIqAcPIf1P/mHF1S2OQAHKhruNiUoBNLcfTK//oSwYpvxr5cjzRfOqmani/SmE7juFENSb34F5k+EFEzHbTMMqY/916LndvoP8ATnLAkSjHR+YPcX8gayNPcsSL1nX2DOVusVTdxRPLGaPXSprrpHITMYHZ8V7ksAC+y+WXiQT92mdM/6EJTjCeKLLtkNge67+m2ebBMkgxBRAuJ6pvZuEUwa5OXSG7CyaD4KuZa9y3NoIEBlFwlIH1AHIDSPECwJpvptkQpfeAUyUIhUv1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NdsCMUFEMUP0t/WCjrjOlu4+egumM9O4MZe0kqf+jc=;
 b=UCY6ZJPhKB+ML7r+SXs+Ban/qHzPnVTvAi+kvJUmrSxJfU+udnPwdUGP3xvNo1VS+4+qa4zfM8UUvmzdVBUw7mLaXN9e2AXOMmNCM3GYMHNgM6qAdc1yxJcFUpW+qImrlRoCDJvTLSBYtzHmO4x/jFmTtEkS/y9h1COlnavXxl/z2YwnpkT2I0PhVXcr4BP6kewvLHDnP6eAAeawAbS49ke8Uuwwgd+yUSP62vIQRDtVMULt8mbZ4obuEEw7v2gRoZmYMSdUgFQ3YPc+3j494iJHsFs53cxMs/tNOMq5nDgDgOdse14mQ5S41y/UZNklD2Cu5mpUrgtICF/nklK5lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Wed, 22 May
 2024 06:02:43 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::340d:421c:7221:56e6]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::340d:421c:7221:56e6%7]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 06:02:42 +0000
Message-ID: <7e8d7140-b119-4d12-a10c-216c1426c40c@amlogic.com>
Date: Wed, 22 May 2024 14:02:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH v5 1/2] pwm: meson: Add support
 for Amlogic S4 PWM
Content-Language: en-GB
To: George Stark <gnstark@salutedevices.com>, kelvin.zhang@amlogic.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 "kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
 <20240521-s4-pwm-v5-1-0c91f5fa32cd@amlogic.com>
 <4fd9fe90-1da0-4b8c-8bc4-18b7a4dc38ab@salutedevices.com>
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <4fd9fe90-1da0-4b8c-8bc4-18b7a4dc38ab@salutedevices.com>
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|KL1PR03MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 926daccc-b809-419e-9cb5-08dc7a24cb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckdieXh5MzBPR1p1ell1MDYrMFVSRWNJcGlGNDU2L0l3V3JWRUlYYXc4ZDZZ?=
 =?utf-8?B?M0IvZVFlMWYrNDNWbVJ0eU5oRDR2dU5rbzJ5aVNzNEhpR0laMXFWQ1NsempC?=
 =?utf-8?B?V3dlYlY4WlI4Zm81bUFrbk1YNHltbUFUcXV3WittRVlxMVdFenZKTmR0cllo?=
 =?utf-8?B?bjBDWUhqR2V6Y3BycEJ1Ui80S1NMKzdTM0hlOWRzTTExeFgydXprcnViNWNZ?=
 =?utf-8?B?eVUxNmxVWHhKMHpzSkV5TjBKSFV4NkdqWTM5Z2NoSGhQRUdVZ29ndTZqdWdU?=
 =?utf-8?B?VVBkdWJsWFplenlwdHpzTVArMGlEN05WcWw0YVoybzNvZ0l5cXZYV0hjcjRR?=
 =?utf-8?B?T0pLZGtMd1VCb0hsQXk1VjRGcnVyTW5pTER0Y2ZKZXhaVWdxQldubjdNYWRi?=
 =?utf-8?B?QUdNakhPajFUZEsvTm1xcVZZd1c3K1VJb3AzK2txc1FOalBubHpVY1hNRG1j?=
 =?utf-8?B?dDBUenJ3WWVIczQrb0JoZEI5cEFFQ2hvcDJUSEZNeE5NZnF1UGpwc1pySWlv?=
 =?utf-8?B?MkZDTTZNbDc2VjExLzBhSjkxVkdHYnNEai92dm44QkV2dUFKNlNNaE93OElF?=
 =?utf-8?B?MzA1OTl3ajEvUDdSR2ROZ3lQblJUdzJ5K3JVNXcxeG9IUVh1Tkt3cUZ6NmpV?=
 =?utf-8?B?WTFoZHlOeGJkU0xuclRFR2V0U3hDSTNxYjY5R3ZFaHl4bWwrbWFwTmxzc3NE?=
 =?utf-8?B?SmtqU0YrOEdqeExJNkptRUg0Wm11ZXd4Z1QzcSt5NHFmMHhtdk00N2JZSWRQ?=
 =?utf-8?B?R0p6Mjd2WlUvNE1COU5qKytjWUkvYy9iSnA4cFFCN2VXd1NKQ0tFbEQwSzNM?=
 =?utf-8?B?NVpsb0pPUDBWSGZ2L20wZW5WSDJkZGtwYmNWV3N5WGNBYlVjZVhVK0xoZktN?=
 =?utf-8?B?N0pxY0Q0aTlrL3RmQ1BtQm9MYy9jMHdZbmFiOW5teXlEVUkvaGJFS0RRTzFG?=
 =?utf-8?B?UXAwdEQ0OWExR2ZKcWxwY25jQVJBTXFRaDlYcG5zZUE4UzNjNVRxbk5FRk9l?=
 =?utf-8?B?TTlweTNPMmlEUkJQdmpJcmNIOUI2Z2pvVVMzWkd4WW9ZaVdUR0h3bzc5Zkd6?=
 =?utf-8?B?VThiditxUUJHcm5zQ1JEZHBWcTVvYnB6cmJqRHQyQ25oY2pDV2dZV1M3WUFE?=
 =?utf-8?B?SldHeitWU1NmaGVBSmk4eE5Wci9ZSUlQY1FodTNONjcvNVEyNWY2bDY4SkN1?=
 =?utf-8?B?c3pXTWJyR0ZCL3hkcTJ5WTErdjQyQVZPVDRiNHZDaWFaZmVUVU9IbHFsLzgx?=
 =?utf-8?B?Rmk3bTVJZzQ0Nll4dXVlUGtIVlhXT0xGUkJrcUNpWWkvVmxobkxFK1Rma0tD?=
 =?utf-8?B?czNTSUtMaEFSWjJGamlHVjF1bHdNVWl5YTdQbHF4cnNmeHZWQXFxaFl3ZXdF?=
 =?utf-8?B?OG4wcVRJM3NCN3Z3V3RhQ2dhQVkxRkUzU3o4WlRScXhpWmduOWg0MXMwMWFx?=
 =?utf-8?B?UFRtR0ZuZHlLeCtacW9xS2lqL3l1Q0xNYzd2OGplV0NTMUlUeVhqT0p1RWFQ?=
 =?utf-8?B?UG5TdzljWHRnRzZ1SnJSaHBsVVU2WS9YNjJwMUhRTW40WFpvR2hoV0NqUHZQ?=
 =?utf-8?B?TVpiRTBzbHVEdE5TZktPNkMwLzBvVXVUU2tMRjlKbWxCdGt1Wld5azUyU0xy?=
 =?utf-8?B?RmNYTTh2Skl4SzhkeVZtdjZNTzQwOVVEdWNjd0YwTldzRVhJWXFaamYySTN3?=
 =?utf-8?B?TjVCQlk5K01tMEMzTzJ3bHByVHRGQ0s1eElBZmw5bjBORm1Fa3ZCQVNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTIxREp4RXM3ZGtUUjNpQVNXSisrT0Qra2todzRIalo2dDZpWThjYW9TVEJt?=
 =?utf-8?B?TUlVWnJXYU85V1F4VWlxUS9ISGxJN09TMjBaa0p2blB2eEFKcUs1cCtpRHMv?=
 =?utf-8?B?alRrSCtESjlrakovbXR1Y0NCTnZyNFljYUV3QnRzY3dGN2pWcHZnUlBEMVl1?=
 =?utf-8?B?aU02YUJoQlNBZFpuaUhsUjc4bTlxZjJDanI4TnltYkFpbG1IaWNqSnlDbldQ?=
 =?utf-8?B?TFVFL2NWdnpRdGtTYnQ0cHBrc2E5c0J6alFtcFlqUS9KV2sySXlwU1ZWY1li?=
 =?utf-8?B?OVZUWldUWCtxMHZEZHVYYzZVUzlBRllGUDFRc1V1emY3WldncnR5b0VwM0xm?=
 =?utf-8?B?ZG9sV3cyNytDVmpZSXN0bi9tM1JDd05UOWNSbjdvTmhrTkdXbng3MUNxdTJx?=
 =?utf-8?B?cUU3dzZRYytrNFVwUXRTQm1pS3FwTXJjc3NrSzRSVTBjMk1WbnJYTmJaMEcr?=
 =?utf-8?B?Nzg1b1ZhZFdMeVpUb3VZd3dTWDRPZ09hdGo2L2EyaHVkZ3JIdi8wTmNKTmZB?=
 =?utf-8?B?Z3U4dmJhdXZpdDY0UDkxdUNneHMyclhzc2ExRUFLT3Q4ZWRneFlOQUxJRFVI?=
 =?utf-8?B?NndhZ0lsb1U5ZnRxZVc1b29HY2JXYnVNaSt4Y1M1WVlEcUhJZzVVL1NtdEVB?=
 =?utf-8?B?KzV4S2Y5aFpQVVhtN0J2Z1JUY3BudzdKVmgrZWFUUTkxVE4rQTU3R015RUpR?=
 =?utf-8?B?eXk5TjRxbEdhQmIveDN6dXBCUTZiUW5EenlCZGIvWjl2RVJQR2J3U0prRHNG?=
 =?utf-8?B?RzBkYS82RTNtd1JoUThlTGYvL3orZlVsbEtVWk9kWHVsWDVTL1J5aVFDV0VT?=
 =?utf-8?B?ZWpSS2tVNmNoRjlnUG9XaUxDeXNYM2JUUTR1eWhWWUI4Rk5SUFlNTUV6aEJO?=
 =?utf-8?B?eGxjSzFTcWtCVkxuT1V1TVVPSjNnTHJ1TWc3aVQyZTVFOFdONGR0UVVmV0pP?=
 =?utf-8?B?UDk4RFhKdnhVWFkzcjBURnJZemtDcnZLNWJCcStHWEcvQmkzMDE2TlV4M2Fm?=
 =?utf-8?B?bjVQYjI5Z25xR3JpOHEvT1M1WWpoR1FrNXd2ZURHdjFHSDJnS290RjFFZC9M?=
 =?utf-8?B?SjlOYXVSZGszT0YydmNaZ3UyNDVFZ3dGaUxtU0M3NnRkSTdiWXM3WS9iT3Rw?=
 =?utf-8?B?WjN6bHZBN1Y2V0ZhcXd3bk16K3VDWlhTOUpYRXpsZERUTFVydlFBeS9DNFAv?=
 =?utf-8?B?QUtoSGxDaUJWS1llNmlVUDVJcHV5WnZCZ2UvdmszaUdsZy96cldEcnJHT2Uw?=
 =?utf-8?B?bUlUSTJvLytBV2liSVJ6L2xHZlpLWHpwS0NmK203R0c4d0V6VDFLbUphZlA0?=
 =?utf-8?B?Y2JoZ1pKWDNSUXMwbVNSbWhCTGRRN2pIVjZGQjc5NDcvTys5Um5lQTgzQmVm?=
 =?utf-8?B?N3EycVZja2M0K0Nwa1ZOVjhCWHhLZGhxekcrUTNmRHRJeHdac3ZFSnJ1SHdv?=
 =?utf-8?B?ckdndTc2SzVDRWxraG13SEE3aXNjSVRrMUpTUDRVcVNaRzhPZ01IR1JyM0tx?=
 =?utf-8?B?TGo0enFMczdMR3lnbTZTVzZNYmRTZnhvdDhPVVJXQTgzdGFFMWMzNFZWWUUr?=
 =?utf-8?B?aStsdjRiQlZVM1Ztby9SSTZzZlhzQ0FWZUhCNnBnMmtJSCtCZU0vM2hhVi9K?=
 =?utf-8?B?Q1FodVM3dGwzSkZ3V25jaUw3L1F2bUw4bVJsNys0OWRoZm9KZjNpbUtyemdy?=
 =?utf-8?B?eXBGQjZmNWZITTlkczVBUXRuLzNRNlUxZGdHSG8vK1RCQUdUR0FsQTZvTGlh?=
 =?utf-8?B?T09pMXlqQmlJK1A5VUphTVZmUmVRdVBNeFlwR3RpM1U4dUFyTElKS3F5VHVq?=
 =?utf-8?B?K0NmR0x6ZzJ6ci9rNXh3SlVpRjMrOFltU2lLZHB1TE5zb3lIcURaalNrc0dX?=
 =?utf-8?B?amxUUmUydExDTjNoZk8zdTVEL0tXY2dCZVZRSC9GclJsbFo4Z29KcVJ2dGt0?=
 =?utf-8?B?WWpvQTdtOTNyM2VEZzJ3MWQrbDhYUC9LVEp5Y2ltWVF6cStSS1VVTklWbHFD?=
 =?utf-8?B?TDNSdlZvcGRiOVVQSVJLQXY1R1BrdDRQdDUzTXZpYS9RR2k4Nm13UWh2K0xR?=
 =?utf-8?B?MERETUkrQVhCWStOUXhvU1VYaHpwTkl5djJWTTRGUlpHaHZ1T2IvK1RiaGZk?=
 =?utf-8?Q?8iwd9ntLjkkeJ/fPYTrlpk0+B?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926daccc-b809-419e-9cb5-08dc7a24cb34
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 06:02:42.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGQ8lV4Oqamdmqp5pRNsbIHGI4GZUW7H0CRWVICF0GChnaX6J3hOaC7YujwFXELCgFqQy1EkpTLaAm2jugWSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_230304_078926_EC55C32A 
X-CRM114-Status: GOOD (  23.20  )
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

CgpPbiAyMDI0LzUvMjIgMjo1MCwgR2VvcmdlIFN0YXJrIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+IAo+IEhlbGxvIEtlbHZpbiwgSnVueWkKPiAKPiBPbiA1LzIxLzI0IDExOjMxLCBLZWx2
aW4gWmhhbmcgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBKdW55aSBaaGFvIDxqdW55aS56
aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgQW1sb2dp
YyBTNCBQV00uCj4gCj4gUGxlYXNlIHRha2UgYSBsb29rIGF0Cj4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC92Ni45L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjZGVzY3Jp
YmUteW91ci1jaGFuZ2VzCj4gCj4gSXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlCj4gQWRkIHN1
cHBvcnQgZm9yIEFtbG9naWMgUzQgUFdNLgo+IAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdW55
aSBaaGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWx2aW4g
WmhhbmcgPGtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jIHwgNTMgCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMKPj4gaW5kZXggYjJmOTdkZmIwMWJiLi45ZmVhMjhhNTE5MjEgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jCj4+IEBAIC00NjAsNiArNDYwLDUxIEBAIHN0YXRpYyBpbnQgCj4+IG1lc29uX3B3bV9pbml0
X2NoYW5uZWxzX21lc29uOGJfdjIoc3RydWN0IHB3bV9jaGlwICpjaGlwKQo+PiDCoMKgwqDCoMKg
IHJldHVybiBtZXNvbl9wd21faW5pdF9jbG9ja3NfbWVzb244YihjaGlwLCBtdXhfcGFyZW50X2Rh
dGEpOwo+PiDCoCB9Cj4+Cj4+ICtzdGF0aWMgdm9pZCBtZXNvbl9wd21fczRfcHV0X2Nsayh2b2lk
ICpkYXRhKQo+PiArewo+PiArwqDCoMKgwqAgaW50IGk7Cj4+ICvCoMKgwqDCoCBzdHJ1Y3QgbWVz
b25fcHdtICptZXNvbjsKPj4gK8KgwqDCoMKgIHN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbCAqY2hh
bm5lbDsKPj4gKwo+PiArwqDCoMKgwqAgbWVzb24gPSAoc3RydWN0IG1lc29uX3B3bSAqKWRhdGE7
Cj4gWW91IGNhbiBpbml0aWFsaXplIG1lc29uIHZhcmlhYmxlIGFsb25nIHdpdGggZGVjbGFyYXRp
b247IHR5cGUgY2FzdGluZwo+IGlzIG5vdCBuZWVkZWQKPiAKPj4gK8KgwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBNRVNPTl9OVU1fUFdNUzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2hhbm5lbCA9ICZtZXNvbi0+Y2hhbm5lbHNbaV07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY2xrX3B1dChjaGFubmVsLT5jbGspOwo+PiArwqDCoMKgwqAgfQo+IHlvdSBjYW4gc2F2
ZSAzIGxpbmVzIGp1c3QgYnkgdXNpbmcgY2xrX3B1dChtZXNvbi0+Y2hhbm5lbHNbaV0uY2xrKTsK
PiAKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVsc19tZXNv
bl9zNChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4+ICt7Cj4+ICvCoMKgwqDCoCBpbnQgaSwgcmV0
Owo+PiArwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gcHdtY2hpcF9wYXJlbnQoY2hpcCk7
Cj4+ICvCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+PiAr
wqDCoMKgwqAgc3RydWN0IG1lc29uX3B3bSAqbWVzb24gPSB0b19tZXNvbl9wd20oY2hpcCk7Cj4+
ICvCoMKgwqDCoCBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWw7Cj4+ICsKPj4gK8Kg
wqDCoMKgIGZvciAoaSA9IDA7IGkgPCBNRVNPTl9OVU1fUFdNUzsgaSsrKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2hhbm5lbCA9ICZtZXNvbi0+Y2hhbm5lbHNbaV07Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hhbm5lbC0+Y2xrID0gb2ZfY2xrX2dldChucCwgaSk7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihjaGFubmVsLT5jbGspKSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIo
Y2hhbm5lbC0+Y2xrKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgY2xrXG4iKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqAgfQo+PiArwqDCoMKgwqAgcmV0ID0g
ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgbWVzb25fcHdtX3M0X3B1dF9jbGssIG1lc29u
KTsKPj4gK8KgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICsKPj4gK2VycjoKPj4gK8Kg
wqDCoMKgIHdoaWxlICgtLWkgPj0gMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNo
YW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW2ldOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNsa19wdXQoY2hhbm5lbC0+Y2xrKTsKPj4gK8KgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqAg
cmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3
bV9kYXRhIHB3bV9tZXNvbjhiX2RhdGEgPSB7Cj4+IMKgwqDCoMKgwqAgLnBhcmVudF9uYW1lcyA9
IHsgInh0YWwiLCBOVUxMLCAiZmNsa19kaXY0IiwgImZjbGtfZGl2MyIgfSwKPj4gwqDCoMKgwqDC
oCAuY2hhbm5lbHNfaW5pdCA9IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzX21lc29uOGJfbGVnYWN5
LAo+PiBAQCAtNDk4LDYgKzU0MywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9k
YXRhIAo+PiBwd21fbWVzb244X3YyX2RhdGEgPSB7Cj4+IMKgwqDCoMKgwqAgLmNoYW5uZWxzX2lu
aXQgPSBtZXNvbl9wd21faW5pdF9jaGFubmVsc19tZXNvbjhiX3YyLAo+PiDCoCB9Owo+Pgo+PiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSBwd21fbWVzb25fczRfZGF0YSA9IHsK
Pj4gK8KgwqDCoMKgIC5jaGFubmVsc19pbml0ID0gbWVzb25fcHdtX2luaXRfY2hhbm5lbHNfbWVz
b25fczQsCj4+ICt9Owo+PiArCj4gYWNjb3JkaW5nIHRvIGFscmVhZHkgZXhpc3Rpbmcgc29jLXNw
ZWNpZmljIG5hbWVkIHZhcnMgYW5kIGZ1bmN0aW9ucwo+IG5ldyBuYW1lcyBzaG91bGQgYmUKPiBz
dGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhIHB3bV9zNF9kYXRhCj4gYW5kCj4gc3Rh
dGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVsc19zNChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAp
Cj4gCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX3B3bV9tYXRj
aGVzW10gPSB7Cj4+IMKgwqDCoMKgwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOC1wd20tdjIiLAo+PiBAQCAtNTM2LDYgKzU4NSwx
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAKPj4gbWVzb25fcHdtX21hdGNo
ZXNbXSA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNvbXBhdGlibGUgPSAiYW1s
b2dpYyxtZXNvbi1nMTJhLWFvLXB3bS1jZCIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5kYXRhID0gJnB3bV9nMTJhX2FvX2NkX2RhdGEKPj4gwqDCoMKgwqDCoCB9LAo+PiArwqDCoMKg
wqAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0gImFtbG9naWMs
bWVzb24tczQtcHdtIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZGF0YSA9ICZwd21f
bWVzb25fczRfZGF0YQo+PiArwqDCoMKgwqAgfSwKPj4gwqDCoMKgwqDCoCB7fSwKPj4gwqAgfTsK
Pj4gwqAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25fcHdtX21hdGNoZXMpOwo+Pgo+IAo+
IC0tIAo+IEJlc3QgcmVnYXJkcwo+IEdlb3JnZQpUaGtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIGkg
d2lsbCBjaGVjayBpdC4KLS0KSnVueWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
