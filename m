Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9735DCCF9EE
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Oct 2025 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlVUMLp1X+ASkyP+RhcKyoWtOJfTCNQSWBnuUtAuj3Q=; b=NOEcJLmLaNY8TeEEJZrLo/az7K
	PIeBU1+foquEyQKb2ItpF10Nphvs06qNlAPKgeaH74RRlBNTavPyBHs8f2QgqZ2JtI4EM60gfxiwx
	XrsFTLX+V7wjwHZQoGy4tajArEl5BnZK0UFWQSOVDBbBopDu2/97/Nlo4wEeI3PTHIWFxGLq44gaw
	p6VX5TchEIn9q1zbHRP/QmTcr2YXM45nYxIkJThHOZfNUJAtJ2l6a5tOS/r9/MRQb1DmZ8zzU8OvF
	CIEmiNPH8NDznDqbVTIgZOgoPZsZndZp5cG8t3DABsw630mpC69O2V3nCGgtHQKOSKwA+nDn9dRBS
	F7Y98l3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhmo-0000000Fq0X-2sa2;
	Tue, 28 Oct 2025 11:22:46 +0000
Received: from mail-japaneastazon11022131.outbound.protection.outlook.com ([52.101.126.131] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhml-0000000Fq02-0xaQ;
	Tue, 28 Oct 2025 11:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjvgjfW32nGvZS9PcOuq9mB5qoZZdpFXZuSrowQYx679zmMt8ntNJ/I2r7DlRivw1s9lt+1gzH0H6PTWOlE+UENPb14JrTrzjhX09jjajg3U183Ley6pRon0lGdYLxg2LyOmRCI/y7O1UGB6KR9idTSWH6awjFHRG+K7QZQg8rZMCFeXK0E+Ll4oFHPLoZCwEsQTREYBIlv89YLreWBhU3cOluXj0/MJFBYJguFpha1ZEYSGnoSx0UZjWS0f/s6BTYSCT+8WyUxkk0405B9J1RPAZv4X7PrjR6JlKJYNKlIKNbzlZrc5EUQ2WrO07Dd1A3FbeJ7BZrxZGpRzfG9aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7KgR3hfWgVSFhXuUZKZkHEd57Tx3jAE76yw2o0zWzY=;
 b=NJTw01rQXGLbF29/uD38AbCLfqKtuoJQVqL43sN27lsX7NjcTSUZtJKQYeCnSDe/keuA4I2qI3S/7cPk/7t9ptQyP78VSWAylpfGXieQttB+1Loe6HMLwJ1gH6nceIwLSuu29Bddg3QVsy2k4wgj5/tE7j/+jc3hYojj+WbJAwT/2DwG8tBJHOCu2R1mJ7g5DvjMshMVaRYPffyWIa4/eqo/y30nSv0ufpVYkSZ82KPXOq7KPCDQtocYnRGHKWG10yx0aMAdFVzC+bcJaG+gyjainRj/yC6fUEdQKXaKhiCdXpJ/igeS7FR5o1PDDO/lBGideS8v7qrVb6hpqgNjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7KgR3hfWgVSFhXuUZKZkHEd57Tx3jAE76yw2o0zWzY=;
 b=r4YwicC33aZUf9mBtT1ElIpKTdc1rG/oGRf1ZztoATuvhiGG1nRtMxY8KVqMKETw9X6+xd0Zdej19dE4P4wMpeEhVu40AMC7C7TYmA/O/0weV1Bd0OA7NDSdD/921eFdQ5KB4fiAsn18MYNVYpDMpLXwoImcP3aKI4PYc7tl82e4XuKuRexjyCJkX2bIVALq8804xY3x5ThAWtJh4ENjO3orjihQInYWXqs1FEyAuaGLPFAAAFCB5qU3lYJJdsVgd3UY76iLjktCbpOvFaCyLvp/bf3ZBzxjEIeqQqR+sDriIq+NHA1gdk+BakKlIYtx6tEhGwUhWlWQhJ3lvNKfzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYSPR03MB7784.apcprd03.prod.outlook.com (2603:1096:400:42a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 11:22:36 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:22:36 +0000
Message-ID: <c1de12a1-a9ee-4d8f-957c-811b4eb33890@amlogic.com>
Date: Tue, 28 Oct 2025 19:22:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
 <a2ec6794-1131-421e-848b-3fddd39191e2@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <a2ec6794-1131-421e-848b-3fddd39191e2@kernel.org>
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYSPR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 074bea4f-bdde-4731-90c9-08de16144b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTJDT0NMTDU4S1JqUkFQK3R2S3pySWNaNmZuK2NKYm12MGR0TWRsbUo2elR0?=
 =?utf-8?B?N3BUREdLLy9SRnU0NTUrUytvQXBOWmtZOUZoRmdDYlR4ZTcvV2ZsZjdCNEdO?=
 =?utf-8?B?NHRCYzE5RjQxSWg0Mnd1Tm04OTE3YXlZK1NCQ05YdjBrcDk1R050UXFaa3Bt?=
 =?utf-8?B?UGpmQXlDRm56TXlUaktRREpBRFN3RlBzelpFaDNUVHlpb2tPUFFaS3ZUQjhh?=
 =?utf-8?B?MFVVWkhMTm9kb0drTzU1QW5WOUg1QytkajdlYlozWXQyYWljWGxKUEY4UDF1?=
 =?utf-8?B?SVdqVTRQbnVwWDZMMk0vRnpWSC9HQU1wdmRXMG5uc0ZsczBIYjdFSmpDdVUw?=
 =?utf-8?B?R3QyRG85ZGlvMmc3OTR0MzYxMDMyT09Wc1FrK1VFdEVwVUpsV2pPazQ5NCtS?=
 =?utf-8?B?clBGaWc2TVBFc1doOHRabkEyK2dhREt1UFNmNkttTW91dTJXSG16cVBXWU8y?=
 =?utf-8?B?UVU0VkdNbVFXR0dQRFRaWUxIOWhsR1grM2cybTQ0REVHdE1mczlseW5JM1pK?=
 =?utf-8?B?Yk1LRkZhYnZtR1FvTkRRNXpDcHBubG1LanRzOFkvUDJUMXMzVit5cWVYQUNW?=
 =?utf-8?B?MHJqSUpRTHlFa0xQOWxZYk4rWTRhdmUxNTVTWDFTdEhSbWVZRDIxNlhETWxo?=
 =?utf-8?B?QW8rSG5MQVBRNEVhZjYvMVZsbjhxcG03WWNQRlpLbmhPdTEzTEV4SjF0RGdV?=
 =?utf-8?B?Y2p1T1JUNUp0L1IyRWtDMHVoQlllZXFUTHlYbHhFblkyTHF6RVN3a3pLMnZl?=
 =?utf-8?B?VFNSQkVKbldVb3Q5MVlBYUJ4L2h3cHpoUFhoeCtBL09Oc0E1cGRLS1VzQy81?=
 =?utf-8?B?RWlYQUlEWE1XdTc2Rytwb1QzM3gydnlWcENvbTE2Z3oyOVFpTjVyU1NZNWI5?=
 =?utf-8?B?RXRvK2NZS1h6bis4TkNqSXlsL2szQUJBN2dFTTJ4STZmdWlseFB2ZEpYOFF4?=
 =?utf-8?B?QWNyQ3BXTVBON0tJdlYvWlFZSTlNc0VmT09GSjNXWDBJdkx5RW04T2lqU0lz?=
 =?utf-8?B?WGc0Rm51NmdJcFFHVzVOVTN4L1VlTGFEMWtPb3Y4MWNSN0V4M1dUVW9oRkZv?=
 =?utf-8?B?YVRrOXZvQ201QW1Tc1RpaHg5cElEYldsZnB0VjVnQnJKRVQwZktsUHlGdjEz?=
 =?utf-8?B?VXJsWWNCWUZLWk5Ld1VGSkJrZ0R4TEYrcnhPdzMrbGpxc3VIaUcxdkVmY2NG?=
 =?utf-8?B?K21yUzJZSU92UXpNRjQwTmRVWCtzSDRMQnczV2RVWUYxMzM1MnVDRXJ4bnVZ?=
 =?utf-8?B?dlVxVnZxNHVyNE1wMGJycGJjVVp6cVhMVEsrTWUyai9zRlIxYlI1cU8vQUk1?=
 =?utf-8?B?VGQ5WEpiUjZ4WmlsTXo3UnpBd2w1M095b1FOQ0t4aml3citOMU9JbE1DdzRl?=
 =?utf-8?B?b2RaN2xXSG9PNnA5V3NKOTNQang2VWpMU3liUnQwYlNDQUdrNm9kUDV3UlhX?=
 =?utf-8?B?ZjA3ZUJldnROQk4vYWtaTmFQd29xeUY0TWZ5U3VTRk5WU1VDUVhiZEpad3I3?=
 =?utf-8?B?L1o2QWxJN0poOTNTTCt6TDdLNDFteTZSM25aN3hPN0ozalQ4aUdLY1NnRUhT?=
 =?utf-8?B?N05TOVkwbzI5VzZMeXVyMHdYOVlPM0EwbUsrQThWTldoOEhoQkJMYTVEV1Fs?=
 =?utf-8?B?bDJwTUhvSnJqK1YzVUVwbUI4Q2ZCRXpxUXM3OUFGWGx6aW4rQkxMTHk1MFdx?=
 =?utf-8?B?cDF3cEtCVGR3OHNXK2VidDBBdEJnaVhkaytlU2dQaVBLMUJHR2pJQVlhV3Iv?=
 =?utf-8?B?anRuMG0vNEpkclMraitFcE13YmxXSGpQb2hpa2s4OGlCRlZyOEE2NU5LOE5Y?=
 =?utf-8?B?VURsZGtVZlFpV2NHZWU3K1NyNUJIMHVBaEwwMDBaUlhYYmQzenQxTWpsYWtO?=
 =?utf-8?B?NFNmZVdqV3VKQ0NoUTJ2dXlvcjd6amFrcm9BQ1BFenRwb2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZEOVI1dUd2M1pNY1FxcVMyK0RuRDhHT2FiZkZrT3ZLbHZuMno3Wldremg4?=
 =?utf-8?B?UmtIaFlEaEQzOGVBZVZNSDV2RElpenZJV3p2dnA0dmgxa2QwRC9LVU5nZ3Nu?=
 =?utf-8?B?UW5ralc3aThhNHBHSElPdG5VVDlVNTVqUU9rckgvajUza3dsYWErWVVrS1Az?=
 =?utf-8?B?cnBwaFJSRDVSdURKbEc1Z3M3QkVoVWVUTzJqdmZsdVRSRHFVaWlxUU9WQ2pP?=
 =?utf-8?B?VjJRcVFXMVNTTG1uZGpwUGFna2VDT1JmY3JkN05FNkJLYTRmZzE5UlJWd2Ft?=
 =?utf-8?B?dDlkVFMwV1E0M3AzUTVEaDlOU2NTMUlhdS9MUnhlSnpYY0VnM2Jrb0RjeTJU?=
 =?utf-8?B?dWhFOFBxMWlacGc1OUgzMWlxeXBGVmpFR0xCOHNDdU5raU4xL2dtRFlMTWR5?=
 =?utf-8?B?cTNHZThGOVVBTW5IWmtmRWZuNnlkTHpYSzBMMWN2enFhbE9HeDdKK1c2UDNa?=
 =?utf-8?B?Z096cm9BOU8zZDd2WUxvb0lUV1pYWmZTSVJDOEpBLy9WelYzelloSVh5TS9J?=
 =?utf-8?B?UllkMkVpU0FTd0lqMzNKUlBBQ0hDUFQ2djhXWEpVOENXU05Nbk5MQ0xqVE1W?=
 =?utf-8?B?UzZvUG9xSGxpUStaV2xxY0VMNGRqUUhzdHVtaUovd0ZoZEwzdGRJTmJ6dHhY?=
 =?utf-8?B?NTFJWG1DUWIrL2pJbnlSU3pkLy9RVWJQK0dUSnh2M1Vya1ZQV1Fhd25TNFR6?=
 =?utf-8?B?SWlrU3BiUXlZZWFWOXFCdlY4RWczVGJZQkVLV3Q0SXFRK2VVSkg0L1gwbHlp?=
 =?utf-8?B?UFBWZzZ1R1gxY1dRck9nbnRQcFlQNld4N0pnOTBYa1k4QTMya05ESEdKZmt2?=
 =?utf-8?B?Y3BwVkkra0RPMG91SjhNL3I0NU42OFF0d2NucnFibWhsUTlFQmVDK1FnMk9V?=
 =?utf-8?B?TFJ5RnhoUjYxT3NaZm1udkxWeEt6QlBsODVIZ25jaTFlMGNYemhWbEhYaDM4?=
 =?utf-8?B?ZTdXNTdrTHl4Ly9uWlcxK1d5RTlnWWNkcHRhYWV4M1l2V0xwSmQwRFY4eXBu?=
 =?utf-8?B?MWpOUmFTOGtTWUxyTHpVb21Jam93V3c3U1lHMENLK0pjRnFPVlMyMFBXRng2?=
 =?utf-8?B?cFRuUHBrc3hYR20yQ2hSZS9kRHVvRHdObjVTK0ZLK05WYlhHYkhxRXVFaEtT?=
 =?utf-8?B?ZTY0MHZ2Q2NBelhzVnpkRWxVYVM2N1Zja1hhcG1KclZBSlVJZUh3Vk5IMkxK?=
 =?utf-8?B?REllM09Md1UyVWdtc3lNNUp4ZFRBa2JkREZOTTJRMXZYSVV4RGJZZUYvbEoy?=
 =?utf-8?B?aUFFSFRXRjBwR0VvTmFjL1p6S0RmMHR6b25MejhpemdxT2ZaRmNTM3VscTJM?=
 =?utf-8?B?cG9kRGlqTmJ3RGk5d05yZ1lMaUhOdFRadzJpSUpGUGM1T29OL1NKUC91Mk16?=
 =?utf-8?B?T2NGSUNDa3ZGU1QyNXBNc0tkWWUvRXMwakluME50SEIxVjJkRnNXVitvREx2?=
 =?utf-8?B?SWZoSjl4cUlHeHQ3U1F6eHl3V2pkMWdTbDRhdC8wNlVkb2NXMU1rMlg0Q1NT?=
 =?utf-8?B?VnZ3bk5qY0pRNHpuN2dmWTd3YXFSR291ZFcwVXVjUkRGQmhyYy82NWFlc09n?=
 =?utf-8?B?T3JidjBqRWR6U1NHVXFzZCswVmtzU0ExVjNCMFdRTzVjUDUxbHFOc1dNRG54?=
 =?utf-8?B?Y1pOMjZWd1FhOG14VCswN3ZEYTdLN3FQN1JBU1VFWndhcEFtU1JaRUVndzJi?=
 =?utf-8?B?alVCWHY1WGh2TUpoMWhFTXlPK3RDdlFBNFI2TWNpNlF2czJGOXkvY1BHUjk4?=
 =?utf-8?B?NGw5V2FsY0pncEZxOC9JWlZsckx6UVhHeGcvdjlTajZnbTh1cnZ0ZmVXdTV5?=
 =?utf-8?B?aXNnNXowbUNER1Q5YWp3QzAzdGxWSlBvSkM1ekVHaTU4dzdVRnJoSlY2L2JX?=
 =?utf-8?B?YXJGZmpXWDhwcjJIa1JWbytZZVpYQzBXRFFJRzRsN1YwUDQrdkJaK256anFN?=
 =?utf-8?B?eG5qTnVOZ25JMkRqSC9sWDZacUY4NDRkTmRpS1JJMTErOVpQUWFDeUh0YS9P?=
 =?utf-8?B?MFBvaDF4Qjd0WWh5cXpBd2ZBUmthSEoxRGFhelBzZWNsMXpFZHQ2b2N6U2Jk?=
 =?utf-8?B?NmNxMWJ5UjZTRDVtbldrck1vNGxSWmlZalFaMENXcTFHb3VZaTVJaHFleXJo?=
 =?utf-8?B?Skdnd25sSXRsNXUzVGdPQmZDdkxkekZpQld0NTJDOW1sZkRRUGY5Y0FxNmtU?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074bea4f-bdde-4731-90c9-08de16144b98
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:22:36.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drt2VtH3ijnjry/G36BIX+gBeK/bnr96SuMpQFyzEEFHa1+sCOt4J64Toqjua8pgLSV/jAjfaObGy/bI+FGPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_042243_395353_10056B6C 
X-CRM114-Status: GOOD (  19.60  )
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

CuWcqCAyMDI1LzEwLzI3IDIxOjEwLCBLcnp5c3p0b2YgS296bG93c2tpIOWGmemBkzoKPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGtyemtAa2VybmVsLm9yZy4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdCj4KPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIDI3LzEwLzIwMjUgMDY6NDIs
IFpoZW50YW8gR3VvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4gRnJvbTogWmhlbnRhbyBHdW8gPHpo
ZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgaW5pdGlh
bCBkcml2ZXIgc3VwcG9ydCBmb3IgQW1sb2dpYydzIG5ldwo+IFBsZWFzZSBkbyBub3QgdXNlICJU
aGlzIGNvbW1pdC9wYXRjaC9jaGFuZ2UiLCBidXQgaW1wZXJhdGl2ZSBtb29kLiBTZWUKPiBsb25n
ZXIgZXhwbGFuYXRpb24gaGVyZToKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
Ni4xNi9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Qj
TDk0CkdvdCBpdCwgSSdsbCByZWZlciB0byB0aGUgZG9jdW1lbnQgYW5kIHJldmlzZSB0aGUgY29t
bWl0IG1lc3NhZ2UuCj4KPj4gdmlkZW8gYWNjZWxlcmF0aW9uIGhhcmR3YXJlIGFyY2hpdGVjdHVy
ZSwgZGVzaWduZWQgZm9yIHZpZGVvCj4+IHN0cmVhbSBkZWNvZGluZy4gVGhlIGRyaXZlciBpcyBk
ZXNpZ25lZCB0byBzdXBwb3J0IHRoZQo+PiBWNEwyIE0yTSBzdGF0ZWxlc3MgZGVjb2RlciBBUEku
IEluIHBoYXNlIDEsIGl0IHN1cHBvcnRzIEguMjY0Cj4+IGJpdHN0cmVhbXMgZGVjb2RpbmcuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4K
PiAuLi4KPgo+Cj4+ICsKPj4gK3N0YXRpYyBpbnQgYW1sX3ZkZWNfZHJ2X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICsgICAgIHN0cnVjdCBhbWxfdmRlY19kZXYg
KmRldjsKPj4gKyAgICAgc3RydWN0IHZpZGVvX2RldmljZSAqdmZkX2RlYzsKPj4gKyAgICAgc3Ry
dWN0IGFtbF92ZGVjX2h3ICpodzsKPj4gKyAgICAgaW50IHJldCA9IDA7Cj4+ICsKPj4gKyAgICAg
ZGV2ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZGV2KSwgR0ZQX0tFUk5FTCk7
Cj4+ICsgICAgIGlmICghZGV2KQo+PiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiAr
Cj4+ICsgICAgIGRldi0+cGxhdF9kZXYgPSBwZGV2Owo+PiArICAgICBtdXRleF9pbml0KCZkZXYt
PmRldl9tdXRleCk7Cj4+ICsKPj4gKyAgICAgcmV0ID0gdjRsMl9kZXZpY2VfcmVnaXN0ZXIoJnBk
ZXYtPmRldiwgJmRldi0+djRsMl9kZXYpOwo+PiArICAgICBpZiAocmV0KQo+PiArICAgICAgICAg
ICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgInY0bDJfZGV2aWNlX3Jl
Z2lzdGVyIGVyclxuIik7Cj4+ICsKPj4gKyAgICAgdmZkX2RlYyA9IHZpZGVvX2RldmljZV9hbGxv
YygpOwo+PiArICAgICBpZiAoIXZmZF9kZWMpIHsKPj4gKyAgICAgICAgICAgICB2NGwyX2Vycigm
ZGV2LT52NGwyX2RldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSB2aWRlbyBkZXZpY2VcbiIpOwo+PiAr
ICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4+ICsgICAgICAgICAgICAgZ290byBlcnJfZGV2
aWNlX2FsbG9jOwo+PiArICAgICB9Cj4+ICsgICAgICp2ZmRfZGVjID0gZGVjX2RldjsKPj4gKyAg
ICAgdmZkX2RlYy0+djRsMl9kZXYgPSAmZGV2LT52NGwyX2RldjsKPj4gKyAgICAgdmZkX2RlYy0+
bG9jayA9ICZkZXYtPmRldl9tdXRleDsKPj4gKyAgICAgdmlkZW9fc2V0X2RydmRhdGEodmZkX2Rl
YywgZGV2KTsKPj4gKyAgICAgZGV2LT52ZmQgPSB2ZmRfZGVjOwo+PiArICAgICBwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOwo+PiArCj4+ICsgICAgIGh3ID0ga3phbGxvYyhzaXplb2Yo
Kmh3KSwgR0ZQX0tFUk5FTCk7Cj4gV2h5IGFyZW4ndCB5b3UgdXNpbmcgZGV2bSBpbnRlcmZhY2Vz
PwpUaGFua3MgZm9yIHRoZSByZW1pbmRlciwgSXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSB0aGUg
ZGV2bSBpbnRlcmZhY2VzIGhlcmUsCkknbGwgZml4IHRoaXMuCj4+ICsgICAgIGlmICghaHcpIHsK
Pj4gKyAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOwo+PiArICAgICAgICAgICAgIGdvdG8gZXJy
X2RlY19tZW1faW5pdDsKPj4gKyAgICAgfQo+PiArICAgICBkZXYtPmRlY19odyA9IGh3Owo+PiAr
Cj4+ICsgICAgIGRldi0+cHZkZWNfZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRl
di0+ZGV2KTsKPj4gKyAgICAgcmV0ID0gZGV2LT5wdmRlY19kYXRhLT5yZXFfaHdfcmVzb3VyY2Uo
ZGV2KTsKPj4gKyAgICAgaWYgKHJldCA8IDApCj4+ICsgICAgICAgICAgICAgZ290byBlcnJfaHdf
aW5pdDsKPj4gKwo+PiArICAgICBkZXYtPm0ybV9kZXZfZGVjID0gdjRsMl9tMm1faW5pdCgmYW1s
X3ZkZWNfbTJtX29wcyk7Cj4+ICsgICAgIGlmIChJU19FUlIoKF9fZm9yY2Ugdm9pZCAqKWRldi0+
bTJtX2Rldl9kZWMpKSB7Cj4gSHVoPyBXaHkgdGhlIGNhc3Q/ClRoZSBjYXN0IHNlZW1zIHN1cGVy
Zmx1b3VzIGhlcmUsIEknbGwgcmVtb3ZlIGl0Lgo+PiArICAgICAgICAgICAgIHY0bDJfZXJyKCZk
ZXYtPnY0bDJfZGV2LCAiRmFpbGVkIHRvIGluaXQgbWVtMm1lbSBkZWMgZGV2aWNlXG4iKTsKPj4g
KyAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKChfX2ZvcmNlIHZvaWQgKilkZXYtPm0ybV9kZXZf
ZGVjKTsKPj4gKyAgICAgICAgICAgICBnb3RvIGVycl9od19pbml0Owo+PiArICAgICB9Cj4+ICsK
Pj4gKyAgICAgcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKHZmZF9kZWMsIFZGTF9UWVBFX1ZJ
REVPLCAtMSk7Cj4+ICsgICAgIGlmIChyZXQpIHsKPj4gKyAgICAgICAgICAgICB2NGwyX2Vycigm
ZGV2LT52NGwyX2RldiwgIkZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBkZXZpY2UiKTsKPj4gKyAg
ICAgICAgICAgICBnb3RvIGVycl92aWRfZGV2X3JlZ2lzdGVyOwo+PiArICAgICB9Cj4+ICsKPj4g
KyAgICAgdjRsMl9pbmZvKCZkZXYtPnY0bDJfZGV2LCAiUmVnaXN0ZXJlZCAlcyBhcyAvZGV2LyVz
XG4iLAo+PiArICAgICAgICAgICAgICAgdmZkX2RlYy0+bmFtZSwgdmlkZW9fZGV2aWNlX25vZGVf
bmFtZSh2ZmRfZGVjKSk7Cj4gVGhpcyBkb2VzIG5vdCBsb29rIGxpa2UgdXNlZnVsIHByaW50ayBt
ZXNzYWdlLiBEcml2ZXJzIHNob3VsZCBiZSBzaWxlbnQKPiBvbiBzdWNjZXNzOgo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1LXJjNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL2NvZGluZy1zdHlsZS5yc3QjTDkxMwo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y2LjE1LXJjNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9k
cml2ZXJfZGV2ZWxvcG1lbnRfZGVidWdnaW5nX2d1aWRlLnJzdCNMNzkKR290IGl0LCBJJ2xsIGdl
dCByaWQgb2YgaXQuCj4KPj4gKwo+PiArICAgICBkZXYtPm1kZXYuZGV2ID0gJnBkZXYtPmRldjsK
Pj4gKyAgICAgc3Ryc2NweShkZXYtPm1kZXYubW9kZWwsIEFNTF9WREVDX0RSVl9OQU1FLCBzaXpl
b2YoZGV2LT5tZGV2Lm1vZGVsKSk7Cj4+ICsgICAgIG1lZGlhX2RldmljZV9pbml0KCZkZXYtPm1k
ZXYpOwo+PiArICAgICBkZXYtPm1kZXYub3BzID0gJmFtbF9tMm1fbWVkaWFfb3BzOwo+PiArICAg
ICBkZXYtPnY0bDJfZGV2Lm1kZXYgPSAmZGV2LT5tZGV2Owo+PiArCj4+ICsgICAgIHJldCA9IHY0
bDJfbTJtX3JlZ2lzdGVyX21lZGlhX2NvbnRyb2xsZXIoZGV2LT5tMm1fZGV2X2RlYywgdmZkX2Rl
YywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRURJ
QV9FTlRfRl9QUk9DX1ZJREVPX0RFQ09ERVIpOwo+PiArICAgICBpZiAocmV0KSB7Cj4+ICsgICAg
ICAgICAgICAgdjRsMl9lcnIoJmRldi0+djRsMl9kZXYsICJGYWlsZWQgdG8gaW5pdCBtZW0ybWVt
IG1lZGlhIGNvbnRyb2xsZXJcbiIpOwo+PiArICAgICAgICAgICAgIGdvdG8gZXJyb3JfbTJtX21j
X3JlZ2lzdGVyOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgcmV0ID0gbWVkaWFfZGV2aWNlX3Jl
Z2lzdGVyKCZkZXYtPm1kZXYpOwo+PiArICAgICBpZiAocmV0KSB7Cj4+ICsgICAgICAgICAgICAg
djRsMl9lcnIoJmRldi0+djRsMl9kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgbWVkaWEgZGV2aWNl
Iik7Cj4+ICsgICAgICAgICAgICAgZ290byBlcnJfbWVkaWFfZGV2X3JlZ2lzdGVyOwo+PiArICAg
ICB9Cj4+ICsgICAgIHZkZWNfZW5hYmxlKGRldi0+ZGVjX2h3KTsKPj4gKyAgICAgcmV0dXJuIDA7
Cj4+ICsKPj4gK2Vycl9tZWRpYV9kZXZfcmVnaXN0ZXI6Cj4+ICsgICAgIHY0bDJfbTJtX3VucmVn
aXN0ZXJfbWVkaWFfY29udHJvbGxlcihkZXYtPm0ybV9kZXZfZGVjKTsKPj4gK2Vycm9yX20ybV9t
Y19yZWdpc3RlcjoKPj4gKyAgICAgbWVkaWFfZGV2aWNlX2NsZWFudXAoJmRldi0+bWRldik7Cj4+
ICtlcnJfdmlkX2Rldl9yZWdpc3RlcjoKPj4gKyAgICAgdjRsMl9tMm1fcmVsZWFzZShkZXYtPm0y
bV9kZXZfZGVjKTsKPj4gK2Vycl9od19pbml0Ogo+PiArICAgICBrZnJlZShodyk7Cj4+ICsgICAg
IGRldi0+ZGVjX2h3ID0gTlVMTDsKPj4gK2Vycl9kZWNfbWVtX2luaXQ6Cj4+ICsgICAgIHZpZGVv
X2RldmljZV9yZWxlYXNlKHZmZF9kZWMpOwo+PiArZXJyX2RldmljZV9hbGxvYzoKPj4gKyAgICAg
djRsMl9kZXZpY2VfdW5yZWdpc3RlcigmZGV2LT52NGwyX2Rldik7Cj4+ICsgICAgIHJldHVybiBy
ZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGFtbF92ZGVjX2Rydl9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gK3sKPj4gKyAgICAgc3RydWN0IGFtbF92ZGVjX2Rl
diAqZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4+ICsKPj4gKyAgICAgdmRlY19k
aXNhYmxlKGRldi0+ZGVjX2h3KTsKPj4gKwo+PiArICAgICBpZiAobWVkaWFfZGV2bm9kZV9pc19y
ZWdpc3RlcmVkKGRldi0+bWRldi5kZXZub2RlKSkgewo+PiArICAgICAgICAgICAgIG1lZGlhX2Rl
dmljZV91bnJlZ2lzdGVyKCZkZXYtPm1kZXYpOwo+PiArICAgICAgICAgICAgIG1lZGlhX2Rldmlj
ZV9jbGVhbnVwKCZkZXYtPm1kZXYpOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgaWYgKGRldi0+
bTJtX2Rldl9kZWMpCj4+ICsgICAgICAgICAgICAgdjRsMl9tMm1fcmVsZWFzZShkZXYtPm0ybV9k
ZXZfZGVjKTsKPj4gKyAgICAgaWYgKGRldi0+dmZkKQo+PiArICAgICAgICAgICAgIHZpZGVvX3Vu
cmVnaXN0ZXJfZGV2aWNlKGRldi0+dmZkKTsKPj4gKyAgICAgaWYgKGRldi0+ZGVjX2h3KQo+PiAr
ICAgICAgICAgICAgIGRldi0+cHZkZWNfZGF0YS0+ZGVzdHJveV9od19yZXNvdXJjZShkZXYpOwo+
PiArCj4+ICsgICAgIHY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoJmRldi0+djRsMl9kZXYpOwo+PiAr
Cj4+ICsgICAgIHByX2RlYnVnKCJhbWwgdjRsMiBkZWNvZGVyIGRyaXZlciByZW1vdmVcbiIpOwo+
Cj4gVGhpcyBkb2VzIG5vdCBsb29rIGxpa2UgdXNlZnVsIHByaW50ayBtZXNzYWdlLiBEcml2ZXJz
IHNob3VsZCBiZSBzaWxlbnQKPiBvbiBzdWNjZXNzOgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjE1LXJjNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1z
dHlsZS5yc3QjTDkxMwo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1LXJj
Ny9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9kcml2ZXJfZGV2ZWxvcG1l
bnRfZGVidWdnaW5nX2d1aWRlLnJzdCNMNzkKSSdsbCByZW1vdmUgdGhpcyBtZXNzYWdlLgo+Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFtbF92ZGVjX21h
dGNoW10gPSB7Cj4+ICsgICAgIHsuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXZjb2RlYy1kZWMi
LCAuZGF0YSA9ICZhbWxfdmRlY19zNF9wZGF0YX0sCj4+ICsgICAgIHt9LAo+PiArfTsKPj4gKwo+
PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYW1sX3Zjb2RlY19kZWNfZHJpdmVyID0g
ewo+PiArICAgICAucHJvYmUgICAgPSBhbWxfdmRlY19kcnZfcHJvYmUsCj4+ICsgICAgIC5yZW1v
dmUgICAgPSBhbWxfdmRlY19kcnZfcmVtb3ZlLAo+PiArICAgICAuZHJpdmVyICAgID0gewo+PiAr
ICAgICAgICAgICAgIC5uYW1lICAgID0gQU1MX1ZERUNfRFJWX05BTUUsCj4+ICsgICAgICAgICAg
ICAgLm9mX21hdGNoX3RhYmxlID0gYW1sX3ZkZWNfbWF0Y2gsCj4+ICsgICAgIH0sCj4+ICt9Owo+
PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCBhbWxfdmRlY19pbml0KHZvaWQpCj4+ICt7Cj4+ICsg
ICAgIHByX2RlYnVnKCJhbWwgdjRsMiBkZWNvZGVyIG1vZHVsZSBpbml0XG4iKTsKPj4gKwo+PiAr
ICAgICBpZiAocGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZhbWxfdmNvZGVjX2RlY19kcml2ZXIp
KSB7Cj4+ICsgICAgICAgICAgICAgcHJfZXJyKCJmYWlsZWQgdG8gcmVnaXN0ZXIgYW1sIHY0bDIg
ZGVjb2RlclxuIik7Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4+ICsgICAgIH0K
Pj4gKwo+PiArICAgICByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgX19leGl0
IGFtbF92ZGVjX2V4aXQodm9pZCkKPj4gK3sKPj4gKyAgICAgcHJfZGVidWcoImFtbCB2NGwyIGRl
Y29kZXIgbW9kdWxlIGV4aXRcbiIpOwo+PiArICAgICBwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3Rl
cigmYW1sX3Zjb2RlY19kZWNfZHJpdmVyKTsKPiBObywgZHJvcCBlbnRpcmUgaW5pdC9leGl0LiBU
aGlzIGlzIHNvbWUgcmVhbGx5IG9kZCBjb2RlLCBwcm9iYWJseQo+IGNvcHktcGFzdGUgZnJvbSBw
b29yIGRvd25zdHJlYW0uIFBsZWFzZSBsb29rIGF0IHVwc3RyZWFtIGRyaXZlcnMgLSBkbwo+IHlv
dSBzZWUgYW55dGhpbmcgbGlrZSB0aGF0IGFueXdoZXJlPwpZZXMsIGl0IHNob3VsZCBiZSBkcm9w
cGVkLiBJIHJldmlld2VkIHNvbWUgb3RoZXIgdXBzdHJlYW0gZHJpdmVycywgbm9ib2R5CmFkZCB0
aGlzLgo+PiArfQo+PiArCj4+ICttb2R1bGVfaW5pdChhbWxfdmRlY19pbml0KTsKPj4gK21vZHVs
ZV9leGl0KGFtbF92ZGVjX2V4aXQpOwo+PiArCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoK
VGhhbmsgeW91CgpaaGVudGFvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
