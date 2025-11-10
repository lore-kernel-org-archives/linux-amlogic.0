Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07FCCCF9F8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtaX+bC6Ok/3Bg0NLsu9RZTcW+VT8v0mbmsq/P2sM2c=; b=0w2aMM6nBhN+8H0fK5T7AFk4v/
	WcqPRaa97MsfzricecdugCZBHQqBCFp07zCRiD9D6Fa0DKl0tT5QDOH6VxpQmpMbzkY83L6htthPH
	CCMzJ7DQfD7mTyUjnrjT5De/Xqbucm6mLTwOqGkO0SIYZbsvD4l3RLVXxa6b+6lBc/wiEB8yqntGd
	3gTwX8783fGAu6+BVznmBaTFT+nAxHCvrCWDoi3tCNgfQVY/DyNArQp1v9pavgGpfpf94JdNgpKPI
	GPsrsGy+TghkWmWB3t+GfWuQMp9pdtl8cDi2oB1MXboDJqIZiQ+tvz4LD0bAI514BTWGT+z+1NhAi
	xMRmECLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHzI-00000004dQ0-06mm;
	Mon, 10 Nov 2025 02:50:36 +0000
Received: from mail-japaneastazon11023086.outbound.protection.outlook.com ([52.101.127.86] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHzF-00000004dPQ-47zb;
	Mon, 10 Nov 2025 02:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWQLSFfk+i0WlpWjw2kHz6noovIJ25sqsYzfZ0eaUx1nndLYzscwte+vNPigpKstyN40bV6gk8mUe42/LZdNZ4pfxpyqhaODxTGOUgs3MbnHXyaHF6wvrOzqFRP9JXT2aQeVgBdD3zMdodZhaKJF632WeZoLj7eTyhMlVXY18Zk3RntDnlsnUEwSdS0eeo3ZkRSZaUnValSgEJX4N7eES/Mp904XUKdH1/euo1KU8WOHt8J+/4Ng9bJ7y1JdXN7pKi17hHo/dIjmp+rsnlv0wJi4H8eyMBW8Ix2PVrnKGm3tbAGjU3A7ogt0yKqIGNjjv5TKp/I2p3mm0nlro7NB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+npg3JgvV20C4F4h9AgUZAk0WszRM4esTGfJkYT8vk=;
 b=uulbYriPCZ3i9t1YUni+aalNzk53P+WFNVP14bRcq49YU4pI+gvDMFjB8HEjOIz6eImxYqnjDaeBMl1QROIp4FVB3bSc0Zt7aDYq84uUvxs4nC2m2qd5ETWBasqs7NzupDr0aSO378LkVGYO0JNbJIhaPtMShkaw95zUSydQ/8kJin+60eP6AQ4VRqyb5e1HoKtlU+NsjfhS+95mDKByqtKIkaenar3jWFy0fyaH7ISjZUuFj9jw419OxbVL2GXuBo1u7aC58IhbNoVawOp1DbL3Uji1i4QSwjX8UPg0CdqE38Jxb70KIgXcYgd35EvJ7iQI2I3/h91wZzRVtH3+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+npg3JgvV20C4F4h9AgUZAk0WszRM4esTGfJkYT8vk=;
 b=RcLTX6GQaWvV6YSJSEXNR8Wrlvq849rfelC1owVrM3s2qYctSFNjcY9l3B/HPvDiGNcSOCYkxHxcvydPYNtkTgjceJiEz20wybaNhZeL4Sze4+PsFplGTGwQ03r53u/AZMxFwVD3sYUvTmWo0PftI2P91WF6SzojTK1mgAkmFV71PonVPb6poYCdYY5uabQxZC/TSF1At15FpBZs2tiEsQbdLN+ERW2bcKsOQVsuIOLMKVlvj1d18RaQbKWZCJdepiSJr9+6Gt2txGvlH3PBN2rAgg51GMN9RLiBQCfWhGLZeGm/V6fSOPcXqGG7UHW/h28Tqdi6zSiFhG6pzGFONA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com (2603:1096:4:150::10)
 by PUZPR03MB7015.apcprd03.prod.outlook.com (2603:1096:301:f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 02:50:22 +0000
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86]) by SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86%2]) with mapi id 15.20.9298.010; Mon, 10 Nov 2025
 02:50:21 +0000
