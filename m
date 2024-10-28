Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C50D13588
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Oct 2024 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hr0BQsi3nahDMdSS2/dd8az5BaU/3H4Ba/vJFpLtPQ=; b=jdZg2PCP1HoyVWqlfzRjVhdQ4X
	CJ3x1l5dVJnt3fAuQK5Uq0QpGVEiJC0CFnL78rYJxpZJz2aQ3h4vJjo+bpJQXulS1oyOba7EDboYO
	YzuBImeMC2XnJ2u+WWwsu5l16l0gQo+o2QtLiCGp+1c0Hl0Qaduj7uj3C7b+LQ0u70i3XQslTYwol
	UfnkR9MJJv/q1zqtpJmfNfNUGkeYAJ8V3R8E1M8tChtKRpUuuMsXeoCLS6N34GwUZrp5zFHssDNIl
	jDi96VRq+r4ZO+p6Cuagm7ntLxdlZhLYcPQFdI/OH3U5jEynV8GYDHNfk0MjYr9c9M7Bft4RJAZQ2
	nb+AsvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MNA-0000000AIDm-3QJB;
	Mon, 28 Oct 2024 09:49:16 +0000
Received: from mail-psaapc01on20724.outbound.protection.outlook.com ([2a01:111:f403:200e::724] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MAo-0000000AFm9-2KoQ;
	Mon, 28 Oct 2024 09:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr8z/j5SiC3FQc9tgCx2/a1/epg+7NlKByTkfTBQag1a4IHcSRl4jsV0+/mmaIi9AKm+Dqz49flHMYrKuq4avF9L4ArZS+W/IV+72Og5aRwMguXaSy96WcBujuvmF+5u9yRE0kfQZe3Pjpwxhh0GjJWl419RVKRMEfTPbTUpv84VE/Q4ohke1s0RKDVNYXcGDAxh/vf0u964EOYUp2MkP7Au2SXwmixeu07Ow3semukcJj97yzDo7Rn2GVM21ox89hLlSZ4bTPILVz7oOzo/+YvPm0ZKfVWff/eUHYYRx9z2Eu2bvGVt0AUY1CobEDsKaYROkesYvJIZQFyIXTWY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj7dJKstOKG2jwJmYvlVySZaTqYcboJuoN6wJUTgSnA=;
 b=if5JKY8jrEqj76ykYNZoxSvRE+EYcm6V/5L1J+sGyAYDv0M/zwpv8pLv57VBEXHjYZwDcdDg71MGybzM8syZR4niFwKdSOFeVm6Y4HgpGEnhJVBLTkAsUf2JvRkGq8mDDcA22WxSLVBeypdzxb+roJyBsq6GmSy7HI10bE4+IGFTumVztJTTkNMT6XlyRDz/frVgSpzW6v/FVWwfJebOsTFcbdhyl1TTXmxhS31rwHV7jx5aR+WGgCv7La9ZlPQzSzXWuQhDaRJIPPFqjt+7jy3OxHUIZAPoFgGFYICROgXTLyKPC//E0aUlwB+LZcKSrVlpYJTWj7MyNeoY3CBiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj7dJKstOKG2jwJmYvlVySZaTqYcboJuoN6wJUTgSnA=;
 b=C7+Pn+dm5dzTo+j3ydgMJ0YThCGztnhod+kSgisQfVt6VfyaBMdTEJ7lqDLAPrzRuC47eQOi6G8pWdhtF9ze5fn0jJa7u8AH+7uKUYqHOq5fV/NRujVG/QiEw3XoibbAIE2EOdyKSK5hB+pci1pKJayz6J6Sp8VwpKR7/AJp486cHjw7RX/cOAJMuzQ98hPTLLkVAjW06OQ7asy6Q+G0yfDM1jQ3aQEBn0Ztzm3jdsbVNTN3F6mi99t3FdwiDMMec6RDcWFe3ZQBbj3QvAoiIYnBKeLmvwC926XCwqgrl9C3PuKemg0J4C/qBsDL5zhrckFMLrLNz5/obqS8gY3y6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TY0PR03MB6774.apcprd03.prod.outlook.com (2603:1096:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 09:36:20 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:36:20 +0000
Message-ID: <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
Date: Mon, 28 Oct 2024 17:36:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
X-ClientProxiedBy: TY2PR0101CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::15) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TY0PR03MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1848bfaa-0cb5-4c2b-b2bc-08dcf733fad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWV5V044NGNxRHJEUUFjQ2xnLzBydjRsSlRzTXp3UkdxQjhxZG5MU3ErRDBQ?=
 =?utf-8?B?UkMwczNjN0Q1bFc3dWR3MkFQbzQvTWtIVmJudEZjelVYeDcyZmRnVG1vTlRI?=
 =?utf-8?B?b0NjU2xaVmxic1hWQkJ0bU5GWmx3d2NtR2FsZ29pejl4NXVJTGZ6TFU1Lzlk?=
 =?utf-8?B?MnMzUU5qMUIzdkk2bnc3MHY3dnpWOGhybHpMd0pwZWg2UURnV2tXMVg0Q2Js?=
 =?utf-8?B?alVkT1FXNzh2dCs5YTNEOWtLekNONitOZXlrd2R1Y0JQTHAxSTcyNnVIUHRV?=
 =?utf-8?B?RERCdXgvbCt4Nk1VQWhUL2RFWGp3TFUxQVhUSmxMSDdEcGVSczRKWXVTUGFn?=
 =?utf-8?B?TDZuSHdtWkV0SHRPN0dtbDM5WHNCN2tWTG03THFLb09xYWpSQkFLRXdKWmVN?=
 =?utf-8?B?TFpNUDdjVUJIVDBaOWIrVGhiRnlnVFpBbDljNE44eGtCdVZkWWVJWEJ6TGhT?=
 =?utf-8?B?anAzWUQ4dXJ6S0JsdFFxbHk4amVrSzJaWGxNNjJESU1GTmRmRW5waml3c2la?=
 =?utf-8?B?Q3hEcURWV1p2bk5UbDdSeUNDQXc5bjRaamtsR28yM2xJb1JrRHk2OXNLSG11?=
 =?utf-8?B?eEVEbTlDYVRVaE5zQmhVbzNrTW04ZmJINXB3VS9wUUp6MnJBbitZenlhTEFP?=
 =?utf-8?B?UnVJbUkyRnQ2ZmV6UHJiQWNLUG10N3lkaTZUa3RFMUx4TE5kWElrUDB4Snpo?=
 =?utf-8?B?VDhteUhWaks5SWRZVFhic3pvdnFtbjgxbkJYd0V2L05LekFUd2I2bG5RL2h4?=
 =?utf-8?B?cG1MR09wS3BVcDFzNVF4QmtMQzFqcUFZUXYxMGdlSGFKOFdlRUxRZVFza2Uw?=
 =?utf-8?B?TGZMb2RtQU9oc2hUb2Npc25oYlBzK0xlVkRHVytyc3lobUZ2eGxuajl5Nzdz?=
 =?utf-8?B?Q21uRkxBbW8xUGdsaGQzQnorQ0FMRmZoaUpFUXJOR3hwbzhlMVowL0J6dHJh?=
 =?utf-8?B?YzJpRUNoTE4zaTl3VXpZK01sM0RsTDJXWnRaQ1JadWFSK1NzZ29jczVjRVRk?=
 =?utf-8?B?Vlp6RUdXQnhPdkpDYUVKN1I4RFFPdHNyb3N6K3Y5TDRVTGROQWJvVGZROFpF?=
 =?utf-8?B?bjlDL2Y4OEpMVzUrU0xRRzkySnorYmVscVdqZVVyaldROFRrU1BHdjJVREVK?=
 =?utf-8?B?UDlEd1NGbG9vTDNqNElBMkV6bW50UDFhREo3MFRPYVFYSWlVOWVGZXhVZG82?=
 =?utf-8?B?aVJjNHN5UE9maSsrVFAvY3pDdURISGRtMlhUVkpVU1RSVUZPcmwzaDVCNXJP?=
 =?utf-8?B?aUZ0VEdMdVBibVBuWjRKZEZpUE9XZjNlRzZPMzBIV05GOXdxeDdaZjJSYjAz?=
 =?utf-8?B?d2FwY01Ka2xTemVCSDB2eTkyQ3Nyc2RVbnVJOWZ2TWpyZVRRT2cxN09yMHU2?=
 =?utf-8?B?dTN0VmJLUnRoclJCdHpLcm9sU1Z3cHJYSVdVSnFuMTRpZ0NXbVdKWVpmUzhh?=
 =?utf-8?B?dk1Fb3Mzbi9JOStJYldlU1dvWnRiMytQVUFwYTBxUGhtZFBBSWQrRTlRbnVz?=
 =?utf-8?B?a25XU3I3WnFvLytRcGx4eTdtMUFHUnRXSHdyNXFpck1kKythajB6L3k0MXBj?=
 =?utf-8?B?c1hWZTFlc1BBb1VVU1FrWFNVUHAzN0FYZEQxODMxOS9GeVpWTElTeEJDWmhw?=
 =?utf-8?B?LzJkdTA2RGRqU3BaN2NheXEvczFSQUJSZzRpQ2l1YUNRQU9jUWd1YzBvUDVO?=
 =?utf-8?B?ays5cVAvTDVjNlhCVml0Y0JEdFpKNTAzM0ZnR051TTlvdTg0UW5jWEw3aFBh?=
 =?utf-8?Q?aw5s+0afkShP4Cyvw3+9xPxVpn7Hkki/Ma72ZJz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm16SGxGRlFLU21XRHV0ZE1LNnFHdStQckNkeGdCeWZxcjRqWHhmcEUxa2k1?=
 =?utf-8?B?Z2xyU0Evci9zM0xnWW1sKzNEeVZDQ1g1eHUvQVIxeTdOSStGcGdxUjg0MDJv?=
 =?utf-8?B?bVJOZjcwQy9EV0d0Mm1zNWl2SHlIOXJFdlZvNzE2N1pRNHUwd0RvQlRvY3Jw?=
 =?utf-8?B?VkVlL0FkY3pWY3ZRc1B6S0x5a0FrZTBCalp1WEE0WFoyYTM1RWVkemt4UkxX?=
 =?utf-8?B?ZUJRK29xeHhaQmdEK3JzV08xdmltMzAzVlVEVW5PVk5WMWxYciszVnEzemlH?=
 =?utf-8?B?aXdRZm5Ec1Erdk9seDNwQ3FOTUJIRER0a2dyZFNYYnMxM1JmcGRXa0x2Qmlr?=
 =?utf-8?B?MjAzdklrMXVlMmwzNGtES0pGR0cxaC80K1ZibGVZcU1lbFpodE1jOEhXdjQy?=
 =?utf-8?B?RDY0cmRGdnFSeDRxSithbUU4WExMR0tSTXd1RFJWUkZpajBIaWI4Rk9sNUxs?=
 =?utf-8?B?Tzd4ZHBDUGkyd1lqQi91Qm45aFdqVmNsU0I4ZDU2WlFSaHp3M2o3eGRzMVpM?=
 =?utf-8?B?ejFmQnlrRStEeWY0ZmpRNGd3Mlowd3NzTHVjV3phRmdkVXY0VEM0M0duVHlE?=
 =?utf-8?B?WUFVcUwrckpxUVAwRlZ2MWpSb0x0dGM2OVBsSVZWY1huZDNHSzE5aENLUzhv?=
 =?utf-8?B?RGR0WnZiMnFDa205c05HakhjNzN3SW5zaHVMbFhMd0g2bVBKUWtsa1dnb1c5?=
 =?utf-8?B?amQ5NzlwTzV6K0xTQS8vcmdDWDVvakFSR0luVVlzNThEZVFlNW55dW05bk5m?=
 =?utf-8?B?L2pVaUhqclZEVm02VFVSWWVPTXpnb3pkTlJkdFY0czFoSHFacWRpZWZnbTNx?=
 =?utf-8?B?S1JRL0I3K2k5czVUd1ZrMUwvTzhlZGYwanV2dE1YSzZHbStYRnBPcGEyV1Z2?=
 =?utf-8?B?QjF2Vlo1cGZJb3NJU3BkMHQ4aUhnUFNUaUhWQzBudnF2MHJGZFlwM0YrMnVv?=
 =?utf-8?B?R0tLQ3RvSHc3S1lIVFIxRGNzMS8zSllRODhodjlYUStkaDF3ZDhGRDQ3S1Bw?=
 =?utf-8?B?V0hDVG84anRjelN5K1g2NVdibDBEMWxXbmMzcHBTVm1ZQm42dG5pZHZVZXRi?=
 =?utf-8?B?Vy9tRmNMakZWbnB0QWo1NGpqeG9zM0NzeUhGNm1Qa1BjeXpjcHBsUVJRVTFo?=
 =?utf-8?B?UUkvZTFLL2V1QnVvY05SUlhnWUdsU3M0RjR4ZG5wcGU2L1VEYVJiek9UK3Jo?=
 =?utf-8?B?WFpybHdpZTJoSkJNaFVFdjgrcEQxQ3pySTlWNmhncXZDVHI2dWhVd2Ewa2lB?=
 =?utf-8?B?YnBkL2VsTG1wTUxsdU5FV3UyZk05bUtreHl2d0JnWURKdFhGUjdVblBCQUlU?=
 =?utf-8?B?NVNFdjBuNVFieW02RUROUXo5NHNZbjIzcCtlYjZCWWNOTVhxelFiZ05ZaVZR?=
 =?utf-8?B?RzduaWdPYTVkeDROQ0tkZ0dKVnNhTWJJTVNpeURHcDR2MjRVSVdFa0JaaEdB?=
 =?utf-8?B?TmhJZE5BQkNmYm1qZ0t3VmZPYnRxZDFNQzN4dE9QTC9haW5ybk1qcElPRkVJ?=
 =?utf-8?B?Wnl3QVJZT3dESjc1Mzh1R25xVnNJU1Z0YjVlWFhuRXh6NmRLU2NiQW5JQmhB?=
 =?utf-8?B?TmZFL3E5cnJtVlBLczZURmEzWGtWM1kzcFM5MEpuMXFhbEU0U3lpWTF5cVNT?=
 =?utf-8?B?SWxnRVY0dXJjRUVTMkd3aFlYTDR1M1FnaHFqQm1EbkhSRk1KSDlSbnhQeU1u?=
 =?utf-8?B?dVdzRVMrWmVZeFR1eDFEa3NWZzV1M1dJTjBKMG1TZ2txYkZTSG1Nam5LeEF3?=
 =?utf-8?B?THlDQUEwOVluQzRKU2JYVG55c05CQmJXQmdIeE54YzRLUGVrOUI3UytlbHhB?=
 =?utf-8?B?Yys3akZFKzMrbFdTZUw3ZnRMWjBSM0hiWnhFUWRZdzM0OGZSR3lXaFNpMFdQ?=
 =?utf-8?B?VGxON1pxQWx2cjVvUnlDWWp3WkNxclNsTXoyT2thWFVTaXNLdGt4SkhSb3pS?=
 =?utf-8?B?RU0ybHdpM0tLTVJmNlFENmlHeHFPZ29CSkJXNVZjMUthaWx4RU00bDgvWDlh?=
 =?utf-8?B?NUZrTnlvZDdDNFFVaVZNdGErMGJWWHVicUF5YzB3bGgvRWJkK3NyQ1NxT2ty?=
 =?utf-8?B?R2FTZWRpRERXN0tCVDNBcHc1VlAxVi90THJvRDRFOEpoZFhLQnQyaGdEeEZP?=
 =?utf-8?B?V0xOTXdpMHhSa3REVmt2dVNld1V0ckwzT21WVlFWQk9OU3Q4ZnRIYlQ2aFlS?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1848bfaa-0cb5-4c2b-b2bc-08dcf733fad6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:36:20.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVWKt3Mf4tLm1SQnAPmxeaUUSeGWoLlgUPYpUgNn6LVxN2fZmOP+pcVqBvj3Z/Xt6whiixFxQUMqE/FfN3DBkuJHRFG0d8092dFKXYlWTWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_023630_631421_6B547FF3 
X-CRM114-Status: GOOD (  19.48  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciBhZHZpY2UuCgpPbiAyMDI0LzEwLzI4IDE3OjA5
LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+
IAo+IE9uIDI4LzEwLzIwMjQgMTA6MDcsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4gSGkgTmVpbCwK
Pj4gwqDCoMKgwqAgQmFzZWQgb24gdGhlIGN1cnJlbnQgZGlzY3Vzc2lvbiByZXN1bHRzLCBHUElP
IGluZGV4IG1hY3JvIAo+PiBkZWZpbml0aW9uIGRvZXMgbm90IGJlbG9uZyB0byBiaW5kaW5ncy4g
SWYgc28sIHRoZSBwaW5jdHJsIGRyaXZlciAKPj4ga2VlcHMgdGhlIGV4aXN0aW5nIGFyY2hpdGVj
dHVyZSwgYW5kIHVzZSBudW1iZXJzIGluc3RlYWQgaW4gZHRzIGZpbGUuICAKPj4gT3IgdGhlIHBp
bmN0cmwgZHJpdmVyIHVzZSBiYW5rIG1vZGUgYWNlc3MsIHRoaXMgbWF5IG5vdCBiZSBjb21wYXRp
YmxlIAo+PiB3aXRoIGV4aXN0aW5nIGZyYW1ld29ya3MuIFRoaXMgaXMgZG9uZSBieSBhZGRpbmcg
b2ZfeGxhdGUgaG9vayAKPj4gZnVuY3Rpb25zIGluIHBpbmN0cmxfY2hpcCBzdHJ1Y3QuCj4+Cj4+
IFdoYXQgaXMgeW91ciBhZHZpY2UgdGhhdCBJIGNhbiBpbXBsZW1lbnQgaW4gdGhlIG5leHQgdmVy
c2lvbi4gVGhhbmtzIQo+IAo+IEtlZXAgdGhlIGRyaXZlciBhcy1pcywgYnV0IG1vdmUgdGhlIGhl
YWRlciBmaWxlIGludG8gCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljIGxpa2UgaXQgd2Fz
IGRvbmUgZm9yIHRoZSBsYXN0IHJlc2V0IAo+IGNvbnRyb2xsZXIgc3VwcG9ydDoKPiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1yZXNldC5oCj4KCkkgZG9uJ3Qgc2VlIGV4
YW1wbGVzIEMgZmlsZSBhcHBsaWVzIGR0cyBoZWFkZXIgZmlsZS4KQyBmaWxlIG5lZWQgdG8gYmUg
ZGVmaW5lZCBvbmNlLCBhbmQgdGhpcyBuZWVkcyB0byBiZSBkZWZpbmVkIGFnYWluIGluIApkdHMg
aGVhZGVyIGZpbGUuCgo+IE5laWwKPiAKPj4KPj4gT24gMjAyNC8xMC8yMSAyMzoyNywgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIDIx
LzEwLzIwMjQgMTI6MzgsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+Pj4+PiA9
PT09Pjw9PT09PT09PT09PT09PT09PQo+Pj4+Pj4gKy8qIFN0YW5kYXJkIHBvcnQgKi8KPj4+Pj4+
ICsjZGVmaW5lIEdQSU9CX1NUQVJUwqDCoMKgwqDCoMKgwqAgMAo+Pj4+Pj4gKyNkZWZpbmUgR1BJ
T0JfTlVNwqAgMTQKPj4+Pj4+ICsKPj4+Pj4+ICsjZGVmaW5lIEdQSU9EX1NUQVJUwqDCoMKgwqDC
oMKgwqAgKEdQSU9CX1NUQVJUICsgR1BJT0JfTlVNKQo+Pj4+Pj4gKyNkZWZpbmUgR1BJT0RfTlVN
wqAgMTYKPj4+Pj4+ICsKPj4+Pj4+ICsjZGVmaW5lIEdQSU9FX1NUQVJUwqDCoMKgwqDCoMKgwqAg
KEdQSU9EX1NUQVJUICsgR1BJT0RfTlVNKQo+Pj4+Pj4gKyNkZWZpbmUgR1BJT0VfTlVNwqAgMgo+
Pj4+Pj4gKwo+Pj4+Pj4gKyNkZWZpbmUgR1BJT1RfU1RBUlTCoMKgwqDCoMKgwqDCoCAoR1BJT0Vf
U1RBUlQgKyBHUElPRV9OVU0pCj4+Pj4+PiArI2RlZmluZSBHUElPVF9OVU3CoCAyMwo+Pj4+Pj4g
Kwo+Pj4+Pj4gKyNkZWZpbmUgR1BJT1hfU1RBUlTCoMKgwqDCoMKgwqDCoCAoR1BJT1RfU1RBUlQg
KyBHUElPVF9OVU0pCj4+Pj4+PiArI2RlZmluZSBHUElPWF9OVU3CoCAxOAo+Pj4+Pj4gKwo+Pj4+
Pj4gKyNkZWZpbmUgUEVSSVBIU19QSU5fTlVNwqDCoMKgIChHUElPWF9TVEFSVCArIEdQSU9YX05V
TSkKPj4+Pj4+ICsKPj4+Pj4+ICsvKiBBb2J1cyBwb3J0ICovCj4+Pj4+PiArI2RlZmluZSBHUElP
QU9fU1RBUlTCoMKgwqDCoMKgwqAgMAo+Pj4+Pj4gKyNkZWZpbmUgR1BJT0FPX05VTSA3Cj4+Pj4+
PiArCj4+Pj4+PiArLyogSXQncyBhIHNwZWNpYWwgZGVmaW5pdGlvbiwgcHV0IGF0IHRoZSBlbmQs
IGp1c3QgMSBudW0gKi8KPj4+Pj4+ICsjZGVmaW5lwqDCoMKgIEdQSU9fVEVTVF9OwqDCoMKgwqAg
KEdQSU9BT19TVEFSVCArwqAgR1BJT0FPX05VTSkKPj4+Pj4+ICsjZGVmaW5lwqDCoMKgIEFPQlVT
X1BJTl9OVU3CoMKgIChHUElPX1RFU1RfTiArIDEpCj4+Pj4+PiArCj4+Pj4+PiArI2RlZmluZSBB
TUxPR0lDX0dQSU8ocG9ydCwgb2Zmc2V0KSAocG9ydCMjX1NUQVJUICsgKG9mZnNldCkpCj4+Pj4+
PiA9PT09Pjw9PT09PT09PT09PT09PT09PQo+Pj4+Pj4KPj4+Pj4+IGlzIGV4YWN0bHkgd2hhdCBy
b2IgYXNrZWQgZm9yLCBhbmQgeW91IG5hY2tlZCBpdC4KPj4+Pj4KPj4+Pj4gTm8sIHRoaXMgaXMg
bm90IHdoYXQgd2FzIGFza2VkLCBhdCBsZWFzdCBhY2NvcmRpbmcgdG8gbXkgCj4+Pj4+IHVuZGVy
c3RhbmRpbmcuCj4+Pj4+IE51bWJlciBvZiBHUElPcyBpcyBub3QgYW4gQUJJLiBOZWl0aGVyIGlz
IHRoZWlyIHJlbGF0aW9uc2hpcCwgd2hlcmUgCj4+Pj4+IG9uZQo+Pj4+PiBzdGFydHMgYW5kIG90
aGVyIGVuZHMuCj4+Pj4KPj4+PiBJIGNvbmZpcm0gdGhpcyBuZWVkIHNvbWUgd29yaywgYnV0IGl0
IG1vdmVkIHRoZSBwZXItcGluIGRlZmluZSB0byBzdGFydAo+Pj4+IGFuZCByYW5nZXMsIHNvIHdo
YXQgZGlkIHJvYiBleHBlY3QgPwo+Pj4+Cj4+Pj4+Cj4+Pj4+IE1heWJlIEkgbWlzc2VkIHNvbWV0
aGluZywgYnV0IEkgY291bGQgbm90IGZpbmQgYW55IHVzZXJzIG9mIHRoZXNlIAo+Pj4+PiBpbiB0
aGUKPj4+Pj4gRFRTLiBMb29rOgo+Pj4+Pgo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNDEwMTQtYTRfcGluY3RybC12Mi0zLTNlNzRhNjVjMjg1ZUBhbWxvZ2ljLmNvbS8KPj4+
Pgo+Pj4+IFNvIHlvdSB3YW50IGNvbnN1bWVycyBiZWZvcmUgdGhlIGJpbmRpbmdzID8gc3RyYW5n
ZSBhcmd1bWVudAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFdoZXJlIGlzIGFueSBvZiBhYm92ZSBkZWZpbmVz
Pwo+Pj4+Pgo+Pj4+PiBNYXliZSB0aGV5IHdpbGwgYmUgdmlzaWJsZSBpbiB0aGUgY29uc3VtZXIg
Y29kZSwgYnV0IEkgZGlkIG5vdCBpbWFnaW5lCj4+Pj4+IHN1Y2ggdXNlLiBZb3UgZXhwZWN0Ogo+
Pj4+PiByZXNldC1ncGlvcyA9IDwmY3RybCBHUElPQU9fU1RBUlQgMT4/Pz8KPj4+Pgo+Pj4+IE5v
IEkgZXhwZWN0Ogo+Pj4+IHJlc2V0LWdwaW9zID0gPCZjdHJsIEFNTE9HSUNfR1BJTyhCLCAwKSAx
PjsKPj4+Pgo+Pj4+IGJ1dCB0aGUgbWFjcm8gc2hvdWxkIGdvIGFsb25nIHRoZSBkdHMgbGlrZSB3
ZSBkaWQgZm9yIHRoZSByZXNldCAKPj4+PiBkZWZpbmVzLAo+Pj4+IHNvIHBlcmhhcHMgdGhpcyBp
cyB0aGUgc29sdXRpb24gPwo+Pj4KPj4+IE9LLCBzbyBJIHNhaWQgaXQgd2FzIG5vdCBhIGJpbmRp
bmc6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvdTRhZnhxYzNsdWRzaWM0bjNoczNy
M2RyZzNmdG1zYmN3ZmpsdGljMm1iNjZmb280N3hAeGU1N2dsdGw3N2hxLwo+Pj4KPj4+IGFuZCB5
b3UgaGVyZSBjb25maXJtLCBpZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseSwgdGhhdCBpdCBn
b2VzIHdpdGgKPj4+IHRoZSBEVFMgbGlrZSByZXNldCBkZWZpbmVzIChJIGFzc3VtZSBub24tSUQg
bGlrZSBkZWZpbmVzPyksIHNvIGFsc28gbm90Cj4+PiBhIGJpbmRpbmc/Cj4+Pgo+Pj4gV2hhdCBh
cmUgd2UgZGlzYWdyZWVpbmcgd2l0aD8KPj4+Cj4+PiBKdXN0IHRvIHJlY2FsbCwgSmVyb21lIGFz
a2VkIHdoZXRoZXIgeW91IGhhdmUgdG8gbm93IHVzZSBhcmJpdHJhcnkKPj4+IG51bWJlcnMgaW4g
RFRTIGFuZCBteSBhbnN3ZXIgd2FzOiBub3QuIEl0J3Mgc3RpbGwgdGhlIHNhbWUgYW5zd2VyLgo+
Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IEtyenlzenRvZgo+Pj4KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
