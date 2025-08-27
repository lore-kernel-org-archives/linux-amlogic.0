Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C773C8303F
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Aug 2025 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k1zvi5JSgr2je0rusx4Xm9rCznjbOkgXwMKnUoUvZc=; b=uvPxExA/G+g1CK2qHQwPYfGdrv
	Oug0sarr8StNy0LU5ZzgwAwKRoNIRd2MmmTSGVywy2maLmvMVDVz3oU4ZN3SrFlPP7YWRmgRpa5To
	XqlJnWFptOUu2NQ2xm5UAd7li8O9nzpclHJvQx7/zkdMzD698m35bsZ3dkYldKT0IBkK2nvBcb3TN
	6AAwTtef+ttUjNM0tRaOTeLOcSex9Z9HYkhwq0VKGb+U6aS8dffwEqjZ70WVP7cdNK0dpWPd4plR5
	lfJQpku/shhPeAq1tQ5Kp5NCGJfH8+e+pzG1ESDhrkn9hB55ElsiVrv+RpHshqzQU52eKCyzynaT6
	nuB3t0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur6sD-0000000DqFm-2OVn;
	Wed, 27 Aug 2025 03:30:57 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur6sA-0000000DqEO-0mYT;
	Wed, 27 Aug 2025 03:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axIHXfVw33qyKjVS28iKUb7GbjxucwTDVHAd0nkWz7Ng71iAYyz/vkID4p1qrJRKCP4em4UrEueifv4t/cANNygxr+d/flRazC+ZOzmWDqnLF2XEkw01ycailYHBXOWMrIePmq1I6GU3ffSgYbYXL8iJx3npxYgG9w9JzJnVrOlQAHG3SXMk5LHOQGKi0dhcPY1nrDt5Sjmy6AeGH7ObwdSpQqakHcvOPuiAxa/6sW1dvcXvBm2hdwKAwZnG0Yn6wLGjg3fLd9pdbcEYBJKwRvaO0+ujLGyG4MB8X1OI39TBXDYr79GfcmWgq1/a10cZd+Jebz3PKBW/q1jj24g1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+kmzeSfTmlnIJWXyJ9/yt9TqO2koIktUZEVzGDu4EE=;
 b=KahoGTdEKenaaEHNclkrRZsxxunSxHmN/459EzOCjbbT+QIPBovIlmvRVR9PSd+RG9MYmjExJRtIW1Hv6BIQ0NCn6rCqNgJDVnyrDXTwTzYAaJ/H78rPeQA16aopSCQ4JPECycFYX/p/T6lsnKQVHOdgAlG627r6xq+0Tf79lcqpl9CZGrnuZY7hdSnl5x8cdzWFlZOZhaMCkU/y8wpBn5riPgCuewnt/3stssTrJDUS0wI491CRWyUh46pJhIL0X0jP2qhr1UmgFusLsN/FePybbdktH5baKnWAOb/Dg4CmxjQ7HyHZLzBcc4I1ezHQsUVqD065TAB/9BFhk44yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+kmzeSfTmlnIJWXyJ9/yt9TqO2koIktUZEVzGDu4EE=;
 b=GB//F0YoubIo7C1fSUSJ7BMMsLCa54Aj1MMvwxFMyocpJofduElmKkBKV1gQHvuLy1OenRlU0mwKQbItMrr51CKkmgbJ2Fjsi47JiA7gvcHFVH3uypoU4OVK/6OVDVOt7dsMNJfVgkH3Hr8INoYwqBoxQCfh0FMsTl+e6h+k3+pTTbYOYL8AOjf8b34fRXVMmDaaaKT4+4affYonp1+U5LUqbFfi3onlaprw0UskouCkivMBXH8DJlEHDz5VrNyrnLZqkVlMG6qYisFz3J6P9g5EVNtioPhyAK6iz73OoQ8nPygL8EHAB3H/NBiVdNbx04lPiGmFQ+r4GfseUgOmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB6960.apcprd03.prod.outlook.com (2603:1096:101:9d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 27 Aug
 2025 03:30:35 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 03:30:35 +0000
