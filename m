Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E74C5320E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 02:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB7HTSebxLCHjRTaEjpIA955qMgldkrjK7PIsOr0UIo=; b=JsWxQQ48WCxE9Yxs9tKuzvC9D3
	TWnXjR5QUz75+/6oYEXz370xd9FpcZQKVk9DiG/bUrYpQC8qTZ1QaJTPmbhFAKTvSlwB7z9CBRAyK
	oYGGrykekvnW6jSwHu45MZM9JcnCfo553cYfr54KDCPQJAbI4wAEMQIGrIeoMk9EJwwio58JAULon
	fUQcvKxwLxfyhtghI2jWqFx32iw6bartDDoFEywmqLVBH3nPCesD9d4ZIpZa7JYOQafu6d0j7OZ/4
	jfzDENUohE8luxBCaew/4ywtuU1e7TbHnIST9D+s5H1CcdFfLm0Z28V6Rc/nBc3UVLXtz7/do0hsS
	Bji0nqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPbS-00000005Y8D-2GA8;
	Mon, 26 Aug 2024 02:37:10 +0000
Received: from mail-tyzapc01on20707.outbound.protection.outlook.com ([2a01:111:f403:2011::707] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPbP-00000005Y64-0izc
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Aug 2024 02:37:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0T+y0ZJsXvC14shCRbchhxEjWJb+0iE96dkXt6fKOtsdJteTPkbho9astNwZ1okGn+5XlGVuSqNnz3KpWQ5xqHfwotyymxy0Oa3YbW1wU7hje1C4kfI7L7/XWJ5BB/OzCnM/m3jGwnkGugBKq4vu3bX4ELc1HPJ10yNfMToMxyY3dk7OeAwXnH9FE3yVpRxVAomKB4oipZ5xhbt9evu/ZJG1ECRKQ/zWK0aTV76tFLdt7z1fNwk4EBhKzGrBXZhk63amI9hwJV1CmvwlzfRVys62J15vM1eK9hjXb0ZTguzsxdXULW1rzE7PnAtEr4/tRZW1dKImegvB7Tubz0qRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P9jK0UKJVJCBfyRP4+uFbiWtUVuLDxp/HcFemXDGsc=;
 b=bv/LYHoF6/uBT/92hTsfsF6eWGxp1mp8PDA3UifpTkU3AclzWhKvvfyrV+Y6TE19e9LdAymCk7QaDfJZfwUX6tc1Rg4+8aEmy1FadPEm4pOyMhhouie20KKKGMnNb1cK3TNzxYheV6/me9YG/5Wtz0hpnDNXRePwMjWXAEh0iVg4tnxEt4gjL3xdb4peWYmytECUIHF4iq5ZEoRzqLd0ns/nsz4u7bukpxxd8adUvneYRt2oOuvPlT+CbxAmKxDnoOf1QH/eu1MGb6uAIVklD+Dze6l1dwePY6oBEF15CNlBL5Gsl9NS8SnScWBPeeVdJWuCU6Qr5YFh8S8plZeACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P9jK0UKJVJCBfyRP4+uFbiWtUVuLDxp/HcFemXDGsc=;
 b=bclQSNuo7fJXZ4EjoLNkLKrkms+t7MMVdrc+gcbIXciMkb8TXda9DcUYNzjir9YnqDVFDq2nCj66O+1fcEmwZisJcpVcLBcOWCr5io7pACK7kYgcxWn/P4Uf08OHWHOXX0cjrVTXltelgAtj1xUknSakCS85q5rOEBHyafyqflWc/wuNeHXse9ZHyyrolLWjELMPs4P2lKN0bBiMe+lz96ibosOPrXLMA3AcJ+k/8tUVJuAkirx8/scTsBpxSB9hG/JwXjwP8QnvcYzp2UN0b0JQLsJbHRdncBRpRgPKtg7/OpVv19fHmpwn2b4KIvJx+yZ6WFWnx7YLsXkTvSsEGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7950.apcprd03.prod.outlook.com (2603:1096:101:169::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 02:36:47 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 02:36:47 +0000
Message-ID: <1039f02d-ca89-438c-b1dd-f49c2ffed6ff@amlogic.com>
Date: Mon, 26 Aug 2024 10:36:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-1-6f70381da283@amlogic.com>
 <20240823-rotunda-machinist-4f8dabbff479@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20240823-rotunda-machinist-4f8dabbff479@spud>
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: f53bbcce-ed01-49cf-334e-08dcc577ee50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2JjSVlxY0FZNFNvMC9VdXlyd2Y2amJ5eEJlcS9hTFVCT0RTbDlFeDdYeTJU?=
 =?utf-8?B?TkpVK0dpb3BlS2ZHL3BNNU5hQzFPak5MVG1ROGY4bmp5aFdPSzNBa3ltdlNZ?=
 =?utf-8?B?Z0FlUTBmN3hwc3B1elcwTGd5Y3dzMmMvV29kUVN0dExvUEJicDVHZDVQNFVO?=
 =?utf-8?B?czZHRHVGTlV2b2IyS3F4c0Z2dnBRdUh6QkF5QngxdEd4dGViZWZPbjk2ZlIy?=
 =?utf-8?B?NG9MeEZ3OVRGQnZseDkrNnA5RStHOTYxdTNWVko1cjFSUk5aVVkzalhUR3Vl?=
 =?utf-8?B?WDVTeXZ6TExFakFYeDlZYkY1VDBHUmdqaysxS2p4SzRwR21rSk84N2VkYjZn?=
 =?utf-8?B?S3VkdFpTczRPRVU2eXFidFNDa3NHczFKLy9LVjJXTWVYcUZtOSszK01tK1hV?=
 =?utf-8?B?UW9PNHJNaWVaNm4vcGZCdDU1V0tQdkRUTkhuTEVFdHFzSGloUFlJSk5IK3RJ?=
 =?utf-8?B?VS9ITXpVZ3p5SDBaaWFjMmZnM2VLbzVOTVlHZzM3OG1jTHJld2lQYUMxMWxJ?=
 =?utf-8?B?ZWMyWUF4Z2d4bG9Rb0t5eVNGYlFGTWFnRkh4OXc2TGNWeVpxWS8ycVlGOFIw?=
 =?utf-8?B?LzdhdlBrdHllVjRxWFB5c0pnMTlObDR6S0llUFNrSlM5ajc4Zmx5Y0xpd3Bt?=
 =?utf-8?B?Y245empZNnhSN2I2RmkrekNtVWtwaHJDZGZzM3NJeTd3OXhSdnV5cm4zakJW?=
 =?utf-8?B?RTl4UnRQbW4vTkpKS2VKK1lsYkptK3R0VzFWMFl3SWl1aHZzYzZGMHc1WDFp?=
 =?utf-8?B?Zk1LUzYxK2ZIVzUwdGl6L1BvWkk2N0xxaHJGaXQvak1wVWx6cUNheE95bkxj?=
 =?utf-8?B?T1pFZUxyYzFJWWo2NGxFTFVtMW9mbUxPMzQ4Q3JPV0ZUNVJkdUx4d05EUEVu?=
 =?utf-8?B?SzByRWhKOTBhaGpTY2gzakVTRENwUnF2VTEvOU9ySXhwWXVSYjZVWm50Q0Vq?=
 =?utf-8?B?cXpwTUlvNVA1MW13YzNubXhSQlltWExJQ0xiRS9lWEpIbHNOMHlkOG1iRE43?=
 =?utf-8?B?Vzk3M2RNcFVnd01ZMzBveXZVTjBZeG9tNHdNdWJkcGpmUkozZnVVUkp6Tmp0?=
 =?utf-8?B?TXJSTEpLVjhzZTNBMVQ1U1RCME9TQnVPRHROZTJ2VHF2QTVSWEU2bzBHSTBh?=
 =?utf-8?B?c1NOOGpPbHVZL2NUOGhMUHBXS2hjOUZtNnBORFRGU1Q1UGZzS3B2ay9MT1Fh?=
 =?utf-8?B?ei8rQTRzRTQ1RkhMUG5YQ2ZQY2c5ZlpRdUJiT1BkeGtjaVM0a0g1WVdnWjdm?=
 =?utf-8?B?M1k3VWVKbGJhMEJCMW9xZktyR3YxWnVtU2JqdnlYZXVhVnBiNnpVTmlkWXVi?=
 =?utf-8?B?WEZWMkhRc1lZaTdlYi9tNDFJSmJGeHoreEpDS1g0OXM4Rk9QUkNkTVNSbENo?=
 =?utf-8?B?aDhMRFZzM3l5Q2t0N2lXM1U0YnEvTVZZaENVQ1NJQlRLQ3ROUU1jRDZYTndX?=
 =?utf-8?B?L3ZyL3g5alU5d0w4MXk0SE9pTHNuaUc0WjJQNmc2aFFnK2RTTFNWRDlFZVA1?=
 =?utf-8?B?V2pVL01iNmE5MHN6dWNBRTUyVHQrSkNocU03UWpDcTJZSzhyZXNEcFdEN2sw?=
 =?utf-8?B?ZUdKV1B1REdPUjhXQ0JtZFF4MldPM0NzL3ZNbGpQeFNORTllUzFkTFlLY252?=
 =?utf-8?B?RzhCd21jbVNVWC9KNGVxUVdjdDc1L2gyYW00TXNmQVl1aUNBbE5ncHBuQndE?=
 =?utf-8?B?S2NFNjhuNVZRSXNqT3lydnBRR2FmOHFzelBhbklyd1dvcFR1SlNzVDVwdmh0?=
 =?utf-8?Q?M9pXDv5KzEs7zZlHZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0srd1YxdWptNzZhUndpWGxRVi9RMDlSSjR0NkV5MkIxTDZ6WnkyTk56VG1M?=
 =?utf-8?B?QmVKSEE0aE44RVNqeVhMNEM3RnBQUHpxdGQ2bUFDMVd3UXpLaHZaVTF1d0d4?=
 =?utf-8?B?U3lJbVpNclhOTG5XQVVBcU8vczE5blcxMVF0ZHNQTnZidG9zTEg5M1RrQnJG?=
 =?utf-8?B?eFF0SkF3dGlJVDlxcHpoRVQrY2ZlMzB5eHJPVmJCYTlHQm5tTFFENForMVFk?=
 =?utf-8?B?dnRiOFZzemxpQWREeXRCMUVES0thTU03WWplNXloMDZiVlBMaDFLdlVjcllL?=
 =?utf-8?B?RERSMm1Cb2tJaTUvcC9abFJxVDcwQ1NGbEc1WE1McmFQaFJvaGh5dUVDejJw?=
 =?utf-8?B?UHkyK3dFdnFmR2s3aElzb21aTlFQaGp4YnV3Mys3S3Z2eVhsOUsxemdOVzZv?=
 =?utf-8?B?SzZWWTJiWkVyNmhZMWwrNjZJOHE3ay9TS1hhRWJhbVR1N3Mvb202T3RjbC83?=
 =?utf-8?B?cUpHOHZaRjdMejJuQVE5TjM2ajNwRVVrL1ZGeHYzdlVxNU14c0NQeGtucUVL?=
 =?utf-8?B?TS9OTUhHU0xka3lSS1hDa3R1SW1pMmRadGxINml5U3pwSXN6NVdwQ2NEdjlS?=
 =?utf-8?B?bURHaGhhTHZHcnNUYmZvNUpCK1pBd0FxNmV1cTdTdEJ6dU1wZ09pblltWHRi?=
 =?utf-8?B?QkxYYW51NkpmWG1ZL3JwaXQ0ZTJDUmg4OXJXRHBPUXFJa3p6QW5EcGUzVDJ6?=
 =?utf-8?B?OUJkWUg3MFNDRWE4UElqdGI1MVgvTUhzaU9TcTVUQVl5VmN6aXVzS0hhQS94?=
 =?utf-8?B?UEpGcXd3bVlvKzk2RzJBQUtwQ2QxcDVaNTJxS0V2NjRLTzFnVUtDdUZpZ2Ru?=
 =?utf-8?B?Nkp4N2VxVWNNZzhLZ3h4MG9LcG95YUFxaEpGbTBuSm9uVS9nbXloWjNLRW9X?=
 =?utf-8?B?S1pDUVdGSysrcjBCbCtBbkxOdjVKaHNIdmZvazZqVlQ0OWJoRzdVMXM5Qm56?=
 =?utf-8?B?M3ozK1RXWmxmZ1BXcVZFRG9Xbys5Q0ZRVFJqSkxybGxEWWxyUGdSdnB3dnhC?=
 =?utf-8?B?RlFUU0t6YkJJTjFMMVBpT1liWmRQUFJETHgvN2R6OVF2dXg0eTB5WDNjZVUv?=
 =?utf-8?B?dHpQNTdzSElvcnRmV3A1b3IzdUUzVUtUL1pFaDdrd1ZwUmx6NE9kQm81czZq?=
 =?utf-8?B?NVh4MFZTUEhXWWVlaXZrcUdJSXVLVjVOQlFZVUhDR3laSEFMa3BqNWtsMU9u?=
 =?utf-8?B?Z1I2WXRYdzlWVGFOUERYN1JCWTR6R0d2Z29XbFBCbFhXZTZFYlpXRUZhZGZJ?=
 =?utf-8?B?bWpaRWZIOGhiSzNoem9ObUxqNk16NlplYUZ2bWwvNHR5N0ZsK2h4UDVGQXpx?=
 =?utf-8?B?eE5zWDh5Ny9XZlBHRnNDMVM0NzBaWFF1cHpLMlVZNW43SGgvbHVWVlBsemZx?=
 =?utf-8?B?TTNBUlZ3aFhPTXBGMGVGUTRoZ1VlZ2dBTllBMTljdFFZZ291L2I2c05MUzE4?=
 =?utf-8?B?Y0VyWmRld1EySEhvbFEyY1FCMlR2amNuZy9McURybFZKUHIvaURPRzVBbTRU?=
 =?utf-8?B?bzBKSmlVWnB2T1VCN0UzNlhteGxHd3NKaFJXenIrbWN6amtQQ0RKY1E5Zjlp?=
 =?utf-8?B?cGVaRkNnMXgwTHJmdXc0dFo0TmpnMjM4VVI4MWRRNWtjR0lrT05qeUcrTjhL?=
 =?utf-8?B?WXdyTmE2VUZLWFRwMFYyYjlzSlBINTU3YW9acWVNY3pvK28zVGtJZE9UZVdD?=
 =?utf-8?B?ZHFCSWZ0V3dUdGNGSUdrckRlK3VwdHBVKzhIRmZRZkt6L0svaGZheUF5N1lx?=
 =?utf-8?B?blJYSVE4Wm05eTc3TmtoL21BTVpTQ1pvM01HQitXYWh1RHFlelNURUwyd0th?=
 =?utf-8?B?OXZ5WmtQL0NYQ20yYU1nTVJxVmdPdzZFR0h6K0QzdVRtUUVCY0FGMFFTQS81?=
 =?utf-8?B?YjV2Vmk5T01peXRGcHN2OWtJV3RWQW4xLzVvdWlxQ1dIUUdKV2REbXZhVGgx?=
 =?utf-8?B?NVduTVJ0Ni9uajh4M1V4NEpvanZob2kyMjNobG9HU2ZPcXRwNmlOclJsUVlD?=
 =?utf-8?B?Q1FQUURsanlTMXU0akpya2tkb1RWY1dXdjZwdHFuRElIOG5sZE9Ib1BFTFFq?=
 =?utf-8?B?TzNOMkxmaXlEdTUyNkhBM2tISUpvWmJmVS9yQm4vL1dUZ092SnZ5aVM2Z1c1?=
 =?utf-8?B?MEJ2MFEzdHJldlhsRkZvMTJ4ckpyQmFZemsramcxUlhQWXovbS9yQ2xEejFo?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53bbcce-ed01-49cf-334e-08dcc577ee50
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:36:47.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5E8Rsid3+K9kIywyM7JesdR8/5Q1zy/Dvi4e7leHVMof0MEXPqNM+zYeH0F0UUpzKZ1UB3jd8Fsk+BirhsCw3ZtVWkmmylCas2xtOtCxkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_193707_254631_92DE10F3 
X-CRM114-Status: GOOD (  20.21  )
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

SGkgQ29ub3IsCiAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDI0LzgvMjMgMjM6NTEs
IENvbm9yIERvb2xleSB3cm90ZToKPiBTdWJqZWN0Ogo+IFJlOiBbUEFUQ0ggMS8zXSBkdC1iaW5k
aW5nczogcnRjOiBBZGQgQW1sb2dpYyBBMzExTDIgYW5kIEExMTNYMiBydGMKPiBGcm9tOgo+IENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4KPiBEYXRlOgo+IDIwMjQvOC8yMyAyMzo1MQo+
IAo+IFRvOgo+IHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbQo+IENDOgo+IFlpdGluZyBEZW5nIDx5
aXRpbmcuZGVuZ0BhbWxvZ2ljLmNvbT4sIEFsZXhhbmRyZSBCZWxsb25pIAo+IDxhbGV4YW5kcmUu
YmVsbG9uaUBib290bGluLmNvbT4sIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+LCAKPiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+LCBDb25vciBEb29sZXkgCj4g
PGNvbm9yK2R0QGtlcm5lbC5vcmc+LCBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcs
IAo+IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
LCAKPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gCj4gCj4gT24gRnJpLCBBdWcgMjMs
IDIwMjQgYXQgMDU6MTk6NDRQTSArMDgwMCwgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90
ZToKPj4gRnJvbTogWWl0aW5nIERlbmc8eWl0aW5nLmRlbmdAYW1sb2dpYy5jb20+Cj4+Cj4+IEFk
ZCBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTExM0wyIGFuZCBBMTEzWDIg
cnRjIGNvbnRyb2xsZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlpdGluZyBEZW5nPHlpdGluZy5k
ZW5nQGFtbG9naWMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW88eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICAuLi4vYmluZGluZ3MvcnRjL2FtbG9naWMsYW1s
b2dpYy1ydGMueWFtbCAgICAgICAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9hbWxvZ2ljLGFtbG9naWMtcnRjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2FtbG9naWMsYW1sb2dpYy1y
dGMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmZh
M2Q3ODM4MDIyZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ydGMvYW1sb2dpYyxhbWxvZ2ljLXJ0Yy55YW1sCj4gRmlsZW5hbWUgbWF0
Y2hpbmcgYSBjb21wYXRpYmxlIHBsZWFzZS4KPiAKCldpbGwgZG8sIG1vZGlmeSB0aGUgbmFtZSB0
byAiYW1sb2dpYyxhNC1ydGMueWFtbCIuCgo+PiBAQCAtMCwwICsxLDY2IEBACj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4gKyMg
Q29weXJpZ2h0IChDKSAyMDI0IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZAo+PiAr
JVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDpodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9y
dGMvYW1sb2dpYyxhbWxvZ2ljLXJ0Yy55YW1sIwo+PiArJHNjaGVtYTpodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEFtbG9naWMgUmVh
bCBUaW1lIENsb2NrIGNvbnRyb2xsZXIgaW5jbHVkZSBhNCwgYTUKPj4gKwo+PiArbWFpbnRhaW5l
cnM6Cj4+ICsgIC0gWWl0aW5nIERlbmc8eWl0aW5nLmRlbmdAYW1sb2dpYy5jb20+Cj4+ICsgIC0g
WGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4gKwo+PiArZGVzY3JpcHRp
b246Cj4+ICsgIFRoZSBBbWxvZ2ljIG5ldyBjaGlwcyB1c2VkIFJUQyBtb2R1bGUuCj4+ICsKPj4g
K2FsbE9mOgo+PiArICAtICRyZWY6IHJ0Yy55YW1sIwo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiAr
ICBjb21wYXRpYmxlOgo+PiArICAgIGVudW06Cj4+ICsgICAgICAtIGFtbG9naWMsYTQtcnRjCj4+
ICsgICAgICAtIGFtbG9naWMsYTUtcnRjCj4gVGhlIG5hbWVzIHlvdSBoYXZlIGNob3NlbiBoZXJl
IGRvIG5vdCBtYXRjaCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uIFdoYXQKPiBpcyBnb2luZyBvbiB0
aGVyZT8KPiAKCldpbGwgbW9kaWZ5IGRlc2NyaXB0aW9uIHRvICJBZGQgQW1sb2dpYyBBNChBMzEx
TDIpIGFuZCBBNShBMTEzWDIpIHJ0YyIuCgo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVt
czogMQo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IFJUQyBjbG9jayBzb3VyY2UsIGF2YWlsYWJsZSAyNE0gb3IgMzJLIGNyeXN0YWwKPj4g
KyAgICAgICAgICBvc2NpbGxhdG9yIHNvdXJjZS4gd2hlbiB1c2luZyAyNE0sIG5lZWQgdG8gZGl2
aWRlIDI0TSBpbnRvIDMySy4KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFJUQyBtb2R1bGUgYWNj
ZXNzZXMgdGhlIGNsb2NrIG9mIHRoZSBhcGIgYnVzLgo+PiArCj4+ICsgIGNsb2NrLW5hbWVzOgo+
PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBjb25zdDogcnRjX29zYwo+PiArICAgICAgLSBjb25z
dDogcnRjX3N5c19jbGsKPiBzL19jbGsvLywgdGhleSdyZSBhbGwgY2xvY2tzLgo+IAoKV2lsbCBk
by4KCj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICty
ZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gaW50ZXJydXB0cwo+PiArICAtIHJl
Zwo+PiArICAtIGNsb2Nrcwo+PiArICAtIGNsb2NrLW5hbWVzCj4+ICsKPj4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPj4gKyAg
ICBhcGIgewo+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgI3Np
emUtY2VsbHMgPSA8Mj47Cj4+ICsKPj4gKyAgICAgICAgcnRjOiBydGNAOGU2MDAgewo+IEFuZCB0
aGUgbGFiZWwgaGVyZSBjYW4gZ28sIHlvdSd2ZSBnb3Qgbm8gcmVmZXJlbmNlcyB0byBpdCDwn5mC
Cj4gCgpXaWxsIGRlbHRlIHJ0YyAgbGFiZWwuCgo+IFRoYW5rcywKPiBDb25vci4KPiAKPj4gKyAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhNC1ydGMiOwo+PiArICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDEzMSBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4+ICsgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4OGU2MDAgMHgwIDB4Mzg+Owo+PiArICAgICAgICAgICAgY2xv
Y2tzID0gPCZ4dGFsXzMyaz4sIDwmY2xrY19wZXJpcGhzIDE+Owo+PiArICAgICAgICAgICAgY2xv
Y2stbmFtZXMgPSAicnRjX29zYyIsICJydGNfc3lzX2NsayI7Cj4+ICsgICAgICAgIH07Cj4+ICsg
ICAgfTsKPj4KPj4gLS0gCj4+IDIuMzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
