Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BACCCD183
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Oct 2025 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaA/zHzpRi4P3xrfgIUqp/BubVmid02WCXPpxnigTBI=; b=Xy00QudrgvbjAh1N4fOc5E6nab
	FALdaJlHlWPBiG0gMUM9coAtZ/CygtDgQSmVrSbih1eACdsfeJ0KOiEy7FZT+0k6W8KWeO/YsVj50
	vndkuIkee9GwtrHKG01ZjQNSIVAYVoHppgeVbkKCCjYaQepjuE2uhkQvGISrRqa94qZGRjbTryLRk
	qjbcKaYA6+xer/C5g3n60gjAPB62hnxoA7pVE6Zft9cZ5j2cYuh1wAELvdfBJ/mXtuMbEpRwrmjyT
	an0dumAcxWTsyEMtSf5yWcg0OiQB0y69feNy+SBBV5qhk3V+XYSo4lgQTC8SOBJDY13fWYu4SmYxC
	hx9PlQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v732t-00000007W4y-1Ko7;
	Fri, 10 Oct 2025 02:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v732r-00000007W4e-18IB;
	Fri, 10 Oct 2025 02:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1P+Va6KDpowuP75a818coenC9VJlD1jPPqL3LJ6l2Eg=; b=WOB1XxK1NvMNpUc0FGgejxWa0k
	zcoNsaO2OQdOZU7zcKkDmP3KikeCFlltaksPGrb6P97lMggHmogrGvfqPRlXrZiKt57ksBJrLxfH/
	SGH6Mca7+gp9ojZBKP8hXoAhpsVMrfIblxQeqNXjlEvyTYr2pM/ZrKEhBjyM5uwDVps0HAg1Z+Bbe
	D0ghWUVuefU24vsTIScB9gE5HFwH9eXrml5Fg7ylsNaJzaLZtOCcC2Ku52JxiikelWdY9bkKwCeQ8
	4FVr9Ea1Lad6XpBPw660GN1lg2Ff1DH74Eg3G6KZrqDt28bLoQ0H5hcQPbSDrKzp98A/VBewBEbqH
	OZFHpkRw==;
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v732j-00000001rEz-133y;
	Fri, 10 Oct 2025 02:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAuPI9WOxhpfl++B5Wr9f2vCMtiCsNXbv+Q1ch+iE/RbpzyiVzb+UroXsqdIvtFA2DpxZWfJmUK8RcCol4Zf4bzUYydEYL1pozlTVwlpqlIrgkNyYm6udpeXHkv2zOBHGCtgOV/VAPVj1QIsSDQP93sNX2J4HutsnEsWHWKVAPejS6jZnKkDf+rsSWjzG4IdYOUGtcg0Y0v6VR1TaXqiVdTCx/4+GeKiORek5jbre2oyZx2jrqvc3z5cWb+DcrA5DCRA8cl/8wJ/rcqFWqqLByxDUH7BE/57lRUgLlBn57lzLU3RibKU9VRiO3yrmvoKaPD2SBmqEBeZsS/0YikdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1P+Va6KDpowuP75a818coenC9VJlD1jPPqL3LJ6l2Eg=;
 b=QKtP9WilaZtDXHY3UQ2fS39E5qynyhhrGJGjWTX0Uln9KRrXfG+yHd/M/gHCzkGuL99Y9sRuzZDq0gY+SvHMdV13dmVYpbSY3g4Er5ZV3PbjGpAu0vxKHud57Yx3bTb8rSzzZams9fkOy4g99NiMr87EP2KGUfsZDNVVYiO6XTzyn/XqDGYTB2TiNj5G77cmc8/AoP8c51vq5vh7ser2P+YtTEVYhsOt5RhP5VqBxcs5AXVgSdRgSVsLUs89Xra8Jr8EWIReIUSn9PE88wy4g7bSZR7qEzgyGaGmxKQ4RlhE/9HRUiDEuiqM64l0zXd/rC3XVF3Kc7Xzbgrh9H7Lcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1P+Va6KDpowuP75a818coenC9VJlD1jPPqL3LJ6l2Eg=;
 b=TpvDpJ4FTouUYx4XzwkiP8GW94BPpgz9/RxXTUVoiZuqW30qIg56NIUOpAVc5ymfDzXp66hX/4Hnv9s9mzTz0oioBQOfsIilodtmdJHp26VRMZzeKRo1+WCTM6PpvgrLa+WX4SciDxULtd7CVWHf/ojmEtp09p5ueL3n+Kaay0XU76QDWKFiWe1pK7SMEY1aNTZZN/ckI2RbK6n8FHl+31KZJUEbtHtmZzEVzTy4CLPxA/NXClp22l3nSaZ0FHFi/Ap9y1Gvt+JvLjEXZUqjcEXelnJQR5YGOpaK6uxTfAdK4teAqq7zXXNwa8pXqZonwruQvWwyMCILPYJDhZJ2IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by PUZPR03MB7042.apcprd03.prod.outlook.com (2603:1096:301:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 02:39:16 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 02:39:16 +0000
Message-ID: <7a5d3f57-4c0e-483c-9d6f-9556583180a7@amlogic.com>
Date: Fri, 10 Oct 2025 10:38:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for A4
 and A5 SoCs
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
 <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
 <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TY1PR01CA0202.jpnprd01.prod.outlook.com (2603:1096:403::32)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|PUZPR03MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ae8034-bfdc-4cd5-c617-08de07a6349d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z09CZHFXbGU1M2ZJSFB5ZjhzVEFCK2JyVXpxRWVUTjNURzhhamMyRVpJVFRa?=
 =?utf-8?B?OWZScXcyb0JuSEkvU2NNRVV6Uy90WFVkYjBnc3Z0d0JBRHhkdzBCTTJuR0Ev?=
 =?utf-8?B?ZjNZb2gvaWhlYStoTXY1cjRYTE10Y1F2UXNsTlREejUyVkM4ckVhalZlNjJP?=
 =?utf-8?B?TkFKZHRhUGRQUlBTSFdid1gwaUZNa0YxUllXc1c4NXl5ZmVWbUZzeFcyU2h6?=
 =?utf-8?B?UURpZzhvM0tobGFIcExvcCtxcFBXZ0s1ZldJV2I0QnY0QWpJWGxXTHU3SFRM?=
 =?utf-8?B?dWVKcngyQjFLaDVZRTZMZE40dnQvYm5EMnZqL3VjRWdUdndmSUpBWUg5VmRi?=
 =?utf-8?B?Vzk3aWVKQWpmZk8rbFdFNDRoOHJwdWR0UUp3eGx5NzRadjVTUmxnWFVReXp5?=
 =?utf-8?B?VHcxSVplaE9sR2V3T3UvQ0ZURFI1YmRTb2pHbkpTVmZmU1gwTnR1UzNNbU5F?=
 =?utf-8?B?OC92Nkx6NmdOSVNvQUx3R2pkdW9TUGNzcHlJemM4WGNMelRIQ1VqaERZRGpJ?=
 =?utf-8?B?VkRUc25MbzJZZnBDUnhrUW9ZeXFJdVJmdGI4azBPUG1mM25GUUVjMnNyZm9p?=
 =?utf-8?B?RDF0RXBZRU5EaWNoQXREdzNoek5Td3E3VFozZlRuZmdBbXZaTmZrL3htbWI0?=
 =?utf-8?B?RHR2bGxFNjU0eEhSM3h0RGdhUW43bHhiMXhNV01IY1NuaUE5a09vNnBOY2Jm?=
 =?utf-8?B?RlVjckxpWFRobmZwNXJjRFZxVWNteDY3U1FEaTJKMnVTeEJZK1dYai90YlEw?=
 =?utf-8?B?bGorSzZMMkVxWGtWVmxoT0lZZUwxZlhEUmVKOVNkbFBCdjNTNHFnRmhvOWwz?=
 =?utf-8?B?MFRENTJ5UnFTQnFybFROWjNTYklmM2FXdXp2Lzk3RDErK3pyT0ZxVDdtU1BH?=
 =?utf-8?B?R0ZrczQxOFFsbFJoS3RmWTUzOSs1VmJ2K0ZKdGRQVEhpNHZXdGR0R1FuVUZo?=
 =?utf-8?B?NFk3eXlkS1JGQytQT0tEdFJsMnI4bzhuS0gxNEdnSSt3WW00a3B2YjRsMFl1?=
 =?utf-8?B?Q0JnMC8vc3FFUWFtTVdMQjBZbzlNeWdoczdLUzRab3h3YkRJUWQ5bUtKckk5?=
 =?utf-8?B?RndJWjRMdHZtMjBjMlpUdk5oc2V4dzhnWjZZOWFYbWhCbmd2dy82TGl1Skp5?=
 =?utf-8?B?V2lWNEk3V2c5UnJyRjBmY0dLSWI2bjVoVElHbmRyVWRLQlpBSGVZZ0h2NVIx?=
 =?utf-8?B?V29EUnVGL3M5SUpSMGgyRi9FVUNnSklzYmhpc3pYOVBodGgzMktVWXpmT0ZD?=
 =?utf-8?B?NERYQyt5aUl5a3hQaTF2clU4TW1UMTlKZjh6T2VKQ1BpL0VFYUp4TXdENFlK?=
 =?utf-8?B?NU1vbTNlZFF4NFg5YjRtU1BmejhwWW80VjBLNXNXOXZwWWNGVlNmcThCWnh4?=
 =?utf-8?B?bFMrOVJKNTYrdDdkQlR5WVd1TldPSDgxOG0weG1iZmhuMkVQWXprMVNsbmVp?=
 =?utf-8?B?S3B3R1ROMCtSeXRFUUFHQ2NaZU1nNzd1SWxtWEJadG1jMWlwckN2NVhQZFJQ?=
 =?utf-8?B?aEpQaFVKNllVTzI1amxRcTU1YWtpQzB1aGdpa2lRWE42MEhIczhaSmRoVDJE?=
 =?utf-8?B?UVp5V3VnRVo3c1VMNXdGU0dKeGRtNzFEb0cyL2RHSExmUStzamxKZE1Yc1lu?=
 =?utf-8?B?dUVMQ0dMVDJCYUgvQU9La2hYK3ZUSUdIUHlOdGJmUHAxSnRsT0JycHUvU2NL?=
 =?utf-8?B?cU1zd3pmVUlHNWVTYytzOXFlQnViVzN4bW9pa01KNml4cWJsNy9iRDJGSWp5?=
 =?utf-8?B?SUpCTVpPTUkxTXg3VVBxWDgyTTV0VkY1ZlYraCtCTFYyVmJGeFBkeFRJb2ov?=
 =?utf-8?B?ZmYxNkhmOW5EWFR2aGdUWGhGalk3WmlaeE0xc2FMZHlueGNqdlJKeWg1R2Mz?=
 =?utf-8?B?RkVyVklUQjdySEl3NDMvZ3Nzb1E3Q0lBOE5Ua2xXZXlnS2lnaGdkVjZCaDNE?=
 =?utf-8?Q?xeAVyCmlOjjb7MPH0IHCARPiLBtinfIz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWswRzhQLzJsM3BUc3BlWnJJRk5kbG5JWEszdi9kSjRwdDBKNy95Q1Q1R3lP?=
 =?utf-8?B?M3N6OGhiQXFGSmJQOTNiR3lqL3gzOS83bXpTTFNoV3YrVnBscEhGbzBPOUxR?=
 =?utf-8?B?UHN3YzhEWXh1WlpNQkVGNHhyY0l1bEJKK1RvMXowNExOckZrbUI5U2xGaFlm?=
 =?utf-8?B?WlJtaHl2a1dWK0NIWjYxSjlBK2ZQVnNXZnNIMCt2U0xic0tRRU8rVWtRc2E1?=
 =?utf-8?B?QVpvMUk3akxTTTQ2RmFBSmZ3TTNKOUVjZkxIRlBac24rcXc5dytrL051dDFO?=
 =?utf-8?B?UnhKY3gwakxRY21kMGdqSUprQXNQZjBlem1IVEh3ZUtSdGlhZ1VoOFIyVlBW?=
 =?utf-8?B?ajBKd0FRUm43L3pWdEhnSFBMZnVsZ1ZXU1NtKzVmVkdWRDc1NFNTVmxFc3dY?=
 =?utf-8?B?RTNmdzVOcTdJSFdncDBDS2RhYS9lcGdvM2lFL3V2MytuNDJnQ20wMmFLYTYx?=
 =?utf-8?B?VDZpQ3BzSlVDMG5yeTQwUEI5Q1F6TEFjQkVkVm9zNCtpNmtFUitvSzBCZzRB?=
 =?utf-8?B?cXpxS1JoZ0NLUEkzOWVtbzlLalptUE5JcU1iTEI2eEo2eVFSVE8xSDNKS21p?=
 =?utf-8?B?cm5wRVZxTmhHWDhGbEZ4cE9BU0MvZjFoRWZSbEFBRVlvVFVnaFdFaEk3SEdZ?=
 =?utf-8?B?bkRBRkNRQmJlZjZjcWhjKzN1Tkt5aEE3Z1hPVEM2V3FNV0JWeG02QjV0TTNa?=
 =?utf-8?B?UDdzYUl3WnRUN0tFZzhxNmlZelQ5RW1HbDFtRjZOOVRwb2xUcWhVRDI2N1pk?=
 =?utf-8?B?bHBIeDc2ZjdkTVBHQmhDWUZid0N3cWlEazNWSzJqdDJMWldCYlNOUkQ3ZnR4?=
 =?utf-8?B?VjZQbUROMDgxejdsTEdBTlZvSTIrQXRTN2lSZmgwTGh2SmgxdUQvdE92bEZK?=
 =?utf-8?B?WWxmMXlvN3NyZ3Z3S01ySHY2S2djdlVZZy9BMU9NWVhQZ0VqelNaV3orc3Fo?=
 =?utf-8?B?Vjk3ck82SW1sYnpIUkhyaHR3THFXNDZhRWxFRU00ckw4bk1CUDQwb20zcDFo?=
 =?utf-8?B?b0hLTEtBenZEZWdWcm5iM3hrbE1iK3RaZk5MOVE5eTlTKzd2K2YrSDhTSlRH?=
 =?utf-8?B?YUZFbGZidERQTm5lQ0REWEVyQTkwOUV3VmpHd1JzZ25SUjBxb1NVSUJoS1ls?=
 =?utf-8?B?OVBFY0xBZ2k5R0JUbllWOVZDcFBCa1YySm1iMjdTNldjaC9rVytyWi9LR3l6?=
 =?utf-8?B?Sjh3YVNoRWpudm9YLzRObU01dnFSS3lNTFJOYkRISi8xNHVaRDBHSTNnVVVK?=
 =?utf-8?B?TlFhVTRiQWI0dStOZ0tlM0NIS2czenFEcmRLVHM0U2FRSmZ4dXl4S2lFN0t1?=
 =?utf-8?B?QVJJWWd2S00wMFNBVDdjdS9TRkh0T05zaTFlbEZtOEVYZFBGWHVZRDlEQkZX?=
 =?utf-8?B?aUhvSmg4SWVxcE9kWlVpQTlBZ3k2bW9hZlp5TURVc3I4dkErNHBlTk1XR1Vk?=
 =?utf-8?B?WTloTzNVSDBMNTZqVEMwVnlrYkNyQ211YkRQRkFJbHF0U05rOFIwUXVnRHhX?=
 =?utf-8?B?L0Noek5RUCtFVEFkZHNvMXorbkRLL25GNHlWNVFxaDFCZVQ2ZDBUOWpRRW05?=
 =?utf-8?B?YnNLdExnUjBiUGJGcno1ZTBnb2dHUEhPdW0za1NzU3p3ZWxGTHliaVpLSG9i?=
 =?utf-8?B?TlorQ2hiQ1B6ZGtpdEFKeWMzMjhib1c0SldydEJEVnpZYzJCeXd5d1FIblVQ?=
 =?utf-8?B?RkVMV20yOENFaXdwYXAxWnB2YWlKNkw0MzBZQk44b1Q4cGhCVW85TXBFU3Ra?=
 =?utf-8?B?d1dSVzlzeHdkT1pjb2dmakYydUY2UThsYVBNZkY5cW96NXhkUWVCREE4WHpU?=
 =?utf-8?B?eDBZRlhSOWRQaXZZQXJoRjkzNFh4a21kYmxMYk1nZVVoajhvdGlLOTJjaWhU?=
 =?utf-8?B?VTh5YlhxWU9TRldKTVVRcUJyR2VoL1NXVHNtN2hyT09EREN5Y2ljNFVrUUxu?=
 =?utf-8?B?VTkvdEhXbUJsWXREQXNWRDhoMFNDRW90bUJlemhKYmdjQjJGSFAvQzNNc0dh?=
 =?utf-8?B?SG96bXZqUklxcmdpNkY4WVNXTExBd2JxakZENlZJc2JEaGRGdVM4OGowamFo?=
 =?utf-8?B?ajhoTHMvVWc0cUs4SG9FNHF5K2FiQThjbW16bkhQNjF6aHMwS0NvTnhUUm1s?=
 =?utf-8?Q?cmc9U1LtQSuQ72qB0gNjhjtbq?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ae8034-bfdc-4cd5-c617-08de07a6349d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 02:39:16.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ttbuckeRGM7QOliq4SUCY+JrhOHgSyOsz8qKmfXcjCE8ziN/8pdOkQ0YN4eCWR/+ptKNpdaGZh0Qn+AxytHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_033942_907961_BCA727AC 
X-CRM114-Status: GOOD (  27.53  )
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

SGkgSmVyb21lLAoKCk9uIDEwLzkvMjAyNSAzOjU5IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24gVGh1IDA5IE9jdCAyMDI1IGF0IDExOjA5LCBDaHVh
biBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4gSGkgSmVyb21lLAo+Pgo+
PiAgICAgIFRoYW5rcyBmb3IgeW91ciByZXZpZXcsIGJlY2F1c2UgdGhlIG5hdGlvbmFsIGRheSBo
b2xpZGF5cyBkaWQgbm90Cj4+IHRpbWVseSBmZWVkYmFjay4KPj4KPj4KPj4gT24gMTAvMS8yMDI1
IDM6NDUgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+
Cj4+PiBPbiBUdWUgMzAgU2VwIDIwMjUgYXQgMTc6MzcsIENodWFuIExpdSB2aWEgQjQgUmVsYXkK
Pj4+IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPj4+
Cj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMgY2hhbmdlcyByZWxhdGVkIHRvIHRoZSBQ
TEwgYW5kIHBlcmlwaGVyYWwKPj4+PiBjbG9ja3MgZm9yIGJvdGggdGhlIEE0IGFuZCBBNSBTb0Nz
Lgo+Pj4+Cj4+Pj4gVGhlIHBhdGNoZXMgZm9yIEE1IHdlcmUgcHJldmlvdXNseSBzdWJtaXR0ZWQg
dXAgdG8gVjMgYnkgWGlhbndlaS4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTAxMDMtYTUtY2xrLXYzLTAtYTIwN2NlODNiOWU5QGFtbG9naWMuY29tLwo+Pj4+IEFmdGVyIGZy
aWVuZGx5IGNvb3JkaW5hdGlvbiwgSeKAmXZlIHRha2VuIG92ZXIgYW5kIGNvbnRpbnVlZCB0aGUK
Pj4+PiBzdWJtaXNzaW9uIGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMuIFRoZSBkdC1iaW5kaW5ncyBw
YXRjaCByZXRhaW5zIFJvYidzCj4+Pj4gb3JpZ2luYWwgIlJldmlld2VkLWJ5IiB0YWcsIGFuZCBJ
IGhvcGUgdGhpcyBoYXNu4oCZdCBjYXVzZWQgYW55Cj4+Pj4gYWRkaXRpb25hbCBjb25mdXNpb24u
Cj4+PiAuLi4gYW5kIHlldCB5b3UgcmVzdGFydCB0aGUgdmVyc2lvbmluZyBvZiB0aGUgc2VyaWVz
IG1ha2luZyBpdCBoYXJkZXIKPj4+IGZvciBwZW9wbGUgdG8gZm9sbG93IHRoYXQKPj4KPj4gU29y
cnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlIGNhdXNlZC4gVGhlIG1haW4gY2hhbmdlcyBjb21wYXJl
ZCB0byB0aGUKPj4gcHJldmlvdXMgdmVyc2lvbiBieSBYaWFud2VpIGFyZSBpbiB0aGUgZHJpdmVy
IHBhcnQuCj4+Cj4+IFRoZSBkdC1iaW5kaW5ncyBwYXJ0IG9ubHkgaGFzIG1pbm9yIG1vZGlmaWNh
dGlvbnMgaW4gW1BBVENIIDE0LzE5XS4KPj4KPj4gVGhlIGRyaXZlciBwYXJ0IGhhcyByZWxhdGl2
ZWx5IGxhcmdlciBjaGFuZ2VzIGJlY2F1c2UgaXQgbmVlZHMgdG8gYmUKPj4gYmFzZWQgb24gdGhl
IGNvZGUgYmFzZSB5b3UgcHJldmlvdXNseSBzdWJtaXR0ZWQuCj4gSSdtIG5vdCBzZWVpbmcgYSBq
dXN0aWZpY2F0aW9uIGZvciB0aGUgbWVzcyBpbnRyb2R1Y2VkIGFuZCBJJ20gbm90Cj4gbG9va2lu
ZyBmb3Igb25lIHRvIGJlIGhvbmVzdAoKClByZXZpb3VzbHksIEkgcHJvdmlkZWQgYSBiYXNpYyB2
ZXJzaW9uIG9mIHRoZSBBNSBjbG9jayBkcml2ZXIgdG8KWGlhbndlaSwgYW5kIGhlIGhlbHBlZCBp
bXByb3ZlIGl0IGJlZm9yZSBzdWJtaXR0aW5nIGl0LgoKWGlhbndlaSBoYXMgYmVlbiByZXNwb25z
aWJsZSBmb3IgdXBzdHJlYW1pbmcgbWFueSBvZiBvdXIgbW9kdWxlcy4KU2luY2UgY2xvY2sgZHJp
dmVycyByZXF1aXJlIHNpZ25pZmljYW50IGVmZm9ydCwgSeKAmW0gc2hhcmluZyB0aGUKd29ya2xv
YWQgYnkgc3VibWl0dGluZyBzb21lIG9mIHRoZSBjbG9jay1yZWxhdGVkIHBhdGNoZXMuCgpUaGUg
dGhyZWUgdmVyc2lvbnMgcHJldmlvdXNseSBzdWJtaXR0ZWQgYnkgWGlhbndlaSBtYWlubHkgZm9j
dXNlZCBvbgppbXByb3ZpbmcgdGhlIGR0LWJpbmRpbmdzIGJhc2VkIG9uIFJvYuKAmXMgZmVlZGJh
Y2suIFRoZSBkcml2ZXIgcGFydApyZW1haW5lZCB1bmNoYW5nZWQuCgpUaGUgZHJpdmVyIHBhcnQg
aW4gbXkgY3VycmVudCBwYXRjaCBzZXJpZXMgaGFzIHVuZGVyZ29uZSByZWxhdGl2ZWx5Cmxhcmdl
IG1vZGlmaWNhdGlvbnMgdG8gYWRhcHQgdG8gdGhlIGxhdGVzdCBjb2RlIGJhc2UsIHNvIGNvbXBh
cmluZyBpdAp0byB0aGUgcHJldmlvdXMgdmVyc2lvbnMgbWF5IG5vdCBiZSB2ZXJ5IG1lYW5pbmdm
dWwuCgpJZiBpdCdzIG1vcmUgYXBwcm9wcmlhdGUgZm9yIHRoZSBBNSBjbG9jay1yZWxhdGVkIHBh
dGNoZXMgdG8gY29udGludWUKZXZvbHZpbmcgYmFzZWQgb24gWGlhbndlaSdzIGVhcmxpZXIgdjMg
c2VyaWVzLCBwbGVhc2UgZmVlbCBmcmVlIHRvCnBvaW50IGl0IG91dC4gSSB3aWxsIGNvbnRpbnVl
IHRvIGFzc2lzdCBYaWFud2VpIGluIGNvbXBsZXRpbmcgdGhlCnN1Ym1pc3Npb24gb2YgdGhlIHJl
bWFpbmluZyBBNSBjbG9jayBwYXRjaGVzLgoKCj4+Pj4gQm90aCBBNCBhbmQgQTUgYmVsb25nIHRv
IHRoZSBBdWRpbyBzZXJpZXMuIEp1ZGdpbmcgYnkgdGhlaXIgbmFtZXMsIG9uZQo+Pj4+IG1pZ2h0
IGFzc3VtZSB0aGF0IEE1IGlzIGFuIHVwZ3JhZGUgdG8gQTQsIGJ1dCBpbiBmYWN0LCBBNSB3YXMg
cmVsZWFzZWQKPj4+PiBhIHllYXIgZWFybGllciB0aGFuIEE0Lgo+Pj4+Cj4+Pj4gU2luY2UgdGhl
cmUgYXJlIGRpZmZlcmVuY2VzIGluIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2NrcyBiZXR3
ZWVuCj4+Pj4gdGhlIEE0IGFuZCBBNSBTb0NzIChlc3BlY2lhbGx5IHRoZSBQTEwpLCBhbmQgdGFr
aW5nIGludG8gYWNjb3VudCBmYWN0b3JzCj4+Pj4gc3VjaCBhcyBtZW1vcnkgZm9vdHByaW50IGFu
ZCBtYWludGFpbmFiaWxpdHksIHRoaXMgc2VyaWVzIGRvZXMgbm90Cj4+Pj4gYXR0ZW1wdCB0byBt
ZXJnZSB0aGUgdHdvIGludG8gYSBzaGFyZWQgZHJpdmVyIGFzIHdhcyBkb25lIGZvcgo+Pj4+IEcx
MkEvRzEyQi9TTTEuCj4+PiAuLi4gYW5kIHdlIGVuZCB1cCB3aXRoIDE5IHBhdGNoZXMgc2VyaWVz
IHdoaWxlIGl0IGNvdWxkIGJlIHNwbGl0dGVkIGludG8KPj4+IG1hbmFnZWFibGUgc2VyaWVzLCBm
b3IgZWFjaCBjb250cm9sbGVyIG9mIGVhY2ggU29DCj4+Cj4+IEknbSBub3Qgc3VyZSBpZiBJIHVu
ZGVyc3Rvb2QgeW91IGNvcnJlY3RseS4KPj4KPj4gRG8geW91IG1lYW4gdGhhdCBJIHNob3VsZCBz
cGxpdCB0aGlzIHNlcmllcyBvZiAxOSBwYXRjaGVzIGludG8gbXVsdGlwbGUKPj4gcGF0Y2ggc2Vy
aWVzIGFuZCBzZW5kIHRoZW0gc2VwYXJhdGVseT8gRm9yIGV4YW1wbGU6Cj4+IHNlcmllIDE6IEE0
IFNDTUkgY2xvY2sgY29udHJvbGxlciAoZHQtYmluZGluZ3MpCj4+IHNlcmllIDI6IEE0IFBMTCBj
bG9jayBjb250cm9sbGVyIChkdC1iaW5kaW5ncywgZHJpdmVyLCBkdHMpCj4+IHNlcmllIDM6IEE0
IHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgKGR0LWJpbmRpbmdzLCBkcml2ZXIsIGR0cykK
Pj4gLi4uIEE1IHNpbWlsYXJseT8KPiBUaGluZ3MgdGhhdCBkbyBub3QgYWN0dWFsbHkgZGVwZW5k
cyBvbiBlYWNoIG90aGVyIG9yIHdoaWNoIGFyZSBub3QKPiBtZXJnZWQgdGhyb3VnaCB0aGUgc2Ft
ZSB0cmVlIHNob3VsZCBub3QgYmUgc2VudCB0b2dldGhlci4gVGhlcmUgaXMKPiBub3RoaW5nIG5l
dyBoZXJlLiBTYW1lIGJhc2ljIHJlbWluZGVycyBvbiBlYWNoIHN1Ym1pc3Npb24uCgoKU29ycnks
IGJ1dCBJJ20gc3RpbGwgbm90IHF1aXRlIHN1cmUgaWYgSSB1bmRlcnN0b29kIHlvdSBjb3JyZWN0
bHkuCgpUaGlzIHNlcmllcyBvZiAxOSBwYXRjaGVzIG1haW5seSBmYWxscyBpbnRvIHRocmVlIG1h
am9yIGNhdGVnb3JpZXM6CiogT3B0aW1pemUgUExMIGRyaXZlcgoqIFBMTHMgYW5kIHBlcmlwaGVy
YWxzIGZvciBBNAoqIFBMTHMgYW5kIHBlcmlwaGVyYWxzIGZvciBBNQoKQXJlIHlvdSBzdWdnZXN0
aW5nIHRoYXQgdGhlIFBMTCBkcml2ZXIgcGFydCBzaG91bGQgYmUgc2VudCBhcyBhCnNlcGFyYXRl
IHBhdGNoIHNlcmllcywgd2hpbGUgdGhlIEE0IGFuZCBBNSBwYXJ0cyBzaG91bGQgc3RpbGwgZm9s
bG93CnRoZSBwcmV2aW91cyBBNS9DMy1zdHlsZSBzdWJtaXNzaW9uPwoKCj4+Cj4+Pj4gVGhpcyBw
YXRjaCBzZXJpZXMgaW5jbHVkZXMgYWxsIHJlbGF0ZWQgZHQtYmluZGluZ3MsIGRyaXZlciwgYW5k
IGR0cwo+Pj4+IGNoYW5nZXMgZm9yIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2Nrcy4gRm9s
bG93aW5nIG91ciBwYXN0IGNvbnZlbnRpb24KPj4+PiBmb3IgY2xvY2stcmVsYXRlZCBzdWJtaXNz
aW9ucywgdGhlIGR0cyBjaGFuZ2VzIGFyZSBwbGFjZWQgYXQgdGhlIGVuZAo+Pj4+IGFuZCBzdWJt
aXR0ZWQgc2VwYXJhdGVseS4gSWYgdGhpcyBvcmRlcmluZyBtYWtlcyBpdCBoYXJkZXIgZm9yCj4+
Pj4gbWFpbnRhaW5lcnMgdG8gcmV2aWV3IG9yIHBpY2sgcGF0Y2hlcywgcGxlYXNlIGZlZWwgZnJl
ZSB0byBwb2ludCBpdCBvdXQuCj4+Pj4KPj4+PiBDby1kZXZlbG9wZWQtYnk6IFhpYW53ZWkgWmhh
byA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkg
WmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENodWFu
IExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+IENodWFuIExpdSAoMTkp
Ogo+Pj4+ICAgICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBBNCBTQ01JIGNs
b2NrIGNvbnRyb2xsZXIKPj4+PiAgICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9n
aWMgQTQgUExMIGNsb2NrIGNvbnRyb2xsZXIKPj4+PiAgICAgICAgIGR0LWJpbmRpbmdzOiBjbG9j
azogQWRkIEFtbG9naWMgQTQgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgo+Pj4+ICAgICAg
ICAgY2xrOiBhbWxvZ2ljOiBPcHRpbWl6ZSBQTEwgZW5hYmxlIHRpbWluZwo+Pj4+ICAgICAgICAg
Y2xrOiBhbWxvZ2ljOiBDb3JyZWN0IGxfZGV0ZWN0IGJpdCBjb250cm9sCj4+Pj4gICAgICAgICBj
bGs6IGFtbG9naWM6IEZpeCBvdXQtb2YtcmFuZ2UgUExMIGZyZXF1ZW5jeSBzZXR0aW5nCj4+Pj4g
ICAgICAgICBjbGs6IGFtbG9naWM6IEFkZCBBNCBQTEwgY2xvY2sgY29udHJvbGxlciBkcml2ZXIK
Pj4+PiAgICAgICAgIGNsazogYW1sb2dpYzogQWRkIEE0IGNsb2NrIHBlcmlwaGVyYWxzIGNvbnRy
b2xsZXIgZHJpdmVyCj4+Pj4gICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNDogQWRkIHNj
bWktY2xrIG5vZGUKPj4+PiAgICAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IEE0OiBBZGQgUExM
IGNvbnRyb2xsZXIgbm9kZQo+Pj4+ICAgICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogQTQ6IEFk
ZCBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIG5vZGUKPj4+PiAgICAgICAgIGR0LWJpbmRp
bmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgU0NNSSBjbG9jayBjb250cm9sbGVyIHN1cHBvcnQK
Pj4+PiAgICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgUExMIGNsb2Nr
IGNvbnRyb2xsZXIKPj4+PiAgICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMg
QTUgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgo+Pj4+ICAgICAgICAgY2xrOiBhbWxvZ2lj
OiBBZGQgQTUgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCj4+Pj4gICAgICAgICBjbGs6IGFt
bG9naWM6IEFkZCBBNSBjbG9jayBwZXJpcGhlcmFscyBjb250cm9sbGVyIGRyaXZlcgo+Pj4+ICAg
ICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogQTU6IEFkZCBzY21pLWNsayBub2RlCj4+Pj4gICAg
ICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPj4+
PiAgICAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IEE1OiBBZGQgcGVyaXBoZXJhbCBjbG9jayBj
b250cm9sbGVyIG5vZGUKPj4+Pgo+Pj4+ICAgIC4uLi9jbG9jay9hbWxvZ2ljLGE0LXBlcmlwaGVy
YWxzLWNsa2MueWFtbCAgICAgICAgIHwgMTIyICsrKwo+Pj4+ICAgIC4uLi9iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLGE0LXBsbC1jbGtjLnlhbWwgICAgICAgIHwgIDYxICsrCj4+Pj4gICAgLi4uL2Ns
b2NrL2FtbG9naWMsYTUtcGVyaXBoZXJhbHMtY2xrYy55YW1sICAgICAgICAgfCAxMzQgKysrKwo+
Pj4+ICAgIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE1LXBsbC1jbGtjLnlhbWwgICAgICAg
IHwgIDYzICsrCj4+Pj4gICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQu
ZHRzaSAgICAgICAgfCAgODAgKysKPj4+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy1hNS5kdHNpICAgICAgICB8ICA4NyArKwo+Pj4+ICAgIGRyaXZlcnMvY2xrL21lc29u
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUzICsrCj4+Pj4gICAgZHJpdmVy
cy9jbGsvbWVzb24vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+Pj4+
ICAgIGRyaXZlcnMvY2xrL21lc29uL2ExLXBsbC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKPj4+PiAgICBkcml2ZXJzL2Nsay9tZXNvbi9hNC1wZXJpcGhlcmFscy5jICAgICAgICAg
ICAgICAgICB8IDc2NCArKysrKysrKysrKysrKysrKysKPj4+PiAgICBkcml2ZXJzL2Nsay9tZXNv
bi9hNC1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDI0MiArKysrKysKPj4+PiAgICBk
cml2ZXJzL2Nsay9tZXNvbi9hNS1wZXJpcGhlcmFscy5jICAgICAgICAgICAgICAgICB8IDg4MyAr
KysrKysrKysrKysrKysrKysrKysKPj4+PiAgICBkcml2ZXJzL2Nsay9tZXNvbi9hNS1wbGwuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDQ3NiArKysrKysrKysrKwo+Pj4+ICAgIGRyaXZlcnMv
Y2xrL21lc29uL2Nsay1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDc2ICstCj4+Pj4g
ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKwo+Pj4+ICAgIC4uLi9jbG9jay9hbWxvZ2ljLGE0LXBlcmlwaGVyYWxzLWNsa2MuaCAgICAg
ICAgICAgIHwgMTI5ICsrKwo+Pj4+ICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxhNC1wbGwtY2xrYy5oICAgIHwgIDE1ICsKPj4+PiAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL2FtbG9naWMsYTQtc2NtaS1jbGtjLmggICB8ICA0MiArCj4+Pj4gICAgLi4uL2Nsb2NrL2Ft
bG9naWMsYTUtcGVyaXBoZXJhbHMtY2xrYy5oICAgICAgICAgICAgfCAxMzIgKysrCj4+Pj4gICAg
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE1LXBsbC1jbGtjLmggICAgfCAgMjQg
Kwo+Pj4+ICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1zY21pLWNsa2Mu
aCAgIHwgIDQ0ICsKPj4+PiAgICAyMSBmaWxlcyBjaGFuZ2VkLCAzNDA2IGluc2VydGlvbnMoKyks
IDI4IGRlbGV0aW9ucygtKQo+Pj4+IC0tLQo+Pj4+IGJhc2UtY29tbWl0OiAwMWYzYTZkMWQ1OWI4
ZTI1YTZkZTI0M2IwZDczMDc1Y2YwNDE1ZWFmCj4+Pj4gY2hhbmdlLWlkOiAyMDI1MDkyOC1hNF9h
NV9hZGRfY2xvY2tfZHJpdmVyLTJiN2M5ZDY5NTYzMwo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+
Pj4gLS0KPj4+IEplcm9tZQo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
