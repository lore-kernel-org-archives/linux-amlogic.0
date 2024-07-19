Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AAAC3DA49
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXLR5P17TN4n9COwswLEbUGWkVaIW1J7kqBBjShEDgM=; b=LezQ/YjzW8qE+4aZmwdPuEBxwe
	EoYidgxDiph5dSfos6ZMQwqly4zJiEVKjLcYXeTlrK/hm/5CPolpvjXK4glprsdFv/8QpVyQ6c+f7
	QfklS+2Np9vck65AGc92WLokW4gZJFy+rd2Utb+W9XCLdv6KcHYKwa5rfk3FPWqt1xZgNzqKtskHq
	fXan90xqT+B8iCdtOV/+c9xdaEQz/pe6xAbMTFf/MPJAT/HWZTVz/jdgkjGby806GMjdD3GwmwGXc
	9MOF0hKBSaoNsSWV8Tf+FN+/2+l9f4ocaR/LU5tag8+OlOIcscvh2FOwhF52jKDxSIcf6VbI5yWgq
	k2GDpx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUd36-00000001HtE-3MNw;
	Fri, 19 Jul 2024 02:08:44 +0000
Received: from mail-sgaapc01on20720.outbound.protection.outlook.com ([2a01:111:f400:feab::720] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUd2j-00000001Hj0-2sVh;
	Fri, 19 Jul 2024 02:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob6BswHoZ/5mJmJMBPl0yiDDe5hTX9EoOKl+FoydcNHfSBrb1x4dqkdhv//fED27C9RSENXcZa0EcgHJsCcwT0v3Ljf0Js8ItzQKhgnqRLU8QWqluqd5PoJDHz3pJEQkxZlc5prd9Xzg2spHem3UNA1Vg6fppKlxtGdj+RrNIhzXmVW1ZS9XTMFLhdWzAIGT8a7h5u9tkIMfsr1/HplsGd+BOSdakFW+eDzkWWzG0VzE/CU15yq7AnS4z7jhoQXZlyDR03qvkr7SK1+e8bFYbi2arnhx7z5vQGMwJL6VUY5spJZHIeLvdoA+gGCakBSmQEd/ofYl3TBklfdHcY4JRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj8cdGyeayehZEnN+kmCQ8Bvc4ZhMDDnLPPhPj5K1RU=;
 b=EYtFqj4YiEo/h8nO5Ic9RFP1nLHCKAZI7IClPUVrgQaeWB14WYOPc9rdaAx25PcYb/zRDuKthA5P+k/2Vnjy9ekg+VtPO1NkabCgpyg+wOD0t4dbSwadJpjuIGnc8naf0CmR6lWMF8J4oj0Z7CE+6eWbv2t/+s4PJE6T/2tf9iJMoqqOx9ykf0AzDc4X7+Shj+ZrwT9iyWXzvKfI9VjT1refPZnTaAnAoQo/37JAKJMFNqqF91sj6x+TRjy1+7JBrICioa0C3lKm4Uk1e48DmbTaGOXojdVPxCzsHyYELBqBP56HIkZ8Qua3HXHFrZPn/K76sIxArMFwdCXyQBFvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj8cdGyeayehZEnN+kmCQ8Bvc4ZhMDDnLPPhPj5K1RU=;
 b=XPIt38QYWgMrOMuLsIE8CUkVKK+DUvGQtTiQKG6oa2dwZccDXavMd8sDduJ6Wqb9fFyHR15yLOuydCgH63QpZfQ7FhV/X5yDDdvvPnpoFX74hiTBB75sy/U8Uba/BfGfK6hN9354aTFsRBROT/JXrCo7ApVYAmd5uiPMlH81rDY0VTa1lNZoXAATFkwNtht+y88FhEDDhNhONve5pEhv6RheoDOFXiu51g8MoGm4OLP9ID0N3VVAZpjM52AZ0ZHNtiI0YgvAMMm51otI0NIGHJvvLBDJkhEQy6Hd7ruAG3tBRMQuGv3hmCgsIRGTiSi/qsiD987fq9Ggq2rY+FFKiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6434.apcprd03.prod.outlook.com (2603:1096:101:3e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 02:08:02 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 02:08:02 +0000
Message-ID: <2511abaa-f2fc-43d7-aed7-77cd3481cce2@amlogic.com>
Date: Fri, 19 Jul 2024 10:07:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs.
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
 <20240715-soc_info-v2-1-3836c8cc27a5@amlogic.com>
 <20240715-override-blustery-e6763fddf3c4@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20240715-override-blustery-e6763fddf3c4@spud>
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfe1d23-1642-4b78-aa9c-08dca7979e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTJyOVdZMHZ4VHoweE5hZllDY3BIcDdoQm9UMklMcGNTWmlPbFp6ampYU0tI?=
 =?utf-8?B?L0dQOWlRazJ5T2NaankxVmxoa091QmpTYk1jd0QxYW8rVzF1bzI2dWVsME9w?=
 =?utf-8?B?dW9hb2dyZGpXcmE1N2lvMWN2RTFVVU5oL1RtTVpXL0lOVEpDUjBVQUpQajc1?=
 =?utf-8?B?cERuSGZ5YnZTdUtSL0k4QXdUWjRLNll6QW9RK0k5N29SYTVLWUxkR1IzaXBF?=
 =?utf-8?B?bEU5RHA3Y3kwWGtCdGkyRWQ4ZlZpTHk2RmFBWGUyQXFRK3VRQlZ2WWdUcjk1?=
 =?utf-8?B?VFc3czJFaE9aL0FqU2o2UnVVdFErM0o3M2VuemsxWThtd0dBdmY5Y1FnU1Bl?=
 =?utf-8?B?ZDEvVU9MUFJMVmc4Sm84RkdNY2xlU0wwQjA5WnJrZmhVRDJ0eWhMT3JzeUNk?=
 =?utf-8?B?S2VWRUVMVkZIdmdjRXd6VlZVc0VDa1VGUWZESGcrMlFKRDR0WWdWOUN6MWdy?=
 =?utf-8?B?TmNvQjZJUyttNHY1TDlaRWFzVlJFU3pEYTlOK1p4elVHb3ZwSGNxMEVwaWxh?=
 =?utf-8?B?U0pCdDVMU3VuQWpkQWt1bGtFdERxZmdGaDM4d1lFY2poL1ZCZ1ViNDdsbGdC?=
 =?utf-8?B?WXJHREM0SGZZdytFNzNZUC9IclRGSThnZGJwVW5Tdk1TT0JJMjgvVTl4YjNN?=
 =?utf-8?B?RXROdGlRZkZsM1BMeWhDQTUzaGREMVp6enlscmJRV254N1MvZHRWdUhidUtk?=
 =?utf-8?B?MVJsL1ZiaFlia1R6S1BFM2F2a0dvd2hSTy9WVkF4T3FrYTQrTGtKdzBJd3h3?=
 =?utf-8?B?LytpTytFaFNUbGorTzQ4cm1xVzE0T21vUE9KdUFjT0paWEVxSzFOa1RlaGl2?=
 =?utf-8?B?eC9rZUxhTDVZZmNWYllyVVgvbzhQbjlJZlFVNUxjbjlsdHNDa3hJMVFSNGh2?=
 =?utf-8?B?WUhyZ1dKWWFQc3FJTkVrU1AwUzVVL2Y3SU9SOGx3Zm90azdzMWdxTGYyam5K?=
 =?utf-8?B?a0sxRHlMcTVGWFA0RndWMUNGNVlBem1LV01jRUNxbDNsTGxab3pyWFAwV3U1?=
 =?utf-8?B?cFpVMGttWVJDY2JIVHIxT2JvNitIdnN0MEl3VVRmY0o2M3BObEJNemtWaFRh?=
 =?utf-8?B?L3FIbXdIcGJmVFhmaVZtc2cza1lQUmo2blhYRDJZZWZyQTJZUUM4cE9rckNP?=
 =?utf-8?B?UHY0NkVpOThKTDd6L2tSRlEyL1AwV3RUOWliUkFSeUV1SEZQRDlNc3l6V1V5?=
 =?utf-8?B?RTdoaVRHM2tpMWMwRTczVml1V0JkTE03MHFSc0Z5Ry9oak00RTZrdmN2SXpP?=
 =?utf-8?B?eE5jbEZGVHBYUHBWd1RKRjVoNVUvdU9iN0FJRXo4RjgyOTJEZmlpVTc3T3ow?=
 =?utf-8?B?eUtCdnVBOC9RR1BaS0pCcXpmTmVOczdKUW1PSzRsN2NLK3lUbVU1QlpOazFu?=
 =?utf-8?B?WUxqTFJIR3BvcXM2L2RhcE1pYmZDR29TczJPcGs0SFYxbVd0aGhybHlndFRB?=
 =?utf-8?B?SDQ2SXM5TmpUUDc5K3hLcm9CNVBiTnhBcVc1NmUrbnh0ZFZJSlpWMFVMSmpD?=
 =?utf-8?B?ajFYeDc5cCtMa3FZS0pxUFM2NlRCamRLSlIvQ0RqYjVrYzlKUVMzZHhqNEk4?=
 =?utf-8?B?MnhxMU1uWFpFZndCeFkybU9FVXJReG0rMFhYaldhVi9sYzlRV0ZQYkNsMXpi?=
 =?utf-8?B?RFZlVzZ2UVNobFhwdkk5Nlp5OGhUblhjNUEyMSs4Qis4S0k1Y1IveE5OZ3NS?=
 =?utf-8?B?THNMVmtJZS9lYkoyMGlIOGRQYVI2My9JWHJnUk1qeVJLY1hFbDNTZGJROTMy?=
 =?utf-8?B?RmN1T1pKU2pjRGpjaHcySEdPczQvOTgrNFZBczBkcCt0MUxVajB1N3dNSitH?=
 =?utf-8?B?akxiNGhmWktPYS9zVWRTQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29DcUlXL1hodmJPaWVkWjMxYTFYN2FtZkFyNFQzMFU5Mk8vOXVtREY0dFhw?=
 =?utf-8?B?SEw3RnUvRkIwckN2dlEzV2pNclFMaHM1bUlBN08zY3VBaW56dHBNcnZKL2Nx?=
 =?utf-8?B?RldneGJwYkV0YUs4YjEwVktsQUlRQkpIQytKQnkyV1NkOWVobGFlWjdEU1Zv?=
 =?utf-8?B?V3lLWm5WbTFmRnpNWWxGZXBnUXZRYStWdU1JNzgveWhxU05KTjd3Vm5SSkUw?=
 =?utf-8?B?SlhpUUZsWjhyd3ZVczQ5cy9kcGU3Z0xnN0Uyd3RNbXBUZE5zZmRoclV2dXAr?=
 =?utf-8?B?RUQyY1ljN083dUl4YWZVYTcycklaVDI2NkRnQjRTeG00QXE3bGdPLzJRbU4y?=
 =?utf-8?B?WWUrUHdaZUtrM2ZqWGdvT09zc2FvOVZzd2RSclB5cEZRdU1seXdYQWsrQ0Fs?=
 =?utf-8?B?eld2VjVyRk5Bd0hDaHljczFQM1RTb1dnWDF5ZGRMMnFCUXJROUpGc29rL2Vo?=
 =?utf-8?B?MjRsY2dzazdyek5pS1plY2Q4a1Q1S1V5YlV2bzN3K3FYcnlOcmtpUFdsaUhE?=
 =?utf-8?B?NXF4YVhKc2w5L09kOTBid0xZWUhtL3lMaFlpRkplbWIzZ0o0YXB1aE9zYzVp?=
 =?utf-8?B?YlBNaFpwNmNhTGZYSGhwcDVoR2x0MGtycHNnZjMxQlVETHhCZjNsTGUzYXRR?=
 =?utf-8?B?bjRFZzgrcjR0ODJoSHlZay9BK0l0SlBZekF1dEhJWm1xVkR1Zk1ra05Fb3Ix?=
 =?utf-8?B?WjJONXc3bm9nS0RaMFl4bmRtdDJIbE1Kc1Erb0h0RnpIVGVndHJXcHJkMXQ5?=
 =?utf-8?B?SFVqU3RBQ2ZTZ2hsV1I3RFcrV1k5SWNFUGhYUjMvUWFmT0NoS21xeHdlbUt4?=
 =?utf-8?B?dE5vZkltSTY5KzRmNnVxMmlKRGU5blZFdHpHNFJQZXdMeExabkpwTExEcGs3?=
 =?utf-8?B?SXJqbENqcUQwMG1zTjNUR3RrenRvUUkzbDhRakVVVTRDNnZhdHhJMnN5cHA0?=
 =?utf-8?B?azluaTFtRzVsZDBVU0pjZTYrb1U4OXk5RUtxS3NzWnkwVzk4UWR0N3dtVUFp?=
 =?utf-8?B?V2JRdDI4ZWRxRllyWW5CVXgzQnhCcUgvdXpqSFFuRnFGSnc2WDQxWlJZS3Bi?=
 =?utf-8?B?YXpJN2FUaTNFSWVrQ0R3eHQ2OGNRdGxDNExLV1FlYUhCZmo0SFJqUGkxc2ZJ?=
 =?utf-8?B?K1N2YkE0R0NyL0ZvTHIrMTZBMGxzT3RPUy9FSjhPOE9adzA1ZVZCOGpHSVRt?=
 =?utf-8?B?RFFxMmZBZ2w0blFsTkJqTkhOVEtlQnFHUXRqQjNKRFllMTBRdG1tN21EbG1X?=
 =?utf-8?B?U20yb2gwNDI2WEZvWlIvV1cxbkpKV1ljdjgwYnJmUE44S3dnaGYxTElWTHZR?=
 =?utf-8?B?MFRvdC9GWTdPYzlBdmZzU25PYnRTa3RHQVlMZkk3VkhNcVZJd0pVTnJISTgr?=
 =?utf-8?B?RFcvNHh3OFJ6RG9LVzNKNC9FalRBTjVpSk5sSjc3RnlXZUg4bWNuNHZmaFEz?=
 =?utf-8?B?N3hFVzE2SmlsSE1TYkRIWlN1SjFkNWdZenNrV2EzR1FvUWdqSUtEdlIrNW02?=
 =?utf-8?B?Y2RXMmh5clpoeEpnMlJQbnFTKy9PNGlWUkhzbWJBQXM2VUh2VUVlc3BxSWQv?=
 =?utf-8?B?blJOcCs2NWhlQjJCUnRUVzFnZDgxeHZMQ2hsYno1dWJJb0dkOCt1ZHBwMVVW?=
 =?utf-8?B?YnJqbEl6OEo2S0IzemtPWVR0U1Jacm9Sc29zMzNTekYyUWVpM1haSld4aElo?=
 =?utf-8?B?M1hnUnBjRThZcVluZWsrenVkM0t6Z2pONzNxY3BsSjhPcXlPYzBxb2dBRGg1?=
 =?utf-8?B?OUhOcHZ5aDE2RzRnTFU2dkZlU3RhZjh6Q0NUV05UZFlXdzc1L09WbXBRYXlq?=
 =?utf-8?B?Y1VtWkRNN2lTVk9RNXhaNFd2MUxrVG94YXFQbnpZbGxIUzdXVWJ2bU0vVW41?=
 =?utf-8?B?TzRsS1pVOE5MSSsrTG9aMDRadS9Nb3c5dmFLSVd3ZGxxbm16UXlINmZGZU1W?=
 =?utf-8?B?bksxS0g4MWVPWXFTU1NnMFM2T0VQbG9SV1BtVDdmSXZKWFRlZmZIUjd2UWti?=
 =?utf-8?B?V0xIMWxRTUl2K0xZb2h1b1lIR215TDZUSTlGVzIyWHo2T0lFRnlmUlRFVmJz?=
 =?utf-8?B?alBobFQ5LzBicm9ONnBjNlBwZStNRWlMZDljU0lmRURIbHRiZGhncWRNc3lG?=
 =?utf-8?B?TDI1RS94VU82SlhjRkVzdkRKdzRNZVFWVE5OY245VEM3cFdmK0FTYWpybFBY?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfe1d23-1642-4b78-aa9c-08dca7979e97
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 02:08:02.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2J4BUG5wiK6TJMxTPXQaeg/MRo96tIdh9TrYvfcSoZnx+cOXS7c5ltiG6/4WfqOJlTIJVCWkEsDsVzoTYcZ/rmSIgnb6C8cEqg6Fr0jj/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_190821_770601_3034C548 
X-CRM114-Status: UNSURE (   4.60  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Conor,
     Thanks for your reply. I will fix it to "Add compatible for....." 
in next version.

On 2024/7/16 00:10, Conor Dooley wrote:
> [ EXTERNAL EMAIL ]

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
