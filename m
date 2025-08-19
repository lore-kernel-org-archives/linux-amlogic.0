Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6892CA0EE6
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Aug 2025 03:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNPq3ACX4LhGmxLr/tHR4xWAWBN2KMHvnpsI0O1XBMY=; b=Gp9G80tK7X6l1MMxlwLyM7qfnQ
	5ffgE3kuUdzfLb83rcttduLj7AWE2VVcKAGzN4lbN8YRaS3WaNIiXVPTw6TZ6AcYQ9zSjPKAvsJdY
	l9YwL2cIheSU5x/x1/To5g54ovEMlQ33YowUvWEhJlu5kWgJG4BUX/HvNMd5FiDRULQwTdJsy9qQ3
	ZXei8KgRmbJFmEmelx/loShD40utGVuYqhDbENP8f6K0FqOTLv2sOCDptpqpBO/Narmg8il5Make0
	6SVDIeRHlRDPy9L/CTNtcr2rrzqJJG3WjB5We2ntHq3nMgRyXREK4zF1vkI0kNzMsGGobJw+g7B3r
	ZMteC+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDFQ-00000009IJ4-3r4Z;
	Tue, 19 Aug 2025 03:42:56 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoD5l-00000009GpC-04fm;
	Tue, 19 Aug 2025 03:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oH2yDws9yiNBoc4ekyCoUx9mMfqWrtc2Gfz0Y6pexVQjt4/fqB0dQJH4ltIirdZXnw5k5DRToVAcYl0s45m41xGd7jPAUKz9XXYSF0bPNJR5plc1NVLmDyvEzl6x8fNpJkP8ObVtphfj6ATd//QcjdhMexE5LPicXUEc6RLSE1MdM44492RiXk1wNon2VzitgV6zDky120TU1PI8GHp5lqZCelw0mtyK0xrkRs9GSqnRCAeoXu29jTIeptRPjK439hPPqKWtb+Lp3txI4AjyXfYX9l1R7aB1XNudJKVhziRDUZVUsSU+Xh2KQTv6Kakdz2Lb+KfB8ntE/95MAy/6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FegF8Rm3/DS5oCAtGT5ZHuCNeH3IRH7aqBU3LdLR2PA=;
 b=DCAqI2lHhRjQVe/EL8mze0odDIpYc1PeAF5qOzcXPwzv0uphSQeDBsmdpRqQ5Zdfyqto2BBqFeVfP1Agqg7f2YRBYqWxPvpao2jLcEM1fReQhItjO3RZcJ7F4Gln/5eQiKdnuE5ygA4PftcK67Xv3y5ooPY6qx+9eI2i3TT0zeUQEjJhLoK+wYCqGKllYIJwJ6yVng6iqygDM4DZIlWDRoV8avILyiMYJEDpfm33WtlWoAbatDBnhSafGoWM+91KH6cqiYIcwPfNHoWR64lzGONvMjHheGojm3s+8NIu2JS/fpe+9NBBe+gGZsVZtKnNQZ1nbssUOds+6klwCrh3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FegF8Rm3/DS5oCAtGT5ZHuCNeH3IRH7aqBU3LdLR2PA=;
 b=ymyevHISRTTi+l7353CXYfDrWJOLs3fAuWTTo2U1PiLXudDdW7Mz5VrLYyIZbfAi5HJvKOysLtTlCu3v1ZN5qWuuMt9T/xnLd/wtfDSuSHquQ8VKAInud4NxFbPbVE6DsVggeAK31Ebb9x63tVfV0fcKt0jkR3DZGZ+mQwGqDGzWv/vTOiww/KWSSDPf6aufRyIbOdCZwuuR2H+qagA6I+t0RYDrRYxt5sdcYkUxpPuBgvIUyEXLnHwp4mBMeKqm9D93Ev8+8+rE9uJHrS9bU+B8+Qr5SCKrJm2NHGXCYOcUhfcwmYRmVbQAznpjWvI/ueZsbgsCajvUT6l2amucbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYSPR03MB8445.apcprd03.prod.outlook.com (2603:1096:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 03:32:47 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.9009.018; Tue, 19 Aug 2025
 03:32:47 +0000
Message-ID: <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
Date: Tue, 19 Aug 2025 11:32:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to support
 clk-measure
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYSPR03MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 32df7299-90b2-40eb-0a64-08ddded11131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdsWEJoN2ZUcmdJUVV4T1l6ZGtQWEpqZGsxdE1pR2Yzak1nYlBrS1l6TEI5?=
 =?utf-8?B?Uis5UE5tVkJzWFVNZ3VGaGYwNkNjOVIySnFWYXZiSjJ1RUQxRG4xMWljK2Fu?=
 =?utf-8?B?TWp2R0Fpa2VkcVBCRWp0ZnU1NHJzQ3d4RTdUMktQQ0Zldyswck9zd3ZteCtR?=
 =?utf-8?B?aURkZ2NRa0JrN2o1NjdUaWNHZmdzaUo4ZTRVL0FQR295R3R0Z09jSW9ycHFN?=
 =?utf-8?B?em51U1REaXBBWkJnbHlKT0xqaSs4enM4QzBhNWJFdUdVWGlTSFN2L3N2YlJD?=
 =?utf-8?B?SWFldG5RYy9rWjlKSlJzN2lOKzdCdk1DcFhqbDJCbjNMdzJvWVdLL3NFV2U5?=
 =?utf-8?B?TGFDajRUcDBCVDFKczA1MzFUd0dBSlpJT2FvMGYwei83YlRjdUs2WjMyTWoz?=
 =?utf-8?B?YSs1L0o0bU5WNEZXNW11ME05T1Z1RUxsT1VXejAxbjgrNU93cjA4RjNKSENx?=
 =?utf-8?B?dUQ3SWVRQ09mRW1JNUYrYk5nQkJKRzNmUzZOVGEySVNKN0l3N0RYSG5Jb3d1?=
 =?utf-8?B?QXFESjBXLy9zMnZKdUNzMFRJdkRKWkdCVEhHS0paRzc1YkZEMUQ5aE4yQUJD?=
 =?utf-8?B?YkowWWpiNnVYZVJlTE44V1NDSmdhY252QktNYmc3TkoxeUtKZzNnZU5zUXFs?=
 =?utf-8?B?ZzBZZ3VZOVNCeWR1dkVqTnN1aFNKRXBOUzlJMjR1UDJGTnYvRDczSU5VbWlL?=
 =?utf-8?B?UmI4cGZKWXdCL2NTdjlCQVlpK2hiMHFPUVBORWY0NDBrWXYvazIxaUVNYXVD?=
 =?utf-8?B?MEx0cm1GV0NROERRWlFjNDBUOFJjVlFqTEs2VFJyR1EzSVNqWnpXeGM4RzJo?=
 =?utf-8?B?UVliR1M5S0VvTHZ2VzNOWG01T3ZnLyszTHBublZISDhWdXA3bXZySXFkYmZN?=
 =?utf-8?B?QjQ4YXFqM0xKM1JtWUc2dWYyWTBiSjZoeE1YSGh5Q0dYUzdWNTQrNmkvZzBF?=
 =?utf-8?B?UXM5cmJDWFdXTDRIQ1VRVlo4WURJMzBIUFJ3NkFJMUpIYzVyeGszdFl0cm5H?=
 =?utf-8?B?S0ozTDZlZEl2STlJSHhvZ2pKL29VRFd4QzQyaktDbSt2R1dPcU5vbkN0ZU1J?=
 =?utf-8?B?aEJnekJhczRUVHViRndVVlA0YUZnYTc3cTAvZTRTdEhJT29PNHlHdVVBSGVm?=
 =?utf-8?B?bDFETGlWL3NJRVl5UGFmRUNoYkdhd0VsdkxLSGdZZ3pIZXVMVGtQcmRsWWNY?=
 =?utf-8?B?Qm44SGM4bmlkL3g4K1dkdDJMVG1HTFM5THZ1UXR6aWk2RlViK210czVXcEY5?=
 =?utf-8?B?VVVXWDdnT0RDS1gwaFU0a1dBL3FuODZSVzVIeUl6VXFITWN4SXA1djNaMWt5?=
 =?utf-8?B?RUFsZUphS0Y5bEwrWll5bTNHVTcvaDdiUGJ3Z1l5ZUZlNnJ6WDFVSEh6NXM4?=
 =?utf-8?B?c1hvbTlxTVc5bHFuZlV0cjBTeTRhMk41U01UdGN1VUVsVnFEMXRSS2ZGL2Jt?=
 =?utf-8?B?N3F1ZFFEOFAweW9kamdWQlJ4Y2lmYVhvQWJVSDQrTGc0cUJMSmRiUXRsMC9m?=
 =?utf-8?B?bmx6c0NvdFZHWVQ5WEwwQjcrVWxDZllDWlFxdUMvdjdJWklUd3U1a1BNT1Zo?=
 =?utf-8?B?Z2RpejNMSFdxeGNaWmhHL3VHVzk0a1p0Q3k1bDlPUnZCRml2K2grK1AxS1dm?=
 =?utf-8?B?Ujk5bVRnQmpaZ1JndjA2dDUzOWFjUGZpbTlCdlBwZ3BRdkVPZk05cVkrRmxC?=
 =?utf-8?B?U1BZQ1Q5MFZuVXRrb3FJT3pJS1puR3NRenpJSjUxUjA0S2pZRldOYmZmbnJM?=
 =?utf-8?B?a3cyY3YyTVlsVW53QllTNzMzeGNYdEFuTlVTMGVBTkhpTXJGZnIyb0RYdFU0?=
 =?utf-8?B?a1YwaEk2eGVrUkU3WGNQeVZGRWlUdDdwakQwaWpSdnM3U2NYMG92VVhONlpT?=
 =?utf-8?B?UVkxN2JBcXRQMndEVXlkdmdFRnloTjV5Z0d1WitBU3dvMUVwbEJ0dGdHSVIw?=
 =?utf-8?Q?0dOUtXYzPtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWh2TVYwUXZadC9QaUVkZDBIRUduMmtmaFNDMmlJdytna1Jpblc4WmpBRzFt?=
 =?utf-8?B?akhRVUhlamh5MEtaeU9VaGZKZDhRSEhRYmVBMUhZUkQyb2haZmlDY3hxQzM5?=
 =?utf-8?B?b1hTVXREbFdobUhsS1owaFRzbjZydE5ENnpKQXZMNjZBUldLM2ZaTlB3UHdT?=
 =?utf-8?B?QU1lWFJOWU9SZ1oySUt5S1ZyVnJwVVhPcldhZ08xaXdaMmQ5ejhzYkd1ay9F?=
 =?utf-8?B?akRJakdmK1FtblNoWnFhSkVUQ3dnOC8rMDFZQlJ2aE5RWU1BU05YdjVhTGR2?=
 =?utf-8?B?b09nTUtZN2lXaVlKQXN0ayt1aHB2c05jMzdZTkYyMGdVNnU1bUozWjRvL3hn?=
 =?utf-8?B?TW56T2hpckJ0VXVYYlNNVVdzK2RNQUpyWXQxcDRiNVdneWdDY3JXOXF5NHdw?=
 =?utf-8?B?bEpSWjgxaTlzbWNqMXBoR0VBTm9JRWpjazhuNEhHektlWG10OFdRRXdnS0Ry?=
 =?utf-8?B?VHpqYkYwSE14M1hLTWZZNlQxVnE2SERxcWdBRDdGMUlYdStLdDFVWkV3NE5N?=
 =?utf-8?B?eEpDQzR2aCsyVWpkVlNBejFTVUNQSTVCcUg3aHkwZWc5bm1BbnBmVWVRM1E2?=
 =?utf-8?B?enRSTXQzOHlZUXpSVVV4OHlJR0gzcWdUWkZBQ0JGY29telZJTVRjSWs2R1Fr?=
 =?utf-8?B?MlVMb1N2RUx0QVVEQXpLYUF2NEVHUnlzQVlHVzNpdnAvNXMzNzNrOGVzY2Nm?=
 =?utf-8?B?NVFYRTBPK01XV0NkTHJjZm4relFNaVdEQS92T25Jb1VyZmsyY0ZIb0NvaTdK?=
 =?utf-8?B?cEFYOTBRN3FhRm1pVmpPTW4rUmNkY0VtS3FIL0JPQXFTTnV1YXZrYmNZMXFp?=
 =?utf-8?B?eWNiQy9jMFd2WXQ4RXpwUk9JTUFzbTNCQWhPR2pZSEpuVnpzSWNOYWd2UTZ0?=
 =?utf-8?B?bjJENVNCZ1lMTmFSRVJkQ3lxNi9zSzVFTzljZUZReGdKeTBWS3hrMFVmOU9C?=
 =?utf-8?B?VHFPMmwzTWR4K0hmdkEzRGNCRWtkcmJPL2kzaVBFVzlnYkcrRTVETjRybDBw?=
 =?utf-8?B?MFJCQ3JaSXd2L254bFlmR2ZlRnJXbW84bWl0QWQ2SGUyeGxUeU1OQTRyN1F2?=
 =?utf-8?B?b0pQNmVoUGthOU1FcTliOUhpY2pkZ1dURjJKSmcycFpkT1FZdkZESld1SkxT?=
 =?utf-8?B?R1dlL3lWcGJQa2NrVVFYODVLcHZqbGxPU2RpdGFiQlA0L0REZk1PbVl2cFZn?=
 =?utf-8?B?OEs0SUVJSjNEMG9PUTRtbmZWSi9uM0pmOE81VFJPZUhoRTVPcWhGdWx2eXRR?=
 =?utf-8?B?WHdnaUt5WGpUOTdMVUJodTlyM0FzZjF2azdSWk5QMFBlMk5jUzBhTzBDcUdP?=
 =?utf-8?B?aXZkditxWlNuVHAvR1FPRHVvWktyQVczL1hnU1RlbmZZYXFJMUpGZ0hTdVcx?=
 =?utf-8?B?SkNXcUJWR3EvTGYyUUk2Ni95RmtOMUhmZERKT25OaldzYU1veGtKd1piNWFE?=
 =?utf-8?B?WXltUEI1NHFqYTE2ZEIrNldPSkdQZEk4NVJnOW8xTmlnMTloZGdYUCtjdzlX?=
 =?utf-8?B?UzVpazJxTEgrZHI3bXh4UFdpalJnTVU0TTRJdTZraklWKzBvOTFkWkF6OGpz?=
 =?utf-8?B?Q3NKczFwRmZBbHkvQ0xFT1JOa3ZjUkp6U3BXSkdCOUZValROT1ZRYWo2VWZo?=
 =?utf-8?B?YXR4dXd5dzZzS2hPWHdlcTZVS0M3cXpCWEtqZHdPeFVEUTFIOFJKcUJ4WER0?=
 =?utf-8?B?MXFVcTlSbUdlb0hUNXR1dmJwWmxOMERYQkNiUDdKWHV2L0pxTUt6VFpKdXI2?=
 =?utf-8?B?TjNRL1BkRXlYajVCRjQyMmFCbWZOamZBTW5oTnQzZy9YWjRKaGFiYzNRMGhj?=
 =?utf-8?B?SmZaUmF1YW5CeTdPUmpzU2c4QWd4Z1lkU3AzNXpqeDNvV1RJVUt3RFkvd0Ro?=
 =?utf-8?B?WTI3MVZmNTBkRTJhUG1KTTBZUXVjakUvL1pTMDkxS3p1aUtWT1N5MUpnN292?=
 =?utf-8?B?N3BScloxR3hKRW8rOXlESlpDelpENThlWEp0QVBVQWVHZzdLTDhBYmxCcGlK?=
 =?utf-8?B?WUM3VjZZMWI0aFVzekp5Z3E1R3I4U2ZkdmVWQnBrd241cm4xMjFNdVpSaHBO?=
 =?utf-8?B?S05hWEFUZjJXUUh2MzZsa256b20zaDlCbFRLMTI1bWxaNnZQWFVDRTZtQlNJ?=
 =?utf-8?Q?OnVGS4yX8njLmMyO5UmVtnPvo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32df7299-90b2-40eb-0a64-08ddded11131
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:32:47.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coKCUH3epPKeLZ5j3rjHV+7kZBypt+uCa24lxWPx+CPqR1EO4x9R5LYVf4n6kDE1haKH4o8roHE15QKpCo287w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203257_178464_AA2DF3A8 
X-CRM114-Status: GOOD (  22.52  )
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

SGkgTmVpbDoKCiDCoCDCoCBUaGFua3MgZm9yIHJldmlldy4gSGVyZSBJJ2xsIGJyaWVmbHkgb3V0
bGluZSB0aGUgYmFja2dyb3VuZCBmb3IgCnRoaXMgcGF0Y2ggc2VyaWVzOgoKVGhlIG1vdGl2YXRp
b24gZm9yIG1vdmluZyB0aGUgZGF0YSB0byBEVFMgaXMgcHJpbWFyaWx5IHRvIHJlZHVjZSBtZW1v
cnkKY29uc3VtcHRpb24uIEN1cnJlbnRseSwgdGhpcyBpc3N1ZSBpcyBlYXNpbHkgb3Zlcmxvb2tl
ZCBzaW5jZSB3ZSBoYXZlIG9ubHkKc3VibWl0dGVkIHN1cHBvcnQgZm9yIGEgc21hbGwgbnVtYmVy
IG9mIGNoaXBzIHVwc3RyZWFtLiBIb3dldmVyLCBhcyBtb3JlIApTb0NzCmFkb3B0IGNsay1tZWFz
dXJlLCB0aGlzIHByb2JsZW0gd2lsbCBiZWNvbWUgaW5jcmVhc2luZ2x5IHNpZ25pZmljYW50ICh3
ZSd2ZQphbHJlYWR5IGVuY291bnRlcmVkIGl0IGZyZXF1ZW50bHkgaW4gb3VyIGludGVybmFsIGJy
YW5jaGVzKS4KCk1vdmluZyB0aGUgZGF0YSB0byBEVCBjYW4gYWxzbyBtYWtlIG91ciBjbGstbWVh
c3VyZSBkcml2ZXIgbW9yZSAnY29tbW9uJwpieSBlbmNhcHN1bGF0aW5nIGNoaXAtc3BlY2lmaWMg
aGFyZHdhcmUgdmFyaWF0aW9ucyBpbiB0aGUgRFQgcmF0aGVyIHRoYW4KcmVxdWlyaW5nIGZyZXF1
ZW50IGRyaXZlciBtb2RpZmljYXRpb25zLiBUaGlzIGFwcHJvYWNoIHNob3VsZCBoZWxwIHJlZHVj
ZQpsb25nLXRlcm0gbWFpbnRlbmFuY2UgY29zdHMgdG8gc29tZSBleHRlbnQ/CgpBZG1pdHRlZGx5
LCBkZWZpbmluZyB0aGlzIGRhdGEgaW4gRFQgbWF5IGFwcGVhciBsZXNzIG9yZ2FuaXplZCBhdCBm
aXJzdCAKZ2xhbmNlLAp0aGlzIGFwcHJvYWNoIGVmZmVjdGl2ZWx5IGFkZHJlc3NlcyB0aGUgZGls
ZW1tYSB3ZSdyZSBjdXJyZW50bHkgZmFjaW5nLiAKSWYgeW91CmhhdmUgYmV0dGVyIHN1Z2dlc3Rp
b25zLCB3ZSdyZSBoYXBweSB0byBhZGFwdC4gSG93ZXZlciwgdGhlIGN1cnJlbnQgCmFwcHJvYWNo
IGlzCmNyaXRpY2FsIGZvciBtZW1vcnktc2Vuc2l0aXZlIHNjZW5hcmlvcywgYW5kIG1haW50YWlu
aW5nIGl0IG90aGVyd2lzZSAKaGFzIHByb3ZlbgpxdWl0ZSBjaGFsbGVuZ2luZyBmb3IgdXMuCgoK
T24gOC8xOC8yMDI1IDQ6MDEgUE0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gSGksCj4KPiBPbiAxNS8wOC8yMDI1IDEwOjM3LCBDaHVhbiBMaXUgdmlhIEI0
IFJlbGF5IHdyb3RlOgo+PiBBcyBzdXBwb3J0IGZvciBjbGstbWVhc3VyZSBleHBhbmRzIGFjcm9z
cyBtb3JlIFNvQ3MsIHRoZSBjdXJyZW50Cj4+IGFwcHJvYWNoIG9mIGRlZmluaW5nIGFsbCBTb0Mt
c3BlY2lmaWMgY2xrLW1lYXN1cmUgdGFibGUgZGF0YSBpbiB0aGUKPj4gZHJpdmVyIC5jIGZpbGUg
cmVzdWx0cyBpbiBwcm9ncmVzc2l2ZWx5IGxhcmdlciBjb21waWxlZCBpbWFnZXMsCj4+IHJlc3Vs
dGluZyBpbiBtZW1vcnkgd2FzdGFnZS4KPj4KPj4gTW92ZSBTb0Mtc3BlY2lmaWMgY2xrLW1lYXN1
cmUgdGFibGVzIHRvIERUUyBkZWZpbml0aW9ucyBhbmQgZXh0ZW5kCj4+IHN1cHBvcnQgZm9yIGFk
ZGl0aW9uYWwgU29DcyAoQTQsIEE1LCBTNywgUzdEIGFuZCBTNikuCj4KPiBUaGlzIGJyZWFrcyBB
QkkgYW5kIG1vc3QgaW1wb3J0YW50bHkgdGhlIGNsayBtZWFzdXJlIGZlYXR1cmUgb24gbmV3IAo+
IGtlcm5lbAo+IGFuZCBvbGQgRFRzLiBTbyBpbnN0ZWFkIGtlZXAgaXQgYXMtaXMgZm9yIGN1cnJl
bnQgcGxhdGZvcm1zIGFuZCB0cnkgdG8KPiBhZGQgdGhpcyBmb3IgbmV3IHBsYXRmb3Jtcy4KPgo+
IEJ1dCB0aGUgZmFjdCB5b3UgbmVlZCBjbGttc3ItcmVnLXYyIG1lYW5zIHlvdSBhdCBsZWFzdCBu
ZWVkIHRvIGFkZCBhIAo+IGdlbmVyaWMKPiBjb21wYXRpYmxlIGZvciB2MiByZWdpc3RlciBtYXAg
YW5kIGRyb3AgdGhpcyBwcm9wZXJ0eS4KPgo+IE92ZXJhbGwsIEknbSBub3QgYSBncmVhdCBmYW4g
b2YgdGhpcywgaXQgbW92ZXMgZGF0YSB0byBEVCBhbmQgZHVwbGljYXRlcwo+IHRoZSBzdHJpbmdz
IGluIF9hbGxfIGJvYXJkIERUcywgd2hpY2ggaXMgd29yc2UgaW4gZmluZS4KCgpJZiB5b3UgYWdy
ZWUgd2l0aCB0aGlzIGFwcHJvYWNoLCBJIGNhbiByZWZpbmUgaXQgYmFzZWQgb24geW91ciBmZWVk
YmFjayBieToKMS4gQWRkaW5nIGEgbmV3IGNvbXBhdGlibGUgcHJvcGVydHk6ICJhbWxvZ2ljLGNs
ay1tZWFzdXJlLXYyIi4KMi4gSW1wbGVtZW50aW5nIGEgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBt
ZXNvbl9tc3JfZHJpdmVyX3YyIGZvciB0aGUgbmV3bHkKc3VwcG9ydGVkIFNvQ3MuCgpJIG1heSBu
b3QgaGF2ZSBmdWxseSBncmFzcGVkIHlvdXIgaW50ZW50LCBwbGVhc2UgY29ycmVjdCBtZSBpZiBJ
J3ZlCm1pc2ludGVycHJldGVkIGFueXRoaW5nLiBUaGFuayB5b3UhCgoKPgo+IE5laWwKPgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4gLS0t
Cj4+IENodWFuIExpdSAoMTMpOgo+PiDCoMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNvYzogYW1s
b2dpYzogQWRkIGNsay1tZWFzdXJlIHJlbGF0ZWQgcHJvcGVydGllcwo+PiDCoMKgwqDCoMKgwqAg
c29jOiBhbWxvZ2ljOiBjbGstbWVhc3VyZTogUmVtb3ZlIHRoZSBtc3JfZGF0YSBmcm9tIGNsay1t
ZWFzdXJlCj4+IMKgwqDCoMKgwqDCoCBBUk06IGR0czogYW1sb2dpYzogYWRkIGNsay1tZWFzdXJl
IElEcyBhbmQgbmFtZXMgZm9yIG1lc29uIFNvQyAKPj4gZmFtaWx5Cj4+IMKgwqDCoMKgwqDCoCBh
cm02NDogZHRzOiBhbWxvZ2ljOiBhZGQgY2xrLW1lYXN1cmUgSURzIGFuZCBuYW1lcyBmb3IgQW1s
b2dpYyAKPj4gU29Dcwo+PiDCoMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNvYzogYW1sb2dpYzog
VW5pZnkgdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgZm9yIAo+PiBjbGstbWVhc3VyZQo+PiDCoMKg
wqDCoMKgwqAgc29jOiBhbWxvZ2ljOiBjbGstbWVhc3VyZTogVW5pZnkgdGhlIGNvbXBhdGlibGUg
cHJvcGVydHkKPj4gwqDCoMKgwqDCoMKgIEFSTTogZHRzOiBhbWxvZ2ljOiBVbmlmeSB0aGUgY29t
cGF0aWJsZSBwcm9wZXJ0eSBmb3IgY2xrLW1lYXN1cmUKPj4gwqDCoMKgwqDCoMKgIGFybTY0OiBk
dHM6IGFtbG9naWM6IFVuaWZ5IHRoZSBjb21wYXRpYmxlIHByb3BlcnR5IGZvciAKPj4gY2xrLW1l
YXN1cmUKPj4gwqDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGFtbG9naWM6IEE0OiBBZGQgY2xrLW1l
YXN1cmUgY29udHJvbGxlciBub2RlCj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhbWxvZ2lj
OiBBNTogQWRkIGNsay1tZWFzdXJlIGNvbnRyb2xsZXIgbm9kZQo+PiDCoMKgwqDCoMKgwqAgYXJt
NjQ6IGR0czogYW1sb2dpYzogUzc6IEFkZCBjbGstbWVhc3VyZSBjb250cm9sbGVyIG5vZGUKPj4g
wqDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGFtbG9naWM6IFM3RDogQWRkIGNsay1tZWFzdXJlIGNv
bnRyb2xsZXIgbm9kZQo+PiDCoMKgwqDCoMKgwqAgYXJtNjQ6IGR0czogYW1sb2dpYzogUzY6IEFk
ZCBjbGstbWVhc3VyZSBjb250cm9sbGVyIG5vZGUKPj4KPj4gwqAgLi4uL3NvYy9hbWxvZ2ljL2Ft
bG9naWMsbWVzb24tZ3gtY2xrLW1lYXN1cmUueWFtbMKgIHzCoCA2NiArLQo+PiDCoCBhcmNoL2Fy
bS9ib290L2R0cy9hbWxvZ2ljL21lc29uOC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDk0ICsrLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uOGIuZHRzacKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOTQgKystCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLWE0LmR0c2nCoMKgwqDCoMKgwqDCoCB8IDIxMiArKysrKwo+PiDC
oCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNS5kdHNpwqDCoMKgwqDCoMKg
wqAgfCAyMDIgKysrKysKPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMt
YzMuZHRzacKgwqDCoMKgwqDCoMKgIHwgMjc1ICsrKysrLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvYW1sb2dpYy1zNi5kdHNpwqDCoMKgwqDCoMKgwqAgfCAzMTIgKysrKysrKwo+
PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zNy5kdHNpwqDCoMKgwqDC
oMKgwqAgfCAyNTMgKysrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLXM3ZC5kdHNpwqDCoMKgwqDCoMKgIHwgMjQzICsrKysrKwo+PiDCoCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2nCoMKgwqDCoMKgwqDCoMKgIHwgMTQ0ICsrKy0K
Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzacKg
IHzCoMKgIDIgKy0KPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEu
ZHRzacKgwqDCoMKgwqDCoMKgIHwgMjI5ICsrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTM2ICsrLQo+PiDCoCBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzacKgwqDCoMKgwqDCoMKgwqDC
oCB8IDMwMSArKysrKystCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
bTEuZHRzacKgwqDCoMKgwqDCoMKgwqAgfCAyNTUgKysrKystCj4+IMKgIGRyaXZlcnMvc29jL2Ft
bG9naWMvbWVzb24tY2xrLW1lYXN1cmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA5MzAgCj4+
ICsrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxNiBmaWxlcyBjaGFuZ2VkLCAyODc3IGluc2Vy
dGlvbnMoKyksIDg3MSBkZWxldGlvbnMoLSkKPj4gLS0tCj4+IGJhc2UtY29tbWl0OiBlNTYyNGVi
NjNjNDUyZWZhNzUzNzU5ZTc0ZWIyN2ZlMTMyZWI1NzdjCj4+IGNoYW5nZS1pZDogMjAyNTA3MzEt
YWRkLW1vcmUtc29jcy10by1zdXBwb3J0LWNsa19tZWFzdXJlLWIyYTQzNTkwZDVhYQo+Pgo+PiBC
ZXN0IHJlZ2FyZHMsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