Message-ID: <e9d65b1d-912d-442a-bac1-4284bef72083@amlogic.com>
Date: Wed, 27 Aug 2025 11:29:52 +0800
User-Agent: Mozilla Thunderbird
From: Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and hifi
 pll
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250822002203.1979235-1-da@libre.computer>
 <c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com>
 <1jy0r64fcr.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy0r64fcr.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 423a4945-e554-4712-9e06-08dde51a156b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VCL0RPc0E3MGNYOWhGQiszYlJQeDNNL3ZJTUI5Ri9kaDI3K3hjd0dOZFBY?=
 =?utf-8?B?RUNETzREeUtxbDJBQm5ZMzB6bFhXTjJHbXVIRTFWRVMyYWhEZEFuOHozVlVh?=
 =?utf-8?B?U3lxUnErQktTTW1IaFJJWUtQMGVUWkhWRU1rVlNneEk1QmJ2MmJrcnVJZUlU?=
 =?utf-8?B?VHUrcHExbTMzL3h1bWFVeW9ybjJLbXdDUFQ3STg0dlJaQUJUQkpObDJqMWlQ?=
 =?utf-8?B?eXFmdGRvVCtycTZ4WUNPVTBERHlaNWlMaEF1YXBURHhIRi9OYnNBcndFalFM?=
 =?utf-8?B?Q2RMR1IvWUY1dVZpWTBBTE1UNExObnBtKzZQVElVcHdBaFdITUFXY3ZhM1Ni?=
 =?utf-8?B?SmxSbHJqYXJwdi9mUk5mZnVoMU5iL3ZsZnpKZ2RUWDNDSDg4aEJTbncrOVE5?=
 =?utf-8?B?MVFMczJ0b2JDb1N0aXk5S2szYjdBdG5xSDNBRGkxaURzK1VqSnpTM1g4cnUx?=
 =?utf-8?B?bkVkbWNYbTRSeUt6dkxURGJmZ0N2TTJTMmxpVlcramdOZkEwdmlHbWlnNzNO?=
 =?utf-8?B?ZkNKRTlpYVZYNmFZU2x0NUhlYWRzQ0VJbnAzQlBQUnZUWVhPblFDb0xZd2w3?=
 =?utf-8?B?bWJoVTF5MDFIaHV6Q1p5bGU0djRGSjhUK3hIaVNwNGtvUThqM0REYjMzbEtQ?=
 =?utf-8?B?c1diaGtoM2NZZG40MVovQ0l2eTlkaGo4bkFvSDcyZWJ5RFRWdmVURXUvSENr?=
 =?utf-8?B?eTB2dmtHd0k2Z05vcTFQMDdRRkQ2OFl4MExrS0tTNHhNZWtJWEFSNEh3QkNi?=
 =?utf-8?B?dHRzS1FDT1NGVTE2aFdqYlN2M0M2alJ3b01USkhueTNtY2NITFdUSm90UndW?=
 =?utf-8?B?eCtURDliOGJCK1VIaW9WMVNQTC9rMG9udnJVMzBIem13VGxZQmtMOVBMdmlm?=
 =?utf-8?B?K2M0RXlEQ1ZhWThSK0E2OXdsdmtQbzVZalV2T01XOGtzSmxTcFNxVWl6eEdT?=
 =?utf-8?B?UXFoVDhrSGhkVklveko4SEZ2MUowRkxVM2hpTFFTM2p2ZEpBelBZellyRkgx?=
 =?utf-8?B?THo3bFZneS9OQzAyMWVOQ1BsQmx2MXRINktQWm1iQlBCeVg0SkFFZC9uYVBW?=
 =?utf-8?B?eVNuL0c0YXc2L0dkQ0tjSnBrS2toQkJkbm80cStkRHlIYUNTR1pSbmNwNk5n?=
 =?utf-8?B?UUw3OTlkNE44QXVHbGpnenZKTWhMYWxSUG5qazZNSHlXWDRtb1F3TTRJVHlR?=
 =?utf-8?B?TDhXcWZVSERYTGZSU3dDcUpJSU9RU01KQVFlSGtJWGNVT3kyNmkxYUlNcE01?=
 =?utf-8?B?alRlRFlBU2s2cVdqNHo2UHFsZDVoQlZKVmcyck1HT21RMXVtSjZmR0xFK1Ax?=
 =?utf-8?B?ODF3RjB2V3ZRNk9DQzlOclRLeGcxeXc0MFk5YWk3aUtocnB6RlEraGFqeTMw?=
 =?utf-8?B?TWRtZ3VpR3NRTEdXVE1SL3B0aW5OUDNuMGJFOVVtQ2RsS2c3UUdXRENlaFkr?=
 =?utf-8?B?S2ozM1RzY2NHZlZhd3NHY3VCdGNTRm1sa09GOHNtZDNYUk1CSzU2UnlPb2Vv?=
 =?utf-8?B?ZG9ua2RLM3ljSHVpMGVuVGhEclA2ejJtMnNsM3g3a25uYVlQOGNmTk90QWdT?=
 =?utf-8?B?MVZZVTZpRnJsZkMwa21GUUh4NlZMZnZPUTlmcUQ4NUQ3eWpQRWVyclZZdGJk?=
 =?utf-8?B?V0l4NExidVl1c0hIaEVhcmY3WGx0TVFralBjMWE3WitZZVEraDFmeEVEdVcz?=
 =?utf-8?B?NHRZN1NTQyt6K3JuSGtXM1NzckhqTVJmU3QwMmdsa1JHcDFDem9nSm5xMHYv?=
 =?utf-8?B?L1Y2Yy85cGRsVXkrSUhHZHkzTlJsbVR6YkI5cUtLdkNOUDQ0QkVLbTZOcG0w?=
 =?utf-8?B?UUxoOEJqc0RUOGtQVk9mU2pmb3VnSitURkhVcjZUeXFUeW9TNVkzVWVPcVhp?=
 =?utf-8?B?L3o4YzhpaHQyMWhGRGJKTCtNV0NIbkkvNzVxYU5QOFVqeUdFdWliRnVsTHBU?=
 =?utf-8?Q?W4UDl884vRM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FwVzA1cUVibEF5NmlEZk1BK3IzcytMT3dlK045UzRUNDJicEhBY3BmR0lL?=
 =?utf-8?B?YTFJdkl2UXVWdjU4bE9MWGtDbXkzSlE4d2ZsczN5dGxoS1ptU1g0elYwVDFI?=
 =?utf-8?B?QzZMaU53MFZ1VCtoUHlnMnhQY2I5REFtcU5kcVpFTjlOUXlvOHIyWGwzazRI?=
 =?utf-8?B?UmV0cFRPbEd4dW5xcm42L3Q5MVNheUNZb0xlVnZkYVlmZEtzb25hL0FSblB6?=
 =?utf-8?B?ejRnL0crZ3luTWVMdEtuckJ2Qks5eTVTK2pwQzAyeXNFUklGODBPdTU5V2Zt?=
 =?utf-8?B?TlY1UzhhcVhmWHRZVFpwdkkxMzV4RFErdjlQZEdTMFFmSjRwQUwzTjJnMVdy?=
 =?utf-8?B?RnkxcXI5NmJyKzFIdlNHdzd3aUQ2Y1ptcmFOdFFkVVJVRlFFOXp2VVgwY3Rs?=
 =?utf-8?B?ZkpwdGpHSE1vU3FQb3dpbmhWVTEySTZRTzlQazFBNnZ0OGNCR2xkRGIxaTlq?=
 =?utf-8?B?N3F3cFVhTFE0UW5uUmxMOTN4VmRXbFFwZWEweitCZlpGT2YvY3NKckFMM2Rs?=
 =?utf-8?B?MDJpQ2txY3FPOWFYLzRXcncxZmozZkhCczhQY1lLOUtqNlBvdUdtdnhnTjhF?=
 =?utf-8?B?emJ0R040UlYxbkJIcGpVeUhYd3I4UnNoaUtuWW5XUzNMZmpuU1J1dWNkMThz?=
 =?utf-8?B?WEFUMUMyVVNhZmhreWVjWm5GczZCNmtsWUxtaDhCNnJQQ1dWdEdqcGJTMllv?=
 =?utf-8?B?aVNGb085Kyt1NmhRclYxa2xoYzNSUmJBejF5clFrejZhQUhRSzJ5OFZTZnhw?=
 =?utf-8?B?aUQ5V2JRNlRxTXY2NmdCMFo3T3ZlczVlSWpQY1dheHhoOVk1MWN0M3JHS0Rv?=
 =?utf-8?B?Sm9INmVGWTFTUVc5b2dFNUdTZGMvWjRFc1lldFZwWi9GUU9JWDkzOFd2RHFH?=
 =?utf-8?B?LzFzU1NoNG1MdkJDQzZMN3I3S2UzOEpjWVFCM0hyblhaSVdTamhUdUo0VlhO?=
 =?utf-8?B?SVBtZFlUaHZwU1pjeUk0b1F3bGNUczZFS2cvSUJoNWJlR0Fza1hNTEVmczVS?=
 =?utf-8?B?clpzWWxTUWNPZkt4UDBsK3FwOXFJYU1Gem9NajZpQ00rK3RZMTNsT0xYV0VM?=
 =?utf-8?B?MnY5cnEvRkF5NGdiRm1KOU5qL0lyRWw0aGRESDdDTmZodnFaRVhMR2prb0Rl?=
 =?utf-8?B?Y09rck4rRThxN1FIajNzbjVWN2FSRGlyT1g5Z3RLZHl5Z3F1TVdKVnVvYlc1?=
 =?utf-8?B?UEg5bERYRmJuQzJBbUxNYVlPeTF4SktOdG0yS0ZQSGU4SHhZSk9hSENOMjFK?=
 =?utf-8?B?bnkrSXErcnlWcWxQRXNCZEJPQ1FVY1FHVS9ENUt4bFgzQlpMRHVVMTdKRjl1?=
 =?utf-8?B?eW04K1crcGhvU2JKRGFIRHpiZkxlNFVFNEhYU1d3NVhsSjVvR3lhRTdLOTJ2?=
 =?utf-8?B?dklTMVZRYUFKYy80Q1o3MFZJbU1UUkNKbDNPZEVjZ2pGeTI0YkNFckpvV1Mv?=
 =?utf-8?B?ZUo2QjlTdlErclF4ZUpmalpTcnZobGltWVBlVC9UUWkxWFkzdG1vNUVaYTUw?=
 =?utf-8?B?cTBUWHBxckV3dHNqUUlXTWEyREdwY0dXcElLRWRDbUZ4YVI0OTdMOGRMODJz?=
 =?utf-8?B?VC9SMU5KMjkzazhheUJGY2x2djVabmRRZVQ5TUhma20yekkveUhaVjJ2dlY4?=
 =?utf-8?B?ZlBBdC91ZlY1cGhCTTRaU3BUbW9jbGUyOUF0Zy9BcmgxVnZ2WEVWYk4yQms0?=
 =?utf-8?B?Q2NkSUh1aUZwVGlubmd4Vnd1SjMzclV6OElwdUVHaHg1eUhzNlA2NlMvV0cz?=
 =?utf-8?B?dTdtSUhvNVVSdTRDcXcraWg4alZNa3c5YTQwY00rWnp5ckNrYjI5elZwRGN4?=
 =?utf-8?B?MHlJT0ZJRzhiK2NnTUd4dXR5aFBFTEV1MkRiSkRFVVk1MlNLWnluc1Z4M1BB?=
 =?utf-8?B?a05ycTJIWERCU1Y2elpsU1NIWTdTRXc0aVVKUzV0WEJLQXJSTm1hZmo0My9C?=
 =?utf-8?B?SDlpRXNPRk5rKzd0T05EYW5LNjk4cm15bFIreEU2WVh2WWtRdEZTT1JOVzlL?=
 =?utf-8?B?WnF5aXV3UmZBMmY2YnNMcEtLZ2ZJek1iNXMzL3ZsSmhVSXl2Y1NxaWZXK0l3?=
 =?utf-8?B?d29VQ2N6WlZxSzBSVG03S2doblpjSmpiamJFZHNKalBaa1VLUWZyRDF0eW5V?=
 =?utf-8?Q?19FmdiVuKttY/CmBurX86YLU/?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423a4945-e554-4712-9e06-08dde51a156b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 03:30:34.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdgvB0qQqvyQ2zbpb5Lttl0GDhpUMoZ/UTzgJ6HMRosp7Z3YlhReSPZv8kJZh+h+tro+JROeABcB4TaeBzpSYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_203054_369907_8CA9209E 
