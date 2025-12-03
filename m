Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FD9D1266D
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Dec 2025 05:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvYIfY6SKPcmD3igC7lnUJYvaUw2EFpiOJ16wh2sw1w=; b=SjVVx+k/qDaeJj01rp3JSuVnmu
	12tWX9/qsSqiO5gZ7S+PtOLO8YI0HkwqO8SI9RwC6CY8VDQkLoNNal041D6tx/Ha0AWqaVJpIxr8y
	z+zdzMVLH+cbqRZqSpcOTPdwm9odenVJcNKZmOcCkdIjzGHEb5iRngd6P8ULliDOo5UhBlhWw3VpJ
	W86D51CGdkK+GUYWyP3ZgMYIFT0fXzKP3yLkJXxbky/gRWEUDGPPHzEawXby5ZYcSkf9tUxM0aATK
	K+14orZuxS+pd73GQkiB8URZVy8CAKrV5EfWL65ggjQh7HVX1ZyJ9TpSvbb09mIlaQUc8ulll5fgG
	roBfdZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfqv-000000069bt-0fdO;
	Wed, 03 Dec 2025 05:56:37 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfqs-000000069b5-25mJ;
	Wed, 03 Dec 2025 05:56:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZPY1TFVvd+axomoSNG6MANdglc6eshL4V42ORsalwVrNfj4dgTKunm8aAxaW1y8SJXGsk5og7v4n6/okEBgvYamCWW3SSiaG/+8mRDDSQV/YOXitYApLPlD27XU2TdhStLM3S6EAUa23+kTsNeQpV4t5+WZbMMsZ8od1C+lkxovgKLB6siCjUnZtCvULohAfNK5eGa49rbjApjF4PPDHLkjsjK/CXN7gPLcnbr1sLuaIcLbuS7xV0M2xuM2vhVT9Y62oKMdMgtfNx5cvn3INKQSjcljVfPtT5jlkJKWzNhes1fPPxfEbwEQQRLQS69W+7AF6w8E8GV9SJ3MEGz/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRn4zCETQm4Rb/oWWWFg/WTlFsdLaejUaA04/aetPus=;
 b=gjbHLFQRpWHCLC+zPHsOe0VOKUxjNrTqQSTU2e7CLnnJMj8y1xeS/wXo8XzRfNiFCJK7nP4ezXBDAnBSeO4YC2/+mgnMFS4WdzTVCNqhCujU8dLEbo9zDFw6EoGBfvkc+6vzPuB9fbJrDwPHjHOevu9ThzH/YkgoVG+tqP+YsYCL3ytxTOVVfmCktRXsbh8q8+5HRHrByTILipMm4NwRInPV4TGxFW1hWTKs6nROKCKSZnfuNh9+ens4sI/zANOfmkzJ5/uEs6oXB1xFVsRWOFe1rr9wc3FjoUtK6UBCVizXtwMYKvslQlaaKf2diCyg41d7QsYY1hPqNecIWiRsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRn4zCETQm4Rb/oWWWFg/WTlFsdLaejUaA04/aetPus=;
 b=hd6ljuc+V2qGhNy8X0NHGKLxv/P9yf5x9RMe1ymdKkjJGontgXdP+fkDEIcSBtS+qyTbF1QqqxGFeVD1BH7Q4pFQi/Uc54/ixOYKoAkQHp9QJ5l8DQZwffKCP6tJiQa6WeXRflM5AgEpslwr8vAPHoppHVVpvhj3RXHi01vjSlmmWVn/DIaY+qrF22ij8G1SjBdJinj9xzzLywiigJiwraLwwZ19rHd/i03wKHEewNgVZ2mM8AMA6kmxkUeMdObqvNngpAklW2PnoqtqMHjb3f+l5ao1GX1rRYtN+VE8vy+Xn0tuaYC5H6VJBn/JWiMMr42HoUOmWtAJB8Jonlwj0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by TYSPR03MB8446.apcprd03.prod.outlook.com (2603:1096:405:60::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 05:56:20 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%4]) with mapi id 15.20.9343.011; Wed, 3 Dec 2025
 05:56:20 +0000
