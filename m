Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D5F606A32D
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUfCWpU5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aBlE0tHG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=SHN7+LKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zrLj0kO3Ri/YhCpNgbFlsng2Y3anapb0MvUlWy3CKZQ=; b=GUfCWpU50Luc6M6E7n7pEWEL/O
	lPIhBw8EPFLR7E6ZObPt6r3N1kNn1DRru3/0QLwcFO7yjyaI4TG3w69xTpK5ksgOV41rqv0e3gYhC
	ecT2MhrggzFKeeKASZY+A0n2tFcDDgNPBuQ3txLmAwkI+UMckw7/Yt3rDr8B6Dfd+Q2L6Ud60l/vO
	dj+JbR3n8ZEXOMz434HUrkzFLeE0yVDYMqcw00T1Rqwk7xlxvp+jNBFcSgBhlHUh7onRJpEFJpmIz
	gqpbGiK10z5akPMREs/mKmKEoJh1qjPsHlzxdt7QCaCRNl63aTlNy3uRC06BSVDbB+01UzTfrnf4t
	+swuFA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpgU-0000000F4Hf-2pC4;
	Fri, 27 Nov 2026 06:43:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpgT-0000000F4HK-3TKP;
	Fri, 27 Nov 2026 06:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PmzkZL98IFVLVO1AVH100KZlsT1wHhOSsnXCSCBipzc=; b=aBlE0tHG4RlqfPNnCU6OSczSRQ
	KVMxVVfB7Qu3DLkx0cuzR24eqL7xxyEw5EOtrFUYSp/R5G8Sm3y2HEoxJ/jjeauWaHMwfuG+V+aGf
	eBoONdfgd1EJbMji+smuEaX38n0Kyhef9Z4mIbdTgN+kX0Sz6L9D1NCZ6sbzs/7GeRiX6+T9KCRiS
	fAyJgsPfF86JiUrIXb2qLthavZCKsjX3l7wT1bamGsWjcHm4+TalBSu7/GyoMucsOZRKWvcHHxtDI
	gCVw5cHwQ1ZoA3x2zTZRbGRd3FI2ntbwxP01WTfaiGtQ2y46o79f0WqO/hjX9aoCK7awtEvkIohu+
	t4eNSZmA==;
