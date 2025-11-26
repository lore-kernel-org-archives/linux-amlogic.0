Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0F0D10397
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Nov 2025 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+n3HDIkLlY4/DXzTIK3qhaPr/tkQgGgeLky1/51T4k=; b=zl4pza45p6sGFOvhFyMIPVPuSG
	y9i/uJIacVfgtJM/pj35GiiFhtEbicArp/LfNBjoNwubozpr+yF3yJqfsCBnaWTGHQ2xLTja9D4G1
	aRkBWBsraHXU6rRtQeF+RthqHF1EXo+vxwKaUSvl/xqLr8nJC0xkmccyo6FW9l9joSiHHB8Jxh50O
	jCF0kMAOeMn40nImLRvGrZ3gmrKc3bK1WDJjJUZsZyh/T4SLnkmgk7utEHHOdCmGuEa2Ws6P4+fKT
	09vkPgt1+HuLKechwNPFFVEKmIpcbW+Dg1B6JAq3+zy10CDyFBSfWpxPbKrQblBC+5GeXtCF/WreI
	hLFCWbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBWr-0000000EgZ2-2KKv;
	Wed, 26 Nov 2025 09:09:37 +0000
Received: from mail-koreacentralazon11023081.outbound.protection.outlook.com ([40.107.44.81] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBWp-0000000EgYY-0WpV;
	Wed, 26 Nov 2025 09:09:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCCHj6duriO7AqUYXSPwgs0U0MrJs7k59n5t6zF7R52MXOaq8x++L39k9pTnoPZluc21j83ci42K6HqukCdJOEpcq2Lzw5akLjUIZOAq1fajIAqhls5/3ZK3GQazybCHU7GTAKAjA6chn3FL1zIWqfXt6fc8vXoOlNTqPvF/yVTsuEMaAAhWG2O5pyB4fjBhqRx3uaxPUerctyFlr4ZLKLJfiRXg0D4av9bLg3e/7pzNxLSZWmA8y6mEpwOb3HSF1u570W1z4ZgQPwU3XRicTaIIwAt27YTuZNgmxHzcrPE6F9+iMhP8DRT7nADDJxNCse6g6lIg5/U+Y6UqVzzUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCSaqr0yY7yMobqrTOd1MIc5ySSQkb7Sdi+zEbccLVI=;
 b=CXXe7KeQ+oaB8DPDCytHeUMmNlfdlOb7k6NgsX88Di12QkfJB6KsKOmYnswjQmu+ircC/GqmSYZK7pgal3kaeDpb9pwRXCfvERY3u6GdGQr1B6nrNfVFnyb56/3BMkb5hgveX4uUosoMTSojwm+g7DuB+GUS8FJ5OjJD8LtlNpgOXXPvJ+FYR7exC/9PsAnvYmr+avFnVWEcENSPYkWAzz2BeSN9YpMxGW46ArUH0f7KO5GziB08ZmhGOd+B96j/Bhy87vii7qH9Ohd47Y+h+HlLfINPYXymAgdc94GYBejOEa3M4CBvFyIAPIO0wKBTf/ResqR/1TbS3rzcgEDYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCSaqr0yY7yMobqrTOd1MIc5ySSQkb7Sdi+zEbccLVI=;
 b=tTYddm97GZfE9nOWwmTidoDH8fQRnPwcd3i30VSi+pgZ7ByO8pmQhW2zq/DiSMETwsAaypJomulSyVVjcs/h1NkmXDlBds5iABaB9kehQ5vpqM66dZNWDJShLs6fvJ9FBG4wehe/bDWNhVagKAuvRBj8fPMjuVrogevCwo5TCbuqNV6P2kddWEg4fMqC27NeMMP7Ef1AV0p7HHP8ib7dAuOiyGquFjxMDnEssS1x1UEPsZpyws0JJqvbmElSvxvo7gvXiPPUGLb87pz8xkptvzCUXn/54fSetE6Yh4An+k95VWIEAi8/pidEHXIvI6ps82mVr8YqdneotDZq4+6NKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY0PR03MB8299.apcprd03.prod.outlook.com (2603:1096:405:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:09:27 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Wed, 26 Nov 2025
 09:09:26 +0000
Message-ID: <e1e3182f-8c6d-4b76-9659-5a1cd3a19067@amlogic.com>
Date: Wed, 26 Nov 2025 17:09:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] add support for T7 family clock controller
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
 <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY0PR03MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5f8ac-0d34-461d-d741-08de2ccb7fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWEwdDdVVnlXQVY5TjZ4VnVwVkg3Q3BuVGFjZmJ2Z0J0K1lwOWtJQlc4NTdD?=
 =?utf-8?B?Q0RraXd1VkU0NDN1ZUJOcE9TNktSczVUc01TN2hKdmtkeVlFUE8yd1RZanVI?=
 =?utf-8?B?NTJ0Q1MweEV6SHZEcS8wVlJDWnpsa0VOR1krSDNYSExlYm5tb3NaTjR4TXRI?=
 =?utf-8?B?MjIzTTdTRzNsNmF1R3RNNVgza0ViWnRXRVUvaVlYMzMrYU5zNm5vY29lOXZD?=
 =?utf-8?B?L1E4TForWUtLK3dsQkZmYWVMbEJsdzlMWTdrNXVxZjFkQXptc250WERMVTZG?=
 =?utf-8?B?TEtoTmczWmg4Ni9iTFZocmNTZXZ2ZitCanJOR3NySHZZcTRxUnJ0bjJTYlBJ?=
 =?utf-8?B?LzBmTXlZWSt3QUZQeDV1akQ1Wm54dnJkN3NsekZnU1R5Nkt0bnhwOEFNUG9q?=
 =?utf-8?B?U3RHQStoYzg4azI0MXRLTFRxMzhidEhGMFNFbXo2ZVNBR1kveklkaUt5OERJ?=
 =?utf-8?B?alJJZnBsQ2FhaUpJNU5nMXFDYWNVVmoyQzM4Q1Zkd1Erb3U0UnFJQlp4OXZW?=
 =?utf-8?B?aFp4dFR5UTZncVJGUlVXV2FUQ0txNy9TbENBZ2FpUzB5U2plQkhiTFl2ellV?=
 =?utf-8?B?cnI2NnFkcTNlUWpTTzZpL0hzUWkyUC9kcFUvcjh2dkprcFRlakp0VWk4aW9y?=
 =?utf-8?B?ekhUTGJwc1A3bzRLUXY2NDdRM1NLenpTZ0w3YzU3SkV0OExHa2lLY3NyRTA0?=
 =?utf-8?B?c0w0bU5JQkVabXhDOUtUQlFHWGdud3V2OEhuWFFUcml6Mkl6K2tRS1h6bWhr?=
 =?utf-8?B?L2ZwSWlFRkpYcUM0L2hBU1YrV1E1SlAzS0Q5R1c5bUFNTFhWSitod0ljRVlO?=
 =?utf-8?B?clREVm9TK2hKclBXd0xvd3lOenRjVVhJbVZCd3laaGp3aGJsT1dLS1FZQUFq?=
 =?utf-8?B?Y202Nm9VZVAzMnVFTUFXdUdDZUhvcHp1Qm1hblh5Q0dvOVdFNm92bFU5OWZE?=
 =?utf-8?B?eUxxMmN1Nnd2RjQwanhsRUVzTkE0UHhTSkVvWXZQayt4cWNqQ3hYMUpLajdS?=
 =?utf-8?B?d2VFR0FQRDNXYjFuYkdHTzh2ZVF0NVJjVll4cWU0V0NiUCtKTXI1dlFRamJ2?=
 =?utf-8?B?R0ozcVNYODRIbkhIWXRXSFUrOWlQSzFPY0Y3R3lac0dxL1lJNGlnMUdJN1NV?=
 =?utf-8?B?N24rWlhHQjNsek5ndXhielVteWd0blJ5WGtlM2FvOEVIN2lHVWRvOG5UT2ph?=
 =?utf-8?B?VUpHeko3djluTG9BNitvbFpRZ05ZckFkWk9FUFZKRk5ZR1NiWmUvZFdSQ0hL?=
 =?utf-8?B?YkJkSzd5TXZwY2lGMXhoaWtBK1NtMHJFYU8zWTdNWEIxOHVTWUpKc21WZU15?=
 =?utf-8?B?eUxld3Y3Wmw2UXZsZ251ZlcwM1RNRHl3TkozWGcxNzluOElrZ2x6VUlZaStp?=
 =?utf-8?B?NTNFOS9BSENvMG5GRkdSVWczOFI1QWlnNG9JQUNoY2tTa1BjbEQ4OGNhYjZo?=
 =?utf-8?B?NWVqQkY2bVZVb2JOcWlmQzhOUGNHMzl0SmRFWCs2bm8rNEhFVU9yQXBTWmZo?=
 =?utf-8?B?dlBaRUFNRFE0OHN2QjdlU3lUcnZ1RktrYURyZStLNHh2S0xyVm5zeGJneVhI?=
 =?utf-8?B?OEV0aDNJRkJUdjNHcHZobkJ0THRRczByWXdtUTc0Nmg0MUNwWWFOL0hmdHFZ?=
 =?utf-8?B?WkJ2L0YwOC8rR0llZ0w5aXVKZHQxbHBLb3M2bHlwNUpBWmNSWnJyczR6ZEpp?=
 =?utf-8?B?OHdORWNQUFdLNnFOVjk3WmNYNkw5RFBWTjdzeEpUVk5YcnRySkh3Y2xIWlJ3?=
 =?utf-8?B?ODR1RGR3azI3SW1oNFloNHBlRS81eGdNNzEyN0NoL0tLSjdqck92aC9pMGhy?=
 =?utf-8?B?K3YzRlkvMWZZTmpqK044d2Z6M0NucjJaNEFwOG5CS3lXNE9lYm5YdXdyR1Nr?=
 =?utf-8?B?Wit2cHNqYitZdzNpaHhmVGJYYmY1RjZQa1BWZWowaU80WGgrQ2w3cWNPTmFo?=
 =?utf-8?B?K0xHSmtNc2pQVEZlbDE1bFcwRVJzOGE3UFU3d0RJVktjajQwcjdLVVZvYnRX?=
 =?utf-8?B?dG9MREJ0VjlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amxEczZPRGJCclFMOVBicHFDdlVadWVtZ24vMFpxcmprMlJXR0QxZ2hHa0ZM?=
 =?utf-8?B?ampTRUs5My9LTVkxVHhPcXVNdFNXZU9uc1lTWkc0TTdIdDJFQ0piYUZwa0NV?=
 =?utf-8?B?V01Ccm43Umx2QWFFQ1hwcUsrVGZyeGoybDk0RjVwUkdtblJQQ2tyaVhrbWVy?=
 =?utf-8?B?N3lzS0VGbWd5ZGxGUEdzSk5SN2l1blMvMnJ2b2crOVlnUGtLbWhUQ2h3cGZB?=
 =?utf-8?B?REZPeFZPUUVaSEJaU1JwMXlXb04vcjVSRjRiOTZtd3ZJUHlPMzZ2cUJjN3gw?=
 =?utf-8?B?UTFvT0VKUHdZbkF6cmluejJNd29NY2xzRWlIeHRvN1lwUW5DbVhMMlkxRm5J?=
 =?utf-8?B?SXVQRWNXb1ZFSmtQTDRRZVUydEtxTHFBSzIwMUZ6UTZFRHcvRGthUlI1SnNy?=
 =?utf-8?B?MDlJSWdDUUJEVTNFU2p5L1lkQ0dxWU0xd3F2NWhoMERVeWZHc1FSbW4xQzk0?=
 =?utf-8?B?KzJ2N2RRYmJEZmhyQW9vWWNZbVVsSmJ1aWpLRGplY292Z0JLNWJmMmNCQ2RG?=
 =?utf-8?B?NDEzVHBDT3FaSytxNUJUM0Y2RFVrYWFMZUszcUQ0SWdqNmplWUFUWEhxN2lp?=
 =?utf-8?B?SjVYazJWWEp6VFdRcWhaeWR4NmZpdW1RNUtMSW00WXZvc2xicFVjY29BcUtr?=
 =?utf-8?B?c2hrZjNJb1RFK2NVZnY3cmRTeHlYS2s4WnIxS3NTcGZYOEFyZ3NBWXgvQjRZ?=
 =?utf-8?B?azhBMFJzamtsU09pZklBQklyeWdWbTFLMHlBbmRjOG9SSlpHdU5CYjl2ejB0?=
 =?utf-8?B?czFtOGVIYUNTRmtsSEs1Z0l3VjNiNmRtZ204SVdrSWh3d2RSL3hEWU5YUnJU?=
 =?utf-8?B?a0JkZXdXcmhiMS9GL2toODNoanp0Y2NSUjF1UGdhaHVRNzQ0M2Z1eFdSbEJF?=
 =?utf-8?B?b3NnQmVjQlV1NEs2MllHOFBKNThyRlRWUXdTT3BRcFFJY0dZbzFwUy95dXZE?=
 =?utf-8?B?STBWcU5GSW5GU2YvV0kyWnlzZWlxREVtWnN2d3RwemNuOFNxOXJDM2ozMmVQ?=
 =?utf-8?B?d2tEcGZsSzhobmNWRkJhQlN0dzZsOTRZK2pLeG1tL2JTem02NlVnemFhOXpJ?=
 =?utf-8?B?M1NJYzViVkt1c2JaSDFQemJOMWNCSFpUc2ZSbWxoQ3o2MTRTNCtScGQ2MHkx?=
 =?utf-8?B?UHVKdlFGT2xjOUpGOGFqcUNTYy9HYlRhYTVra2VMUzRqYTc5cU5VdGZuQkls?=
 =?utf-8?B?OWlhYXYvTEtaY1FlTGFjRGQwcVRiOVhrcWcwazVOQjAzVmxhbWN1V1dXeUlB?=
 =?utf-8?B?akpKYVhGcUhMUzBiUGJVL1J3NFRJRVJKeHI5dmNqSysrTGVDK3k5ZlFkUEJ3?=
 =?utf-8?B?ajQrdks3UjZkTnhraWZsdXMwWFlTT0kwVVZzQmd5RGlqNUxTRndiazZvUjZZ?=
 =?utf-8?B?RVNQRHZGcENibHgzSXJpZ3YrMHBZUElpWWQ5ZXJFVDJQVFp5OE9mMmV0aGlO?=
 =?utf-8?B?N3l0TVZMWldDL2V2L0hiWjlzR0pVRk5xWG1xaWdxa1Fzek1WL3JMZENLdWdz?=
 =?utf-8?B?dlYrck1qL3F1ZEN4RC9sZXExTG1KOUM0NGJ2Nm92eS85ZUd4N2hUZVRRZURF?=
 =?utf-8?B?VGJBOGc5cUptS3hrVDgyOWtIdGNjMDJ6Q3R4TFIwZlJPNEpxcWhDSVZWMkhD?=
 =?utf-8?B?TktYQ1l6YlR4YzNrQ0haeG0xaWxZSmxUSGQ2NGhWaGVDNWdMLzdsNU1lU0Zs?=
 =?utf-8?B?MTUzamxaa2lwWXNwZkxrVkNWZStTZmN3VFZEVXYxOG1GL2g4UDMrVjV5TW41?=
 =?utf-8?B?dFp3dENoRkRNc09qdkEwUThyd092R25iN25UWWpuK3pKR2FmSGVoeGkzaUU3?=
 =?utf-8?B?bUxGMXNVRXBESG9nc0t4SXZkSXg5d1ZGMmFMMmxHdE9mWkVNS1l2aDZaRUph?=
 =?utf-8?B?N05nczYyRlBZNVUxT1pvZ25yNnR1aUQweFc0YTh3T1FxTVJqQkNXQWhjMS9D?=
 =?utf-8?B?NStCclVMem1JMGh4MUt3N2M1V1Z6NHd6TXh3SU9xS1R5R3h0UU1sY0FSaERs?=
 =?utf-8?B?dGRzQ1ZCalZXL0krTGtlbHpJRmNINlhlNWN0Y0JPQW90ckVjZFlxNTZQcXRk?=
 =?utf-8?B?b3ZvUGZJekV5bHZrY2E1bXlpNlJsbjlGY1RtZUZlT2IzZ0RXWmJ6Z0NlSXU2?=
 =?utf-8?Q?UQbX320/2HP/NcdQRr2Th+Sg0?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5f8ac-0d34-461d-d741-08de2ccb7fc2
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:09:26.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JqQRYOZW/D7QsMnuEoRatTke+ViqcXhkULu3NczqZ8X3i5W5ffkngsWojJ46CfH2vEKStTpmYGzwNjkdmLA1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_010935_173709_B4105B27 
X-CRM114-Status: GOOD (  15.53  )
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

Ck9uIDExLzI0LzIwMjUgNTo0NiBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFM
IEVNQUlMIF0KPgo+IE9uIEZyaSAyMSBOb3YgMjAyNSBhdCAxODo1OSwgSmlhbiBIdSA8amlhbi5o
dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPj4gSXQgaW50cm9kdWNlcyB0aHJlZSBjbG9jayBjb250
cm9sbGVyczoKPj4gLSBTQ01JIGNsb2NrIGNvbnRyb2xsZXI6IHRoZXNlIGNsb2NrcyBhcmUgbWFu
YWdlZCBieSB0aGUgU0NQIGFuZCBoYW5kbGVkIHRocm91Z2ggU0NNSS4KPj4gLSBQTEwgY2xvY2sg
Y29udHJvbGxlci4KPj4gLSBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIuCj4+Cj4+IENoYW5n
ZXMgdjUgc2luY2UgdjQgYXQgWzRdOgo+PiAtIHJlbmFtZSBydGMgYW5kIGNlYyBkdWFsZGl2IGNs
b2Nrcwo+PiAtIHJlbmFtZSBkc3AgY2xvY2tzCj4+IC0gcmVuYW1lIGFuYWtpbiBjbG9ja3MKPj4g
LSByZW5hbWUgZmRpdjJfZGl2biB0byAyNW0gYW5kIGZpeCBpdHMgcGFyZW50Cj4+IC0gYWRkIGZs
YWcgZm9yIFQ3X0NPTVBfR0FURQo+PiAtIHVzZSBUN19DT01QX1NFTC9ESVYvR0FURSB0byBkZWZp
bmUgZ2xpdGNoIGNsb2Nrcwo+PiAtIGFkZCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgZm9yIHQ3
X2V0aF9ybWlpX3NlbCBhbmQgcnRjCj4+IC0gbW92ZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyIGFm
dGVyIGNsb2NrIGRyaXZlcgo+IExvb2tzIGdvb2QgdG8gbWUsIGp1c3QgYSBmZXcgbWlub3IgY29t
bWVudHMuCj4KPiBJdCBpcyB0b28gbGF0ZSBvZiB0aGlzIGN5Y2xlLiBQbGVhc2UgY2hlY2sgdGhl
IGNvbW1lbnRzIGFuZCByZS1zZW5kIG9uCj4gdGhlIG5leHQgLXJjMQoKCk9rYXkswqAgSSB3aWxs
IGFkZHJlc3MgdGhlIGNvbW1lbnRzIGFuZCBzZW5kIHY2IHBhdGNoIGZvciB0aGUgbmV4dCAtcmMx
LgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyEKCj4KPj4gQ2hhbmdlcyB2NCBzaW5jZSB2MyBhdCBb
M106Cj4+IC0gZHJvcCBhbWxvZ2ljX3Q3X3BsbF9wcm9iZSwgdXNlIG1lc29uX2Nsa2NfbW1pb19w
cm9iZSBpbnN0ZWFkCj4+IC0gYWRkIENMS19ESVZJREVSX01BWF9BVF9aRVJPIGZvciBwY2llX3Bs
bF9vZCBjbGsKPj4gLSBhZGQgZnJhYyBmb3IgaGlmaV9kY29fcGxsX2Rjbwo+PiAtIGFkZCBsX2Rl
dGVjdCBmb3IgbWNsa19wbGxfZGNvCj4+IC0gZHJvcCB2MyA1LzYgcGF0Y2gsIGFuZCB1c2UgTUVT
T05fUENMSwo+PiAtIGRyb3AgU1BJX1BXTV9DTEtfWFggbWFjcm8gYW5kIHVzZSBNRVNPTl9DT01Q
X1hYCj4+IC0gZHJvcCB0aGUgcmVnaXN0ZXIncyBwcmVmaXgKPj4KPj4gQ2hhbmdlcyB2MyBzaW5j
ZSB2MiBhdCBbMl06Cj4+IC0gdXBkYXRlIFQ3IFBMTCBZQU1MCj4+IC0gYWRkICd0N18nIHByZWZp
eCBmb3IgdDcgY2xvY2sgbmFtZSBhbmQgdmFyaWFibGUgaW4gdDctcGxsLmMgYW5kIHQ3LXBlcmlw
aGVyYWxzLmMKPj4gLSBjb3JyZWN0IHYxIHBhdGNoIGxpbmsKPj4gLSBhZGQgbmV3IG1hY3JvIE1F
U09OX1BDTEtfVjIKPj4gLSB1cGRhdGUgdGhlIGRyaXZlcixoZWFkZXIseWFtbCBmaWxlIGxpY2Vu
c2UKPj4KPj4gQ2hhbmdlcyB2MiBzaW5jZSB2MSBhdCBbMV06Cj4+IC0gYWRkIENMS19NRVNPTiBp
bXBvcnQKPj4gLSBhZGQgY29uc3QgZm9yIGNsa2NfcmVnbWFwX2NvbmZpZyBpbiBQTEwgZHJpdmVy
Cj4+IC0gZml4IGV0aF9ybWlpX3NlbCBwYXJlbnQKPj4gLSB1cGRhdGUgVDcgUExMIFlBTUwgZmls
ZQo+Pgo+PiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTIzMTA2MDA0Ny4y
Mjk4ODcxLTEtamlhbi5odUBhbWxvZ2ljLmNvbQo+PiBbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI1MDEwODA5NDAyNS4yNjY0MjAxLTEtamlhbi5odUBhbWxvZ2ljLmNvbQo+PiBb
M106IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDUwOTA3NDgyNS4xOTMzMjU0LTEt
amlhbi5odUBhbWxvZ2ljLmNvbQo+PiBbNF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MTAzMDA5NDM0NS4yNTcxMjIyLTEtamlhbi5odUBhbWxvZ2ljLmNvbQo+PiBKaWFuIEh1ICg1
KToKPj4gICAgZHQtYmluZGluZ3M6IGNsb2NrOiBhZGQgQW1sb2dpYyBUNyBQTEwgY2xvY2sgY29u
dHJvbGxlcgo+PiAgICBkdC1iaW5kaW5nczogY2xvY2s6IGFkZCBBbWxvZ2ljIFQ3IFNDTUkgY2xv
Y2sgY29udHJvbGxlcgo+PiAgICBkdC1iaW5kaW5nczogY2xvY2s6IGFkZCBBbWxvZ2ljIFQ3IHBl
cmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIKPj4gICAgY2xrOiBtZXNvbjogdDc6IGFkZCBzdXBw
b3J0IGZvciB0aGUgVDcgU29DIFBMTCBjbG9jawo+PiAgICBjbGs6IG1lc29uOiB0NzogYWRkIHQ3
IGNsb2NrIHBlcmlwaGVyYWxzIGNvbnRyb2xsZXIgZHJpdmVyCj4+Cj4+ICAgLi4uL2Nsb2NrL2Ft
bG9naWMsdDctcGVyaXBoZXJhbHMtY2xrYy55YW1sICAgIHwgIDExNiArKwo+PiAgIC4uLi9iaW5k
aW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwgICB8ICAxMTQgKysKPj4gICBkcml2
ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDI3ICsKPj4gICBk
cml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICAyICsKPj4g
ICBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jICAgICAgICAgICAgfCAxMjY2ICsr
KysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmMgICAgICAgICAg
ICAgICAgICAgIHwgMTA2OCArKysrKysrKysrKysrKwo+PiAgIC4uLi9jbG9jay9hbWxvZ2ljLHQ3
LXBlcmlwaGVyYWxzLWNsa2MuaCAgICAgICB8ICAyMjggKysrCj4+ICAgLi4uL2R0LWJpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MuaCAgIHwgICA1NiArCj4+ICAgaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXNjbWkuaCAgIHwgICA0NyArCj4+ICAgOSBmaWxlcyBj
aGFuZ2VkLCAyOTI0IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGVyaXBoZXJhbHMt
Y2xrYy55YW1sCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwKPj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vdDctcGVyaXBoZXJhbHMuYwo+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wbGwuYwo+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGVyaXBoZXJhbHMtY2xr
Yy5oCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1s
b2dpYyx0Ny1wbGwtY2xrYy5oCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyx0Ny1zY21pLmgKPiAtLQo+IEplcm9tZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