Message-ID: <070eb0a3-2f6e-41ef-8310-0c592a2816dc@amlogic.com>
Date: Wed, 3 Dec 2025 13:56:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
 <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|TYSPR03MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: db2a618c-6a3e-43e0-f5a3-08de3230ae8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnRGenVXL3VFUXhYaFU0ZHBzaE1VWW1GUlVvY2hCZ1NHQ01IMkpZV1k4bm9n?=
 =?utf-8?B?ZTB4cHRCTFJBL0NocndvbEhvVmxGVU1nc29WcFJJUC82MlBKSVRzZ0tQdzZY?=
 =?utf-8?B?YTIxanZWV0gyOGRWN0tyWWgvc0VMUTlaOEhrc29peVV6RlRscnhmL1I5cTFy?=
 =?utf-8?B?dXFrNW1QQUhLSW8waWswSWRmWXNjZmgySUgzTnFpVndwZDIzSjBUT05XVFU0?=
 =?utf-8?B?SmRKUElRaWFQWmg0RjNZTW02UEVFSEJVSVpQL0w5NlJLaUU5eFFIbStEOHVJ?=
 =?utf-8?B?N3E4cUxuQ2psMjZsWC9qQzRaamIwWmhSUC9UdTZmQWxuM09BQ3Z0SWZ0ZVEv?=
 =?utf-8?B?c09lcFVCTEt3QzBQN2UxWENOVldhWUFkN3gzUFF2NGF0WmZ1WDJFb1YrUmZm?=
 =?utf-8?B?YW82OVpJT1pZODJDa1NwRXl1N1QwQjY3Tnk3b25xQXNoaTFWQURLZmhDTzhs?=
 =?utf-8?B?cEtPOG5iQi8zYWxmUlRhcHJzeUhyMlg3MXFiaEduRERjZko0UnJRa2tmTnYv?=
 =?utf-8?B?V3pEWGtCMEYyMFVjYk1icEF3Y0pwRFhxMnhsWGppY2lod2JBMWJSMlFYYUZW?=
 =?utf-8?B?eXdhTFNnZlV4OGpTbjJvcG9mQmlnM3NlenhFM0lHTlJTYUxmNCtFNGcrZ25D?=
 =?utf-8?B?RXgyRXJxMnlDaDdkNWpCeDA1cGEvZkxQb0kreE9aMStjZFg5dTA1Zk5DTkQ1?=
 =?utf-8?B?R09IZzduUk45M3pyRzM0RjRZSC9nOFVFbzFDMVczMUthbi80SG1ZbTRreTVX?=
 =?utf-8?B?T1FnZUhPUVlXWkh6d0h3Z0NGeEdhbklKcXgyUE51bUhNNFFUKzVod0NheGNo?=
 =?utf-8?B?b0lFZDJUYTg4ZWRKUzM5Wmd4VTZ1aWxQR3lMNmZEWmJjc2pXUFhVSjV5SjFh?=
 =?utf-8?B?YWVVcHNPSU5uZ3ZjTzBWRVUyNGg3K2ZPdk4xYjgyaTRPTW9KSEUrQWQ1bUVK?=
 =?utf-8?B?Vm9NaytEMDFXUndsT01VRTJvd3BwU25YZmVveUtZR2JhbkVpMFZaeEEwODhj?=
 =?utf-8?B?RWs3UGRqWmgxS0lZMGsyenhZdjFydnQzakttR3p6QlcrMVg4Q0ZFZTlsVWhz?=
 =?utf-8?B?d0JROWszeGo5a3R0dHYxZVFhWlNBaTJsQmFjYlE5SlUzYzJQanUxVTNoR09D?=
 =?utf-8?B?dDNnUUluSUZraTREajN2dHJJTmd4UmpjZDc1RzJKcnN4b016Ykl2dStsODJI?=
 =?utf-8?B?ODMrZFE5MlRNRjA4WGUzVDg4WGhxQk9aQ21ZYytSangxZWZ2MVM4bDlnNnJE?=
 =?utf-8?B?bEEzOThBZmxFSlA2bFMyeG9qcEVyN3ZlTTI0UHM2dU5wTEtSd0hBUnNReFNY?=
 =?utf-8?B?TXNuM2NjanZGVWtkem5zdXVkNlVlSHV4aGZvdWRaWFFGa0lXalZqeUVRQndG?=
 =?utf-8?B?YUpKNlpONUowTWU0eDNTQ3BjeTdSd082WUJuOVQ2VDdkSHEzQzhkTkV1Rk00?=
 =?utf-8?B?aW1VUEhOSTloR2F5VEpkZ2Via01rLzMvZlAzSE5ROGVnMXhlcG9oWkllOHBt?=
 =?utf-8?B?YUtKd2l2MjVuS3ZjVDV3d3V6K1RUTmNzZ3c2YTMrdzVmNVI2ZDY4bERWYXp3?=
 =?utf-8?B?N0RETGFlZlFGNld2RVc5akhJMGJuWXFaNndYaVZQelBQb0RwUFp4WFVlbUdu?=
 =?utf-8?B?ZThYTlRhUzdWVlU4TS9wWmRNQ08wa1R1Z0VHWVpTME1FYnJVMjlxWHEvTllU?=
 =?utf-8?B?WExoYmh1eGpaT0VucHFyTk1jV2JHRk9jNEExYWx1V1BXbHJzSko1dnhiU0Yx?=
 =?utf-8?B?NXFuMERqQk52dzE5ZFZnR3VzQ05RdnorUVlRR1dzZUN4N2p3em1KN0U5d015?=
 =?utf-8?B?Rm5oTXlwSzFVTHB5Z280MThURTgrSURuSVRjZjhKbFYzOHN0MjVNUnhPUVpx?=
 =?utf-8?B?WXpxZ2thTU5MSGhhWm4vOGgzWkhXRWdqZVRNWkVtYW5aaFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7155.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZTcnNBeVQ1bDRrUU5GeHBEUnlRZHlsNFZmd3dkbGVkbVZMRnh2cmVTS0dT?=
 =?utf-8?B?bEc1cmgyc2pnV2w2NkI4YVphczVTY1F3Z1JqcXg4VjIrUHF4T0krR0JweHND?=
 =?utf-8?B?eVA1VDdtZmEwWHBZM3pOYWJ2ZkloK1VGdGhjSXpwTm80c2E2SVZ2Q0pKd2Q1?=
 =?utf-8?B?V2xQa2pUR3F3K0x1UDdHRVdHbEN4eHkrN0sweWhPVjNzclExK0dWZWRtbncy?=
 =?utf-8?B?dHJxR2pGS2Nwcjd3THE5YWIxQWtjTmgySmhTTE54Z0lydGo2SHlHQkxEUkE5?=
 =?utf-8?B?NU5PSGZPWld1U09tY3BXREw2MGlMRmZyRWV6UFZwaWljZjRLN201UGovd213?=
 =?utf-8?B?Sk55QW9EUXNERzdmVHIxWHRUY2hkUk5Wbk5zdW5GTW1kaHBKb25ZKzB0bTc3?=
 =?utf-8?B?VkhoSzZzTmxkTnNteERUWStodHl1dEpxUTZJcm5Cc1N2Ri8vNCtBanBpUmZp?=
 =?utf-8?B?eEVkYWFJVUgwNi9wUHpUZjNGMmtOTzIxRjZwYUczZHRQcEQ5L1pld1VRd1pV?=
 =?utf-8?B?bzc0aTJiTkM3bFNSZlpPVUlSdTArVUxyWk9SSjBLYlcxTGRhalFOb051SmJD?=
 =?utf-8?B?ZExXUG95ekN3bVVPb0h2RVdnbVd2dnVkNkZ5bWZSUXhNRzVpTGljKzBYbmJP?=
 =?utf-8?B?ODRyMTg0NGxNM3JwUUNnU3BjdzVuL3NJRlJmL2Iwc09EZm9yQWEwd3RlZFht?=
 =?utf-8?B?bWMxa3p2WVZEa3gyT3hpVDlwMUtqd0ltRjd5UEFRU1hQeitwVEZ0eFhydjZG?=
 =?utf-8?B?OTl4dHp1QlVzT04yb3JLQUVSY2RuVlc4YThWUkJkSDVFU2NUQlF3MWNsQ0RG?=
 =?utf-8?B?aWpIRGtEK01yV0N2bER6KytOZzB0OVByTXQ4ZXRxNTEzMVkwdkhWdjhqUFc4?=
 =?utf-8?B?SnRFVXFFVEFDWEdrRktBbzJCOU81TFM0QnRvTThUT1k0aGszcy9HQytoTGZN?=
 =?utf-8?B?V0drSTYwUkpLVEFXTzU2TTAvT0R1c0hzSVBTSStsM0F3aVVhUjBDQ1NlSHh5?=
 =?utf-8?B?NzVKSG5jVTVtV0hxRVl1VzAyOE9MclcycHBiZUlPdUV6MlZ6ZTdzMW5Dd1Zj?=
 =?utf-8?B?NDlGbGxIcW9udXBQN1ZScGljbC9BZHI1NkZidGl6b1JPN0xYWUo1YTZ5bTRU?=
 =?utf-8?B?V1VzbUFNV2hWcWZiNE1IV1FJY1JyQzVKdEQ1RFF4Q2dxd3k0K3NaVmV3OHYx?=
 =?utf-8?B?bDVXMWxEdzR6K1o1UGpmZzFhRU44THAvZTd4YU8wbWlDWU1RdU1TZGVzUFRs?=
 =?utf-8?B?TUw1elZRUHpYb0IyLzJ3NDdyT1BWalhaYktIaUxhcHFaL2s4M2hUQ2hEQTlT?=
 =?utf-8?B?OWtobis4UllOTnFKYnlPZXNYc29mNG1OMGpMM2hLUm91RjU4bGlvZUJqR3h6?=
 =?utf-8?B?bVlUN2svQzBMbVZqRFpzcjkxZysyNUdlc2VWQ2p5MjlOM2dJMnZic1EzRFJz?=
 =?utf-8?B?OVBjbE1MWXlPOGVBWGtLK2drWTlzZ3Q4WUp5ZlZoYWdDdTV2YjZReHMxUmpE?=
 =?utf-8?B?UkpaVWQrWkcwQzNmK1FLMkQ2U2ZrWWwzN0ROa1JRSUJsUW4rV2VTKzRyVktU?=
 =?utf-8?B?eWdIN2R2SXRBRTlVeXhRZE45VVNGMHE1S2k1SWpwVmZMZ1FBRDBEMFpBK0dF?=
 =?utf-8?B?ajNtc2Z4eGx1YVVteUdhSHlGQTJFb3F4VkZ1RExoYjRXVFJMZURnTVpLd29Z?=
 =?utf-8?B?WWNtc2ljWnJ2U045SkhoN1YvcWNGZ081aHNHaG04cGJqeEhhK2l3bDI4OGdO?=
 =?utf-8?B?cTJ5aXFxeTVpYURrUUt3ZFl1VnBHMjdZbnpicGdpUzhUYzRvc2tnTm0ybXBn?=
 =?utf-8?B?TWNaeTduNFk3RmpNb1FMRzVMTTBRZ0xJR0tuZi9QbE50Zk04ZVYxOHFyUWdw?=
 =?utf-8?B?b1pkWmsxUXRwQTNtVWE3UTFXakxweG1BL09wK2pJSkdIb0puSmN5dVljNTVj?=
 =?utf-8?B?LzROR3FwakJPdk1PZzk4T2U2RVVpNmVFQVhpTWM3TDVSME5SamJ0VjNQQkl6?=
 =?utf-8?B?NGFKc1VSTFh2Q0VGS2JyTkVqcUZJYnRBbHdHdS9SQWpRbTFFZ2xuZnVKaHhs?=
 =?utf-8?B?ZkJKTmIySEJKeXZMbng4WHJ0eUFhb2pCd0M2YjJVQzJYdEJ5enB0emM2Vitp?=
 =?utf-8?Q?uV59gNFeEt7csP6m7ytQ/KaKY?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2a618c-6a3e-43e0-f5a3-08de3230ae8b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:56:20.4635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NZODBmQlp8VJ1H4xFWl3x+kHB8FQIcQAdMK/G9vlEGIx89XNAZfdJ3cKpFseh/X+2+Ciim0vBGvLTdhKG91hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_215634_666705_09E35DA3 
