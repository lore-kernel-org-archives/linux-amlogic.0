Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182A4CA0FE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Aug 2025 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npg9ah+ntut7fJsMHMk4c0lN1ob3+EAMZafk0zN8bPk=; b=pdbIIvwvBMr4tpJlSq6003phO0
	hTaiSrdFe4Ugb14miKnPzorDCmHV3vrhQwCnQZA3uINCfYrx/C//1vyfm/yGxdbtcNCuejbuXKHQi
	66gQJ2TBxtG1HH2OQW1MIDE2tJKQCp+oHmMtMxuK9ODBRL86ZooG4mR6JEerFvX1K5IZT4gEguYj8
	n8QS08xsolNy9amoVYKKb5sevgoEgYFegNYqBqXeGc2fm8qXbCj+kNjGXJ5BHdk9oIcghx/5QXW7/
	8SnaAMTLwo/7rekxeqY3u9FXZk+05SXnniG4h6RiX8GsBTdgmwPcBA1qlsUahkxTK2gRbpSTaB3AM
	8LAMKHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqodz-0000000AwYC-19Im;
	Tue, 26 Aug 2025 08:03:03 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqobS-0000000Aw17-0W0u;
	Tue, 26 Aug 2025 08:00:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keReTJ1LtuPqUZOOB85hAyq1pgkFNFLOJjd8D03H944I9e6Bsrc5VwU/I5Xhnt6vR/xUwQ3kJ4C6C9BW63vbFSdZOGfaSGSl0Nif78O0e9tXO4ZNDTLZXQWxHyBhlNKwKO8qlr+CIM/C9BjbJQS+S5JZVVir1zWpbCsElf/rlBcDOzEu5+pc/Y5Mi7tf1aPsshtyvl9/+JEjVFI5FIpNN/zqKWjouSGcXqTO9gNdo7+0X5DTZwDFD5dML5AXJztn8xfgQ3xNTYrvtaMFheKX5O1BnqIuTqMTkWZzoMGWmMCWk0Ti5JTIrOVwQMGpxxyWaogxzseTgC04LBiYEtiLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIp607oodqMekMqfHryfRM8HbCVOOcE+cw/TuEpL+I0=;
 b=B8iXC34on4qO/U45BZBr7GRS/5cVz4F56bDx3AbXhJR1oo29iNOkheaqp+RL8SmIlPwBv+55X6Q4nZxFDML1Nik9gpupgVu06dGr20XnrVzkDi7reCe/plc012dsa2lfTsxMELGK6Po1D1OiAgw0lQpx7U17sBH4T5idUHxPrEhK+t7QzmNCFLCGeQ1LI815Yl6s5UeWzD1biZVYNq48DEV7xiNfpO6FKEbLa2poShoOz4GzMJmmAEijm28vEruzdV2rTTEBSDTC8OsEuGNalXsNcEis/G5wlzzmlcbN3Oh/Kzaj0lYZUWAMDrVE0Vx0vHeRidk7HvI2sMGeaH+uMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIp607oodqMekMqfHryfRM8HbCVOOcE+cw/TuEpL+I0=;
 b=AiSolYw+yLSAmpT2yjYumBupa1oOy7M7n/5EPLrM8MK4L9Rx97i6BLjZ9cY3McXu7+IKaK6gzAIA4QdeDkkX3oiPZGOA3DQXXj8Bz/rfVRb4NmVrAxS6TbbyW+qtBLozs7uvGxnoTzc3HTlzXqwv6wuBqbrJCBA48FhfTdtEOwHs9lspyfO5Uwk6a9v77IePlDuIarfvIqKlnacl470TWetpmRR1BnR2jtgyN+e2MzVYnz7AX5iVWZzV6zOkBXFkhxPzUQQ+VqblwNPoUdE3Q8a87MmysyddtF6CVAhkRKpr6Ja6mDMPHOJWc021oDMfZZv2DXTUhb+2gn/xgxRLfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TY0PR03MB8300.apcprd03.prod.outlook.com (2603:1096:405:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 08:00:15 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.9052.013; Tue, 26 Aug 2025
 08:00:15 +0000
Message-ID: <c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com>
Date: Tue, 26 Aug 2025 15:59:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and hifi
 pll
To: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250822002203.1979235-1-da@libre.computer>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250822002203.1979235-1-da@libre.computer>
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TY0PR03MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9825ce01-1f7d-410c-de32-08dde4769755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzJ6cFBRN25rRkdxdmZ6aEY1N2hSSlhzMmQyRDhVaTkvRU1VeU5XVjFMS3hw?=
 =?utf-8?B?TFFOdGJ0L3FFczlHRktZMUFIbE9ZbDdPdFhiNGVwTGlHdnJCVXIwTXhyN3dY?=
 =?utf-8?B?SmE3bHR0S1poWmdkMG1KT3dGL0hIaDVEbW0xL1pUQVNpcVhlMXFvMUpmSTdK?=
 =?utf-8?B?YUwvcGNYdE9WWmVzNjBiM2hlWmNtTXRBMFRrNSs2WkVldG1FL2Q3bGRyN0JI?=
 =?utf-8?B?RnFjVXNaRThSU2tFVVk4SEhaajVOT2RRalJFb05sZ3UwdWtRWVVacXhmK1I2?=
 =?utf-8?B?dmNZU2VrTHg0QmdqbVZqalZoNnBMUDNUSFNUWGZRKzV1S2Nvc0liSVlENUxt?=
 =?utf-8?B?Z3ZSMzFtaWhObmo5UUlISktMQWpwTGNlYVV5UmZtcjhLcFJ3VmEyU2hsbHlV?=
 =?utf-8?B?d1dySlRqNDNNelMvcVRnRHJEblEwMEpIZHNLN1QwNGltc0Y4ZXR5cDQ5U1da?=
 =?utf-8?B?bXV4aG5vNjNjL21sbEdQbmZveGJtWEFqVHhaTU9BQllNT29QNUJmSmo4bDVj?=
 =?utf-8?B?NERSRGVkVFhYNXdBdTFscW82RnFWb3lxTHZKOXFVUnR3eWMzSHJSMkNSc3JK?=
 =?utf-8?B?R2U0Vi9MTDdPQytCTVNXMXM0bEtuN1FIVDVzOUJRd3BJb3NpKzg2T05oNUF2?=
 =?utf-8?B?dW01eVE0ek8vUmNSZTRHSFJicVRiVTMwYVV0TTcyb3FwbGNKSVlHbnhzVENj?=
 =?utf-8?B?RXFxR05hQUQrTnBuZjZSMXh6UERZaUwveHVpdDljVDF3K3dGK1FuOFBWSEJh?=
 =?utf-8?B?Z284ODdacW0zMSsyWjdzL3hWRFRsQU93Y3dIVk14VkVLYVlpNm1IYWE5N1Zu?=
 =?utf-8?B?eW1aMHMxQXJQdlVLSHFHMDBVcExJWGhBWG1sb1FUK3ZlRm56TGJTNksyTXlK?=
 =?utf-8?B?QUVKTmxCbUsyNm9ZYXlVL041RXNSbjdLdXlpclhHWk4vNjh0Z1l2Y2FMWUhT?=
 =?utf-8?B?ME9SMXJWeC8yWUozZENKN0xKUFZPVXJaQ2FWK0duVHBlcmc5dmRRT2hXZGpB?=
 =?utf-8?B?d3laN1hZLzlpVmFUNVRHZUVTcTZrbEJUbjBnZkRPQW13RUhlNW4rOVFYYnRX?=
 =?utf-8?B?VklibHRUNHpLd2xMYm5xVTZyU3NnRVhzM1kyeE5rczFPUnRFMVJCZnF1c2pB?=
 =?utf-8?B?c0FaenJLVUR4SGRzTkdvNEtEQUF5OU5xM3hVZFJIMFVkRkZ1TWhIOVMwcUxV?=
 =?utf-8?B?cDFtanZpQjk2OGZLemJ1bCttd2JvdEYxUEhVSFN5Zllyb29pRjZiWUZoUlUr?=
 =?utf-8?B?Ymg2TjVrSU1pS2RxcmEyQkI1MUF6K011OC9yWDJaM3VQYnFoTXJuaCs2L1Rl?=
 =?utf-8?B?QXpNK3VHZnhXclJlcmkyMjAva2lXM0J1Qjkyam05R1UxeWRTdGNUcXRobUh1?=
 =?utf-8?B?Y3RoTUhHdmQrNFFlRFFyRi81eE4xaTB5dXBDWTFuSmprVlVjTHdxZFpPSnZy?=
 =?utf-8?B?V3BLYTZHWXFsc0o5MGRVZVRudkt1RXZnQmxvTnlIRmh4a29LdDJNQW5jNEhV?=
 =?utf-8?B?OE94bjZUUElYZ0tJOUUwbU9hbGhxV1hwU0Fya3lLcW1QSkJDcTBPMEVDUElQ?=
 =?utf-8?B?azBMTlFLSE5kQXE4TVlFR0pzVGh6Vm83Rk9sbllaNGY3RTZaUHF3RWRTQUdX?=
 =?utf-8?B?M0VYRG5YWmI3UjNmcFNZcWIzT0N4dXdJK3NhUVFLdjBQSFl1cGl6QXVmRExY?=
 =?utf-8?B?V1BidVAyZDlOVmRpTVkzT3kyVjFHbG5HVlNSVDduTHlOR3BBdFppaVhnREFB?=
 =?utf-8?B?TzQ1QXF6RUQ4NnpJS2VxbVZqTU5ZSjlYTVhiWGswTHFRSXRZc291ZEh0WW9t?=
 =?utf-8?B?TUR3cjYwNDhsVzcwVlNHRk00cldwd2NqYkduZTBHOWg1eWVlRWl4VkFHTjhx?=
 =?utf-8?B?WDBtaEtLSS94Vlpwc2MzK0g0YU9iQ3BHdko3cHBRb0xaR2lGUVgrSkZPSVNZ?=
 =?utf-8?Q?i9T/3MJWbVY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXV2dk5uOUdDVEZlc2J0RzFWejhLOXY1SWJpUmx3UURxYlBleFpaWFZTV2Zh?=
 =?utf-8?B?NXJoSlNsZ29ZT2ZqQm1PdjE5SUdYN0ZoRzRLTEZZVWRvUHMramt2QzUrWStq?=
 =?utf-8?B?SWkyZTNIWVJONWtjVVVQeUIyNnlzOW9wU3dLME0zdWhaK2VmbzMwL2R1NlNi?=
 =?utf-8?B?MENmWmV2bTNnbjVHUllreDZrb0pPb2prbUhDMkd4OFV3ZDZZNDI0a2UvdkZa?=
 =?utf-8?B?YTNZa01OYjBmM2FGU3B5dlZJbk1JaUhGU2NkUFpKSDd2SXFVZVhDNVJvZENr?=
 =?utf-8?B?Y2tQV0p4VHpueXZLYzNDSnR5eWVIVGFKWkFDcUhSaVdrd201c1pGL0swTG5F?=
 =?utf-8?B?RHhuM0pVTFdXNCszMzhQZEpxdGNTd0tiekdrUk50RWVNTjc5ZUxKdXVHaHBt?=
 =?utf-8?B?amNmeG56aVAyTTlxM1crcWVLM3I2ekNzZTZ4UzU1R0FBay9OU1hEWUFXQm5R?=
 =?utf-8?B?MVRMblB6ak5HRzd4YUtRVG1JMU9JZ01vVlNTRm12ekVrVGZDMTdDNERpbkR1?=
 =?utf-8?B?WGxjTHMzdDdpemdHQWI1T2UwWTcrdno0RFRad2NYQkNHNjRFZ2Ywd0l4cWQw?=
 =?utf-8?B?YUROUndMMC9XdTdGdzBPN3NvbFB1dUd2eEx6YlJvMlRLNEV1c3hrVk4vSVRx?=
 =?utf-8?B?TFlFejFSVTd1Z1k1ZDIvcVpyMHJ0cTJzaGZvU1RYNjdTWGNCVko2UWhPWVls?=
 =?utf-8?B?WWtJcFVRbjNBSElZTkRMYjFUeGdZME1yeGMvc2tSMm40bnBlRXNOL0VFQ2JJ?=
 =?utf-8?B?dGhraEN1MDFqTlBzRHdUakF0QVpSZ3NJVFFUMXBmcFpqRkpISG5zbjNGNUV1?=
 =?utf-8?B?bWVnQXBQVEdLZWZGK0NJc1djMHNDQnV1L3lIV2JtRmVTVWRkUnd0VUNZeU9h?=
 =?utf-8?B?cndxMUxYMHJpc2hZdk5BVnY4dDJFT2xuQXRlNHBjblRJVlloOFY2MjNpR3k2?=
 =?utf-8?B?dWVYUzgvdVlvWk9TWTd6Z3JObXhoUFpjYktRcnJ3ZXkwSEw5dHZYRVNSWWxr?=
 =?utf-8?B?VUpIdWxrbkJnUXRJNnl5WHRhd2Q3c08vRFY2RExwUkdvSGxrTDRhdVJGeU1R?=
 =?utf-8?B?alZXQVJkN3RudzI4cjhCZm9LL1orRStHNVZKdldDekR5QXg3eGVGR0lpOHhk?=
 =?utf-8?B?a0h6c3ZqdnlwRnBjVE80MWJIS2Zoc1hveTlpbUJkU1FxTHFuZEhHS0Z0ZEZN?=
 =?utf-8?B?TzJYa0JUVGdCMG1sUmljeEoxeEl4amN5OGJOc2pweUFPc3N6cFdZbnhKbGU1?=
 =?utf-8?B?L096T2RGSk0wMWlJNXNXWjF5TUR4NFZxbEtEMUF2TnZIeC9FSjNWeE1Jb2JR?=
 =?utf-8?B?OHhjNUZQcGhUV1l4WlY2SVdRZzUyRlN2M3JkYU5HMjVMeVJaQkpudGhRckU1?=
 =?utf-8?B?SXA0eXZkaWpPQTM5Sk15ekV5aUUxQWthR2Rla1lQa1NFMzZpeU83Y3lVRXIx?=
 =?utf-8?B?QytZK21MZEFYZ1dQZC9JbFZ0dUZnbW9qNHhjN0RLckpaRXZJVkNHVmNPOXA3?=
 =?utf-8?B?V2dEbjAzQWU0cjg3eEt1a2tUVVArUDRaSDNrbDJyYkZNc05SSEU1c0RNZ3I3?=
 =?utf-8?B?UzNuUGIzZ1NwelNQSUVLUThYMlgwN0dNcDZTS3NhbXIyWGxkZWtwTG85U2R4?=
 =?utf-8?B?M2IraDJ0RHRWVGNzL1hpZUdtak9BZHB0MExTMmxpNnp4dWI1MXViaUlOdjBj?=
 =?utf-8?B?d2J0L2ZGMkNPMEVRV0hxcURPSDRsTGh1ZmU4Z2xKbFNhYllISHJyemFwcmNC?=
 =?utf-8?B?aVVCL0JxUHJvSTdoT1ByNEprVDViQlMxWVVsK3FLYmp5L21yQTRXQlhlRXBz?=
 =?utf-8?B?MWh1VHNpREF4ZmJHZ3hSVmluaEU1Vi9rTVFYV1owajQxNFRiQjZpaHgvcDhL?=
 =?utf-8?B?VCtmTkh2d0lPcGtkUW1GK2JWd2t3dDhuUjhmZFZIYWp3Ykt0eFBkc29RTk9T?=
 =?utf-8?B?bDNPTTI0bVdzOWJvcW1zOG5TbU96UENwZ1FiNHZ3Z2o5WWhlZ1VHYUpJK0la?=
 =?utf-8?B?bGFUTlM0TlhyVkZYb0hibmVOUFcxZVMrQVBYZHdoWlo0dGhBeGhPajNJU0Ez?=
 =?utf-8?B?YlBZM1hZekV1bXN0MGhFMWxNaFh5cW5yaGdIelRsN2NkM2hHWm5tUFJPS0Fh?=
 =?utf-8?Q?7bEsRV9eeUa27lJrWecLFQRF3?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9825ce01-1f7d-410c-de32-08dde4769755
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:00:15.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kr2+lHlaTsRLnTjucUkcbteNuC6fFEPvlyNN1WZfIjx/E7MgIcivbJxnZh2Xnyp2exR+XVW1ldh4POl/bEL/nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_010026_467990_1FCA319B 
X-CRM114-Status: GOOD (  18.37  )
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

SGkgRGE6CgogwqAgwqDCoFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay7CoGJ1dCB0aGlzIHBhdGNo
IGlzIHdyb25nLgoKCk9uIDgvMjIvMjAyNSA4OjIyIEFNLCBEYSBYdWUgd3JvdGU6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4KPiBUaGUgYml0IHJhbmdlIDE3OjAgZG9lcyBub3QgbWF0Y2ggdGhlIGRh
dGFzaGVldCBmb3IgQTMxMUQgLyBTOTA1RDMuCj4gQ2hhbmdlIHRoZSBiaXQgcmFuZ2UgdG8gMTg6
MCBmb3IgRklYIGFuZCBISUZJIFBMTHMgdG8gbWF0Y2ggZGF0YXNoZWV0LgoKClRoZSB1cHBlciAy
IGJpdHMgKGJpdDE4LCBiaXQxNykgb2YgdGhlIGZyYWMgd2VyZSBkZXByZWNhdGVkIGxvbmcgYWdv
LgpUaGUgYWN0dWFsIGVmZmVjdGl2ZSBiaXQgZmllbGQgZm9yIGZyYWMgaXMgYml0WzE2OjBdLiBI
b3dldmVyLCB0aGUKY29ycmVzcG9uZGluZyBkYXRhc2hlZXQgaGFzIG5vdCBiZWVuIHVwZGF0ZWQu
IEkgd2lsbCBwcm92aWRlIGZlZWRiYWNrCmFuZCB1cGRhdGUgdGhlIGRhdGFzaGVldCBhY2NvcmRp
bmdseS4KCgo+Cj4gVGhlIGZyYWMgZmllbGQgaXMgbWlzc2luZyBmb3Igc3lzIHBsbCBzbyBhZGQg
dGhhdCBhcyB3ZWxsLgoKClBMTHMgd2l0aCBmcmFjIHN1cHBvcnQgYXJlIHVzZWQgaW4gc2NlbmFy
aW9zIHJlcXVpcmluZyBhIHdpZGUgcmFuZ2UKb2Ygb3V0cHV0IGZyZXF1ZW5jaWVzIChlLmcuLCBh
dWRpby92aWRlbyBhcHBsaWNhdGlvbnMpLgoKU2luY2Ugc3lzX3BsbCBpcyBkZWRpY2F0ZWQgdG8g
Y2xvY2tpbmcgdGhlIENQVSBhbmQgZG9lcyBub3QgcmVxdWlyZQpzdWNoIGZyZXF1ZW5jeSB2ZXJz
YXRpbGl0eSwgaXQgZG9lcyBub3Qgc3VwcG9ydCBmcmFjdGlvbmFsIGZyZXF1ZW5jeQptdWx0aXBs
aWNhdGlvbi4KCgo+Cj4gUGF0Y2hlZDoKPgo+ICsgc3VkbyBjYXQgL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ZnJlcS9wb2xpY3kwL2NwdWluZm9fY3VyX2ZyZXEgXAo+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdWZyZXEvcG9saWN5Mi9jcHVpbmZvX2N1cl9mcmVxCj4gOTk2OTk5Cj4gNTAw
MDAwCj4gKyBzdWRvIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21lYXN1cmVf
c3VtbWFyeQo+ICsgZ3JlcCAtaSAnXChzeXNfXHxoaWZpX1x8Zml4ZWRfXClwbGwnCj4gICBoaWZp
X3BsbCAgICAgICAgICAgICAgICAgICAgICAwICAgICsvLTE1NjJIego+ICAgc3lzX3BsbF9kaXYx
NiAgICAgICAgICAgICAgICAgMCAgICArLy0xNTYySHoKPiAgIHN5c19wbGxfY3B1Yl9kaXYxNiAg
ICAgICAgICAgIDAgICAgKy8tMTU2Mkh6Cj4gKyBzdWRvIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9j
bGsvY2xrX3N1bW1hcnkKPiArIGdyZXAgLWkgJ1woc3lzX1x8aGlmaV9cfGZpeGVkX1wpcGxsJwo+
ICAgICAgaGlmaV9wbGxfZGNvICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAw
ICAgICAgICAwCj4gICAgICAgICBoaWZpX3BsbCAgICAgICAgICAgICAgICAgICAgICAwICAgICAg
IDAgICAgICAgIDAgICAgICAgIDAKPiAgICAgIHN5c19wbGxfZGNvICAgICAgICAgICAgICAgICAg
ICAgIDEgICAgICAgMSAgICAgICAgMCAgICAgICAgMzk5OTk5OTk4NQo+ICAgICAgICAgc3lzX3Bs
bCAgICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICA0OTk5OTk5
OTkKPiAgICAgICAgICAgIHN5c19wbGxfZGl2MTZfZW4gICAgICAgICAgIDAgICAgICAgMCAgICAg
ICAgMCAgICAgICAgNDk5OTk5OTk5Cj4gICAgICAgICAgICAgICBzeXNfcGxsX2RpdjE2ICAgICAg
ICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDMxMjQ5OTk5Cj4gICAgICBmaXhlZF9wbGxf
ZGNvICAgICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDEgICAgICAgIDM5ODc5OTk5
ODUKPiAgICAgICAgIGZpeGVkX3BsbCAgICAgICAgICAgICAgICAgICAgIDMgICAgICAgMyAgICAg
ICAgMSAgICAgICAgMTk5Mzk5OTk5Mwo+Cj4gVW5wYXRjaDoKPgo+ICsgc3VkbyBjYXQgL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3kwL2NwdWluZm9fY3VyX2ZyZXEgXAo+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdWZyZXEvcG9saWN5Mi9jcHVpbmZvX2N1cl9mcmVxCj4g
MTAwMDAwMAo+IDUwMDAwMAo+ICsgc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVzb24tY2xr
LW1zci9tZWFzdXJlX3N1bW1hcnkKPiArIGdyZXAgLWkgJ1woc3lzX1x8aGlmaV9cfGZpeGVkX1wp
cGxsJwo+ICAgaGlmaV9wbGwgICAgICAgICAgICAgICAgICAgICAgMCAgICArLy0xNTYySHoKPiAg
IHN5c19wbGxfZGl2MTYgICAgICAgICAgICAgICAgIDAgICAgKy8tMTU2Mkh6Cj4gICBzeXNfcGxs
X2NwdWJfZGl2MTYgICAgICAgICAgICAwICAgICsvLTE1NjJIego+ICsgc3VkbyBjYXQgL3N5cy9r
ZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5Cj4gKyBncmVwIC1pICdcKHN5c19cfGhpZmlfXHxm
aXhlZF9cKXBsbCcKPiAgICAgIGhpZmlfcGxsX2RjbyAgICAgICAgICAgICAgICAgICAgIDAgICAg
ICAgMCAgICAgICAgMCAgICAgICAgMAo+ICAgICAgICAgaGlmaV9wbGwgICAgICAgICAgICAgICAg
ICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICAwCj4gICAgICBzeXNfcGxsX2RjbyAgICAg
ICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDAgICAgICAgIDQ4MDAwMDAwMDAKPiAg
ICAgICAgIHN5c19wbGwgICAgICAgICAgICAgICAgICAgICAgIDAgICAgICAgMCAgICAgICAgMCAg
ICAgICAgMTIwMDAwMDAwMAo+ICAgICAgICAgICAgc3lzX3BsbF9kaXYxNl9lbiAgICAgICAgICAg
MCAgICAgICAwICAgICAgICAwICAgICAgICAxMjAwMDAwMDAwCj4gICAgICAgICAgICAgICBzeXNf
cGxsX2RpdjE2ICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDc1MDAwMDAwCj4g
ICAgICBmaXhlZF9wbGxfZGNvICAgICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDEg
ICAgICAgIDM5OTk5OTk5MzkKPiAgICAgICAgIGZpeGVkX3BsbCAgICAgICAgICAgICAgICAgICAg
IDMgICAgICAgMyAgICAgICAgMSAgICAgICAgMTk5OTk5OTk3MAo+Cj4gRml4ZXM6IDA4NWE0ZWE5
M2Q1NCAoImNsazogbWVzb246IGcxMmE6IGFkZCBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIi
KQo+IFNpZ25lZC1vZmYtYnk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gLS0tCj4gICBk
cml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMgfCA5ICsrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZXNvbi9nMTJhLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiBpbmRleCA2NmYw
ZTgxN2U0MTYuLmY3OGNjYTYxOWNhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9n
MTJhLmMKPiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiBAQCAtMTU3LDcgKzE1Nyw3
IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBnMTJhX2ZpeGVkX3BsbF9kY28gPSB7Cj4gICAg
ICAgICAgICAgICAgICAuZnJhYyA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgLnJlZ19v
ZmYgPSBISElfRklYX1BMTF9DTlRMMSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgLnNoaWZ0
ICAgPSAwLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIC53aWR0aCAgID0gMTcsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLndpZHRoICAgPSAxOSwKPiAgICAgICAgICAgICAgICAgIH0sCj4g
ICAgICAgICAgICAgICAgICAubCA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgLnJlZ19v
ZmYgPSBISElfRklYX1BMTF9DTlRMMCwKPiBAQCAtMjIzLDYgKzIyMywxMSBAQCBzdGF0aWMgc3Ry
dWN0IGNsa19yZWdtYXAgZzEyYV9zeXNfcGxsX2RjbyA9IHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgLnNoaWZ0ICAgPSAxMCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgLndpZHRoICAg
PSA1LAo+ICAgICAgICAgICAgICAgICAgfSwKPiArICAgICAgICAgICAgICAgLmZyYWMgPSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgLnJlZ19vZmYgPSBISElfU1lTX1BMTF9DTlRMMSwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAuc2hpZnQgICA9IDAsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgLndpZHRoICAgPSAxOSwKPiArICAgICAgICAgICAgICAgfSwKPiAgICAgICAgICAgICAg
ICAgIC5sID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAucmVnX29mZiA9IEhISV9TWVNf
UExMX0NOVEwwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAuc2hpZnQgICA9IDMxLAo+IEBA
IC0xOTAxLDcgKzE5MDYsNyBAQCBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgZzEyYV9oaWZpX3Bs
bF9kY28gPSB7Cj4gICAgICAgICAgICAgICAgICAuZnJhYyA9IHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgLnJlZ19vZmYgPSBISElfSElGSV9QTExfQ05UTDEsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIC5zaGlmdCAgID0gMCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAud2lkdGgg
ICA9IDE3LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIC53aWR0aCAgID0gMTksCj4gICAgICAg
ICAgICAgICAgICB9LAo+ICAgICAgICAgICAgICAgICAgLmwgPSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX0hJRklfUExMX0NOVEwwLAo+IC0tCj4gMi40Ny4yCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
