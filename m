Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3AE73140
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Feb 2026 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjiA210CTGii+5sXwGtbEL3QHsLxnnrhchlJemOcmMo=; b=t48EdDX6zjyck+XMmUIFjk1YDX
	8fNVm5G74a7zAsF5/7rzZGdpEuz5CZObSB6gnlCNlPbQ1Vg9b33ZD96HeDHZaMfZjkv37kWJssWdi
	WOdIei0T3QrPfvHHQjgUMSGcDOfDMerE33VuDFqnsAM9EAaFmykY+ZoVywm8ZgHP3IHn0vJUWMimF
	LfSPQbmXOhrJBIQpsol+/9IImqGnWDJcaTbYPqnS8jNc72b+tjTpskPxKhkaxxN4PLrwpZiFYg/ns
	yizT5taie6zqWDCfMHBnrPhO4DkqNOS3Eatn80wEQjx2fQ2KUyXEiohZkkS0gc/QpuT84kcwJH9mg
	9r5C/91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpBv-00000004dpf-1U4M;
	Mon, 02 Feb 2026 08:21:51 +0000
Received: from mail-japaneastazon11022101.outbound.protection.outlook.com ([52.101.126.101] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpBs-00000004dpE-1t5B
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Feb 2026 08:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/YRJV3LhK1HProKj6MRQByrkCawjVHGpU2cMeZttw5xXGy5k3fQeuCDSifhv6J0KEMMO+G9WnwSVUliOYcp+N85QRIx9Xblwi4kmnvcQm2iCNnqlayBzjFRx7k+jUpPp9TTjTZwVpR3ZyA/hrVR2mJBf0vaBmN4Ie4FC05t9kBH8403ve0NyMqBpIMBl5WloTpTeIeq/WSSq4bu39Yr46xnnWhIjMyskdV5nHRROxMDBnnP8qZ0KCXf2/wvwVXYBdGI30dealZOGDQ/nywMXnX04XFnrNlO6QZ1A40daBt+Pcu9iV4IWFJlXW3iOx2NvmdFpeTk1SlQkj6GCsOtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDjqwS3OiwgfrdKM7uUMK33t5x0fiKeHz7beFcyE1Zs=;
 b=R3fwraogeZSy6cfttXmTbEMpxuLqV9jVkMiuQyvA2tNpk+o1wBn3jA8Z5QTT4gzHIopfbWrF31ub5TKNh5wkQAXk6A8PBmPcpyfnhwBh4h+5IUVs5L7QEyVHch4pktOUY1pmjddZGSiJ9up8uL8yIXca9Z/SbOupLN0bIMomAW0Ro36klFmnR6bACG5Fz0ZHZ6GGQoQPxcXQYGAISu8YKw0TVqvzqCZLwRhT53lG89VnwfoGyrbAeRSsGgNZjj3toWWMPl7h/+pC14fv+kXbMYVHUIMcv0DlPs9dxxis5CkpjH0bKJut/nxNm7PMp+o/ColRzCF3XVkKI1Bob3R2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDjqwS3OiwgfrdKM7uUMK33t5x0fiKeHz7beFcyE1Zs=;
 b=PypnIXHjdKkwf1PkpGnkwv8891rFu4xWCpcoGpAedFaEe0b2tGluOVXLFwzLiL16hvfCCYTsl2M/QeOIzdYW8lgGra2RiVH/DuzMseST4qZrP119ohQ6oGcnRKThL109e18hJCFWtJJEES+sW9vcz2OZHSNG0sGMPMp8DW267WeUc0GHYpLP2lIi+1C/VmFalD01JuDb5p4CBP4kVq2kupMqpTQ2vac77Ng0PFnIPy4GNWqNbpBWIY6jBTUVWvoK6aijFk9YsKE5b2+lgQj4E2O4NG2EzkoqSMLztj3YgqPCvqz8fbCBCxZNieW307TKgeUKU8Eg2cMNt/oeaV592A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB7912.apcprd03.prod.outlook.com (2603:1096:400:477::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 08:21:29 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:21:28 +0000
Message-ID: <734dfc87-e3b6-4e54-a2c8-f6c01c81c2d4@amlogic.com>
Date: Mon, 2 Feb 2026 16:21:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
 <20260127-amlogic-dma-v2-1-4525d327d74d@amlogic.com>
 <aXue7DTy7mgwxeks@lizhi-Precision-Tower-5810>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <aXue7DTy7mgwxeks@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 741663df-893a-4132-51e2-08de62340fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3ExT2VrdW8zNWhzeGdtWUdxYUlDYzVDK21oUUt5OTJUN01RRGp0c25VYlMv?=
 =?utf-8?B?a1I3cFVDblgra1oySnczTVBLaWZjVjkxOHhGeDZqeGRBNTRTWnNPd1NTb0h6?=
 =?utf-8?B?WVluWFk5c3U2UnVqUkw1eW5PL0hSNzFTcEE0RWtLM0dwRkdWSkZ4L2F0bVda?=
 =?utf-8?B?bWxWbzFBRWxuWXBoK09hQy9DOGhab1ltaGo1ZllERUk5aUNzZ0dxNm5SVUIw?=
 =?utf-8?B?QXE4Wk1uV2tSZzR6TFdqTlBncVB1Uzg2a1Y0cUFsMWlIVkd1WVI1cFVHQ1dk?=
 =?utf-8?B?eDF4WWtmdlNGY3dBcmt1MHNPZUFYcGtVbTQvdGl6RlBoNmlVcmdmSGRnME04?=
 =?utf-8?B?NnBoa0s5bnpxMkIvd3ZQOVdSZXNxdUdsaWlsQ1h0OHp4dVM1OUZWbmo5cnk0?=
 =?utf-8?B?R0tjTmtJaTIzRUVvSnFtUStDKzFxbHl1S3VtQzhWYlVKZklVaTB2Q3lTdmZO?=
 =?utf-8?B?TUVwbjFiMDl6dS9xT1ppSHlCT29iN0tpeVJOaENGTDR1eGNoMmZ0UGp3QW96?=
 =?utf-8?B?U1ZkQkJQRGU0QTVhWDlBNjhJWWYrSDNXb3dBMEhRRTFHVnVzR2VuQmtIWDRj?=
 =?utf-8?B?TkpMUC9jbk5Jd0NhUlV0b1l3Nks2SVZtV2Nvc3pzWE9paGwwM2RyTmdUekZP?=
 =?utf-8?B?UkVxemQ5QVVoZGVMT2xqaVd4MDJDaWdjZEVZQXIvK3Z1QkxHTEt1RkVYOG50?=
 =?utf-8?B?eHNyUGt4MThtbDluVVdNTE92bm9TRzZISGp1Mk1nck9TSzhBTXNNR1BOQ3c4?=
 =?utf-8?B?eHc0RGlKQmN5bjRkUXVTQnAxTjhPb0FZNFA3OUhVYklhaC9FR0I4bWZ2TGl2?=
 =?utf-8?B?cWFDbnBZM3RpcEVGS2t5bzNaanVCcUVTWG81bWRpaHU4cWx0cUJLVFBBVGVX?=
 =?utf-8?B?clluT2hLeGsvUnBkT1ZaQ0RWSkwwazc5RnlJbC9sWjZSQnBOSVlZN0lTdVRq?=
 =?utf-8?B?d0g3bStKYjBDMjJtanBlZ2oxK285WjdFMVdzY3h0ZElYVFFTR0FUVmpLeCs3?=
 =?utf-8?B?RHJ2bWtXeEE0eTNReXMzdjNLYkc1VkRqeFZ5aVRlNWlrc1JacENTTjNVZkN3?=
 =?utf-8?B?c0M5a3U0aWRwRGVBVHR3bEhsaDB4NEhhTDhTU1ZZbGdJUlRhamtzc1dYT2Fy?=
 =?utf-8?B?OXVuT3lKYXMxVDR0WEwwWGcwOU41Z2o0SGxDaE5FaUtzaXlocGtRY2gxYXYy?=
 =?utf-8?B?RmVWRlA1UmJVYmhJeU9qNnlWcG50c3lQdUkydWxVcWhoQXdNMWNQN1FtL1VZ?=
 =?utf-8?B?RE9rcHU5VXVaakdIbHkvMERMbFhXOHBZYXhpc0NRbnJnUjB6WTdPOTNNNW9v?=
 =?utf-8?B?MURQQVZuMHRhdWxkYWRKYTdyNW9NQjJMMTFzMzhvMVlDSzJPVmRKQ25YcHlp?=
 =?utf-8?B?cmUvR1RFR1A3RlY5eUN6aXFjaDJTdlBjM3VJcUZ3UjN3RUdLT3RWd3N2Y1hP?=
 =?utf-8?B?REtmVUJyTjMwdnZFa1oxNzVtQWJ3VkJRbWd4SzA0bUhuTXgyek1jNi83cjRp?=
 =?utf-8?B?UURCbDlESCtodkNteHNHWXM3UmRWYlliK0l2L2RqZU5CcVh5UURocy96cDIw?=
 =?utf-8?B?NkErbStsb2hmaUZXZk12SFlDYWF3ZzlrcGZYUDZVVDJsTFlVN2tMMmlsOWhs?=
 =?utf-8?B?djVCbG15V0ZQb1ZocGtjTWVIam9CcXpjeXlBWDY3QkNLaU5zcmJUaXBvYXFz?=
 =?utf-8?B?akRKRkQ5eHV4VjZNYXcrazdMUkZPbVRaZnY3dFA1bkJMR2RYN2NmK1h5dlZX?=
 =?utf-8?B?M0hwSUZxb1MyM0tEQ3cyekE1cFhKWXc4b2ovS0U1NFdiU2lLdjU2empUcWdl?=
 =?utf-8?B?N2pVSWFVRHhUMUNxZkJPOVYyaE9DRGxERi95cjRNdzFQM1V0c1luUVRyUG1w?=
 =?utf-8?B?R0lNeERtQnJDcEtZZFZyaE5XcTVraWhibEV4L1FLUi9hek5XQ1ZyR1dNQXBy?=
 =?utf-8?B?M1FsNHh6TERaTjl2em00UFY5ME9yL2hJWmhwQVlGNTI4Uks2RFNNYWlSYVJY?=
 =?utf-8?B?czljSzNYK2ZDY09BNzJsb0RRWHNZeFFkVnVpRW5EcEJYWjNmVnZPMUkvZVlv?=
 =?utf-8?Q?dHr7Q3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG9yNHl1QTBTYktxY0hSQ253U0RnVksyTWx1NDc0NlJVVmNRR05ncnpvQWtZ?=
 =?utf-8?B?YVFMR0htUEVMdVpySTBJNzR1TkpTNHhwcDVTNXhPcWJIUTRmOHhEUTNyR0RB?=
 =?utf-8?B?OG42ZzcwOGVVWEFEWEs2NExnSWttdU04a3BOSGg4MFpZeWc0SlgyVHNoazNw?=
 =?utf-8?B?eDNYNmYrNDlwTHJDSGE4UHNSSHVhSWIwb29GQVBKRXBmUStIZkRzUTlFTDR6?=
 =?utf-8?B?Qkh4RDJTM21uUDBHRDhkOGJOell0OXFpUGx3bkRDUWpybXVlZi9sVmpmN1Np?=
 =?utf-8?B?YU1xMGJDNndLb2QyK3RMM3NONDIveEdNZTZUSFBPU3dQTGdXTE1FQ0FjQlpj?=
 =?utf-8?B?SmxnSjM4OFN6NGJtbEZvUUJ6OFNpYkI2c1cvbm1UK3lTazZsKzJhVS9qV0VI?=
 =?utf-8?B?cTVkdWJqaUZWQ1JnOWlPc0Z0SW4rK20zc21aS0Qydktpaml1c3U4MjMyZXJG?=
 =?utf-8?B?TnVSMnoyM040N1J3bGVaZm83aTJUQTNwbVBPKzhNcS8ybmFJUjRUQm80RFFp?=
 =?utf-8?B?c1dmdlUwVTJRNnFUQVh5aWpyM3piSVMwYXNlOURpRWdWZFBTQUJIeE1Ham1y?=
 =?utf-8?B?NUIxdVlYb0Jlc0huSFlheVZMZUxlSmhjVWFEVVA1bG9EWUV5bjhmdm55T01F?=
 =?utf-8?B?VGkza083eld0dW9rSS9oL05ZK0VYQkhwdnVrOU40STdjNW1qb1pWcGwxTkw5?=
 =?utf-8?B?bjRtU2l3bnZKTCtrVm9XeldHUWRBVTBTMjJYOEFuYmxzemI2eFdKU3ZSdXF3?=
 =?utf-8?B?NzFWTndtOFlhOGx4NGZRdy9oSTFEcTZDZy9KaUZzMnFsRWhuWVhKWmN6b0Vz?=
 =?utf-8?B?cmJRVzlnNlhlTW10ZGtJeE9VOEI5ZHNydGZIc3ZFNVRaUmdaR3hlVXFiUVZX?=
 =?utf-8?B?N0c2T2lDblRpbUMycE9EcXhLOHMwOVhLMW5OaEZNd2UvZVBZTlFpcTJIQ3Bm?=
 =?utf-8?B?eEJON2UzRHJqTGdnUkVsRndVaGpQQ1V6bzFES1BYVUxoRTFOUHZ1VmNjMTVj?=
 =?utf-8?B?OVI1d0ZwV1pQTU5uZTk2Tld4MVh1aUF2L1FYVzh1MWNueDFvKzBkZXMzRXhk?=
 =?utf-8?B?eGxUVHFBMjRuejVMQVBoMWs1ejhkb2tZSzFRSXByQVBkRWFOelZKUTd2VFRy?=
 =?utf-8?B?RC9rNDZRT2YvNTM1aVN2Y1ZQZHRqaEJ5UEMrWWpIaXNsNGZqdVlNbXNyajhD?=
 =?utf-8?B?WXR6UXN4ZWNzcFJiWkUvN2pHMG9iVlRqR0syUC9tV05rTHRrS25iRHVFTWhP?=
 =?utf-8?B?VTBLWjgrWVF2TFpZRmxBc3VQaDNqNjU5bWtWMktOY0MxNXE5aTQ3RTBZRE1j?=
 =?utf-8?B?YmE5OE4rZlBaMGFGdkY4ZDFzOUR3VUpIQ05CRXZTaE4yak5NQnJCeERKUnB3?=
 =?utf-8?B?MGRuZ2ZvVjNtLzREWmthRFRNVFFXYW5CNW82bXk2clZOUzZXY3BCV3FJa1RH?=
 =?utf-8?B?VFZrZkNUb05OUWU5Z1NtVU1KMUxEVmhoaStRQkNjeVZqdjRRSWFzejlRSllC?=
 =?utf-8?B?NHkrZEpEUGhsQzRBa3Q2dytva3p4cjlLQjJzWGtRWVg5cldQUUFJMjNJV2Jt?=
 =?utf-8?B?ajM0NzhFSGFPYXl0emFzVFc4SFYrQ0Z6WE9QMTZpdWU1Yk84VGR2NUlQTDZU?=
 =?utf-8?B?Z0Z4d0xJRW9wTWVYVXN4THFWZmxwbjJJN3UvNTQ2cVpiZWVpcWhsajlDb0g1?=
 =?utf-8?B?N2YzMC8ydkxVeXF4WkhFZVIzZThIMHZ3VHR2MjZXTHp1aUtaeXB5NytjSVd2?=
 =?utf-8?B?VG1TTWZTVzZHeGpydFhWVkw2WFgrWHB6SFJNMSt5R08wMDN6M0txclJ0T2ZX?=
 =?utf-8?B?OENBdllqeTZERVpqTjJ2U2tHa3ZkUysySHdLS1YrTDVaTHdsR0tqUlM5TFJ0?=
 =?utf-8?B?ajNodW95ZWFYUnBTdTFldEFEdjAvMkZuWGluRjJnT3FLNHhZT08rSVNMeis2?=
 =?utf-8?B?V0UreUVRQmlxRi92enRqR1JDeDIxN0h6S0FlVDlpVm1SR2JIMU1JWFRGbCtW?=
 =?utf-8?B?OHNZaytYMVN1YmxKQ0pMVzRkNW9DaXA4ZEF5STZNeGxUY0lOZ1h2Z0I2Sk5O?=
 =?utf-8?B?N1RQV1piK0d0RzRVQWQralZIVVJKUVFKcjZ4KytmSFJzUEVSV2pUSjJjRVdh?=
 =?utf-8?B?OVlnRkd5TUFkZkJKd29UNG1OVzUzR0IxamN4L2xHQ3lHSk53eDZwYjFrbkg0?=
 =?utf-8?B?UmttbVZOYzNEYWxXdVNTdjYxRjlTNmdIRGxsbjdaUkNGOXc0OHVIZ2ZOR0R5?=
 =?utf-8?B?U0tSOVBCUGl4S1lXblN6bUs3d0VyMkpDY1NDYSsxbXNuZCtUZFhSemk1UllK?=
 =?utf-8?B?M3IvSUhCd1lQQXllMjJ0dDBRMGIySE5tazJzQUhIQzVDSFZMWDRxZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741663df-893a-4132-51e2-08de62340fd6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:21:27.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lS1vDCqlpr6QVWHQZItmkdZUUqmYS1K1J2BRYn7crdcXTQV31NV6Y+bvdX7uOdEpJJy5QpMMFASQZZDOjuTQfyxuyj6AXX5DiTwRmQzJ6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_002148_503850_87F8B001 
X-CRM114-Status: GOOD (  15.29  )
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

SGkgRnJhbmssCiAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDI2LzEvMzAgMDE6NTQs
IEZyYW5rIExpIHdyb3RlOgo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gZnJhbmsu
bGlAbnhwLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4gCj4gWyBFWFRFUk5BTCBFTUFJTCBd
Cj4gCj4gT24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDM6Mjc6NTJBTSArMDAwMCwgWGlhbndlaSBa
aGFvIHdyb3RlOgo+PiBBZGQgZG9jdW1lbnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIEE5
IFNvQyBETUEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFv
QGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1s
b2dpYyxhOS1kbWEueWFtbCAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZp
bGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2QwNDQxNTJmZDc2Cj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4+IEBAIC0wLDAgKzEsNzAgQEAKPj4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPj4gKyVZQU1M
IDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9h
bWxvZ2ljLGE5LWRtYS55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBBbWxvZ2ljIGdlbmVyYWwgRE1B
IGNvbnRyb2xsZXIKPj4gKwo+PiArZGVzY3JpcHRpb246IHwKPiAKPiBOZWVkbid0ICB8Cj4gCgpX
aWxsIGRyb3AgJ3wnCgo+PiArICBUaGlzIGlzIGEgZ2VuZXJhbC1wdXJwb3NlIHBlcmlwaGVyYWwg
RE1BIGNvbnRyb2xsZXIuIEl0IGN1cnJlbnRseSBzdXBwb3J0cwo+PiArICBtYWpvciBwZXJpcGhl
cmFscyBpbmNsdWRpbmcgSTJDLCBJM0MsIFBJTywgYW5kIENBTi1CVVMuIFRyYW5zbWl0IGFuZCBy
ZWNlaXZlCj4+ICsgIGZvciB0aGUgc2FtZSBwZXJpcGhlcmFsIHVzZSB0d28gc2VwYXJhdGUgY2hh
bm5lbHMsIGNvbnRyb2xsZWQgYnkgZGlmZmVyZW50Cj4+ICsgIHJlZ2lzdGVyIHNldHMuIEkyQyBh
bmQgSTNDIHRyYW5zZmVyIGRhdGEgaW4gMS1ieXRlIHVuaXRzLCB3aGlsZSBQSU8gYW5kCj4+ICsg
IENBTi1CVVMgdHJhbnNmZXIgZGF0YSBpbiA0LWJ5dGUgdW5pdHMuIEZyb20gdGhlIGNvbnRyb2xs
ZXLigJlzIHBlcnNwZWN0aXZlLAo+PiArICB0aGVyZSBpcyBubyBzaWduaWZpY2FudCBkaWZmZXJl
bmNlLgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBYaWFud2VpIFpoYW8gPHhpYW53ZWku
emhhb0BhbWxvZ2ljLmNvbT4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToK
Pj4gKyAgICBjb25zdDogYW1sb2dpYyxhOS1kbWEKPj4gKwo+PiArICByZWc6Cj4+ICsgICAgbWF4
SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsK
Pj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2stbmFtZXM6
Cj4+ICsgICAgY29uc3Q6IHN5cwo+PiArCj4+ICsgICcjZG1hLWNlbGxzJzoKPj4gKyAgICBjb25z
dDogMgo+PiArCj4+ICsgIGRtYS1jaGFubmVsczoKPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4gKyAgICBtYXhpbXVtOiA2NAo+PiArCj4+ICty
ZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gaW50ZXJydXB0
cwo+PiArICAtIGNsb2Nrcwo+PiArICAtICcjZG1hLWNlbGxzJwo+PiArICAtIGRtYS1jaGFubmVs
cwo+PiArCj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiBkbWEtY29udHJvbGxlci55YW1sIwo+PiAr
Cj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiAr
ICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YXJtLWdpYy5oPgo+PiArICAgIGFwYiB7Cj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+
Owo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiAKPiBJZiB1c2UgMzIgYWRkcmVzcyBz
cGFjZSwgbmVlZG4ndCBhcGIgbm9kZQo+IAoKV2lsbCBkby4KCj4gRnJhbmsKPj4gKyAgICAgICAg
ZG1hLWNvbnRyb2xsZXJAZmU0MDAwMDB7Cj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImFt
bG9naWMsYTktZG1hIjsKPj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAgMHhmZTQwMDAwMCAweDAg
MHg0MDAwPjsKPj4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFfVFlQ
RV9FREdFX1JJU0lORz47Cj4+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2MgNDU+Owo+PiAr
ICAgICAgICAgICAgI2RtYS1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgICAgIGRtYS1jaGFubmVs
cyA9IDwyOD47Cj4+ICsgICAgICAgIH07Cj4+ICsgICAgfTsKPj4KPj4gLS0KPj4gMi41Mi4wCj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
