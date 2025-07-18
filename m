Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC909C83F1A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L926rss6RW7upK4v0FQ0ABjWtLoM1xjY0OJG2fXA8yA=; b=fg2ETMNozAv/+YfYkXwSrRYZQF
	B2CxKWSmlx1/07caLWCOEMEE6cW3B9CRrbWIWi3gdSl9MYqG3Q7Aii4h06Crly0nvTGAjsLeGAmy2
	diDr9bdDR8yNhvitftckS2Vqd5WIEmcplxUQEVGytyaAQz2GDuH9sEpcjxvthFfbyMnTy7N/fgQCl
	CrHR/G3/2OlPWFMR4bFhRxMPVY16vdMAYF1vU9QonX7tAAxug2ZFJT4vLM2XW1gVBaDdmI+gYS103
	7WWnc/oEUGi4L/G8zwTkQYQp3A9QUWmxB9kLxeziO9dtARYJhg4ZCJfA53FK6M8HhGgWiiDbVMaqN
	psAaQL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceRZ-0000000BlED-09dq;
	Fri, 18 Jul 2025 06:19:41 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceMm-0000000Bkt2-2nCd;
	Fri, 18 Jul 2025 06:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEQPPi6o0LODTOU2zLkwblacIwl3YlXo1Nun2SSAMRBR5j4a1sXKXJOGvFdZ7mdOyxi2znzYIRvprAsrwSuMgIefXTuCCAYI3shcFQiBzcPNn8ZAF/yceqqZTQ/1DqI61BFwdAHiH4W1RVQzjNmbG5vwH0E2p2aj03K5pKR7zHtjq0pDGLs/679tfUQXJeFwe9/GD1KdOOTvW98iWCyvpFBNY2onuX9FHR8MMhGN2TfuVTlnf4RZVqGpUJGYu5elqjF7xeexsr2f85uqzG4VEvLEgoGJyMumFRq3y8xhQF3sAi5UPhdIsM/uVBqoLzRhotHmbYFou6NKY+W0lvEj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KR2P5TDHyImTGXQs3TWYCrseWvN8K+YVadgl6Ddrms=;
 b=c0dVaM89azyaN4mS/O7opcrTaiBu25kuP8QK6qxkbrJfNyKyfbAAwR6imSqyG4jNaRfK0zR8rhTy4rcqDIYTnZ7YYj+ztqaV9uQ/5MfVbixMHK74p5T9UvsoxrW+hF+btOZMIWtYKqachms6LYGUWAiRiWoqfbzqfrOOgRedujd+8kYsVnNUH50hKvaI/fx8BXNkZ0gGpSFrqN3h0XoZt/9CB1n/9zZLt/JkPqZG/3afkW0ldMTw5h4yl5O5C7zF+a3IeKocjeqD4GnE8CfOyYU17Y3ViMc1PkOuZtS6uP43Br8BCg6CuX3dTj4OlJQYCsW2QJZOI5dRaH94LEeK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KR2P5TDHyImTGXQs3TWYCrseWvN8K+YVadgl6Ddrms=;
 b=IOfJ/UhhzaW6hevo0HT8xM3aW/zrHxQx49L4TcYdzINCjnq1umAQwmjJ3xuU8YpkG3VqL/OBr80ubLYO3z5apemrui4h9sdWuqJy80ozT1BJLGH/P3gXwpLzAYsGiL9ukxAARRMgySPxBPDorzAbuHAA18VMtPHhP/jLwKwQ8O1ROauM5aYjE/QIAPaoZqVZ0T/z+STFz1h2PoScJQYbEZd3EwTjnJxbO2oyhjkzkxEJJJMO9CwYWnuuF5xLhGXp/EqdmrNtQMdylu+uY84yBbQp3VKuta96NOUGeZ8L9ftAvjyvVmZ3Wm1ymTdF8sD9cTrMfSTj63NJQf2/oV3ADg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7181.apcprd03.prod.outlook.com (2603:1096:400:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 06:14:24 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 06:14:24 +0000
Message-ID: <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
Date: Fri, 18 Jul 2025 14:13:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
 <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ff7ad7-5960-420e-6f50-08ddc5c2578f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UElzQVRrdm1BdnhFQXpxM3VSZ1lLaklaUWJCWExwenlja2Y5cG9iQjdaUUsw?=
 =?utf-8?B?MXFWL1ZKMitTektzcFExYXJvTlEzOXAyQ3FGTkJlUks0OGNDU3ErN1MzNW15?=
 =?utf-8?B?UU1YZXhGZjBnODFlMzhaU0p0NkpadUFzSkJ0dW1ZNmNVQjFpcFgyYnFTaW9X?=
 =?utf-8?B?eklMWkRXaXB5MnBZZFVVZ3dJbEZLZHIrSHhON21JY3NZVmJRWU5zVWFaRnpD?=
 =?utf-8?B?ditvemxCakxSTFZNWTVmaTMrdi9Zb2JCZDZObS9jQzVFWXNXY04vYmJxVlJZ?=
 =?utf-8?B?TGIvWmZTdWR1SXo0bHdRYjRFWjNQREVXYWg0Y3RnTjVrWVJSSmcwTzJjNVlq?=
 =?utf-8?B?ZHVjakVWRjdpa0J0TklPSVpXN255cVFsWFpkMDhQNzU2TExxYkNnRjMxSkNK?=
 =?utf-8?B?OUVCRHRZLzRzeUZkVzJndFgrdHA0MGNiOWIwTW1hei9Ca3FMRHlHVWFQaXRh?=
 =?utf-8?B?c3k5aXllV1lyRXJRNVVNanQ1UFhpMTd6dlM5Qy9hZG82ck4wODNqTlVoTzNB?=
 =?utf-8?B?eTk2dG5GN2ZpS00rK2c3V0dPdWF0eVRSMkptajFkZnhRMmhmRHNCQmxYMG5x?=
 =?utf-8?B?R0MxZU1CSmxoeVpBMEhaaVlNRmxmeTNlTGN3UUtuWExTUzZzWG9NMGpnUkl5?=
 =?utf-8?B?Y0liSDVqYStIOVM0RzVFdjNMNUF0RFNFTFhjSVg0aEhlVzhzR0hCWFdBT0FX?=
 =?utf-8?B?cVpHcEZVMHpBb0hvTGI0VFNPcm1yZ2lGSXVNbVF2cXdZQUIrSEF5aGR0MDlZ?=
 =?utf-8?B?cWdTYWZwQld1QXFpemZDTUhrek5Hd2VvVkxNOFhEUm15TnBwRmk4VU0xaE1W?=
 =?utf-8?B?VzJvQ1RzVmtCR1pDQ3F1bjRZNWtNMnFnNkVWUkVIcSt0K3F6VkxwSThHZFNq?=
 =?utf-8?B?eXpMTmUySkd2MHg0bDFXV2g1ajZqQktpRGtWNHFkMWY4SW5DZXFReXlTOXVt?=
 =?utf-8?B?QVB2cjNmQ21HVFlCUGFybEUxbWRibStqNm5GUjU5MFFMWGJkNDhFSUNBSWRk?=
 =?utf-8?B?NEFpSVcwSkw4Q2dXRTZkVmE4YUVqNEFLekVieXNINWFLNnRsekNOOW9PK0d1?=
 =?utf-8?B?K3d4VW1LU0tGV2svSEFkdUF5MlBhZ05pRnhSNzZvMlJqSW42RU82UDk0NVlD?=
 =?utf-8?B?V0JKTUJKY0xRb0lKUzB4eTB5MXcyMG1OcnZmZGpRWUpueTRDM0ZPNGhHZWFN?=
 =?utf-8?B?cVZLcnlCbmlnZlcyR3BXWCt3TXg1NDA4UERKSjFlbTFLVDJ2K1ZmU1FwOUJH?=
 =?utf-8?B?Z0s2VEYwSVJqQjVFV2k3cGZtZlNlWkljbi9jVXR0emY2MFlsNlRMOWN1VVkz?=
 =?utf-8?B?SlpwcHVKMytLd3h6UTl1RU95a25BZTdoMlhSenVWcU9BM3p0b3NvOHFTZFBM?=
 =?utf-8?B?bU96SW52T1JZZUlKVExxVitVMG9LVThOWjFBZXdqRUZ6czZKMUpZSUNUbFdw?=
 =?utf-8?B?WVRMRWUzNjFQblJleDVZa0hkYzA1ZUpSOU84RkNmaDBGQnVIRUUvOS80QVda?=
 =?utf-8?B?cUEzTW9CVkZVMmpIaWdqdWpaUk90dlFEMS9BdlhvTHZXUUVxQTNncWRRcXov?=
 =?utf-8?B?SzlWdmRwdTdJU0s0Tnk5VmE0dS8xM2QwU2hxTVZCelhNUy9tazJIZTV5RGVi?=
 =?utf-8?B?cHd3MnhPWnlUVW9xZDI4TTZpRkxzcEloMzlmRU5EeUphWDVJNEtwMGt1WmV0?=
 =?utf-8?B?ZjZUdEFnNWM0SHh6TGFLaXB0WW1QMlBxUnU0ODl1TVNodCsxUS9ER2paTVJ0?=
 =?utf-8?B?NWhJNEZPMmk2Z1hBNmpFMVdycWYzZXp0RWNkUDlPS0pUQkhENlZ6dmErdnlp?=
 =?utf-8?B?aW9RcnUxSTI4Y2Mvclo1NG00UVJlcFB2QjFiWXF4TGFKdEo1eGdlN0NEWk0z?=
 =?utf-8?B?ZlNqS3FVSjMxdkNMeWo1RVd5bXIySGgrUkh1WENwUXRSUXlBMkxYZE03SmVD?=
 =?utf-8?Q?hxO0x+o5lh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGx2ZXhoV1dMejdiZ1Y3eFJ6TmNIem42S0c2UCthOGtFRmFZdDBKZXpMZ2pv?=
 =?utf-8?B?cTlNOEswWVQ2Q2laUytWazlrU3dQSWhDNExYMXdWSnllQ3Z6bkhBM3FERW5z?=
 =?utf-8?B?NXhXaFBFcHBROWNCcjFCVGNIby9XUVNlWlM1S0x5TkV2MGE4bXJXUVcxbzIy?=
 =?utf-8?B?MFlwd2hEWmZsZFRTV3hOWGR3Tmx6K1g0eFhwTHZsK2Z0T2N1amtzY2tKWThj?=
 =?utf-8?B?K1B0Z2hlNUxMWHo0SS93WUJndmVBMVpRcjNGRHdmSUpmSEdrTjRFV0lYM2JG?=
 =?utf-8?B?SitWQlV2S1BBOXZRRXN0TC8zOUhKcURzNGFqd0V6RjBxTkZZVDl1UUdnVmVa?=
 =?utf-8?B?dlVXMHRJY1VkR2pjangrMVc4MUhCRWFoZldVOW9sWU4yM21pZVYzVytXZTJp?=
 =?utf-8?B?dVpxK28xNTlRbDVvMXJIV3dTVVRFNlZhS3p5U3lyNmpyVUJVck5nd3BDRitQ?=
 =?utf-8?B?VEdSV0ZLdDYrVzVGMDI3aDlxNmwvc2RyYmg0V0pXa0hrZ3BIeTV6SytrUjJk?=
 =?utf-8?B?cmZKejMwWDhFRXhyU3FDRXlyaDRmMXlzSDdBZ1B6dWJyZmptNnhqUXhmNDdN?=
 =?utf-8?B?NnVWVDYwTzRoNEcrSHd5Uy84WmZVMHF0R1VacEhIdTRQaVgrWURsaThEZ3Rw?=
 =?utf-8?B?cFJES2pFNmlPT2lTNE5BazB1bkRHQ0dGd3ZuUGQ2TmhweXk5STdicUQ5eGVy?=
 =?utf-8?B?T20zUU9ya2tiMmRUTVVRY3MvNUJvVGgvUHhjSWd2blpCSDZHQkN6K0NSaUpQ?=
 =?utf-8?B?SnZkeEhRakQ2OUcvelE3ZjIyRFdNVG1qRGlia3F0QTRXN1ZZOUt1amdFeWFh?=
 =?utf-8?B?eTBNaDIyYncyTXFadEJ0R0ZSaC95aStBWWhCaWl3bGpVS2RzaWtURS9uKy9S?=
 =?utf-8?B?ZWdQV2ZybHVsYXhGeW1hVFduQjd4TlE5ZVY2WmtYZnBSTWhkRVBYK3JLL1hM?=
 =?utf-8?B?TnFDK3BuVTZiM2loemNyMlhSaDBoUksvcVNMRlk0bEFYSzY4SlltOXMwcGVM?=
 =?utf-8?B?SythNTZDd09LaW8vZnVQNmE5a0hZMU9mSGswNDJWd0wzRmZESkJPd2phbkJz?=
 =?utf-8?B?L0ZFVHRDWEI5akpLUFZBVEFsRVVMU3lJTXJFYjlmNFRXZ1kwYWJxdVhGU2Ri?=
 =?utf-8?B?OHpORlhIek0wbXB0cHhLSlhnMFRwZzJCLzdoVHI2eVdiYy96V0JNUVZVUjF6?=
 =?utf-8?B?QmR5UVp5ZU5OckJBSlBQNHZvcSs5ZEJXZjZBSTE2aHNudjFXaXhxa1g2aitN?=
 =?utf-8?B?dlFRUVJXWVNWYm5EbkRnRTV0bSs0Vi9YSHQvQThHbHpISmxiL0wyRG5MZXZR?=
 =?utf-8?B?MndnbHl5alBtUEpuL2piUGRVYkp4Z25sTDJySU5VeTZ4a1g5dEZMQTRiSUxM?=
 =?utf-8?B?THZXK3VHK0l2bVZnMnRZSVMwT3VzVStvYXZOVmkyOXZ4WWdsSkdkNm1DZ2tz?=
 =?utf-8?B?R2pIM1Y1a3R6VjYwcm1mcUdYQmsyWW5mdmNOS0I4NnlOTlp2MjI5MGlNdlAw?=
 =?utf-8?B?VGMyYkh0OEw3dStRdzVzK3Zxb05JakVoT1ByYjhkMy9HOGY1SHhVTzRqRnZ6?=
 =?utf-8?B?NHV2Q2FvL0JxM2FqZXNLWmJtYXpRUVA4OXVSRm9JTG9LS1M2a1BxV2R2VUQ1?=
 =?utf-8?B?T0crdjB5S09qUnlEQnA0Mk5ITVhtc0h1eHFVN3lzSnZ0ZkdNVHIwVEZacDY4?=
 =?utf-8?B?VlNBQkpaK3pzY0ZyMzRYcjlNUGU3bk1hSCt2c202TTR4Rnk0V1VoZi8rNlFX?=
 =?utf-8?B?QVJwTnRZakwrbGozMVEyOXZqZXF2OFkzUHdkQ05HQi9BYUxYQng1NnZWdWJ3?=
 =?utf-8?B?YVVlY0V2TUFzK1lTS1BXVXVlVXVkbTBEVE9EVXdTUGFjYU5OY3VYWVcwNjZK?=
 =?utf-8?B?VXRhSEJEL0FaZ3VFak8zcDJNRmJsbmQ1R3k2NXh0clRqMzBTcWxNVUxBWVkv?=
 =?utf-8?B?NDU2L2NnZ1k5c3pLcWlLSnc2cEFLUjBkaEJiMmtjemIyVXNOV0FNY1ZyK01T?=
 =?utf-8?B?Njg5VzJyM2xEU0NnOG9Pb0VPUXRQSWN1ZFJQWmQ2VXNYd1NNVktoZjlnQ1NB?=
 =?utf-8?B?K1RkR2QwbU93cjZNbmdNQUxQNUZkMXJqUkZUWmE5aUtyaTBad2tTazhJb3d2?=
 =?utf-8?Q?s3IViXJdLJn6GyWuRSWzlZ++l?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ff7ad7-5960-420e-6f50-08ddc5c2578f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 06:14:24.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+DHDkYbTNX6VKJlFO9Cmo5VFStprP+VVupqClqUu7LtF17KU6A3f7lJ6roi2gKTErFFVa4UWBkIS7Zp9kyJig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_231444_705708_899B7910 
X-CRM114-Status: GOOD (  19.85  )
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

aGkgTWFydGk6CgoKT24gNy8xNy8yMDI1IDExOjQzIFBNLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdy
b3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gSGVsbG8sCj4KPiB0aGFuayB5b3UgZm9yIHRo
aXMgcGF0Y2ghCj4KPiBPbiBUaHUsIEp1bCAxNywgMjAyNSBhdCA1OjA44oCvQU0gQ2h1YW4gTGl1
IHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3Jn
PiB3cm90ZToKPj4gRnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+Cj4+
IFRoZSBjeWNsZSBjb3VudCByZWdpc3RlciBoYXMgYSAyMC1iaXQgZWZmZWN0aXZlIHdpZHRoLCBi
dXQgdGhlIGRyaXZlcgo+PiBvbmx5IHV0aWxpemVzIDE2IGJpdHMuIFRoaXMgcmVkdWNlcyB0aGUg
c2FtcGxpbmcgd2luZG93IHdoZW4gbWVhc3VyaW5nCj4+IGhpZ2gtZnJlcXVlbmN5IGNsb2Nrcywg
cmVzdWx0aW5nIGluIChzbGlnaHRseSkgZGVncmFkZWQgbWVhc3VyZW1lbnQKPj4gYWNjdXJhY3ku
Cj4gSSBjaGVja2VkIHRoZSBNZXNvbjggZG93bnN0cmVhbSBjb2RlIFswXSBhbmQgaXQgdXNlcyAw
eDAwMEZGRkZGIHRvCj4gbWFzayB0aGUgcmVnaXN0ZXIgdmFsdWUgLT4gdGhpcyBtZWFucyB0aGF0
IG9sZCBTb0NzIGFsc28gaGF2ZSBhIDIwLWJpdAo+IHdpZGUgd2lkdGguCj4KPiBbLi4uXQo+PiBI
ZXJlIGFyZSB0aGUgdGVzdCBjb21wYXJpc29ucyBiYXNlZCBvbiBDMzoKPiBbLi4uXQo+PiBIZXJl
IGFyZSB0aGUgdGVzdCBjb21wYXJpc29ucyBiYXNlZCBvbiBDMzoKPiBJIGhhdmUgdGVzdGVkIHRo
aXMgcGF0Y2ggd2l0aCBNZXNvbjhiIGJhc2VkIE9kcm9pZC1DMToKPiBwcmUtb3B0aW1pemF0aW9u
Ogo+ICMgdGltZSBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVzb24tY2xrLW1zci9tZWFzdXJlX3N1
bW1hcnkgfCBncmVwIC12ICIgIDAgICIKPiAgICBjbG9jayAgICAgICAgICAgICAgICAgICAgIHJh
dGUgICAgcHJlY2lzaW9uCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gICBjbGs4MSAgICAgICAgICAgICAgICAgMTU5MzcyMzk2ICAgICsvLTUyMDhIego+
ICAgYTlfY2xrX2RpdjE2ICAgICAgICAgICAyNDAwMDAwMCAgICArLy0zMTI1SHoKPiAgIHJ0Y19v
c2NfY2xrX291dCAgICAgICAgICAgMzEyNTAgICAgKy8tMzEyNUh6Cj4gICBoZG1pX2NoMF90bWRz
ICAgICAgICAgMTQ2Mzk5MDM4ICAgICsvLTQ4MDdIego+ICAgc2FyX2FkYyAgICAgICAgICAgICAg
ICAgMTE0MDYyNSAgICArLy0zMTI1SHoKPiAgIHNkaGNfcnggICAgICAgICAgICAgICAgOTQ0NDM3
NTAgICAgKy8tMzEyNUh6Cj4gICBzZGhjX3NkICAgICAgICAgICAgICAgIDk0NDQzNzUwICAgICsv
LTMxMjVIego+ICAgcHdtX2QgICAgICAgICAgICAgICAgIDg0OTkyMTg3NSAgICArLy0zMTI1MEh6
Cj4gICBwd21fYyAgICAgICAgICAgICAgICAgODQ5OTIxODc1ICAgICsvLTMxMjUwSHoKPgo+IHJl
YWwgICAgMG0wLjEwMnMKPiB1c2VyICAgIDBtMC4wMDVzCj4gc3lzICAgICAwbTAuMDY5cwo+Cj4K
PiBwb3N0LW9wdGltaXphdGlvbjoKPiAjIHRpbWUgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29u
LWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5IHwgZ3JlcCAtdiAiICAwICAiCj4gICAgY2xvY2sgICAg
ICAgICAgICAgICAgICAgICByYXRlICAgIHByZWNpc2lvbgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgY2xrODEgICAgICAgICAgICAgICAgIDE1OTM3
MzQzOCAgICArLy0xNTYySHoKPiAgIGE5X2Nsa19kaXYxNiAgICAgICAgICAgMTIwMDAwMDAgICAg
Ky8tMTU2Mkh6Cj4gICBydGNfb3NjX2Nsa19vdXQgICAgICAgICAgIDMyODEzICAgICsvLTE1NjJI
ego+ICAgaGRtaV9jaDBfdG1kcyAgICAgICAgIDE0NjM5ODQzOCAgICArLy0xNTYySHoKPiAgIHNh
cl9hZGMgICAgICAgICAgICAgICAgIDExNDM3NTAgICAgKy8tMTU2Mkh6Cj4gICBzZGhjX3J4ICAg
ICAgICAgICAgICAgIDk0NDQzNzUwICAgICsvLTE1NjJIego+ICAgc2RoY19zZCAgICAgICAgICAg
ICAgICA5NDQ0Mzc1MCAgICArLy0xNTYySHoKPiAgIHB3bV9kICAgICAgICAgICAgICAgICA4NDk5
OTIxODggICAgKy8tMTU2Mkh6Cj4gICBwd21fYyAgICAgICAgICAgICAgICAgODQ5OTkyMTg4ICAg
ICsvLTE1NjJIego+Cj4gcmVhbCAgICAwbTAuMTczcwo+IHVzZXIgICAgMG0wLjAwOHMKPiBzeXMg
ICAgIDBtMC4xMDlzCj4KPiBTbyB0aGVyZSdzIGFsc28gYW4gaW1wcm92ZW1lbnQgaW4gYWNjdXJh
Y3kuIFRoZSBvbmx5IGRvd25zaWRlIEknbQo+IHNlZWluZyBpcyB0aGF0IGl0IHRha2VzIDc1JSBl
eHRyYSB0aW1lIGZvciB0aGUgbWVhc3VyZW1lbnQuIEZvciBtZQo+IHRoaXMgaXMgaXJyZWxldmFu
dCBzaW5jZSB3ZSB1c2UgdGhpcyBmb3IgZGVidWdnaW5nLgo+Cj4gWy4uLl0KPj4gKyAgICAgICAv
Kgo+PiArICAgICAgICAqIEhBQ0s6IFRoZSBpbnB1dCBjbG9jayBzaWduYWwgcGF0aCBmcm9tIGdh
dGUgKENvbnRyb2xsZWQgYnkgTVNSX1JVTikKPj4gKyAgICAgICAgKiB0byBpbnRlcm5hbCBzYW1w
bGluZyBjaXJjdWl0IGluIGNsay1tZWFzdXJlIGhhcyBhIHByb3BhZ2F0aW9uIGRlbGF5Cj4+ICsg
ICAgICAgICogcmVxdWlyZW1lbnQ6IDI0IGNsb2NrIGN5Y2xlcyBtdXN0IGVsYXBzZSBhZnRlciBt
dXggc2VsZWN0aW9uIGJlZm9yZQo+PiArICAgICAgICAqIHNhbXBsaW5nLgo+PiArICAgICAgICAq
Cj4+ICsgICAgICAgICogRm9yIGEgMzBrSHogbWVhc3VyZW1lbnQgY2xvY2ssIHRoaXMgdHJhbnNs
YXRlcyB0byBhbiA4MDDOvHMgZGVsYXk6Cj4+ICsgICAgICAgICogODAwdXMgPSAyNCAvIDMwMDAw
SHouCj4+ICsgICAgICAgICovCj4+ICsgICAgICAgZnNsZWVwKDgwMCk7Cj4gV2hhdCBpcyBuZWVk
ZWQgdG8gbWFrZSB0aGlzIG5vdCBhIEhBQ0sgYW55bW9yZT8gSXMgdGhlcmUgYSByZWdpc3Rlcgo+
IHRoYXQgd2UgY2FuIHBvbGwgZm9yIHRoZSBudW1iZXIgb2YgY2xvY2sgY3ljbGVzIHRoYXQgaGF2
ZSBwYXNzZWQ/CgoKVGhlIHJlcXVpcmVkIGRlbGF5IGR1cmF0aW9uIGlzIGZyZXF1ZW5jeS1kZXBl
bmRlbnQgb24gdGhlIG1lYXN1cmVtZW50CmNsb2NrIHNvdXJjZS4gVGhlIGN1cnJlbnQgODAwzrxz
IGRlbGF5IGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gYQptaW5pbXVtIGlucHV0IGNsb2NrIGZyZXF1
ZW5jeSBvZiAzMGtIei4gQXQgaGlnaGVyIGlucHV0IGZyZXF1ZW5jaWVzLAp0aGlzIGRlbGF5IGNv
dWxkIGJlIHByb3BvcnRpb25hbGx5IHJlZHVjZWQuIEFwcGx5aW5nIGEgdW5pZm9ybSA4MDDOvHMK
ZGVsYXkgdGhlcmVmb3JlIGFwcGVhcnMgb3Zlcmx5IGNvbnNlcnZhdGl2ZSBmb3IgZ2VuZXJhbCB1
c2UgY2FzZXMuCgoKVGhlIElQIGN1cnJlbnRseSBsYWNrcyBhIHN0YXR1cyByZWdpc3RlciB0byBk
ZXRlY3Qgd2hldGhlciB0aGUgaW5wdXQKY2xvY2sgc2lnbmFsIGhhcyBzdWNjZXNzZnVsbHkgcHJv
cGFnYXRlZCB0byB0aGUgaW50ZXJuYWwgbWVhc3VyZW1lbnQKY2lyY3VpdHJ5LgoKClRoZSBkZXNp
Z24gb2YgdGhpcyBJUCBoYXMgYmVlbiBtYWludGFpbmVkIGZvciBtYW55IHllYXJzLiBGcm9tIGEK
aGFyZHdhcmUgZGVzaWduIHBlcnNwZWN0aXZlLCB0aGVyZSBpcyByb29tIGZvciBvcHRpbWl6YXRp
b24gaW4gdGhpcwpzaWduYWwgcHJvcGFnYXRpb24gZGVsYXkuIEZ1dHVyZSBJUCB1cGRhdGVzIG1h
eSBub3QgcmVxdWlyZSBzdWNoIGEKbG9uZyBkZWxheS4KCgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1h
cnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
