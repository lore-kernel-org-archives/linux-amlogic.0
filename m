Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DAC282EC
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Mar 2025 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr2K0qP3wJuxNevTQ6t9lc+whomfbIiym9CaE/c/ZPw=; b=eVHZuv7Lg3Ui797D+89hrh3xsX
	Iy7O8cFO376IaSBJfqDTFEmTKdqygcIoQDn5vi7J7vIOXkyDTgNCQUslfAdwd8SV8cI02gHBFp0QY
	PUszcRs97tgy/M8/B4+yq4PqNxFofvCPgqx+eI2popOiTEK2f3iR3w45l34ZfDv3gvQ1w10Ch60Qz
	y7HVzUVBJbXwe4dCX1r2pjAEZrU82oaDGKIfnowQ9AeosouB15VC1dwY1pb9xplVgLG8YtdCgWA19
	5SromJasWEQpuAdd+P1T+9AcH8QIJD4FD33L0zHi1onve/mtqoFkxcySqQ/SjfynrD/t2MBqR7pgo
	YAlYeyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNmx-0000000CvuN-2QUY;
	Fri, 07 Mar 2025 02:50:15 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNlJ-0000000Cvok-0prZ;
	Fri, 07 Mar 2025 02:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhZAafRQ3gm7FP/+Z6xIRrepC5zYGWY39WzNI+pO/GJS6/4oul4Cp37iSjwMui5v0L9QVqSt9d3E/HFrbfZgb5YwP+b4GWu0kyMOENNxiq3+gGeR1+YIETyc/wUy43fqNdkXIwdu74fj58KA8pBb1rJTRN8zW6f/TZkiXkWuofPMo5E+sQOxbvTYfnoqzVpmGomvdF+olyS1QQ+nd8IIbhAeT6Db2mox0XNY72dFca6GsXl7L0kSXjPIRDvQ4OwG1/GXw5L3/oGgkHIdhelvnU8jj1iEsrEZNLJD/iOjixt8HXsLALhaTPXRlOWo2XAhBcUe0SO++C41DzAOpFULVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlzijiw5nh1PlQ7C3JgDaFh3UOzj9I0GGiXntbg1SaY=;
 b=n5pMRGRWLcfDTjnAM07/ZWVTsWJFJ3iCYNssKYh7flG66u6Q1R+DefsWYLz6lGmGSw7Tq3qMnNAozMpaF/toR2UxjYEexvkf25G8U4w1m1wXLjoVmcZSR4KkuV+9bBH578pW2SKSNFV3W2aGpoH7zx/HDKE4t9h+cT/x/yoRBbBX/dq/dNh4otwp5qBRhe4c4hcS3rzlJhSfcYvoEUl5DpOyY0V/Eko1MCQmObQaGyvjp7QXEYD+ZrMfWDkw14hzAxLbDR05qiU3IWJfWAdFHuiiZKM4XdEd60H0e+AD/kca/QveDtzG6Z2NsHq5IHOt6sZhpTAGErZ1/ARhdhT7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlzijiw5nh1PlQ7C3JgDaFh3UOzj9I0GGiXntbg1SaY=;
 b=L5gtQwkT40bGitRSiO4xjko/wYJbu68rl13IeRgN6LzOzkpH6yr0sapxN0CzIt6V35UXwB8fL16bxi7M+gwAxL68NxtdpIiCN/x3eMNZQGBcGY21JEJydV/ZbKxoLDSZK38JvPiz+nw8O2ky3r9UsepQPdjTGfxNr7xKQdl9v2MaTtQq5LDAQ0+6irZp00AvPoebroYo7tmeJFsbNwXgC8kAfz7Q1fFoUrAPhzN6W9O9KAUyf2JZa0p4ghefqHUQwKomxWQ2JVviGvWtSPHPNtW3tVP4pbmGcfO7EL5QecldcMFnOm/diqfY5VSnQxH33sttzEoI4KCKxQdT88s3ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYZPR03MB7954.apcprd03.prod.outlook.com (2603:1096:400:465::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 02:48:15 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%7]) with mapi id 15.20.8489.025; Fri, 7 Mar 2025
 02:48:14 +0000