X-CRM114-Status: GOOD (  26.93  )
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

SGkgSmVyb21lOgoKCk9uIDgvMjYvMjAyNSA1OjExIFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gVHVlIDI2IEF1ZyAyMDI1IGF0IDE1OjU5LCBDaHVh
biBMaXU8Y2h1YW4ubGl1QGFtbG9naWMuY29tPiB3cm90ZToKPgo+PiBIaSBEYToKPj4KPj4gICAg
ICBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIGJ1dCB0aGlzIHBhdGNoIGlzIHdyb25nLgo+Pgo+
Pgo+PiBPbiA4LzIyLzIwMjUgODoyMiBBTSwgRGEgWHVlIHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Pgo+Pj4gVGhlIGJpdCByYW5nZSAxNzowIGRvZXMgbm90IG1hdGNoIHRoZSBkYXRh
c2hlZXQgZm9yIEEzMTFEIC8gUzkwNUQzLgo+Pj4gQ2hhbmdlIHRoZSBiaXQgcmFuZ2UgdG8gMTg6
MCBmb3IgRklYIGFuZCBISUZJIFBMTHMgdG8gbWF0Y2ggZGF0YXNoZWV0Lgo+PiBUaGUgdXBwZXIg
MiBiaXRzIChiaXQxOCwgYml0MTcpIG9mIHRoZSBmcmFjIHdlcmUgZGVwcmVjYXRlZCBsb25nIGFn
by4KPiBkZXByZWNhdGVkID8gdGhhdCBpcyByZWFsbHkgY29uZnVzaW5nCj4KPiBUaGF0IHNlZW1z
IHRvIGltcGx5IHRoYXQgaXQgZG9lcyBoYXZlIGFuIGVmZmVjdCBidXQgeW91IGFyZSBjaG9vc2lu
ZyBub3QKPiB0byB1c2UgaXQuIFBsZWFzZSBjbGFyaWZ5LgoKCkFmdGVyIGludmVzdGlnYXRpbmcg
dGhlIGhpc3RvcmljYWwgY29udGV4dCBvZiB0aGlzIGlzc3VlLCB0aGUgb3JpZ2luYWwKZGVzaWdu
IGludGVudCBmb3IgZnJhY1sxODowXSB3YXMgYXMgZm9sbG93czoKCkJpdCBbMThdOiBDb25maWd1
cmUgdGhlIHNpZ24gZm9yIGZyYWN0aW9uYWwgbXVsdGlwbGljYXRpb246CjAg4oaSIFRoZSBmcmFj
dGlvbmFsIHBhcmFtZXRlciBjb25maWd1cmVkIGluIGJpdHMgWzE3OjBdIGlzIHBvc2l0aXZlOgog
wqAgwqAgZm91dCA9IDI0TSAqIChtICsgZnJhYyAvIGZyYWNfbWF4KSAvIG4KMSDihpIgVGhlIGZy
YWN0aW9uYWwgcGFyYW1ldGVyIGNvbmZpZ3VyZWQgaW4gYml0cyBbMTc6MF0gaXMgbmVnYXRpdmU6
CiDCoCDCoCBmb3V0ID0gMjRNICogKG0gLSBmcmFjIC8gZnJhY19tYXgpIC8gbgoKQml0cyBbMTc6
MF06IEZyYWN0aW9uYWwgbXVsdGlwbGllciBwYXJhbWV0ZXIsIHdoZXJlOgpiaXRbMTddIC0gYml0
WzBdID0gMS8yXjAgKyAxLzJeMSArIC4uLiArIDEvMl4xNwoKSG93ZXZlciwgdGhlIGZ1bmN0aW9u
YWxpdHkgb2YgYm90aCBiaXQgWzE4XSBhbmQgYml0IFsxN10gY291bGQgYmUKcmVwbGFjZWQgYnkg
c2ltcGx5IGFkanVzdGluZyB0aGUgaW50ZWdlciDigJht4oCZIHZhbHVlLiBNb3Jlb3ZlciwgYWN0
dWFsCnRlc3RpbmcgcmV2ZWFsZWQgdGhhdCB0aGVzZSBiaXRzIGRpZCBub3QgcGVyZm9ybSBhcyBl
eHBlY3RlZC4KQ29uc2VxdWVudGx5LCB0aGlzIGZlYXR1cmUgd2FzIGV2ZW50dWFsbHkgZGVwcmVj
YXRlZC4KCgo+PiBUaGUgYWN0dWFsIGVmZmVjdGl2ZSBiaXQgZmllbGQgZm9yIGZyYWMgaXMgYml0
WzE2OjBdLiBIb3dldmVyLCB0aGUKPj4gY29ycmVzcG9uZGluZyBkYXRhc2hlZXQgaGFzIG5vdCBi
ZWVuIHVwZGF0ZWQuIEkgd2lsbCBwcm92aWRlIGZlZWRiYWNrCj4+IGFuZCB1cGRhdGUgdGhlIGRh
dGFzaGVldCBhY2NvcmRpbmdseS4KPj4KPiBXaGF0IGFib3V0IGJpdCAxNyBhbmQgMTggdGhlbiA/
IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0IGF0IGFsbCA/CgoKVGhlIGZ1bmN0aW9uYWxpdHkgb2Yg
dGhlc2UgdHdvIGJpdHMgaXMgZGVwcmVjYXRlZCwgcGxlYXNlIGlnbm9yZSBpdC4KCgo+Pj4gVGhl
IGZyYWMgZmllbGQgaXMgbWlzc2luZyBmb3Igc3lzIHBsbCBzbyBhZGQgdGhhdCBhcyB3ZWxsLgo+
PiBQTExzIHdpdGggZnJhYyBzdXBwb3J0IGFyZSB1c2VkIGluIHNjZW5hcmlvcyByZXF1aXJpbmcg
YSB3aWRlIHJhbmdlCj4+IG9mIG91dHB1dCBmcmVxdWVuY2llcyAoZS5nLiwgYXVkaW8vdmlkZW8g
YXBwbGljYXRpb25zKS4KPj4KPj4gU2luY2Ugc3lzX3BsbCBpcyBkZWRpY2F0ZWQgdG8gY2xvY2tp
bmcgdGhlIENQVSBhbmQgZG9lcyBub3QgcmVxdWlyZQo+PiBzdWNoIGZyZXF1ZW5jeSB2ZXJzYXRp
bGl0eSwgaXQgZG9lcyBub3Qgc3VwcG9ydCBmcmFjdGlvbmFsIGZyZXF1ZW5jeQo+PiBtdWx0aXBs
aWNhdGlvbi4KPiBZb3UgYXJlIG1peGluZyAiSFcgc3VwcG9ydCIgYW5kICJ1c2FnZSBjaG9pY2Ui
IGhlcmUuCgoKQWxyaWdodCwgdGhlIHByZXZpb3VzIGV4cGxhbmF0aW9uIG1heSBoYXZlIGNhdXNl
ZCBzb21lIG1pc3VuZGVyc3RhbmRpbmcuClRoZSBhY3R1YWwgaW50ZW50IHdhcyB0byBleHBsYWlu
IHdoeSB0aGUgU1lTIFBMTCBkb2VzIG5vdCBzdXBwb3J0IGZyYWMuCgoKPgo+IFdoYXQgSSByZWFk
IGlzIDoKPiAqIERhIHNheXMgdGhlIFNZUyBQTEwgZG9lcyBoYXZlIEhXIHN1cHBvcnQgZm9yIHRo
ZSBmcmFjIHBhcmFtZXRlcgo+ICogQW1sb2dpYyBkb2VzIG5vdCBzZWUgdGhlIHBvaW50IG9mIHVz
aW5nIGl0IHNpbmNlIHRoZSBDUFUgZG9lcyBub3QKPiAgICByZXF1aXJlIGZpbmUgdHVuaW5nIG9m
IHRoZSByYXRlLgo+Cj4gSXMgdGhhdCBjb3JyZWN0ID8gb3IgaXMgdGhlIEhXIGp1c3Qgbm8gcHJl
c2VudCA/CgoKVGhlIFNZUyBQTEwgSFcgZG9lcyBub3QgcHJlc2VudCBmcmFjIGZ1bmN0aW9uYWxp
dHkuCgoKPj4+IFBhdGNoZWQ6Cj4+Pgo+Pj4gKyBzdWRvIGNhdCAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHVmcmVxL3BvbGljeTAvY3B1aW5mb19jdXJfZnJlcSBcCj4+PiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHVmcmVxL3BvbGljeTIvY3B1aW5mb19jdXJfZnJlcQo+Pj4gOTk2OTk5Cj4+
PiA1MDAwMDAKPj4+ICsgc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVzb24tY2xrLW1zci9t
ZWFzdXJlX3N1bW1hcnkKPj4+ICsgZ3JlcCAtaSAnXChzeXNfXHxoaWZpX1x8Zml4ZWRfXClwbGwn
Cj4+PiAgICBoaWZpX3BsbCAgICAgICAgICAgICAgICAgICAgICAwICAgICsvLTE1NjJIego+Pj4g
ICAgc3lzX3BsbF9kaXYxNiAgICAgICAgICAgICAgICAgMCAgICArLy0xNTYySHoKPj4+ICAgIHN5
c19wbGxfY3B1Yl9kaXYxNiAgICAgICAgICAgIDAgICAgKy8tMTU2Mkh6Cj4+PiArIHN1ZG8gY2F0
IC9zeXMva2VybmVsL2RlYnVnL2Nsay9jbGtfc3VtbWFyeQo+Pj4gKyBncmVwIC1pICdcKHN5c19c
fGhpZmlfXHxmaXhlZF9cKXBsbCcKPj4+ICAgICAgIGhpZmlfcGxsX2RjbyAgICAgICAgICAgICAg
ICAgICAgIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgMAo+Pj4gICAgICAgICAgaGlmaV9wbGwg
ICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+PiAgICAg
ICBzeXNfcGxsX2RjbyAgICAgICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDAgICAg
ICAgIDM5OTk5OTk5ODUKPj4+ICAgICAgICAgIHN5c19wbGwgICAgICAgICAgICAgICAgICAgICAg
IDAgICAgICAgMCAgICAgICAgMCAgICAgICAgNDk5OTk5OTk5Cj4+PiAgICAgICAgICAgICBzeXNf
cGxsX2RpdjE2X2VuICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDQ5OTk5OTk5
OQo+Pj4gICAgICAgICAgICAgICAgc3lzX3BsbF9kaXYxNiAgICAgICAgICAgMCAgICAgICAwICAg
ICAgICAwICAgICAgICAzMTI0OTk5OQo+Pj4gICAgICAgZml4ZWRfcGxsX2RjbyAgICAgICAgICAg
ICAgICAgICAgMSAgICAgICAxICAgICAgICAxICAgICAgICAzOTg3OTk5OTg1Cj4+PiAgICAgICAg
ICBmaXhlZF9wbGwgICAgICAgICAgICAgICAgICAgICAzICAgICAgIDMgICAgICAgIDEgICAgICAg
IDE5OTM5OTk5OTMKPj4+Cj4+PiBVbnBhdGNoOgo+Pj4KPj4+ICsgc3VkbyBjYXQgL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3kwL2NwdWluZm9fY3VyX2ZyZXEgXAo+Pj4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3kyL2NwdWluZm9fY3VyX2ZyZXEKPj4+
IDEwMDAwMDAKPj4+IDUwMDAwMAo+Pj4gKyBzdWRvIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZXNv
bi1jbGstbXNyL21lYXN1cmVfc3VtbWFyeQo+Pj4gKyBncmVwIC1pICdcKHN5c19cfGhpZmlfXHxm
aXhlZF9cKXBsbCcKPj4+ICAgIGhpZmlfcGxsICAgICAgICAgICAgICAgICAgICAgIDAgICAgKy8t
MTU2Mkh6Cj4+PiAgICBzeXNfcGxsX2RpdjE2ICAgICAgICAgICAgICAgICAwICAgICsvLTE1NjJI
ego+Pj4gICAgc3lzX3BsbF9jcHViX2RpdjE2ICAgICAgICAgICAgMCAgICArLy0xNTYySHoKPj4+
ICsgc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5Cj4+PiArIGdyZXAg
LWkgJ1woc3lzX1x8aGlmaV9cfGZpeGVkX1wpcGxsJwo+Pj4gICAgICAgaGlmaV9wbGxfZGNvICAg
ICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+PiAgICAgICAg
ICBoaWZpX3BsbCAgICAgICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAg
IDAKPj4+ICAgICAgIHN5c19wbGxfZGNvICAgICAgICAgICAgICAgICAgICAgIDEgICAgICAgMSAg
ICAgICAgMCAgICAgICAgNDgwMDAwMDAwMAo+Pj4gICAgICAgICAgc3lzX3BsbCAgICAgICAgICAg
ICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICAxMjAwMDAwMDAwCj4+PiAgICAg
ICAgICAgICBzeXNfcGxsX2RpdjE2X2VuICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDEyMDAwMDAwMDAKPj4+ICAgICAgICAgICAgICAgIHN5c19wbGxfZGl2MTYgICAgICAgICAg
IDAgICAgICAgMCAgICAgICAgMCAgICAgICAgNzUwMDAwMDAKPj4+ICAgICAgIGZpeGVkX3BsbF9k
Y28gICAgICAgICAgICAgICAgICAgIDEgICAgICAgMSAgICAgICAgMSAgICAgICAgMzk5OTk5OTkz
OQo+Pj4gICAgICAgICAgZml4ZWRfcGxsICAgICAgICAgICAgICAgICAgICAgMyAgICAgICAzICAg
ICAgICAxICAgICAgICAxOTk5OTk5OTcwCj4+Pgo+Pj4gRml4ZXM6IDA4NWE0ZWE5M2Q1NCAoImNs
azogbWVzb246IGcxMmE6IGFkZCBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIiKQo+Pj4gU2ln
bmVkLW9mZi1ieTogRGEgWHVlPGRhQGxpYnJlLmNvbXB1dGVyPgo+Pj4gLS0tCj4+PiAgICBkcml2
ZXJzL2Nsay9tZXNvbi9nMTJhLmMgfCA5ICsrKysrKystLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvbWVzb24vZzEyYS5jIGIvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4+PiBpbmRl
eCA2NmYwZTgxN2U0MTYuLmY3OGNjYTYxOWNhNSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvY2xr
L21lc29uL2cxMmEuYwo+Pj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4+PiBAQCAt
MTU3LDcgKzE1Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBnMTJhX2ZpeGVkX3BsbF9k
Y28gPSB7Cj4+PiAgICAgICAgICAgICAgICAgICAuZnJhYyA9IHsKPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLnJlZ19vZmYgPSBISElfRklYX1BMTF9DTlRMMSwKPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSAwLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
LndpZHRoICAgPSAxNywKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC53aWR0aCAgID0gMTks
Cj4+PiAgICAgICAgICAgICAgICAgICB9LAo+Pj4gICAgICAgICAgICAgICAgICAgLmwgPSB7Cj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX0ZJWF9QTExfQ05UTDAs
Cj4+PiBAQCAtMjIzLDYgKzIyMywxMSBAQCBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgZzEyYV9z
eXNfcGxsX2RjbyA9IHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSAx
MCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLndpZHRoICAgPSA1LAo+Pj4gICAgICAg
ICAgICAgICAgICAgfSwKPj4+ICsgICAgICAgICAgICAgICAuZnJhYyA9IHsKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX1NZU19QTExfQ05UTDEsCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAuc2hpZnQgICA9IDAsCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAud2lkdGggICA9IDE5LAo+Pj4gKyAgICAgICAgICAgICAgIH0sCj4+PiAgICAgICAgICAgICAg
ICAgICAubCA9IHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnJlZ19vZmYgPSBISElf
U1lTX1BMTF9DTlRMMCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSAz
MSwKPj4+IEBAIC0xOTAxLDcgKzE5MDYsNyBAQCBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgZzEy
YV9oaWZpX3BsbF9kY28gPSB7Cj4+PiAgICAgICAgICAgICAgICAgICAuZnJhYyA9IHsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLnJlZ19vZmYgPSBISElfSElGSV9QTExfQ05UTDEsCj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5zaGlmdCAgID0gMCwKPj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIC53aWR0aCAgID0gMTcsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAu
d2lkdGggICA9IDE5LAo+Pj4gICAgICAgICAgICAgICAgICAgfSwKPj4+ICAgICAgICAgICAgICAg
ICAgIC5sID0gewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAucmVnX29mZiA9IEhISV9I
SUZJX1BMTF9DTlRMMCwKPj4+IC0tCj4+PiAyLjQ3LjIKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0Cj4+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+IC0t
Cj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
