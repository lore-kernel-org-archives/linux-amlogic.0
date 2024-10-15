Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1520ECFC273
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZeTbw53qFIRAmZ3FMSrGAUSVuv4e0nf8otv/nOWGaw=; b=LhGmAJ+HZGUPU8KQDip5I3DQHT
	EHFDYY7CMDbXJ11h0atUo5lGeD31WUCwSjLtGsiZO9tXEeCGFWwj1cwHMw9doCv4xuga8tS5FuDxd
	lzvwvBUk6MnlFc0HrpXaOiDnLTLTXHgoez6Iz5MqNjTjUBmCrV8Uax0JLNdrp5wTGRCrpxU84dGLT
	uZV4t3ulzq3LzWYD89r8FA/V+pEv46/pjayCyppftGafZumTf5Agn1z6bNzMeZPIr0zesX6rqpz+p
	xcNzVVpo2yxDkiR2PUmASK8yWoZHSW4UigxFadXJq5CAfJyV//UhKRduqKmCci0eWTbGgoNTNNVse
	asB5R6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cRP-00000007Pkc-09AK;
	Tue, 15 Oct 2024 07:58:03 +0000
Received: from mail-tyzapc01on20706.outbound.protection.outlook.com ([2a01:111:f403:2011::706] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cOb-00000007PFt-3E4M;
	Tue, 15 Oct 2024 07:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLg/YmNYsGbo9SMtA1b69Ax/NMtORkaUZOgijYTyKX3HNxKl7VKkKL2Wd8XvlPdBKiE8cvlzIfjd1VYYT3JxH4zeom8XOZtE+nDolcnoez0154tJH22IbY/x76Bw9NIAN+F+YFdsbPHBWZV1WpmlXk23Nhfc0dL8a27N4phJBmzpzTQWOuGi+uR4zqrwSWGjhQ/yOQrjSoVJEFS0Ujh7iEPjvlhEL5Ui0iqt0kjM6AO1VK0b7pyZNRwu8trRJo0vOtAoTcu4SlV2lY5c4oWSBd2HIMm1v0UPNDOcIX0t+phXkLm43X3vCe2Rqd/edw9k8dMVpF8IIw0AjgNC8p30QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbei5cKyrQM85/HKH6lzUp/OUAzxlIrZR2mKwar7/50=;
 b=vg4OeXC2h4W4WzD7EjRbYB74HyF2VABX2//W2amNFaU6ADTj1Y1D51okdUiYJkd74Uhht0tbQmI32V1HH6NuYjEYWU0sBrPiGCrgPeq9pQSHJ8AY96fA3tXsaH6ujr5UoBByDYSphsSmHU/2IVIpvirPt39RV8F5yszOY0daS0Mo91XTrU7TOjJuX1M6duqt7vfmofcacnIrYvYGl1aC9ruFEAUHcmqowjpdOLr9RU/QnHparkghxvW1kM+p3mAK4yZaQmd+XipF6J469uQue9OoU7bs58IvKdGEn9/bfLguJsJoDOSpWgpjsFGnsbVATAXpP6S1UfOTdHWEAK8wKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbei5cKyrQM85/HKH6lzUp/OUAzxlIrZR2mKwar7/50=;
 b=yVe+gXodpKyU/oUdJ2bpP716u8u8OYQr6Mo5KVzCAS4kqxOFA9iDl9VmtrU8DPe4z/17OlcIyzG3VFVBDbL3QpRsEhCvIH2Dn7XFloEilCl521PKwd+L5EhPe/J5/Qj9IlTtNdVJKmdOxy6N+Xm5IuGLnk30N8IoK82wNHYRUz/b6emqNPH8Lcu85XfRRKvAwX3qwwgFeJiXL+ayIVbVmDNM3pjeLFyqu7t5+fTpPQujGIqIxyvfQI+izya3R8amIPrGMuJYml8bCbJUjYZYA1+80L+8HNy3xY4gv1cgQaUNuBIqBeaK4HEUTTgpe1z6irWxLx4ljJYtyfyS5wYdUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7168.apcprd03.prod.outlook.com (2603:1096:101:d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 07:54:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 07:54:49 +0000
Message-ID: <1c054eb4-9ac1-4965-8847-d851b9fb1131@amlogic.com>
Date: Tue, 15 Oct 2024 15:54:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
 <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 111ce605-c570-4573-9b6e-08dceceea4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b29mSjlGeDJWZGZ5ejdDNUszT0RTN0FuVE1YT1poayttT0c2cnVXek84T2Ro?=
 =?utf-8?B?TTJsaS9ENTBtazdOYXh2WUJ5VDNWWE53QmhsN3Y3YklTT3lvNUYzaThpS1E4?=
 =?utf-8?B?amdrRnRLcFZ4TEpkQStWb1RFN2g5NWlMTzhhaCtNT0xZUVp1M3ZDdEo4ZHpB?=
 =?utf-8?B?Wi9Pdzdoa2RIVk1sT1d3R1pLM3FaN090TzlaZUE4SjNFdlZWcFF4cytVQ1ZH?=
 =?utf-8?B?bFBzZElpTUV4RFNsRFFaNzNKdXBScy9taXY4cUtyZERlTW82YVhrVDRqVHdw?=
 =?utf-8?B?dUNrZ1ptbDlBTTVjVjZaK2ttWXBGRFFQejVyalhuMWExU1RZWThkUlo0aGYr?=
 =?utf-8?B?dUd4MnhSd0czZDFQQktaUU4xckxpeC8yNEtmbFVCSGJNTmNkcjF0Tlc1L0t5?=
 =?utf-8?B?ZzlPYTNsb3QxUzltUytsd3NsTGRGQXpXM2FYb09vRElrZ2d0STErZDlxOE1B?=
 =?utf-8?B?QTdZMWZKMzlSYVVaRlJFcWFCMHYwV3Z5b205dkVaK3kyUlVIczJiWC9xeGpK?=
 =?utf-8?B?aHZKOWdsZEJyTEJnZXBkTXpkMUQyNjJKa2xLU3ErdWVtZWM0Q256Qk1EK0NL?=
 =?utf-8?B?WC9KaEErQTByWm1mcFpuMDFlTTk5NnpPR094cWc3eVcybllJV2YyNjBoZjVJ?=
 =?utf-8?B?UTI5elBsZTQ5aVIwOEozdWlBa3JZSkprN3dlZWI1dHBMekdSSngrUWc0aEdn?=
 =?utf-8?B?cUZacFVveWp5Zkduck93ZjRFdjcvdHNJWDc1TTNvV1VhOExwN0NCZWhLbFQr?=
 =?utf-8?B?eEo1SkdweDBlVmdrdVA0L2VTUkFzS2t6Tll4L2RQYUFkK2VpYXJnOXZ0TzMx?=
 =?utf-8?B?SXZiVGlJMytpUFA4N0lzdGx1UXRMMXRaWmU4K0N6ditxTEVWdWNXSXM2d2R2?=
 =?utf-8?B?QVgrSmlrYlM1cHVHdWwvVU1qL2RndkR5VFlhQk50VVI3U2NicGRnL09aMFdC?=
 =?utf-8?B?ei9EcGF2ZS9kbUt0emd6M2RRMzl2R05BYzRzdk85a0tna0trTVlyak1HTkZh?=
 =?utf-8?B?aHp4bE1WeVZpRWNhWXZZYk01SHlNNm80SWwvMzhJdzZDMUVtK242aUV1TzVj?=
 =?utf-8?B?dmcwV1piS25yMElBdFdHU1ZoUURodlJ6bHBHRUNPWDArM0ZDVkE3dXlaSWZo?=
 =?utf-8?B?Z2VWTTF5OVBaQ3dvc0tKOUk0ZVdJS2RqVjZ0cW92ajJYZFFBeHdhRC9BWUMz?=
 =?utf-8?B?UCtkQ1l5YS82RnFiT2ZaKy8rY2MrVGFUc0FKOFQvdWNJN0RvRXIxQWxoMTZD?=
 =?utf-8?B?MC9Sa0h0b3gweFk2d2xUYW1VbzFpejVsNXdEY0JyazFaTDJLTjNSWEZ1WTNq?=
 =?utf-8?B?NDk3SU1lSkI4ZlBnbTRBSDcrMzRsMTg1eHNqRTVxcFhZdFpJQXFVWDI0RUZm?=
 =?utf-8?B?ZkVabU85NTJCV3pWbGliQTAvR005NFM4TG1DaGJSRG9IeWhONnE4M0cyVG9M?=
 =?utf-8?B?OXU4eTU3UXJETFpqMTM2endIOEE5Tng0SmRERUYwb2ZtTTNOSnVsL1lFUlB6?=
 =?utf-8?B?eENWeHNBZzBQQ1RnbFV5d1Fxd0NyU01IaGRxM29wOVBGYytlL0NuSmFpTUg1?=
 =?utf-8?B?a3ZPQW5zSm9QZC8zOFNrVXE5Z0tkK09iSk9ubzdSRkFBdlA0VEk4UkFKZmg2?=
 =?utf-8?B?K0JoQ2JBa3F1Wm9ySnVEWFU0VlFWSGhoYkgwTGM2Qy9TNmFnMGNJQXV1WEEx?=
 =?utf-8?B?ZnRzQVNTN3lDOFphSFlheXBlb3V4VjVmVXdtS25SbXViN2FrYy83QWl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnpGc3VsY216MC94S2FHSitIRWtDSTdDNjBqb1p6VTE2dlZ6ZXZnaElMQkhy?=
 =?utf-8?B?MzVlN1hkV0dhaTNHVkxOOWRib0w5SVpIWEx0SGEwS2lqZmZ4Wk42Z1lWREdF?=
 =?utf-8?B?Vkcyd0hrSGE4a2o5VUpWY2VNUFlKMzdmdzFlSjJkVVJCTkdnN1BySlhwd21L?=
 =?utf-8?B?OTE3MEZyS2pBSVZDaExTajM0RzJNQy9wbm54NWpzOFN1M3dGZlM3UklUcUU2?=
 =?utf-8?B?aVNpZjg2VXVoUFMxTThsTGswc2YxSXN4RzhVSlAxYUVtWFdMelNWVDMyNC9W?=
 =?utf-8?B?dEQ2UCttQ0lFUTlJQXo4THZPVG1wKyt4Y3NuekpFckxyRFhFSEVRWFN6NEU2?=
 =?utf-8?B?NnZzdUZTZ3pZUmd2b2lRRHp3VlpXVnhRVGJjWUU0OVZsMUsxOXpJNytBREJB?=
 =?utf-8?B?Rm13dkYwUGpnR01KZnZuYTNqWUVPM0hNeDVJb3A4VC9GWnQ1d2lEOElmbkZP?=
 =?utf-8?B?bXk2aGNuaXVLaHVVOXdiZ1c3U2ZIejVvK0ExQXNIaG9TaW1OdnJwYXBmZGw0?=
 =?utf-8?B?dC8vdTVETEFoaWF1NFVVMG8xNnVLczRNM2xicjJLMVEvc0I2RFJza0RYUEtG?=
 =?utf-8?B?TklBMHBGbzhSakUrOXR5REFJeGg0MEFXTDhKTnplQ2tLanNhcXpRYi9UeENt?=
 =?utf-8?B?N2MvVnNWRnQ1RHF1QWcyZ284eUU2RlpYMUVaQXpodGVtM21RM0g0S05LVE1W?=
 =?utf-8?B?U004cTZSdE0zVCszOFlFVlQyNEtMRGNid0l0V3JaZnQzVUF4ckw4L0piOWIw?=
 =?utf-8?B?VzhNcUs3V2MrL1Q3aHFOTW1BWEdycG0rL3BUOG5Ec2xoUDZoaTBjTkJUTHBW?=
 =?utf-8?B?YUhCdENVVTNZd0VHL3NnVElTMUhYRmZQY3JpMzZCRnRIMmFTc3J4TjF0eHI5?=
 =?utf-8?B?VDJramgyeDJHbnpZZVYxeWFPYXBmeC9TRlBud0VrUW9lMkYwZFZaRk5lNHRn?=
 =?utf-8?B?SkxSc3VDVHMvWWVoRmRQalZzNjNnZFQ0TWdhbjVERmpyVE5kMk81NzFyS2V1?=
 =?utf-8?B?bUdoc0lCMjZ0SlU2Q1BpL09WQmc2ZElpR3UwdWo2TnpoQnFQK2NiQmJtK0xw?=
 =?utf-8?B?WVJ0dTRqdk5GbThFeXduMklHS2Jyb1Z2dExFdUNuQUVUTXJKKzdnVktia1d1?=
 =?utf-8?B?NC9ST1pKUmM2R0N5cWtwZTVpZHpkcG5vUDFsOXZtQ0RZVm53U2FTNVBKcXBh?=
 =?utf-8?B?N2h4MVJtcnoyaCtNaCtsQmFvbHlUckFmc1F0YVhtYnplb0JzWFpVajd2ajhI?=
 =?utf-8?B?emVyN0J3V1hYckdvU2paK3k4dUNaSS9IdkR1TGZ4UzJoMEZGbGt0UmVMYWJh?=
 =?utf-8?B?NkFxaytGWjJQQnJtM2NMbiswR2tYZW9aMlZkVTZhVHpYR3IwbmkzVDh5Y2k2?=
 =?utf-8?B?d0w1K2FndHhJMkgyWWU0eTRyY3JJQnVySWMxTDJLR1ZCYmV3UTIwdng0Q2Fj?=
 =?utf-8?B?NXNLbERsVm9TUUNkV1RkZ2pFa0U1UVdvMWo3dE5WMnFtTXF5c3Nqa29hNDk1?=
 =?utf-8?B?R3ZKSzIxTGFLVXljUUtXRFFvTzFZRWsvcVp4dnNyRUExSTFxMGE1em9obFZP?=
 =?utf-8?B?WkNnVjlMTWtXTEkrc25YeUhZdmZsTHMxQm1xRGlQUUU5U05oUUVhWG1tOVF4?=
 =?utf-8?B?K3dzN3NURG9jWWZDWHUwWTFQRjRIVnNvQlVFMTJReGV5WmZSN1V1aEZHTlU5?=
 =?utf-8?B?OXpoWFBPQUtOdmpPRVVsaEdQcDFEWGdsZmVkalp0d1J3SFNSQ2VDTUNGRnZK?=
 =?utf-8?B?N0pDSG9TcGsvbDhCa1BnWDFHenRHeVNUdHduNU1UVjBDN25mbmVCM0tXRTc2?=
 =?utf-8?B?UFBjVFJSZlpKVXFKVUdVSUdYWVNDQ3Y1N0EzazV4OWlIeGVDWE15bEoxNDhZ?=
 =?utf-8?B?MFNxTVo2d1NJSjNhMTBlRjdGdCtQcjJMUkNTb0xPY3FpSUFwb0NCQnVicTFk?=
 =?utf-8?B?VnpPSkEzMy90RGtTVWhVSFlHcEFuVGV3NGQwSjVsZW5GZ29TMVBPUHRWYlBm?=
 =?utf-8?B?TExtc3VkQnNrOUFtTmZCS1FrRWhocFVYbXFER0NhcTNRa3hWa2N5djZnQmF4?=
 =?utf-8?B?ckVNNHlNTGFpcHlGNWw4RnBEKzlJNHB4SzlZOXdDZHhqNVVOSytyTTl3RUx3?=
 =?utf-8?B?YVlJNXNTNjNGUGxLRVdhL0pueTZDVHc5dW5aSzBUY3FoK3UyVFJZQVUraW1L?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111ce605-c570-4573-9b6e-08dceceea4c6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 07:54:49.1909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ljuyrud7f+359+gZ8hgfcb7GyTucoQ9/UFqlae7LER6LhS0to00a/Td8yRVDHfE7ZMgb6meN1TPXLpA78Ky0HoUyWyEribMOdHmyM/75qFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_005509_836848_28E7EDA3 
X-CRM114-Status: GOOD (  17.40  )
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
     Thanks for your reply.

On 2024/10/15 14:01, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>> the same register layout as the previous Amlogic S4.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/pinctrl/meson/Kconfig              |    6 +
>>   drivers/pinctrl/meson/Makefile             |    1 +
>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>>   3 files changed, 1183 insertions(+)
>>
>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>> index cc397896762c..3e90bb5ec442 100644
>> --- a/drivers/pinctrl/meson/Kconfig
>> +++ b/drivers/pinctrl/meson/Kconfig
>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>        select PINCTRL_MESON_AXG_PMX
>>        default y
>>
>> +config PINCTRL_AMLOGIC_A4
>> +     tristate "Amlogic A4 SoC pinctrl driver"
>> +     depends on ARM64
>> +     select PINCTRL_MESON_AXG_PMX
>> +     default y
>> +
>>   config PINCTRL_AMLOGIC_C3
>>        tristate "Amlogic C3 SoC pinctrl driver"
>>        depends on ARM64
>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>> index 9e538b9ffb9b..c92a65a83344 100644
>> --- a/drivers/pinctrl/meson/Makefile
>> +++ b/drivers/pinctrl/meson/Makefile
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>   obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>   obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>   obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>   obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>   obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>> new file mode 100644
>> index 000000000000..dee1ae43edb5
>> --- /dev/null
>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>> @@ -0,0 +1,1176 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>> + *
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>> + */
>> +
>> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
> 
> I do not see any usage of it.
> 

The header file "amlogic-a4-gpio.h"  is used by AMLOGIC_PIN and 
GPIO_GROUP_V2, The code used  is  AMLOGIC_GPIO().
This is binding definition.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
