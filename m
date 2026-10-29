Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE414606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 02:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXEqohAD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=YfL6swxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8hiwMs3tnecXexXYBAz6T2PzpGh+7u/jCJ2U2FrdJBY=; b=EXEqohAD2tAA5ktgg08NuC8VfZ
	ZVrUhTZWLe7+6tWVOtO2OLe4f/y4GZGudZBMeDKMFBGEsygNZ3NCnWvVTLXRvRRQNCWochrIvnnlc
	IT+4lpv0c6eG/VfvVLF1mIiAUonxcpQ2fjHfe2b5oG+cC/dYE7GibqkNJDXDPsQDQHEwuFrp0/448
	dw+83hoQCoF9Qs6jFLidiAdUCBrODb/xKjKfZHm6tZdkL4xiYnM11caIbgiMhQ3aAhbkheFgToza0
	+d2iTtolLRt1wx4OtPRexr2IriHrOO06oAHoAuODEbevH4EMK7E39eaZCjIHghWiAVfnIhmzxfbx2
	JLPHgztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGJb-00000008Dr4-44Ox;
	Thu, 29 Oct 2026 02:56:31 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGJY-00000008Dpt-0mzr;
	Thu, 29 Oct 2026 02:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf0gv2qQslJAk7lQWjBteK7H2SC5wuPrrJvzt1blBs1Gu6GKeCfA86jCtxHmvhBzd0yQ1GELsoZhu0hMf5ol6KZN2Zu3x0wCIepn6WGApB6UEqqNoGJ9Gj2X1vOberNK6gwNjUcl/32JtVC1SBKn74iVBRib4wDJcZVr9G26ih/zT3Z0a1Nb64Jdf0a6ZO5sY6oZ9lv8E3+66FilnBmEU8V5mOaCtSVdcZ1NQLP3t8m2OjWG9zDRUWLz2Y3vwWgJQ4BoAMB5iCXIFzdFLHYtq1c4b5cVtfI1LJjLq1qvhv4i9HpeO1YC9vF3lQfCz0E8yo4akUDTd5ASLH+9N7+K7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnrs2FdnwHWCgKg0SmW1qSsndTGKhMKWtE98bO4UpLg=;
 b=bVS/IKjSK30obqA3O0OREyy9kpX4FNjFmn3Q8Je2VLF59xJS6PXjOLgdBDb1fC8EFLh0u9etAmzKEmEV9uN1aQu4AQklHnQ+28ihfakty6zZ+Lej+hayJEQoX/Zw9XoCeJ/xA4BXVoffmX3qiCmo5kyhpMgtFOHZh2K7wMSj8Pl2oHrrxYTpyLbk04Eeceq5lW2jlgmCzl7QTsfHk7E1j71CyuaTLJOqI4cJq8RGbCyORx7Z/lwae/0JUkFVL+DbMe/h7ZjF7UlZGzGUhP3m28xQ5srtyPk7rw83LO0TMrw49GkqWj1OiEC2m6QpLt/iU77XCAjsgVAFwg/lGZct2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnrs2FdnwHWCgKg0SmW1qSsndTGKhMKWtE98bO4UpLg=;
 b=YfL6swxfD17sRy2P8FLRzlfzyDz9rM+U7NUK3RUl/La+sOpNmLIj6c3KdYUYmqgdQ+sYZiy54RF7E8VsSm6Hmt2Pa7Vp4s72U0rNlDPV+lgupubUZ14BkAPnTj5lXapTNTeuoAX5cpjRpmvRniW/Zn4v9iVu1xDQavplxyjlZmff/6iAXrOAYZLXmvg0g525Fjmf6WVT60/cfZHryK+2piUtwTC3hPg6yujVMe/hjH2z7oz7xdftSCcc7vH/Zb0HDYF4T+pdBJkJJ9zNNTQBPYqRmhluI+b3WTKkc8kaiQN89Hy6npDmTBKYCHpv3W0qnxEJfFB1wkNv6Kkw4/kddQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21) by OSNPR03MB10495.apcprd03.prod.outlook.com
 (2603:1096:604:47d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 02:56:19 +0000
Received: from TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7]) by TYNPR03MB10226.apcprd03.prod.outlook.com
 ([fe80::ff5:e524:cf10:5d7%6]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 02:56:19 +0000
Message-ID: <6009f35b-b1e0-458c-85d4-08e4bfb1db86@amlogic.com>
Date: Thu, 29 Oct 2026 10:56:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
 <20261028-sparkling-objective-cricket-a428bd@quoll>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20261028-sparkling-objective-cricket-a428bd@quoll>
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To TYNPR03MB10226.apcprd03.prod.outlook.com
 (2603:1096:405:3c1::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYNPR03MB10226:EE_|OSNPR03MB10495:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b7f319-7190-4a34-2118-08df3568353c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: qHvFRTiC5JOur0ghM9aekSI9hudhyLMr4Iy7Li46BFhxxKPzzovpy46TTjLMhaIHvJJign2brdLwsjglvE/20pl8E3h33CMB+eu57smHlhD4wnxdsjiuwEA1p0hMucj+tJEEYzPoY3dLmI9H21tPchvVhIetxvkIqzK073c994JgSgjAxxK2J5rsyux5B0F244JMgzQHKGMmIT9kH1irJnUVSN/rjrPwSmmAkYtb3GqnVr+s1M6Skn80LD1PadMLwoRY4U8Ueo72JYOVdq4v52kLG/Ecmr85OIf14DeUPVKFJvJCT+pQA5A3ukxUju7Z6GbSGiNen1+r/p9fgLv2M9hE8t6hsyzFw/XImYfQsD/h/pldZL3pywjuS2iBaMC+IK1oXItjBKDRooB0zsy0lr/4Ml520SVfgLQipidVjT99RJSmLBfmHjJ3h/JKE5DJFqDo337YXMHrspw4EVWJHkyGBTlU+gmswH/TO5/oLkVQFtmncJiQk04OskgmGduW5znOne2YfHPsUPJhXqBHYyAWuF7IzRZdEIkiXh+dwFL4sYx6nDJxRnzDCifNrPLe/mvBLWhgIW/ljzzeIsLTPBPQSO6Yx0gKwfbJCxjGjOMsygDnPAN2ufyibFHLwrFHloy/RSq6PsZAK9/OsiILGJwuKnuhvz1QE15ZsipCzxE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYNPR03MB10226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZvUFpxMWk0NUdheE9HMmw2MTZYT3ZlSlorUnQzaUdaRFhha2RnR2t0Slg0?=
 =?utf-8?B?eERmWUtXbnV5dlZ3cVoyRDNjcDNsL0tuVEtxZDM2NHBoSDQ5dnJraDJjU3pO?=
 =?utf-8?B?RVRrdWtBd1ZESVdzUjhJNmVaKzNaUzhYYzRyYnhKR2lJSVZMUnl6bmx0WS9z?=
 =?utf-8?B?K0puTGdBTnduNkVqVFJsZ2ZPOU1obHNNcjU2ZzQzeXFvT0lNK24wSUY1STlq?=
 =?utf-8?B?SGhwN3cxanBHMlZqMUdTaGRCQVpKcEM2WWt2b2ZGY2lITjN0c1BNVkZ4dXlP?=
 =?utf-8?B?c0dUT290UHZsMExBd1BmcTdMOXJyTHJ1N3M1TFFlTXZvdkd3NktDbWN4Z3lM?=
 =?utf-8?B?Q2NDaWdXSkNrd1RvdmNIRGRiVG9pamdpTVFTajV1dzJ1Um5QcEp2VEFDTzBB?=
 =?utf-8?B?c0FHeEhFMXZ0amhjQ0dPam1TRTdZUTl6bkdTQXliYnFkMnd5dVZ5RWQzcHBk?=
 =?utf-8?B?bXdSOVJQNnZobXVlb3BmS3pKSXVydW5DWHZ5NVFLaEF2L1o0SzRqaUJzRmpM?=
 =?utf-8?B?THRjZHhUQWYrcWcvbE5BUU1mQXFLZUlrWXRoekNvYU8wZ1p3YlRNdHFWZTZO?=
 =?utf-8?B?QUJjblJOaEhpREJhTDNvNTl5dmRzNm5UalRQenc5MHlnc3E3RUdDZmtXc1kz?=
 =?utf-8?B?V3ZwVmcvclRYM3RiWjEwNkM0WVRVN1VFT2ZtNXhoVFczVmRxUTdpZ2o5MjZZ?=
 =?utf-8?B?dE5maHFWSXNsSjE3YmY2dVJqZys1K3dkS2szOTRZdGN0UHBQREplaGRmMmNN?=
 =?utf-8?B?Vm9YKzIxK1VvdWpJWEFYRnMxbFUrQ3F0dHhDMGxNWTdPalg1NUViYksxSk94?=
 =?utf-8?B?Z2tBYnRmQ1RHL1hqWlZiU2pQZDZnTlYxSCtUZmhiZVB1NE9KMExrakdjK2c3?=
 =?utf-8?B?RzJzL2VpK0dqNzdoeWtrWmtNc2xGMkpsSlZmQXFOYTRaUllyelROWjBHZ050?=
 =?utf-8?B?MTVncjcrdS8xNklzcDVpWjdiZEd0SDNxQm9NbElnUEpXVC84S2dqRWpveEVv?=
 =?utf-8?B?NDZLSzA3Z21ET0tUblducFNza2hBVGIrZjByK3F3dldvNWlDb1ZIRzdxaGFU?=
 =?utf-8?B?dlVBZ1VVUS9kT01Da2xqVlF0SWcwdk1tUHQrbEhHSlZPV3ZPSXJBMjFrdmNT?=
 =?utf-8?B?ZjM2ZVRHbmora1JBRktwSGtWOS9JTEhlbnpVUEROdHYxNUQrSytpekJmVTd5?=
 =?utf-8?B?ZW9Zc20yRXlVbk5jOCtHWFdCZUpRbDJtb09CM1lqYnVoM2U3WlMrSElxOVRk?=
 =?utf-8?B?UC9qbExwM1lwWHN2S0dLOTRCQ2hRbDd4NFVERTJMclViL0RYZTJPcVVWR3NJ?=
 =?utf-8?B?SDZtd0J3cjZHbmtlY1d5aHVSTDZrN3VnSFdwMlJwNnljajhUL0pKNkF4cE5p?=
 =?utf-8?B?QUsvRTg5bGxIa1owUnpBcGFxU0hOTm5vV0lFRlNmc1paTlpMK2lpOXpiUVlL?=
 =?utf-8?B?VDk0SG5WWW4rRzg3Rlk0dGZBNkd0bXA2N0IwSU9ad1BvdE80TElkZWxYUlY3?=
 =?utf-8?B?VUZJVlNrNThvanUvK0R3U0xGVElDR3ovZVhic2Nsc1Z6M2hXQXl0S2d6Zkh6?=
 =?utf-8?B?Y1FZbWlJdFpWUlMwbzdaT2NNaVdkZnBQV0RkRnZvNmFFNG94TzRTUnZWNjRO?=
 =?utf-8?B?cTZQbzVCcExaZ3gwYmN0U2NpN1Y4Y1hheW9KQ1U1MlBHK25WdU8rVUQ2ejRq?=
 =?utf-8?B?SlVOM2E1NDFHNi9EaUxQOWRnYmYvOU5Cb2pYc1JFeS9JNVZMNk5WSWszNURr?=
 =?utf-8?B?RThnUzFGUnlHNjlPQUNUOGd3bFdQTlZjWjMrZ1JzVFIybE9vTmJMejVwVnhI?=
 =?utf-8?B?d2dwaEF0Z3pLWExvOGpEaGVSTlUySW1UOFhEWDhwOU5hcGxSUDF1NGZEVHdx?=
 =?utf-8?B?RkJrTFUvSkNBR053WVFwL2lySzV2SzlzeWNQck5lQjdzUnp5VXlScVNJVVJU?=
 =?utf-8?B?UzI1ZFc4Y0haOE5XbGxWdy96dU9BcVZOR3cxMldzelVnSTZ5VUFlNHVsaUtk?=
 =?utf-8?B?dFlXdjl4YVJONjYwRjR6THcvdXFGbWtoNjY5Um1HR2c4M1RqVnpNVllwNU9a?=
 =?utf-8?B?RGxKV0gyaXZicS9TOWZ5S0JSbDYzM0ZaZGhCcTVsaE9XT0FEdFhEWmZ4ZDdF?=
 =?utf-8?B?TTFhTEJoREZkL3ZBQlRRd29YK3VwajladmV3QTNDcDIzcFY3M3BIbkZ3Q1RM?=
 =?utf-8?B?TVRVaUNQaUF6QUdvRlJIdEs4Skx0dngzaytRZHJlR3NYMFVaVTVCbE1BRm5o?=
 =?utf-8?B?dTBZS1hvK1Vtd3BGKzN6a25sbXpxTzQvcEhnY3RyZk1vYmdSQ2ZYbDRMSnJW?=
 =?utf-8?B?aktjem9xMlBncnpBTXY0NEFVZitqRzJVWkNvOUdtamFRUlZUTGtwQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b7f319-7190-4a34-2118-08df3568353c
X-MS-Exchange-CrossTenant-AuthSource: TYNPR03MB10226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 02:56:19.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeIDULntJPEm8AxruLSJTXtTpGOmVh15ph24RGqvqzqUQh4PrwzWfMQGC1SBa4gvopYUkUFQ84CVYMtlT8OK1vs6WuUAmW/uRg63DpaoBgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_195628_633765_1AB9B2D5 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CuWcqCAyMDI2LzEwLzI4IDIyOjQ4LCBLcnp5c3p0b2YgS296bG93c2tpIOWGmemBkzoKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPgo+IE9uIFdlZCwgT2N0IDIxLCAyMDI2IGF0IDAzOjA4OjI4UE0gKzA4
MDAsIEppZWJpbmcgQ2hlbiB3cm90ZToKPj4gVGhlIGF1ZGlvIHBvd2VyIGRvbWFpbiBoYXMgYmVl
biBmb3VuZCBvbiBTNCBkZXZpY2UuCj4+IEl0IG11c3QgYmUgZW5hYmxlZCBwcmlvciB0byBhdWRp
byBvcGVyYXRpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKaWViaW5nIENoZW4gPGppZWJpbmcu
Y2hlbkBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YXhnLWF1ZGlvLWNsa2MueWFtbCAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKystCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LGF4Zy1hdWRpby1jbGtjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4+IGluZGV4IGZkNzk4MmRkNGNlYS4u
NjlmNWZlZjVmMTRhIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlh
bWwKPj4gQEAgLTIwLDYgKzIwLDcgQEAgcHJvcGVydGllczoKPj4gICAgICAgZW51bToKPj4gICAg
ICAgICAtIGFtbG9naWMsYXhnLWF1ZGlvLWNsa2MKPj4gICAgICAgICAtIGFtbG9naWMsZzEyYS1h
dWRpby1jbGtjCj4+ICsgICAgICAtIGFtbG9naWMsczQtYXVkaW8tY2xrYwo+PiAgICAgICAgIC0g
YW1sb2dpYyxzbTEtYXVkaW8tY2xrYwo+Pgo+PiAgICAgJyNjbG9jay1jZWxscyc6Cj4+IEBAIC0x
MDAsNiArMTAxLDggQEAgcHJvcGVydGllczoKPj4gICAgIHJlc2V0czoKPj4gICAgICAgZGVzY3Jp
cHRpb246IGludGVybmFsIHJlc2V0IGxpbmUKPj4KPj4gKyAgcG93ZXItZG9tYWluczoKPj4gKyAg
ICBtYXhJdGVtczogMQo+IE1pc3NpbmcgYmxhbmsgbGluZS4KZ290IGl0LCB0aGFua3MKPgo+PiAg
IHJlcXVpcmVkOgo+PiAgICAgLSBjb21wYXRpYmxlCj4+ICAgICAtICcjY2xvY2stY2VsbHMnCj4+
IEBAIC0xMTUsNiArMTE4LDcgQEAgYWxsT2Y6Cj4+ICAgICAgICAgICAgIGNvbnRhaW5zOgo+PiAg
ICAgICAgICAgICAgIGVudW06Cj4+ICAgICAgICAgICAgICAgICAtIGFtbG9naWMsZzEyYS1hdWRp
by1jbGtjCj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxzNC1hdWRpby1jbGtjCj4+ICAgICAg
ICAgICAgICAgICAtIGFtbG9naWMsc20xLWF1ZGlvLWNsa2MKPj4gICAgICAgdGhlbjoKPj4gICAg
ICAgICByZXF1aXJlZDoKPj4gQEAgLTEyMiw3ICsxMjYsMTggQEAgYWxsT2Y6Cj4+ICAgICAgIGVs
c2U6Cj4+ICAgICAgICAgcHJvcGVydGllczoKPj4gICAgICAgICAgICcjcmVzZXQtY2VsbHMnOiBm
YWxzZQo+PiAtCj4+ICsgIC0gaWY6Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBj
b21wYXRpYmxlOgo+PiArICAgICAgICAgIGNvbnRhaW5zOgo+PiArICAgICAgICAgICAgZW51bToK
Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLHM0LWF1ZGlvLWNsa2MKPj4gKyAgICB0aGVuOgo+
PiArICAgICAgcmVxdWlyZWQ6Cj4+ICsgICAgICAgIC0gcG93ZXItZG9tYWlucwo+PiArICAgIGVs
c2U6Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBwb3dlci1kb21haW5zOiBmYWxz
ZQo+IEFuZCBoZXJlIGFzIHdlbGwuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
