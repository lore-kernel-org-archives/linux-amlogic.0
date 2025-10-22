Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44143CCD1BB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Oct 2025 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl3TTsYRj3D2coezYrS9wvsu5Dl9bZuQ7WU2xjLW0ks=; b=En7iVx6R5aaJ5k1WsEW/shZCoh
	PgMbSeET9ji+GHUApHCFhVBzbTWiSEwlZ9J3tZKiNq62Bvs5kl6ZAkPlvzQZD5oq2JH5W44weTnqX
	e07VVhE4wam/e4SbBCYBr/LwHQ/PoUAOE7BkpjMYw/64XuJktVbqa7636CvBuRhmjRuAFeqv7u4+i
	0RraRkMrFWELjCHBA9MXNaRFLD1U/Kc/f3o3W5aS9EqU4TnGTiVtBCv6ao2Z3P3vvvX68aaYdhZsE
	m2lz4v7Obq8Rzvat4gmybV7s1CTSqZ2JHwWOvzuz4tUPabhIWez8ir503+Tnw3GBnfn4CAyheTyny
	8X7SH3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZVl-000000039Zs-0oTg;
	Wed, 22 Oct 2025 14:08:21 +0000
Received: from mail-japaneastazon11022094.outbound.protection.outlook.com ([52.101.126.94] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZVi-000000039Z9-1Mr4;
	Wed, 22 Oct 2025 14:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUSP1qO5d6+Dz2ysgvMgrQtk3caBX2P3lDuDTioa78ijdVx15n/75K8LUPnZFm+J6YZsGMr87102z4VILsgjdypEU5d5jX6LcyqhtlyRC3Y0KcLAktMKcM9BNgEH6B1v7Mo6HlS018893cP8M9XcUBbpDAA5cD0qJLQEfO7rrAvL/Z1/TcEA3NxegFAxoFFI125KFW3kdVwJfKDldzP0OS53pzD4q4TM0VC/6Wtg3rYlFnfZ3B3zGNbHpjHavkkpiitmNkJb4JUw0LecO0/8EGius1osREBY6BHfCAijh74VW9K+bUjArgeugjeG/AHcYHjdK1V8leBzr0cIi+4iEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bEvHpV3yKR755FH2QqqBlJv9jNl9uBTW98Xu7ShwC0=;
 b=Hz0N8nzVlD8amCzJ+PQlXueOvp3p5s5UkQNR/GoKe8ZiANcEh1YR8qfvNL5/qZ2PRUMQoaUuTsIkAEJnO41DnDjP0pLwA2vcQPkcJBC4x8rvzZjzb1pNzqFtM9krxW31D46cG4xL9f2Xv1iiDFaztkrUGKTDDVSRvh2CPjFFS4b+RzXr0k9sRwMGORgkuSqfusWB+0eIX9u5xHbidPg3yAShcwgU4xj9i6lLe8bxeEUpi49KmbVhBooEbGFWsuLjA/M2GW6n50ptnRALNYYmkaHt5mZi2wftFxd8Or5xT3guAGTmcc1JZgTkx8MpPgkXCZdVYGDkELfJSvLey9zzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bEvHpV3yKR755FH2QqqBlJv9jNl9uBTW98Xu7ShwC0=;
 b=FN+A5Zdz5qE+CONExE77dZ7xsIqiGOvV6YhxfOOVrI1d3ZJlwy8t+enB8rztoqjr4+C08MUe4dOZ0OlDdWGJ3oFTLDPsWCO/wx5+7lCY+esQMt3mNxODwYaFmsIeAj2lG2FXPSDmvrfS+Fphz7wCRcw5z3l1q6fM6SwOIRna4c4qUJlEDZkP4hXl6gQQjWHPN7zEL5tl2gIwhvCQJahy202HIiC0A38RLM+aEUmq/PPjlZuwoJJ+ebT466lMbG+kMiWCnKsZxq6GltMuaWVwGIUydmgd1G8e9iRKvdPMy0z1ITmGulXaPu1tlvEfEWon5XqFIE8rqJB02Dh9WSM2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by OSQPR03MB8713.apcprd03.prod.outlook.com (2603:1096:604:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:08:12 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:08:12 +0000
Message-ID: <61c2738d-7291-4a45-aa73-f18528c81ba8@amlogic.com>
Date: Wed, 22 Oct 2025 22:07:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
 <20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
 <1j347b403i.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j347b403i.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|OSQPR03MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: a90824ea-ea64-4d64-b9c6-08de11746f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1RuVGxsbTBIMitIZnhhdlh4R3kwblM0MHdSWENQRnhMQ3lIL1NrTEJXQldS?=
 =?utf-8?B?bVp0VmlaRE4vS09UMmpIblpTUDBPclh1NjUvYzdPWDc3WGtnYkJWdkJOZjVK?=
 =?utf-8?B?RlNmSVEzdWlDanVXbDh0dERUQkdDUSt5MmdiMHBHTlZuemdqdnNXZ05hWnM4?=
 =?utf-8?B?M2VXSjJDUElLTWUzbTFVNG1UUThBd2JabFYveXUvbEEwTlQzR1laQy9PSHNl?=
 =?utf-8?B?bFFmenQ0ZkdsZWVGUDhSbzNBTkM5RXMxN2dqdDhKb1YyeENnNis3ZW5mTFJY?=
 =?utf-8?B?RE96elFjQmFyYjJBS3BMMTYzM3JvZHMzcHpZZGQzbHdtT2ZRa3Z2VlpWWE1v?=
 =?utf-8?B?dFZLQ2V5MFlzbXBUTTVmcllERUpoYWZpWndWNmFrOXJ5TVlSOGg0aTVXd3lk?=
 =?utf-8?B?Zzd4UVZFZEFpczZZZlg2eXpIdU5qdjJzZVhWRExuUTZQRTNCMFNVNW15ek1l?=
 =?utf-8?B?NjY3aDZXZVlMQmlSNW9seDVaT29Vb1BGR2RodkpvdDROYitYdzlMMHBGWU43?=
 =?utf-8?B?dmVKaUVPYU9DV2wrTlBnNVpmcldVaEk5UCsrWUFpY3Z2V2NEM1F1YjJaanYx?=
 =?utf-8?B?Y3l0cUk0VGVvUHgvOWN0azdsL2FmT0FKOG8yQlp5WEgrRWRETWZ2SlM4UENt?=
 =?utf-8?B?WTNpUTl5STQxSnN6S2wzYTdVcTA5RlhOK2p2aWRFMnhtZWhiRjNLR1BaQkNt?=
 =?utf-8?B?MjY5ZFpjMStEMWlWekdhS0N3VFVkT3lqRnBSNHFVZUNidTlCcW5GYmQralpE?=
 =?utf-8?B?QmdqbVg4NGlRNFBPQWloWUxNZXJRMkRvT0ZLQWJOdzBKaDduZE9wS1dVbHRS?=
 =?utf-8?B?K2RxN0NQaWF1Qi9KSEc4dVBoVzZRd0ZibXE5TjFJbXRKanh0S0R5NnlhUDFV?=
 =?utf-8?B?MjZkMW5SbWFLcDV6bm5SenZMN0xFYW9jb0FzUGdBZndKNnBDREQ4WTh6NHM3?=
 =?utf-8?B?UmYybkx6MzVqTTZ5bVFNTHlQQWo2MlpiZitDZ05KMkNGYThoZVQ1T09sMlJC?=
 =?utf-8?B?RjZnZDc0ZFZUangyaVRPVk9ncVRoS1BHZkwzMHhVOTJRVSthWUwxZTA0K0hv?=
 =?utf-8?B?SUd4YjV4Kzd5TnR0OFpUVFFmdjU1dkl2VHVzQThYUnJ3aWlMQ0ZSZDZrTERO?=
 =?utf-8?B?dk85TldJamFGRDM4aloxckZxUUVYMWFRMm5adnVVVkc2VHNVRjVZa2pyQmp3?=
 =?utf-8?B?UVRJNWlnVGllbU0wQ2wwM2p2L3VsaUpmL2NtOXVraThkVU5oQ0lBd1dRNVpT?=
 =?utf-8?B?eGtDRWlCUXorSmluditONWhCaE9nOEF4cHJnZUI4VFZRYzZuYUNZai83VVRo?=
 =?utf-8?B?SXR0Z0NuUy85L29Rd1d0NmVjeVVhNHdvTVdINVpZUmRkcjUrOGVDU0w1TE05?=
 =?utf-8?B?VWFscmlGRjl4UmZzM09xYVptclJrR3Q5N3lwZGF4WmlKelBWYnFaV29hRFJL?=
 =?utf-8?B?cm5OWkQvMWFFVU5JZEtLMTZFZTlrZVQzUVNSNFlZbjJRd21SenNUTDZUUXJS?=
 =?utf-8?B?dFBsTFVrU2FaUnBXeFVGQzBLd0c1aldVeVJvZzZWN2FQMmY5RHFoakE3TEtS?=
 =?utf-8?B?QmtScEpuQjNDVTNieVlYL1JRMm9qM25DZnJZWktkSmJId1NzTG9qdE5makRZ?=
 =?utf-8?B?dUJkR1JPaXAybG1PQ3Q3M2NXcWRyU3JCRXdvaTJXZTE3QnNPaCtPNEdrRHBl?=
 =?utf-8?B?d2ZxQkhnRW0wM2tNNDRaZFU5RzRkb2h1czhpbWRiZ1QvR2JiMGMvVmxqTEdv?=
 =?utf-8?B?eC9mbm4yVFZvNmVUNnY4RGxGNndaOWlSV1lMYitTei9oTHdYU3p2UHRrMXA5?=
 =?utf-8?B?OU50L2V3a1h3V3lhWFY5R2ZXVm1FajZvelc3c0l2STJYNU1nTEk0MVNGclV0?=
 =?utf-8?B?ZlQxVDBLaEN2RXNydi95SFNpRDVhVXFtT3o1NGtYZTAzODFPMVFVWTZPeHgz?=
 =?utf-8?Q?bFZKLIJ24Gmvj6ignvcxHV54/pau0D6e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVJhQ0lCM1pteDJmUDhEN2FHYVFLczJDcUlBeXJQTkUrd0hoQ3VRTC9uaWxh?=
 =?utf-8?B?UW5IRUl5NTMvSEZSMjBjcGYwYUQ3V3c2eHZBYkpBamZzNXR3WkxnL3F0VEZP?=
 =?utf-8?B?NGFieHUySmhZRFRkZ1NScTMwWEdKekNzcUFiNkJDRTgybEVoeXlrYnVURDZR?=
 =?utf-8?B?NFJtL09NTkZxeHgvejdSam5jSDkrZ2tJYWlNTEhDYWIyd3B6b0JpSWxQdHZY?=
 =?utf-8?B?dWdUQ0xWL0ZWSFV4UkI0QXl0SzFUKzVlRTNoNTc1Rk12NStsTmFPQzBoYUVE?=
 =?utf-8?B?aVJaVUlTMkNSZDRVKzEvKys1K0k1ampjazNLcjVtWnllRWp4eTZ4TUZ1MWFU?=
 =?utf-8?B?L0RzUEVIdE1lRjRkVVM2SmpSWVVjYjI3b3puRmJLeW9UTTQ5cWQ3RXlMOEhv?=
 =?utf-8?B?dlZMT0pXNGkzbDNyM2tJZU1hYk4xTGorQVVmMElPSkJJbUVoYVRYVWVDMUpr?=
 =?utf-8?B?SWd0M1ZLVWVYc2V2SUgzTFNwdVZGOGtmd3NQSVlhSUw3YThKMGhvT3JhOFVV?=
 =?utf-8?B?R2hla3RIL0sxZXlQeTM3OHd4QXo3anV4bUxnbmFCbWlNTGswK3lxVzRaWXc4?=
 =?utf-8?B?ZThqWGtRdkpUdDZRR29PQS8ybzlWQ1F0dm40NkUwQlB2Z0drbzFlazFDZjlB?=
 =?utf-8?B?K1lmRjBlMFVaZGdMQlRHSU9HWGwxQ0EzQ0ZCVDZJT1VwdnVxOVQ0QmJyc0ph?=
 =?utf-8?B?OWZqWWJNaE5DSEV5SjVaRGYzcjFkZHQ5OFQ5cUVZOXdoOUoxeUtwMzVacXpi?=
 =?utf-8?B?clI0Qk5vQ2wySzhtY0NBVnJvTDlCTll1eGZFR2lXZjNlYTMyOVJLcTErUkQr?=
 =?utf-8?B?MUQraXdwSFFIWGU0NGMyRVF4clBLR25iczlsSHhpRDZza2d6NWh1WUY1dEZ1?=
 =?utf-8?B?VDdlK2RqSGdjYS9hZzFWSnlPRytFNWhoVWtuamlEU0hWYnNPNlpZb0pRVmdu?=
 =?utf-8?B?MmV1S3BiOFNxZ1NtalRPRTUvTXhod1BUQk5GTXlsL0IzMW0rYmVOMmlLQ1N4?=
 =?utf-8?B?RTRic3BRS0FoQWRRa0UyOEtXczRHcXhQT1NNNUVrZmFzR25FeW9sS3M4LzZY?=
 =?utf-8?B?NS9YdVQzeWpYRGhNODBFRjA4WW9ZaTRaVE9nNmNqM1F1Y0NpNmx5M1FLakkw?=
 =?utf-8?B?dGl2cmZrejlXRmprYURYSGxYM1BnV1BaK2xIMmt0RE1vbE9oME5OUVBRNzYz?=
 =?utf-8?B?czNldlJVZkRnUnZBdDF6MUl4VDRyMUdDcEI1ejZnOHppR2ZJT29vS3A4eWs0?=
 =?utf-8?B?Sk5OS3d5YlhpeU1WaTdxaGFFdGRPZXYwcFFWU3dYdGYxWmVQU0RNdUZlYjVP?=
 =?utf-8?B?K3F5UjRPSkQ4K2RVTXBkUCtTdVByTjR0S0JQQ25ZOEhFakRESkRVMHhhRVFS?=
 =?utf-8?B?ZW1tNldkNmRkQm1sZEQ4a0kvQkJxNk8wbjJVRTBSQ3hLUzBZNkk2bkxXVmlH?=
 =?utf-8?B?VmNLZWdhakRUQUZiKytCUlVvbGhLamY3Q3Y4SFVOSHpEcFdWL0ExWEZSWG53?=
 =?utf-8?B?Y2s2UmJlUjRFb1hTUFE0S3ExYXRZaFVMU1E3MUtyRnh0VnhTVlNzaFRsWVY5?=
 =?utf-8?B?NjN1T0ZJZkZHSkt3RG8vZFlIZUhGMzNnbnorQ1NBalhSWW5pOExmTG5GdFlk?=
 =?utf-8?B?aGVNbjVxeFFwWnVIOXVVTGJTQ3pNRkdmUTdlZkphUit6OWlMbEVydnBsUUdu?=
 =?utf-8?B?L0ZaZlYrV1J3dE8vd3JUcGZ5Z3N6elV6eXBycVZuQkw2cjJKcHgxUHlVR3Ir?=
 =?utf-8?B?VVk5R2gzZzlVaXZ2MURoVG1adWk4SUVIUWdDTU9YNDVtYWNKOFZqMGZFelNo?=
 =?utf-8?B?U09BZGJmWHhWaUNwb1VrWXhPVWVFdGVieGNVcHU1alRxZkVVdSs3OEhFK1VH?=
 =?utf-8?B?cmREeDU2ODdTcGtIV0lpSkROeDh3UnNuWnhvUTF2dmRsODVPNHFoYUtIMjBU?=
 =?utf-8?B?S2FKVmdrclB0aGxZY2hQL0RYVytaR09MRlVsNTFiVzVpWU9hT3RXa0Z2Nm1T?=
 =?utf-8?B?bGkrWGJSblFoZldqNEJBRmtKc3YzQTE2NEtBWGdHbnM1SFpPdi8yQWJXa0pw?=
 =?utf-8?B?T1pRUXYzSmdWSVExbTFXRWhLcU5uRGdPaitlZWI0SGFiZHRyd1dHK3h6aEVM?=
 =?utf-8?Q?gPV6Sq04H4qSdcL7/qgXbUKQv?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90824ea-ea64-4d64-b9c6-08de11746f9b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 14:08:12.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDAYPFmM9C6a0exscn6b/EHtmbAPU3KWuVE/Kkbf74h61xdhNXSYqbZbUkSJoveX20D5URlTQiwsBxq0xIjZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_070818_504511_7E5F18B6 
X-CRM114-Status: GOOD (  25.89  )
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

SGkgSmVyb21lLAoKCk9uIDEwLzIyLzIwMjUgODowMSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
PiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiBXZWQgMjIgT2N0IDIwMjUgYXQgMTQ6NTgsIENo
dWFuIExpdSB2aWEgQjQgUmVsYXkgPGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IAo+PiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNv
bT4KPj4KPj4gQW1sb2dpYyBQTEwgbG9ja2luZyBwcm9jZWR1cmUgc2hhbGwgZm9sbG93IHRoaXMg
dGltaW5nIHNlcXVlbmNlOgo+PiAxIEFzc2VydCByZXNldCBzaWduYWw6IEVuc3VyZXMgUExMIGNp
cmN1aXRzIGVudGVyIGtub3duIGluaXRpYWwgc3RhdGUuCj4+IDIgRGVhc3NlcnQgbG9jay1kZXRl
Y3Qgc2lnbmFsOiBBdm9pZCBsb2NrIHNpZ25hbCBmYWxzZSB0cmlnZ2VyaW5nLgo+PiAzIEFzc2Vy
dCBlbmFibGUgc2lnbmFsOiBQb3dlcnMgdXAgUExMIHN1cHBseS4KPj4gNCB1ZGVsYXkoMjApOiBX
YWl0IGZvciBCYW5kZ2FwIGFuZCBMRE8gdG8gcG93ZXIgdXAgYW5kIHN0YWJpbGl6ZS4KPj4gNSBF
bmFibGUgc2VsZi1hZGFwdGF0aW9uIGN1cnJlbnQgbW9kdWxlIChPcHRpb25hbCkuCj4+IDYgRGVh
c3NlcnQgcmVzZXQgc2lnbmFsOiBSZWxlYXNlcyBQTEwgdG8gYmVnaW4gbm9ybWFsIG9wZXJhdGlv
bi4KPj4gNyB1ZGVsYXkoMjApOiBXYWl0IGZvciBQTEwgbG9vcCBzdGFiaWxpemF0aW9uLgo+PiA4
IEFzc2VydCBsb2NrLWRldGVjdCBzaWduYWw6IGxvY2sgZGV0ZWN0aW9uIGNpcmN1aXQgc3RhcnRz
IHRvIHdvcmsuCj4+IDkgTW9uaXRvciBsb2NrIHN0YXR1cyBzaWduYWw6IFdhaXQgZm9yIFBMTCBs
b2NrIGNvbXBsZXRpb24uCj4+IDEwIElmIHRoZSBQTEwgZmFpbHMgdG8gbG9jaywgaXQgc2hvdWxk
IGJlIGRpc2FibGVkLCBUaGlzIG1ha2VzIHRoZQo+PiBsb2dpYyBtb3JlIGNvbXBsZXRlLCBhbmQg
YWxzbyBoZWxwcyBzYXZlIHVubmVjZXNzYXJ5IHBvd2VyIGNvbnN1bXB0aW9uCj4+IHdoZW4gdGhl
IFBMTCBpcyBtYWxmdW5jdGlvbmluZy4KPiAKPiBJcyB0aGlzIGFwcGxpY2FibGUgdG8gYWxsIHN1
cHBvcnRlZCBTb0MgPyBmcm9tIG1lc29uOCB0byBzNCA/CgpZZXMuCgo+IAo+IFdoYXQgZGlkIHlv
dSB0ZXN0ID8KCldlIGhhdmUgdGVzdGVkIHRoaXMgb24gdGhlIEcxMkEgYW5kIGxhdGVyIFNvQ3Mg
d2l0aG91dCBhbnkgaXNzdWVzLgpJbnRlcm5hbGx5LCB3ZSBoYXZlIGFkb3B0ZWQgdGhpcyBjb25m
aWd1cmF0aW9uIHNlcXVlbmNlIGluIG91ciBicmFuY2gKYW5kIHZlcmlmaWVkIGl0IG9uIGEgbGFy
Z2UgbnVtYmVyIG9mIFNvQ3MuCgpXZSBoYXZlbid0IG1haW50YWluZWQgdGhlIG1lc29uIHNlcmll
cyBmb3IgYSB3aGlsZSwgc28gaXQgaGFzbid0IGJlZW4KaW5jbHVkZWQgaW4gb3VyIHJlY2VudCB2
YWxpZGF0aW9uLiBJIGFsc28gZG9uJ3QgaGF2ZSBhbnkgbWVzb24gYm9hcmRzCm9uIGhhbmQuIElm
IHlvdSBoYXZlIG9uZSBhdmFpbGFibGUsIGl0IHdvdWxkIGJlIGFwcHJlY2lhdGVkIGlmIHlvdQpj
b3VsZCBoZWxwIHZlcmlmeSB0aGlzLCBUaGFua3MuCgpUaGlzIFBMTCBzZXF1ZW5jZSBhZGp1c3Rt
ZW50IGZvciBtZXNvbiBTb0NzIGFkZHMgYSAyMHVzIGRlbGF5IGFmdGVyCmVuYWJsaW5nIHRoZSBQ
TEwgYW5kIGFmdGVyIHJlbGVhc2luZyBpdHMgcmVzZXQuIFRoZSBkZWxheSBhZGRyZXNzZXMKcmFy
ZSBQTEwgbG9jayBmYWlsdXJlcyBvYnNlcnZlZCB1bmRlciBsb3cgdGVtcGVyYXR1cmVzLiBBcyBh
IHJlc3VsdCwKaXQgc2xpZ2h0bHkgaW5jcmVhc2VzIGVuYWJsZSB0aW1lIGJ1dCBpbXByb3ZlcyBz
dGFiaWxpdHkuCgo+IAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxp
dUBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIHwg
NjggKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIGIvZHJpdmVycy9jbGsvbWVzb24v
Y2xrLXBsbC5jCj4+IGluZGV4IGIwN2UxZWIxOWQxMi4uMjZjODNkYjQ4N2U4IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvbWVz
b24vY2xrLXBsbC5jCj4+IEBAIC0zNTMsNiArMzUzLDIzIEBAIHN0YXRpYyBpbnQgbWVzb25fY2xr
X3BjaWVfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4gICAgICAgIHJldHVybiAtRUlP
Owo+PiAgIH0KPj4KPj4gK3N0YXRpYyB2b2lkIG1lc29uX2Nsa19wbGxfZGlzYWJsZShzdHJ1Y3Qg
Y2xrX2h3ICpodykKPj4gK3sKPj4gKyAgICAgc3RydWN0IGNsa19yZWdtYXAgKmNsayA9IHRvX2Ns
a19yZWdtYXAoaHcpOwo+PiArICAgICBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhICpwbGwgPSBt
ZXNvbl9jbGtfcGxsX2RhdGEoY2xrKTsKPj4gKwo+PiArICAgICAvKiBQdXQgdGhlIHBsbCBpcyBp
biByZXNldCAqLwo+PiArICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkp
Cj4+ICsgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAx
KTsKPj4gKwo+PiArICAgICAvKiBEaXNhYmxlIHRoZSBwbGwgKi8KPj4gKyAgICAgbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOwo+PiArCj4+ICsgICAgIC8qIERpc2FibGUg
UExMIGludGVybmFsIHNlbGYtYWRhcHRpb24gY3VycmVudCBtb2R1bGUgKi8KPj4gKyAgICAgaWYg
KE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5jdXJyZW50X2VuKSkKPj4gKyAgICAgICAgICAg
ICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5jdXJyZW50X2VuLCAwKTsKPj4gK30K
PiAKPiBJIGRvbid0IGdldCB3aHkgeW91IG1vdmVkIHRoYXQgY29kZSBhcm91bmQgYW5kIG1ha2Ug
dGhlIGRpZmYgZXZlbiBoYXJkZXIKPiB0byByZWFkCgpTb3JyeSBhYm91dCB0aGUgbWlzYWxpZ25l
ZCBmb3JtYXR0aW5nLiBJIG1vdmVkIG1lc29uX2Nsa19wbGxfZGlzYWJsZSgpCmVhcmxpZXIgaW4g
dGhlIGNvZGUgYmVjYXVzZSBJIGFkZGVkIGhhbmRsaW5nIGZvciBQTEwgbG9jayBmYWlsdXJlcywK
d2hpY2ggdW5pbnRlbnRpb25hbGx5IGJyb2tlIHRoZSBhbGlnbm1lbnQuCgpJJ2xsIHNwbGl0IHRo
ZSBQTEwgbG9jayBmYWlsdXJlIGhhbmRsaW5nIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBpbiB0aGUK
bmV4dCB2ZXJzaW9uIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KCj4gCj4+ICsKPj4gICBzdGF0aWMg
aW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAgIHsKPj4gICAg
ICAgIHN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4gQEAgLTM2
Niw1MyArMzgzLDQ4IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9lbmFibGUoc3RydWN0IGNs
a19odyAqaHcpCj4+ICAgICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkp
Cj4+ICAgICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwg
MSk7Cj4+Cj4+ICsgICAgIC8qIERpc2FibGUgdGhlIFBMTCBsb2NrLWRldGVjdCBtb2R1bGUgKi8K
Pj4gKyAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCj4+ICsg
ICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEp
Owo+PiArCj4+ICAgICAgICAvKiBFbmFibGUgdGhlIHBsbCAqLwo+PiAgICAgICAgbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDEpOwo+PiAtCj4+IC0gICAgIC8qIFRha2UgdGhl
IHBsbCBvdXQgcmVzZXQgKi8KPj4gLSAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxs
LT5yc3QpKQo+PiAtICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwt
PnJzdCwgMCk7Cj4+ICsgICAgIC8qIFdhaXQgZm9yIEJhbmRnYXAgYW5kIExETyB0byBwb3dlciB1
cCBhbmQgc3RhYmlsaXplICovCj4+ICsgICAgIHVkZWxheSgyMCk7Cj4+Cj4+ICAgICAgICAvKgo+
PiAgICAgICAgICogQ29tcGFyZWQgd2l0aCB0aGUgcHJldmlvdXMgU29Dcywgc2VsZi1hZGFwdGlv
biBjdXJyZW50IG1vZHVsZQo+PiAgICAgICAgICogaXMgbmV3bHkgYWRkZWQgZm9yIEExLCBrZWVw
IHRoZSBuZXcgcG93ZXItb24gc2VxdWVuY2UgdG8gZW5hYmxlIHRoZQo+PiAgICAgICAgICogUExM
LiBUaGUgc2VxdWVuY2UgaXM6Cj4+IC0gICAgICAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBm
b3IgMTB1cwo+PiArICAgICAgKiAxLiBlbmFibGUgdGhlIHBsbCwgZW5zdXJlIGEgbWluaW11bSBk
ZWxheSBvZiAxMM68cwo+PiAgICAgICAgICogMi4gZW5hYmxlIHRoZSBwbGwgc2VsZi1hZGFwdGlv
biBjdXJyZW50IG1vZHVsZSwgZGVsYXkgZm9yIDQwdXMKPj4gICAgICAgICAqIDMuIGVuYWJsZSB0
aGUgbG9jayBkZXRlY3QgbW9kdWxlCj4+ICAgICAgICAgKi8KPj4gICAgICAgIGlmIChNRVNPTl9Q
QVJNX0FQUExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpIHsKPj4gLSAgICAgICAgICAgICB1ZGVs
YXkoMTApOwo+PiAgICAgICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxs
LT5jdXJyZW50X2VuLCAxKTsKPj4gLSAgICAgICAgICAgICB1ZGVsYXkoNDApOwo+PiAtICAgICB9
Cj4+IC0KPj4gLSAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkp
IHsKPj4gLSAgICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5sX2Rl
dGVjdCwgMSk7Cj4+IC0gICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBs
bC0+bF9kZXRlY3QsIDApOwo+PiArICAgICAgICAgICAgIHVkZWxheSgyMCk7Cj4+ICAgICAgICB9
Cj4+Cj4+IC0gICAgIGlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpCj4+IC0gICAgICAg
ICAgICAgcmV0dXJuIC1FSU87Cj4+ICsgICAgIC8qIFRha2UgdGhlIHBsbCBvdXQgcmVzZXQgKi8K
Pj4gKyAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+PiArICAgICAg
ICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMCk7Cj4+Cj4+IC0g
ICAgIHJldHVybiAwOwo+PiAtfQo+PiArICAgICAvKiBXYWl0IGZvciBQTEwgbG9vcCBzdGFiaWxp
emF0aW9uICovCj4+ICsgICAgIHVkZWxheSgyMCk7Cj4+Cj4+IC1zdGF0aWMgdm9pZCBtZXNvbl9j
bGtfcGxsX2Rpc2FibGUoc3RydWN0IGNsa19odyAqaHcpCj4+IC17Cj4+IC0gICAgIHN0cnVjdCBj
bGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4gLSAgICAgc3RydWN0IG1lc29u
X2Nsa19wbGxfZGF0YSAqcGxsID0gbWVzb25fY2xrX3BsbF9kYXRhKGNsayk7Cj4+ICsgICAgIC8q
IEVuYWJsZSB0aGUgbG9jay1kZXRlY3QgbW9kdWxlICovCj4+ICsgICAgIGlmIChNRVNPTl9QQVJN
X0FQUExJQ0FCTEUoJnBsbC0+bF9kZXRlY3QpKQo+PiArICAgICAgICAgICAgIG1lc29uX3Bhcm1f
d3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4KPj4gLSAgICAgLyogUHV0IHRo
ZSBwbGwgaXMgaW4gcmVzZXQgKi8KPj4gLSAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgm
cGxsLT5yc3QpKQo+PiAtICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZw
bGwtPnJzdCwgMSk7Cj4+ICsgICAgIGlmIChtZXNvbl9jbGtfcGxsX3dhaXRfbG9jayhodykpIHsK
Pj4gKyAgICAgICAgICAgICAvKiBkaXNhYmxlIFBMTCB3aGVuIFBMTCBsb2NrIGZhaWxlZC4gKi8K
Pj4gKyAgICAgICAgICAgICBtZXNvbl9jbGtfcGxsX2Rpc2FibGUoaHcpOwo+PiArICAgICAgICAg
ICAgIHByX3dhcm4oIiVzOiBQTEwgbG9jayBmYWlsZWQhISFcbiIsIGNsa19od19nZXRfbmFtZSho
dykpOwo+Pgo+PiAtICAgICAvKiBEaXNhYmxlIHRoZSBwbGwgKi8KPj4gLSAgICAgbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+ZW4sIDApOwo+PiArICAgICAgICAgICAgIHJldHVybiAt
RUlPOwo+PiArICAgICB9Cj4+Cj4+IC0gICAgIC8qIERpc2FibGUgUExMIGludGVybmFsIHNlbGYt
YWRhcHRpb24gY3VycmVudCBtb2R1bGUgKi8KPj4gLSAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElD
QUJMRSgmcGxsLT5jdXJyZW50X2VuKSkKPj4gLSAgICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRl
KGNsay0+bWFwLCAmcGxsLT5jdXJyZW50X2VuLCAwKTsKPj4gKyAgICAgcmV0dXJuIDA7Cj4+ICAg
fQo+Pgo+PiAgIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+IAo+IC0tCj4gSmVyb21lCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
