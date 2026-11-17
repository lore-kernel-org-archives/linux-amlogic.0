Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC6606A331
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4nHjT7Fr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=XGcVNAYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cDYwfgWDu6uhT9xjBYfUMMDgu6Ou0CUKvia8AR10qlk=; b=4nHjT7FrZheH7hD27BnmBckqQU
	wVmq6i0GJtHCmdNIgbGqr6Y3vE//mn2buLcj+JstAkRY4/EeLk0E15TxcwJp34AIBnpddQ1huZu+/
	sxzDNaV+OaAIV5EwWPgzxiCoR/+jbLghWWTtFJUBXG3POZe3zfzi+sfc4LNyH5JHE4O6jbHoOfKpp
	hMujG6oiynl1+485yZvcQnH8dWGDrhCzjcDeqx6AqtjKXwK0/RCKmq68xGwfkMDNWcmWr5ogGSaRY
	D18NXmkf3bIslXKdIc0BJOb5BPbJO6ewAnKvBuvoC/36kYAFJ928ldiW1OG+P3vNNehgRPvo067yn
	EJ8Hhv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFY1-000000055lN-3xQB;
	Tue, 17 Nov 2026 09:32:19 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFXy-000000055kK-49dB
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 09:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuufFUohQ4Mmk3MxdrZgVVX1P2xpOjHptgUvPcFTEzJD8S6dGfQ9FNqe32JTcYE++inVSevoZS8xczreauDZk23WVJBKoQiokXoH7siqy1hXrFWvVTI+TAjvA7fhgEX9nLKFZi2SqsxoRirjdlhI24aB6aJsqH4cAIvYCPGegQVLKhBJtRGcymzK34ri5dlxJpuNpUV7KYxPPWKRqkzKlC6NwNDNqHQtimXCnihRTjCEq2usSElsYnM57f4Ow2JJuzonx8ZKuz6MgGV0ua6ItoRBY0aD4N2B2EizjtZFAFQnSyDU+n2TjKaSMZs6Ivt0iy1V43ctfz5qH8sfmHanYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyfiWhGTrprm9B6gHh1KS01+8vcAgtThEw8T/f1Fwnc=;
 b=Pgd4aJerSns7obidmZSL8uPz+bMbqHHPjXNy0mE710DcSiaLAIk+gXbjCG8A7JpoNcQVsqpYShKxCjn5IyIEXJGm7h/F2q8w5pYuXTuhzzLqrev9fF2Kvis14Yvun9LtoN8mL68oxA/9hACXLONaewaXmhxZDXr6zWIDROJV6oxhqF5HLFL009xuhD0EtibkV/P8BoBT4JkXhC30bEvakpTQT892rXomWzgAB4ckbalLcwCO8Uaq+VeUajCdg+Z2CUUBnk5irM7apP0Didx05Z21DFQTFz4kvhwKXDmK5t5NAv2e87UFmaVFVNKxr2jMXInRyFqX1RkLHMyC4m5FeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyfiWhGTrprm9B6gHh1KS01+8vcAgtThEw8T/f1Fwnc=;
 b=XGcVNAYgE4o28EZFFuScP0ep7IhBgb6/3jk7wQocY6LEh2HQMizme9nv8aLhscfBLmHUPlamhjn8WBvL29wYVtLN6es9QWavijxjJFA6KU9ytkdqstQLHtp4jPIYvEZN5TRtgEGX7uGuCq2jIynaAdOx8DRL6rjDaVtOPiaDa0USANJ5fh8EmpXJ3A1DhFCw+L3dWi2I2H8py15H3k1magigPvWruiHAu82T7U5L3pYKLiSP0or9E62juqLn/SDZWtfCFiG/eTJ/fciZvgxo4/5Oik/odIb8DN9gfOOZjPjGV6iunS5TXRYOZia7/DEIasFG8ysXFpSDbZGi/eBSqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYNPR03MB9821.apcprd03.prod.outlook.com (2603:1096:405:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:32:12 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:32:11 +0000
Message-ID: <0f0f687a-83d0-4af9-b146-3d737ccac809@amlogic.com>
Date: Tue, 17 Nov 2026 17:32:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
 <20261117-a9-i2c-v9-1-7b303c894fea@amlogic.com>
 <78d4a042-d9e0-4b88-8788-30310462dbdb@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <78d4a042-d9e0-4b88-8788-30310462dbdb@web.de>
X-ClientProxiedBy: TY4P301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYNPR03MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 693dc191-7ea7-4c94-2162-08df448da871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dK03VyP/ShZLej0H8IQu2AkpDJu6+BYE6IQw0AuDdjgD4IgtZuOJvFrEg9TDkbaYr1swsVEOFj+hly+MTTgSx5hM2Muuva5jXdf0DHEPZ0nsS4mzVsrcShJjfkMkT8mmvnffesMILnWPda2KWcBsa2fpZtZV7jIsX2lc1jMqA6KOzoCoCqq/U3tp2atr25PYezeoQBrwQHOP+YncMjnigqqa5BGlyC7rh0nPE+ivuT7GHaAy6KtQ1lgpqYZ7/05h9jNDruiArcDyaTxXv0nrZ+Hb5+adu7SGg49gdhvyJo8teBamiMFpJzMdNcn0MxMTtCl2HI0h6Co4osa4mhFpBwf5Jd/g1VtSsx4ZmwNhPZ5LYS5xQgc3aa4nJNxSqiycSb5+nmFQUGrhRLcG5i0Rr/DCjuFEMByIjWGwl+Xety8q3TjZ2qIIok2FadSp2uHDGVrp4uLx77yrvucwZ9op15TqetktRfzPGDlzyOBQV2H0EtWN6xI36XHN23Sgmb9JtGOKOKKVdL2rIwas8oseLlK+9NRsq17CX8w316jmixbg1+eWAwqgy+uhm9PsUk5mCeqZzcwpN7sOJcsgD8dtmVjrWeMmoBxKkeJP9HPxWDU+PfwkGqXAbnB7Vl0ndDeYvkk/0jKYRryMUD7P0p1WPMnTuMmt6GQ4XIpW2a4TpEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZESzN1eEZZbThzZldMWEVKaGdBZGhsbkJTb2JEUTNyelEwMlRpMzlWNWxk?=
 =?utf-8?B?Z08rUkRlcVpaRjhScmh3dHIydzVMcVUwd3RReG9tSVVyZUF0cEFIU29oK3pS?=
 =?utf-8?B?UEFvNlQ0blNMYlBlcG5nazJ1OGxBL1gzZHBEVUxCREsyR0d0MjIzRStNOERs?=
 =?utf-8?B?SlpBWTViS0VlRmJGVTB1WHZFNmx1ZXZKUGRWU0NwampMdG4wQTdLRHF2TDFi?=
 =?utf-8?B?NyswZnpab1Q2RnFBRUFNUWpUNE8weEhCc2preFdvcFJ5K0YyY29OQXZHMlhK?=
 =?utf-8?B?dlZySTFiVDNGMTBSQ2pXb2pSK0FjU1hKcEpTNGNrd0ZjdE1DbkU1SFNGVm1T?=
 =?utf-8?B?ZWk1SkJsQXdpaUU0Sk53dEN0N21ocHVwclRCY2hsRll3WE1VODEyaDRxNVVj?=
 =?utf-8?B?NUFxR1JiNzEyaHR6SUUvVkNnQ0VXaCs5eDNybFBlK1hDdm5nemlVa2hQbkZy?=
 =?utf-8?B?VkIvQzVlUklJRWV3UmVFWjBZcG0yUFFIWWZ3TUwyR2pkdWM0QWpJeDNiUy9p?=
 =?utf-8?B?UHVFL0paMjFLZmoxN0Q1OFRwRlBicTFVZ0pTMWVGZVZ5ZUI1Z0FOVW1NMEs2?=
 =?utf-8?B?QWZERjhFRHQ3eTIyc3JkbmZqMHN1enREODZleEJRWERvdi80RWcxekEzV01F?=
 =?utf-8?B?VHBqWTRmbzRLcVhINmlvUzNLRDVva2dDNm41UjRFRWFiMmR1SHcwS2p6Sysy?=
 =?utf-8?B?dkg5YXRsWjZjSWtURWhxZlNFcDdGL3U5WFdnYXdKZUxHV2FFckYrVC91ak1R?=
 =?utf-8?B?a0N0Y0lBUHBLOGZXQmxrQ240SXNwdGcxcThwSlRobVhQa2p4TW5NcThCMTgy?=
 =?utf-8?B?aFlHY2FySi9EcWx6L0p2OUtqaUFOYTRCVS92eXpFbGJjRkE5bk0wNHVCekN1?=
 =?utf-8?B?NExvNzQ1bjZWTkV2N0twTVN3bFJ5dnBabkYzaU9tRzJQeGNKcFR1bVZucnJ5?=
 =?utf-8?B?eWdsN3RPbGdlRDNkeXhUNXVUa0JJek4vRnhjK2xhUFlrNUFIa1FBV2xlR29o?=
 =?utf-8?B?dnJiemw1WkI2M2dKMFVaTVpLS3hNQVJSRFdIOUlDZXNuUnM2RGRHQUFsRlpH?=
 =?utf-8?B?cm5OeFpaOVlEMzlXaUpsTlpKaTBXc1Ziek5xU0psVHo1MHZEdFhJZHcyaDQ3?=
 =?utf-8?B?Wkd6OEpoUUQwUThRZ3RmV0ZpOUsyVitoRjRVMFdWS1lVdDQvSStGMVB5ditJ?=
 =?utf-8?B?NVhxMzQ0UExiRGRIaC82Z25uMGFZSUpXS05mTUtHZGdicmVqZGREcGpKZGdC?=
 =?utf-8?B?aTUyU0kwVUMzb0lxbHJmSVhoT2s0WGsveW8xSWI5dVEyQWVZN2dlNkdYZnd1?=
 =?utf-8?B?aVJpU0g2NjF4K3QveXJqMXU5dFN1di92Z0lKVWRnZ2VxUEZ6TTVkNWdxZVBV?=
 =?utf-8?B?N2Z3UHV5aUlkL3N5alhWSXpOOVdwdWh5cEExZEdQS0lyVEdOTFNxQVRSNXI3?=
 =?utf-8?B?QWUzS0h2WUhXQTFiczIwbTQwNGZUV0FLMG5OM01xUlU2dVF4ZkxxQXU2dXZ5?=
 =?utf-8?B?ZU9KQ1cyamNrR2p1NVZqWXdFTG1UQVR3blU3QTFNUkJSSE9yUFNibG9HVUU3?=
 =?utf-8?B?c1NqT3hrc1FqbWYxM1ZBeWQrajdlb0xwYjVrWldCT1A3OEVzb051WHMzOXRa?=
 =?utf-8?B?dWs3SXRoT2psRGVyRVE2TmsvajNGL3BtWFFaZWJVanVMR0tZa0pEM0U3WlU4?=
 =?utf-8?B?bUhPWkdweVR3RzUydDZuSTBGS05zN3NVOW5oSVlnMDQyS0dDK1JpQ2RMdkxX?=
 =?utf-8?B?aW9KdTJqaUtGSFNsZ3o0SlA0Tkd2U1FhcEl5OUdRRis2WVA2NnM5dGM1L0dM?=
 =?utf-8?B?eGlUeTVBNEpIODd0cGNFQ0lQdjh2NW9CazBmZHhrYmx2TTBIL2xlclJCWTl5?=
 =?utf-8?B?bCtkRW0zUUYwMDNiM1BURC8rcWdYclkxc2FmcXNIVGJSUU5RZHRuLzkwcFd5?=
 =?utf-8?B?OTRGWEpjY2xWTHh3LzM2U2xxQldoTkdtbnhBUTJ5UkNoeDlKbTZOTU56YkN3?=
 =?utf-8?B?ZENDcU44S1dING9jSkJPMXcrOGhucFNYRVhITVVGNjVmSUpRYkhxNDIvU3Br?=
 =?utf-8?B?UVo5UFJlVXlzQmpEZlMyeTJGYjB2NDRHTEpsaVJBWHRKS1ZMclNVTTRpcWgy?=
 =?utf-8?B?SnN6NFFOTWpCNWZlMkVDWEhvNWp3NFZwQmdBL1hVK08xSy91RnF6ME9YNnJT?=
 =?utf-8?B?VXhjSTF0THYzeGo3S1JSMktYVjlka01mLy9CdWk4OE5IN25BV1ZENUhqeHFR?=
 =?utf-8?B?TWVUdWt3bDJMUWw4cGVLREpLRVplbDhxWExZdTRzODVQcG1BY2hEa2FFaU1R?=
 =?utf-8?B?Z2NZdGtORm9DNDdmZXNyT2UrQlZYYWt6eHN3WmRFb2ZSYWlqeUN5V2VFbEFl?=
 =?utf-8?Q?KpGCraeTyj0+4FWo=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693dc191-7ea7-4c94-2162-08df448da871
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:32:11.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRvoKPQtTBn/a7M1WBoh+LaW7KQF5Bdz7xSqI3WAiR3bq3CTw1V57CfD2L1D4Uyq/mrti832egqq6WvLUP/kKVzZDf8q1zmNLGQ4EYMRae4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB9821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013215_044197_6EE3CDA8 
X-CRM114-Status: UNSURE (   5.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 2026/11/17 17:05, Markus Elfring wrote:
>> Add a Device Tree binding for the I2C controller found on the
>          device tree?
> 
Will do s/Device Tree/device tree.
> 
>> Amlogic A9 SoC.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
