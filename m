Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6214CCD8CA8
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 03:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcPlqpKQ6uvnpiacA/m1h8dV93gWmvBXML0H8prrLi0=; b=PdRC18M33vmlifLOOeoQVMDnY8
	hoRfr/JPPhQutYl0eMh9ZKmzcAdCAV9qeZQGYzsw3J+/nE4Fqpfy3hFmzzi2obP1GDnf87ulMdDR1
	Wn+Fei1XHdq/SrEjMQVUd83Rm5m4BsLyrI5QBvNOd+NfyKW5xq/+YJW6maGtpXHL9JvRIHethJeM9
	YrB2jF0trJa+TdNkrHx5jFWLrAjC/o591V9qEW+buPZlsyoCYqyxDiiYTiNzKcKsK8PRmCPzqYioa
	PMgXRgYl+YejO526KUnuK19cA4qsRUOcp/xF2tc9kQJ/3yxAEXWiZXPHSHhmqVj+oNUM4NtW/0l96
	7+3m3QMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxpk-0000000DVek-1r0G;
	Mon, 15 Jun 2026 03:17:56 +0000
Received: from mail-japaneastazon11022139.outbound.protection.outlook.com ([52.101.126.139] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxph-0000000DVdZ-3OK7;
	Mon, 15 Jun 2026 03:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=An59WCojwcl4K9Ve4upKQDakRtaUUPUKVlB+ApfSX5ByBJFdAq6t1V8RVd/5V4alV6FnCM9N+jI3RGeTn0gGsjrT5C7YXpgLM5y9NTqQkEkuvxzd9dLwFvEYx+6Ll/G0ROP0zw84L2f1QN77shlDd5PnEhiSC0vrJet13a5r0oFLy2fGxHIbfqSUkKkLyH++Y0ZWrGDONY7pq86HkPglMpzg6mC3pGn4lZwru/RELAdZAFCg2DrK10ii1SFzw/hnZSQiKt5reICN+ifO9A12PBsMPUH4zNGZ85LDG2yxhxsDD6HorghmTVu+QKqoFM+KYrCcscOYoii8uNO3tb0s6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7w6QSWK/VRf0meUYrWL8P3vpu8zRty70t/tG2UjlXs=;
 b=os4KOCFL9Zl43b3vWYWX3QOiHrhlQZsPHTGSm8El8rBCRchMmWnrqQaS2AFFHaPcgVSsI5iHrumsUljYgPXthZ6F/xD8FGiUikMlbhwSHhAaxLAbWMmtdXFeQmPrBbo7YYZ9huDxJ/8L0THLak1eImtPKUo20YMtMQFDIH3TKVqDXyy5yav+/S8/KD09Vu5jEapyK27vvVUAP5+j0knFwajqYLZ0nEzeKQSg+KllTg5XPj+iG/4/PF1tiAU4lCS1P/ELr4/2aeNFd9CaRIRcS0ghUX5qqxUM+kuqvt0enQAjwd+Gk0yobJyxEKRnZwmJKck8OYVjxbwUlzq+98NYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7w6QSWK/VRf0meUYrWL8P3vpu8zRty70t/tG2UjlXs=;
 b=n6S+PqXavwyPaKhijTuND+cAsXbR9JuVWzfnm5q9mSDdW5rNzfdxcTVBTAvF0rjYj4H3zCHwxqYpv9ZjjiwlPfeW3eGh/PDdlpHqono+BWpniLYY9j3+/34C/7pSeM3xCffCc/pvxy+psoJZR3Jb5SSDzyBH0gzWsz4fzQN0dACavjUT0M+TGR8CxH+n2CMv3PhRcBw5QSF7ynF1qKCEuDQedk3LwH1UFD5gM7Hw5eDAKslNokqAtx0IVbU5hqSc760vI5RhnhKplVgveXz7q4TBr86srDxv8qOJT9NAZNZjLsvqb7XS37LqFHo+VUedyKSSLqfg97VZHn4bdJ+j6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7446.apcprd03.prod.outlook.com (2603:1096:990:1b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 15 Jun
 2026 03:17:46 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Mon, 15 Jun 2026
 03:17:45 +0000
Message-ID: <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
Date: Mon, 15 Jun 2026 11:17:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: bd72f85d-855e-4765-40e9-08deca8cabad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|5023799004|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Elj3K5aTngzJDy9m13G4huts862AmcqunZFcIxwyO7L/dhnyxr+2VI+6cr0dfLZRQ5Mdm3t17STP43hqNri1BE1+AL6t4dz1++ByoM/iyRZYF3vfwEM36VawQL81qt1imW7suu1bYJYsF2OFrXNzUCIJYJXh4uHZ3gFKm9TF5WoF17F2EqYjRsYAR7lQ5Mv9VDHkqEil+TE9B1wheLdxFVojbEblHp6NjwCprHlpL9mqbZCo7DjaXK1PyuXqg/+xBX9/6bt01KoR7bGqQq21sdQ2PjSG4ExFyFt2fQ0jZzGCiSLYztoRLrWB7v5PjtDfn77TAHE+IgXUSYrOmlWFyWvgvXAx7VpJLL7b81RpNxd2adz7OWUpWzf8dZSFnvrJIDxn6n85l70NtkYETEAbHAoK7YE9lWtuuAvqB1mH64BbT/hSvvr+R1LYTUbc0JNynSGlf5BNpOVCZNpOUnDxzuzzu1wHWV4qPFNJtjk8AI8cpbry7qDeczNZRMn2L85g5D52j4WXvwM2vtdiJhr/+vTBD09HRL8WvY2cc11FEGCjFDJvwtC3D8Nf64CStM3yiqpDQvZs4p0wVde/auOv0hqHvnQFZYxkCuK26iuwD45uHzZwERHEDr8/1MB0OXF/48pqwj5dSrYUSX3mTEdU0QiOqOorTToIL0XWfkz84v2ToRlg0L/2/a5Cb9jDPr6/nshHlqmR4nH7LlPSCLsNtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VvbWFiZHM0cURQNUpZdUo4dHNVQmlqY1RSQkFXbSt4SHN2RmR1L1pWUGlx?=
 =?utf-8?B?UStFNzNHTlVCQ3UwbzRkbTZ1M3lTUDVUQXo1T1RTSHdzNXp0T1YxeEw3T1pn?=
 =?utf-8?B?Zmp2cS9KSExPUFlUZTRtTHduQW9xUllrK1hKeXZRVzZTZ2lnR09uNzVraGx5?=
 =?utf-8?B?dklCalRkQlVmZ0dNQitWaEExTEt0ZjBUbnNtQktsSFY3Mm5qNldwTHpwME5Q?=
 =?utf-8?B?TzFrSEY3WDVWWnBYWkNtMDk4VCtjdHJEemJWNkZmMXBvRTc3N1crT2xta0xn?=
 =?utf-8?B?NTIrQjhMUGF3R1ZseXRyRW1hSmMrb0tiV0sya3k5eTZuUkNPNGVENG9pZTJw?=
 =?utf-8?B?UzFMR3A0QWN3alZEcnBxSGVxOEd1cXhSczVJTFpXQWFJT01JRitvU3VIZDA1?=
 =?utf-8?B?eHdRRy9OOHBYT3doaWZZSGNnWndnSGF6anBITEkvdGhnV0VqeC83M0xVWFVY?=
 =?utf-8?B?ZmwrMVdZei9WRHBxQU44VFVOUGNsVUQrczNvdE9CT1V4TWxZSFNmRzdyRDRv?=
 =?utf-8?B?UVo3cXZ5M0o5clZBemJMM3ppTkJPQndyTU9DWW52TFNxYi80WFB0RkNseFRh?=
 =?utf-8?B?Wnl2SkJmRmRtT3lMdmxhaWtRODhoMDVYeVZJMmdKSE9Yb2lkMnJZSGNYc01r?=
 =?utf-8?B?VkkwZnhuZjFQYi95OWZvZHRQL1EvNGYvSEkzQmxpWFhHajZVQ09hQWN4YnE4?=
 =?utf-8?B?djNjWkY4R1RMQzNYcG55VGs5Q0psV1ZpU05OQ01GVktBbEtZT1BkWmQ5MkNQ?=
 =?utf-8?B?TGtYRUZOa3hNd2RETzA0TTk2dW53UEhDYmR2NHg3RFk5cmhkaEh3c0F4T1V3?=
 =?utf-8?B?U2ZKQStwaEVTRmRlYjQ2UHhET2Nod1Jhd3pQREZ4N0dseWtnOWRNbGlHZjNv?=
 =?utf-8?B?Z2dXdHlZbWpnYTcwL3B2eVlia1BuT3BCNjY3ZVA4cUFWTFdTWkZxWmxNNDZy?=
 =?utf-8?B?R3dNQkowN2pLdU1xdXhLUUxsa1d2WjVRUVU1bm43L0JQUFNKa013OXRhZkEv?=
 =?utf-8?B?Ym9ZWW9xb3J0WTg2cE9rWnAwRDdreGxKWFVTVHQxVElVbTh5WmcraDBLYXho?=
 =?utf-8?B?NlNRTWlNbGRhU3JvakVBekp4VUVmd2xZc2tya1RLQjVoQmk3bWJ5Q29LKzlB?=
 =?utf-8?B?eHB2R3RSQkNIUWZKbENTcXpWN1BBbVQxQ2pwdEdja0x6R0xUVlE2K0tFQ01Q?=
 =?utf-8?B?S08ydnI2T3diS2hVU3F3VjFsK2N5Z0RIOFFyZUVJNjBqbnNkbGtlQ3VlVUd1?=
 =?utf-8?B?SzEvcGd3VU14YlFPUGxEMVVaV1RkSnRGTUM0Q2tTTXVhQ3JGOVQ3U2o4eTcx?=
 =?utf-8?B?Rk1KUFJ3cDJlQ1FhbzV1OFlablV4OXNmcUZLNGc0UnlwNzl0eGpULzlpSTRI?=
 =?utf-8?B?dkdtR2ZMZVB0Q2g5QU9EQzg3R1FwckFrc3BoYTZZcFNBb1piSVVNNFpaNWVL?=
 =?utf-8?B?Sng2Yi9oN2c3WW9nVUdkVS9Hd1J3dm0zbFYyODZ1STArRkFCUFkwQ3FwVzdi?=
 =?utf-8?B?QzIyNGxlMEQ5bTltZmRYWTVsSUpYMVZ5Sk1TdVVWYis1S0lJbmtkdzNIQm1k?=
 =?utf-8?B?VTR3QmJyNDJCOGFha2U3QjEwWEJHYVNHWkszNkpPMTI0endReXdoZk9Hcnkw?=
 =?utf-8?B?anBWZkdLK3NNUUdudUFGQnA0VVFRYmh0dTVUT0I5UStvOGltQTRoalFwUzRM?=
 =?utf-8?B?Uk9BUTRPNWVXNlpMVUsxU3REU2pneDIxeE5XR0UrTklkZ3BBSTZVVUJBc0JG?=
 =?utf-8?B?SC9xY1pCVndWdGlSZk1uWkxQSWhhUEVDV0ZiRmZLMldXdmtYUGJTWHlJMXZs?=
 =?utf-8?B?aENkUHRmb01tc0FEeGFsR0w4bkpBZ3pVVE5vSU1hcHBhcmxqcXJnY3hnSWlS?=
 =?utf-8?B?TVFXZHVTZGh2bUtQQ2pxZjhjb3puUGQyaHc5d1NUMXVHajB6RU9QOVNyMFZ6?=
 =?utf-8?B?azFhc1lSZXJ2RVFHMThQWEJWenJoZWwzZnZ3ZTdyOU5iQURtRVI5Ukw3VTdl?=
 =?utf-8?B?b0JGWmNLM0lrM1M5MDVuRWlSK2RlTWlrNmU1ZmJoazhzaTg1MSs3cE55N2NN?=
 =?utf-8?B?MG44a05WdWlPZnZ2WEhqaHBEdGsrNnprU1U5SnJaVmtVMzdra09weGNFZm5y?=
 =?utf-8?B?U1EwR3JSRTdIR0JpanRIUzVsWkxZMGVGYllaYnR6K3FxbTMwUFhXQkQ1WExo?=
 =?utf-8?B?RzdhK0hTZGswWm1IaDYweS9lZ04waHZQOGVQMVRHaURQN25LUVdsaVNmRUJk?=
 =?utf-8?B?UHA0NkNGaGplQUpYYXdhaHdKNnNtVmNlUDJNbTJ3SEYzd2ZQTjFnSFpFTitz?=
 =?utf-8?B?M2pvL3JzSmk2TWtrbnp5Q01SZS9NbUwrbE9MdmJPd1lZYTVuWG5uZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd72f85d-855e-4765-40e9-08deca8cabad
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:17:45.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gFzGy9CMHoAABIPiQzoQ3AE+dHnv+92YO9kWEiBKiHv4TZv17jSb/fYD9YUzBacTBC+oWgefZCu0pntoCOGOSubuS1igvc+TnXJ0fy70fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_201753_853994_178E8B6E 
X-CRM114-Status: GOOD (  19.24  )
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

SGkgTGludXMsCiAgICBUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNlIGFuZCByZXZpZXcuCgpPbiAy
MDI2LzYvMTEgMjA6NTEsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gSGkgWGlhbndlaSwKPiAKPiB0
aGFua3MgZm9yIHlvdXIgcGF0Y2hlcyEKPiAKPiBPbiBUaHUsIEp1biAxMSwgMjAyNiBhdCA5OjU0
4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK3hpYW53ZWkuemhhby5h
bWxvZ2ljLmNvbUBrZXJuZWwub3JnPiAgd3JvdGU6Cj4gCj4+IFNvbWUgdXNlcnMgbmVlZCB0byBv
YnRhaW4gYW4gSVJRIGRpcmVjdGx5IGZyb20gYSBHUElPIGRlc2NyaXB0b3IgdGhyb3VnaCBncGlv
ZF90b19pcnEoKS4KPj4gQWRkIHRoZSByZXF1aXJlZCBEVCBiaW5kaW5nIGFuZCBpbXBsZW1lbnRh
dGlvbiB0byBzdXBwb3J0IHRoaXMgdXNlIGNhc2UuCj4+IFNpbmNlIHRoaXMgaW50cm9kdWNlcyBh
IG5ldyBEVCBwcm9wZXJ0eSwgdGhlIHByb3BlcnR5IGlzIGtlcHQgb3B0aW9uYWwgdG8KPj4gbWFp
bnRhaW4gY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIFNvQ3MgYW5kIERUUyBmaWxlcy4KPiBU
byBtZSBpdCBsb29rcyBsaWtlIHlvdSBoYXZlIGp1c3QgcmUtaW1wbGVtZW50ZWQgaGllcmFyY2hp
Y2FsCj4gaXJxcy4KPiAKPiBMb29rIGludG8gdGhlIHNlY3Rpb24gIkluZnJhc3RydWN0dXJlIGhl
bHBlcnMgZm9yIEdQSU8gaXJxY2hpcHMiCj4gaW4gRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dw
aW8vZHJpdmVyLnJzdCwgZXNwZWNpYWxseSB0b3dhcmRzCj4gdGhlIGVuZC4KPiAKPiBTb2x2ZSB0
aGlzIGJ5IHVzaW5nIEdQSU9MSUJfSVJRQ0hJUCBhbmQgYSBjdXN0b20KPiBjaGlsZF90b19wYXJl
bnRfaHdpcnEoKSBjYWxsYmFjayB0byB0cmFuc2xhdGUgdGhlIEdQSU8gaW50bwo+IGFuIElSUS4K
PiAKPiBUbyBqdXN0IGltcGxlbWVudCBncGlvZF90b19pcnEoKSB3aXRob3V0IGFueSBpcnFjaGlw
IGFic3RyYWN0aW9uCj4gaXMgYWxzbyBicm9rZW46IHlvdSBjYW4ndCBmb3JjZSBhbGwgdXNlcnMg
dG8ganVzdCB1c2UgdGhpcyB3YXkKPiB0byBnZXQgYW4gSVJRIGl0J3MgZXhjZXNzaXZlbHkgcmVz
dHJpY3RpbmcuCj4gCj4gQWRkCj4gCj4gICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUKPiAK
PiAgICAiI2ludGVycnVwdC1jZWxscyI6Cj4gICAgICBjb25zdDogMgo+IAo+IHRvIHRoZSBwaW5j
dHJsIG5vZGUgYXMgd2VsbCBzbyB0aGF0IERUIHVzZXJzIGNhbiBzaW1wbHkgcmVxdWVzdAo+IHRo
ZSBJUlEgZnJvbSB0aGUgaXJxY2hpcCBpbnNpZGUgb2YgdGhlIHBpbiBjb250cm9sbGVyLiBJdCB3
aWxsCj4gYmUgaGllcmFyY2hpY2FsIGFuZCBsaWdodHdlaWdodCBidXQgYW4gaXJxY2hpcCBuZXZl
cnRoZWxlc3MuCj4gCj4gVGhlIEdQSU9MSUJfSVJRQ0hJUCBhcHByb2FjaCB3aWxsIGhlbHAgeW91
IHRvIGdldCB0aGlzCj4gcmlnaHQuCj4gCgpJIHJlYWQgdGhlIGRvY3VtZW50IChEb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvZ3Bpby9kcml2ZXIucnN0KSB5b3UgCnBvaW50ZWQgbWUgdG8gYW5kIGZv
dW5kIHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgaW1wbGVtZW50YXRpb24gaGFzIAphbHJlYWR5IGJl
ZW4gYWRkZWQgaW4gdGhpcyBmaWxlOgoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4
L2Jsb2IvbWFzdGVyL2RyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jCgpIb3dldmVyLCBp
dCBpcyBpbXBsZW1lbnRlZCBhcyBhIHN0YW5kYWxvbmUgaXJxY2hpcCBhbmQgaXMgbm90IGludGVn
cmF0ZWQgCndpdGggdGhlIEdQSU8gY29udHJvbGxlci4KCkluIHRoaXMgcGF0Y2gsIEkgaW1wbGVt
ZW50ZWQgdGhlIEdQSU8tdG8tSVJRIGNvbnZlcnNpb24gdGhyb3VnaCAKZ3Bpb2RfdG9faXJxKCku
IFVzZXJzIGNhbiBzdGlsbCBvYnRhaW4gdGhlIGludGVycnVwdCBkaXJlY3RseSB0aHJvdWdoIAp0
aGUgaW50ZXJydXB0IHByb3BlcnR5LCBmb3IgZXhhbXBsZToKCmludGVycnVwdHMtZXh0ZW5kZWQg
PSA8JmdwaW9faW50YyAxNiAxPjsKClRoZSBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlIGlzIHRvIG1h
a2UgR1BJTy10by1JUlEgY29udmVyc2lvbiBlYXNpZXIgZm9yIAp1c2VycyB3aG8gZG8gbm90IHdh
bnQgdG8ga25vdyB0aGUgYWN0dWFsIGludGVycnVwdCBudW1iZXIuIFRoZSBpbnRlcnJ1cHQgCm1h
cHBpbmcgaXMgbm90IGZpeGVkIGFuZCB2YXJpZXMgYmV0d2VlbiBkaWZmZXJlbnQgU29Dcywgc28g
dXNlcnMgc2hvdWxkIApub3QgbmVlZCB0byBoYW5kbGUgdGhlIGhhcmR3YXJlIGludGVycnVwdCBh
bGxvY2F0aW9uIGRldGFpbHMuCgoKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
