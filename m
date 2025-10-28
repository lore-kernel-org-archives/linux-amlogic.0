Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C2ACCD1BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Oct 2025 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8pjfcwm7Nlg3ZjmX9rKHE/Vs+LRjijNp1I+qLukIrc=; b=qwQELpZKZQuE3sqis6x6bK3wKY
	XEcHzlmZiKmgBZnCnlA/YyuKE1qUAvW20sjvG5EYI4mgFkcf03+Lb4RPunw6LqW50xvU7tL3bI0/n
	eub3vRlCQklWTEQbwgHDcXnK+fZOM8lKLq7N3aY5dRs6MMhxP8/Mke41gh5IcSzWZLb+H2r/A6+4t
	KiAGb7LxTNTmMscr+tKw2bySVTSy3zRqoZq1nPyzGEBByramXCHuan4K8UUEf+VdoXI04WwJmByQf
	wO4vxlEMzhlIxZhCm5sio6Ehi4QmukPVSU8vEVfc7HUbvscFEB+3oRPKoLywJUHVzWp2UFnViVnyC
	pnXeIYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhfU-0000000FpTq-1EC0;
	Tue, 28 Oct 2025 11:15:12 +0000
Received: from mail-koreacentralazon11023127.outbound.protection.outlook.com ([40.107.44.127] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhfR-0000000FpSR-3Trl;
	Tue, 28 Oct 2025 11:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ien538nQl2Hq+GoViSLDyEEPnUxSD3Y2P9zcKKHwm27E2oARtKgEPZ7tVBzP/i696i+Z4muHMwAxfIMlOKVP76gcjm47Cwm0rU0DAPdJjhhpmcvOGTbtxJun51Pg2T46hb7iGfFIDn9nSgEmtdkxfehWUwgQd3z+djKl1KBwhCdP+oeuf08z+KxAm8s4GG0iQnuKFsbZ+X5qMNhv4gFZF85MD96anzbWRwxpAQ5Xh7kV7ChULtDc9jyW8aDWrZ7gke0cDE+XrqcqWa2vaqnIrpFPCvPNxVf6Ecb+gwfUuozpFzpWGyfPVjWdnnGNrdvkTYz5bumetH5r+RjV9yknhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTRiJP1UYJx6uio0SBD7PlsyuZ36Joz/3+3bRB/4zFI=;
 b=jkQyUCDMnedKqF9b5y2hh1R4fHMJdmW0QEZ8h85JchjBA/zRghofnCaaFIWOOvF8WZ1ZKV/0J4zY9SPr6FocTEPZzd/vTWoSmtXcamSDaxEpI6vGbPcY699a2aK4fXPNRTQogDUdAastS1O7YrSZBK5Gc5yDVVcz40rZBbO9gbXAF/JbfxAEkAbyRBOPMgsBinMJ8dBnCKyQ6qUPb7muam6oIS9LIe0YzfYVIbZx64nMaworQEZ5uElYmGNlQlGOLMVpeYaNxlev9Ngd8I1FqD+iX4UcPLrMYonlhMIoNwIklBKg2sAd43HN0BgSb9a5hjR6qostzkl8frgWbJcKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTRiJP1UYJx6uio0SBD7PlsyuZ36Joz/3+3bRB/4zFI=;
 b=Gw63gl+uYpYHteRb41PAeqP5rASURCzYqaaKyhmjidBkXPW6J80RNg1xGUncXCzRQu5jHWfRTrkNt5069qdGp8DiIv7HEA9DoGJxBRLmHgHihb7qIWjq3AQso4JR82y/RpF9ys1Lxn+FlJ02Uricxgjhq+ngQjcIikIS2laiti/3c9v2X+lBfTPVJlO9zZXK3a/Q+qNqRsx5vegiXYLlnEVYqOPgNwT8JRCYcC0h6su8kTcriD6FG8svqmphsCQcJbeguo8bSNc2bQ0nT2Mgdpl366MYruawSF2KWWLYMMt6+/NXyTmykuQHT19clxUlLo1XC/wnEBjeyR1sNIf5ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYSPR03MB7784.apcprd03.prod.outlook.com (2603:1096:400:42a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 11:14:54 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:14:54 +0000
Message-ID: <40830266-692a-4731-8957-4462d4993746@amlogic.com>
Date: Tue, 28 Oct 2025 19:14:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vdec: Add binding document of Amlogic
 decoder accelerator
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
 <20251027-b4-s4-vdec-upstream-v1-1-620401813b5d@amlogic.com>
 <b989fba3-223d-498a-8efe-7a60e26cf0db@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <b989fba3-223d-498a-8efe-7a60e26cf0db@kernel.org>
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYSPR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d068a2-7f2d-471d-ad80-08de161338d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzYrMXdCSWlvZW5hY0l0YUM1U2dCeCtkNFQzRDVCbk1GaEo5L3pFR0NLZjlD?=
 =?utf-8?B?bVlPbmUwTkZsSDI2WFI5bTNkRnZTRkwwNUJOQkczcmF3ZGpKZGtpREdTbzFw?=
 =?utf-8?B?WjV0RlBaWWlmUXBFOENkdi9xY0RGTHQwSXh2SUg1Mis5ZGROQ05KRnRaNUJx?=
 =?utf-8?B?YnRGUXFtNWY0U1R4cGpDdFhObDhueVBzVEdjUUR4WWdDUGkvRzJ1YXFUck5z?=
 =?utf-8?B?RmpnbGQ4bmRxRnpRSkdRdFJXU1BJRm40b0l5WkVQS1VKNURzam5FZUptK0NZ?=
 =?utf-8?B?Wkd3OTZON0I0M3BSd1Q3R2hNS09EQ3NQYWhNZlBqM2VJVCtZYmxWcTBha01l?=
 =?utf-8?B?QUpTS0t5eCtOS2dXcWhXdjZHTnJGL01mc1ZiZTlUQ2dXTHI2VCtDWWcxbzBK?=
 =?utf-8?B?MHpOMWVoZjhBREVqdXQyRUJrSldKWCtLVVRzT3ZoV3FZZEUzWjI0TUZ2QWMv?=
 =?utf-8?B?Y2Vla2p1cHcvZVZsdEZ4TU5tRlpmSXc0ZGxqUXM3QjlXL2hxQmhna3M0UWti?=
 =?utf-8?B?OHd1dzRLMmd2R2toQ2Q1ckhZRDBiMElCdHJwcVR6dEh0UTZUK3Q1QlRpZXlW?=
 =?utf-8?B?U0JpeUhXS094WjIvVlJuWVMwRTg3TXpENjBQeDNFc3Q4bVA5YTBHbXBJNE82?=
 =?utf-8?B?dHlrekxKSkJmRVNPWDdWRHlMZXNlTWdSV0tDcjhQY0lEUjhXRGhNV0VtbXgr?=
 =?utf-8?B?RHhtRzg1TTVjb2hxNUdJT1hxR2FNZ3hrM2s1ajRKK2I3TkVLSTcydTJsdlpp?=
 =?utf-8?B?ZHoxeTJCdHRhdEViOExpYm52UEZVZGVqem5iT2hRd2h1WHhKcWtJS0pFOEhF?=
 =?utf-8?B?MjArTGV2bDFFRGFKcVBydm1SM3F0UHlKUHNyNE9Tc2NvRG1ZRE1rN2ZQeHVq?=
 =?utf-8?B?Titjd2tqVFlPRE9HeWpLL2I5bFpVazlaQjBQNFg5SEh6WlFGdjJkZkplTU9m?=
 =?utf-8?B?eEg4bitHSU5kakZHRFpNT0ErL3N5VUdTQkVOa3pzU3B1VkdoV2lYSDBRU1Er?=
 =?utf-8?B?cUhYWWUzZXF1NU9Hc1J1NHFKbUozRTNRYTQvN2doTEZrZ2kyOWNpQ05NQ0wr?=
 =?utf-8?B?ZjUxSWJwVWJGNG9QQnVSdEt4ckJFODEvOCswelZjME9xakJ0b21vWFpyMk5w?=
 =?utf-8?B?dGVCcS80UUlXb3VXVXY1R3NYRWFoa0RwTTEvUWhHY0NxM0hxWUlvcE9DMUl6?=
 =?utf-8?B?QlZPc0pRNW84S2psc0J1ZFROdSttN0pQaHdUWG96NzZ1UlhaU1lBNmlZaVhw?=
 =?utf-8?B?MmIyRHlaVmo1L1ZaZmdGcGpaRUpKazgxcTJIaFJvTkVxNVUxNjloNFFLT1JZ?=
 =?utf-8?B?M21kdUw2d0JaY2xtSXl2TktxTURzNDRQYUZFTzNaL0o1WnpkcHI0aEUzbW1N?=
 =?utf-8?B?bmpDWmx3RmxEVWJzelQ0ZXlsYnVOczB1dE1FYitLNzlEVUFWbEMrOExPWTdT?=
 =?utf-8?B?UG1NRzE2R3d5ZTE0VUloSG85OHVaU2ovUmZkdmFyM0t1MUJ4QktoRDJINzhU?=
 =?utf-8?B?aXpzYXBSbSswUWpZUitXZjN1Q1pOL3MreW40UjE1VFFMUFZ1MDN2QVV2Q1Rp?=
 =?utf-8?B?TzNidGJGaW1zOXBzSjVmZlZKVTlpSEt0RlRRSGlVZm5SeUN0TzluZEd0aE1E?=
 =?utf-8?B?ZXdZYWFRSS9DeWZoQ1BVa3VhR2E3bGNqSk9jUEFmbGJ5cmVoRk5uRWJJL2RM?=
 =?utf-8?B?R2dieHg1QnRqajBtYmg1dUdycyt0U3J3dWJwLzhQeEtxbkhrbmVxRmMzcVJz?=
 =?utf-8?B?aHZWaklLUHZzRmZKcXpFcTU1NmVUT3dvczQrKzdCUVdIMm42MTBadVI3cVdu?=
 =?utf-8?B?Z2NRQkdqWldDRlA3Y1VnVjZ4Vk1nZ3FKS3pVZVAzNlNDZHRQSVJlNGlFaHUz?=
 =?utf-8?B?a3Y4cHZ3MW9kb2x5SERQc2NDYlZ3OVNNSDlPTjJudEJDelE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkp0T0l3K09BUFVGK2t3NFBoNDVyWFloM1JCSWlRa0d6Ly93YVd0bjZxVGt6?=
 =?utf-8?B?Q0FMQzhubjhVWDdDU3Jaa1BkTkNBTkM0c0JSN2xTaUI5SXkyaGhhYTFtaWhK?=
 =?utf-8?B?MUk4R1BWWCthMDNhclhwUzVSRzgybDdYNk5sQ1luOVFseXcxOGVTbU1IanRH?=
 =?utf-8?B?RW1uNUZVZHIvdnNtL1lWaEJaMWR2Smh2LzVXNkxsWmZ6bWpCaURBMmN5cVMy?=
 =?utf-8?B?Zm5uek9USzhoaElkaHU1QTZHRDNUbzJMQ2RGQ3E1enlqZjJ0SnczZmNlUXRK?=
 =?utf-8?B?bG5oWVlBS1Y4akIzU0lZbXBOLytzT29JTW5jN1ZoRzZaY2JKSS90Uk9yNXR2?=
 =?utf-8?B?WTVLdzhFeW9jUm8yN2cxWm8ra2xOM21FQmlzMmZOOEJLeFA5RWcyOW1UdnRx?=
 =?utf-8?B?WjdXRnJLNHZUVDFSMlpFajNxeHRDaDdJSDczOXByYXpaQll6RDAwMTNGcUY2?=
 =?utf-8?B?UVBvSEFGNERXdmhkM29EektjdGIvdkNaQmdQZ0JITFk0anRzVGdrQzlHQTIz?=
 =?utf-8?B?eFV3SFZreTdqWEhvZzgzTk13OXQ0WnExc3BjOFRnakh5a0YvYVhxYXdFUWtY?=
 =?utf-8?B?bzFhL24wbytQNGlxMlV1a2ZncUR4Skk5cFlicncwMFJYVnhDV0c0TWxHYTdB?=
 =?utf-8?B?ZWhMRWJodkZhMWVTcnEveDJCakJxT2FxSnc0em5PZ3FZVEFIKzZMdWZIWkVU?=
 =?utf-8?B?NC9MSVY3WHlwallxVmtDRjNBK1JjVGhqRWh3M0ZkTFhvVkZicFpJeW5ueVVi?=
 =?utf-8?B?OEc0QXpqRWFDT3FlZGcyMEFjUVlXVWJZeERlaU5HZ09LUVlvNlpWL01RamRX?=
 =?utf-8?B?d2JpRkpyRGFrbDZLL3pzbFVWOEZ5UmVsbmNtd3gyZCtsWXloWjBhTXgvWnlq?=
 =?utf-8?B?dHBQTDIvVEsveU9uL3VwRHA4RWI5bEVxblZXUnFjemVhekxibWp0RTFwKzY4?=
 =?utf-8?B?ckY4aVhGU2F0WUY2Y1dVT1pYUDVRYU9YRG5GZnZwZmp3V3RDT0Y2amZYZEhS?=
 =?utf-8?B?T1JITXRhWGNINGpXdEpUMFhmazBsdURESHN5UXRlYXRxWW5haFpWYUd0elgx?=
 =?utf-8?B?NC84MWV1ZFNkSEU3eG11WFZhcDlMZ2dWTUU2TFdXUG9Lai9hRXNYTGxiRlN1?=
 =?utf-8?B?VjV4ekVRY2hCS1BSU2t3MzNaTE1KR3p5SFIvVkhhU1YwRWFkVUVydVhMeWNZ?=
 =?utf-8?B?UEdscVprQlZ3enlBc2E1L3FKWW1SK0RySkpaZUprWm5rd05waHJIY2tjaU9O?=
 =?utf-8?B?bmxoNmpEWmw3NmJpYWpTL2hBOFhHSDRGU0pxNUVIZnd4UEEvSlR5dERtQVZX?=
 =?utf-8?B?UlFrMVJHSURJWkJuMzUyTjRQQUpWNklNS3RZRXFXeVU1T1BMSE5NeWdjVWw1?=
 =?utf-8?B?T1VwSmh6ME5NaXV0aDQxZFhEZTh1Yk5vMUFHNmhDZ3RnY1dtZVdURDNodEJZ?=
 =?utf-8?B?N3plODcwWGRHK25DSzFTZGNCUGxuYnZxRitaODFNUFNLOThFOVFvRUljUmVX?=
 =?utf-8?B?WDhuOWZnd2NmNEsyM2xPcEJhN0VlemtxRmxYSVRMckVoZUJCdFZhakZua3pq?=
 =?utf-8?B?U0VEWUF6MW9xM1VmWEpLQXE2WEM5eTNCeEhEU2treVdxdTRlNGxQQUtURUFV?=
 =?utf-8?B?d1hCeGNjS3RBZVphTm9jdjZaQ1NPNDNyZWE1K2t3QmtHQkVLTUVCVmZKOHRu?=
 =?utf-8?B?VVJlMmE4M1ozOG5wcFdHMFA4cXM5YUFTUDczMHVoR25UYS9ZTlVNL3QzN0Z2?=
 =?utf-8?B?RlNaQUVoMlk1RENUblVmQTRpRVRyWkpyQUl4RUZOSys5d2ZEQ0cvT2dWdnJP?=
 =?utf-8?B?ZEJMc3lWdTZENkl1aWlCWHBLN2Juend6L09ZeVVXVGtFWlNLc3VsdFRsVEZW?=
 =?utf-8?B?ajgwcWhudEU4VVFtWFF5STU1M2llalM3dG1qSTRENk5MejhhYm9VL0JzY0E1?=
 =?utf-8?B?S3djckNHZmM4ZVdOQUoxYjNBT3JCNDBjLzl1bzhWZ1NHKzV1djdTT0c1VExL?=
 =?utf-8?B?K1VVZCtPK1lzblpBL1JmY2NDS2N1dVFpTFhIYzZCbnI4d2ZqckpUVnpSNlFo?=
 =?utf-8?B?UmtJTWtQQ2w4QWszNlNOMDlJRTBVNk90WXZkWUozdExxWkJ6blNNc0dsRTFU?=
 =?utf-8?B?K21Vajg3bXJ6OTBlSm1Xb1RnMEd2YWYrVU9XS2FJNEpSUzFlNHcwQnBBTjZY?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d068a2-7f2d-471d-ad80-08de161338d3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:14:54.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENCNqNuPAh67TJz6A4Wcwdt3+6DjE1KmZ4OH2KWeZsHj8JSNyLm/jtj1NwTadzT4iJLsQ3Mn/tu9SscINaQ7sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_041509_875492_29A675BF 
X-CRM114-Status: GOOD (  22.26  )
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

CuWcqCAyMDI1LzEwLzI3IDIxOjA1LCBLcnp5c3p0b2YgS296bG93c2tpIOWGmemBkzoKPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGtyemtAa2VybmVsLm9yZy4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdCj4KPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIDI3LzEwLzIwMjUgMDY6NDIs
IFpoZW50YW8gR3VvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4gRnJvbTogWmhlbnRhbyBHdW8gPHpo
ZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pgo+PiBBZGQgZHQtYmluZGluZyBvZiB0aGUgQW1sb2dp
YyBoYXJkd2FyZSBkZWNvZGVyIGFjY2VsZXJhdG9yLgo+IFBsZWFzZSB1c2Ugc3ViamVjdCBwcmVm
aXhlcyBtYXRjaGluZyB0aGUgc3Vic3lzdGVtLiBZb3UgY2FuIGdldCB0aGVtIGZvcgo+IGV4YW1w
bGUgd2l0aCBgZ2l0IGxvZyAtLW9uZWxpbmUgLS0gRElSRUNUT1JZX09SX0ZJTEVgIG9uIHRoZSBk
aXJlY3RvcnkKPiB5b3VyIHBhdGNoIGlzIHRvdWNoaW5nLiBGb3IgYmluZGluZ3MsIHRoZSBwcmVm
ZXJyZWQgc3ViamVjdHMgYXJlCj4gZXhwbGFpbmVkIGhlcmU6Cj4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNo
ZXMuaHRtbCNpLWZvci1wYXRjaC1zdWJtaXR0ZXJzCj4KPiBBIG5pdCwgc3ViamVjdDogZHJvcCBz
ZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJiaW5kaW5nIGRvY3VtZW50IGZvciIuIFRoZQo+ICJkdC1i
aW5kaW5ncyIgcHJlZml4IGlzIGFscmVhZHkgc3RhdGluZyB0aGF0IHRoZXNlIGFyZSBiaW5kaW5n
cy4KPiBTZWUgYWxzbzoKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNy1y
YzMvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBh
dGNoZXMucnN0I0wxOApUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0IGFuZCBwcm92aWRp
bmcgdGhlIGd1aWRhbmNlLiBXZSdsbCByZXZpc2UgCnRoZSBzdWJqZWN0cyBhY2NvcmRpbmcgdG8g
dGhlIHNwZWNpZmljYXRpb25zLgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVudGFvIEd1byA8emhlbnRh
by5ndW9AYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9tZWRpYS9hbWxvZ2lj
LHZjb2RlYy1kZWMueWFtbCAgICAgICAgIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyx2Y29kZWMtZGVjLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyx2Y29k
ZWMtZGVjLnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li42Y2VhOGFmNzI2MzkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyx2Y29kZWMtZGVjLnlhbWwKPiBGaWxlbmFt
ZSBtYXRjaGluZyBjb21wYXRpYmxlLgpZZXMsIHdlIHdpbGwgY29ycmVjdCB0aGlzLgo+PiBAQCAt
MCwwICsxLDk2IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKPj4gKyMgQ29weXJpZ2h0IChDKSAyMDI1IEFtbG9naWMsIEluYy4g
QWxsIHJpZ2h0cyByZXNlcnZlZAo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvYW1sb2dpYyx2Y29kZWMtZGVjLnlhbWwjCj4+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
Pj4gKwo+PiArdGl0bGU6IEFtbG9naWMgVmlkZW8gRGVjb2RlIEFjY2VsZXJhdG9yCj4+ICsKPj4g
K21haW50YWluZXJzOgo+PiArICAtIFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNv
bT4KPj4gKwo+PiArZGVzY3JpcHRpb246IHwKPgo+IERvIG5vdCBuZWVkICd8JyB1bmxlc3MgeW91
IG5lZWQgdG8gcHJlc2VydmUgZm9ybWF0dGluZy4KT0ssIEknbGwgZ2V0IHJpZCBvZiB0aGlzLgo+
PiArICBUaGUgVmlkZW8gRGVjb2RlciBBY2NlbGVyYXRvciBwcmVzZW50IG9uIEFtbG9naWMgU09D
cy4KPj4gKyAgSXQgc3VwcG9ydHMgc3RhdGVsZXNzIGgyNjQgZGVjb2RpbmcuCj4+ICsKPj4gK3By
b3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IGFtbG9naWMsczQtdmNv
ZGVjLWRlYwo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMgo+PiArCj4+ICsgIHJl
Zy1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IGRvc2J1cwo+PiArICAg
ICAgLSBjb25zdDogZG1jYnVzCj4gSXMgImJ1cyIgcmVhbGx5IG5hbWUgb2YgdGhpcyBpbiBkYXRh
c2hlZXQ/Ck5vLCBpdCBpcyBub3QgZnJvbSB0aGUgZGF0YXNoZWV0LCBpbiBmYWN0IGl0IHdhcyBp
bmhlcml0ZWQgZnJvbSB0aGUKb2xkZXIgU09Dcy4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
IGFib3V0IHRoaXM/Cj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBtYXhJdGVtczogMwo+
PiArCj4+ICsgIGludGVycnVwdC1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29u
c3Q6IG1haWxib3hfMAo+PiArICAgICAgLSBjb25zdDogbWFpbGJveF8xCj4+ICsgICAgICAtIGNv
bnN0OiBtYWlsYm94XzIKPiBVc2VsZXNzIG5hbWVzLCBzbyBqdXN0IGRyb3AgaW50ZXJydXB0LW5h
bWVzIHByb3BlcnR5LgpZZXMsIHdlIGRvbid0IG5lZWQgdGhlIGludGVycnVwdCBuYW1lcy4gSSds
bCBkcm9wIHRoZW0uCj4KPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsgICAgbWF4SXRlbXM6IDMKPj4g
Kwo+PiArICBjbG9jay1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IHZk
ZWMKPj4gKyAgICAgIC0gY29uc3Q6IGNsa192ZGVjX211eAo+PiArICAgICAgLSBjb25zdDogY2xr
X2hldmNmX211eAo+PiArCj4+ICsgIHBvd2VyLWRvbWFpbnM6Cj4+ICsgICAgbWF4SXRlbXM6IDIK
Pj4gKwo+PiArICBwb3dlci1kb21haW4tbmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAt
IGNvbnN0OiBwd3JjLXZkZWMKPiBEcm9wIHB3cmMKPgo+PiArICAgICAgLSBjb25zdDogcHdyYy1o
ZXZjCj4gRHJvcCBwd3JjCk9rLCBJJ2xsIGRyb3AgdGhlIHR3byBwd3JjKHMpIGFib3ZlLgo+Cj4g
TWlzc2luZyBpb21tdXMuIEkgcmVhbGx5IGRvdWJ0IGhhcmR3YXJlIHdvcmtzIHdpdGhvdXQgSU9N
TVUuCgpJT01NVSBpcyBub3Qgc3VwcG9ydGVkIGJ5IEFtbG9naWMgU09DcywgdGhlIGRlY29kZXIg
aGFyZHdhcmUgbmVlZHMgdG8gCnVzZSBjb250aWd1b3VzIG1lbW9yeS4KCj4KPgo+IEJlc3QgcmVn
YXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
