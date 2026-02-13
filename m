Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3E7EF48E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mufAD5W/JM5KSzOU/d1jo160JgKyo7Fh3HxuMRfL2O4=; b=s4STlGwH7bSJFdQ9Sn16Z5Ngxt
	8CLcAovXXqShjyPYczL7RvdhYS9jBZESR+3N48hb7X9IsGSkXTDmyhJE0jw/1VaE22wl4Ei4fpdAT
	CVXGOf/qze84dosiHdw8RlUhj7c2P+CHw/olV21hTnTjRZwepLTHmrbzHzy0P7VMqilVcR/wDeWKX
	qIqKLAYe9z3j4GrONnUdN5u1JsHx3mpaNYSDhOOieol1uDKn6mKLWnuL7PCAKy1Cq0bHZwer3uZu0
	25hrPFCx6oGbdgxozQOhFDlaOxsuIybDhvr3sB0wDfGpimO8yBV6BdVTkANjM6VIKd7MK18CNd5x8
	ASSo5SdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoaf-00000003Be3-1pYq;
	Fri, 13 Feb 2026 08:31:53 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoaa-00000003BdE-3lKm;
	Fri, 13 Feb 2026 08:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxSErRfg2MBb0q9sPEQ5YQwtm6Pm0E7ZTWxrCem19ASkEihMNPlVZb/PZl4CC7/iOnaToQ6VcTY3pBQKpJJYDwnW3gtCt7Dy1gdTRk50cVltxEgu8/47e+roULcPTras8S8l6J7SCuE3RMKH5jZSbblP14+Xt39U6D9u47hdrs+iIHZ3GofplLhGfdwB081xV6RQSuhM6RxatL6AEQRCqWLULmbDg0uPwmnBiqjJ0pHxb8a5UL/Pc1JumC6adkd77aRwSwraavZq3XJ5VSS4g6nC/WmgQ6m9nJvFnndxscSU+jKgoYLa2CCbxxbqsudSd0jTo35W5tEGYFBjPOxMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VriMFsqf9aneVXOeCM5JkkAlc2W4z1x5I8D9d7ey86I=;
 b=aCz3QfpN65Ra90f4QmoKBkODMGuvwQ2qmZCLvzAbxQL/JwzMupMQxB9B5N41TZcI88kDfJtwtZHVnerNE88MUSxk8SaODjky8noWgx1ECJN+27JRultu6sETkW+3lFjZtpBForu0/lDv8gik9Uzk3sqJl671qNd1DFJ5ug/pkTCIFSSzrtQ4epL7DqYh3Ujt2e1BrQGRuNCy7GhLWKkeVz+hZ+Bc7QKz4tcNFCh6vpc9EClk3oBK0WKuIT39JH79TPK0/NwQsmLHzWeyvqviSfEeXUChTuezRBAAe9efVFR1e0NuVR94EvCCcaxXHEg1A2VmEUNM5CQf5HFYFtq0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VriMFsqf9aneVXOeCM5JkkAlc2W4z1x5I8D9d7ey86I=;
 b=E6jgzo3c6MZDd6MIXmieaycdwT3vcCOVfCS71FugEFzMtWJ2jSZ5P6uVmMqCeeTRhj1cA0wVgfLF/rpn0Hdt33JmxcJBBoLZZdf246rtKt/OkafXYK20iPeBJSahM8t4KDenNPa4S42DW46vPQVSKlTLvTx5Yeu7h2MErkmkXRPjzPje76ISvo7luXI/JfS7MgpijCWUzY7QG9AheUki+Xa4WKsUxDmxMMXthb6MjssDzE56LQ97QfvdCBYLzmvGMhl7T8ehzXndg3phI8PSghHN8FwySWVQO/XenV8QVwQ/kj0WOCjzF1E5TAY48uFAiOx7LI8LBO6d6fDydGep4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI2PR03MB6758.apcprd03.prod.outlook.com (2603:1096:4:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:31:43 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:31:43 +0000
Message-ID: <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
Date: Fri, 13 Feb 2026 16:31:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI2PR03MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042d115-a77b-4904-cd5b-08de6ada517d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGZBeHRpV0dYSGY5QUwxZkcvUTMrU2wweXVMbzNDQmt3WFZiY0prZ3p1bTFJ?=
 =?utf-8?B?V1paUTdxMFVnUHdyRFFiQWVDNU8wZi93MWEwYXRQRTNSbHI1OC81MFBvSGhR?=
 =?utf-8?B?dDBNbTFlNzRLSGdzKzVLZU51TWs3clZ4QzdqL1IwQkRnVWw2NFhsak8vSlBJ?=
 =?utf-8?B?aG40SE5vby9NNzIzUzMwZjErT3NWWlZCc1ZwK0NKM3J3eHJkbUloblRBMU44?=
 =?utf-8?B?dmw5UnNXeFNRNFQyKytvUUtZYzA5Y1oxRnJwcnJOS0ZwbklDUGoxMEt3TmNX?=
 =?utf-8?B?V2U1ZG55em5kbHpHNGo0TlhPZHRaMUoxT3QyZWFZMDZHa0hKdExtM1RRb1B6?=
 =?utf-8?B?QmZTR2psQlI3ZndzSjBpL0plaTdGZTd3dTd3WXhNVlB1TXZQR3RJTmZ6aXZT?=
 =?utf-8?B?ZnZzOUc5T05pNlV0clN5cEZvSTRLK0U0UHhXWWdKc3Y0WlNzSE9YVWJsc0RC?=
 =?utf-8?B?VGlPNk5FU2NrQ3p4VnJDWlEvL2NrVlQ4WEx1K3h5UCtzNFhFYVFMdEtGVnNH?=
 =?utf-8?B?dFl4cDU2Z3FHTjFUU3ZYUmpCeEF1ZDVvTnRBRitsUjRtTzhhUkMwUUIzRlNo?=
 =?utf-8?B?Q2RHR0lqZmRBR3UxUHFtNFdZaDBFZ0MzL0xCOXFWOThqUHpUc3lHZzJqZU9E?=
 =?utf-8?B?TkhyVCsrSjBscnZ5NzFvV2lwSkR2YVRCUG93dFVrTjNFbVAyTXAyeDlJUllU?=
 =?utf-8?B?RUJOaVl1T2VVZkJlay9jWEhVMEhkbU1ta2NuVG14NE1NZXFDVFpyVGtrdW9D?=
 =?utf-8?B?cjlxTFlHd2N3YVpDaHBYSlRBL29GcDJXMXZvR0R0Y3RxUG1IYXl2REtWbW5m?=
 =?utf-8?B?WlB2MXN6U09vT2ZRUnVjZ05nTGpycDNndXgvOTJ6NWlsSjVWZ1JwUkx2Z0hO?=
 =?utf-8?B?SEhTQmVNNldnUHVrMElnQXprcjZOU3hnbmxRWXNlaHV3U2VNWHdnQXp4SGVB?=
 =?utf-8?B?NVN4MGNXZGUrOTg5eDV1KzRKYTB3R1JhNGFrWTBKRWJUMWZ6Nkc5cGdJbndG?=
 =?utf-8?B?NFh1T3B5amgyZ3ZhVHV0dEprcG15SlNoeGNxNTBrdFRjM3d0RXp5MzFXTFA4?=
 =?utf-8?B?c0lMQTRaNVlsTWsrWnZoSnJEVlBEWFM0c0x4WHRaQWxyRjdUdTdPTklkcm1a?=
 =?utf-8?B?MUJPYUVEd2xlaythQVp0SjRjOWFUckdCQlRMY0dlYVNJTEtkeTFyMGhDNmov?=
 =?utf-8?B?dndMM1hTalhadHcrV1FGUTc0T2d2VU5sMnd0N3hVZUtOMXdmamNVaU9tRkt6?=
 =?utf-8?B?WlpGWEV2WHd0d29oazVTVHlOdXdQUDVkM09JcUNCK1FWREQ1SEJmWVRINVI4?=
 =?utf-8?B?S1pGdG1XVXp1L0FpMzAzaUZ4U0NZVFBnb0phV2YxaDEvWXJRMkVGZ1VnSnR2?=
 =?utf-8?B?RHVRc2pjTy9keHBlU1hDTmg0eUVTRWdHNC9JYithVUUzSDltRlVIbjhTRXpq?=
 =?utf-8?B?REpGR0grQVVBbTlYRFZOMElFcnR0aHFVRnJHNDYrUW84V2orcFVVQXVySDVP?=
 =?utf-8?B?TnBhUXpjWWxZUUlwSHJPcjUvUk5NMWE3R0gySTQzV3VvRHJDQ2wvUy9Xdmo1?=
 =?utf-8?B?YWVQUExhTjlpSitTdzF6dGZEN00xS1c5VC91RTNtUHMrTnZYL093cVRUSHFC?=
 =?utf-8?B?ZWFwWGUzNTFoOFlZSzZRQTBKc1dsQ2p5U3dXYmdnajBGczh2dGZES0t2Sm40?=
 =?utf-8?B?ZXVtWFRKeHRuYk9Ba29OcjRJbGlUdDZhVnVRaU5jWlBZb3kxTVQ1S2JMK0xq?=
 =?utf-8?B?UWZ2RTRKalFRNmRsT3pwd2orUDh1eTcxejFQVmFuajdXc2xuMldqcVJDblp2?=
 =?utf-8?B?ZW1iakpIVTZtakhLN2ZsL0JyM1pINjRsTGRjL2N0TENHb2pXcVBlaEZ2MGdO?=
 =?utf-8?B?VFQ4MXVBbitJV3lQaEp4VXdlaGlxeUM1aHN4eWxpZmVoYlFrbVljckpmRnlk?=
 =?utf-8?B?SlJYSWQ4bi9Db05XNFVlQk94WUR3QmdTUHkrdklVaVRzajVnQmVkclEycXlw?=
 =?utf-8?B?b2VqSDUzYVNjZHNSQXRQN2plb3FxMnNKVXJaTGtHYlpqKzM5R0Mvc2UrRktK?=
 =?utf-8?B?bi9Pdi9oTFZkL2Fjc1NFZ3lOdkpjcllSaThCUEZodkl4QUVnTmNveTFKYzNy?=
 =?utf-8?Q?PGoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZNVTBEOTIzMC9PZXRYd0IzVjBFOUY0S21UNG9mMWlPeWVIeUdSN3pFMk1v?=
 =?utf-8?B?OWMrZUM5MWVRUzQyNTJhRnhPVmZ4SzJJNFF3VnNmVnNlQTgybnVEVGlmdTB4?=
 =?utf-8?B?cTVmUEZtdC93TmxBQ2p5Ui9oY1JJM2h2MUUwT0k5RVc5UXdHN1pPNHREbHJL?=
 =?utf-8?B?c3UrWm1JbEQ0L0JSQzRwaGNjRXZLeTFiRmRrTFFlQlRIWWpjRGJaTEtqVTZX?=
 =?utf-8?B?ayt0a0JVaW5PZWFSWmR0NUE1aU9FZFNVYnRzRXU2M0ZMRGs2VXllS1dYbUdE?=
 =?utf-8?B?RjVMV2VIT2dOK0Q0VWFseVAvY2JRSWVJTldZMTRHOVIyT293TEU3eTdhYU9H?=
 =?utf-8?B?OUtGSDJtNWFqUEszRHdKNDdleWw0V3BhMThPQVBJUGtZanoyR1I1T1hibEto?=
 =?utf-8?B?TllxdmZOaGZHdnNGWFhnRUQyMWQzRlAxQzJaVTZHSjA1Y0xBeDkzQXlCbC9H?=
 =?utf-8?B?T1FBcUN0ZXNGR0dDa3p6bjRDYzdBcGJsZVZDMWc2enFoN0o0RGFRRzJCdzAv?=
 =?utf-8?B?L25jb292WVFtdUNFRGtyVzhoNjdNVk94cjVVbnpxVXkyZDlZODVIWTU4VjNw?=
 =?utf-8?B?MENOclVQVFE5SkxLcXR5ZEFoQ01naGJXVnZvK2JyazR0b0tqL1hJRU8zZDNs?=
 =?utf-8?B?V1NvYzRLeWwzRDJ1SmdLSTZqbWNmVm13WE1qUlhlRDlkN2RGY3dtbTRsamJV?=
 =?utf-8?B?SmZKSVFPQUIwOEY2V2o4akFvL2loUEJVVUlJTy9sRE5ibFA0b3JqYW9MQ3FD?=
 =?utf-8?B?aE1MdkdyQk5DaDhPYjZXQTNNUUN0ZytGMUpzM3lwS0JpZVZUakc3NHdZK1h6?=
 =?utf-8?B?b3pJVG1oNWU4a1VBZ3FWR0RReFRkQ0U1OGh4QmRuUVRiZDE0bG5TZzdrTDN0?=
 =?utf-8?B?THFLMDZVbFNhSUVHd1RRcWFoS2ZJVUxQcjM2cnM4SklvbExDbzBpdWs3dHhn?=
 =?utf-8?B?cU9ZdE12eDBZZ25sU0VibXFQbXMrSVJyQXlxQ3IzMG9YMlZEMy93TFVBeTA4?=
 =?utf-8?B?UVIxR3ZmZXZGMFdtOXA0RXhRdFhnNmtHcWtKMmN0VjhoUHBCNlBtbWJxdGJw?=
 =?utf-8?B?dEp6OUpwV1k1Y3BwZ0EvaUlvWEtJbHBxT0QzL2RmUW5MNU51NDhnVHJ4Ym15?=
 =?utf-8?B?MlU5bVRvQk5OYTR6OGZNOUIzOEMrbTk3S00vODRiQjJIc3NYVFlFOWVEZmdp?=
 =?utf-8?B?b2wxRUl6QkFhOEI2T0F3cTZwdmdXZHZQdy8rYUxoVEQ5T2tSM2VnYStWU2lk?=
 =?utf-8?B?K3RUQmNOWWx6R0twMkp6ZnJ3OFJVKzdVWmlhU2d6OWpnQko5cENhQ3NyeEJO?=
 =?utf-8?B?ejB5TU5ZeVVQbTNiSzFqQkppT2Y2L3hlNjhpSGt1ZG1EckZwVXg5SWdOUm5R?=
 =?utf-8?B?R2N3YVBKQnN1ZitacURTU043TXI4VmFGQkY5RkdIYWJoY0l5U2oyWjJXTlRj?=
 =?utf-8?B?U1Q5SERkVnM1K2tyejZaVWJvblZPellNa1NwKzdES3oxcXBkRlkyQklBcWgx?=
 =?utf-8?B?blB5REk4a3JaOHA0dTlONEN2NnBmT3g2STFYbTFnSVJkcXFlUk1NdGNaN3BT?=
 =?utf-8?B?WFV2RW5HSDJSdmFmVk9qWlVTWFJkL1JnbHdEZ3cwck1sYkhldVk4Z2NCUENG?=
 =?utf-8?B?ZW4wNCtrZURwL25pUHlYOTc1bDgxWjZTeFFpZlZId1duM21JeStVVEpTb2N4?=
 =?utf-8?B?V2w1VVg4NDBtOGFTZGo2T2NOOWh5UVU5N1FJNU53Qjc5RUJrV2IxUDgwY3ZG?=
 =?utf-8?B?NTc2NUY2UDJvcXR4QW42NHFKVENzcjFhSzRseTRBT0ZwNWlNQ0pDVzk1SE9D?=
 =?utf-8?B?cDc1bHpSNzk3NVd6R1U0VFhSbFZNYVI5KzdHOUl1OW9Ib3U2U3lpcS81K3Qv?=
 =?utf-8?B?ZUllT0RKRWM4SlJOMFl2eHFYaUppQmU0MWo1RGpvd2h1bUV1ZnpqUmtZM1Fs?=
 =?utf-8?B?RFQ4a2NJTXpzc1RpSXRJMUhncW42cGozM2RMUmdsd1JVQUdSWUl0a2E0WUQy?=
 =?utf-8?B?NkQ3R0k5ZVNib0xBbkhDR1N1VnpiM2lIZWdhUk5vMUsxajdjYk9Sb3hqeFRa?=
 =?utf-8?B?bXlydlB1NERaK3FnU01seFFOYjl0UmdLOWZ1Y2MvRHYxNDFCbE92NkdHS3dw?=
 =?utf-8?B?dU5NbU1xV2k0YU43alNyMnM0WTVTMUJuZ3VqbHVqS25GMTBES1JEbktWbmhR?=
 =?utf-8?B?MDlVdExTUnJkYUphV0hjMXVRcUlhcWhSQ0U4ZnBhNnFxbkt5TERmc0F3NWNr?=
 =?utf-8?B?akRDVzhuVXdOVktOUlIrbEJYemlSLzBoUElNaE9Kc0VJdmxpVGhHUS9FaHFa?=
 =?utf-8?B?c3JKdm13NHhTeVkxdnJobWtoeGZYcnBvNHY1UGFRVlMxU3I1Qmtwdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042d115-a77b-4904-cd5b-08de6ada517d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:31:43.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dWl8tZKTT1bKfDutGhb+a/nmguLCIIS8GcZGTca97lN/w11jgCXdq16HcVP4MtfzQCCIPmz8Lyt68+BmkZ2hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_003148_942795_27B43F00 
X-CRM114-Status: GOOD (  15.32  )
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

SGkgS3J6eXN6dG9mLAoK5ZyoIDIwMjYvMi8xMyAxNjoxNiwgS3J6eXN6dG9mIEtvemxvd3NraSDl
hpnpgZM6Cj4gT24gMTMvMDIvMjAyNiAwOTowMiwgWmhlbnRhbyBHdW8gd3JvdGU6Cj4+IEhpIEty
enlzenRvZiwKPj4KPj4KPj4g5ZyoIDIwMjYvMi8xMyAxNTozNSwgS3J6eXN6dG9mIEtvemxvd3Nr
aSDlhpnpgZM6Cj4+Cj4+Cj4+IE9uIDEzLzAyLzIwMjYgMDY6MTIsIFpoZW50YW8gR3VvIHZpYSBC
NCBSZWxheSB3cm90ZToKPj4+PiBGcm9tOiBaaGVudGFvIEd1bzx6aGVudGFvLmd1b0BhbWxvZ2lj
LmNvbT4KPj4+Pgo+Pj4+IERlc2NyaWJlIHRoZSBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBWNEwy
IHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyCj4+Pj4gZHJpdmVyIHVzZWQgd2l0aCB0aGUgQW1sb2dp
YyBTNCAoUzgwNVgyKSBwbGF0Zm9ybS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoZW50YW8g
R3VvPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIC4uLi9iaW5kaW5n
cy9tZWRpYS9hbWxvZ2ljLHM0LXZjb2RlYy1kZWMueWFtbCAgICAgIHwgOTYgKysrKysrKysrKysr
KysrKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspCj4+Pj4K
Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2FtbG9naWMsczQtdmNvZGVjLWRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmNvZGVjLWRlYy55YW1sCj4+Pj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjg4NzgwNTE0ZDA2Ywo+Pj4+IC0tLSAv
ZGV2L251bGwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwKPj4+PiBAQCAtMCwwICsxLDk2IEBACj4+Pj4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KQo+Pj4+ICsjIENvcHlyaWdodCAoQykgMjAyNSBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVz
ZXJ2ZWQKPj4+PiArJVlBTUwgMS4yCj4+Pj4gKy0tLQo+Pj4+ICskaWQ6aHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwjCj4+Pj4gKyRz
Y2hlbWE6aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4g
Kwo+Pj4+ICt0aXRsZTogQW1sb2dpYyBWaWRlbyBEZWNvZGUgQWNjZWxlcmF0b3IKPj4+PiArCj4+
Pj4gK21haW50YWluZXJzOgo+Pj4+ICsgIC0gWmhlbnRhbyBHdW88emhlbnRhby5ndW9AYW1sb2dp
Yy5jb20+Cj4+Pj4gKwo+Pj4+ICtkZXNjcmlwdGlvbjoKPj4+PiArICBUaGUgVmlkZW8gRGVjb2Rl
ciBBY2NlbGVyYXRvciBwcmVzZW50IG9uIEFtbG9naWMgU09Dcy4KPj4+PiArICBJdCBzdXBwb3J0
cyBzdGF0ZWxlc3MgaDI2NCBkZWNvZGluZy4KPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4g
KyAgY29tcGF0aWJsZToKPj4+PiArICAgIGNvbnN0OiBhbWxvZ2ljLHM0LXZjb2RlYy1kZWMKPj4+
IFdoeSBkbyB5b3UgcmVwZWF0ICJkZWMiIHR3aWNlPyBjb2RlYyBtZWFucyBkZWNvZGVyLCBzbyB3
aGF0IGlzIHRoZSBsYXN0Cj4+PiAiZGVjIiBhYm91dD8KPj4gSW4gZmFjdCwgY29kZWMgbWVhbnMg
ZW5jb2RlcitkZWNvZGVyLCBhbmQgZGVjIGlzIHNob3J0IGZvciBkZWNvZGVyLgo+IFllcywgdGhh
dCdzIHdoYXQgSSBtZWFudCwgc28gd2h5IGRvIHlvdSByZXBlYXQgZGVjb2Rlcj8KU2luY2UgdGhp
cyBwYXRjaCBvbmx5IGludm9sdmVzIHRoZSBkZWNvZGVyLCB3ZSB3YW50IHRvIGhpZ2hsaWdodCB0
aGUgCmRlY29kZXIuIFdl4oCZbGwgY29uc2lkZXIgYSBuZXcgbm9kZSBuYW1lLCB0aGUgY3VycmVu
dCBvbmUgaXMgaW5kZWVkIApyZWR1bmRhbnQuCj4+Pj4gKwo+Pj4+ICsgIHJlZzoKPj4+PiArICAg
IG1heEl0ZW1zOiAyCj4+Pj4gKwo+Pj4+ICsgIHJlZy1uYW1lczoKPj4+PiArICAgIGl0ZW1zOgo+
Pj4+ICsgICAgICAtIGNvbnN0OiBkb3MKPj4+PiArICAgICAgLSBjb25zdDogZG1jCj4+Pj4gKwo+
Pj4+ICsgIGludGVycnVwdHM6Cj4+Pj4gKyAgICBtYXhJdGVtczogMwo+Pj4+ICsKPj4+PiArICBj
bG9ja3M6Cj4+Pj4gKyAgICBtYXhJdGVtczogMwo+Pj4+ICsKPj4+PiArICBjbG9jay1uYW1lczoK
Pj4+PiArICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAtIGNvbnN0OiB2ZGVjCj4+Pj4gKyAgICAgIC0g
Y29uc3Q6IGNsa192ZGVjX211eAo+Pj4+ICsgICAgICAtIGNvbnN0OiBjbGtfaGV2Y2ZfbXV4Cj4+
PiBOYW1lIHRoZW0gYmFzZWQgb24gdGhlaXIgcm9sZS9uYW1lIGluIHRoaXMgZGV2aWNlLiBXaHkg
dGhpcyBkZXZpY2Ugd291bGQKPj4+IGNhcmUgdGhhdCBpdCByZWNlaXZlcyBhIG11eD8gTm90IGEg
ZGl2PyBvciBub3QgYSBnYXRlPwo+PiBPaywgcHJldmlvdXNseSB3ZSBvdmVybG9va2VkIHRoaXMu
IFdlIHdpbGwgaW1wcm92ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pj4+ICsKPj4+PiArICBw
b3dlci1kb21haW5zOgo+Pj4+ICsgICAgbWF4SXRlbXM6IDIKPj4+PiArCj4+Pj4gKyAgcG93ZXIt
ZG9tYWluLW5hbWVzOgo+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4gKyAgICAgIC0gY29uc3Q6IHZkZWMK
Pj4+PiArICAgICAgLSBjb25zdDogaGV2Ywo+Pj4+ICsKPj4+PiArICByZXNldHM6Cj4+Pj4gKyAg
ICBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArICBhbWxvZ2ljLGNhbnZhczoKPj4+PiArICAgIGRl
c2NyaXB0aW9uOiBzaG91bGQgcG9pbnQgdG8gYSBjYW52YXMgcHJvdmlkZXIgbm9kZQo+Pj4gV2h5
PyBXaGF0IGZvcj8KPj4+Cj4+PiBXaGF0IGlzIGNhbnZhcyBwcm92aWRlcj8KPj4gVGhlIGNhbnZh
cyBwcm92aWRlciBpczogZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jYW52YXMuYwo+IFdoYXQg
aXMgdGhpcyAiY2FudmFzIiBkZXZpY2UuCllvdSBjYW4gdGhpbmsgb2YgY2FudmFzIGFzIHRoZSBh
Z2VudCB0aHJvdWdoIHdoaWNoIHRoZSBkZWNvZGVyIGhhcmR3YXJlIAphY2Nlc3NlcyBERFIuCj4+
IEluIHNob3J0LCBjYW52YXMgaXMgYSBoYXJkd2FyZSBJUCBpbnNpZGUgdGhlIEFtbG9naWMgU29D
LiBUaGUgZGVjb2RlciBJUAo+PiBuZWVkcyB0byBhY2Nlc3MgRERSIHRocm91Z2ggY2FudmFzIElQ
LCBzbyB3ZSBuZWVkIHRvIHJlZmVyZW5jZSB0aGUKPiBXaHkgZGVjb2RlciBjYW5ub3QgYWNjZXNz
IEREUiBkaXJlY3RseT8KVGhlIGludGVybmFsIHRvcG9sb2d5IG9mIHRoZSBTNCBjaGlwIGlzIGRl
c2lnbmVkIHRoaXMgd2F5LCB3ZSBkb24ndCBrbm93IAp3aHkgb3VyIFZMU0kgY29sbGVhdWdlcyBk
ZXNpZ25lZCBsaWtlIHRoaXMuIEJ1dCBzaW1pbGFyIGRlc2lnbnMgaGF2ZSAKYmVlbiByZW1vdmVk
IGluIHN1YnNlcXVlbnQgY2hpcHMsIGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIHJlbHkgb24gYSAK
Y29tbW9uIGhhcmR3YXJlIElQLgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCkJScwoKWmhl
bnRhbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