Message-ID: <a43d769b-bc61-40df-aa96-c67eb30105d6@amlogic.com>
Date: Mon, 10 Nov 2025 10:49:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
 <CAFBinCBSjKzHZ_k+c70B+YsJHiOS4qbjAgtnWaEeQy11xg94cA@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCBSjKzHZ_k+c70B+YsJHiOS4qbjAgtnWaEeQy11xg94cA@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To SI2PR03MB5786.apcprd03.prod.outlook.com
 (2603:1096:4:150::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR03MB5786:EE_|PUZPR03MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 341109da-64b1-496b-4c6a-08de2003e404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmhieHpvdVJUWmxFTnRDMlpQaHF3dXVyMWNDeFVMeE5QN3VkOEw2emNWVUtD?=
 =?utf-8?B?RmY5T2NDMWNzbFBjS0hhbWVCNVRROURLdkxrUnNaSm1WUkcxM1UyVXpzMkMv?=
 =?utf-8?B?T3JkbGtKSUtsamVUb1BNMHZ2SFZLbTZhaHFmM1N6dzJBNytmU1lIdHJMZGRx?=
 =?utf-8?B?bCtqSUZuTjh3ZHNJR3ZZSWFZeUhzNWFRaTk1WUhLaGxocUpQYStQU2NWdkxt?=
 =?utf-8?B?YUQ4eVlhdlJjMzNSMksyTnNzRTVvVEFXUTZRN1gvWjh4NkxhWlp4VFBMSGdS?=
 =?utf-8?B?eEc3NkdoaEp1SjFqVUc1c1d1N3ZBeDVQY25BaFNlU3QwSVJJbXNZYWlGWDly?=
 =?utf-8?B?Vy9sRmV1UVR4OGhKYXNkL2F4NVhUVFdGOXRHUldqaDF3eFVJZExVUnV0bkpY?=
 =?utf-8?B?Y0ZWdVo5Q3RVUm93UGFGZ1pEOGhlZzArRWtVUWRLdUt3RDBiY04vNWtQWlR1?=
 =?utf-8?B?YmJQbWFVUzMrZlFoc3pmTmcxcHppS1FMSE9JZDZSV1Y4VGgxenNZM2dpMkVJ?=
 =?utf-8?B?MjM1S2tFd0xVTEx6YTljTmgvN2pud3RJNjl2ZVFZcUREeDZRYUZrTW5kdlpj?=
 =?utf-8?B?V0JRVEUzNnM1VTlhZzN5SStLekY3Q2d3THdwcE1PUkFTdmhSa2tiTlR5aFMv?=
 =?utf-8?B?RU5MZWFIU0swY3BUZXhMU2FmcVgzK2pYcjNhdUE3dGIwWFN3dWRoSDNQL1lS?=
 =?utf-8?B?OC9QazF4NGtTZzBGK0pMNnY5WTZDZHV5TTlkM1d4dTFRTC8xbWlvM1Z1ek5W?=
 =?utf-8?B?SmxtRkZ6S3hHS0wyb3VrWXBydTAyaVoycDg4bjVKMnJ4OCswc2FQdk5kOUdB?=
 =?utf-8?B?SnNac3pxemlVUjFCRmVTWm40UmJGVnlaUFVOWjI5S25UQ3JNWU9GV0tveG1W?=
 =?utf-8?B?b2VzN04yL3BLdS83Q2xxWUtFVDc2SDVLZmJ1UVg2MHVpMm1zWmRUeEpyNmVr?=
 =?utf-8?B?ZTkyMFFqQTZ4M09KOTNHWXNSUHd5VDdGc1JwR2FRS2dsUmQvZTNIQ1pJY2Nu?=
 =?utf-8?B?dlB5RFBTaG1lemI2a3NLdW91emFWNTM4SHgyZGhYNkVmc2l5ZU84QXJ2Nldm?=
 =?utf-8?B?NXdqN0E1SEFhelNWQTdpL1hVU2dVUzBZRWt4NVlMN1M2UnlDNUZRZHh1enNl?=
 =?utf-8?B?bXFBempLVFZlNUtCRmFqKzZDNDNBOFF6SWx6Rmw3VG1uYlNSVW1JVnQ3cWNp?=
 =?utf-8?B?aTlEVnZWQzhESU9ZQzdSZVNML3FJZ3YwY2g1UE9NL21OR09SN3U0bThFTW1a?=
 =?utf-8?B?OUV1eUoxaElURVIwc2ZjZTdzWTBjcWFSQXE2RE1XMDBSK2s3YUdnV3JjS2E0?=
 =?utf-8?B?dlhORjROK3ZsVnNrYkkyaFVNL2R5MkNsL281c0ZuekZybk1Za2wzaXM0S1BZ?=
 =?utf-8?B?NDNjS1FyeTgzcS9WSjFoRTBMU3FpY1JzdzhpNjFpYnk3QlE0SDFPdGVtcmI1?=
 =?utf-8?B?Q2draisrV3NQSW0rOVhybDFTYi9UbDBVMkIxZnZ0dTR4SCtUNW1FNGRuN3pv?=
 =?utf-8?B?WURaKy9wWjRpb24vdjRnN0x3dy9pemNZek9TcWZJTUF4dW92K3RNUzhqWmxH?=
 =?utf-8?B?QnFURk9kdlRtMFpGd3BxanQ3cDdGSWNlaG9XYnpzdC85UW9GTnZaZGgzbW5K?=
 =?utf-8?B?RGdGcTNLa1N2d2xTbHU1OXJSbVhYenlvZW9KVEhiVjVPMXNlNTFYZkZZeHdr?=
 =?utf-8?B?Mm1YRU5UbFk2ZEVEcVV3Z1pNSTI1ZTYwbEtHNjJDZ2VZWVVDSlRSaVIrNytC?=
 =?utf-8?B?amFvZEVyUkh6MFpTa0gyK0phdUUvSDE4UWV4Uk5ucDhHTnZHY3FqWUJwR0R4?=
 =?utf-8?B?VWxUcjErNTI2NjVtVU51RUJxTWlhM1NJWWNONENFNUFYK1JoMTdkTGo1ZnZa?=
 =?utf-8?B?c09xdERrV1BjdDNXcW1NR2JNSVNBeDNOTys3Y1IwQ3Jaek5pU3JLd2FQVUd2?=
 =?utf-8?Q?oXLhySewnJ7omE0X/WBCMrmi9Z38AKKl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5786.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QSswU1VHRjdxeUVIMlJydEU4K1JkRVVzOWQ5aU5MOXJVYWpxT0JJRVAwZmF1?=
 =?utf-8?B?QmpsaFk2S1FHUnRndXhNcDkvSG5odTJxWGZCaTBWaVpieHJmcnVqczZxV1FF?=
 =?utf-8?B?eTdUYTlmRDkxRGxvOWVNOGxGSVZXR2tySkZpTy9INTE5UHV0SXBOTndhZXdp?=
 =?utf-8?B?cmRtejZaeXhwWVRGMUZQS3hVeS9HQ0ZjWjloQUpkSTlkTWczZ1ZVYTZLZ2RS?=
 =?utf-8?B?UmM2Q212OWhWaThBa2R2dCtXRG5tRkFzbFF1a1h0V3hqWjlHVGJDeE45WjQ0?=
 =?utf-8?B?U24yWk5KY09KUE1sZXFudTUyMW1Ia0pkSjM1Y09WQUFocVRPR2ltRWltOEpL?=
 =?utf-8?B?T1dJNEJ1SmUyYXJ6azkyZUZ5Q2JaTVNQK050Q0pKM3VSbGFERkxWN2RPMUNq?=
 =?utf-8?B?eSsyRU5GelVuM2ZCeGJTY09ZSGNuU1BHQlV1YzBPMjFISTUxY3BTM1J3eUsv?=
 =?utf-8?B?R0JlWkJtUkozNGFZQ1JNTmhDamZRWnczVWl5K3VZcG1YZUxFU1JMbE5PMm5O?=
 =?utf-8?B?b0poNUhyS0VJd1dyWDd2TWxIRlJ5U1pBSGFCaUhvK1FKbTQ5MWJjL2t0azFs?=
 =?utf-8?B?aEttNzJEbnJLT3NMMG5udnpqa2wyb2JkOTlXSFpHTmVQRlhHd0ErRkJvNWNX?=
 =?utf-8?B?eXJCbzc5dVBuZzZnZGJLT2NScTA5VnNSRG43Tzhua3B4ZU1uMkowSjc4Q3RU?=
 =?utf-8?B?VG1Ra2NvNUt3U0dmUHIxMlU1SmxCWjJkWmt6N1dXWUFBalRjb1RyTnlkY2lj?=
 =?utf-8?B?MVRIYmdJTURDeTVQY3pDbnQzMDd0ck51eld4akpBUWNiVHB5T1FTNjJzcVpp?=
 =?utf-8?B?eWFnK1RQemRmSkxycGwweDM3Ky85b2k0OVJTV0oyOUl4SmFDRzBOK1B5SFh0?=
 =?utf-8?B?OTFZVit3TmZ5Tng4TGM1ejk3T3UrNHQ4Y0NlUnQvU1Evc3IrRm9wckhTYzgx?=
 =?utf-8?B?aFIweVJiRlFrUDM0VHcreEppbXNkbVd6NnlwT1cycG4remlncHcwbHl0Sjky?=
 =?utf-8?B?VG11ZXVHSUNTUzI3RytBM1NCRktheWtPTTU2azNaNGtpdjNPbFBrUElhTXFQ?=
 =?utf-8?B?U2N6NjhIdE91UEtmNU9BYUd6Nmd2eU1WNGZlcHJqaW1sWkZPTysvUVpGcWd3?=
 =?utf-8?B?YmlZZ3lrYThJdk5jYTlubGJSSTlLRVh2eEE4VVB5S21VVGpjOFpMQmxrdENF?=
 =?utf-8?B?N3Q1NmdKOVpzYlFBODF5bjdTZUQrUi9NZG9WVFJrY1NaZHhySmZublRoU2hR?=
 =?utf-8?B?VWo0b210N0J6RjVBNHFUUURDMk1WajZuUEMzY3JmaUFBMlZza09VeHVEemEr?=
 =?utf-8?B?ci9oemYrTCttV29XNG9BV0Qwb29NZU5ZSDJxMndreStIUm42OWE4NDFQRHov?=
 =?utf-8?B?SXdReHBabmRpK3FnY0R2ZHUyTHArbUIwRmY3UFdZNldNS0g1WDFrVHdjdUl6?=
 =?utf-8?B?U1B5dHhjUXJMVE1zR1FYbitLdGNuK2hjU25nSythRVkwRG9zbnlNdysyOVZL?=
 =?utf-8?B?ekJjbXJ5UzVjZGN4OXE5UlFvWWIwWis1S3lSWW5JaEVONm9zdlZPM0NZY1lj?=
 =?utf-8?B?dU9LK0EwZU9pSmZiNTlmOHhGMERMSHVxRXl5TzlTK2hLRm9WTTdLKzI5NXox?=
 =?utf-8?B?SThoWWpldS96TVgvRlR2YllLZUVmSXJsbTN6OHU5VUhVREZlb0FXTkJwczAx?=
 =?utf-8?B?Q3c1WWlPOGVUL1lCdnN4V0VVZ2NTSThWYUlWNU1XTkcrSFlwVmEzTzBDdkpt?=
 =?utf-8?B?R0F6dUhJeEsyQVVTTkZyQmNMNFo2ZkEzVEhWZzFickYybVFudldVQ21JMU9O?=
 =?utf-8?B?ZnNwaDF2QkpydXJVRldWRlk0d0VOK0xtSkhldVZXcXpGcGJjY0ltSzByaFQw?=
 =?utf-8?B?TVBybUFGUmVFcm9DZG5TWmtFMGxCWmtsVnFoNkxlbW1rYThQQzVucDYydVBT?=
 =?utf-8?B?c1ZXNEVmRFdrR1o1ajI1RmtvUHRveHdrb3Q3U0swSUNOWU04dnljS3VEQXo5?=
 =?utf-8?B?QmxvRHQ2UjJXczhadEN0YXgwVTJjTVZBN1FQYmRtRXZpSDErWDhBWHV0ak9S?=
 =?utf-8?B?eVVKNVI5Y0VPcm9UV21LL2RCUWZuKzVLRi9XVG1SbFZFYXcwNXZZTDNzcWxY?=
 =?utf-8?Q?NMgVe69fXkrgQSSgu9C232K6Y?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341109da-64b1-496b-4c6a-08de2003e404
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5786.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 02:50:21.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dLPwhlzp9FBf8QWcABilgWyc798TzQzD3YbmRm80C8Z0PZAQFeM9ScRQyhTaRHTKRcpnbwSU6sH8fvYGAaDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_185034_068946_E342806D 
X-CRM114-Status: GOOD (  21.06  )
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

SGkgTWFydGluLAoKVGhhbmsgeW91IGZvciBwcm92aWRpbmcgdGhlIHRlc3QgcmVzdWx0cy4gSSBw
cmV2aW91c2x5IGZvdW5kIGEKTWVzb244YiBib2FyZCBhbmQgd2FudGVkIHRvIHRyeSBhIHN0cmVz
cyB0ZXN0LCBidXQgaXQgdGhyZXcgZXJyb3JzCndoZW4gcnVubmluZyBpbiB0aGUga2VybmVsICht
YXliZSBiZWNhdXNlIG15IGJvb3Rsb2FkZXIgdmVyc2lvbiBpcwp0b28gb2xkKS4uLiBBbnl3YXks
IHRoYW5rIHlvdSEKCk9uIDExLzkvMjAyNSA1OjA0IEFNLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdy
b3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIEZyaSwgT2N0IDMxLCAyMDI1IGF0IDk6
MTDigK9BTSBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5Cj4gPGRldm51bGwrY2h1YW4ubGl1LmFtbG9n
aWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBUaGlzIHBhdGNoIHNlcmllcyBjb25zaXN0
cyBvZiBmb3VyIHRvcGljcyBpbnZvbHZpbmcgdGhlIGFtbG9naWMgUExMCj4+IGRyaXZlcjoKPj4g
LSBGaXggb3V0LW9mLXJhbmdlIFBMTCBmcmVxdWVuY3kgc2V0dGluZy4KPj4gLSBJbXByb3ZlIHRo
ZSBpc3N1ZSBvZiBQTEwgbG9jayBmYWlsdXJlcy4KPj4gLSBBZGQgaGFuZGxpbmcgZm9yIFBMTCBs
b2NrIGZhaWx1cmUuCj4+IC0gT3B0aW1pemUgUExMIGVuYWJsZSB0aW1pbmcuCj4+Cj4+IEZvciBl
YXNpZXIgcmV2aWV3IGFuZCBtYW5hZ2VtZW50LCB0aGVzZSBhcmUgc3VibWl0dGVkIGFzIGEgc2lu
Z2xlCj4+IHBhdGNoIHNlcmllcy4KPj4KPj4gVGhlIFBMTCB0aW1pbmcgb3B0aW1pemF0aW9uIGNo
YW5nZXMgd2VyZSBtZXJnZWQgaW50byBvdXIgaW50ZXJuYWwKPj4gcmVwb3NpdG9yeSBxdWl0ZSBz
b21lIHRpbWUgYWdvIGFuZCBoYXZlIGJlZW4gdmVyaWZpZWQgb24gYSBsYXJnZQo+PiBudW1iZXIg
b2YgU29DczoKPj4gLSBBbHJlYWR5IHN1cHBvcnRlZCB1cHN0cmVhbTogRzEyQSwgRzEyQiwgU00x
LCBTNCwgQTEsIEMzLgo+PiAtIFBsYW5uZWQgZm9yIHVwc3RyZWFtIHN1cHBvcnQ6IFQ3LCBBNSwg
QTQsIFM3LCBTN0QsIFM2LCBldGMuCj4+Cj4+IEJhc2VkIG9uIHRoZSB1cHN0cmVhbSBjb2RlIGJh
c2UsIEkgaGF2ZSBwZXJmb3JtZWQgZnVuY3Rpb25hbCB0ZXN0aW5nCj4+IG9uIEcxMkEsIEExLCBB
NSwgQTQsIFQ3LCBTNywgUzdELCBhbmQgUzYsIGFsbCBvZiB3aGljaCBwYXNzZWQuCj4gSW4gdGhl
IHBhc3QgSSBoYWQgbW9zdCBwcm9ibGVtcyB3aXRoIE1lc29uOC84Yi84bTIgQ1BVIGNsb2NrIHNj
YWxpbmcKPiAodmlhIHN5c19wbGwpLgo+IFNvIEkgdGVzdGVkIHRoaXMgc2VyaWVzIGxvY2FsbHkg
dXNpbmcgdGhlIGZvbGxvd2luZyBzaGVsbCBzY3JpcHQgb24gYW4KPiBPZHJvaWQtQzEgKE1lc29u
OGIpOgo+ICMhL2Jpbi9iYXNoCj4gCj4gQ1BVRlJFUT0iL3N5cy9idXMvY3B1L2RldmljZXMvY3B1
MC9jcHVmcmVxIgo+IAo+IGVjaG8gInVzZXJzcGFjZSIgPiAiJHtDUFVGUkVRfS9zY2FsaW5nX2dv
dmVybm9yIgo+IAo+IHdoaWxlIHJlYWQgLXJhIExJTkUKPiBkbwo+ICAgICAgZm9yICgoIGk9MDsg
aTwkeyNMSU5FWypdfTsgaSsrICkpCj4gICAgICBkbwo+ICAgICAgICAgIGZvciAoKCBqPTA7IGo8
JHsjTElORVsqXX07IGorKyApKQo+ICAgICAgICAgIGRvCj4gICAgICAgICAgICAgIGlmIFsgJGkg
IT0gJGogXQo+ICAgICAgICAgICAgICB0aGVuCj4gICAgICAgICAgICAgICAgICBlY2hvICIke0xJ
TkVbaV19IC0+ICR7TElORVtqXX0iCj4gICAgICAgICAgICAgICAgICBlY2hvICIke0xJTkVbaV19
IiA+ICIke0NQVUZSRVF9L3NjYWxpbmdfc2V0c3BlZWQiCj4gICAgICAgICAgICAgICAgICBzbGVl
cCAxcwo+ICAgICAgICAgICAgICAgICAgZWNobyAiJHtMSU5FW2pdfSIgPiAiJHtDUFVGUkVRfS9z
Y2FsaW5nX3NldHNwZWVkIgo+ICAgICAgICAgICAgICAgICAgc2xlZXAgMXMKPiAgICAgICAgICAg
ICAgZmkKPiAgICAgICAgICBkb25lCj4gICAgICBkb25lCj4gZG9uZSA8ICIke0NQVUZSRVF9L3Nj
YWxpbmdfYXZhaWxhYmxlX2ZyZXF1ZW5jaWVzIgo+IAo+IFRoaXMgaGFzIGJlZW4gcnVubmluZyBp
biBhIGxvb3AgZm9yIHR3byBob3VycyAoYXQgYW4gYW1iaWVudAo+IHRlbXBlcmF0dXJlIG9mIH4x
M8KwQykgYW5kIEkgaGF2ZW4ndCBvYnNlcnZlZCBhbnkgcHJvYmxlbS4KPiBTaW5jZSBtb3N0IHBh
dGNoZXMgYXJlIGEgbm8tb3AgZm9yIG15IGNhc2UgSSdsbCBzZXBhcmF0ZWx5IHJlcGx5IHRvCj4g
cGF0Y2ggIzIgd2l0aCBteSBUZXN0ZWQtYnkgKGFzIHRoYXQncyB3aGF0IEkndmUgYmVlbiBlZmZl
Y3RpdmVseQo+IHRlc3RpbmcpLgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
