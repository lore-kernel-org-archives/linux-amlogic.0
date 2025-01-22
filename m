Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8948CC02181
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2025 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vygxry9b1wzZq8ksiMmKcKlHzkVsUHYs5cCyapS8imw=; b=KkYhUEF5W9pq0byvxcfrGRLrSI
	HjFB1lxJ8w4379kytFW/9Hk8E9PE1T9edQFHw3wW1tOxgCtxrP+3hymqx8d4FlPiPJQdS6LPxp7KL
	XCROSUkJeYIWs9hVGSq3VKuY2yValoAwCigsDZ54NgP4yRhbm5DoJCoP5GkbcfuMSwOEVs5MoeX1a
	TGawxI9Ta6O7Gkd0PlYRwJIOAvgTN5Zaq1zyZ7qHxEJSf/CD1z+cGX9kRKDqCf68vT77Vwmv4wP7v
	GX/bf8aCii5GzOKJtorWyiDnm/kUSVGt7/8feWM9EcsRC1Tz1IT1CVgHD5bPFYBevKRZXgiv+ReHm
	oWojDsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXO3-00000009qAJ-39ij;
	Wed, 22 Jan 2025 09:51:03 +0000
Received: from mail-tyzapc01on2070a.outbound.protection.outlook.com ([2a01:111:f403:2011::70a] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXNm-00000009q7V-1yH1;
	Wed, 22 Jan 2025 09:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a18qcHdjsK9CQT/IswjNz0ejseKQpymxKT1HpXIIhsWN7fjIbV+ymYMMjOGXQmpN75rb1EuvFDekpqRkJcuUt8uwy9TMPDzSW6Pj3pB1324aNVcVIVs95W3qLbtKSc4q7jYMn7dDk6nbTnBYP5NrMRLqcO6+WV/mmi/rs8a4SUgDyFvKQjeAeP21I/bOGYJaA7U3l1WeYWeKMgSfnfqVw1yPE2eS6GA7ihWIo44+vyyYYGZYgvQZJ9GiW6zjwgGOl1sbsQvcWPTe7ba18c4HCdlTpTvFwNq/jXOHDcLqcPDAcsogoV0ExLFR9UOuG7A2Nvib3b7oNnjxciLwsdqS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDYt3TIelwB9XXttsZTSY33aWcaWYEgNY4NojCYHGcc=;
 b=Hoj/2fOLW2PkoKgm1XBPWqsVU2aer6wLZJbvgUPAT+EXES7UrYANzLD37ppBDF9SuUEGnx9S8i+hWcF0++TNPPktOwqq0gKdAGDUsTIzDXCtc3PyH0UqLinVZvXlPa8UvrxW5SZuG7IZdQ0aMMBhkdapy87DNGMLxW8HliNL7CsHk5P05/MKgpTEDIS9iybtJQ1v6YOATh/FS14t1qMWZ9WYN7soQFmqbHHtcPNZAfnvZTbvSEMLHBDLWcPcjzxNViI7ZJoqEJ0XXkeEbGDOodDfahUoXnzprIlU2uCPYyRkDh1+N6eZvQKyClyaUWw+MwJZRJIUQJongk68iws83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDYt3TIelwB9XXttsZTSY33aWcaWYEgNY4NojCYHGcc=;
 b=w2ytXgYRzW1g4PSNKW6GeqgZfVj/fv56ESBZYYeBQ0JPc5owjAAEP/S9a3xjuGytXkZ/UxhqeCgRxKCMt9WQ6dJ0KBqpDDJ5ws7aUQaQu3DLVM15X5DdBh3HaNW3ZHi+yhHVf7OrWz7oUSopy6J4O7plvULJ+182y3E6pfWQ+AJIGdGu+nzWVPxtEYGAdCvZuyDdsKtdMeA621KiH6R9IT9xFTR1dUHUgg4YgYLk6BRd6uJOLYr+eHgLQ1r3g+6fX8427C/dd3+NO/hW0BjWF0pcmiPMwj+f+CNaYqRV3U74DgXZ6de1+mZjTTBMZEgo2rLA+4Ib97BVh/psGFSgqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by OSQPR03MB8436.apcprd03.prod.outlook.com (2603:1096:604:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 09:50:31 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 09:50:30 +0000
Message-ID: <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com>
Date: Wed, 22 Jan 2025 17:50:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: KL1P15301CA0059.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::20) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|OSQPR03MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8bc139-60a8-4cd5-9743-08dd3aca351d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJnanVudE1qSWhnOWtMS3ZWN0JaeEtOUHlPUDIrZG8ydDV4SFZia2FmL1hn?=
 =?utf-8?B?ZFd4NUVtSFFFaFU3TmRpSUI4aGxXSy8yMU51S2hjM211ZkVCTzB2bHlvcm1Z?=
 =?utf-8?B?aU05VXNFQ1NoRTF6cWpGNGh5NWU2NnNGeGQwU0RRcFRnN0NrQWJJTWJaUlp3?=
 =?utf-8?B?NnpETUtnYmF5REJmQ1YzdkwwcWNhbUsrZ3RiOUZxRFVESDd6MnNqWTZQRWU5?=
 =?utf-8?B?eEVYbDIrZ0F5eXM5UFJ6a1JNMzRwamozWmRMdU5heDlFNWJGOXhRbHdxdU5v?=
 =?utf-8?B?ekxVUUx5S3Z4cThIWkJVL1plZUxhNk9jUkJtaFp4YVU1Tm42aG92eklDNGtQ?=
 =?utf-8?B?RGRhUkFNQytmdmtsaVFWcGpQNDNCMFBxVUovMlNUV2RXS1pHcWJHVFhoMXM0?=
 =?utf-8?B?UW5HcmR6Rk85bFIydGlsczU3VWhsZlM2amphb1h3ZGxNVis0UW9sallSTWFW?=
 =?utf-8?B?RmVmZnAxV3AxN0tYVld4Um5LTlZCNUt3dUNnNDVkUlBmaDdwUC9weEYrYmhh?=
 =?utf-8?B?MnFOSjFGSW1mTXo1YldmM2ZLTGZUcXdxdjZBMHRyeGNrZERlWE4wSlZhS1Rs?=
 =?utf-8?B?ZkhEOEEyNE1aVjBTZE5wVnJ3OFN5Mm1EdEpWV0F4THh0R3ppaUJtMVNZdkdG?=
 =?utf-8?B?WHREbnpYWFlFalJGVHc4cWNtUTFYOXhjS1JyMVVRaUJFY2M2dlo2NTFRMWpI?=
 =?utf-8?B?YXIwMk9rZFJMZ09nWVlrZXFwSkxhejhhaEF6L1RZZmlsVXlPaFp2YjZnSmRR?=
 =?utf-8?B?T1h5Z0lZdlFYYVU3SHErTWNwMzZEakhnOVpGNHg2MHZxc3h6NVNha20xMzdU?=
 =?utf-8?B?WVpvWUd6Z2lYU1pIVGNuR2UycC91Wm5MR0Z0cFZPSjIwOHUyOUdyNEpNcXl2?=
 =?utf-8?B?NWVzWmhPVVZ4SWhlckNyQnBNVG9SQkFoUm42ZmVLUUVqelhYTVFUY28vbUN0?=
 =?utf-8?B?OHVjc1RUSnQ3RmxsTmFSZ2JlOC9aOUR4T2NoOE1OeFk1WUY0dXBzaHMzZFpW?=
 =?utf-8?B?ekx6ckE3ZTJwbjIwMnoxbjhnbFhsazhPdWFHQVROOHhrbS9qWVlYN3J0RUN0?=
 =?utf-8?B?eDZHYkUxWHhyV2ljZURraGY5cWNyaG1PODFvS2xZZHh6WVduQXVKQi9UTHhW?=
 =?utf-8?B?dlVJaWkyaGcrdE1vanJQMmZXVk5BUDY3eVU4eTcvOURVVU02a3p2R0J3UlZ2?=
 =?utf-8?B?WG4xZmVlVW1FTk02LzF5dTFnNnp4ZkJtYk5mR0V2T1FCLzFtN3VtWDhmZkRW?=
 =?utf-8?B?UVgzY016WDZDUUxKWWM1UHJWcjV1TW9rSnZQcERIZzMzOEptdVhPN0JLSUx3?=
 =?utf-8?B?eTR6bU15NStpdjhlOWM1bHdaUmJhUG9Nb3NyUWtONzYzbEJJTmhXTW9pQmli?=
 =?utf-8?B?NjJRZlNMSHd5YW43Y04zSDErNnQ4Rm5wdHFUQ1pGN0FoTUQ1akV2d0FBQ2hx?=
 =?utf-8?B?eGFmbk5lMVhwL3BhZEJLVHgvVkFMNnA0NjRQNVFHUlZFaXBmUEJ3OGxBQmtP?=
 =?utf-8?B?OHZxY29YbGE0NU42MDZ3dWlSRjEyR3dZSUlWNXVjUjlTYlVXcFFkSVJyUUN0?=
 =?utf-8?B?Tko0VmJERTIyZzQ5Yjg5Z25hTkRDQ2IwZHVPbVlqVHQ3L0dhUzBwSDVxM0oz?=
 =?utf-8?B?eHRocGJORzBJNThlcUw1WHE3YWVxRCttckdyZW4xcjZzZWJselJueTRHMjVq?=
 =?utf-8?B?dGVKZTdiTWloK2NCSndTWGlMWEtybkxUL3k5elFKa0htbW5LNVd4NFJ5UXUz?=
 =?utf-8?B?Rk53OXhuUEp2UEwrZktZR3p4VGExNUFwc0ZHWktwRVEvMHIrVlJoWjlKSWF4?=
 =?utf-8?B?aGVPTWRLTXFtTVY5aW1kdXgxaUhhZmNrSXRqbno5VHJyUFdSRXYramtTWHpT?=
 =?utf-8?B?V25tekR5TSsra2xlYXNCdWtucUNWSjQ5bS9EZDA3cnQ0U0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7155.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQxc3ZCWHpDM3BzM255QTJiNXZLd2VFc2JFTE14b3hMVHpUL21ic1daWC8r?=
 =?utf-8?B?TnREQko2ekw3Tzd5eTd0RlloK1Q5WTlPeWZlbjAzd3BjWTdiWjlmSURPZlJM?=
 =?utf-8?B?SHpwOWVUWVdjeFBaVFpqRXZDcS83R2xDMUdNMUVGaHpEbi9rcG8yc29QR0xG?=
 =?utf-8?B?TnV0QmVWK3NaM2s5UUJ2aGpHZW91ckg1YUU3V2l6NlRkMi90N2ZqcUp3NXJQ?=
 =?utf-8?B?d3A1R3ZWL2daa2lXMDAraTZtK2Q0VnVwS1hoUzhiQkpzWHJGblhndnV0eHlY?=
 =?utf-8?B?ajFsbGpuNmNOU0JnWURPTGEyZTRtNUI4Znp0Z0RjUFpkZEhZblRmNUhDdUZT?=
 =?utf-8?B?NmdTVmo5dHZZUkxmenFaTVc0THZTSGFNY2YzYUFzQmRPaU8wWnlmcFZDa3F0?=
 =?utf-8?B?bFJrZTM0T0ZDMHRyMHhNZm5yVWs0bmhCL2Jmd0EvNFVzM2pEQitlSjBiempG?=
 =?utf-8?B?bDBta09sVzlrUWx0YkV3K1hYS1REbnlJeXFGYVg5cDFPTUN0emp5aW5qM2Nv?=
 =?utf-8?B?MnhWUHR0dkJxMTlKRDhyemI1YkRtWGRDOFJEdXpLcjg4d2JpWGNDT2hsblZV?=
 =?utf-8?B?cmlqT3UrZ2c0WEgzRVFrYTB3cjF6S05WV2ljNmFSZzB2MEkrNzZ1MTJQUFdo?=
 =?utf-8?B?VnBaTUZqdTJMYS96eDVURTZZZ3E1Mnp1NnFIUEttL2FTSnBZWjhxT1NpRjdB?=
 =?utf-8?B?bWJZMWRlMXg3L1MrMWxMdG5DL3RTYlFIVjFPMUlob1FoVjZGdG5oZ05tSUg2?=
 =?utf-8?B?U0xIMVVLK1UvdE1TL2xJQk9ydkd4MWwxc1E3MDFXWHFzSUtpR2haYitpWGg4?=
 =?utf-8?B?TEJGcG8zaXFjTHlJZHp0UjBkMkFvRTN6NWlJREtyNWNGLzhiM1ZuT0ZoU3Na?=
 =?utf-8?B?c0pvOHlNUmF3RXVXZlowdEpPSE5Sa2Rrak5tVUQvNlpUa0FSWFBoZHJtcTlJ?=
 =?utf-8?B?eWxzNHY0NEZmRzZVMWpRWFU5YWNrd2Z3S0V1WmhWRUdFWmd1czVYSnlHZ0d4?=
 =?utf-8?B?RVFFdlVHcHRNelpPYTRyOUpPU00xeWh4cWNMNVFsSW1JelBscGtsb0ZKUTdl?=
 =?utf-8?B?bTBsUmZkMHFkZ2pJOElJYy9WQWk4d3JMNGZ4N1JZRzJGcmp6MGI4SDYrYVNC?=
 =?utf-8?B?TGozWk9aYWZ2R3VtSnk0SmdLcXhuNHZTbXJ4VlFTNEM2akt4L1pHT1h6MVdr?=
 =?utf-8?B?MHRScmEva1pRK1NQelJqN1hldnhBcE9ldU5EY241bHBSMEhXNHl5SlEzdmpk?=
 =?utf-8?B?ZFVyYzVtSWZRQjdKYWxlb2VhYVVkTUtkTlhja2Q4d3V6Y1lYVWVIcUF0eHR6?=
 =?utf-8?B?N3crRlBOdXY0akkwRHVjVk9BSFp3LzcyaE1valBQZXZhNEpqYWVwbm5zaVBX?=
 =?utf-8?B?OFd1UVZzaVArU3FNU25VbXFCV0p4RnFJMDdveXpZS3BsNlgyc1NRdkszN0g4?=
 =?utf-8?B?SHJnaDlkNFd2K3JmQmEvUVN1RXQvQlFjWlVaRFBHWFhGT2pNNXBWbzAxWEZL?=
 =?utf-8?B?TXNuKzhrSHRWNHdmbkx1dmVFQVRFc1ZhU2tHdzk4U3NFT0V4SXcwMkhmQ21P?=
 =?utf-8?B?N2FqTytGOC9nTnhEaVFNR2pMRE5wcWMxLzhvS1FPbDdPRWVLTFgrTFlSVTQw?=
 =?utf-8?B?Y25jTlRqNnd3cUZMWTZybElMY2FsNFFEL3NpMGVKQnBMTGt5eWwxU2tJcjFx?=
 =?utf-8?B?UkN4c1VyVFcyWkpzMS8zbk1SSHpqSmdlMUY3cndlNVFWNHhFOHA0NVFDVHBR?=
 =?utf-8?B?RUZ3c1BoSlBVQ3ByOW5LR3IxSzVuQWIzVlQySVBDVnZvcUw3eGFrNHlVNTgz?=
 =?utf-8?B?TEJNbTI4aml5MTRQcnpTSlpCSjlJYXFoM2tNdkVwV3I1enlFVk0zbUYrVnpK?=
 =?utf-8?B?N01DRk9MSzk2cTFhYVErS3V3L2U4SFhiTXNSV0l0eW5LdUFPNnUzUitKbmRJ?=
 =?utf-8?B?M01PM1BmSU1JS1ZWNS9sVXB4a1NmMlNFRlZTNksvSXBHcmZQcy9FL09IVm42?=
 =?utf-8?B?RHdtdVI0Q2c1eFlvTFJObFRaYmlsM1BFZmdEdWIzRVRzMXNBckxTU1VTcUh0?=
 =?utf-8?B?VXYzN1kvSEtpMmRLRm8rRjVWOU51WXhCckFrVHBFejlObWdSbW93UlZxZmN4?=
 =?utf-8?Q?s5l1rqWory9YXgRb0Zg8MqspX?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8bc139-60a8-4cd5-9743-08dd3aca351d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 09:50:30.8460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdllN26YsxCGSttWdmmo45RPLy5ipQIiqTwHafEF3ntjQCRx7P0aP9uvfnCH6WD+xjyv46d8AM2BRLYS/cIlBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015046_608407_9F49D950 
X-CRM114-Status: GOOD (  36.59  )
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

T24gMjAyNS8xLzE1IDE6NTAsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4KPiBPbiBTdW4gMTIgSmFuIDIwMjUgYXQgMjM6NDQsIE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4+IEhlbGxvLAo+
Pgo+PiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCA2OjM54oCvQU0gQW8gWHUgdmlhIEI0IFJlbGF5
Cj4+IDxkZXZudWxsK2FvLnh1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gVGhp
cyBwYXRjaCBzZXJpZXMgYWRkcyBEUk0gc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgUzQtc2VyaWVz
IFNvQ3MuCj4+PiBDb21wYXJlZCB0byB0aGUgQW1sb2dpYyBHMTItc2VyaWVzLCB0aGUgUzQtc2Vy
aWVzIGludHJvZHVjZXMgdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+PiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2hlcy4gV2l0aCB0aGlzIG1haWwgSSdsbCB0cnkgdG8gc3VtbWFyaXplIG15Cj4+IHVuZGVy
c3RhbmRpbmcgb2YgdGhlIHNpdHVhdGlvbiB3aXRoIHRoZSBkcm0vbWVzb24gZHJpdmVyIGFzIEkn
bSBub3QKPj4gc3VyZSBob3cgZmFtaWxpYXIgeW91IGFyZSB3aXRoIHByZXZpb3VzIGRpc2N1c3Np
b25zLgo+Pgo+Pj4gMSBUaGUgUzQtc2VyaWVzIHNwbGl0cyB0aGUgSElVIGludG8gdGhyZWUgc2Vw
YXJhdGUgY29tcG9uZW50czogYHN5c19jdHJsYCwgYHB3cl9jdHJsYCwgYW5kIGBjbGtfY3RybGAu
Cj4+PiAgICBBcyBhIHJlc3VsdCwgVkVOQyBhbmQgVkNMSyBkcml2ZXJzIGFyZSB1cGRhdGVkIHdp
dGggUzQtc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzIHRvIGFjY29tbW9kYXRlIHRoZXNlIGNo
YW5nZXMuCj4+IEplcm9tZSBoYXMgYWxyZWFkeSBjb21tZW50ZWQgb24gcGF0Y2ggMy8xMSB0aGF0
IHRoaXMgbWl4ZXMgaW4gdG9vIG1hbnkKPj4gSVAgYmxvY2tzIGludG8gb25lIGRyaXZlci4KPj4g
VGhpcyBpcyBub3QgYSBuZXcgc2l0dWF0aW9uLCB0aGUgZXhpc3RpbmcgY29kZSBpcyBkb2luZyBl
eGFjdGx5IHRoZSBzYW1lLgo+Pgo+PiBKZXJvbWUgaGFzIHByZXZpb3VzbHkgc2VudCBhIHNlcmll
cyB3aGljaCBzdGFydGVkICJhbiBlZmZvcnQgdG8gcmVtb3ZlCj4+IHRoZSB1c2UgSEhJIHN5c2Nv
biIgWzBdIGZyb20gdGhlIGRybS9tZXNvbiBoZG1pIGRyaXZlci4KPj4gSW4gdGhlIHNhbWUgbWFp
bCBoZSBmdXJ0aGVyIG5vdGVzOiAiW3RoZSBwYXRjaHNldF0gc3RvcHMgc2hvcnQgb2YKPj4gbWFr
aW5nIGFueSBjb250cm92ZXJzaWFsIERUIGNoYW5nZXMuIFRvIGRlY291cGxlIHRoZSBIRE1JCj4+
IHBoeSBkcml2ZXIgYW5kIG1haW4gRFJNIGRyaXZlciwgYWxsb3dpbmcgdGhlIFBIWSB0byBnZXQg
aG9sZCBvZiBpdHMKPj4gcmVnaXN0ZXJzLCBJIGJlbGlldmUgYSBEVCBBQkkgYnJlYWsgaXMgaW5l
dml0YWJsZS4gSWRlYWxseSB0aGUKPj4gcmVnaXN0ZXIgcmVnaW9uIG9mIHRoZSBQSFkgd2l0aGlu
IHRoZSBISEkgc2hvdWxkIHByb3ZpZGVkLCBub3QgdGhlCj4+IHdob2xlIEhISS4gVGhhdCdzIHBh
aW4gZm9yIGFub3RoZXIgZGF5IC4uLiIKPj4KPj4gRm9yIG5vdyBJJ20gYXNzdW1pbmcgeW91J3Jl
IGZhbWlsaWFyIHdpdGggZGV2aWNlLXRyZWUgQUJJLgo+PiBJZiBub3QgdGhlbiBwbGVhc2UgbGV0
IHVzIGtub3cgc28gd2UgY2FuIGVsYWJvcmF0ZSBmdXJ0aGVyIG9uIHRoaXMuCj4+Cj4+IE15IG93
biBub3RlcyBmb3IgbWVzb25fZHdfaGRtaS5jIGFyZToKPj4gLSB3ZSBzaG91bGQgbm90IHByb2dy
YW0gSEhJX0hETUlfQ0xLX0NOVEwgZGlyZWN0bHkgYnV0IGdvIHRocm91Z2ggQ0NGCj4+IChjb21t
b24gY2xvY2sgZnJhbWV3b3JrKSBpbnN0ZWFkICh3ZSBzaG91bGQgYWxyZWFkeSBoYXZlIHRoZSBk
cml2ZXIKPj4gZm9yIHRoaXMgaW4gcGxhY2UpCj4+IC0gd2Ugc2hvdWxkIG5vdCBwcm9ncmFtIEhI
SV9NRU1fUERfUkVHMCBkaXJlY3RseSBidXQgZ28gdGhyb3VnaCB0aGUKPj4gZ2VucGQvcG1kb21h
aW4gZnJhbWV3b3JrICh3ZSBzaG91bGQgYWxyZWFkeSBoYXZlIHRoZSBkcml2ZXIgZm9yIHRoaXMK
Pj4gaW4gcGxhY2UpCj4+IC0gZm9yIHRoZSBIRE1JIFBIWSByZWdpc3RlcnM6IG9uIE1lc29uOC84
Yi84bTIgKHRob3NlIHdlcmUgMzItYml0IFNvQ3MKPj4gaW4gY2FzZSB5b3UncmUgbm90IGZhbWls
aWFyIHdpdGggdGhlbSwgdGhleSBwcmVkYXRlIEdYQkIvR1hMLy4uLikgSQo+PiB3cm90ZSBhIFBI
WSBkcml2ZXIgKHdoaWNoIGlzIGFscmVhZHkgdXBzdHJlYW06Cj4+IGRyaXZlcnMvcGh5L2FtbG9n
aWMvcGh5LW1lc29uOC1oZG1pLXR4LmMpIGFzIHRoYXQgbWFkZSBtb3N0IHNlbnNlIHRvCj4+IG1l
Cj4+Cj4+IFRoZW4gdGhlcmUncyBtZXNvbl92ZW5jLmMgd2hpY2ggaGFzIHR3byB3cml0ZXMgdG8g
SEhJX0dDTEtfTVBFRzIuCj4+IEkgdGhpbmsgdGhvc2Ugc2hvdWxkIGdvIHRocm91Z2ggQ0NGIGlu
c3RlYWQgb2YgZGlyZWN0bHkgYWNjZXNzaW5nIHRoaXMgcmVnaXN0ZXIuCj4+Cj4+IEFsc28gdGhl
cmUncyB0aGUgVkRBQyByZWdpc3RlcnMgaW4gbWVzb25fZW5jb2Rlcl9jdmJzLmM6Cj4+IEkgdGhp
bmsgTmVpbCBzdWdnZXN0ZWQgYXQgb25lIHBvaW50IHRvIG1ha2UgaXQgYSBQSFkgZHJpdmVyLiBJ
IGV2ZW4KPj4gc3RhcnRlZCB3b3JraW5nIG9uIHRoaXMgKGlmIHlvdSdyZSBjdXJpb3VzOiBzZWUg
WzBdIGFuZCBbMV0pLgo+PiBEVCBBQkkgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgaXMgYWxzbyBh
IGNvbmNlcm4gaGVyZS4KPj4KPj4gQW5kIGZpbmFsbHkgdGhlcmUncyB0aGUgdmlkZW8gY2xvY2sg
dHJlZSBwcm9ncmFtbWluZyBpbiBtZXNvbl92Y2xrLmMuCj4+IE15IHVuZGVyc3RhbmRpbmcgaGVy
ZSBpcyB0aGF0IHZpZGVvIFBMTCBzZXR0aW5ncyBhcmUgdmVyeSBzZW5zaXRpdmUKPj4gYW5kIHJl
cXVpcmUgZmluZS10dW5pbmcgYWNjb3JkaW5nIHRvIHRoZSBkZXNpcmVkIG91dHB1dCBjbG9jay4K
Pj4gU2luY2UgaXQncyBhIGJ1bmNoIG9mIGNsb2NrcyBJJ2Qgc2F5IHRoYXQgZGlyZWN0IHByb2dy
YW1taW5nIG9mIHRoZQo+PiBjbG9jayByZWdpc3RlcnMgc2hvdWxkIGJlIGF2b2lkZWQgYW5kIHdl
IG5lZWQgdG8gZ28gdGhyb3VnaCBDQ0YgYXMKPj4gd2VsbC4KPj4gQnV0IHRvIG1lIHRob3NlIHJl
Z2lzdGVyIHZhbHVlcyBhcmUgYWxsIG1hZ2ljIChhcyBJIGFtIG5vdCBhd2FyZSBvZgo+PiBhbnkg
ZG9jdW1lbnRhdGlvbiB0aGF0J3MgYXZhaWxhYmxlIHRvIG1lIHdoaWNoIGRlc2NyaWJlcyBob3cg
dG8KPj4gZGV0ZXJtaW5lIHRoZSBjb3JyZWN0IFBMTCByZWdpc3RlciB2YWx1ZXMgLSBvdGhlcnNp
ZGUgdGhlIHN0YW5kYXJkCj4+IGVuL20vbi9mcmFjL2xvY2sgYW5kIHJlc2V0IGJpdHMpLgo+Pgo+
PiBJJ20gbm90IHNheWluZyB0aGF0IGFsbCBvZiBteSB0aG91Z2h0cyBhcmUgY29ycmVjdCBhbmQg
aW1tZWRpYXRlbHkKPj4gbmVlZCB0byBiZSBwdXQgaW50byBjb2RlLgo+PiBUaGluayBvZiB0aGVt
IG1vcmUgYXMgYW4gZXhwbGFuYXRpb24gdG8gSmVyb21lJ3MgcmVhY3Rpb24uCj4+Cj4+IEkgdGhp
bmsgd2hhdCB3ZSBuZWVkIG5leHQgaXMgYSBkaXNjdXNzaW9uIG9uIGhvdyB0byBtb3ZlIGZvcndh
cmQgd2l0aAo+PiBkZXZpY2UtdHJlZSBBQkkgZm9yIG5ldyBTb0NzLgo+PiBOZWlsLCBKZXJvbWU6
IEknZCBsaWtlIHRvIGhlYXIgeW91ciBmZWVkYmFjayBvbiB0aGlzLgo+IEkgY29tcGxldGVseSBh
Z3JlZSB3aXRoIHlvdXIgZGVzY3JpcHRpb24gb2YgdGhlIHByb2JsZW0sIHRoYXQgYW5kCj4gS3J6
eXN6dG9mJ3MgcmVtYXJrIG9uIHBhdGNoIDYuIFRoaXMgaXMgbm90IG5ldyB3aXRoIHRoaXMgc2Vy
aWVzIGluZGVlZCwKPiBzbyBpdCBkb2VzIG5vdCBpbnRyb2R1Y2UgbmV3IHByb2JsZW1zIHJlYWxs
eSBidXQgaXQgY29tcG91bmRzIHRoZQo+IGV4aXN0aW5nIG9uZXMuCj4KPiBBZGRyZXNzaW5nIHRo
b3NlIGlzc3VlcywgaWYgd2Ugd2FudCB0bywgd2lsbCBnZXQgbW9yZSBkaWZmaWN1bHQgYXMgbW9y
ZQo+IHN1cHBvcnQgaXMgYWRkZWQgZm9yIHN1cmUuCgpIae+8jGplcm9tZQoKIMKgwqDCoCBXaGF0
IGFyZSB0aGUgbmV4dCBzdGVwcyBmb3IgImFuIGVmZm9ydCB0byByZW1vdmUgdGhlIHVzZSBISEkg
CnN5c2NvbiIgcGF0Y2ggc2V0LCBhbmQgd2hhdCBpcyB0aGUgc2NoZWR1bGU/Cgo+Pj4gMiBUaGUg
UzQtc2VyaWVzIHNlY3VyZXMgYWNjZXNzIHRvIEhETUlUWCBEV0MgYW5kIFRPUCByZWdpc3RlcnMs
Cj4+PiAgICByZXF1aXJpbmcgbW9kaWZpY2F0aW9ucyB0byB0aGUgZHJpdmVyIHRvIGhhbmRsZSB0
aGlzIG5ldyBhY2Nlc3MgbWV0aG9kLgo+IFJlZ21hcCBidXNlcyBhcmUgbWFkZSBmb3IgdGhvc2Ug
Y2FzZXMgd2hlcmUgdGhlIHJlZ2lzdGVycyBhcmUgdGhlIHNhbWUsCj4gYnV0IGFjY2Vzc2VkIGRp
ZmZlcmVudGx5LiBUaGVyZSBpcyBhbiBleGFtcGxlIGluIHRoZSBwYXRjaHNldCByZWZlcmVuY2Vk
IGJ5Cj4gTWFydGluLCB0byBoYW5kbGUgR1hMIGFuZCBHMTIgZGlmZi4KPgo+PiBUaGlzIGluZm8g
c2hvdWxkIGdvIGludG8gcGF0Y2ggMS8xMSB0byBleHBsYWluIHdoeSB0aGUgZzEyYSBjb21wYXRp
YmxlCj4+IHN0cmluZyBjYW5ub3QgYmUgdXNlZCBhcyBmYWxsYmFjay4KPj4KPj4KPj4gQmVzdCBy
ZWdhcmRzLAo+PiBNYXJ0aW4KPj4KPj4KPj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZGFya2xp
Z2h0L2xpbnV4L2NvbW1pdC8zNmU2OThlZGMyNWRjNjk4YTBkNTdiNzI5YTdhNDU4N2ZhZmMwOTg3
Cj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20veGRhcmtsaWdodC9saW51eC9jb21taXQvODI0Yjc5
MmZkYmQyZDNjMGI3MWIyMWUxMTA1ZWNhMGFhYWQ4ZGFhNgo+IC0tCj4gSmVyb21lCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
