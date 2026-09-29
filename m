Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D0FCA5FA5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsZyITXW75cT3TMijfBN46yV0F+zVolcdBOS04UxVJ4=; b=xO7Aw0KZWdaE1JRy8Uwfa8FX1d
	2f2j2cpJxOoDi8p3vWe0wRnBeOgXbW78c13Ekf/trjiIped96yfro/CEG50DkXrk78X2w7zwKxqeS
	G/cUkwPIUoG/AlT2L3/ArEXxk+TPUZeQmY94zZ8+WPQVE65wePr8p8raROl5fcRhTw35J4qaQY9cD
	a9LbncTlaB72CzcsHQFHJmIo9aGhCnUn+y7zL1awFty3/pHNNOUIyBcNuEW+OpKGTEDx9ejb1eTom
	6pFSxUPLW/9YGrDivcXUQ/9aRh+A9O0MrlVhvIPQIPN9042Y7Qvykml1LHTZeM4wYX//Y/dkMbzU9
	4LJGzJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULG-00000002zu9-2b6A;
	Tue, 29 Sep 2026 09:41:42 +0000
Received: from mail-japanwestazon11022114.outbound.protection.outlook.com ([40.107.75.114] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBULD-00000002zsX-3l2w;
	Tue, 29 Sep 2026 09:41:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuG3hvyVyPe29V7Ct9FQNAJmMaGx9Ot3MKSW7j3JDqiN9QXb6vzfixyO2HIEj099qvYEBRsrOh20BMS+gbJr9uBWojo4UXdjlAjD+pyGHYub/1r4i7+rlI/njcNmwNQMCKEyCVl8o6p41qMgsd4t+qkkyRWaPCzKXk70Z4Ayll0rwLcPLg1b+bbcgehWFHEN2vDTLRZik2HcTD8+5MCV7dQr+ccnYjZ0dMuvTb2NAF6f7WHAmuRlq0FJJUIjk8kOpBvQGKnlJ6MyfEvWvHYJfzEkCFFBq9T0PkVW0OVTjS5qBZDVStvBKRFVKFFRRilKc4gseSUSJXGK7Ts2b3ksnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFhYE31qj5dyqcrQZiuC/xCAEvuQfOsYebE3VHwAdgA=;
 b=ZWZ7eNfcMljl/6t+vLaH7N6IhQra6zJ3ABnVDw53ogIlsh53p7douhjdAGGfGqzXHGybXw4ROqk/8blwe/MalyUSZVBvCgSQXq0kPXpRSUlhRSR08aXlXy0DBV9Zoov7kHzT7102g1eo0uuBl1OUbvTc3EWxazcmYmg+hfmoj8rpPzM1DsHKRy4Cc3K+FvTPgCNoLJvYZfQ6E5bATfRhJU7TqgwCW3+dUK5w0Kafw3T1WzKKMQo+ojwFnVhreUH+9BQGV0BPC1eVefqEFxv3940km6UUtfeXCm9VVx8SdMawidhJb2cs+NbYZHYArEHQdSfT4hHZnn7uM4OWHee9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFhYE31qj5dyqcrQZiuC/xCAEvuQfOsYebE3VHwAdgA=;
 b=T1479drBsc9KMBIBFfk8pKz5ksXcFXNKmWWRxFvjlhaukqeZDsS/EBs4RCd1cIZ7eNh0ayhUt378MPdEux0d+wcrvvuxmm41KSBwSMVHOQlceL+aB4eNgcup2apbuAgzlYH5O/Tngp4kb1T0E1zY7x2+Rq3+uRAmbIF61BGXqCRwjE82mKxxkxAiC4rNFx77TO9hXg5M4dujY9Eh1Jyx2iNW6ZHglnofZVE+LwmQfCdt4+toVogTwIWnlxiWf7pBEPNBOdZSlEyI0zEQIpyDJgse2FqDpR9WXF8Fx6B7SEo9WDFIxJ5hiPDun1hY+C6Ed6iF+kqHZlTQ+uvlYOow8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SE3PR03MB9967.apcprd03.prod.outlook.com (2603:1096:101:336::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:41:22 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:41:22 +0000
Message-ID: <e0f29358-f5e8-4bf5-83aa-dba342b49e07@amlogic.com>
Date: Tue, 29 Sep 2026 17:41:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
 <20260928-efficient-secret-manatee-2fcca6@quoll>
 <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
 <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
 <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
 <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
 <ab0e83e6-c0a1-4c8d-847d-81628c49a436@amlogic.com>
 <d4f72cef-0973-4f98-9c9e-277894f72a6a@kernel.org>
 <d89c3a48-a90b-4dba-aade-a71c57458f9d@amlogic.com>
 <9679c161-d36c-401b-80a7-46b0524a7eaf@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <9679c161-d36c-401b-80a7-46b0524a7eaf@kernel.org>
X-ClientProxiedBy: SEWP216CA0022.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::19) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SE3PR03MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4c0b29-0935-4989-0b99-08df1e0dd236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|10067099003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OHTctk64OtWxPUmh1uga7obOuVkxZcyqrQB09HQ7HOlCiyqN7eLVkamq188Xnx9kjyY1CcYsjb3DELgdrbTz76SEsM+zVBn3/NWXfzQQ0O0/lknxm9wIkS0DBqkOb2ckQlPltpedEBuP3ZRU8obwhts5anBhmIfs/JbCfMMLnX7xMYvgayNlYK4+1TM0El7iwcyokibEFRkYSTH3RkSzt+iENEf4s9au9i4Dvhl6YfHxanbxKHRhdZHZMnUcVLE8kN0zqm8IpyztAsaUthDTkNanIBNSklbnlXKmoDsmxpBJBeecUbLn0kpmezV6Ht9dlsxw2ELBZ3DdnzhLGvVe+xKGBMiX1akXrZBx9WZWJ5bpnJzLdL2ejL2X8cn1oMm2061NIhku/QmAV4xOQ18qrcWjc5vjn4CK4g+cO/qhv5Rb+3717olto0IKszYPwwI7Jh9I4DQq+WFiUfyf7/EstnfeG8SiT9FLoYDwrZfMGTIB5e0XEuCc7/bnS6ZmJ4aI5UitGUa6HtMreFC7E3XHgiIHR0Xc7YrWeqdC1K3ru95gveWtLrnLsWVHFYt8KXG7cA5zNvW5imN2BbyggpCBIaAFA76kUnb5eg7IF2Sm2uma9jYBqVQlP6VHJldTPRP9g00wFbZ4elxjsTDBZkcdtjuDyCfnHwEGRsSeT+SVTYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(10067099003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2FnNnBoYUcwMWxWbVpta0p0VGd6N2Y3TXFaTGtURjZkd3l5TW9MbzlnZk5o?=
 =?utf-8?B?dS9admt6VU5FSFpTVE1oMzZLOG1VejIzZTdxaHFHQ0ppa1Z6ZnN0Tno4WVVa?=
 =?utf-8?B?RXZrejlsU2tFSlc5Z0JRZU5ra1Nzcnk4cFovSy8rdTAra2F0VklDd002WXA0?=
 =?utf-8?B?L0pNalNJQmFMcnpHQklvS3FOZVFRV0FGeFVzbjFVdFZwcXBpS2dCbkVZVVNC?=
 =?utf-8?B?eGUwMWY2NWRYbzd0amVqcm5HOW9xOHRFRitoSzMzZ2I2RC9jYU9WY291UlFv?=
 =?utf-8?B?SlozTGhDK2tOUFRocklqOFk0MU9LeFlqNGc5ZEJCbzFpOFR4VENSVnh3U3Nw?=
 =?utf-8?B?OXgzU0dVQ1dFeWpQY2dZTHhmNktRMzdnZ0NqN3hSQ3RRWU83RXg4YUVUQkY4?=
 =?utf-8?B?VUN4cHRGVWlXUTVVVmZWL1N6OS9KS3llOWc1Z3JXdDFMV2xtZzJuZGczWVFw?=
 =?utf-8?B?aURBc2owTWkwUkZXcGc1OWhmWWxtK1BkNEcwVHBzNXpsT3lqWTVDcXo4Qkh6?=
 =?utf-8?B?Z2ZEdjJ2NjRYODFzVWNpSmdDamxQeG1CZXRJc3FuV09wMDhLWVFLc01ETU9S?=
 =?utf-8?B?OW8wZm1WQW1nQ2VBc3NYdDU0QkRReXZpUFNhNUlScnAxSittaGNaUm9sMDU2?=
 =?utf-8?B?aU96bCtJcERqRmx5RUl6SnhyTUlPeGV4bVB4My9VVnBEK3FCZ0V0NWVjVTZw?=
 =?utf-8?B?K3o5dXVUdW1RNnhkaDUxR1J6am1PR2JSVUp1clBYMnFBaWhnNHBCY3lHVWVk?=
 =?utf-8?B?N3hLVUk2cUJ1Q0JzWi82bG5BZzcvWGRzQzlpMnJUZnlDL0dGNUlGb3ZkdjZB?=
 =?utf-8?B?dk5zYm5HZDFMRVZLQXZqU0MvWjU5cDZFRWcxVEtRcmFuNDBpRTltSGRPWVdY?=
 =?utf-8?B?bjZGN2ZUOElvTlZmb0tJWnUwZHJCbWRUbFRHQmMzbDErUGNlK1dRRFMzZ2p5?=
 =?utf-8?B?RFB4RGcyTGcxWnhwS053OEdxbGdMaVNQQndxN2xOdEpSaG9vdWh2cVI4dHJI?=
 =?utf-8?B?M0JWdnlZT2kzZmNvVDlheVFBNklyMGpQSzFmSjBaNitMbElNWWRhSFVsaUtW?=
 =?utf-8?B?amZkb1JiV3FUZ2NtZW9PcjNjU2JqSWJ6TDVmMURoZDVVZzVONzMxRnh6Z1BC?=
 =?utf-8?B?ZUVkS29hUkluWHNBdFQwWnBuTHdvUTRFTzZUdnNic0ZVYm9LTGdLeGJvZnU4?=
 =?utf-8?B?UC96UDNUN2RKQm1qVVNpQVBRS3JJMFJiRlppYmNkMVNKTDQ5RU1hZW0wVTNv?=
 =?utf-8?B?d09sTmtrWGFuYUtZLzBiYklTakt4NS9PYWR4NFJEdlVWbVJrenhoYVVvMit6?=
 =?utf-8?B?amtjckU3czUvWitzbVhXL1NBQ2FOTlhRT1lndU5rdE1xbFZ4dkJmZHlaU1Mr?=
 =?utf-8?B?RThIYWxGcmI4OG1ITkhhTUNoYVlaVUxsODlYSWpOMkZTc0Q2dVFYMFJSSW5T?=
 =?utf-8?B?WDg2NlNTNG5PTFhaUDZkSm9IdHlYdE9teHJlMnAxdUtxQ0U1b1VBYUZDRXYr?=
 =?utf-8?B?SVV4aExaMlUvUUVPME1OeUZNMXBmK3hpZUVVR09EUUgzOGgxblBVenBsZHBi?=
 =?utf-8?B?Z2VJalhpSVptME5aclROekNwMEhuNGtDOWsvazJPcnh5R283RFBiMmpUcDRM?=
 =?utf-8?B?dHV6T0R1Sks0azgrbWw5alZBeTRCSHBKNFYzMTFTS3lMa3V4UlV4OUREYlBH?=
 =?utf-8?B?SXJJRWdBSHhRM0VGUi9yTWRkUUNXKzhrcDFtUkJaTDNBazBTYURsb2h0Ni9K?=
 =?utf-8?B?WUxSTmd5aGhvaEF4YkhpNXFIUFR5T2JEMlVjYUpoT3o2UDl3Q2lZVkZvWFYz?=
 =?utf-8?B?UVlMZjZmQlRlMy9TSnExVjZEdDVyNTlsSm5rQmxFUDJWRTFmNnV6dk5kanQ1?=
 =?utf-8?B?YjJxblMyRzFXRThoRGNmaHI4ZGc1dTl6Qmt1dGt1YTJvcGlDNVlPb2p2Nlkv?=
 =?utf-8?B?RGZQcmYrMHYzWXpESlNmeTdiUFA1dEpCbFdBdGc4dlREZFNVOFVjcnVuQmpv?=
 =?utf-8?B?UVQ1OS9TUHMvVmo3Q0VVcmJqampiNzhiTGhzU2RwMTdRODFrdnkycm1sSzhk?=
 =?utf-8?B?azRvbUtNZkszV08wQWVFTzJySjVqN3JuSFpZQmVBVWRpYXNBZTBtK2R4dC96?=
 =?utf-8?B?TzFCTitxRlUvNEhpRjlRbWc3aFJHaXNEc0RYTm16OE1yeW9pSDZxOU5peU5E?=
 =?utf-8?B?UmNIRkF1bWVZcTMyME1DR0pqZzNhb1hITUd3eE0rUmduRDdOU1gybDUrYS8x?=
 =?utf-8?B?aGxrUU9nN1FUYTQzdUdvbzh2YU5wdzJoUzlWM1k5NjErSTVmQjNsdUpoRTV6?=
 =?utf-8?B?a1NUU3UvS2x4bTgxb0lFVk92MGcxTVhZWU5jQnpwR1M3K3JIUUtOUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4c0b29-0935-4989-0b99-08df1e0dd236
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:41:22.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apIa1CLM4tn1YV91PJ4pPnY8q2GeqsnJ5gk+/8iuEDpX0P4Z2h7dTCHo+tUAdFud6+aAJlkGJOn9tSPT0Dut/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_024139_947156_B3C6B074 
X-CRM114-Status: GOOD (  14.17  )
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

Cj4gT24gMjkvMDkvMjAyNiAxMDoyMSwgWmhlbnRhbyBHdW8gd3JvdGU6Cj4+IEhpIEtyenlzenRv
ZiwKPj4KPj4+IE9uIDI5LzA5LzIwMjYgMDg6MjMsIFpoZW50YW8gR3VvIHdyb3RlOgo+Pj4+IElu
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gsCj4+Pj4gYWxsb3dpbmcgb25lIGVu
dHJ5IHdhcyBzaW1wbHkgYSBtaXN0YWtlLCBub3QgYW4gb3B0aW9uIHdlIGV2ZXIgc3VwcG9ydGVk
Lgo+Pj4gSSBkbyBub3QgdGhpbmsgaXQgaXMgdHJ1ZSwgcGxlYXNlIHRlc3QgaXQuCj4+IEkgcmUt
cmFuIHRoZSBkdF9iaW5kaW5nX2NoZWNrIGFnYWluc3QgdGhlIG5ldyBzY2hlbWEgYW5kIGEgZnVs
bAo+PiBkdGJzX2NoZWNrLCB0aGUgYmluZGluZyB2YWxpZGF0ZXMsIGl0cyBleGFtcGxlIGNvbXBp
bGVzIGFuZCBwYXNzZXMsIG5vCj4+IGZhaWx1cmVzIGZvdW5kLgo+Pgo+PiBJZiB0aGVyZSBpcyBh
bnkgYWRkaXRpb25hbCB0ZXN0aW5nIHlvdSB3b3VsZCByZWNvbW1lbmQsIEkgd291bGQgYmUgZ2xh
ZAo+PiB0byBydW4gaXQuT3IgZG8geW91IGhhdmUgYW55IHJlbWFpbmluZyBjb25jZXJucyBhYm91
dCB0aGUgY2hhbmdlPyBJJ20KPj4gaGFwcHkgdG8gY2xhcmlmeSBhbnl0aGluZyB0aGF0IGlzIHN0
aWxsIHVuY2xlYXIuCj4gU28gcGxlYXNlIGtpbmRseSBwcm92aWRlIGEgcHJvb2YgdGhhdCBvbmUg
ZW50cnkgd2FzIGJlZm9yZSBhbGxvd2VkLCBob3cKPiB5b3UgY2xhaW0uIFJlbWVtYmVyLCB3ZSBz
cGVhayBBQk9VVCBPTkxZIG9uZSB0aGluZyAtIHRoZSBxdW90ZSBJIHN0YXJ0ZWQKPiB3aXRoLgoK
U29ycnkgZm9yIG1pc3NpbmcgeW91ciBwb2ludCBlYXJpbGVyLkkgdGVzdGVkIGl0OgoKV2l0aCB0
aGUgcHJldmlvdXMgdmVyc2lvbiAofHJlZzogbWF4SXRlbXM6IDIgfHBsdXMgdGhlIDItZW50cnkg
CnxyZWctbmFtZXMgfGl0ZW1zIGxpc3QpLCBhIERUUyB3aXRoIGEgc2luZ2xlIHxyZWcgfGVudHJ5
IGlzIHJlamVjdGVkIGJ5IApkdF9iaW5kaW5nX2NoZWNrICgicmVnOiAuLi4gaXMgdG9vIHNob3J0
IikuCgpMZXQgbWUgY2xhcmlmeSB3aGF0IEkgb3JpZ2luYWxseSBtZWFudCBieSAibWF4SXRlbXM6
IDIgaW1wbGllcyB0aGF0IGEgCnNpbmdsZSBpdGVtIGlzIGFsc28gYWxsb3dlZCIg4oCUIG15IHBv
aW50IHdhcyBhYm91dCByZWFkYWJpbGl0eSwgbm90IGFib3V0IApkdHNjaGVtYSdzIGFjdHVhbCB2
YWxpZGF0aW9uIGJlaGF2aW9yLiBJIHNob3VsZCBoYXZlIHBocmFzZWQgaXQgYmV0dGVyLgoKSnVz
dCB0byBtYWtlIHN1cmUgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyByaWdodDogdGhlIHR3byBpdGVt
cyBhbHJlYWR5IApsaXN0ZWQgaW4gZWFjaCB8IiotbmFtZXMifGFycmF5IGltcGx5IGFuIGVmZmVj
dGl2ZSBtaW5pbXVtIG9mIDIgZm9yIHRoZSAKcHJvcGVydGllcyAoaW5jbHVkaW5nIHJlZ3MsIGlu
dGVycnVwdHMsIHBvd2VyLWRvbWFpbnMpLCBzbyBJIHN0aWxsIG5lZWQgCnRvIHNwZWNpZnkgdGhl
IG1heEl0ZW1zIGZvciB0aGVtPyBJIHdvdWxkIGdyZWF0bHkgYXBwcmVjaWF0ZSB5b3VyIApjb3Jy
ZWN0aW9uIGlmIEkgaGF2ZSBtaXN1bmRlcnN0b29kIHRoaXMuCgo+PiBtYXhJdGVtczogMiBpbXBs
aWVzIHRoYXQgYSBzaW5nbGUgaXRlbXMgaXMgYWxzbyBhbGxvd2VkLAo+Cj4gQmVzdCByZWdhcmRz
LAo+IEtyenlzenRvZgoKQmVzdCByZWdhcmRzLAoKWmhlbnRhbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