Received: from mail-japanwestazon11022118.outbound.protection.outlook.com ([40.107.75.118] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpgR-00000007OWc-05pA;
	Fri, 27 Nov 2026 06:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/I4LrVda4qNTJ15c74hTedwBNJTefgypE3HaEiME9ubZ2bZTsClwOzW5h5sQUDIcz1j30AgzI5plzSpPniz5hYr65iF6c03RMMueRwQuV+Y0YkMxy+ULpUlY9U7zZPn7syV/YbqlAa2XW0RP38k2diW22fb3PvZOd5pAlruN1yKhjYJ+XwsOeKlnqFGZIMSkMB98+SOTlmxJXFf6YuXUOAwWfZG5izxuGu8xIrA/1cEby+ptkXouWuKgMcywDilABEBW+TsFnKsq5ZGKCpqTaXFhJbcN78dhGHpJwLq/kLl2q3Z34oWd4H5H0nic35dv60lVKJNhCN8wPUDhhwKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmzkZL98IFVLVO1AVH100KZlsT1wHhOSsnXCSCBipzc=;
 b=SrAQ1K18Ptk9ZLPoSRS45Vr/1c6OwmgWWxYUyByVgqksHY3Vyjv1gOpZ1qt0poSbkRzkLgIejXtT6MBgNJSGx2r9B9TPJ7lE1fYLNjrfh/94frkC59BrJ0pI/OQ8/SgtXt2L50mtX8CU4q7RVS++UR6eGZ/4nHDM6qsWZ1/CuI3P3RbKCS/LoqJ53Q72LnI1qrDe9yhZUfiKQOOsfwNvBgrW/db90Ii6ShYzPx44c28Mb3jFeqr1lgbZVVPjHW/mFG+usbSdVQJcpkRHu1FvIZgCoETBs1wxZwFz5QFc9/aLQsTk1I1gYMPJDpWS6jwBw7In/C1VPto231XEjSUs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmzkZL98IFVLVO1AVH100KZlsT1wHhOSsnXCSCBipzc=;
 b=SHN7+LKmiBoiXVIttvkxn2a6QU6mLeje/HZlq0xlMomUKh9MOjJZE/EbA2TXN/MpAq+32u/PI8ahjKPUYkQnCyrOjLt2TIMzcgcKlpNFrvfxu2gHqTxtJgdvUvuEeali+Fn4nOd3fTXBGESNYVMg4qJ/h/PEzgptoKbMxovLhJDvizkhmxLAcUhPq2gwi26qvk7aiSXONWFGNKbeXC/szDmq1g5+FWnUsZSpKOWLGms2bxB2XGaRZYezsscki8Ac0amU+ZCIgMN0mVJBBR5PK7YAnra9VH0APwPiaSlAOOPgKcQtiLKM7e7Api6Cre8hMsnBt9h58LlQpcpyweDE8g==
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KUZPR03MB9712.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 06:43:33 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:43:33 +0000
Message-ID: <0548866d-8214-47f1-9dba-06629240993b@amlogic.com>
Date: Fri, 27 Nov 2026 14:43:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
 <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
In-Reply-To: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KUZPR03MB9712:EE_
X-MS-PublicTrafficType: Email
client-request-id: 9f45ff7d-be43-4d4b-9c4e-1c40968ef6be
request-id: f0f2b47f-b404-4840-262b-08df4c51c176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|261009223027099003|56012099006|4143699003|11063799006|261021135927099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: GuJZASr9mX9kdMGCT4cGmLwftaYxCpUU01MU+VtqJuLRIK6lDjs+97EJPUTl2gyvTj/0oiRyvjRqr6BdvAjcXaOHkRK5n8h6vOn/EMFI3KFz4VJ4C4V5yW06n03ZBLwbbwPMYidBlIFVmFm2OVMwpNZKMH/iDJeE9nfydfk4of+sxMu8YAaOR/IBrJNgdLpe3lpnqh4OJjBKPJTYhfjZJQvy3iE2RdNsrDytxis4a+c8MwWb99JeBhFkSjyyG2QSEetc8N/GLCRTbrfjF/L2CWOKBz4tdBcDkV7bocaB+d/p6GY7P1984JKr99ma4KGwBowsNpjLoOgw9CS0Mu96J/710iBE+IPGALbHmWyvqwOXI6uKy155RBQG5wclj74x/sKl6i13m/lQJf7dHCVcBfgA/QlrTwfeGnP3gGyNrsdctQX8ajWUCK074HiV31xlZqgnzZGlgvb1VFYRDpv2DtIxKKJO33eCAy6lLcqs0JciD92CQUjxU8iFwkqqwaEg8nWCWLNICH8d+UfCiXtRf2zHRayVEVUgpG3ZkR6cKbMmR7YEh9bQ0qcTI1IWiGlS/UCFlzQeTKI9m5pqI9MKvKLCUQO/vOYOcn2eWEwd+kzL7qgWPdtN0kZp2ttdoyIDLpBDwdxNtkU7mHorslJpHvMeiSnAoqeSFjbkzRlZtY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261021135927099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UngrVHhiSHlNZWJlTk1BWUlIS1lLcmdDOWhJZmZtKzZNck5mVmhEYTVNSW5T?=
 =?utf-8?B?VS80aFFGSy9VU1NuZnhGSlpuY3B3WkxkeTNmdXpqaStVM3FlVUVrdnBqMEVF?=
 =?utf-8?B?citDTkQxMktyWDdGSndBZFI2d0RyeTFyT1FQVm1YSmpNOGpvT09jbVhKZGhX?=
 =?utf-8?B?N2ovWXlnQ1MzUWtwUnJlWmVzaUpCSG1tWVhXa1lUb0h1azVKNTdidGt2NE1V?=
 =?utf-8?B?dXZ5MHhpZ0RuNVllVmkyYnJWOWFrakUxU0JXZittendGRkEwZkFwMWIydnRm?=
 =?utf-8?B?TU8vSjJ6OUZwRXhnVXZQUGdBbjV6bTBlVlQzajVJYXhMTU4yRGU5Vi9WYUhS?=
 =?utf-8?B?cUxZc25ZYkZ4YWpnam1sYTNCZE56QkpiaThIUGJFblFQbVUrYzNsK0dWaWVa?=
 =?utf-8?B?VUQ2ekVSb2RVNHlxVWxab09jUzQ1NlhiT1hjUTNXa1FBeDVRREVQZDgyNUFW?=
 =?utf-8?B?Rk9mL2E5MTRQdzlRS1pnYkpzUitjTno2dFdnNjMrejBKcEx5YTVMVmFPdlZI?=
 =?utf-8?B?eVJjZkVNVHRjK01sUkhOKzFFNlY0WGV3T1MySTNGUUI0QVJJR0c3UVZ5QVVE?=
 =?utf-8?B?WEl6Y1pCUm0xcFIzc1h1ZkZqYnZXWkJDL0NLY2pKQkZzN3ZHUzBvVGhvQjhP?=
 =?utf-8?B?aDV2QWJYejk4TmhxN1hlNFRPQlpFWFpkM3grRE11NjhPcjV1cW9ybnlnQW9T?=
 =?utf-8?B?VnJyNnFqT3ROSWFqWGE3c0dXakZwNTg2dzlPdGhwMVNMUEJzMHJrTjVvQlVs?=
 =?utf-8?B?SnZGWW1PQ0lxQmNEdmFFbnZRVHJ2cUhNZU4yM1pEY2VxZUgwM0NOSW9mTzNJ?=
 =?utf-8?B?NUtnZG4rU1J1Vnl0Qk14UzdZd3Rabnl6bFVnS1lYL0I3VEZFYVdpRTN0THRw?=
 =?utf-8?B?Z3QzNHBYcXZHWVdWb1RJQWE2a1crOEZ2MmpyTllDeWo4bi9mTG1Ud3dCbnFj?=
 =?utf-8?B?RnJFUG9naURCcE5nYTI0L3lMS0pwWk92b3BPWDJ1QTBqTXVHMjJLR1FPc0Zz?=
 =?utf-8?B?U1BZMVdvZkZZK0Z5VUFBY01OQUxWVFJTUFRQMWZ0R3M2NXVDWnllQlllaUlT?=
 =?utf-8?B?ZEd0QWt1U3prWU9pYXBKRitPQmR2K1BXN3Uzb0gvb25BVTBydVRvemtTcWhJ?=
 =?utf-8?B?TUx3djkxeWJVNUxvZ3Yvd1ZMUE1SN2h3Znd3SktYczdlcFlaYjJhUUwvQ0VI?=
 =?utf-8?B?YzQ4dHVMc3FvNDRtdTVPQ1VxcXRNYStTSkFVbk9tUDJHZlR2OVFLZUlGOTJG?=
 =?utf-8?B?V2hDODNhRVlqV1gwS0pxazNoTkpSby9VV3h3aWR4K01DcG9vWS9oMjlteG16?=
 =?utf-8?B?NGNvanZHTEdmNEpBVEkzdlBPQ2FQOVVVK3p2T05qaXo2cDY4cDg3UGwzV1Fw?=
 =?utf-8?B?YzRzTDNtTkg1dGtaWkRzZU9vbGN1Rm43bVVVeGpiaVg1MmRLOEZsUVBKUW56?=
 =?utf-8?B?TGNNUjVjNUhHZjdweDZHMGhYVWNNTTc1b2cyR2xyVjl0MkJMbEZCd2YwWFlj?=
 =?utf-8?B?MG9xQlVVVGwvL1JDNDdJUmFsbHA5WkRmYXMwVm5jNTNpNXVEQTNhZDZwbE1O?=
 =?utf-8?B?TXhZRFR5VHlyQm4zU1BkbStGeVFjbVY3RklNUHJUODlBWmhBY1hIVzc1K2tw?=
 =?utf-8?B?eTkxS29heHBXMmI2SlVPcnBNU253MWdZWWt5SUpqdjNYR0ZMS1FMb1RzZVNv?=
 =?utf-8?B?amg2K3dKZVRUZE1VOTcwVTVUNC85aFY2Y2FUSEIwMmJMK0pNTDFGK05KNFAx?=
 =?utf-8?B?TW9BTno5TzBFR2ExRWZFQXgyOEpkTFB3Z3JycHdNRlNBd1k4WjV5ZHVWend0?=
 =?utf-8?B?dW4zS2krcExINCs1WklGcWhZK3ErWG5MWW8wQ2RmNmJJVlVqaVpQL1NwMml4?=
 =?utf-8?B?N21Xc3BTUVdwQXJ4aThxSHRBamFhdG5MeUxZWUxBSkgwbUtrU3Q3UXhZTjFS?=
 =?utf-8?B?RUhyeVo3azFGbmNVK0xSL1NwSnFvdG1oazcyNW5aL1lzcHZCclpKY2RDcUc5?=
 =?utf-8?B?aFg3VkVvWU1DbExvOEtJTFBaVnkwZnlCTVJ5a29IM1ZHajhlaGNLL1FDOWJ1?=
 =?utf-8?B?dHd6a0lVaE83bmd3QU05bUZDdkM1Q2h5RFpwUUNiN0ZINnl2UzBFM1dBREF5?=
 =?utf-8?B?a3ViYUtQdWQwWTZTRUtNRWo3d2RpYmtOMmRZbnQxa1lmQkI1cW5wZnlwTnBw?=
 =?utf-8?B?dEJwNy94VUl6QzlBc09JMnFYQjluaE1OMnVCS09mdnFiQ3NzMGE4Y1JZK1Vx?=
 =?utf-8?B?bDJIbDE5SGxvREE0bjcvYzNXTEUrNjZlb2xVekJoUy9TaVFZZjlueGNsTUFK?=
 =?utf-8?B?MkRyWk1ISW5lV2d3SkZpRUJBeFhwZWFiem1CWmZIajNBWXF5VWxtQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f2b47f-b404-4840-262b-08df4c51c176
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:43:33.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL8tXCE8mcdnhCUCu1mQImTAbz2hRbNhaHBoo1NELvN1mHJ2QvAftBPojHcTSmGQnWOf/QPyz/+f3LHeSn7AUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_064347_030856_B1CDDF32 
X-CRM114-Status: GOOD (  12.19  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIDExLzI1LzIwMjYgOTowNiBQTSwgSmlhbiBIdSB3cm90ZToKPgo+IE9uIDExLzYvMjAyNiAx
OjUwIEFNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+CgpbIC4uLiBdCgo+Pj4KPj4+IC1zdHJ1Y3Qg
cGxsX3BhcmFtc190YWJsZSB7Cj4+PiAtwqDCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgIG07Cj4+
PiAtwqDCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgIG47Cj4+PiArc3RydWN0IHBsbF9tdWx0X3Rh
YmxlIHsKPj4gbml0OiBhIHN0cnVjdCB3aXRoIGEgc2luZ2xlIG1lbWJlci4gQSBwbGFpbiAwLXRl
cm1pbmF0ZWQKPj4gYGNvbnN0IHVuc2lnbmVkIGludCAqYCBsaXN0IG9mIG11bHRpcGxpZXJzIHdv
dWxkIGRvCj4+Cj4+IEFsc28sIHRoZXJlIGFyZSBzcGFjZXMgaW5zdGVhZCBvZiBhIHRhYiBiZWZv
cmUgYG1gLgo+Cj4KPiBPaywgSSdsbCByZW1vdmUgdGhlIHNpbmdsZS1tZW1iZXIgc3RydWN0IGFu
ZCBzd2l0Y2ggdG8gYSAwLXRlcm1pbmF0ZWQgCj4gdW5zaWduZWQgaW50IGFycmF5Lgo+Cj4gVGhl
IGhlbHBlcidzIHRhYmxlIHBvaW50ZXIgd2lsbCBiZSB1cGRhdGVkIHRvICdjb25zdCB1bnNpZ25l
ZCBpbnQgKicuCj4KPiBUaGUgc3BhY2luZyBpc3N1ZSBpcyByZXNvbHZlZCBhcyBhIHJlc3VsdC4K
Pgo+Cj4gVG8gYXZvaWQgZW5kaW5nIHRoaXMgc2VyaWVzIHdpdGggYSBtZWNoYW5pY2FsIHBhdGNo
IHRvdWNoaW5nIGV2ZXJ5IFNvQy4KPgo+IEkgd2lsbCBzdWJtaXQgYSBzZXBhcmF0ZSBwYXRjaCBi
ZWZvcmUgdGhlIHBlci1Tb0MgY2hhbmdlcyB0byBhZGQgYSAKPiAnbXVsdF90YWJsZScgbWVtYmVy
Cj4KPiB0byB0aGUgJ3N0cnVjdCBtZXNvbl9tZXNvbl9jbGtfcGxsX2RhdGEnIHN0cnVjdHVyZS4K
PgoKQSBzaG9ydCBmb2xsb3ctdXAgb24gdGhlIHRhYmxlIGNvbnZlcnNpb24gSSBkZXNjcmliZWQg
ZWFybGllci4KCkkgc2FpZCBJIHdvdWxkIGFkZCBhIHNlcGFyYXRlICJjb25zdCB1bnNpZ25lZCBp
bnQgKiIgbWVtYmVyIGFuZCBjb252ZXJ0IHRoZQpTb0MgdGFibGVzIG9uZSBieSBvbmUuIEkgd291
bGQgcmF0aGVyIGtlZXAgdGhlIGV4aXN0aW5nIG1lbWJlciBuYW1lICd0YWJsZScsCmluc3RlYWQg
b2YgYWRkaW5nIGEgc2Vjb25kIHRhYmxlIG5hbWUuCgpUaGUgRzEyQS9NZXNvbjgvQVhHIHRhYmxl
IGNvbnZlcnRzIHdpbGwgYmUgc3VibWl0dGVkIHRvZ2V0aGVyIHdpdGggdGhlIGZpbmFsCnJlbW92
aW5nICduJyBwYXRjaC4KCj4+PiArwqDCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgIG07Cj4+PiDC
oCB9Owo+Pj4KWyAuLi4gXQoKLS0KCkppYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
