Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18B9D5C0C2
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2024 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS0UF44UiI/jxU2DQeXYMRTTbUCkn/ZE4vI2624ExJg=; b=GvfgXbDKvjUAoKmm2apc9/Uz+w
	T6wvH7TEIlfHLaKTBH4FVGnipolY4j+Ecqae92YNLKoVSGJ72aq1MVkD07j5QhVJnqAjjrObJkqYw
	Wf38W1HjHbSiNHDIk4heWSi2YyHqyiu470xFjiTbXvoPll6HcANier9kvi4ibCgI99CfwLoeM12Hw
	W0qzNF+eTik9cwyxcPRD4Rl1oCE/MUP0qu92B0grpAeI1ADD+FPYj/eAJAAvzrQWS0mKIl+mvcQtX
	brmcS6Ns1sL73MKzB1+iovov8mQ1qL1DzddsqLIUd9kydlQu/5vbypWiOZdzuaFW8A7+JvaGohbyW
	l9BB2Kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oe6-0000000Ac2j-0coJ;
	Fri, 08 Nov 2024 13:03:26 +0000
Received: from mail-tyzapc01on20715.outbound.protection.outlook.com ([2a01:111:f403:2011::715] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oe3-0000000Ac10-1BoD;
	Fri, 08 Nov 2024 13:03:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4NKKV+atPzwLeS1gt6ciLNPdLDaRFW8b/CzyBHMazi+Y2WoY0h5mpItow3C3KbPp2M1qun3EY4ZT7BUFBdqoH//DlW6FO/nTG+MCCJbv3N1pYrSC3JdeuMWUZBpLMhh8ETesPOcNBj2GrEfvz+dZ/U59weKJQreeSc3tAxdAwrph7iYS3xynUzxyT3rMHsZVQnDPb6o93DeEX1L1CIvmxjluXaY6OZoLT4de8W0IuwqwRlwSRxtoLrTkx26cbW+FHZ3VWsCHV+pAy4irgFbXtsudeRid/sn/HnHrpphWYwbRLelXUePxX+0fblL58V3gcmi3vceo5VoJxmj6eusuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFEvKZ6ONsrlCoP1CozYnCA410fW35kl20UxukAJUYM=;
 b=tdz1x8mfvcjjMjuvzaF4gCFcTAgYhzsr13wYceTLuTHZt701JNWCEXH44smNG4gWEh9i1Okjx3W2Z4kHBVX060j/hLk8S8iHWjbFu43jL2jXx6hNym5YXRrD6lzKdhj6O7cgSvqEydhAbJuMe/UKj4moE1fMi2ISXxisTM8dKnnkiVpSlJxKjsC5iJy6dpi8VGxg6KtjYazRcMuecmRO8oS5vCx1fE/UHWAz+5Y/hCpURABc2nMJFlUbBmMnMhwU0m6er0UeIm8uowbzayw6TibfF6Wvhz1C2IMcjHpAa+zRl8/EzzSlHVbjH6qR9HTOCECCDvlmeJ4VbKT6GTHwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFEvKZ6ONsrlCoP1CozYnCA410fW35kl20UxukAJUYM=;
 b=YvvOgwWhvvgdRxe1Cx7LpJx480JVyTXvX3vnw8eAlhKHn2UAJPPFi/IgsgwmKs0LpAjaPYX9g2Z4lJzcWX5LEc1GZVS5ByLn0IlpD9EzZAhW3X4u1BUYyX7qKXlSdv7RPZpT0kgZhAMsCLHaGEUr9W30Tky7FjNK/EfNvG3IHPBEOC9Uc3vADtz6yLgPg3hAjAQsk/25/DJK7Sw6FjS3Ljvbc1toEufj0imhCMl1S86Vl+uUTHZ0evno0qAXvdOqfRL5A/gqJCmFma/16bOO9IIx1XoL6tUnFgcqGmOn7GQZNeV5/8G/hyd5poBB7/by0lJzlwWzWRTHrX76GanWiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYSPR03MB8447.apcprd03.prod.outlook.com (2603:1096:405:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 13:03:05 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 13:02:59 +0000
Message-ID: <41ddb893-0eca-4c62-9002-310ba15a89d8@amlogic.com>
Date: Fri, 8 Nov 2024 21:02:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: Fix the CLK_IGNORE_UNUSED failure issue
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-1-22f9c36b7edf@amlogic.com>
 <1jed51tjhj.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jed51tjhj.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYSPR03MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb1cf24-fcda-4417-a00c-08dcfff5abb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZElJRXlERjUvdm5uM1BTbXB4VUhRNmdBMjVlSTQxUXlZaVNvYTFETEEvbjQ3?=
 =?utf-8?B?ZFppSWRSRGpqamxPUk16ZFhRQXdUaUtUT0tQcHJXK0c1czQ1VW10aDY1MUVv?=
 =?utf-8?B?d0tvbTJQK0pDNHdVbFlyMXIxQ3lTNUtWc0xoa0l1ZjF3L2hkRmllVGpSTU50?=
 =?utf-8?B?RWZPeGtRSHF0Ui9iek9JbkRMUzRPSExUeFFkL2tmUzBuR3VLZVJGai9hOTZD?=
 =?utf-8?B?VTJXTVMrNzBDcU9HWXVLOUFJK29QVHdhUWsxMCtLM1J6bEIxVDI1bEc2aUhw?=
 =?utf-8?B?bE9jWVJOand5aUNqeDgzZFg1d2crSlBJRkpUdTdIdW1JWWxlaFdsMzkxUXpI?=
 =?utf-8?B?bmhEQVo5ZG9NRTBJUEpkOFhKRlFCWEVPcnM3bWoyQ0FLdXpvb2QrZ0VJTDM1?=
 =?utf-8?B?dU9tMmFLQkYwRS9vM2tVOVNiRWd6UEo4Yi9yMjhzcmNhOUhWTVFqbHFwdmtG?=
 =?utf-8?B?S1pJYVU1VXFWSWppcWszcmlYemtPcHJsM0xsTTRLRUE3N3BmYTFxY1cxT0FW?=
 =?utf-8?B?Zk16bHEraXkyRW5oeU5Ob1ZFbGhBZ2NtZzVGWVRwNkUxRlFTMnZQRUY1QkpX?=
 =?utf-8?B?Q2VjWVcxUHJ1eWJQN3FJZElaaENEZmdVOWwxdHhZMkhTbEhsNldBamlsek1t?=
 =?utf-8?B?WmR3U2RHTXVXc0dlU3VvWmphSGx3SUplZEtOQnNOOXNKVGRuaG9Gb3B4Y3Rq?=
 =?utf-8?B?QmZqbUkrTHlFRjkySHg0S0llWS9QVFdSaXRMdnVWS1V3bVRPenVHbXBKc2Vs?=
 =?utf-8?B?eVJUK1o5WndIbXQzb2s3a0laUTl2TE0zMnM3eXQ4M2V3ZWNVTjc0NURmMEZj?=
 =?utf-8?B?M0YrUDVYcHJMVHNlNmFQU0x0Rm5FTnNXMFpWTlFyMEpGMnpjUkYxazZWMi9j?=
 =?utf-8?B?R3hWcTlSVWdNbVY2VkZXRWdlSjNnRSs2bndkNEdUMWtWRXliQzZFTC93WnZN?=
 =?utf-8?B?aWtMNkxtRlNGc0ZTOGNkVUxHTU1xNVJmczdwdFNFQTR3b0h4K3U3SWhVS1FB?=
 =?utf-8?B?RlZVTlU3clh6amtoTG4weDBBbDVZWkpuNDRPcy8vZzdnSEVCaTBYeXdhTGdu?=
 =?utf-8?B?SXFZK3ZEdndnWndTWWM1dTE4cmZoRmZtNXQwKzg5ajFrRXNyOTVDcFRFdlB2?=
 =?utf-8?B?QUpXSWRUc1krb1FMNzUxL0pFVFk4Vjc3b2hJQ20rTkpKam1YNW94dEJ2Q00r?=
 =?utf-8?B?Q01CZ3dXTUduSGdWQW9xOFJRUEhzbGxsV0FHVWdYZGtiWGF2TkxmRjIvYk45?=
 =?utf-8?B?NlVwSjZKWTZ4dGxsZEFyMjJlYjJqd3YyekprdktRanp3b1lhdko5TGdPNUZy?=
 =?utf-8?B?cFBYTk5yLzlPSzUzUTRDU0ZvWENyZklidkc4MnJySmRPOU9WemZUZnJBYlMw?=
 =?utf-8?B?OE5LaUZvdWxOYTRGQkZiaXlLSW56MEwvS095Q3lXSVVGc2I5Zkxkc2JKK2tI?=
 =?utf-8?B?WkNYNGZFTklCd2htRXlFUnR0K2xYK25hSm5OSks0WEJsTGhNQkxPN1ZlNWc5?=
 =?utf-8?B?bmdZaDZ3ZGtiYUZFcFJUZzdrUmpmRithQnlZSWRQeHJtUUVaOTBMcjlEa1dn?=
 =?utf-8?B?SDlaMjc0M2hkRjRVempnQkZVbnQ1aTRtdnlhRGdSZ0VjRWQ3eEdDSzRKY0gx?=
 =?utf-8?B?SzllbjdCRC9TYzNFZS9zQ0xLR0IvVytCQUpQMVdyVkNVbnhuTE9NK1FjMEhm?=
 =?utf-8?B?RENhemRXcTh0eFcxZ3RlSDM3R2xjODJ5dHprQ0djd2tIRzNMVDRVL2R0Zmk1?=
 =?utf-8?Q?pNIkqSUITa3aT5EnFXJCFfyPbpt3aRedTR/tanM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFlZVkyTlZIa2twakJ5eVRHck4xMW0rS2t0TWdPb25iUyswV0pTR1pYYUli?=
 =?utf-8?B?SHVQeTFCRVVWdjdJeWMwa01hNFRkWjNBZDBnV0EvcUdzdjdmdGhGYWZqekIz?=
 =?utf-8?B?S0MyQmo1bVlxUmd0aEZGTVd4TUNHRHR6RlhFbG13cGphWGpJWmNReTI4a2pO?=
 =?utf-8?B?bGtpbkJuekZhU0ZEcVZlU2srMFdTQUZRcE8wOHhMWHZSQU5OWlRhYk1JOWdH?=
 =?utf-8?B?dVdwQzgzUDF4QnJCQWY0YXZncFMwczlqbXZaZFBhTERNbklyN1p5V3R5a1J2?=
 =?utf-8?B?Q1VYcm81RDlZQ2F3ckZXSjRFZG43Rjg2ejFMUzU5Ukk4a1EvUXRnUHVSMU5i?=
 =?utf-8?B?SHh1MmRUUHR1L2VlbG5tSFBsdEp6cmo2LzFPS2NUTGswWEN4d2duaDZaUUo0?=
 =?utf-8?B?bG1BSUQ3UUJDY2paN0szUFRabno2aHo1b1kwaCsyYXIyV1UxK1pzTDNVZzRS?=
 =?utf-8?B?TmpIZFo5bkczQUhBR0pxWndyMTlHNVQ5OGZHM0N3S3pDNUVUMVRtRXdMVHBK?=
 =?utf-8?B?K0p5SnJkbzhNOEd5Y1I3eXFuRVQwRnRhVkMva2hKNFdadmxpcVhxOU5nZkhC?=
 =?utf-8?B?L0hBZXNySjluclB5b3hzREJoWWdqVmZSb3BrN1puMHc1SHhLRThVMjcyN0pt?=
 =?utf-8?B?QVZZeE5qK1d2NEVaMWNDOWdOc213UlBNZjgzd3FwWW1YOTJ3QTlpR01Ua1hD?=
 =?utf-8?B?QWd1aHpzckVEaVdmZmltSVFkVmFvdnRRemF6Um9YUUhmeDl1OVZWSlBFa1lF?=
 =?utf-8?B?cmtPU3NNRHkyV21KZ0lSUkJweW1NYTZuV0pyejJaSzZzdzhWVDBzMkMySVpp?=
 =?utf-8?B?VGZkS2lTRjkydW95aWtJNnp5OGFYd0o4RFJnZFpscnhKd093cHA5T1QzZ1kv?=
 =?utf-8?B?dTNqSTJuNWNzcTQrWE1WMmQxRlVPbWNyV1ZGeDZzcmw1Z050TXY1R2w1Y3JZ?=
 =?utf-8?B?SU1NLzFsMkRSbGpyWElkcUdjWDl1SUR3NUlFbldmM29JM2MrQ2VvYVBhNUtE?=
 =?utf-8?B?SEdrbUJ0aTc3Unk5WE52bEpRYWswdi82dUFKSjNuTUxKTTBIY044RjJIck94?=
 =?utf-8?B?TENVZlA1aGpPN1V3c0VjYlY0eWdVRHViSnlVZE5WdlZUa2U3VjNVT3dnakQr?=
 =?utf-8?B?bmVrYWdYZWZHYVA5QkpuWTJ4bnI4SFpSN1lwMDcxUXg3K0VycGxYMHpTejdm?=
 =?utf-8?B?d1pXKzBiSk5MOUwwSTVYOW5Qek9nNU1QOThubFgvU012VDMxcEJuUzM5RXpm?=
 =?utf-8?B?OUpjVXBKd3YzdnFmV0w2RkFlbDRRNTR3VEl3d1RZb1BScDhLbW9HOEx1UGRv?=
 =?utf-8?B?M1FGTXJISXRsbXZwZEJiNUJrb3FIYm5yN1pKTkFYSElzVmxtbVFpa0szNFh3?=
 =?utf-8?B?N0Q0SjNraklRWm5yTHNFNmx4cEt0Sjk2RFJPdU4rRmhIYlpmQ3JOMlJuck9O?=
 =?utf-8?B?Tm9aaWdVTU5qc29KNXJOdXFzWVBzQnRLeUJxTzBWOWYwVTlJNHRQMTVEcnVy?=
 =?utf-8?B?NVc4MVRKenN4dnNEMWNuWW1pa2s0TnRFdzVBMk55NXNXczQzeTkvU0ZzZjQy?=
 =?utf-8?B?WlZoK2cvTmxuYXR6cENjTy9mQ0dOcDFDM2YxYS92cEtYZzBMZTJJSUlKTkMv?=
 =?utf-8?B?ZlRwbWdMcUNBdkNlT0hNRkdzbmMvaS81VlVpcm9Wb2J6NVlNcERPc0Q4T1oz?=
 =?utf-8?B?a3BWWS9wVnB6SkthK0M2V3AwYXk1dFAvQTUrdlZJNG9hQitucm5aREZFK21l?=
 =?utf-8?B?MXlSUjJRNUx3N3AveG5zOTBkQmY2emZDSlZpeUhTUHpNQzZEZldOWjZkZ0Uz?=
 =?utf-8?B?UUlXbVRVSCtkY0UxRjRoYWdTRTcrZEp3dnJrdVNNM2dtcHBpaDk5VXhYMFNC?=
 =?utf-8?B?NHlLOFVuZGdmb2dZcEREZDBFZ2NSbkFsS1lDTlFkQk1HaGlPWTlpNk5sNDJU?=
 =?utf-8?B?VUd5UkVhbHJmTWNMUytBcHRZa3VsWVRuMDZsT3h1N1QwTGhURUN5a3pqYVRo?=
 =?utf-8?B?djQya0tGSDlQZ1RLdDJSc2xUbzZhSW1aV0FaVHdLclkxMHAxbzEyTUJsYnFn?=
 =?utf-8?B?ck0zdzgwWlRNcXNScWFWdUdBaU4yQldrbG5SR29XazNQWmZDazN0WnlEWkcx?=
 =?utf-8?Q?UQnhXv16L8sLf6FM5lhtkVsbR?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb1cf24-fcda-4417-a00c-08dcfff5abb8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 13:02:59.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnXum+XEyzMKY162OYbP8TNPsLQq1jhCiaG6U2KxtWV68cbitCIRRfbaNKuuixHC8umjoHKpsVSO/F2k9bvXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_050323_466646_0A4EC07F 
X-CRM114-Status: GOOD (  27.05  )
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

SGkgSmVyb21lOgoKIMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4KCgpPbiA5LzMw
LzIwMjQgODoyNyBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
Pgo+IE9uIFN1biAyOSBTZXAgMjAyNCBhdCAxNDoxMCwgQ2h1YW4gTGl1IHZpYSBCNCBSZWxheSA8
ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPj4gRnJv
bTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+Cj4+IFdoZW4gdGhlIGNsa19k
aXNhYmxlX3VudXNlZF9zdWJ0cmVlKCkgZnVuY3Rpb24gZGlzYWJsZXMgYW4gdW51c2VkIGNsb2Nr
LAo+PiBpZiBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgaXMgY29uZmlndXJlZCBvbiB0aGUgY2xvY2ss
Cj4+IGNsa19jb3JlX3ByZXBhcmVfZW5hYmxlKCkgYW5kIGNsa19jb3JlX2Rpc2FibGVfdW5wcmVw
YXJlKCkgYXJlIGNhbGxlZAo+PiBkaXJlY3RseSwgYW5kIHRoZXNlIHR3byBmdW5jdGlvbnMgZG8g
bm90IGRldGVybWluZSBDTEtfSUdOT1JFX1VOVVNFRCwKPj4gVGhpcyBjYXVzZXMgdGhlIGNsb2Nr
IHRvIGJlIGRpc2FibGVkIGV2ZW4gaWYgQ0xLX0lHTk9SRV9VTlVTRUQgaXMKPj4gY29uZmlndXJl
ZCB3aGVuIGNsa19jb3JlX2Rpc2FibGVfdW5wcmVwYXJlKCkgaXMgY2FsbGVkLgo+Pgo+PiBUd28g
bmV3IGZ1bmN0aW9ucyBjbGtfZGlzYWJsZV91bnByZXBhcmVfdW51c2VkKCkgYW5kCj4+IGNsa19w
cmVwYXJlX2VuYWJsZV91bnVzZWQoKSBhcmUgYWRkZWQgdG8gcmVzb2x2ZSB0aGUgcHJlY2VkaW5n
Cj4+IHNpdHVhdGlvbi4gVGhlIENMS19JR05PUkVfVU5VU0VEIGp1ZGdtZW50IGxvZ2ljIGlzIGFk
ZGVkIHRvIHRoZXNlIHR3bwo+PiBmdW5jdGlvbnMuIFRvIHByZXZlbnQgY2xvY2sgY29uZmlndXJh
dGlvbiBDTEtfSUdOT1JFX1VOVVNFRCBmcm9tCj4+IHBvc3NpYmxlIGZhaWx1cmUuCj4+Cj4+IENo
YW5nZS1JZDogSTU2OTQzZTE3Yjg2NDM2MjU0ZjA3ZDliOGNkYmMzNTU5OTMyOGQ1MTkKPj4gU2ln
bmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAg
IGRyaXZlcnMvY2xrL2Nsay5jIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLmMg
Yi9kcml2ZXJzL2Nsay9jbGsuYwo+PiBpbmRleCAyODVlZDFhZDhhMzcuLjVkMzMxNjY5OWI1NyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvY2xr
LmMKPj4gQEAgLTk0LDYgKzk0LDcgQEAgc3RydWN0IGNsa19jb3JlIHsKPj4gICAgICAgIHN0cnVj
dCBobGlzdF9ub2RlICAgICAgIGRlYnVnX25vZGU7Cj4+ICAgI2VuZGlmCj4+ICAgICAgICBzdHJ1
Y3Qga3JlZiAgICAgICAgICAgICByZWY7Cj4+ICsgICAgIGJvb2wgICAgICAgICAgICAgICAgICAg
IGlnbm9yZV9lbmFibGVkOwo+PiAgIH07Cj4+Cj4+ICAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9J
TlRTCj4+IEBAIC0xNDc5LDYgKzE0ODAsNjggQEAgc3RhdGljIHZvaWQgX19pbml0IGNsa191bnBy
ZXBhcmVfdW51c2VkX3N1YnRyZWUoc3RydWN0IGNsa19jb3JlICpjb3JlKQo+PiAgICAgICAgfQo+
PiAgIH0KPj4KPj4gK3N0YXRpYyB2b2lkIF9faW5pdCBjbGtfZGlzYWJsZV91bnByZXBhcmVfdW51
c2VkKHN0cnVjdCBjbGtfY29yZSAqY29yZSkKPj4gK3sKPj4gKyAgICAgdW5zaWduZWQgbG9uZyBm
bGFnczsKPj4gKwo+PiArICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKCZwcmVwYXJlX2xvY2spOwo+
PiArCj4+ICsgICAgIGlmICghY29yZSkKPj4gKyAgICAgICAgICAgICByZXR1cm47Cj4+ICsKPj4g
KyAgICAgaWYgKChjb3JlLT5lbmFibGVfY291bnQgPT0gMCkgJiYgY29yZS0+b3BzLT5kaXNhYmxl
ICYmCj4+ICsgICAgICAgICAhY29yZS0+aWdub3JlX2VuYWJsZWQpIHsKPj4gKyAgICAgICAgICAg
ICBmbGFncyA9IGNsa19lbmFibGVfbG9jaygpOwo+IFVzZWQgY29yZS0+ZW5hYmxlX2NvdW50IHdp
dGhvdXQgdGFraW5nIHRoZSBsb2NrCgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgYWRkaW5nIGEg
c3BpbmxvY2sgaGVyZSBpcyB0byBlbnN1cmUgdGhhdAp0aGUgZGlzYWJsaW5nIG9mIHRoZSBjbG9j
ayBjYW4gYmUgY29tcGxldGVkIHdpdGhvdXQgaW50ZXJmZXJlbmNlLgoKPgo+PiArICAgICAgICAg
ICAgIGNvcmUtPm9wcy0+ZGlzYWJsZShjb3JlLT5odyk7Cj4gSWYgdGhlIHRoZXJlIGlzIGFueSBD
TEtfSVNfQ1JJVElDQUwgaW4gdGhlIHBhdGgsIGl0IGlzIGdhbWUgb3Zlci4KPiBZb3UndmUgYmFz
aWNhbGx5IGRpc3JlZ2FyZGVkIGFsbCB0aGUgb3RoZXIgQ0NGIGZsYWdzIHdoaWNoIGFyZSBlcXVh
bGx5Cj4gaW1wb3J0YW50IHRvIHRoZSBvbmVzIHlvdSBhcmUgZGVhbGluZyB3aXRoLgoKaWYgY2xv
Y2sgaXMgQ0xLX0lTX0NSSVRJQ0FMIHRoZW4gaXRzIGVuYWJsZV9jb3VudCA+IDAgZG9lcyBub3Qg
Z28gaW50bwp0aGUgJ2lmJy4KCj4KPj4gKyAgICAgICAgICAgICBjbGtfZW5hYmxlX3VubG9jayhm
bGFncyk7Cj4+ICsgICAgIH0KPj4gKwo+PiArICAgICBpZiAoKGNvcmUtPnByZXBhcmVfY291bnQg
PT0gMCkgJiYgY29yZS0+b3BzLT51bnByZXBhcmUgJiYKPj4gKyAgICAgICAgICFjb3JlLT5pZ25v
cmVfZW5hYmxlZCkKPj4gKyAgICAgICAgICAgICBjb3JlLT5vcHMtPnVucHJlcGFyZShjb3JlLT5o
dyk7Cj4+ICsKPj4gKyAgICAgY29yZS0+aWdub3JlX2VuYWJsZWQgPSBmYWxzZTsKPj4gKwo+PiAr
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmVfdW51c2VkKGNvcmUtPnBhcmVudCk7Cj4gSGVyZSB5
b3UgYXJlIGRpc2FibGluZyB0aGUgcGFyZW50IG9mIGFueSBDTEtfSUdOT1JFX1VOVVNFRCBjbG9j
ay4KPiBJTU8sIHRoZSBwcm9ibGVtIGlzIG5vdCBzb2x2ZWQuIEl0IGp1c3Qgc2hpZnRlZC4KClll
cywgaXQgZG9lcyBub3QgdGFrZSBpbnRvIGFjY291bnQgdGhlIHNpdHVhdGlvbiB3aGVyZSBpdHMg
cGFyZW50IGlzCmRpc2FibGVkIHdpdGhvdXQgY29uZmlndXJpbmcgQ0xLX0lHTk9SRV9VTlVTRUQu
Cgo+Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgX19pbml0IGNsa19wcmVwYXJlX2VuYWJsZV91
bnVzZWQoc3RydWN0IGNsa19jb3JlICpjb3JlKQo+PiArewo+PiArICAgICBpbnQgcmV0ID0gMDsK
Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gKwo+PiArICAgICBsb2NrZGVwX2Fzc2Vy
dF9oZWxkKCZwcmVwYXJlX2xvY2spOwo+PiArCj4+ICsgICAgIGlmICghY29yZSkKPj4gKyAgICAg
ICAgICAgICByZXR1cm4gMDsKPj4gKwo+PiArICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGVf
dW51c2VkKGNvcmUtPnBhcmVudCk7Cj4+ICsgICAgIGlmIChyZXQpCj4+ICsgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPiBUaGF0J3MgYWRkaW5nIGFub3RoZXIgcmVjdXJzaW9uIGluIENDRiwgc29t
ZXRoaW5nIFN0ZXBoZW4gd291bGQgbGlrZSB0byByZW1vdmUKClRoaXMgcGF0Y2ggaXMgbWVhbnQg
dG8gdGhyb3cgb3V0IGFuIGlkZWEgYW5kIGJyaW5nIGF0dGVudGlvbiB0byB0aGUKcHJvYmxlbSB0
aGF0IHdhcyBkaXNjb3ZlcmVkLgoKPj4gKwo+PiArICAgICBpZiAoKGNvcmUtPmZsYWdzICYgQ0xL
X0lHTk9SRV9VTlVTRUQpICYmIGNsa19jb3JlX2lzX2VuYWJsZWQoY29yZSkpCj4+ICsgICAgICAg
ICAgICAgY29yZS0+aWdub3JlX2VuYWJsZWQgPSB0cnVlOwo+PiArCj4+ICsgICAgIGlmICgoY29y
ZS0+cHJlcGFyZV9jb3VudCA9PSAwKSAmJiBjb3JlLT5vcHMtPnByZXBhcmUpIHsKPj4gKyAgICAg
ICAgICAgICByZXQgPSBjb3JlLT5vcHMtPnByZXBhcmUoY29yZS0+aHcpOwo+PiArICAgICAgICAg
ICAgIGlmIChyZXQpCj4+ICsgICAgICAgICAgICAgICAgICAgICBnb3RvIGRpc2FibGVfdW5wcmVw
YXJlOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgaWYgKChjb3JlLT5lbmFibGVfY291bnQgPT0g
MCkgJiYgY29yZS0+b3BzLT5lbmFibGUpIHsKPj4gKyAgICAgICAgICAgICBmbGFncyA9IGNsa19l
bmFibGVfbG9jaygpOwo+PiArICAgICAgICAgICAgIHJldCA9IGNvcmUtPm9wcy0+ZW5hYmxlKGNv
cmUtPmh3KTsKPj4gKyAgICAgICAgICAgICBjbGtfZW5hYmxlX3VubG9jayhmbGFncyk7Cj4+ICsg
ICAgICAgICAgICAgaWYgKHJldCkKPj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gZGlzYWJs
ZV91bnByZXBhcmU7Cj4+ICsgICAgIH0KPj4gKwo+PiArICAgICByZXR1cm4gMDsKPj4gK2Rpc2Fi
bGVfdW5wcmVwYXJlOgo+PiArICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmVfdW51c2VkKGNvcmUt
PnBhcmVudCk7Cj4+ICsgICAgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgdm9p
ZCBfX2luaXQgY2xrX2Rpc2FibGVfdW51c2VkX3N1YnRyZWUoc3RydWN0IGNsa19jb3JlICpjb3Jl
KQo+PiAgIHsKPj4gICAgICAgIHN0cnVjdCBjbGtfY29yZSAqY2hpbGQ7Cj4+IEBAIC0xNDkwLDcg
KzE1NTMsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2xrX2Rpc2FibGVfdW51c2VkX3N1YnRyZWUo
c3RydWN0IGNsa19jb3JlICpjb3JlKQo+PiAgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnVz
ZWRfc3VidHJlZShjaGlsZCk7Cj4+Cj4+ICAgICAgICBpZiAoY29yZS0+ZmxhZ3MgJiBDTEtfT1BT
X1BBUkVOVF9FTkFCTEUpCj4+IC0gICAgICAgICAgICAgY2xrX2NvcmVfcHJlcGFyZV9lbmFibGUo
Y29yZS0+cGFyZW50KTsKPj4gKyAgICAgICAgICAgICBjbGtfcHJlcGFyZV9lbmFibGVfdW51c2Vk
KGNvcmUtPnBhcmVudCk7Cj4+Cj4+ICAgICAgICBmbGFncyA9IGNsa19lbmFibGVfbG9jaygpOwo+
Pgo+PiBAQCAtMTUxNyw3ICsxNTgwLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNsa19kaXNhYmxl
X3VudXNlZF9zdWJ0cmVlKHN0cnVjdCBjbGtfY29yZSAqY29yZSkKPj4gICB1bmxvY2tfb3V0Ogo+
PiAgICAgICAgY2xrX2VuYWJsZV91bmxvY2soZmxhZ3MpOwo+PiAgICAgICAgaWYgKGNvcmUtPmZs
YWdzICYgQ0xLX09QU19QQVJFTlRfRU5BQkxFKQo+PiAtICAgICAgICAgICAgIGNsa19jb3JlX2Rp
c2FibGVfdW5wcmVwYXJlKGNvcmUtPnBhcmVudCk7Cj4+ICsgICAgICAgICAgICAgY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlX3VudXNlZChjb3JlLT5wYXJlbnQpOwo+PiAgIH0KPj4KPj4gICBzdGF0aWMg
Ym9vbCBjbGtfaWdub3JlX3VudXNlZCBfX2luaXRkYXRhOwo+IC0tCj4gSmVyb21lCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
