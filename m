Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B525AC369A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 06:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxUfypvHtACBNUHrk5RZ4/Cpvp55D+RWACTHugd8hdQ=; b=U4NEHamT/GCx7lfMMkJ6AuYGAl
	00pxsB7WCMg+XqLm4pJJhLE6AZt+tdUFyNYAxzt4imAtG43BZupbPbF5AFFAgdp+JQrfYphy2L+ix
	wCIEXwlDSIsfRwaom9+TeEu5+hzHLb9O2EMAG5zt9tIR3w46FOdm414Z10W4A36UxU7Za+Q7liVrF
	VX4mtos1binl7MiaQEni3s5sgjRpOdmL4eTCpoijEcXZMINZSau4XJsdyYtRiYSY1XtrVGI4CNTNO
	y7kq6d94w+uL/TS04sG4OlyceecOWDjQTbnr6/6+fQErBR6XML6mAKZV9/0eyG3cGcX5Ot8eh1w3I
	Bqfk9yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stM07-00000004FIo-0lPN;
	Wed, 25 Sep 2024 06:59:51 +0000
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stLsu-00000004Duu-1BOG;
	Wed, 25 Sep 2024 06:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhqcuamGLc+PEX2Tqo4QmLtAaQqhyYM3OpTSGLmPoF2laHcIDpEGiucbGQtyYxzYjwme2XnGm+byWUVY5bjuUzTRZ+x+iJ+jg1cs3ysBBIpyXbjn7Dxylb3u2FsMHJMfPuoDTmZ1mbjOYf2SjycHlEj3w7mc9mYIXyUnLJAuHThk771uV5Yqjpp9s4K5F09PGGXNo3fq6dte+hfDQVCcwrjWl9zaNbVibGkHK3BqotIEZXFzmVpQjETUfi4/5kUOEfUnx2P3hoVdI+19pHW8IuLsqTzRbXGb57Ux/+a23bsE05U0qu8aSAxyaZluimM5Rn9jjIGV1wJr6wzphiGibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmW4UyX5wsDlY3/GHW7+2NnM3BoCreszHCm6zWxE6/A=;
 b=gCt8Vdl2YGDLdtynXopvhETmdDbTVP6h0qZyhis4859ONoW0+K8nCjsOi3KNiLsCFcvNXHrLbld/NwMAJik3IxQT0gE4VGWPOrkk9axrZNEBRBqROzyCnOqofs0hXU4ft6QmkWxw5beWHU9PhztB4uc7bDFR7Cx1k7fwDbZhnULhMbc9OsrcCttLqR1vzwW8XOL9WlU4hRY8q+T5LPkZepoDPHogBD4GYzDDEBSXlSaX9ETBRhP/PAknii9WWoAaBcPEZdju76Kwi7h/RRhaXnV+0uEShGozR1qNNFa89xosB0b2sLzl+neDk3QTBSJCyyeyHtSzkq+ZjhZm5jyIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmW4UyX5wsDlY3/GHW7+2NnM3BoCreszHCm6zWxE6/A=;
 b=X9ZwEjcHvfqqpx3B/Z6/juv38HAewBTbCPz4pxn18d7bLJfIlsdCiPsdlUmPsNmeqUTcig6Eg6Oqx2+eTvxoVFOeloEJNb+a7y8GcrIqGSOjTcpSRzxQ6vlxUeozRt2+SdlJ7hzLlSpW01nTzWe2n8EY4JqqS33IQ0G8eumaZe1yBBNxvlPxfNQ0bqTBRJg6syFau1HZ5hHSxBz+wiMu/2WnhjMM2ewD558vKolJfQFQNOp+KMqpCFDzUHkTmJO7Qfoyf2zNsJEdmEoqaGllAL5pPgk7KROxiM4v3UWDiDrLYfeGOnbX9mtYV7heCU8Ud39EmIRx2IIrqBZDNDk0lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7412.apcprd03.prod.outlook.com (2603:1096:400:41b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 06:52:07 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:52:05 +0000
Message-ID: <8a673e43-4257-4a0c-a70c-f6ac80aa9fae@amlogic.com>
Date: Wed, 25 Sep 2024 14:51:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: meson: pll: Update the meson_clk_pll_init execution
 judgment logic
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
 <1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
 <e458a1c6-5e85-4ecd-a21a-3407a6dd832b@amlogic.com>
 <1jtte5xjgk.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jtte5xjgk.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c2f8da-aec4-43df-0e6e-08dcdd2e915c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M244amhIWWJ3a2prWU1IbTdZclczOUpza1dwVnZQZzBhNFoxTW9TMlhqT3NV?=
 =?utf-8?B?RGp2YVdOSy8wTkQ4bEhqQnE2S3NMaHJOM016S25pNzNPWnUzMWNMQ0V3cUZx?=
 =?utf-8?B?YTJGZitjeUJDKzIxTldNNEpRQkozV08rOFpxQ1QvbkJGM2VUVEZmUWpWZ1Vt?=
 =?utf-8?B?ZEJHdC9RenFaRUlseTZ5b1Y0a0FmZ20rRzJ0dkRQUWN1SWcxa1ZLRlFtRytn?=
 =?utf-8?B?V3pOVnhabVJLbE44WGpodDZuTGovSHk2U1hOREY3VkdmaGxHOVhwWURsWVJL?=
 =?utf-8?B?ZzR3cUp1MnBVSEM0ckxnS3dxZHRJU24yQVpIa243R1RPNUpSK3B2THA3dzNy?=
 =?utf-8?B?QmIvZmx4bjBlOG13K3FwSjIvSENGT01UUTFJRGFzclZTZUR4N01uR2M3WWNM?=
 =?utf-8?B?QVRoTWxnMHVtcDZJTExpayt2UHB0VlNmQ0N4eXdWOUJMNGNMMzVFODROcXBr?=
 =?utf-8?B?NFVuU3IwaHcreVZ1UlRUdG5HL29HL1NVa3NOcXlKWDM3M1FCM21MVE1TaUMy?=
 =?utf-8?B?Z2tkRS9NQmFEdUgxNkw2aWZhSzlSNGszWG04Y3Y3M1hEUk1henBRNVZlZkQv?=
 =?utf-8?B?K2hCbklMSndCd3JmQmZ2Mi92YWdPYTFmVWxiYUJhU0FwSFErUlI1L0hxUGtY?=
 =?utf-8?B?d0xKSUF4RFVpN2tpK0NYeE9NYWk5Lzg1cmcvYjN3czVDRVhRS0lGdktONE5i?=
 =?utf-8?B?NE1JNGhwUGwvSEppL0M5UGxDczRkRDJZbS9UWFZkbDRFdVp5SDJvbVpESEVU?=
 =?utf-8?B?cHJUbE5DQTR2amxBL1cxQUR2Y0dnK2UzU0d5TlQyVjJHems2eGkvcFovWVdS?=
 =?utf-8?B?MEc5S1Ewa3djWkZ4QzFKYnBmY3lzNnJoMDdGY0o4RGxrSFBja3VkNGxBNG9a?=
 =?utf-8?B?b3Z2SWF2MnNYNThZWFlpYmpYQ05POFE0R0tQT2FYR1J3eGs0Uk0rU0dqV0NS?=
 =?utf-8?B?VWNSS2tnS2duUkdySnRQTlV3MXBLNzhqOUhZaXRDNzljVUhsZUtYNEh2WUcw?=
 =?utf-8?B?STRZRDdCajE5bEZFRm5rcXNjSkhIS3JKZDlOdnhJdStxM0xrcUpCVUNaNm5j?=
 =?utf-8?B?dmtTb2lTTWx4UWs0bzBGWjB3SFYveWEyWXl1dmJKbHY0c2laQWJnS281OC9W?=
 =?utf-8?B?bGI3clhSMXJwOVUxN3V5VmU5KzBHMDVSQS9yeVoxSk9FYVhBa0JiN2lnSW45?=
 =?utf-8?B?bnlqelowNWdDZ1NmQ1hyWmhIL3Z0QTQ5MVdoeXVtRWk2R2VLdHBIbklIQVhR?=
 =?utf-8?B?RUVoOTFQNk91QjlIUlBLYUlxNUhkWVhzNWxjQ3draGNYMVBNeFhlZWRBWHIv?=
 =?utf-8?B?eGJvSFhKZFk5UEZQR2xLQ0V3Ym9scG5iaGRsRnVxcW1YMXdaZHJZcVFNWkZY?=
 =?utf-8?B?cUxwaThYa3FKbDFac2V2WGI3SWRJdHJzSUdRallicVY2RU1Yck1NcnhCN3FQ?=
 =?utf-8?B?Z1pxYStLSWFOdExQdWZ3NDFjOXJKVzJncGZMUWw1Nk1yNDEvajBTbXhtWVc2?=
 =?utf-8?B?V25WaVBOTVRJR0tSbDNPb1pKREdoeWNpQjcyUitTQW9pdjBVZnhSRXJLNmJI?=
 =?utf-8?B?Qm8vc3NXSGdYcmlqY01NYkZGT2N5SU5BemNtMHI4NHljN3dBM3gyZzBteGpR?=
 =?utf-8?B?V0thcnh5REl6OFg5SUx5eWxKSCtuVHl3QnhxYWdjSXJUbTNQMlU4c2ZMZXdJ?=
 =?utf-8?B?cDIwZS9MRjNUOXp4NkxUUTlpZFA5M1RPaUIyZVZ0NVBBc0NsVEE2ZG9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3k4ZzhyTlQzQ0IxZ1hXWFVSNVdEMzV0VEdLd2szZjNuYUFpTVdWZzF4Z2JL?=
 =?utf-8?B?QnZDRDBKUm9RanhFK296OWdwdWFrZkVHMHdJcTk0eGp3TkVBWlJkRk9vbTQr?=
 =?utf-8?B?OFExZ1h0dlhJRXJ5aHhHUnVFMStBeXFmd25lazhIZnhncXQ0K3k4UythS3J2?=
 =?utf-8?B?UnhDYk8yZThWallQMnlmRi93QUFCVTVpNmh2QVB6d1VJTjlQLzRYYm1qa3ZR?=
 =?utf-8?B?SCsySFpDL2JBRlR4REc3YklTMG1LanY5eGFmOW4rTFlKSjFINlp6N21XV3hP?=
 =?utf-8?B?MkZXWDdXVXUzaU1KajJWY3I5Y3dIQkVlYlkzZjg4dGdSOHBlNklUL2R0RnZr?=
 =?utf-8?B?Mk52MEpJMStvZC9YQUtONVdiQmNJT2ZlUXc3ZXN2eCsyM21WZGVMS1RqcnlE?=
 =?utf-8?B?VmUrQUg3OG1BamZoSUorbDJTTHV5RWp2V3hQR0U4TWpreE5QZjJDZlk1blpJ?=
 =?utf-8?B?QUliQ2ZMdHNkdkpscnFsZWZ2aDVObUlPNk5BcnhBYUd2MEhzR3lNK3EvWSs5?=
 =?utf-8?B?dHB0RWhVUml5SHd6STJnNHEyNTMydmg3c09BZThNMkUxMnp0Tm5DRERsQlpN?=
 =?utf-8?B?QUI0c1ZaTlhROFM3QjdqVyt5eHNjRmlBNGpGcUtzQWNtQkVXU1NEeXdyVzNp?=
 =?utf-8?B?dVpWcW9zQWNqNm0xMDNLYW1ETExzMDR5Mkx0S1RWQURuMHJEODlML2czbVhn?=
 =?utf-8?B?K0hDSFlha3VsWFJ2ZVF0U3ZDWHZSdTdsMWk1eDZ5anhrdWhWODkzUlJYSnBh?=
 =?utf-8?B?NVBpYjdIRElwaUg4SWsrOVk3TkJjS3cvd2EvamJkdmxVMWZsVExPK3UrTURT?=
 =?utf-8?B?bWhySE9GYlJUQ091YWhRNElya3Q4eUZqZzhHZ0lDa2Z3ME40QUxxQVVCc24y?=
 =?utf-8?B?ZnVFejNPejFNTERUSXpuWTRVVTRFZEc1VGVTdVJ2aHZPSDRJU1RsbkZPcVp6?=
 =?utf-8?B?eGdSeFpjUUEwbFRWSTY0UWNYWDBVZ0RBaHhoS3piNTRMTUtLaFdYdFlUOXRn?=
 =?utf-8?B?Z1dnNXdzY0FBOVRqYWdjbEpaamI1Tjh4WS9MOE56M1Z3ajBKM0FvMFFUdkFW?=
 =?utf-8?B?NERUdVF6MjFMckdJZjZkL2NaMjB3WXlyR3Z3akpVYkM5OUFtdUhwd2JsN1BD?=
 =?utf-8?B?bzJocEhXOFpUQWRnMTdzU0lvYTdUQ0NLOGc1b2s5bmIxODVYS2tlaUxjVFE3?=
 =?utf-8?B?bDFJejJRMTVIaVVyYU1jdXZFeUVOTStaeFNyUmFDQm1IQTg1YXBtQkdLL0pT?=
 =?utf-8?B?QXBqNW1wa3EzL2tPZ0wwSm05dmk1NENhS2FzdTBkSHJDQXJpYVo3Tk0xRDNs?=
 =?utf-8?B?WXFHOWZGMW4rbDJQbXlzNWFzbHhGTVpCSll3QTlKcEthTEdRUkZ6dGpnVXZZ?=
 =?utf-8?B?OHZ1dmxRa1lEQWNqcXQ0ODhqMTNRU1FFVEpQYzk2eFRPR2poV0E0WDNvR0Zq?=
 =?utf-8?B?dkdMT1I1cmQ0QXZXTStSS0FFMmpOV1Q3Q1FjSGUwNElVSXFIaFJ1dy84b29H?=
 =?utf-8?B?VDRqWnN3WEc4VGp3R2d0ZVo0UTN3bmtIb0wrNW9QN0dKbndFaTBiMzE2THZ2?=
 =?utf-8?B?YndxR0lCTWhxTHZ5TmFFdXdVUzRvZXZhYUE1QUd6UHgwWEdhU2cwTHQrZjNQ?=
 =?utf-8?B?SzhYSVNZWUZYcXVoZXR2MUxHU3dRb21mbkxCK0dMMit4NjVMSFArV0I3RzJV?=
 =?utf-8?B?NnRkYitmcGlZQTY5d1FnQzRJa3U5alJJcDFnQVZWSTBscndlalFkSHlid0pa?=
 =?utf-8?B?Tzl4U09iay9TUDIzVFhxQlVYcDd4Ujh0aTNRUUw5bFpjSUJxNGhqNzF6WkNJ?=
 =?utf-8?B?S3piejZvbGhvNzRuTFFEdldTbzhpUzlobE5LeGUxTW5NV2FiOFZ6cGhyMlM3?=
 =?utf-8?B?aFRpdlQwZE4vN3V4ekZtZTBkaFNMRXBTekU2eFlRcG14U2pUdWZiMkZTN21i?=
 =?utf-8?B?NVFCUmZUSXMzWTVlZVdLbU9wWnlQUlFPWXVUaFFTK25tNjFyQWVNSmhqM0Zr?=
 =?utf-8?B?dEUrVEszdE1lU2xZTnFoNEplNTF0a2lGWXEvaEVOS3IrNDJuUnNCRkFVQ294?=
 =?utf-8?B?TXM4amRmNENLUTZ3eDZ4dElROG1uMFFGMFg2VEswWndtNGtFdnREa2pHdUVq?=
 =?utf-8?Q?5Dci4B0Bv9GfNwxlZERcSweVH?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c2f8da-aec4-43df-0e6e-08dcdd2e915c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 06:52:05.8707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmUBW/2421tkfRZcpGiUlbDiR2oHUqr9eoWeDx72WiU8KJvCSwPP3bjqOaEK2S0XiOvNlFonQ53mBKZM4DVurw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_235224_589985_78E0AA83 
X-CRM114-Status: GOOD (  34.20  )
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

Ck9uIDIwMjQvOS8yNCAyMTozNSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIFR1ZSAyNCBTZXAgMjAyNCBhdCAxODoyNywgQ2h1YW4gTGl1IDxjaHVhbi5s
aXVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4+IE9uIDIwMjQvOS8yNCAxNjo1MCwgSmVyb21lIEJy
dW5ldCB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIEZyaSAyMCBTZXAg
MjAyNCBhdCAxNjoxMywgQ2h1YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUu
YW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4+IEZyb206IENodWFuIExpdSA8
Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+Pj4+Cj4+Pj4gVGhlIGhhcmR3YXJlIHByb3BlcnR5IG9m
IFBMTCBkZXRlcm1pbmVzIHRoYXQgUExMIGNhbiBvbmx5IGJlIGVuYWJsZWQKPj4+PiBhZnRlciBQ
TEwgaGFzIGJlZW4gaW5pdGlhbGl6ZWQuIElmIFBMTCBpcyBub3QgaW5pdGlhbGl6ZWQsIHRoZQo+
Pj4+IGNvcnJlc3BvbmRpbmcgbG9jayBiaXQgd2lsbCBub3QgYmUgc2V0IHRvIDEsIHJlc3VsdGlu
ZyBpbgo+Pj4+IG1lc29uX2Nsa19wbGxfaXNfZW5hYmxlZCgpIHJldHVybmluZyAiZmFsc2UiLgo+
Pj4+Cj4+Pj4gVGhlcmVmb3JlLCBpZiBQTEwgaXMgYWxyZWFkeSBlbmFibGVkLCB0aGVyZSBpcyBu
byBuZWVkIHRvIHJlcGVhdAo+Pj4+IGluaXRpYWxpemF0aW9uLCBhbmQgdGhlIGp1ZGdtZW50ICJD
TEtfTUVTT05fUExMX05PSU5JVF9FTkFCTEVEIiBpbgo+Pj4+IG1lc29uX2Nsa19wbGxfaW5pdCgp
IGFwcGVhcnMgcmVkdW5kYW50Lgo+Pj4gQXBwYXJlbnRseSB5b3UgbWVzc2VkIHNvbWV0aGluZyB1
cCB3aXRoIGI0IC4uLgo+Pgo+PiBlbW1tbS4uLiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyB0
b29s8J+Yggo+Pgo+Pgo+Pj4+IC0tLQo+Pj4+IFRoZSBoYXJkd2FyZSBwcm9wZXJ0eSBvZiBQTEwg
ZGV0ZXJtaW5lcyB0aGF0IFBMTCBjYW4gb25seSBiZSBlbmFibGVkCj4+Pj4gYWZ0ZXIgUExMIGhh
cyBiZWVuIGluaXRpYWxpemVkLiBJZiBQTEwgaXMgbm90IGluaXRpYWxpemVkLCB0aGUKPj4+PiBj
b3JyZXNwb25kaW5nIGxvY2sgYml0IHdpbGwgbm90IGJlIHNldCB0byAxLCByZXN1bHRpbmcgaW4K
Pj4+PiBtZXNvbl9jbGtfcGxsX2lzX2VuYWJsZWQoKSByZXR1cm5pbmcgImZhbHNlIi4KPj4+Pgo+
Pj4+IFRoZXJlZm9yZSwgaWYgUExMIGlzIGFscmVhZHkgZW5hYmxlZCwgdGhlcmUgaXMgbm8gbmVl
ZCB0byByZXBlYXQKPj4+PiBpbml0aWFsaXphdGlvbiwgYW5kIHRoZSBqdWRnbWVudCAiQ0xLX01F
U09OX1BMTF9OT0lOSVRfRU5BQkxFRCIgaW4KPj4+PiBtZXNvbl9jbGtfcGxsX2luaXQoKSBhcHBl
YXJzIHJlZHVuZGFudC4KPj4KPj4gWW91IGhhdmUgYSBwb2ludCwgYnV0IHdlIGRvIGdldCB0aGlz
IGtpbmQgb2Ygc2l0dWF0aW9uIGFsbCB0aGUgdGltZToKPj4KPj4gRm9yIGV4YW1wbGUsIGhpZmlf
cGxsIHByb3ZpZGVzIGEgY2xvY2sgZm9yIGF1ZGlvLCB3aGljaCBuZWVkcyB0byBiZQo+PiBjb25m
aWd1cmVkCj4+Cj4+IGluIHRoZSBib290bG9hZGVyIHBoYXNlIGluIG9yZGVyIHRvIHBsYXkgYXVk
aW8gYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlcgo+PiBib290Lgo+Pgo+PiBBZnRlciBlbnRlcmlu
ZyB0aGUga2VybmVsLCB0aGUgaGlmaV9wbGwgZnJlcXVlbmN5IG1heSBiZSBkeW5hbWljYWxseQo+
PiBhZGp1c3RlZAo+IFdoYXRldmVyIHdhcyBmZWVkaW5nIHRoZSBhdWRpbyBmaWZvIGlzIGdvbmUg
YnkgdGhhdCBzdGFnZSBhbmQgZmlmbywgdGRtCj4gYW5kIGV2ZXJ5dGhpbmcgd2lsbCBiZSByZXNl
dCBhcyBzb29uIHRoZSBhdWRpbyBkcml2ZXJzIGFyZSBwcm9iZWQuCj4gSSBoYXJkbHkgc2VlIGhv
dyBrZWVwaW5nIHRoZSBQTEwgaW5pdCB0aHJvdWdoIGJvb3QgY291bGQgYXBwbHkgdG8gYXVkaW8s
Cj4gZXNwZWNpYWxseSB3aXRoIHRoZSB1c2Ugb2YgYXNzaWduZWQtcmF0ZSBpbiBEVC4KCgpJIGFz
a2VkIGEgY29sbGVhZ3VlIG9mIG91ciBhdWRpbyBkcml2ZXIsIGFuZCBoZSByZXBsaWVkIHRoYXQg
dGhlcmUgd2VyZQp0aGUgZm9sbG93aW5nIHNjZW5hcmlvczogRHVyaW5nIHRoZSBib290bG9hZGVy
IHBoYXNlLCBvdXIgYXVkaW8gc3RyZWFtCmFuZCB2aWRlbyBzdHJlYW0gd291bGQgYmUgb3V0cHV0
IHRvZ2V0aGVyIHRocm91Z2ggSERNSSwgc28gaGlmaV9wbGwgYWxzbwpuZWVkZWQgdG8gZW5zdXJl
IGNvbnRpbnVpdHkgZHVyaW5nIHRoZSBrZXJuZWwuIE9mIGNvdXJzZSwgaXQgZG9lc24ndCBtYXR0
ZXIsCm91ciBkcml2ZXIgY2FuIG1lZXQgdGhpcyBuZWVkLgoKCj4+ICh0byBtYXRjaCB0aGUgYXVk
aW8gYml0IHJhdGUvYXVkaW8gYW5kIHZpZGVvIHN5bmNocm9uaXphdGlvbiwgZXRjLikuIFRoZQo+
PiBncF9wbGwKPj4KPj4gdGhhdCBwcm92aWRlcyB0aGUgY2xvY2sgZm9yIGVNTUMgYW5kIHRoZSBo
ZG1pX3BsbCB0aGF0IHByb3ZpZGVzIHRoZSBjbG9jawo+PiBmb3IKPj4KPj4gSERNSSBhcmUgYWxs
IGNvbmZpZ3VyZWQgZHVyaW5nIHRoZSBib290bG9hZGVyIHBoYXNlIGFuZCBjYW5ub3QgYmUgY29u
ZmlndXJlZAo+Pgo+PiBhcyBSTyBpbiB0aGUga2VybmVsLgo+IEhETUksIHlvdSBwcmVzdW1hYmx5
IHdhbnQgdG8gYXZvaWQgYSBnbGl0Y2ggaW4gdmlkZW8gdW50aWwgeW91J3JlIHJlYWR5Cj4gdG8g
cmVjb25maWd1cmUgdGhlIHBpcGVsaW5lLiBUaGF0IHdvdWxkIGJlIGEgdmFsaWQgdXNlLWNhc2Ug
Zm9yCj4gQ0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRC4KPgo+Pgo+PiBNeSBpZGVhIGlzIHRv
IHN0aWxsIGRlc2NyaWJlIHRoZSBpbml0X3JlZ3MgaW5mb3JtYXRpb24gaW4gdGhlIGtlcm5lbCBp
biB0aGUKPj4gZHJpdmVyOgo+Pgo+PiAxKSBJZiB0aGUgYm9vdGxvYWRlciBpcyBub3QgZW5hYmxl
ZCwgdGhlIFBMTCB3aWxsIGJlIGp1ZGdlZCBhcyB1bnVzZWQKPj4gZHVyaW5nIHRoZQo+Pgo+PiBi
b290bG9hZGVyIHBoYXNlLCBhbmQgdGhlbiBlbnRlciB0aGUga2VybmVsIGZvciBpbml0aWFsaXph
dGlvbi4KPj4KPj4gMikgSWYgdGhlIGJvb3Rsb2FkZXIgaGFzIGVuYWJsZWQgUExMLCBpbiBvcmRl
ciB0byBlbnN1cmUgY2xvY2sgY29udGludWl0eQo+PiBhZnRlcgo+Pgo+PiBlbnRlcmluZyB0aGUg
a2VybmVsLCBpdCB3aWxsIG5vdCByZXBlYXQgaW5pdGlhbGl6YXRpb24gKHJlLWluaXRpYWxpemF0
aW9uCj4+IG1heSBjYXVzZSB0aGUKPj4KPj4gbW9kdWxlIHRoYXQgcmVmZXJlbmNlcyBQTEwgdG8g
d29yayBhYm5vcm1hbGx5KS4KPiBJIHVuZGVyc3Rvb2QgeW91ciBpZGVhIHRoZSBmaXJzdCB0aW1l
IGFyb3VuZC4gSSBzdGlsbCBkbyBub3QgYWdyZWUuCj4gVXNlIENMS19NRVNPTl9QTExfTk9JTklU
X0VOQUJMRUQgaWYgeW91IG11c3Qga2VlcCBhbiBlbmFibGVkIFBMTCBhbmQKPiBqdXN0aWZ5IHRo
ZSB1c2Ugd2l0aCBhIHByb3BlciBjb21tZW50LiBGb3IgZU1NQyBJJ20gbm90IGNvbnZpbmNlZC4K
CgpUaGUgb3JpZ2luYWwgaW50ZW50aW9uIG9mIHRoaXMgcGF0Y2ggaXMgdG8gc2ltcGxpZnkgdGhl
IFBMTCBpbml0CmV4ZWN1dGlvbiBsb2dpYywgYW5kIHRoZSBrZXJuZWwgaXMgY29tcGF0aWJsZSB3
aXRoIHRoZSBib290bG9hZGVyCmluaXRpYWxpemluZyBQTEwgYW5kIG5vdCBpbml0aWFsaXppbmcg
UExMLCBhbmQgY2FuIGluY3JlYXNlIHRoZSBmYXVsdAp0b2xlcmFuY2Ugb2YgdGhlIGRyaXZlci4g
QWx0aG91Z2ggdGhpcyB0cmVhdG1lbnQgaGlkZXMgdGhlIGNvdXBsaW5nCnJlbGF0aW9uc2hpcCB3
aXRoIHRoZSBib290bG9hZGVyLCBiYWxhbmNpbmcgdGhlIHJpc2tzIGFuZCBiZW5lZml0cywKSSB0
aGluayB0aGUgYmVuZWZpdHMgYXJlIGdyZWF0ZXIuCgoKVGhpcyBpcyBqdXN0IGFuIG9wdGltaXph
dGlvbiBwYXRjaCBvZiBsb3cgaW1wb3J0YW5jZSwgaWYgeW91IHRoaW5rIHRoaXMKcGF0Y2ggaXMg
YmFkIGFmdGVyIHdlaWdoaW5nIGl0LCB0aGVuIGlnbm9yZSBpdC4KCgo+PiBDYW4gdGhlIGNvdXBs
aW5nIGJldHdlZW4gYm9vdGxvYWRlciBhbmQga2VybmVsIGJlIGF2b2lkZWQgb24gdGhlIHByZW1p
c2Ugb2YKPj4KPj4gZW5zdXJpbmcgZnVuY3Rpb25hbCBpbnRlZ3JpdHkuCj4+Cj4+Cj4+PiBJZiB0
aGUgUExMIGlzIGVuYWJsZWQsIGl0IGhhcyBiZWVuIGluaXRpYWxsaXplZCwgdG8gc29tZSBleHRl
bnQKPj4+IHllcy4gSG93ZXZlciB3ZSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUgc2V0dGluZyB3YXMu
IEluIGdlbmVyYWwsIEkgcmVhbGx5Cj4+PiBkb24ndCBsaWtlIGluaGVyaXRpbmcgc2V0dGluZ3Mg
ZnJvbSBib290bG9hZGVyLiBJdCBicmluZ3MgYWxsIHNvcnRzIG9mCj4+PiBpc3N1ZXMgZGVwZW5k
aW5nIG9uIHRoZSBib290bG9hZGVyIG9yaWdpbiBhbmQgdmVyc2lvbiB1c2VkIGJ5IHRoZQo+Pj4g
c3BlY2lmaWMgcGxhdGZvcm0uCj4+Pgo+Pj4gU28gaW4gZ2VuZXJhbCBhIFBMTCBzaG91bGQgYmUg
cmUtaW5pdGlhbGl6ZWQgd2hlbiBwb3NzaWJsZS4gV2hlbiBpdCBpcwo+Pj4gbm90IHBvc3NpYmxl
LCBpbiBtb3N0IGNhc2UgaXQgbWVhbnMgdGhlIFBMTCBzaG91bGQgYmUgUk8gYW5kIGxpbnV4Cj4+
PiBzaG91bGQganVzdCB1c2UgaXQuCj4+Pgo+Pj4gU29tZW9uZSBicm91Z2h0IGEgc3BlY2lmaWMg
Y2FzZSBpbiBiZXR3ZWVuLCB3aGVyZSB0aGV5IG5lZWRlZCB0byBrZWVwCj4+PiB0aGUgUExMIG9u
IGJvb3QsIGJ1dCBzdGlsbCBiZSBhYmxlIHRvIHJlbG9jayBpdCBsYXRlciBvbi4gVGhlIGZsYWcK
Pj4+IHByb3Blcmx5IGlkZW50aWZ5IHRob3NlIFBMTHMuIE11Y2ggbGlrZSBDTEtfSVNfQ1JJVElD
QUwgb3IKPj4+IENMS19JR05PUkVfVU5VU0VELCBlYWNoIHVzYWdlIHNoYWxsIGJlIHByb3Blcmx5
IGRvY3VtZW50ZWQuCj4+Pgo+Pj4+IEluIGFjdHVhbCBhcHBsaWNhdGlvbiBzY2VuYXJpb3MsIFBM
TCBjb25maWd1cmF0aW9uIGlzIGRldGVybWluZWQgZHVyaW5nCj4+Pj4gdGhlIGJvb3Rsb2FkZXIg
cGhhc2UuIElmIFBMTCBoYXMgYmVlbiBjb25maWd1cmVkIGR1cmluZyB0aGUgYm9vdGxvYWRlcgo+
Pj4+IHBoYXNlLCB5b3UgbmVlZCB0byBhZGQgYSBmbGFnIHRvIHRoZSBrZXJuZWwgdG8gYXZvaWQg
UExMCj4+Pj4gcmUtaW5pdGlhbGl6YXRpb24sIHdoaWNoIHdpbGwgaW5jcmVhc2UgdGhlIGNvdXBs
aW5nIGJldHdlZW4gdGhlIGtlcm5lbAo+Pj4+IGFuZCB0aGUgYm9vdGxvYWRlci4KPj4+IFRoZSB2
YXN0IG1ham9yaXR5IG9mIHRob3NlIFBMTCBzaG91bGQgYmUgUk8gdGhlbi4KPj4+IElmIHlvdSBj
YW4gcmVsb2NrIGl0LCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gcmUtaW5pdCBpdCBhcyB3ZWxsLgo+
Pgo+PiByZS1pbml0IG1heSBjYXVzZSBnbGl0Y2ggaW4gdGhlIFBMTCwgd2hpY2ggYWZmZWN0cyBt
b2R1bGUgd29yayBhdCBsYXRlciBQTEwKPj4gbGV2ZWxzLgo+Pgo+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRy
aXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyB8IDMgKy0tCj4+Pj4gICAgZHJpdmVycy9jbGsvbWVz
b24vY2xrLXBsbC5oIHwgMSAtCj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNv
bi9jbGstcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4+PiBpbmRleCA4OWYw
ZjA0YTE2YWIuLjhkZjJhZGQ0MGI1NyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNv
bi9jbGstcGxsLmMKPj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPj4+PiBA
QCAtMzE2LDggKzMxNiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9pbml0KHN0cnVjdCBj
bGtfaHcgKmh3KQo+Pj4+ICAgICAgICAgICogS2VlcCB0aGUgY2xvY2sgcnVubmluZywgd2hpY2gg
d2FzIGFscmVhZHkgaW5pdGlhbGl6ZWQgYW5kIGVuYWJsZWQKPj4+PiAgICAgICAgICAqIGZyb20g
dGhlIGJvb3Rsb2FkZXIgc3RhZ2UsIHRvIGF2b2lkIGFueSBnbGl0Y2hlcy4KPj4+PiAgICAgICAg
ICAqLwo+Pj4+IC0gICAgIGlmICgocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfTk9JTklUX0VO
QUJMRUQpICYmCj4+Pj4gLSAgICAgICAgIG1lc29uX2Nsa19wbGxfaXNfZW5hYmxlZChodykpCj4+
Pj4gKyAgICAgaWYgKG1lc29uX2Nsa19wbGxfaXNfZW5hYmxlZChodykpCj4+Pj4gICAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+Pj4gSSdtIG5vdCBPSyB3aXRoIHRoaXMuCj4+Pgo+Pj4+ICAgICAg
ICAgaWYgKHBsbC0+aW5pdF9jb3VudCkgewo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmggYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmgKPj4+PiBpbmRleCA5
NDkxNTdmYjdiZjUuLmNjY2JmNTI4MDhiMSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmgKPj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmgKPj4+
PiBAQCAtMjgsNyArMjgsNiBAQCBzdHJ1Y3QgcGxsX211bHRfcmFuZ2Ugewo+Pj4+ICAgICAgICAg
fQo+Pj4+Cj4+Pj4gICAgI2RlZmluZSBDTEtfTUVTT05fUExMX1JPVU5EX0NMT1NFU1QgIEJJVCgw
KQo+Pj4+IC0jZGVmaW5lIENMS19NRVNPTl9QTExfTk9JTklUX0VOQUJMRUQgQklUKDEpCj4+Pj4K
Pj4+PiAgICBzdHJ1Y3QgbWVzb25fY2xrX3BsbF9kYXRhIHsKPj4+PiAgICAgICAgIHN0cnVjdCBw
YXJtIGVuOwo+Pj4+Cj4+Pj4gLS0tCj4+Pj4gYmFzZS1jb21taXQ6IDBlZjUxMzU2MGI1M2Q0OTlj
ODI0Yjc3MjIwYzUzN2VhZmUxZGY5MGQKPj4+PiBjaGFuZ2UtaWQ6IDIwMjQwOTE4LW9wdGltaXpl
X3BsbF9mbGFnLTY3OGE4OGQyM2Y4Mgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gLS0KPj4+
IEplcm9tZQo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
