Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1350DEDE996
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 02:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zgo37ZXVhqXiTvU92e3iTxisTD14QRvmXGoEtSX5rZ0=; b=vO659K+TmGR4ujhyZ81uQEpVHq
	bFCQG02f4cPobNxybJ3vBYK3fghx0xE+LATD3SK4SIfzX1Vo3Q48dEynsp2289AYEUvX+zOsWphwF
	BLN7R61/YG11zSrfxQuucNiDhqGjSeAB839YOUQNUbX5G8nLee0bhuIBy220MdeSPVeMuL+zEPFwA
	V/DZ71LT5G01vq1OjkamrMZKzvTMlWOguZHviNK+DqaXPmrFcTfjzv4z9kY8s472oMuCgHCflrnrr
	DeVHMoEeKPeEiwj0wCj7KNO4Be8Bk7IFeFW7koarXJkouJXk1iUMUR7Lzk+omD2fgzdxzkUqGw0h9
	HUhJ3sEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqY2-00000003wqO-2EmG;
	Tue, 10 Sep 2024 02:24:06 +0000
Received: from mail-psaapc01on20716.outbound.protection.outlook.com ([2a01:111:f400:feae::716] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqWt-00000003wXe-1HP3;
	Tue, 10 Sep 2024 02:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbdn21ZxfHuJQBvpc83YEyeETp8o/XzeCAkzbbubxtnjLc65BztPqxd5sb+cUcAGQE+LN3UfABQgfRxM8BTu/uLjVVyVDQvAdyXNPegT9VC2TsqhD7P60WiqGNXxcECZMm/bSWmoLfnl5oMd/ZASMP+/Rqlf57A1foItUO5/0te1V6r+k1zsJ7TwWT2DfwsIrbQ/ay0Oe92rarHunqyf5X7XLsdwfW1ueaFtd+ocqdO2uVYgXO7EnqO8gKqWzOGWBTmQDYwYGfAw0mtJsxpyLgmpIhFOJIQoawXTn5jAWreOeMCrLlrywraZuO8MRkNbyG0B+mhCwR4MhGrsOsAikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofUAISy9bGR4TM5pCTSgjUbg8kAgrPKbnBS9O+i+E8g=;
 b=vUPjCymNp/BOTEJaFyKsbMRx321CrFUTpAErKZl8d/vk1A1D83w5K5hZ0my+Uekcs+e8x/hSmIIrZv/Z+0gNx/i69Ib9f5zmsjEmncwUVbBDz+OFCNVR1ONIzPfdFJoTDa/2VkDdC9MML5DZljyEkr80IhzQzfXjVkPo/lGyjm7gZ3CAZrHg7/b4wfK+xUeEHngE1x6m08O5tl+5LRPUvyIu5+hu5eNLKlbXI4kpYsksyISSPrjJK9ksOTshiVafQee7wdsWWnzB8wZD2yiV73vxZtMoQpfh5CwD7o4t5Ilrt5Y5NuayBKzV4ncpcTUtPdE9SV7onoiQ6QuReIsEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofUAISy9bGR4TM5pCTSgjUbg8kAgrPKbnBS9O+i+E8g=;
 b=TCy+EER+8LpU3He8x0yFj4UX8igzOPDdXV4umNaujTZTEll+RplSRmzEHzJttt8IUnStnnpsOicfrh59F/DWocuDOGtQofPmAyGSSmjJAwSX8Ly9YB3xBwPc++vK3l9rId5X115RcCT00jmI6LrRb0WAnyOTAy/51IRfF9txSQJC5rzeU0lYYvqitJ/3roPPJD6vs9XT9ABNitvyVAZ7zH8geQcpI7/vpm+SE6PVYsJwUaZ2ZVyn+4XOYc7TgS4KYGV/HTzjGN1e4g5/nkJo2dCnPerLVu2T66gLHEFSfn2VZi+bbC4mCoOQO8QFj6IEJaeZmxV/IUGaA7wKRjT1HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
 by TY0PR03MB6655.apcprd03.prod.outlook.com (2603:1096:400:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 02:22:41 +0000
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732]) by JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 02:22:41 +0000
Message-ID: <6326decd-cb9f-4095-9aca-4d40819d2eb4@amlogic.com>
Date: Tue, 10 Sep 2024 10:22:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH 1/2] dt-bindings: pwm: amlogic:
 Document C3 PWM