Message-ID: <26292ce9-7644-4a8f-8817-045cf6dd87b0@amlogic.com>
Date: Fri, 7 Mar 2025 10:48:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] ASoC: meson: s4: Add s4 tocodec driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com>
 <1jfrjq5ews.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jfrjq5ews.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
 To PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYZPR03MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: e49ee605-6251-4d12-67d2-08dd5d2281ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejhTVGRZeS9EcWxacWdyMFR0ZHVlL0hmbEo5anJ6OU81SUpFZDNsUDN0QjBM?=
 =?utf-8?B?QlF1dXNJNS9GWVhCeTN1aHdSbllTTExVbjhpdWQ1Nm5qdFZXRWY1ZmpPOWty?=
 =?utf-8?B?aFVpcVgzSTdUb3pndWQ5ZC92MEJjNXk3Sm45ZVk5cFlxRW9Mcjl1WElraEhZ?=
 =?utf-8?B?cHcvTVcrRE5rbWV4amVkOUdEZHdBVE5VWVNJdDE5T2dPYlF2MnlURHVnVmRr?=
 =?utf-8?B?a0I5TUVYNklDTkxRUXEyMC80a0NySFJ6U2UxOXFOdDVPRnNkUWxtVytOa3Vt?=
 =?utf-8?B?V1hORis5TzdscEtxRU4xTlFjUUUxVmNtaStTa283amtRdjNUWVJTdS9VQm9r?=
 =?utf-8?B?KzA0NWpFTUhXL3h3QWpNRzU2alhybldPREZoNjdPV3FmOGk4TTR0dWhXZWp0?=
 =?utf-8?B?dUJEMkRVSS83REVMZzk0eEcwVzhFRkFKS1hVV0hTdzlreVFOcUhtdVQ0OXB4?=
 =?utf-8?B?cFNjU1M4Szg3Ui9rZW51cUprSTZnVUxocGppdnZqbUdNYmJXMjFIT3h1LzB2?=
 =?utf-8?B?RVdhcTFCdFFqdnNYbDk5WTNlN2pSU2JCbDEvTmtXVVJrRjlVVDZmZzl0NW5o?=
 =?utf-8?B?UEFkTGFxT0QybjlhcnF4M2ZHUU15MUFnaWFEVGUwb1RTM0ZVb2JhRm9BVW1T?=
 =?utf-8?B?bmF0b2NIZTJFa0NJRXBDVXVMU2VuMTd3eVBQY3RQZlE3TVdyWTBydWRyRWRD?=
 =?utf-8?B?Vmg3aDhUb3NUcGMyeTYzaHVQR1pPenZuaE5XanR4RE43UXRPUVNBYVlJRnQ5?=
 =?utf-8?B?aE41ekhCRUpZVXA3ekMzb2txeVo2WGFDa0llTm9iMkFlMXh6TDhCNkFKZzgx?=
 =?utf-8?B?WDA5VVBhOWxZdS91SEVhTFlwb1dlSzNWanJEYjMvcUxRQnVXNE9IeVBRai9o?=
 =?utf-8?B?NTZzYkdRNHpKa0ZoSHdXcG1YS0dkdFFCbXZobkQ2QWN4ckxhVno4WG11SHJR?=
 =?utf-8?B?UlE2ZGlvaDgybW9yQ2FXT3FmTjc5N0FiNVY3WHAvdEF3WU9Sc0VoOE1lc2M2?=
 =?utf-8?B?UWw5VVJRdEl4Sy80UjI4MlNSNFAvS2o4c3hDeVNyQ1dhbDh1enFhdnErNU9H?=
 =?utf-8?B?RHVSMFlsYmU2MzFZSGY4MDZmeG9rdDVES1NpcDNYM3JUV3prNU4zNlhJOHdH?=
 =?utf-8?B?d1U0NjYrTmVMQjdiaGNSWnd2OTQ2WVNJU3lVRlNUc1ZndkxyN1hqajgrTE9i?=
 =?utf-8?B?YW5Tb2tPWCticEg0OEh6YkxIeXdVcHkxMUo5U3ZRM3RyQUVTSDVsdzhUcHlk?=
 =?utf-8?B?WkROT1VpM1JJbEtXN1R1Ykp5NWNjZm1XZkpCQi9mcGZMYUMySThVdytteTV0?=
 =?utf-8?B?Sldkek5OcUNzQi9TcVhyVWJNWGc0TWlSRkhqcHE0NmdJSDdoUUEzOExrYmx0?=
 =?utf-8?B?SGVKdmh6NnN3Q1NQZXc2b09odFMrenZ0UDNiT1BYampQL1VGT2xFVUQ2M0Jw?=
 =?utf-8?B?Wjh2Y1gzRFovNlArN3M2bXdyc2dVZXFOUkNhem1xMWFoZ0QyazVnSElZeUhF?=
 =?utf-8?B?bzArOGFhZFRuSlI0NVVaNDk4bUk4ZHdEeU9YbG1wMVp1MHhvVDgxME5hcXVm?=
 =?utf-8?B?UzNNTWJYSXRYMEIvZTdvejZmZkhLTEFXcU1GY1lIb3hhZmFwcHZqblFRYkdo?=
 =?utf-8?B?KzVnN1kwRFNVNXF1ZTFYWlo1QlEzb0NuT0RGc0J2MXJsN0JvaU1weVJyV204?=
 =?utf-8?B?Q2ttQU1zVktpUDJBdVB3SVQ2MXFGZDhrTG54UGc2eTRVQ1J4RFk5aUNzbkpO?=
 =?utf-8?B?NFNmaTEyZUZ6WDF6MnFSK09mb3AvSjhRTkdRMmRrMFNhQXdMQnVGclp4SFB3?=
 =?utf-8?B?U2VXeFFub2Y0RFM3ODZUL0Q4Si9nbUhscVNLK2pUcmxGVmpham56YXlEN1Yx?=
 =?utf-8?Q?9uweGIAE/ZFHK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNPT016dnJyNGtjOEh2djF3dUpzT1BjaDVZa3JaOWJqN2kzQTVJT2d6bUFz?=
 =?utf-8?B?WGEyTlNET1kyV0FQWENETUNnK0Jqck9qTTZyL1RmemRmcG50THZ0U0plQ1lG?=
 =?utf-8?B?eHZIcXFyL0xacjNQSW8yL3I5Rk5YaTFRY21QV3hzUlJ3ZUEyVGp3eE9iYzJq?=
 =?utf-8?B?N3EwaDVOYTRSS21UTktqS2E0UU1lREpMMFNlZ0x3NmpPWEpkTFdodzNSL0Jz?=
 =?utf-8?B?RDZYTHR3TW9KRWtGZnhIZjhoWGRkdHlEU0ZSMHpoOG5HOVFHbHBjbGxVMTBh?=
 =?utf-8?B?RC9zMG9KN1NZTXRjR1JpMzR1cXluY2JtQTN5bWRPRXhLQVVGRkQyL1dQVFdB?=
 =?utf-8?B?aGFsdGRmc2FFcktSQTh2REhpWDZLNWpSa29OejAxNG5Senh6cDc2U01FUFRr?=
 =?utf-8?B?cHIvb2dyZzZOWjhSNGFLbk54ZnFRc055dGNFK3NPbTNjMndtaDZCN1hXNnUy?=
 =?utf-8?B?VjR3V295SnJ6R2RUMGNBRnQ5SUtNVG5hWjNlK3hoL3l1enFCb0xKeFNCNnZi?=
 =?utf-8?B?eTJvaEliZmdVN0pzQk84Wng2Q2Z1a2VZVXpCcmcrdkZseENsaGZ5d2E2V3ZV?=
 =?utf-8?B?ZVJvMmhhN1hNZUJLOWo3YUNPWmFlN3ZKWk01a2VFQ2ZYbXVzdnZ6RThzOGxu?=
 =?utf-8?B?djdTZHcyM1YzcmJmZWE5anR1TzJOVXpwNDNUL0c1K3VXeVArY3MzWVZaUmFE?=
 =?utf-8?B?T0VyOHg3Z0FmeG4rZTBrY0ZUajNXT0NoT1QvRHhzUmIrS3BpQlpZcnpNQ0Fa?=
 =?utf-8?B?cmtXaXFpNWdGdEFPTWJTTnM1YSsyVWd2NnV4SzRGTy83WUxwMmx0TGxKbUMv?=
 =?utf-8?B?SHk3VThJb29lVmw5QW5iQm9ld1JQWXdxMXdLNUJhaVArUkY2NmI1RzJrNGlW?=
 =?utf-8?B?RWRxRlF2MGZuS0VMKzJiNVpOYmpWQjQ1dXlvcFpVc0lhRTIvbXZ5MkxiQ1E2?=
 =?utf-8?B?bmVvNlpxU1BQMjdzRSs2ZElHMHJFclBNWmVOQkhJeTZLZEJPakY0Ny9SYzJK?=
 =?utf-8?B?V3JjbVduem9sb0tMdHd2d3JRVzRoSVdQU3JuT3VsWTIybW5CTXpzMjhwZGhT?=
 =?utf-8?B?L2JoQzk0cjRlOUtqSGtDTmtuNnBjSlI4YjNQMmk0SkhHMnlaelNjQjdSTlRP?=
 =?utf-8?B?WjREYW5INE1iTjh2U0d3U1lNQTFnWEhGWUlFOVNQNEhkSi9zUzh0ejRKK2Rk?=
 =?utf-8?B?MEdHRjNIajg3b3RjcjZESDM2MGVtL3pLQXBHUitWSlhCOUF5TlcvQ0N3R1R4?=
 =?utf-8?B?cGpLVWhXbzJxZEVXMXRpVGtnNWcvdzNzZXV2VHR0TFBzWHJ2NjN5WmczZEpE?=
 =?utf-8?B?Q24vWlNhT0xUUDdTZ2JmTzFKYmFLRjVzNGxnb0NFR3BxRkNGODU4bjRFa29T?=
 =?utf-8?B?b1dVY2dxbVlDOElRa2Y4eHIrWjJWbk4rUEN6WnRsZmpNSWVjZitoR0R2bzJJ?=
 =?utf-8?B?SVVWa3VvTjhERTArdzZQeUVGWmEyK0NQSnVKL1FkbGtwa3UyR0g2TTVGSDhp?=
 =?utf-8?B?RldlZkJrczg1aFZjNW01NGF5eUUvZGFnT3ZvbG01NlJDSnRtMm0ra1hjWkpI?=
 =?utf-8?B?a3RrbmlPcVZUMWZLNm1adGVyNzVqSkhXMzlpTExnVUNiaDdSZE1rOGdreXdo?=
 =?utf-8?B?Mm5IcEwwd0ZCY0tia085aGswSlFyTnRkOTB1bUg4SVJKNHdwZUg1WmkrVEhQ?=
 =?utf-8?B?cXdZbzM1L1hSZVNJaG5vMjZsU0w4Ty9MODdpdWkxOERKMmxIT3Y1QkNnOEQy?=
 =?utf-8?B?UDM3UGdEOWJNVlozTUhleDhwamN0Y2lpYmd6OGlRV1FRYnRJMlFIMlQxaTRy?=
 =?utf-8?B?ZFJjUjMxb2hjaVF6aFhSbVhwZkNHeWljNHJGTWFLcE9EeW9EQi9oaFp3M0tT?=
 =?utf-8?B?alVvdGVqeC92aXkwZlUxeVJ4Umo3TUorem9oWW9kUlZiam8yUHd0MDBnZG9O?=
 =?utf-8?B?Q3EyU1hzUW95NzkzNE5ONEt2MHg2VUw2QTYwVUlwS0NzKzF3YVI5UkRuSXZl?=
 =?utf-8?B?MG82MmFBQW5lVDU5VUJKWjYwdXY3OTlwQkdjeWJRRXI3eG40dVJYa3lRV2Vz?=
 =?utf-8?B?SnpadUp2RVNoRkIrQzc0aUF6bWZWUDhuSUR5NUx1bWlkaFhaU1lyQVdTQ3dO?=
 =?utf-8?B?eWVlSFB6bVRUL2xBZ3JGN01obkF6cGlMY1dNR0lEcnlhUld4ZDllNWJqd0VI?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49ee605-6251-4d12-67d2-08dd5d2281ee
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 02:48:14.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ6HXmWhrhlxHKNGwEP4gn2QlsglrpoTIDjmxZDgmqn1uDCiHCWUEfpc13wZmkNfwTNZCb5sd/JXn27+pPJZzKYqfvVUes8A2UZ1vRNYDnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_184833_363642_B6D162FE 
X-CRM114-Status: GOOD (  17.19  )
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