X-CRM114-Status: GOOD (  16.75  )
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

SGkgUGlvdHLvvIwKCiAgICAgSSB3aWxsIG5lZWQgYWJvdXQgdHdvIG1vcmUgZGF5cyB0byBsb29r
IGludG8gaXQuIEkgd2lsbCBmb2xsb3cgdXAgd2l0aCB5b3UgQVNBUC4KCgrlnKggMjAyNS8xMi8y
IDE2OjI5LCBQaW90ciBPbmlzemN6dWsg5YaZ6YGTOgo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVt
YWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1w
b3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBd
Cj4KPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IEFvLAo+IEFueSBjaGFuY2UgZm9yIHVwZGF0ZWQg
czQgaGRtaSBzZXJpZXMgZm9yIDYuMTg/Cj4KPgo+PiBXaWFkb21vxZvEhyBuYXBpc2FuYSBwcnpl
eiBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+IHcgZG5pdSAyMSBsaXMgMjAyNSwgbyBnb2R6LiAw
Mzo1NToKPj4KPj4gSGkgUGlvdHLvvIwKPj4KPj4gICAgICBJIHdpbGwgY2hlY2sgdGhpcyBpc3N1
ZQo+Pgo+PiDlnKggMjAyNS8xMS8xOSAxODoyNywgUGlvdHIgT25pc3pjenVrIOWGmemBkzoKPj4+
IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWlsLmNv
bS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJv
dXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+Pgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+
Pj4gUGxzIHNlZSBpbmxpbmUKPj4+Cj4+Pj4gV2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQ2h1
YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+IHcgZG5pdSAxOSBsaXMgMjAyNSwgbyBnb2R6
LiAwMzo1NzoKPj4+Pgo+Pj4+IEhpIFBpb3RyLAo+Pj4+Cj4+Pj4KPj4+PiBPbiAxMS8xOC8yMDI1
IDEwOjUwIFBNLCBQaW90ciBPbmlzemN6dWsgd3JvdGU6Cj4+Pj4+IFtZb3UgZG9uJ3Qgb2Z0ZW4g
Z2V0IGVtYWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMg
aXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNh
dGlvbiBdCj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+PiBBbywKPj4+Pj4gSXMgdGhlcmUg
YW55IGNoYW5jZSB0byBnZXQgdGhpcyBzNCBkcm0gaGRtaSBzZXJpZXMgZm9yIGN1cnJlbnQgNi4x
OD8KPj4+Pj4gKGkgdHJpZWQgYmFja3BvcnQgdGhpcyBzZXJpZXMgdG8gNi4xOCBidXQgaGF2ZSBz
b21lIGlzc3VlcyB3aXRoIHJlcGFyZW50IHZwdV8wX3NlbCB0byBzeXNjbGtfYl9zZWwpCj4+Pj4g
V2h5IGRvIHdlIG5lZWQgdG8gcmVwYXJlbnQgdnB1XzBfc2VsIHRvIHN5c2Nsa19iX3NlbD8gaXMg
dGhlcmUgYW55Cj4+Pj4gYmFja2dyb3VuZCBoZXJlPwo+Pj4gV2VsbCAtIGl0IGxvb2tzIGl0IGlz
IGJlY2F1c2UgYnVnLi4uLgo+Pj4gTWFydGluIEJsdW1lbnN0aW5nbCBoYWQgcGVyZmVjdCBleWUg
YW5kIGNhdGNoIHR5cG8gaW4gcGF0Y2ggaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUw
MTEwLWRybS1zNC12MS0xMS1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vOgo+Pj4KPj4+IEJ5IHJl
cGxhY2luZzoKPj4+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsa2NfcGVyaXBocyBDTEtJ
RF9GQ0xLX0RJVjM+LAo+Pj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4+PiA8JmNsa2NfcGVyaXBo
cyBDTEtJRF9WUFVfMD4sCj4+PiA8JmNsa2NfcGVyaXBocyBDTEtJRF9GQ0xLX0RJVjQ+LAo+Pj4g
PDA+LCAvKiBEbyBOb3RoaW5nICovCj4+PiA8JmNsa2NfcGVyaXBocyBDTEtJRF9WQVBCXzA+Owo+
Pj4KPj4+IHdpdGg6Cj4+PiBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGtjX3BsbCBDTEtJ
RF9GQ0xLX0RJVjM+LAo+Pj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4+PiA8JmNsa2NfcGVyaXBo
cyBDTEtJRF9WUFVfMD4sCj4+PiA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElWND4sCj4+PiA8MD4s
IC8qIERvIE5vdGhpbmcgKi8KPj4+IDwmY2xrY19wZXJpcGhzIENMS0lEX1ZBUEJfMD47Cj4+Pgo+
Pj4gZG1lc2cgaXMgbGlrZSB0aGlzIGh0dHBzOi8vdGVybWJpbi5jb20vNjAyMAo+Pj4KPj4+IFNv
IGknbSBnZXR0aW5nIGhkbWkgd29ya2luZyAtIGJ1dCBvbmx5IHdoZW4gZGV2aWNlIGJvb3RzIF93
aXRob3V0XyBjb25uZWN0ZWQgaGRtaSBhdCBib290IChhbmQgY29ubmVjdGVkIGxhdGVyKQo+Pj4g
SWYgaGRtaSBpcyBjb25uZWN0ZWQgYXQgYm9vdCAtIGJvb3QgaGFuZ3MgYXQ6Cj4+Pgo+Pj4gICAg
ICAwLjM0MTY3Nl0gbWVzb24tZHctaGRtaSBmZTMwMDAwMC5oZG1pLXR4OiBEZXRlY3RlZCBIRE1J
IFRYIGNvbnRyb2xsZXIgdjIuMDFhIHdpdGggSERDUCAobWVzb25fZHdfaGRtaV9waHkpCj4+PiBb
ICAgIDAuMzQyNzUwXSBtZXNvbi1kdy1oZG1pIGZlMzAwMDAwLmhkbWktdHg6IHJlZ2lzdGVyZWQg
RGVzaWduV2FyZSBIRE1JIEkyQyBidXMgZHJpdmVyCj4+PiBbICAgIDAuMzQzNjYwXSBtZXNvbi1k
cm0gZmYwMDAwMDAudnB1OiBib3VuZCBmZTMwMDAwMC5oZG1pLXR4IChvcHMgbWVzb25fZHdfaGRt
aV9vcHMpCj4+PiBbICAgIDAuMzQ0ODMyXSBbZHJtXSBJbml0aWFsaXplZCBtZXNvbiAxLjAuMCBm
b3IgZmYwMDAwMDAudnB1IG9uIG1pbm9yIDAKPj4+Cj4+PiBGWUk6IEl0IGlzIGFmdGVyIGFwcGx5
aW5nIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hbWxvZ2ljL2Nv
dmVyLzIwMjUwMTEwLWRybS1zNC12MS0wLWNiYzJkNWVkYWFlOEBhbWxvZ2ljLmNvbS8gb24gbWFp
bmxpbmUgNi4xOCAod2l0aCBzb21lIG15IGFkanVzdG1lbnRzIG9uIHRoaXMgc2VyaWVzIHJlcXVp
cmVkIGJ5IGNoYW5nZXMgaW4gNi4xOCkuCj4+PiBGb3IgVlBVIGNsayBjaGFuZ2VzIHNlZSBodHRw
czovL2dpdGh1Yi5jb20vd2FycG1lL21pbmlteXRoMi9ibG9iL21hc3Rlci9zY3JpcHQva2VybmVs
L2xpbnV4LTYuMTgvZmlsZXMvMDMxMi1kcm0tbWVzb24tYWRkLXZwdS1jbGstc2V0dGluZy1mb3It
UzQucGF0Y2gKPj4+IEl0IGlzIDYuMTggYWRhcHRhdGlvbiBvZiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1sb2dpYy9wYXRjaC8yMDI1MDExMC1kcm0tczQtdjEt
OS1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vCj4+Pgo+Pj4gQXMga2VybmVsIGhhbmdzIC0gaSBo
YXZlIGxpbWl0ZWQgY2FwcyB0byBkcmlsbCB3aGVyZSByb290IGNhdXNlIGlzLgo+Pj4KPj4+IE1h
eWJlIGFib3ZlIGhhbmcgaXMgcmVhc29uIG9mIG15IGJhY2twb3J0cyBvciBtaXNzaW5nIGFueSBw
cmUtcmVxIHJlcXVpcmVkIHRvIGdldCBzNCBkcm0gd29ya2luZz8KPj4+IEFueXdheSAtIGl0IHdp
bGwgYmUgZ29vZCB0byB0ZXN0IHdpdGggdXBkYXRlZCB0byA2LjE4IHNlcmllcyBvZiBBZGQgRFJN
IHN1cHBvcnQgZm9yIEFtbG9naWMgUzQgKHBsdXMgaW5mbyBhYm91dCBhbnkgcHJlLXJlcSByZXF1
aXJlZCB0byBnZXQgczQgZHJtIHdvcmtpbmcpCj4+Pgo+Pj4KPj4+PiBUaGUgdnB1X2NsayBvbiBT
NCBkb2Vzbid0IHN1cHBvcnQgc3lzY2xrX2Jfc2VsIGFzIG9uZSBvZiBpdHMKPj4+PiBzZWxlY3Rh
YmxlIGNsb2NrIHNvdXJjZXMsIHNvIHRoaXMgcmVwYXJlbnQgb3BlcmF0aW9uIHdpbGwgZGVmaW5p
dGVseQo+Pj4+IGZhaWwuIFRoaXMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUga2VybmVsIHZl
cnNpb24uCj4+Pj4KPj4+Pj4+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEFvIFh1IHZpYSBC
NCBSZWxheSA8ZGV2bnVsbCthby54dS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3IGRuaXUgMTAg
c3R5IDIwMjUsIG8gZ29kei4gMDY6Mzk6Cj4+Pj4+Pgo+Pj4+Pj4gRnJvbTogQW8gWHUgPGFvLnh1
QGFtbG9naWMuY29tPgo+Pj4+Pj4KPj4+Pj4+IEFkZCBkZXZpY2V0cmVlIGRvY3VtZW50IGZvciBT
NCBIRE1JIGNvbnRyb2xsZXIKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbyBYdSA8YW8u
eHVAYW1sb2dpYy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sIHwgMSArCj4+Pj4+
PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNv
bi1kdy1oZG1pLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+Pj4+Pj4gaW5kZXggODRkNjhiOGNmY2NjODZm
ZDg3YTZhMGZkMmI3MGFmMTJlNTFlYjhhNC4uNmUwYTgzNjllZWU5MTVmYWI1NWFmMjRkNDUwYTZj
NDBlMDhkZWYzOCAxMDA2NDQKPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4+Pj4+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3
LWhkbWkueWFtbAo+Pj4+Pj4gQEAgLTU1LDYgKzU1LDcgQEAgcHJvcGVydGllczoKPj4+Pj4+ICAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1neC1kdy1oZG1pCj4+Pj4+PiAgICAgICAg
LSBlbnVtOgo+Pj4+Pj4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kdy1oZG1pICMg
RzEyQSAoUzkwNVgyLCBTOTA1WTIsIFM5MDVEMikKPj4+Pj4+ICsgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uLXM0LWR3LWhkbWkgIyBTNCAoUzkwNVk0KQo+Pj4+Pj4KPj4+Pj4+ICAgIHJlZzoKPj4+
Pj4+ICAgICAgbWF4SXRlbXM6IDEKPj4+Pj4+Cj4+Pj4+PiAtLQo+Pj4+Pj4gMi40My4wCj4+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+Pj4+IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+Pj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+Pj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IGxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0Cj4+Pj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
