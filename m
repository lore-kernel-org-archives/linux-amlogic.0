Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABBE606A32A
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncra/0oq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=O2eEebz4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S8fTFcgCo301CMse4jYzFko3zclMAYzjCHtV9MzAZBk=; b=ncra/0oqp/uYBmWv+aigawYFu2
	cJEc1uW/r6i1h/v4OORKLGrykcM0a7diETtqAxTJUDdYZSQes1EdpmBUfXnS4b+ZEtI6ETn/YD959
	OuW2MGZAaKy3arr1d4Yd1TZRsSHXW0PE27neP0NTM5e2T64F+2vQC/zGzxUMfM++xkt6TobL5U+Fj
	MCcM5a3WxOwqHpbdPTkyp2K/WRCIAkUE5VrlgLBOC8OttLQYUeSJWSvLt89CPRAv82GNl8aob+/mq
	uRkDBo0q9OkOKGp2E08bud6OGeelLKlth8HiUgj3Ct0Dr6xF4LeVyMhToV75L2ecey53hleJJM/44
	go3zGHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvQj-00000002I6x-0Z0x;
	Mon, 16 Nov 2026 12:03:25 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvQf-00000002I5E-2vXE;
	Mon, 16 Nov 2026 12:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK2AgFG0PNKfb8zG1shfUOGNsq/tb2W4mRhUlzZl4UVtei3+1hVs1hid/NgyX307dPJwY/k5LUAU8kv2/2WeJYi0xkbNaM7prPQ4BVuOWzk95zgd0VvAuHPjy/RMxJDYAEZ03ksd99d2wrqFdkKOcJiZsgHOQ3fpN1mR28Wp1ryhT0TTbWJS9B6S4v6MJmoU673ewI1omqrCrNLKZeckKISsrbG4E5Bfi0vwDAFrXvQ6b0UHVwbpgMmkIklg/OVYDdolmqcv8hT4BVP52V9CjyFVATEb/WvZxB7Skyq2LjkV6KbeoOV0odr/RmBOa3ohaYAXmV32nk9zoS8Y76Wp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I/MA66wUnM290t51PK71z+fPKKVCFqjtrdqznh+pas=;
 b=b6Mo0fV0sWcVSPU8rMcApZWuNxSY0kGHEX6gbrz991warA878+vJrYSQuriyoDmSATncm7lkWXfSRv+iR7b6+heGzpzC1Ibt0gKDofN9y61JQFfVmiPL4JjEbRDvXpTbze4WY1hGvxiVg49wFDucxeDGRF1P+VFt0AZZ3FkG1wFFw0021gznUOGqv9gZGG/NNVtEedsAQZKEKX1cOZL7niFxbJRNgJGeo8x3GH2wmXgOK2gu186Ma7Uvm6//Qtq6hKKUWwAC+nil1tOTew1SUio9S9iyNRNGjo47/VpMFIxT8vxKWb1BssHoEKAkmenxI81h3CZocEoKtV2JVkPazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I/MA66wUnM290t51PK71z+fPKKVCFqjtrdqznh+pas=;
 b=O2eEebz4sxezInvNk0cdzLW3eQdxHf0MDcZf4+Yx04sr1u+rL740J+cYxXmEqhhhpnEVkV6B39WFk07rlsIV6wEa5NPqiYuQKRbiebhnhv8fB0DitKLQF11XM6ot7HBNeGG/gIUI7J8TK++tUSTa57PF+JWg2pRrnTJiz3WlNYadqgyA+3EFddk49bvtmSGy2GExh+XtX3SY7bHn9dE6TO9JgiUVyADWFwDOjQdHaXDxAC0qzbUYW5zIMntxcXPXeB0IbAAvRJHbnntHjew43NqzWljRddy5i5XbvB2Re5oR+qefrjpAfdHgbTLJYba9aURqOYp7RRozsg+v7YQuJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SG2PR03MB6610.apcprd03.prod.outlook.com (2603:1096:4:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:12 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 12:03:11 +0000
Message-ID: <bd4c8a15-ab13-459f-8fb5-fe3f3b04af43@amlogic.com>
Date: Mon, 16 Nov 2026 20:03:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
To: tanure@linux.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qingpeng.Yang@amlogic.com
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
 <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
 <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
 <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SG2PR03MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: f76c1b1a-3e14-4c57-c280-08df43d99625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: i72eIpqRrN96wKPS42WPbK1/NggB9t+xvSQ5vsELp1LE4apqhZtr/rlggTFbr/zsZGlzRLoUEJo+n+Denpq/zoVdj16iIEO0dUDPVEyX0eH3zOkjpU4okU2mF3sN1Gjoh/oZcYcEbcELrtuLV2lGDS9G5itZUhUxM9QvZgcMCH4o0R46uiUcWC/HsCX4Fmu4mkXezOomMSf9NfzbYyd7AsGr6Prf7qBth2QnFu1FFLR0vbJsB1XfouZPsl0GTGNeaR4YgHq3lFnXJ9/EwX5fyyM6+uW3nH4Oo8bOQz8IsXOZBoHALi+afc75zsTUKpDgEXMntP2bdDTBHZW1bGdy75ab8LQlWGNpOr8DM99wBgQwrK/4IsNrBYqidF5+M2fssnd7nRr5pgG3ecZ6VaUqtR8UGjOdVQ5w7lEZAJWyYcIxRiT/w6tLwkLGu44vLBBFUX0ptoYbzFqzL7fK6ivu31sljgCaKKViJhrRDgJhpN7FTeddVz9FnZlkSbhSZADvlGM9WiTbfh3Ehn1mVq33T2BOFqQNh16qbM5QbdfyGJeg2ILxwMlU/maeWZQSsbuz2z07BO4viY0N/ZlO9uIcnGJmStw+8qAqokPf5u6kLLQVyDqIon8fz5Gml7ajTnZw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGFQWVpwaktuTGtpdUNyMzB5SUJXVS9mdld1RENKdmtjME9PWXJtckg3THdq?=
 =?utf-8?B?a2dmUHJqOWlPRWVwUFg4a2ppeVNyL0N1dmZEeStkTW10Nm1xcDVsZlRVV3VB?=
 =?utf-8?B?TVQwekI4bHhnVnp0RHoyZWJGQmhIWWZQWG91V3FjZ2hFbVpLR2hsV3pOSGkv?=
 =?utf-8?B?bnN5amo1Tkc4VFUxYTR6T3dhWGxDSjQ4c0FUOUJMZFZyQWhvSFpubWdubWx3?=
 =?utf-8?B?WURYbGI5MG1qVUNFNFJTT2hqb2RtK3d2R1VZSTF3dXdzMDl1UGNlZGxCQ1dO?=
 =?utf-8?B?cndrQkxQZkU1aytuS2xTUkRQOEY0K05rUGE0RHc3ZW9zcm5GbFVGcU5OMTE2?=
 =?utf-8?B?WGN5aTVURHhPWHZjV0VjTlpxZkxXNEpHanBuMi9sa3hQSnVzbk5raU5qNk15?=
 =?utf-8?B?dFBMVjBCQ3dza0NPMlhZN01MWUdPei9iWVpvcEgzQlgvZ01SeWxCcVNQSnd4?=
 =?utf-8?B?Q1RJRVo3aUE1Qnk1U2JiSi9EaHNyVitHSTkzSWJnV0QvWmRzS2RmM0prOE9Q?=
 =?utf-8?B?Nk1hVnAyN1pacmlqZ2dIOWYrU3RiTzFxdmQ3YzZObmZQR2tPWmZoZjFFOTV5?=
 =?utf-8?B?UjlhYk92TURhZmY5ZVkxNmhIOFpod1ZWV0hqWnhkZTJGMzRuSWR4dU9rakJ6?=
 =?utf-8?B?Mk12czExU0lDbjVHaVoyc1lSRm5lRXBJaXE1VFVqbktXdVlVZ3UxcnU1b2U1?=
 =?utf-8?B?UDdKdkhzVWlsekFPL1pGdjI2VW9KbEF1cm5raU16aDdGUTkwSXpZcGNrY0t5?=
 =?utf-8?B?b3BaU0VCWEwvOXZWblVad3FRcmdWV1h2NFczRHJSbm1TS0gwb3J2WTZxUStF?=
 =?utf-8?B?ejhkVFhuMzRoRno1aDhpSVh6M1VEaTlQZEV3eGpvMzNQV0Rmb09hU2tYalhI?=
 =?utf-8?B?OHdzYWlIWmQ4ZnM3YjF4RUpoSm5uZnNaOWlrcFRGaFkzQlphY0JJay9Qa2cz?=
 =?utf-8?B?Q3ZQZ25LRmFVcXhrWWxFSFhEKzUrWjZFUWdsUk1xbTVkUXVSVllkdm9KYVlm?=
 =?utf-8?B?NWIwOURtQTRTaEFMMWFlbDMvT3Q2T0RMQ08vdFZTOVFIU2poOStmMURBV28z?=
 =?utf-8?B?R25IVmhLSVI4V0o3Q2pwYWo4M0xaM0lyc21mRTNFaGFENFRSYUhwYjRVRWxF?=
 =?utf-8?B?TEozTnhoZ09JKzFvQTlqbFdtQzJlTWFWQW5vRm52Smx2S0NLdHY3TjdJRXox?=
 =?utf-8?B?UlhQQmo4VWtsdTJGK1ZVZ0FuWWFaZXNQOHNzbDkxOVJwS2hLRThaaW5VbjZv?=
 =?utf-8?B?alBtNytuQ2M4YUs2UlNvYUJhZVhSaEVvRTlxdzIxcFUyclAyZHZ3U0lQTTZj?=
 =?utf-8?B?NmVucjRsSDhyUjlGdENydVprVTRJT29NdVZQdTJuMmROeXZzcVpENHNUWjhT?=
 =?utf-8?B?MkhmM1hFZlJNOTdQU3luSXBSZ0xlYnpKbEtiOXRyRE1vM1k4Z0UxQlN5OFRt?=
 =?utf-8?B?ZU9NRndkNGdaL0E0TkM5RGN0N1hZQUpMMm5QcGlNeTJaSjZqVENRZHo3WDEw?=
 =?utf-8?B?Z0Y4WVF4TXE0NVhnUDZxR29IdVczNHVwR1JIQlg0WUtTVFRvaXArbkl0TjI3?=
 =?utf-8?B?NUdoWTdFZnZhTVNKVlRYNFExWlNnYU1PYXhYL2tRNTdFTkQ0MEplMW9MMTJr?=
 =?utf-8?B?bmRkbHRHMmtSTUsrWTRPODNLRW56dUJzeDlSS2RIQzd6K3BZQzNhV2RhaVhx?=
 =?utf-8?B?djFhaFRWQ3pzT0JoWVJhSjB0YXlEeXROT1hXb3RJRTJLVWo1SHhrcFRYZHIz?=
 =?utf-8?B?ZTRINU1Sc2duQmZYSkNGRCtaK2czOUJqM2xzU3g2T3U0K2FITGVFcjdFV00y?=
 =?utf-8?B?bkFWNkt3ZXFLWXZTMHdCa1JtbEtPcFNSbGVYdkhRSWtlcTJzODRQVUw4OGhK?=
 =?utf-8?B?WGhvYVhKVDRXVWN6dFUxT1dxYTQzZ2lBMmloZ3hVaGdVajhjUzNXS25nRkR1?=
 =?utf-8?B?UTl6bVUxN0FWbkNsekNkWmJWamM5NVJlMDgvbTRrWkFla3VvL09NaGRPcFov?=
 =?utf-8?B?dnhaZnVYSDRxMjF5T21WcnhyUGJPc0txMVNMVno5SEhMM05jUHJGWld4aXBQ?=
 =?utf-8?B?Y3UrM1F2MXVIK1FYa01DTjhhdGx4TCtwSjV5aGhPTmJLUVE5R3YwNy9wbXhi?=
 =?utf-8?B?NFpCbTh1enZJazF0anFwSEVwWEM4VFpLMkU4VllscmowWW9wcml2S2twR1F1?=
 =?utf-8?B?YmFiZWZUMWRiTGFObW1TQk5INlNNTkJIZXoxYzU0VlgxaEpOTVRkeUl0dkNU?=
 =?utf-8?B?Y245Zy9XTzlwbHF0T2dOVG9IdThlWW5BVWoreFpRNGxQYzQ3Ym11N0NpTTNR?=
 =?utf-8?B?VGlaRUwzZUhzck9RZEtuK1ZpRnhLMklCa0xvekxKbm5jbWhZTDNUUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76c1b1a-3e14-4c57-c280-08df43d99625
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:11.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1bT6460YowAX8n5FRzJCVit5Rhj5TiVUImA42PH42bGI5RZVI/7p2r4W35rte84rWii70XoduibZa0WbASNFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_040321_865961_800B23B3 
X-CRM114-Status: GOOD (  22.73  )
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

SGkgTHVjYXMsCgpPbiAxMS8xMy8yMDI2IDc6NDAgUE0sIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiBb
IEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiBUdWUsIE5vdiAxMCwgMjAyNiBhdCAxMTo0M+KAr0FN
IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPiB3cm90ZToKPj4KPj4gSGkgTHVjYXMs
Cj4+Cj4+IE9uIDExLzkvMjAyNiAxMTo0MyBQTSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+Pj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gT24gRnJpLCBOb3YgNiwgMjAyNiBhdCAzOjE24oCvQU0g
Q2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gSGkgS3J6
eXN6dG9mLCBMdWNhcywKPj4+Pgo+Pj4+IE9uIDExLzUvMjAyNiA3OjU3IFBNLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4KPj4+Pj4gT24g
VHVlLCBOb3YgMDMsIDIwMjYgYXQgMDQ6Mzc6MTBQTSArMDAwMCwgTHVjYXMgVGFudXJlIHdyb3Rl
Ogo+Pj4+Pj4KPj4+Pj4+IEFzc2lzdGVkLWJ5OiBMTE0KPj4+Pj4KPj4+Pj4gRHJvcCB0aGlzIG9u
ZS4KPj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4
LmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgIC4uLi9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNv
bi1kd21hYy55YW1sICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysKPj4+Pj4+ICAgICAxIGZp
bGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNv
bi1kd21hYy55YW1sCj4+Pj4+PiBpbmRleCBlNzY5YzliYjcwZDguLjZkZTAxM2UzZThmNiAxMDA2
NDQKPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1s
b2dpYyxtZXNvbi1kd21hYy55YW1sCj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+Pj4+Pj4gQEAgLTIzLDYg
KzIzLDcgQEAgc2VsZWN0Ogo+Pj4+Pj4gICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3hi
Yi1kd21hYwo+Pj4+Pj4gICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4+
Pj4+PiAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFjCj4+Pj4+PiArICAg
ICAgICAgIC0gYW1sb2dpYyx0Ny1kd21hYwo+Pj4+Pj4gICAgICAgcmVxdWlyZWQ6Cj4+Pj4+PiAg
ICAgICAgIC0gY29tcGF0aWJsZQo+Pj4+Pj4KPj4+Pj4+IEBAIC01Nyw2ICs1OCw1OSBAQCBhbGxP
ZjoKPj4+Pj4+ICAgICAgICAgICAgICAgICAtIGNvbnN0OiBjbGtpbjEKPj4+Pj4+ICAgICAgICAg
ICAgICAgICAtIGNvbnN0OiB0aW1pbmctYWRqdXN0bWVudAo+Pj4+Pj4KPj4+Pj4+ICsgIC0gaWY6
Cj4+Pj4+PiArICAgICAgcHJvcGVydGllczoKPj4+Pj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+
Pj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBhbWxv
Z2ljLHQ3LWR3bWFjCj4+Pj4+PiArICAgIHRoZW46Cj4+Pj4+PiArICAgICAgcHJvcGVydGllczoK
Pj4+Pj4+ICsgICAgICAgIGNsb2NrczoKPj4+Pj4+ICsgICAgICAgICAgaXRlbXM6Cj4+Pj4+PiAr
ICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBtYWluIGNsb2NrCj4+Pj4+PiArICAgICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogRmlyc3QgcGFyZW50IGNsb2NrIG9mIHRoZSBpbnRlcm5hbCBt
dXgKPj4+Pj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBTZWNvbmQgcGFyZW50IGNsb2Nr
IG9mIHRoZSBpbnRlcm5hbCBtdXgKPj4+Pj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOgo+
Pj4+Pj4gKyAgICAgICAgICAgICAgICBjbG9jayBvZiB0aGUgcGlwZWxpbmUgc3RhZ2UgaW5zZXJ0
ZWQgaW4gdGhlIGJ1cyBwYXRoIGJldHdlZW4KPj4+Pj4+ICsgICAgICAgICAgICAgICAgdGhlIGNv
bnRyb2xsZXIgYW5kIHRoZSBEUkFNLiBXaXRob3V0IGl0LCB0aGUgY29udHJvbGxlciBjYW5ub3QK
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgY29tcGxldGUgRE1BIHRyYW5zZmVycy4KPj4+Pj4+ICsg
ICAgICAgICAgICAtIGRlc2NyaXB0aW9uOgo+Pj4+Pj4gKyAgICAgICAgICAgICAgICBjbG9jayBv
ZiB0aGUgcmVnaXN0ZXIgYmxvY2sgaG9sZGluZyBQUkdfRVRIMCBhbmQgUFJHX0VUSDEuCj4+Pj4+
PiArICAgICAgICAgICAgICAgIFdpdGhvdXQgaXQsIHRoZSBibG9jayByZWFkcyBhcyB6ZXJvIGFu
ZCBpZ25vcmVzIHdyaXRlcy4KPj4+Pj4KPj4+Pj4gVGhpcyBzb3VuZHMgbGlrZSB5b3UgdGFrZSBj
bG9jayBmcm9tIG90aGVyIGJsb2NrLiBUaGF0J3Mgd3JvbmcsIHRoYXQKPj4+Pj4gZGV2aWNlIHNo
b3VsZCB0YWtlIGl0cyBvd24gY2xvY2suCj4+Pj4KPj4+PiBJIHNlZSB0aGF0IHRoZSBjbG9jayBp
biB0aGUgZHRzIHBhdGNoIGNvcnJlc3BvbmRzIHRvIDwmY2xrY19wZXJpcGhzCj4+Pj4gQ0xLSURf
U1lTX0VUSFBIWT4uIFRoaXMgY2xvY2sgcHJvdmlkZXMgdGhlIHdvcmtpbmcgY2xvY2sgZm9yIHRo
ZSBBUEIgQnVzCj4+Pj4gb2YgdGhlIEVUSCBQSFkgY29udHJvbGxlciwgYW5kIHRoaXMgY2xvY2sg
d2lsbCBhZmZlY3QgdGhlIHJlZ2lzdGVyCj4+Pj4gcmVhZGluZyBhbmQgd3JpdGluZyBvZiB0aGUg
RVRIIFBIWSAoaW5jbHVkaW5nIHRoZSBFVEhfUExMKS4gU2VlIHNlY3Rpb24KPj4+PiAxNS4zLjQu
MiBSZWdpc3RlckRlc2NyaXB0aW9uIGluIEEzMTFEMiBEYXRhc2hlZXQgZm9yIGRldGFpbHMuCj4+
Pgo+Pj4gVGhhbmtzLiBUaGF0IHNlY3Rpb24gaXMgdGhlIFBIWSBibG9jayBhdCAweGZlMDI4MDAw
LCB0aGUgcmVnaW9uIG9mIHRoZQo+Pj4gbWRpbyBtdWx0aXBsZXhlciBub2RlLiBUaGUgcmVnaXN0
ZXJzIGluIHRoaXMgZGVzY3JpcHRpb24gYXJlIFBSR19FVEgwCj4+PiBhbmQgUFJHX0VUSDEgaW4g
ZXRoX3RvcCBhdCAweGZlMDI0MDAwLiBPbiB0aGUgVklNNCB0aGUgc2FtZSBnYXRlIGZlZWRzCj4+
PiB0aGVtIHRvbzogd2l0aCBpdCBvZmYgdGhleSByZWFkIGFzIHplcm8gYW5kIGlnbm9yZSB3cml0
ZXMuIE15IGRhdGFzaGVldAo+Pj4gcmV2aXNpb25zIGRvIG5vdCBzYXkgd2hpY2ggY2xvY2sgZmVl
ZHMgZXRoX3RvcC4gQ2FuIHlvdSBjb25maXJtIGl0IGlzCj4+PiB0aGlzIG9uZT8KPj4KPj4gVGhl
IGluZm9ybWF0aW9uIEkgY2FuIGNvbmZpcm0gaXM6Cj4+ICAgICAtIFRoZSBiYXNlIGFkZHJlc3Mg
b2YgZXRoX3BoeSBpcyAweGZlMDI4MDAwLCBhbmQgaXRzIGNvcnJlc3BvbmRpbmcKPj4gQVBCIGNs
b2NrIGlzIDwmY2xrY19wZXJpcGhzIENMS0lEX1NZU19FVEhQSFk+Lgo+PiAgICAgLSBUaGUgYmFz
ZSBhZGRyZXNzIG9mIGV0aF90b3AgaXMgMHhmZTAyNDAwMCwgYW5kIHRoZSBiYXNlIGFkZHJlc3Mg
b2YKPj4gZXRoX21hYyBpcyAweGZkYzAwMDAwOyB0aGVpciBjb3JyZXNwb25kaW5nIEFQQiBjbG9j
ayBpcyA8JmNsa2NfcGVyaXBocwo+PiBDTEtJRF9TWVNfRVRIPi4KPiAKPiBUaGF0IGlzIG5vdCB3
aGF0IHRoZSBWSU00IGRvZXMuIFRoZSBzdG1tYWMgY29yZSBlbmFibGVzCj4gQ0xLSURfU1lTX0VU
SCBiZWZvcmUgYW55IGdsdWUgY29kZSBydW5zLiBXaXRoIHRoYXQgY2xvY2sgb24gYW5kCj4gQ0xL
SURfU1lTX0VUSFBIWSBvZmYsIFBSR19FVEgwIGFuZCBQUkdfRVRIMSByZWFkIGFzIHplcm8gYW5k
IHRoZQo+IGRyaXZlcidzIHdyaXRlcyBhcmUgbG9zdDogVS1Cb290J3MgMHhhMDAwMCB3YXMgc3Rp
bGwgaW4gUFJHX0VUSDEKPiBhZnRlciB0aGUgZHJpdmVyIGhhZCB3cml0dGVuIDAuIEVuYWJsaW5n
IENMS0lEX1NZU19FVEhQSFkgcmlnaHQKPiBiZWZvcmUgdGhlIHdyaXRlIG1ha2VzIGl0IGxhbmQu
IFRoYXQgd2FzIHRoZSB2MyBidWcsIGV2ZXJ5IGZyYW1lIGEKPiBDUkMgZXJyb3IuIEkgcmVwZWF0
ZWQgaXQgdG9kYXkgb24gdGhlIHJ1bm5pbmcga2VybmVsLCB0b2dnbGluZyBvbmx5Cj4gYml0IDQg
b2YgQ0xLQ1RSTF9TWVNfQ0xLX0VOMF9SRUcwIGZyb20gdXNlciBzcGFjZSwgZXZlcnkgb3RoZXIg
Z2F0ZQo+IGxlZnQgb246Cj4gCj4gICAgYm90aCBnYXRlcyBvbiAgICAgICAgRU4wPWZmZmZmZmZm
IEVOMT1mZmZmZmZmZiBQUkdfRVRIMD0wMDAwMTYwMQo+ICAgIGV0aHBoeSBvZmYsIGV0aCBvbiAg
IEVOMD1mZmZmZmZlZiBFTjE9ZmZmZmZmZmYgUFJHX0VUSDA9MDAwMDAwMDAKPiAgICBldGhwaHkg
cmVzdG9yZWQgICAgICBFTjA9ZmZmZmZmZmYgRU4xPWZmZmZmZmZmIFBSR19FVEgwPTAwMDAxNjAx
Cj4gCgpTb3JyeSB0aGF0IHRoZSBpbmZvcm1hdGlvbiBJIGdhdmUgYmVmb3JlIGlzIG5vdCBjb21w
bGV0ZWx5IGFjY3VyYXRlLiBUaGUgCmNvbmNsdXNpb24geW91IGRyZXcgZnJvbSB0aGUgdGVzdCBp
cyBjb3JyZWN0LiBUaGUgcmVsYXRpb25zaGlwIGJldHdlZW4gCnRoZW0gc2hvdWxkIGJlOgogICAg
IC0gZXRoX21hYzogIHdvcmtzIHdpdGggQ0xLSURfU1lTX0VUSCBvbmx5CiAgICAgLSBldGhfcGh5
OiAgd29ya3Mgd2l0aCBDTEtJRF9TWVNfRVRIUEhZIG9ubHkKICAgICAtIGV0aF90b3A6ICBuZWVk
cyBib3RoIENMS0lEX1NZU19FVEggYW5kIENMS0lEX1NZU19FVEhQSFkKCj4gU28gb24gdGhpcyBj
aGlwIENMS0lEX1NZU19FVEggYWxvbmUgZG9lcyBub3QgZ2l2ZSBhY2Nlc3MgdG8gZXRoX3RvcC4K
PiBDb3VsZCB0aGUgcmVnaXN0ZXIgaW50ZXJmYWNlIG9mIGV0aF90b3Agc2l0IGJlaGluZCB0aGUg
ZXRoX3BoeSBBUEIKPiBzbGF2ZT8KCmV0aF90b3AgaXMgdGhlIGdsdWUgYmV0d2VlbiB0aGUgZXRo
X21hYyBhbmQgZXRoX3BoeSBkb21haW5zLCBpdHMgCnJlZ2lzdGVycyBhcmUgY29uc3VtZWQgb24g
Ym90aCBzaWRlcyBvZiB0aGF0IGJvdW5kYXJ5LCBzbyBhIHJlZ2lzdGVyIAphY2Nlc3MgaGFzIHRv
IGNvbXBsZXRlIGluIGJvdGggY2xvY2sgZG9tYWlucyAtIHdpdGggZWl0aGVyIGdhdGUgb2ZmLCAK
cmVhZHMgcmV0dXJuIHplcm8gYW5kIHdyaXRlcyBhcmUgbG9zdC4KCj4gRWl0aGVyIHdheSB0aGUg
TUFDIG5vZGUgaGFzIHRvIGVuYWJsZSBDTEtJRF9TWVNfRVRIUEhZLCBhbmQKPiB0aGUgYmluZGlu
ZyB3aWxsIGRlc2NyaWJlIGl0IGFzIHRoZSBjbG9jayBvZiB0aGUgZ2x1ZSByZWdpc3RlcnMuCj4g
Cj4+Cj4+IFRoZSBDUFUgcmVhZHMgYW5kIHdyaXRlcyB0aGUgcmVnaXN0ZXJzIG9mIHRoZXNlIHBl
cmlwaGVyYWwgY29udHJvbGxlcnMKPj4gKG9yIFByb2Nlc3NpbmcgVW5pdHMpIHZpYSB0aGUgQVBC
LiBDb25zZXF1ZW50bHksIHRoZSByZWdpc3RlcnMgb2YgdGhlc2UKPj4gY29udHJvbGxlcnMgY2Fu
bm90IGJlIHJlYWQgYW5kIHdyaXR0ZW4gcHJvcGVybHkgaWYgdGhlIGNvcnJlc3BvbmRpbmcgQVBC
Cj4+IGNsb2NrIChzeXNfY2xrL2NsazgxKSBpcyBub3QgZW5hYmxlZC4KPj4KPj4+Cj4+PiBUaGFu
a3MsCj4+PiBMdWNhcwo+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAg
ICAgY2xvY2stbmFtZXM6Cj4+Pj4+PiArICAgICAgICAgIGl0ZW1zOgo+Pj4+Pj4gKyAgICAgICAg
ICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+Pj4+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGNsa2lu
MAo+Pj4+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGNsa2luMQo+Pj4+Pj4gKyAgICAgICAgICAg
IC0gY29uc3Q6IHBpcGVsaW5lCj4+Pj4+PiArICAgICAgICAgICAgLSBjb25zdDogcGNsawo+Pj4+
Pj4gKwo+Pj4+Pj4gKyAgICAgICAgIyBUaGUgUEhZIGFkZHMgdGhlIDJucyBSR01JSSBkZWxheXMs
IHNlZSBldGhlcm5ldC1jb250cm9sbGVyLnlhbWwuCj4+Pj4+PiArICAgICAgICAjIFRoZSBSWCBk
ZWxheSBsaW5lIG9mIHRoaXMgZ2x1ZSBpcyBmaW5lIHR1bmluZyBpbiAyMDBwcyBzdGVwcywKPj4+
Pj4+ICsgICAgICAgICMgYWRkZWQgb24gdG9wIG9mIHdoYXQgcGh5LW1vZGUgZGVzY3JpYmVzLiBU
aGUgVFggc2lkZSBoYXMgbm8gZmluZQo+Pj4+Pj4gKyAgICAgICAgIyB0dW5pbmc6IGl0cyBvbmx5
IHN0ZXAgaXMgYSBxdWFydGVyIG9mIHRoZSBjbG9jayBwZXJpb2QsIHRoZSBmdWxsCj4+Pj4+PiAr
ICAgICAgICAjIDJucyBhdCAxR2JpdC9zLCBzbyB0aGUgVFggcHJvcGVydHkgaXMgbm90IGFjY2Vw
dGVkLgo+Pj4+Pj4gKyAgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHM6IGZhbHNlCj4+Pj4+PiAr
Cj4+Pj4+PiArICAgICAgICAjIERlcHJlY2F0ZWQ6IG5ldyBTb0NzIHVzZSB0aGUgc3RhbmRhcmQg
Ki1pbnRlcm5hbC1kZWxheS1wcwo+Pj4+Pj4gKyAgICAgICAgIyBwcm9wZXJ0aWVzIGluc3RlYWQu
Cj4+Pj4+PiArICAgICAgICBhbWxvZ2ljLHR4LWRlbGF5LW5zOiBmYWxzZQo+Pj4+Pj4gKyAgICAg
ICAgYW1sb2dpYyxyeC1kZWxheS1uczogZmFsc2UKPj4+Pj4+ICsKPj4+Pj4+ICsgICMgRGVsYXkg
ZGVmaW5pdGlvbnMgZm9yIE1lc29uOGIgYW5kIG5ld2VyCj4+Pj4+PiArICAtIGlmOgo+Pj4+Pj4g
KyAgICAgIHByb3BlcnRpZXM6Cj4+Pj4+PiArICAgICAgICBjb21wYXRpYmxlOgo+Pj4+Pj4gKyAg
ICAgICAgICBjb250YWluczoKPj4+Pj4+ICsgICAgICAgICAgICBlbnVtOgo+Pj4+Pj4gKyAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItZHdtYWMKPj4+Pj4+ICsgICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbjhtMi1kd21hYwo+Pj4+Pj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLWd4YmItZHdtYWMKPj4+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1heGct
ZHdtYWMKPj4+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFjCj4+
Pj4+PiArICAgIHRoZW46Cj4+Pj4+PiArICAgICAgcHJvcGVydGllczoKPj4+Pj4+ICAgICAgICAg
ICAgIGFtbG9naWMsdHgtZGVsYXktbnM6Cj4+Pj4+PiAgICAgICAgICAgICAgIGVudW06IFswLCAy
LCA0LCA2XQo+Pj4+Pj4gICAgICAgICAgICAgICBkZWZhdWx0OiAyCj4+Pj4+PiBAQCAtMTA2LDYg
KzE2MCw3IEBAIGFsbE9mOgo+Pj4+Pj4gICAgICAgICAgICAgICBjb250YWluczoKPj4+Pj4+ICAg
ICAgICAgICAgICAgICBlbnVtOgo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLWcxMmEtZHdtYWMKPj4+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyx0Ny1kd21hYwo+
Pj4+Pj4gICAgICAgICB0aGVuOgo+Pj4+Pj4gICAgICAgICAgIHByb3BlcnRpZXM6Cj4+Pj4+PiAg
ICAgICAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wczoKPj4+Pj4+IEBAIC0xNDIsNiArMTk3LDEw
IEBAIHByb3BlcnRpZXM6Cj4+Pj4+PiAgICAgICAgICAgLSBpdGVtczoKPj4+Pj4+ICAgICAgICAg
ICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjYtZHdtYWMKPj4+Pj4+ICAgICAgICAgICAgICAg
LSBjb25zdDogc25wcyxkd21hYwo+Pj4+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+Pj4+PiArICAgICAg
ICAgIC0gY29uc3Q6IGFtbG9naWMsdDctZHdtYWMKPj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDog
c25wcyxkd21hYy01LjEwYQo+Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCj4+
Pj4+Cj4+Pj4+IEkgc2VlIG5vIHN1Y2ggaHVuayBpbiB0aGUgY29kZSwgc28gbm90IHN1cmUgaG93
IHRvIHJldmlldyB0aGlzLgo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+IEtyenlzenRv
Zgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4+PiBsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+Pj4KPj4+PiAtLQo+Pj4+IEJlc3Qg
cmVnYXJkcywKPj4+PiBDaHVhbgo+Pj4+Cj4+Cj4+IC0tCj4+IEJlc3QgcmVnYXJkcywKPj4gQ2h1
YW4KPj4KPiBUaGFua3MsCj4gTHVjYXMKCi0tIApCZXN0IHJlZ2FyZHMsCkNodWFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
