Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75A3EB7EAC
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2vvqG8Vn3qFgtsfeuUvP4L+R7ePWTyAaAS4oqb7jvI=; b=toJDmoMAs9cfrOPWsdbJceXVZ8
	rBH/N5C8XXL5y+jcGvLKnNr25s1J5TUvoQFmyuTsO2lGwIXXgVHJC5KOBJCUZUun2Ew7uUf+uKIs3
	ts9AXsCpWKOjFKk83+GnCKWOzO5BTP5+7V0vuSl+fbfFqakkcTiOXsj/1ECFFfuyyKH154sQ0WToG
	FjcmT5iMrCCmDPSREJLn2Vv5KiUhS9MfOb05iQWzHi3W4TM96m6L7PyuzQ5K6iBlSqlDt8Z7VLgiB
	p8L8/RPwPQCLq3qVNTmyusMMDs60C3Cq/FZqXcRTZ4G1gAfvkP8Pdq+UXYrVYktpkdQ4Vk4Gy3SY0
	AdzpgdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiJT-0000000GqvM-2o68;
	Wed, 04 Mar 2026 09:14:39 +0000
Received: from mail-japaneastazon11023098.outbound.protection.outlook.com ([52.101.127.98] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiJQ-0000000Gquw-10XF;
	Wed, 04 Mar 2026 09:14:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I56lGeLBBVvbDeXfhybf4BsrzYgQq3YHUcHUqf/x+iy6XpK611agcleekaVYb7hfshUQenI9rGdxFIwM66ERR4pgjiLnYGH58sqDRRgTxuhAPoXSdTzh1SJgL2+PCRXO+7SkdIyFg9kiAU0DRqHyL0AdiMJqkv83rnzTMrz73eGp+SyDQSmWIHg13MMcFSSVELUipCqHXLCNPkyVCYDIZKWxi5qJYDF+uJwHHAkaat9g3/91jNXwV/7yVayISTxSp2CxWYU9+qnfIEaOPtKkByKBNsrbKREieV646HcSjLV3V0Egn6zoB/G50dLubh5wqOrOC3I962Zpd4GufVx1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO41IAPOPgq9lTBxGf1ydShl/mwQosMNs0ooydr7wNM=;
 b=f8oRSij4mvsn12WkyRGnwdmjkXla2+A89fPfL7306RKRqdW2ljEmHQmRlU2CNOX+mcswXEFRoAWDmuLGbPmos2ewIDXYQL/hQMHDd3phFoN5iKVRzOa6TmYnCY/O1IQpOquujKRoRG8f9qCTVBhKyHg1C9YUeG9H9PCP5yRMgHN3fjSLcS+nkqM696PGbnPsryy9qyicTBPD1aTtgRx0li6fD4PTmf7BFim4mKnv+0dL/LBLQP929uhb/pEEBhYce1DShVD3rfZtUzgot0Cu1onB8xt+En9AOXjWtc8ABlGdKMEZc2udX0dc279dUXpfmPKovLd5Wq5WGa6ZKY18FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO41IAPOPgq9lTBxGf1ydShl/mwQosMNs0ooydr7wNM=;
 b=RPlBcROBJZmUqFauzmVQyc5KwTYvy5Khqw2jecyysBZEWw5XQuXULnAVoa8OtAqv6JZ/Bnx/Wjntas4qlS9pb7x5dkZ5kbJum/F/sYoQb43b5EVDmW+DvR8YpGVxDlJ88+3VmBxkJbA+iePlNZYLafAUlmQ4yBhJ/FEoOMHztYP9CJpZJRWn/vmHzGOVLn4eMmjWXc/+JgHNakuEMES9AHn1ClZ2fFnTGjQGTcu6JnHuX9Zsy3Njjltyl5gXd2lCZdJ68WGpU/p7nsNBxyDgr6cFtkRif+xV9aTs6jGBiN2bdHssv2rSwfdRQeGzlE/7vmRiTphLHK31/SzRCQ1ZiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB9536.apcprd03.prod.outlook.com (2603:1096:101:2f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 09:14:30 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 09:14:30 +0000
Message-ID: <900911d8-c2de-4e37-babb-6371b753456a@amlogic.com>
Date: Wed, 4 Mar 2026 17:14:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
 <941c5dac-afcc-4d93-926e-9acb3cf1a930@aliel.fr>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <941c5dac-afcc-4d93-926e-9acb3cf1a930@aliel.fr>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB9536:EE_
X-MS-Office365-Filtering-Correlation-Id: b58a6dbf-aef0-400a-802c-08de79ce7107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: N3xs0D7NlGCqTOIn3ueTfGUirtztYPW61iMFYscSMS7pahpzkYbYV1+YGNJkojrZB5hN5VRZFdF2tYcxgckSf0Eec0355KefHpRWxkLZdGsUs1JiF0+1/HEPJM5UNPlMqjOG9l/a61emWUiqr22aL0O7wtwPerjjzYQEMdzZosme2DJeGnN1+VwMZ7ll9q3yu2qZsoys7qjp6ugWs7BQJQtS5x8wRo6degztcGWS1BWvnHBLhIBMK+d8amWOw9pyfgZAyi3SrwJ++9SaQuahgtJzmpyK1Fy4eEyfhIA4iz4dUgtzW7yOhAX0pyYb+gnGW0RB1Lf4TtFBEQoSIoKcT5PxjsZwc+ox3O6n+W29d9dwCSaOQYS38dToFWpiGE5I/Ha3lY9/uUM11wiConedajUdbQRLikgkzfKOmkf1fZbUJMaEb3WtDbZDXRmyA8gRA3dAw63eY4TzZ6/SACpYqA4DYF3FmWo1MD3OUnzQcEh+twO92P9pz/gXKx41gktuNLVaI1V5QCyRX9vu10coKrFwwu5qVF0wIj5a7OU8yoIet8X+L3mej24fMPnoD8abhJnSQjKdSxWaVRYQvX28mU/dijSqPUMUk5xKOxAj3WphdJZnN2HM71+d0P78zSNCpSElaWVfGr3Z6X6zVf8cfVCL/93f7rczwz3ixwR4JqoqF3P7VT43M5sh5laawEw77Ou0EyJfh5qmIthMGz9BZKHC2X28HRsn4jIxtfmQFp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitHaVNPVHdydEVvWFAzay9nR29oZ0wxQVNoZTQ0a0dTQk9ueHVZQzFGTzBk?=
 =?utf-8?B?b3A2clRTQ2ZqNlFnZDduNHkvdk9hemtSMWlmMlFOd3I1Mzk4QzgrVzM0bmti?=
 =?utf-8?B?UEQ4alk3cHBuTitOaFY4bXNLWVZSQ1ZqRDJpdU5venRKRkJKQlVHa2Qrcy9E?=
 =?utf-8?B?RkdzSXgrZkY3UFdVSlZtd0NCZHNuN21vS1JzMjJkREdEVm80L1VOR1FDVVRa?=
 =?utf-8?B?Mzk0TU9GRm0yM1Jpek5PbEI3YVB1WFM2SHhNZGIxQ1h5OERPL0M4R09FYTNn?=
 =?utf-8?B?MzhXSTIxaldxdFc1UTEwcllVV0pHT2s4NU5TK3Jnbk5abE9EYVVLZ0pUMFJX?=
 =?utf-8?B?RWhkcUNvYUVPd2ZEUFMwREpJNzFud3Y2TWJicXFXcFR4cHc1WWh3RWtqWStj?=
 =?utf-8?B?WndRRXRlaktzSTZCNzRHK0xka0VxcEYzNEZFTkQzbzBCL0oyd1VSRjEybDZs?=
 =?utf-8?B?WjFVQitWSnNERnIrdE1jU1pCcm02em1pbnkwdGJNVkFENjVjU0Q4SDU4Zmlr?=
 =?utf-8?B?ZFcxcWc5NXUxOUFFejZlcTBqN1cwV1NTTFM2WXg5UmxPS2ZGUitwUTFFaTBr?=
 =?utf-8?B?UndGeVVxc0VFZEJqL3Y4TS94eUJkRVgzNG9IVGVqV2JQcUJvanF4SjJGcFlF?=
 =?utf-8?B?a0E2K2tKcGpLY0xhdkYzQzRuQm8wWlVIYVJZVVFiV1RKT2NGTzJ1ZUJkRFlM?=
 =?utf-8?B?Zm8zWHdjVjBzR0czeWZwdFZMZ0FoQnB4eG11aDhnY2dnUTYvUmxQaVBKMkVZ?=
 =?utf-8?B?MkdiUUZURmZ1cnNVL0xMUDZZQW9SbGxLVmVNQlAxYzQ2RDRuUE9odUl2anYv?=
 =?utf-8?B?NXlqcVVialp3c2ZYdkxXaC9rdTVRL0UzUHdKVTMxZUJaSkdXeHlzZitzK2h5?=
 =?utf-8?B?WGtOUXowTURHL3ZBaEtxdlM3a2VBRnQ3ZUUreVczQSt6RDhjdkdtYzRaenN6?=
 =?utf-8?B?SDNHYy9ERzQ3VllXejhxN1VFSmhpRTJCQUp6SktjUWtZUHpYYzBucUdJeTRG?=
 =?utf-8?B?NFQyc3ZDaWoxRnhmbk1CTkFiN2toNlZqR3pUNTZ1NGdTR2dVaFBJcC9jWnhR?=
 =?utf-8?B?UU5YTTA4MHRxam9YU3QwNGNrOEZ5ZEI3bmY2M0ZQSS8zaWFJOGhnUWJCVWlm?=
 =?utf-8?B?N3N0aGs5UU51Y2tvL2xOUGhMSzZWZ2RvNU03Y2RKbVErSFhqZnZDK1hmSFpi?=
 =?utf-8?B?SXBDMmhNU295S3VqMXZqRFc1TVplcnMxeXhsd0kvK1dkVUZQckNoRVdVVkI3?=
 =?utf-8?B?Rkk0bDBpOUZHS1V2cHl4V1E5S2s1MXhNRzRKTFFuMGs5aWE2T2R3ZHV0Vjh5?=
 =?utf-8?B?TyszWGhMVlNPMFI3anVnVUdxTWNqWmM5OVVHSndoT0x6cXVhQlNDejc3TGlN?=
 =?utf-8?B?a0hZclZkbUR1RmZrTGl6L1ZPUkc4WWhrcS9GN00vanFwaEtRbTFQaTMzNVRn?=
 =?utf-8?B?OG5vcElvTi9iSDNhMVp3WUVjZkg3ODFNd0MyS3AxRzI3bDY3ZzAvM2ZNeUdE?=
 =?utf-8?B?ZlZjckdQaXpnemVDT1dhU00yYU1WSUNFZW05NnV5WmZTUm5uM3p0RmgrT3F2?=
 =?utf-8?B?NU95OVpTNU1rQXo1YjVUQmxBM2Nxd2hTS2xzS1hPRWVQSThNKzRHck5JOG1n?=
 =?utf-8?B?N0pjdXRvb09zV0xOYUFqVmgyS3hydzhIZ3BnWGl1N2YvS3FRRURqbllOSFNr?=
 =?utf-8?B?ZUJTRlFJVS9BalI1NDhiS0ZtNkJKdGtuS1Q4VkRsbXBzb3hzZThhNDBGSzJh?=
 =?utf-8?B?Q2MwdENiRjh3NTdEME1CNUd5VGdIcER1cEpNaUlQUThpN2QxK25XdG9GNW9S?=
 =?utf-8?B?NnN2d2JwWW5NTlNnTll3TjBIQUJrTHd1R2FzRjl0cmRKSWVLWm40K0k5dXVE?=
 =?utf-8?B?YXh3SC93S1A3RVZGSTJNYjlHV2V2T0F1elBscnB2MXRCbWVUWXBHTHVQWDBI?=
 =?utf-8?B?Z1hjUHZ0N2hXTmhKdWhlSGlYN01PYnYzUG1sYzlhd3Y0d0d2YkhTbDh0ZzU4?=
 =?utf-8?B?OHZpRmhxcjZITXpyT0VqRzN4UG8vK2FDenE1WmRTSklTZDJjSmFEakxhSDdi?=
 =?utf-8?B?VUIyN2N2akFpTWFNUmp1VHFnVVdRV0FZTWNHWGJRZEQrZVlTTFVBOXNoZjdj?=
 =?utf-8?B?MCtWUGdSTC96azRzdDBUS0R3STZVTmxyWFVWaHQ4R0FTdHVuRHltMkdYd29i?=
 =?utf-8?B?MHJBWkZDVVN5a2NzcUl3NzNCcTZESVpac0NraDU0ZVVRcWo5U213anpXL2tT?=
 =?utf-8?B?YmlWNmVubmlMcGMrdlZlZEJyWmJ2WWJWcGJSMGFtZ1VrT1d3U1BaTXZFUUZl?=
 =?utf-8?B?eVFKUUNWQXlycVpna1RWTC8vYThYaXJMYTM1YWRhNE1ITGU4eHREQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58a6dbf-aef0-400a-802c-08de79ce7107
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:14:30.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVLQ/dPpxyXsZlXU9wFY9kt4zRQaJVCJcOicKP2z+pu5YMVkb89VBjdExJaYwp5l+RLILnx5WRvCaHnuw8fdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_011436_310918_CAB44E88 
X-CRM114-Status: GOOD (  23.17  )
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

Ck9uIDIvMjYvMjAyNiAxMDozMCBQTSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4gWyBFWFRFUk5B
TCBFTUFJTCBdCj4KPiBPbiAyLzE4LzI2IDc6MDUgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+
IE9uIG1lci4gMTggZsOpdnIuIDIwMjYgYXQgMTE6MTcsIFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1r
ZXJuZWwtZGV2QGFsaWVsLmZyPiB3cm90ZToKPj4KPj4+IEFkZCBQTEwgZm9yIHRoZSBjbG9jayBj
b250cm9sbGVyIG9mIHRoZSBBbWxvZ2ljIFQ3IFNvQyBmYW1pbHkuCj4+Pgo+PiBBcyBLcnp5c3p0
b2YgcG9pbnRlZCBvdXQsIGEgc2VyaWVzIGxpa2UgdGhpcyBuZWVkcyBhIGNvdmVyIGxldHRlciB0
byBleHBsYWluCj4+IHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gYWNoZWl2ZSBvdmVyYWxsLCBhbmQg
cHJvcGVyIHRocmVhZGluZy4KPj4KPj4gVGhlIGRlc2NyaXB0aW9uIGFib3ZlIGlzIHRvbyB2YWd1
ZS4KPj4KPiBJbmRlZWQsIEkgd2lsbCBkbyB0aGF0IGZvciB0aGUgbmV4dCBvbmUuCj4KPj4+IFNp
Z25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+
Pj4gLS0tCj4+PiAgIGRyaXZlcnMvY2xrL21lc29uL3Q3LXBsbC5jIHwgMjU3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI1NyBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL3Q3LXBsbC5j
IGIvZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmMKPj4+IGluZGV4IDBhNjIyZjQ1ZmEzNi4uM2Rk
M2FjYTUwYjdjIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmMKPj4+
ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL3Q3LXBsbC5jCj4+PiBAQCAtNzEsNiArNzEsMTUgQEAK
Pj4+ICAgI2RlZmluZSBNQ0xLX1BMTF9DTlRMNCAgICAgICAgICAgICAgMHgxMAo+Pj4gICAjZGVm
aW5lIE1DTEtfUExMX1NUUyAgICAgICAgICAgICAgICAweDE0Cj4+Pgo+Pj4gKyNkZWZpbmUgRlBM
TF9DVFJMMCAgICAgICAgICAweDAwCj4+PiArI2RlZmluZSBGUExMX0NUUkwxICAgICAgICAgIDB4
MDQKPj4+ICsjZGVmaW5lIEZQTExfQ1RSTDIgICAgICAgICAgMHgwOAo+Pj4gKyNkZWZpbmUgRlBM
TF9DVFJMMyAgICAgICAgICAweDBjCj4+PiArI2RlZmluZSBGUExMX0NUUkw0ICAgICAgICAgIDB4
MTAKPj4+ICsjZGVmaW5lIEZQTExfQ1RSTDUgICAgICAgICAgMHgxNAo+Pj4gKyNkZWZpbmUgRlBM
TF9DVFJMNiAgICAgICAgICAweDE4Cj4+PiArI2RlZmluZSBGUExMX1NUUyAgICAgICAgICAgIDB4
MWMKPj4gVGhlIFBMTCB5b3UgYXJlIGFkZGluZyBpcyBkZXNjcmliZWQgaW4gdGhlIGRhdGFzaGVl
dCBhcyB0aGUgTVBMTC4gRlBMTAo+PiBpcyBub3doZXJlIHRvIGJlIGZvdW5kLiBQcmVmZXIgdXNp
bmcgbmFtZXMgdGhhdCByZWxhdGUgdG8gdGhlCj4+IGRvY3VtZW50YXRpb24uCj4+Cj4+IElmIHlv
dSBtdXN0IG1ha2UgYSBuYW1lIHVwLCB5b3UgbmVlZCB0byBoYXZlIGEgdmVyeSBnb29kIHJlYXNv
biBhbmQgdG8KPj4gZXhwbGFpbiBpdC4KPj4KPj4gU3RpbGwgZnJvbSB0aGUgcHVibGljIGRvY3Vt
ZW50YXRpb24sIHRoaXMgUExMIGJlbG9uZyBpbiB0aGUgc2FtZSBkZXZpY2UgYXMKPj4gTVBMTDAs
IE1QTEwxLCBldGMgLi4uIEJVVCwgSSByZW1lbWJlciBjb3JyZWN0bHkgdGhlIFQ3IGluaXRpYWwK
Pj4gc3VibWlzc2lvbiwgdGhlIGZpeGVkIFBMTCBhbmQgZmRpdnMgYXJlIHN1cHBvc2VkIHRvIGJl
IHByb3ZpZGVkIHRocm91Z2gKPj4gU0NNSSBjbG9ja3MuIEhhdmUgeW91IGNoZWNrZWQgdGhhdCA/
Cj4+Cj4gWWVzLCBJIHJlYWQgdGhlIGluaXRpYWwgc3VibWlzc2lvbiwgYW5kIEkgdHJpZWQgZmly
c3Qgd2l0aCBzY21pLXNtYyBhbmQKPiBzY21pLW1haWxib3gsIGJ1dCB3aXRoIG5vIHN1Y2Nlc3Mu
Cj4gSSB3aWxsIHRyeSBpdCBhZ2FpbiBhbmQgYXNrIGtoYWRhcyB0ZWFtIGZvciBtb3JlIGluZm9y
bWF0aW9uIHJlbGF0ZWQgdG8KPiB0aGlzLgoKClRoZSBmaXhlZCBwbGwgYW5kIHN5cyBjbG9ja3Mg
cmVnaXN0ZXJzIGNhbm5vdCBiZSBhY2Nlc3NlZCBpbiBrZXJuZWwsIHNvIAp0aGVzZSBjbG9ja3Mg
YXJlCgppbXBsZW1lbnRlZCBpbiB0aGUgQm9vdGxvYWRlciBCTDMxLgoKClBsZWFzZSBhc2sgdGhl
IEtoYWRhcyB0ZWFtIHRvIGNvbnRhY3QgQW1sb2dpY8KgZm9yIHRoZSBsYXRlc3QgQm9vdGxvYWRl
ciAKdmVyc2lvbiwgdGhlbiB5b3UgY2FuIHVzZQoKdGhlIGZpeGVkIHBsbCBhbmQgZmRpdnMgU0NN
SSBjbG9ja3MgZGVmaW5lZCBpbiAKaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3
LHNjbWkuaC4KClJlZmVyZW5jZToKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2luY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyx0Ny1zY21pLmgKCgo+Pj4gKwo+Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IHBsbF9tdWx0X3JhbmdlIHQ3X21lZGlhX3BsbF9tdWx0X3JhbmdlID0gewo+Pj4gICAgICAgLm1p
biA9IDEyNSwKPj4+ICAgICAgIC5tYXggPSAyNTAsCj4+PiBAQCAtMTA0Nyw2ICsxMDU2LDI1MyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX2Nsa2NfZGF0YSB0N19tY2xrX2RhdGEgPSB7Cj4+
PiAgICAgICB9LAo+Pj4gICB9Owo+Pj4KWy4uLl0KPgo+IC0tCj4gQmVzdCByZWdhcmRzLAo+IFJv
bmFsZAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
