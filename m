Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DA8C624D0
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhPCqwDiyWaPAcrbqSG/2F4ge/IjVHDaxEu3ECHpVVA=; b=Bu7kop0NEeRgpQiVCacgzwyZaD
	1L2AnKBeCjL7EACwOoGm6cPP3U0+6edVaLTk2olZcn7z9FSkHvXqic7LwhOjU46FuTaDM3CJIFGZI
	aBnVNHhPmpEsC+E4dOA9Bx6D7FsIkOGkqLZ6vh+DUk70dY9VmnxgVQ+7EmYqYclEKUJlF6HJMF/7R
	lRRpdFdTYOoKWzMZTIwJiV6CNrD0OYX1ck6LNaGfgrTSYWb+74p27E/Fu4f43F+ehze5VGITqMlKH
	k8zRV5hSjCyiZIkUv39t6XXCA6PVmWyLuDGPs3qZe3D/tkZP8sYR7i0jMm1ksm0x0JFADEz3UZ+tD
	oWejZd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bf5-0000000Dii2-0W4J;
	Wed, 02 Sep 2026 03:29:19 +0000
Received: from mail-japaneastazon11022101.outbound.protection.outlook.com ([52.101.126.101] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bf2-0000000Dihe-2vGn
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 03:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkOURdDbss6HWZk+xLDekNDEVmx+e0IzCLnUY8svzhFKMgkIrw+57R9NWhzc/mEjbIWIbscnKvtoZyVwDZ3AAyHfQZzRbvXIrYbWInFzMNcJ1X/3LCZIwD2e4fVkSv8h3V6gO7BKSfYc4blsA4xKCLBWjTy43OaS7RSGIVjTFVICL8+6ziCwa2qO+ukM5gFjQbYC+bbAXVY0Kx25z7T508Mfmt1s1vSN5tG6fi3ecuUWK3r+l66ZOPZZlXAadvXXFqRwky13xrA0+AhRp7iGOAgD1fnf951d5LCV91pVIy0Lsmtuybc0oUf/6VuPj7Ft/pBCpLyWqv5ZoYTgtF15XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VIHzRMEqLra/NYhZB7lgnjz5/c1uVV0eumWn6BXXXQ=;
 b=le06MI9Vr75D1lQrqugFPhxvUwb59hLB4PB0DFhTO3zxUj/D1ZRTKjZZ3hwLg3lEyjbpECMMCAPJ9cSrYCGS9y7AIcQILULMtW9RpJRG55Kb/Bp1+FFBi9J7V4uyCFUDHbpt3y2RXnfukhWk/3jpCQShFFlmk00Erm6Kn4FTpmNcR4njeV9YllJh7CMhvBk8k+JKdMoAJHz1/WHjzNRA4TWjCjfDi/rQ10tYe9dipbwzml21YdMRqcwO5h7dAS663s0NEEFcNxnW49MQiJ9mW/1UDgfVg1i8tBa5Qf4MPW7q7RfBkMa3zP3oGHsPGrhfDYl80eR6nEmUOYjZHRCT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VIHzRMEqLra/NYhZB7lgnjz5/c1uVV0eumWn6BXXXQ=;
 b=GPBESyjdLkEFQLJrdhpUbtOJvskUTGPPfVgiCCvveTYkwpPiYbPxzvzONd3RI9PUb0LWm/Va23SyyHXUD64TO+oA0atqyUWiMjmFfJTlNtMz08STcEVz3yDLp3tLKpNNZkkGSb8QhtNuVHysUIslWAfE/CKTTMlk2sWzpLbcQ/SsdXtRNXDzVLn7/MVD8A/hgI5Gcrfz7drSXmoa6ufIu1XpxDT5YwIePnD34i3lvZgcZZ8Uskv+TrzUAJRK5C93ty1bkoiJNHs8LxJEfcjMcbYfKf16pklCfaEaFyDNs2veVDTg3yVfCdUZ+S2iZEst+6OWCL0xwauSs3Lx5pwAEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE3PR03MB10557.apcprd03.prod.outlook.com (2603:1096:101:31e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:29:04 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 03:29:04 +0000
Message-ID: <01df64f7-2993-44ce-96b5-b119c4dd20cf@amlogic.com>
Date: Wed, 2 Sep 2026 11:28:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: amlogic-a4: clear unsupported update interrupt
 feature
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624-rtc-feature-v1-1-42dccd22c0ee@amlogic.com>
 <20260819133602f197f6b5@mail.local>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260819133602f197f6b5@mail.local>
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE3PR03MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9132d98f-c760-4af6-658f-08df08a25692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|4143699003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: MbIiSakGGRLAiOkJV1CXsLsXVxcIxn46svIztEzoGKbh2PpsKDMQ6CZTXSuaglBnnhNLijFbHu36CI5bOrSJIGezDQFoRRnVzTiI/UU8iLO1pD6yJIAaowZbrhHlNRpjT1RQDL1mJ0pbCfnicCUETYEsKLySgnTnRUewB3CUisXcQKDfDwxf7/mguQtW08SSbo9vJMw2K1GAPyRLYl8GR30w1PdfvrQ+edS01S4qX3xuzednmTaxZXx+6h66k7J88mFLjEbeUX5e73Tn3wH5yIVU/eqaltj+7AFl1McOJIASNE70JHpZUJ+PBc0yzI20NhE/vOZ62aivwNvYuTqDTUjm6y6vMNGAAgk+HDT+GQ6MH9Xp0JbwUJwUeB+Eu6GZFXZQBxwpaoOETiCuceN6DkPikEDWLZPxY2WRSs3HfQQkA9x4hqQ7qxYbcN3a9Cibi5YMCP6R8fShH+qUMjirBqcyyWBULOlg8SLhxKhf7cRGHDDqBiCncm9Ar6ykEkkFLrgtKuO6vJCeMj8p4Clf9Azg6OD5YivUzNe3f4q2OyzEMnCp/CKJFQuZK9sak9qIlHUTXdDubSfjpvfyEgxDAOverYgNMcQVVE/caILBshlTd7ZI8jcuVBgp949sN5yPEN2qNeVLoL4SQHY9EOD26sYRKh7FQX9Dlsev5SEU0Og=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(4143699003)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJPVFdRckZiU0dIL1k2RkNUK1g5Q3BNU1JCbjFSZUpkeTJRck56MEFUVFJB?=
 =?utf-8?B?SkJWMlY0ODFFZ0dmY3JWT3hhWklrSzFOWmtjYTdVbklVZnFZemZ4bFZiRlJX?=
 =?utf-8?B?SHQ1UHlaeTJYR0laajZyWTdJSVpZZnpzZDNhRENJTDltQm0rck5HNTZ1bXd1?=
 =?utf-8?B?M2tNZ0orV3N0MVgrMXpFaURPM1MxcjRiS1duYy96ZHNLZFhoUy91NklJWDZj?=
 =?utf-8?B?bGZiTDJWY0gxbVZYWUhkVHVHTjBLR1FxcExIWE9MczQ1TWR3T1Z0aXF0VHRp?=
 =?utf-8?B?ZWR2QkZ0YmtEaXo3cnNiekZWM2FPV3BrZkt6VHFabjlwQ0IwV1FqZWVpVXBQ?=
 =?utf-8?B?OUJQYy9ZdU1VeXZ1N0dwbXNWbWE3aXM5ZG1ZVmtjMlhtVm9aTERNVkdkWnpJ?=
 =?utf-8?B?c2FwWE9LTXpCemhzb2FCOVdieEczbUdQOFpyZERZRG5DMkNuSVl4U1liK0ZH?=
 =?utf-8?B?WWFwdWVSWitNR1AyOE1JUjlhaWxrK1F4YVBCSjdVUFd0Y0plT1ZrM3Bma1Bv?=
 =?utf-8?B?WVVNa3QybnBuZWE1T2wyNG1VUWZRTjk3Ti9lQm5GMnlBcHpWNTlQanlwYUNS?=
 =?utf-8?B?OVNqaFJYQjdGelBEalNoS1ZqUmxDSmVFRkU5NkU2T2ZOdmlBMnB5OE1lSThK?=
 =?utf-8?B?Mi8wNVo1TXFOUU1YYmpHWkNwWjJPV04zeUVMSVVGb0JpQXVkTjJUYkQzSUV2?=
 =?utf-8?B?SzlEMllSRUhyN0NpR3RFVi9zM3VyblZNT3h2dVA3THJNaWlXdEpSeUZYMU1H?=
 =?utf-8?B?RGorYld6OW5vS3l3OEpRYWxrejAycnZWd3VuSG94Wlg1RFdkOWZoQUJCUDlq?=
 =?utf-8?B?aE9kUmwrTGhHai9heXNIK0NrckZzMnMraXlOV0g4S2d6QTA0LzNnaklURVpp?=
 =?utf-8?B?NEorR3ZYMUxVS0ZXbm9lb1BZNytIcDJORUNrNG9rQTFsMTk0UmgxMHhYMHdt?=
 =?utf-8?B?MEVnWUdsYWRKRDlwano3bUVQRUpiRHAvVit0d2JaNTlWVmEyZWlwTDVPeGo0?=
 =?utf-8?B?dnlETXIyenRZQ2g0TjlPM3dmMkhkUTFEanN6OXFGZEpCdGs3eVI5SGl6SGtn?=
 =?utf-8?B?RThqYUFhd2tlZ1VJN1I0K2lXYUpWRnkrTFVFU0hVZGlUZFphL0Q2RWo0Wllx?=
 =?utf-8?B?dzVhZ0RNbG1IY2M2NUNxNFordVQwRDNYRHBRand2MjhSZVhzRi9aSEJFWTg1?=
 =?utf-8?B?cVgwM2U3N29rTVIyMGxsVHRFeHk3YktmTWRMNFMzVzY3NmgreThwdnIyZmQ0?=
 =?utf-8?B?RVRrMXFGUEgrNTIwb0REQ3dQRXVpVkVuQTREMXpHK0d6S3J6N3FDVmZIaUdW?=
 =?utf-8?B?dnkvdm5uc1U5S25od0NqbThIVGVsemNURjdvTnlnRGtWRUdlejMzbm8yMnpt?=
 =?utf-8?B?V3lhbjl5eHNCVGFIVHFIWk5OYmNPMVNyL3c1ZEp3UUN5OUJpRTlQZ1d1OEtr?=
 =?utf-8?B?dzZ1bGtYSlU4cUswL1VWdnZTWlZWTEo0UkdiNzBZWDdaZ05JOXdrS0VXWTh3?=
 =?utf-8?B?WGV6c2hVWjUycVY4K29vS1ZxckxoQ3dVSjNvM0VMRzhYbXk3SDZyVHRzem9t?=
 =?utf-8?B?OEdxV2N0RUQrazc4OVVUMGh1cmRjM1pHcDBYcGp4WG8vcG1UUWZoUlQ0TTh0?=
 =?utf-8?B?MkxucVYxU2I2bzUwOTB5TzdmNjJuUjRoaFVFOWI1ZjBSNEhqMVJ5UWxhNGpX?=
 =?utf-8?B?Um5VWVNtOFpzcCtrZWh2aGZFNkdtWjFqcU9PYXZXeVJxMFNmWEV2NkZGWkVz?=
 =?utf-8?B?cTgrOFdtZFhaQXNvek9SYjluTFdHN0VaNEs5dDZneGx0R0hEK3QrKzA2RzF6?=
 =?utf-8?B?elFTVlk0YytsakY2bmIzc1NqcFllVzcvZ2d2ZzRWOHBlSEd2WlRxS1l1Ky9E?=
 =?utf-8?B?ajB1VW5aOWZXc29OVUg3R3VZaWVVcGtaSjliVnFvWlFpczVteGdaaDZxV1ZO?=
 =?utf-8?B?Y0FhcGdDQ2RxQVh0R01GTDVIOUxXd1JrQlZuYXBJQ2F5Z0VaRWQ2MTQzYXcy?=
 =?utf-8?B?Z0toS1VLR0Z3S2g1VlA1WFMzbWYrRG1ZTG12VGpEQlFpNkVoaDFqSzNjdk80?=
 =?utf-8?B?R3FMeUFVa2MrdkVFUEk1MlZPRkw1QTYyMFpqMDhtdzgvS3NPbG9Sb1BFQlNK?=
 =?utf-8?B?ZzFJQnBBci9TK1EvTFJ2MW4wMDVERGdFWmh1c0FqVWIrZy85QU5YT1VpSlNZ?=
 =?utf-8?B?eEZ6TmJBUlV3TjhXNUVNWXFtUFQ2VThkSTB0bmp1VGNITUVRTnQ4cndwSUtE?=
 =?utf-8?B?VGhjb2F4djl6bTVES2p3TDVhcmN4N3dSU3U5RStWQkpSQnJKbVduSmU0Y1Nj?=
 =?utf-8?B?dXpHNFdlU1RCSXVCNXY0L041UndNSVlJWVZYOVlSRXJjYmpsT0VRQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9132d98f-c760-4af6-658f-08df08a25692
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:29:04.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUYRUCBMXF2IQ4qdUmi73bEHWhFkFXG03tzovPPEMyrxWkldIgCwiP56qUb39NtbfGtWUUDgqiUvrny5L/YIjTxFKOPUKHX4iHo8EX4xxgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_202916_776714_6696CBEA 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Alexandre,
    Thanks for your review.

On 2026/8/19 21:36, Alexandre Belloni wrote:
> Hello,
> 
> On 24/06/2026 07:24:34+0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> The Amlogic A4 RTC does not support update interrupt. Clear
>> RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device to
>> prevent userspace from enabling an unsupported RTC UIE function.
>>
> Because the driver supports alarms, it should support UIE. Is there any
> reason the RTC can't handle arming alarms every seconds?
> There are some that would only support alarms avery 2s, in that case,
> please set RTC_FEATURE_ALARM_RES_2S.
> 

Got it, Amlogic RTC support every seconds. Please ignore this patch.

>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>> Clear RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device.
>> ---
>>   drivers/rtc/rtc-amlogic-a4.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
>> index 50938c35af36..116cf095a9e9 100644
>> --- a/drivers/rtc/rtc-amlogic-a4.c
>> +++ b/drivers/rtc/rtc-amlogic-a4.c
>> @@ -379,6 +379,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
>>        rtc->rtc_dev->ops = &aml_rtc_ops;
>>        rtc->rtc_dev->range_min = 0;
>>        rtc->rtc_dev->range_max = U32_MAX;
>> +     clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
>>
>>        return devm_rtc_register_device(rtc->rtc_dev);
>>   }
>>
>> ---
>> base-commit: 851d961ff248218f681c53cf0f7f08cf8201a117
>> change-id: 20260624-rtc-feature-03ce3f3843a9
>>
>> Best regards,
>> --
>> Xianwei Zhao<xianwei.zhao@amlogic.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