To: George Stark <gnstark@salutedevices.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pwm@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
References: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
 <20240906-c3-pwm-v1-1-acaf17fad247@amlogic.com>
 <fcd005d2-dba4-4980-8d0d-f55632c7a6d9@salutedevices.com>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Content-Language: en-US
In-Reply-To: <fcd005d2-dba4-4980-8d0d-f55632c7a6d9@salutedevices.com>
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To JH0PR03MB7384.apcprd03.prod.outlook.com
 (2603:1096:990:11::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7384:EE_|TY0PR03MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 8708e577-e9bd-4687-2891-08dcd13f7271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2dpUHZkWHVuYzhQZ0FKTVVmZW5qZ2JxZGZQdUpqT3RFdFhCM3ljVDhjcUdC?=
 =?utf-8?B?M3VTRm5iY2s4eklhbEZ4eUNVWi9nK2NmUlVCZGRBZXNWQlE5dVZzS0RlVGRD?=
 =?utf-8?B?eG5wckVJRHpTZmdOMkwzVGFSTUZTa0UrZncweGdkVWxYZHJBV3dXaExOUkRK?=
 =?utf-8?B?NUlLNFVCbFB4ZDFKTWRLVUk2RzNBRVk2cUZ3L1Y5aHUvK2M5d1lKeXkzSE1X?=
 =?utf-8?B?V2NNZUxMMmhTZGlTZHpPcVRTbDFNcE9UZnd0am1Xcm1TdGRuUnZkQ2ZSOGJJ?=
 =?utf-8?B?Y1dBemZIem5iN0pSMURxOGwwNGJ6KzdIOU43TUdZL0xTczNHVWRNYThOMTRv?=
 =?utf-8?B?M1lwRmJQMzVYWUtoa3ZOb0FLRFVPM2lMVjFnVy9TUHFqR1R5M01JTm1RcXh0?=
 =?utf-8?B?ektqeUQ2NlVJbjYzcStSaTFUTzByWVB6N1g3TUQzbjM1elk2eXZoWGFyTjNa?=
 =?utf-8?B?OWVYOFdSZ2Q1SVlPYnZVK0hkU1JvdHFsWmpjRDdSekllOHFhM2E0WHQyWEY5?=
 =?utf-8?B?Qzd6cHV5dWdEZ3BENUlidWhtTnh5ODV6cGtYWlMwUXJKOENYTDhNdndXalB3?=
 =?utf-8?B?TzJzU1lRRU9kMEt3SHdyWWxwbVY5ZjRBN1I2NkNWbVowZUd6R1V5Qlc0Uk9W?=
 =?utf-8?B?R096MVRxRjFJRnBDSXl1Q2czbk9lQ21teHVuaEFUL1BqUUxST3JaRlVnTk8y?=
 =?utf-8?B?L3pMZXFXTURZVnB4M3hjZXN1aDd4MEszaDlrV3phbVJKQVZwSVVmeUFKV0tn?=
 =?utf-8?B?cFVYWW5EUHZ0RVJVTnhCcE5YS3AwWEFHaEUwbVRsZGhDd0pwUjBCRkYxMThG?=
 =?utf-8?B?RnpEaURNNXBPQUhyejY1YlF6U2pFQlpBQ3N0SHhiR3VJRFJLQ3Z1SExuSzVY?=
 =?utf-8?B?TEJVaVJtZmM3YVlzOWQ4K0lDeDhQQ0hndU83aFNqUEhCNnhZb1BIcEhOTGVp?=
 =?utf-8?B?bEFYeFhyZHRsQ3lBN3A5T00yNXY0VXQ5MHFDRk1COW1HcTRQTFU1YkdnYkpq?=
 =?utf-8?B?R1pDaVVoNko0M09oQThZdjlweWN4ZFBELzg2OXpjdU1qenpoQ05LN2V0ZFNj?=
 =?utf-8?B?dllUL0J0M0tIVXV3cWRyaUZnQkhMdE4wbXVMOXZKam1XbWh4U05vYitVb3l4?=
 =?utf-8?B?MUxPMElZRUI2RFhJQ21JaHpJMGZYR3RrOHVlM0QvQmg2b0hRVnlKY25LRWNo?=
 =?utf-8?B?ZDBHVmd1Q2VtajJweFowTlcyREFUQkg3ekRBZGJld2V1a1RScE9tR3NTa0g2?=
 =?utf-8?B?eFphS3BsSFFmSDc5MXNQTHhla1hlc1dOQ1hydDlSQmFCdWVDbXRvUkg3dVJJ?=
 =?utf-8?B?K3FCQ0x2cWlLeEdVeFJ5SHhvbHBzQjg0bkJGdG9tejB1M3d2VEozcGUyT1cv?=
 =?utf-8?B?bEJ0SVlTK1lzWUZrMnBJU29NNkFkK2xuMEtZVFN2WTE0eXBvME9ML1QyR2Zj?=
 =?utf-8?B?MnkveThCR2JONFRhSmhtWGFtL0RzU0NFbkJ1QThVZzhDeVhZd1hldDU2bEZU?=
 =?utf-8?B?OFQ0c00vbEFKQ3Q3Z0NsbVAwcW5xV0VTL2ZvNTRRYko0anI5NHpSVzI2am5n?=
 =?utf-8?B?K3ZIT0ZhQnIyd2J2RjV6NnppS2d5MSsxbDF6OXA5NEY5NFJZakNkZDVIdm5l?=
 =?utf-8?B?MHJNSkE0Q0p3UzdRUmcxeURlYUhSanJnL0kxT0twU2RLakhxekg2dm93ZWhO?=
 =?utf-8?B?R2d5WGJwQU9XdUpuVEx1S0ZoQ1JoNW9sODdHYzdSeEt1OWMwNWVCSnNpMzcy?=
 =?utf-8?Q?Wv2WT6VbArLSlhdnmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7384.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9TNExvM0l5ODRkcXNOSVNHYW0zclFWWll3S0NiN3kvL0RHNDkyUEljNkI3?=
 =?utf-8?B?Q09mM1U2QURWMStWdnVaNjU4L3ZGYzIreTJwUTZFelVCUDRvN3hkLzVtNEpw?=
 =?utf-8?B?dkNwQVhLbjVxNjNqOGZOQjVTVmJrcXNLVEVKYm55R3hOenFNVGVlS1FKS3RJ?=
 =?utf-8?B?ZWFlUWVFT2VXQWFBZXpwSDZVVG1YSkg4Y2lOSmdOUlB1aEVXZVByZlNXWmNm?=
 =?utf-8?B?clZSNlE2Tjg1V3JoSnNLM0lXN0tseGN3U3FvSWJybHJobHdzWmpyWVZaYmdx?=
 =?utf-8?B?MkJKTUMyNE9lT21ZdndqMmlrTFJhNGNTak5NaWJMK1p4QTMvenc1SzlTRXI3?=
 =?utf-8?B?dC9FYVFBK1JrR2M5QWkxOGlsK0tiOVR0aTRsb2xDSWxiWE5IRTE4UHhkbnhm?=
 =?utf-8?B?QW5WcXAxZjNPZTVJZUZFSTJtSlJxdEpMUUFWcmMyV2ZSR0xTUXdGSXhiVEds?=
 =?utf-8?B?ajVLR25WMXNRSTRoWWUyVXJZL2pnTlNMMk40akliT1FxcVlKWEIxQ2J4a0ls?=
 =?utf-8?B?bGJPd3NUbkpnemZrOGU3NUF3a3llRGNCbXREZUtGOHY0T0J5d2dLdVJmZXY2?=
 =?utf-8?B?S0xVNzAySFNuSzMxcEdQUG9pRWJTOUpERGtwanNZN2VrcmhZK24xQjdzWkZh?=
 =?utf-8?B?V0duWHl0WkhuR055WFRTanJmYiszMUE4b2hhbHYxVi9uejl5dTY2LzRPUHJY?=
 =?utf-8?B?d2hsZDMxY29MVW5BS2J2RldPMVVPOHJBLzBjYlNWZDdqUWtvMUlXQ0lHbm9I?=
 =?utf-8?B?VnhLbE9hOWV0Mm1Ldm1FNXZKT2VzcVdKSW5vQWFaK1dIVEtydnErSlU5Z3pu?=
 =?utf-8?B?SVRYa3FiQW90RWcvWEhWVVF1MGNGVnlZRC95cnBYcXlJbWZ2RXdRdzVHWG1P?=
 =?utf-8?B?TmtjUGdrOWhEOW90Q0RibXlxYjlCZWM4U2c4akZraW1nWTE3M2lCWlNYQiti?=
 =?utf-8?B?VTgxWUlqUXBwYlpuRmUwSGpmN2VTU1E0RFF3VWo2Ym1tOVZmSDMxVUtackdF?=
 =?utf-8?B?RGJXa0ZyUlkyYUJmbWRacHpKalFaMWp2QnlXYThmQW9aZ3dnOWw1Qk9jV3F6?=
 =?utf-8?B?SWxvOElrMWQ4bERvZWU5emhLdUNlT0UrLzNyK0FEOVF0elZ5WlFWMnQyVEhx?=
 =?utf-8?B?Z1U1MnMrc1ZxKzJmQUdoMXVOTUU5Si83U1FJSTBpVERSY3h6RzZkUldPSWt6?=
 =?utf-8?B?VENqRlpBVEtnMDZ1OFRsdG85bnZIM3BGYjkyQlVjMSsxNzNNMERlcGhnVU5m?=
 =?utf-8?B?ZkRINjRwcHBvOHZ1dmdsUGhQR1BJMU1kYjJmUVlJN1c0SElaYlZzd01kTjRx?=
 =?utf-8?B?L2R6UkF2Y3JRelM2TkJEdmdXSndjWWJMQS9WR1BoREszN0FRT2VTdkdOYnFU?=
 =?utf-8?B?cXgyVDJEYlB3cnV6M1I2L2FtYURTYmNjT21LMlZyZ1I2WDNRdHJCTEhDdzl1?=
 =?utf-8?B?T1RybmlRS0ZYMnE0S05YaU9meVdBQmVGTDdMVE9COHpZTFp4K0NYUFJNL1Ra?=
 =?utf-8?B?UUg3YnM3Q293aXBQbUZPZllzeXVpZGxPbGZZdjVpVEJXM0Z6aVUrZFQ3T2ZY?=
 =?utf-8?B?eXBKT09BVjRFOU54SkE2VUdDbDU0dXNNOUM3UmpNaU5USS80T1gzbXQ1MVpT?=
 =?utf-8?B?RmR1VDBEcmtKMlFIM0lVblByMEJqd1JnaU1haEY1bDU4bTBJUzNJQXVCOG1s?=
 =?utf-8?B?R2FjZWo5c1pjaG9wUDVJSHR1TUhlcStkT21ObHoxNXhQTFRGRjMwbHIxaHR6?=
 =?utf-8?B?SzdxTGptM2N0QWg5aWVTSkUycXM0Zk1Ic3AxWHNoaG5EbTlvbVd6RXRhTGlC?=
 =?utf-8?B?Vmg4R2Y4b2tOdUdxVWdNNXBHQkMwSnhWOEpPbUQybGVsKzlZMDN3dzJ3Wkli?=
 =?utf-8?B?RDNMTEhqZ1ZSVFdOYWhuVGJjYkhuRFVJRFB2am9PM3U4dmNRZzV2S2dVVVhz?=
 =?utf-8?B?S2pHRDkzYk5ubFNHUTdCM2VZZmE0enNPZWt6cUVGWEtxcWR4RmtVbVEyeGl0?=
 =?utf-8?B?Sm5mRGpxL1BzKzlVY01LaVp2M0NpY1JZL2NxN1p5cnRBS2pWWUhjaFZPODF5?=
 =?utf-8?B?eFo1S3hlc09SQlhiVldDMEhWek1lY3dNclpadTlyWTAzbXdvdUdBZHZpZ09M?=
 =?utf-8?B?akoycmc0SWd6SEZKSFlsVmU2cXB4NEppWkozVU9ZclR2eEFFbkJYckJvMHZh?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8708e577-e9bd-4687-2891-08dcd13f7271
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 02:22:41.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KM5Ts7N3sCmSpJrBNDKxuvFY/jupjOx1dTzro5Zrc/9aCQiYbPS1KiGpfY6THt7jxNWw8NBud/7Fj3XeXyoq8iIHDONn1D1DmiQmtXjpAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_192255_375002_5C80B862 
X-CRM114-Status: GOOD (  10.08  )
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

CgpPbiAyMDI0LzkvOSAyMDo0OSwgR2VvcmdlIFN0YXJrIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+IAo+IEhlbGxvIEtlbHZpbiwgS3J6eXN6dG9mCj4gCj4gVGhlcmUncyBhY2tlZCB5ZXQg
bm90IG1lcmdlZCBwYXRjaCBbMV0gYWRkaW5nIGFtbG9naWMsbWVzb24tYTEtcHdtIHdpdGgKPiBz
NCBhcyBiYWNrLWNvbXBhdGlibGUuIFNob3VsZCBhbWxvZ2ljLGMzLXB3bSBiZSBhZGRlZCBpbiB0
aGUgZW51bSBhbG9uZwo+IHdpdGggYTE/Cj4gCj4gWzFdCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtYXJtLWtlcm5lbC9kYmI0YmU1MC00NzkzLTQwYWItIAo+IGIzNjItNmM5YTZkZDg3
MzI0QHNhbHV0ZWRldmljZXMuY29tL1QvCj4gCkhlbGxvIEdlb3JnZSwKSSd2ZSBub3RpY2VkIHlv
dXIgcGF0Y2guCk9uY2UgaXQgaXMgbWVyZ2VkLCBJIHdpbGwgcmViYXNlIG15IHN1Ym1pc3Npb24u
ClRoYW5rcyEKCj4gT24gOS82LzI0IDE1OjQ2LCBLZWx2aW4gWmhhbmcgdmlhIEI0IFJlbGF5IHdy
b3RlOgo+PiBGcm9tOiBLZWx2aW4gWmhhbmcgPGtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbT4KPj4K
Pj4gRG9jdW1lbnQgYW1sb2dpYyxjMy1wd20gY29tcGF0aWJsZSwgd2hpY2ggZmFsbHMgYmFjayB0
byB0aGUgbWVzb24tczQtcHdtCj4+IGdyb3VwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWx2aW4g
WmhhbmcgPGtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IMKgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbCB8IDQgKysrKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwgYi8gCj4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbAo+
PiBpbmRleCAxZDcxZDRmOGYzMjguLjM1NjM3MTE2NGFjZCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tYW1sb2dpYy55YW1sCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbAo+
PiBAQCAtNDQsNiArNDQsMTAgQEAgcHJvcGVydGllczoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gYW1sb2dpYyxtZXNvbi1heGctcHdtLXYyCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsbWVzb24tZzEyLXB3bS12Mgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244LXB3bS12Mgo+PiArwqDCoMKgwqDCoCAt
IGl0ZW1zOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxjMy1wd20KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNv
bnN0OiBhbWxvZ2ljLG1lc29uLXM0LXB3bQo+Pgo+PiDCoMKgwqAgcmVnOgo+PiDCoMKgwqDCoMKg
IG1heEl0ZW1zOiAxCj4+Cj4gCj4gLS0gCj4gQmVzdCByZWdhcmRzCj4gR2VvcmdlCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
