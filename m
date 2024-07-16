Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322EC3DA49
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2024 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1CTNavP3G4T0uLDceahvuxmuKQTL7IQCWEsxW6rCv0=; b=3H9oLatKyFJi2eTNvRGpQmr/8m
	A8IqujXaK321UGZRMJ0I29GosIsE87TVxSV6nDTAogj1c9s/zAPDC7JLLE+diIJ+nZqy0DdfflVDK
	8tZkfcVefJ2JB8KnZYCcD9hFbF8Z17Qk+WDLXLa1zonucgiEwCHhknagTmL1Rp8t9Lps5l2ZB01i4
	ay2U7P/FuaSBYxx0QOBcXkU2xahaRmKfQ21VlRP1AOxMcllIp8Eoc59wSh8P0QifVaUxF7SM+AB6T
	hvNbWofdbaYW8OhRdyZxaqMXuAZMUPZyrNjh2KQHgTYmd3fCXtuLXq6dU7jNvrctoojeZM47Ay8tb
	bqvpOIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTcnf-00000009dQu-1zgo;
	Tue, 16 Jul 2024 07:40:39 +0000
Received: from mail-tyzapc01on20701.outbound.protection.outlook.com ([2a01:111:f403:2011::701] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTcnK-00000009dN5-29l1;
	Tue, 16 Jul 2024 07:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3cTF+HSzq8fL1GX631fEdakHmPKUJ6SiNU/JDe65JoyRqNi5ID3VP3wSJvG/wbOgHQoih3fPidtwUSJcI1n7k7bAG4/ZwBrYwLbddUWjuqjjkGjF5srFsqhW22JFW3+8+EGGfqW9cPg4faabudh0sS6A6vq1Bkt4ztER8wUsJyJFodAIr3vz7Ji3kRbirqCFr6847BWQcSZTpR5Jq+cP7FcsnGTHR+ptpJCHL2S4+G59z1Y+r+A5G8rfqfMdbzzd4cIkVcSRZQ1edfyVSGb+Dj8hJznxx+0d5OoqSF967+z21k0a1wfbFf/B6WfSp8fdPgSQkxG59q6ukHjjHqOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n03j51k5+yUc5nIhgvNP1V6edOEblXr3wSO9/A/z2eY=;
 b=SBsiAraydMP+w68jnME/huO7nBFfPJIczXKONGbIpHSH6LH+JZhvHT2eIWuL0RJOIp0mqsVrIjLptq0Y6m16xztfTirk7IwT+qNcie3osHBuUGq8lBX1EkzXPHzuz/I7rmRFrAwhxKySomdP3fRudvoo5TKoOMRAg3KxmJWAi06YOXRVYDMRlPgeCCZXpxkbO2ALw70rwoOlHtnBWrQLSikGU0/OQ6WWA1lXqfapZv85fwCrNg5JaeEAo7WTiaIw/GpjWXkwiGYyozzpaQol1XbFoDDLDDtVabq5jbAwt2aAHHvx7TFGy1jB8tN5SwYp0Mu4XrbnHWekLB+eEMcyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n03j51k5+yUc5nIhgvNP1V6edOEblXr3wSO9/A/z2eY=;
 b=gCqIRv0RkzQGpwvYgJ01S0HpQ+erk0L1lNxvgXAfWKokOny1eAToNyzxucH7miaxAVIOFzHE4eoT6ECfT/mNppnXguJCp8TjJaW0zGNTSdJsAOc+pNQBTUbvvjmOM7szK5HtIRxUhaxMTrZ6EslywHahinpWghx7OB4srWs47sw/72LOdSNU28VcqpQzY+uB3WxVCcDpH8o31vPxBLKkWnTYQqvveidcoZ//kBb0WXA/o876eB3N5JO/gKIR5OKPtS7cfiatY3SkEd2DqsdZTaVJg7Uxgui56zgNrVsmDp82EmpcE2N1HEpSds17hQgSoyBKHiVBerVWM+43LePkZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB8368.apcprd03.prod.outlook.com (2603:1096:405:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Tue, 16 Jul
 2024 07:40:04 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:40:04 +0000
Message-ID: <fcb921ad-9f2c-44df-aff4-ea02bf0ef8dc@amlogic.com>
Date: Tue, 16 Jul 2024 15:40:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs.
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
 <20240715-soc_info-v2-1-3836c8cc27a5@amlogic.com>
 <dea46ec5-5540-4cd7-8f96-387463413b3f@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <dea46ec5-5540-4cd7-8f96-387463413b3f@kernel.org>
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 379c3db2-9013-4c68-2a58-08dca56a81b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU53cTZhSDRhMElTT1ErNnhKNVVYMTNDd21WUS9wYm44TEhGWkpERXFLdXgy?=
 =?utf-8?B?RG9DRmkvWE44T2s0SDcvWmQ3U0psTno0RWM5MXdPRkVIUXdrcm5DSUEyZElR?=
 =?utf-8?B?bTV2bVpRSGxkR01EVEZsejBnbk8rLzNhUjVDR2hWOU5FQWhOTWZnMyt6YXdE?=
 =?utf-8?B?NnpDc1lBUzhjN3BQWDc1MU5IeU92akEzMUVIUk1CWkNOT0I5bUhEc3kwQklr?=
 =?utf-8?B?aTZqYkFCcWNtbjU4NWhCSm9LUmYwRVpwZGpPTGpxRmJveEVDNXQvdUFpa1Az?=
 =?utf-8?B?ckNoM1c0SlF4cUJySVpLdWJjSnJvQzhXZWM1OFZQMjRnVzlEbS9LK3U4emJz?=
 =?utf-8?B?anJZK2ZIMFQwbGVXekRWaGxkTDZjT0Y1M1krN1F0RUdZVTFybks1K2orRlha?=
 =?utf-8?B?SStrZHA2QXpTUE9mN0dpdHVMNXovck51SFdlYUtydVRXb2gyRit0aTVJREZS?=
 =?utf-8?B?bUpLT3EvT1JWSklRMHh5UFFFT0NLMi9MVVhjZ0tXVUsxYWFNa1gwTk1sRFhq?=
 =?utf-8?B?WUpxeHdhSG1qUk9SV0lNaWVuVGkrSGtUUjlZRkl4ZENkSVFoMkNpWm5DUWU2?=
 =?utf-8?B?MG5lYkpQWDRETzFMMUNLOStTbis5V1BVaGdSWm9wQlNEM2dyVGlpVGJaQVFn?=
 =?utf-8?B?bTBBV2p0VHlYbVRaYjkwVXY1MUhPZ3g0QkJqS2JQQ3hZK2hZaWNidUtaODc4?=
 =?utf-8?B?WUx2bk0xUmlsUkdwMVIzSHVFN0ZRNVFmcXUvdEdwOWZuckNFamV2OWE2Qmwz?=
 =?utf-8?B?NXdNWHpsa0cwT2N3Z3ZWa1JXa2lIRHBvUElUd0VGcE1Ockg1U3dGRFJUcFR3?=
 =?utf-8?B?WjU2SmFOZjFuREpJZTQ3bmU2K2pXM3ZRcnVUWTdjYlJMWGJST3VYMm02akJ6?=
 =?utf-8?B?SGRnWVZqeWZqZmFVQXNEMERyck5QdE1kSXRmWm5CeGhuRXVZMkpkM2R2RVlY?=
 =?utf-8?B?dWdHd0xKTThlRXFFUkN4Slk2aFVmMGhxM2ZkUnExZ2JDRFd6WHZiOW9XWjg0?=
 =?utf-8?B?eHR6UXpBSGduUjdrZm94MFBJTmpRODBqUkJ2U1VqVEc3MGxGYmVIcC91RTY0?=
 =?utf-8?B?US95R3NVR1pnUTFGYVFEbUZ4NSt2Y2lrdktLTTNsN0w0aFh4TE5DQWgvcCtH?=
 =?utf-8?B?TjJIeGVFSnFzTFo0WlgvMXlONlVOZk5WMUlLY1JoUGJTQ3hieTZLMVBJNzRv?=
 =?utf-8?B?VUFLejJOSEhxMmNCSFVOenpCQnRZTFhDRlB4dUl6bDBMancxMHhFSzVLcXZK?=
 =?utf-8?B?WDl4bDJjdCs4cFV2L21UaUlNY2U1V0dpOFZhdW5VVytUaW5OS0RvWlltMEQ2?=
 =?utf-8?B?NXY2VXBOL0ZrZmhCZjdyb3AyOVRiSmxJb0JtMERFN014RUpiTVpMbHRFRjBq?=
 =?utf-8?B?aDF6YlFrM0V3NzJ6YkY0bklaRHl2MDU2bHdvMnlJUjZrdGFHQ1VHTGIzVHVo?=
 =?utf-8?B?cnBNZVExRk9XTjZNYkEyWHlaVFBUNU9zQ2l4VW9nQ2FmbEl2eUk5T05TM2xi?=
 =?utf-8?B?dlBkNzNZWmJUOWpWTVNtU0ZKRjYzMkhIL2NCQkdQSjRobTM0QXh1WTB2MUtu?=
 =?utf-8?B?RHJQbFZnTjM5d1B1aitCUmRMOUtHZzgzejZEUVRwc0JGN0NPc3I4Y3Mxb2hL?=
 =?utf-8?B?b081V3pKR09SazlqSi9wcjJLeU8xeGZpZVcrQnhLTmlmUVErZ3lqQWhsaGhy?=
 =?utf-8?B?SGthT2VxdTNNMUU4c2NVQmJ1Z1QyRWI4aUFGVldOVDcvUC9mT0J3NjBFSVJp?=
 =?utf-8?B?M3o1bzltS0RhRzM3RHdjdzNUOW52M3M5SE53RjRtL2liSmppZEZHM1ZieE1t?=
 =?utf-8?B?Mzd5S29NSjlWYjk1NGZ5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFtNGRQc0lYeWQvMG9ZNFNrQmpVU2FBRmZ4N0VVZUpJR3RoZ0ZicytvalNW?=
 =?utf-8?B?YUluZ1E3UHBKVithZGlDWlA2L0hjbDFKdW9uN1hUMHpsVm01V1BVMnpDTnJl?=
 =?utf-8?B?dTRSZ2dnTU50eHBZaTFJQjFZMEU3bXpidDRxK29YOWYwN2xoK250ZDg5UDlu?=
 =?utf-8?B?aGRQeW85NmhydG0rbVNkOTlYcHBYVmxqcFpVUlJQSG5XSTBkWmdGTXhrWS9x?=
 =?utf-8?B?SWFaeERmR0xYWjFjeDhtUzdNUjhubHpVay9WdHk2eTQreDZSWnB6ZlNXSjBn?=
 =?utf-8?B?WnNQNmF5Um90NUVRWmN3ZHBUWGRZbGJjY1pscm1TN1c2NVFwdWNmUHIvUkJp?=
 =?utf-8?B?ZE9yTHlmeExQMDBHMlFobzV1VEtrMjdhMlE1ZkJ6K25rSms1TFQwVnhkeG4z?=
 =?utf-8?B?eVlXV0tiRXN1ellWbzRFVzJ6YlduNm14NWJ2YWhkNG5kZ2Jya3JtajcrWHNS?=
 =?utf-8?B?Wnl0TitPTmlnK2VOdC9LbTVQbUVrVnYzbmhnSWNIZVlEUTBwaGpBSkZvaEgy?=
 =?utf-8?B?Mmp3dHVQRmRBVG81ZXNOUURXVjNrU2hQeG1WY0IxSkZmOTUrclk4Q0pDUll0?=
 =?utf-8?B?Y09WUXA1NWx5MVBVZG1VdDBkanU3TTN0YmVFOHlsSWIzT2RqN01xVFB1bjNt?=
 =?utf-8?B?VEFvV2x6RlRFd1dXa0R0a1FpbDZGZlF4dHRNNWpQb01ZNkkycWRVU1R1SWli?=
 =?utf-8?B?RzFwWi9XL3VRSHppQk42TUdGZUhCeng1ZmJzRFluMGpZekJlem5hc29QeURY?=
 =?utf-8?B?RWIzZTRidGYrUEtUSWFpTlpCUzU2c3BGSGlsaFlXZk9oUmFYNWZLb2VOZnp3?=
 =?utf-8?B?TkRqd3VCbmwxS0cxOWZyY2t0bk92bnVXT1VUalNWdkRIcXpDMHIwWC9teVYr?=
 =?utf-8?B?bTdoVG8wVG5XbSs2U3Q0dFRWajBtamc2WnlJV0tuUHlTeGRmcExaZGR6UCtF?=
 =?utf-8?B?eGwrdWlhTDUvajlpNGRCdy80TlVZdmw1OUZCQ0pHU29tSFFqVDZZblU3OXV5?=
 =?utf-8?B?MDJYZzRBT1hPYmpsdDh0Y1dIOEtMMjVvK3J1MTRkZ1BPeXo4TGVQbXVrajlT?=
 =?utf-8?B?TnVtcFozK29waFR5cHhLRnFHQXc4NVBUeG1iRlMvQnFZL2R0bTQzclJUYkJX?=
 =?utf-8?B?SVY0UzkwMFU0Znk5TG03TkZWOEJKcXBWR1NtbDRWZ2ZyNVhRTStpQmV1dmVB?=
 =?utf-8?B?c3hkMzVOdUJWVXlERVZuKzJacy9VK2F5MDNpYnFIVW9SOVZ4ZSszNjgzOFlt?=
 =?utf-8?B?Qk14TDlWT3I0LzVpbVl0NkN3dVpVRDZUQ0VGeHRJUGpjZmFUQnVtbmxsL3BD?=
 =?utf-8?B?dnVDYmQ2bUExVG5zMnhPaktTQVM0VGk3eTE3WFJSU2w3RjlBekk0UERxYml4?=
 =?utf-8?B?UDRjTWRPQmx2WnN6R2psOTdsMlp2U3hCdUFhdkJKMnRFd0RuTnV1M1crTVlZ?=
 =?utf-8?B?WkkvSXJmOEF4NjIrd0Fyb285N1F2ZHh2VThwd2x2VGRQRjFwWGtpblFaRXFL?=
 =?utf-8?B?OVh3bFFlU2w3WjRwNTRuK0N1TCsvMXg2dVBTVlp4MlQza2pGRDZ6ZDg3MW51?=
 =?utf-8?B?eElaYnplQUI0VXBYUHhVZm9SblFHSUZOV1Z1c3loQTVCdVl3RUo5cEZheVRo?=
 =?utf-8?B?NFhQUFUxdEZGdFMyUDl0dzVDdHc4WnVEQU0rZVdCNjRSOHRSZ29JNXY0dC9u?=
 =?utf-8?B?Tit1M3Q4N0pyNS9SNWNDNzhkcW5VSU9KUnRBTXRKanNaRk9rS0RGMWhvcitS?=
 =?utf-8?B?dzYwWWcxNEVJSzNob2dXa2dOYS9ldEgvWm93a2dlRjROU09Rd3FFY1k1cW5W?=
 =?utf-8?B?cUNCM1lLYzZaN3BqeW9VQ0JJNnM2Yk5lclJsSXdNVG1nbkROb3FlYmJGVmc2?=
 =?utf-8?B?akZmSVNFMXYwOWZuY25GV1lCUGhKL0pXUWMvenQzUE0zWkg4QWhnVi8wL2NS?=
 =?utf-8?B?dytXV3QxR1J3cE5UQ3duMFU1QkUxUE1yYlRYUUNISXZXQWNZZGUxMFliTjA1?=
 =?utf-8?B?YWl3N3BFeFh2d3hOREVZa0F3aElvMnpzVTdFTFBMdE5aelp1Z1RuK0VCRVZH?=
 =?utf-8?B?R3IzbytxUjBrZ0dGOG9pb2xMVGxucm1PTjlpdWtoMTlNUkpPcU1ZQVI0eWtX?=
 =?utf-8?B?VStzWXUyTElpdmQ5MUdlLzU0RTFZOFNONWFIbzlqa1pYS1NaV2VyNStLUFRu?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379c3db2-9013-4c68-2a58-08dca56a81b2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:40:04.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqsPYgeB9whNnK2sojmJ7cecK7PJ7hNFisjQwPpP/ocGw5MfaUcMCL/jpCZCW0Gew9tpvIIWAHBwYrwt+uqsctYZXn10KMwXPkAHZ8cvpJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_004018_577660_A07860D4 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi Krzysztof,
      Thanks for your review.

On 2024/7/16 15:36, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 15/07/2024 10:59, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add dt-binding document for ao-secure of Amlogic SoCs(S4,C3,T7,A4).
> 
> Subjects do not end with full stop.
> 
Will fix it.
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