CuWcqCAyMDI1LzMvNiAyMzo1OCwgSmVyb21lIEJydW5ldCDlhpnpgZM6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBPbiBGcmkgMjggRmViIDIwMjUgYXQgMTY6MDQsIGppZWJpbmcgY2hlbiB2aWEg
QjQgUmVsYXkgPGRldm51bGwramllYmluZy5jaGVuLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4+IEZyb206IGppZWJpbmcgY2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29tPgo+
Pgo+PiBTNCB0b2NvZGVjIHN1cHBvcnQgOCBsYW5lIHRvIGlucHV0LCBJdCBuZWVkIHRvIGVuYWJs
ZQo+PiBiY2xrIGFuZCBtY2xrIGNvbnRyb2wgYml0IHdoZW4gd29yawo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBqaWViaW5nIGNoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAg
c291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYyB8IDUxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMgYi9z
b3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCj4+IGluZGV4IDUzMWJiODcwN2EzZWM0YzQ3
ODE0ZDZhMDY3NmQ1YzYyYzcwNWRhNzUuLjQxZWVmOTk4MDA1OTI4NTI3NWYwMTg5YTA2NDY5ZmM2
OTQ3NzU5NTUgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMK
Pj4gKysrIGIvc291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYwo+PiBAQCAtNDEsNiArNDEs
OSBAQAo+PiAgICNkZWZpbmUgIENUUkwwX0JDTEtfU0VMX0xTQiAgICAgICAgICA0Cj4+ICAgI2Rl
ZmluZSAgQ1RSTDBfTUNMS19TRUwgICAgICAgICAgICAgICAgICAgICAgR0VOTUFTSygyLCAwKQo+
Pgo+PiArI2RlZmluZSBDVFJMMF9CQ0xLX0VOQUJMRV9TSElGVCAgICAgICAgICAgICAgMzAKPj4g
KyNkZWZpbmUgQ1RSTDBfTUNMS19FTkFCTEVfU0hJRlQgICAgICAgICAgICAgIDI5Cj4+ICsKPj4g
ICAjZGVmaW5lIFRPQUNPREVDX09VVF9DSE1BWCAgICAgICAgICAgMgo+Pgo+PiAgIHN0cnVjdCBn
MTJhX3RvYWNvZGVjIHsKPj4gQEAgLTEyOSw2ICsxMzIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfa2NvbnRyb2xfbmV3IGcxMmFfdG9hY29kZWNfb3V0X2VuYWJsZSA9Cj4+ICAgICAgICBT
T0NfREFQTV9TSU5HTEVfQVVUT0RJU0FCTEUoIlN3aXRjaCIsIFRPQUNPREVDX0NUUkwwLAo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENUUkwwX0VOQUJMRV9TSElGVCwgMSwg
MCk7Cj4+Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgczRfdG9hY29k
ZWNfY2xrX2VuYWJsZSA9Cj4+ICsgICAgIFNPQ19EQVBNX0RPVUJMRSgiU3dpdGNoIiwgVE9BQ09E
RUNfQ1RSTDAsCj4+ICsgICAgICAgICAgICAgICAgICAgICBDVFJMMF9CQ0xLX0VOQUJMRV9TSElG
VCwgQ1RSTDBfTUNMS19FTkFCTEVfU0hJRlQsIDEsIDApOwo+PiArCj4+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IGcxMmFfdG9hY29kZWNfd2lkZ2V0c1tdID0gewo+
PiAgICAgICAgU05EX1NPQ19EQVBNX01VWCgiU1JDIiwgU05EX1NPQ19OT1BNLCAwLCAwLAo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAmZzEyYV90b2Fjb2RlY19tdXgpLAo+PiBAQCAtMTQzLDYg
KzE1MCwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgc20xX3Rv
YWNvZGVjX3dpZGdldHNbXSA9IHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgJmcxMmFf
dG9hY29kZWNfb3V0X2VuYWJsZSksCj4+ICAgfTsKPj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX3NvY19kYXBtX3dpZGdldCBzNF90b2Fjb2RlY193aWRnZXRzW10gPSB7Cj4+ICsgICAgIFNO
RF9TT0NfREFQTV9NVVgoIlNSQyIsIFNORF9TT0NfTk9QTSwgMCwgMCwKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAmc20xX3RvYWNvZGVjX211eCksCj4+ICsgICAgIFNORF9TT0NfREFQTV9TV0lU
Q0goIk9VVCBFTiIsIFNORF9TT0NfTk9QTSwgMCwgMCwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAmZzEyYV90b2Fjb2RlY19vdXRfZW5hYmxlKSwKPj4gKyAgICAgU05EX1NPQ19EQVBNX1NX
SVRDSCgiQ0xLIEVOIiwgU05EX1NPQ19OT1BNLCAwLCAwLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICZzNF90b2Fjb2RlY19jbGtfZW5hYmxlKSwKPiBJIGRvbid0IHNlZSBhIHJlYXNvbiBm
b3IgdGhlIHVzZXIgdG8gY29udHJvbCB0aGF0Lgo+Cj4gQSB1c2VyIGNvbnRyb2xzIGlmIHRoZSBj
b21wb25lbnQgaXMgZW5hYmxlIG9yIG5vdCwgYW5kIHBvc3NpYmx5IHNlbGVjdAo+IHRoZSBsYW5l
IC4uLiBidXQgdGhhdCdzIGl0Cj4KPiBZb3UgY291bGQgaGF2ZSB0byBmbGlwcGVkIGF1dG9tYXRp
Y2FsbHkgd2hpY2ggZGFwbSB3aGVuIHRoZSBjb21wb25lbnQgaXMKPiBwb3dlcmVkLCB0aGF0IHdv
dWxkIG1ha2UgYSBsb3QgbW9yZSBzZW5zZS4KCkhpLEplcm9tZQoKVGhhbmsgeW91IGZvciB5b3Vy
IHN1Z2dlc3Rpb24uIENhbiB3ZSBkZXNpZ24gaXQgYXMgYSBzdXBwbHkgd2lkZ2V0IGZvciAKdG9j
b2RlYyBiY2xrIGFuZCBtY2xrIGNvbnRyb2w/Cgp3aGVuIGRhcG0gcG93ZXJvbiwgYW5kIHN1cHBs
eSB3aWRnZXQgcG93ZXIgb24sIFVzZXJzIGRvIG5vdCBoYXZlIHRvIApvcGVyYXRlIGFkZGl0aW9u
YWwgS2NvbnRyb2xzCgo+Cj4+ICt9Owo+PiArCj4+ICAgc3RhdGljIGludCBnMTJhX3RvYWNvZGVj
X2lucHV0X2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzbmRfcGNtX2h3
X3BhcmFtcyAqcGFyYW1zLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4+IEBAIC0yMjgsNiArMjQ0LDE1IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGcxMmFfdG9hY29kZWNfcm91dGVzW10g
PSB7Cj4+ICAgICAgICB7ICJPVVQgQ2FwdHVyZSIsIE5VTEwsICJPVVQgRU4iIH0sCj4+ICAgfTsK
Pj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIHM0X3RvYWNvZGVj
X3JvdXRlc1tdID0gewo+PiArICAgICB7ICJTUkMiLCAiSTJTIEEiLCAiSU4gQSBQbGF5YmFjayIg
fSwKPj4gKyAgICAgeyAiU1JDIiwgIkkyUyBCIiwgIklOIEIgUGxheWJhY2siIH0sCj4+ICsgICAg
IHsgIlNSQyIsICJJMlMgQyIsICJJTiBDIFBsYXliYWNrIiB9LAo+PiArICAgICB7ICJPVVQgRU4i
LCAiU3dpdGNoIiwgIlNSQyIgfSwKPj4gKyAgICAgeyAiQ0xLIEVOIiwgIlN3aXRjaCIsICJPVVQg
RU4iIH0sCj4+ICsgICAgIHsgIk9VVCBDYXB0dXJlIiwgTlVMTCwgIkNMSyBFTiIgfSwKPj4gK307
Cj4+ICsKPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgZzEyYV90b2Fj
b2RlY19jb250cm9sc1tdID0gewo+PiAgICAgICAgU09DX1NJTkdMRSgiTGFuZSBTZWxlY3QiLCBU
T0FDT0RFQ19DVFJMMCwgQ1RSTDBfTEFORV9TRUwsIDMsIDApLAo+PiAgIH07Cj4+IEBAIC0yMzYs
NiArMjYxLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBzbTFfdG9h
Y29kZWNfY29udHJvbHNbXSA9IHsKPj4gICAgICAgIFNPQ19TSU5HTEUoIkxhbmUgU2VsZWN0Iiwg
VE9BQ09ERUNfQ1RSTDAsIENUUkwwX0xBTkVfU0VMX1NNMSwgMywgMCksCj4+ICAgfTsKPj4KPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBzNF90b2Fjb2RlY19jb250cm9s
c1tdID0gewo+PiArICAgICBTT0NfU0lOR0xFKCJMYW5lIFNlbGVjdCIsIFRPQUNPREVDX0NUUkww
LCBDVFJMMF9MQU5FX1NFTF9TTTEsIDcsIDApLAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRfZHJpdmVyIGcxMmFfdG9hY29kZWNfY29tcG9uZW50
X2RydiA9IHsKPj4gICAgICAgIC5wcm9iZSAgICAgICAgICAgICAgICAgID0gZzEyYV90b2Fjb2Rl
Y19jb21wb25lbnRfcHJvYmUsCj4+ICAgICAgICAuY29udHJvbHMgICAgICAgICAgICAgICA9IGcx
MmFfdG9hY29kZWNfY29udHJvbHMsCj4+IEBAIC0yNTgsNiArMjg3LDE3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRfZHJpdmVyIHNtMV90b2Fjb2RlY19jb21wb25lbnRf
ZHJ2ID0gewo+PiAgICAgICAgLmVuZGlhbm5lc3MgICAgICAgICAgICAgPSAxLAo+PiAgIH07Cj4+
Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2RyaXZlciBzNF90b2Fj
b2RlY19jb21wb25lbnRfZHJ2ID0gewo+PiArICAgICAucHJvYmUgICAgICAgICAgICAgICAgICA9
IHNtMV90b2Fjb2RlY19jb21wb25lbnRfcHJvYmUsCj4+ICsgICAgIC5jb250cm9scyAgICAgICAg
ICAgICAgID0gczRfdG9hY29kZWNfY29udHJvbHMsCj4+ICsgICAgIC5udW1fY29udHJvbHMgICAg
ICAgICAgID0gQVJSQVlfU0laRShzNF90b2Fjb2RlY19jb250cm9scyksCj4+ICsgICAgIC5kYXBt
X3dpZGdldHMgICAgICAgICAgID0gczRfdG9hY29kZWNfd2lkZ2V0cywKPj4gKyAgICAgLm51bV9k
YXBtX3dpZGdldHMgICAgICAgPSBBUlJBWV9TSVpFKHM0X3RvYWNvZGVjX3dpZGdldHMpLAo+PiAr
ICAgICAuZGFwbV9yb3V0ZXMgICAgICAgICAgICA9IHM0X3RvYWNvZGVjX3JvdXRlcywKPj4gKyAg
ICAgLm51bV9kYXBtX3JvdXRlcyAgICAgICAgPSBBUlJBWV9TSVpFKHM0X3RvYWNvZGVjX3JvdXRl
cyksCj4+ICsgICAgIC5lbmRpYW5uZXNzICAgICAgICAgICAgID0gMSwKPj4gK307Cj4+ICsKPj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgZzEyYV90b2Fjb2RlY19yZWdtYXBf
Y2ZnID0gewo+PiAgICAgICAgLnJlZ19iaXRzICAgICAgID0gMzIsCj4+ICAgICAgICAudmFsX2Jp
dHMgICAgICAgPSAzMiwKPj4gQEAgLTI3OCw2ICszMTgsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBnMTJhX3RvYWNvZGVjX21hdGNoX2RhdGEgc20xX3RvYWNvZGVjX21hdGNoX2RhdGEgPSB7Cj4+
ICAgICAgICAuZmllbGRfYmNsa19zZWwgPSBSRUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAsIDQsIDYp
LAo+PiAgIH07Cj4+Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGcxMmFfdG9hY29kZWNfbWF0Y2hf
ZGF0YSBzNF90b2Fjb2RlY19tYXRjaF9kYXRhID0gewo+PiArICAgICAuY29tcG9uZW50X2RydiAg
PSAmczRfdG9hY29kZWNfY29tcG9uZW50X2RydiwKPj4gKyAgICAgLmZpZWxkX2RhdF9zZWwgID0g
UkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxOSwgMjApLAo+PiArICAgICAuZmllbGRfbHJjbGtf
c2VsID0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkwwLCAxMiwgMTQpLAo+PiArICAgICAuZmllbGRf
YmNsa19zZWwgPSBSRUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAsIDQsIDYpLAo+PiArfTsKPj4gKwo+
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGcxMmFfdG9hY29kZWNfb2ZfbWF0
Y2hbXSA9IHsKPj4gICAgICAgIHsKPj4gICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAiYW1s
b2dpYyxnMTJhLXRvYWNvZGVjIiwKPj4gQEAgLTI4Nyw2ICszMzQsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgZzEyYV90b2Fjb2RlY19vZl9tYXRjaFtdID0gewo+PiAgICAg
ICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHNtMS10b2Fjb2RlYyIsCj4+ICAgICAg
ICAgICAgICAgIC5kYXRhID0gJnNtMV90b2Fjb2RlY19tYXRjaF9kYXRhLAo+PiAgICAgICAgfSwK
Pj4gKyAgICAgewo+PiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImFtbG9naWMsczQtdG9h
Y29kZWMiLAo+PiArICAgICAgICAgICAgIC5kYXRhID0gJnM0X3RvYWNvZGVjX21hdGNoX2RhdGEs
Cj4+ICsgICAgIH0sCj4+ICAgICAgICB7fQo+PiAgIH07Cj4+ICAgTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgZzEyYV90b2Fjb2RlY19vZl9tYXRjaCk7Cj4gLS0KPiBKZXJvbWUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
