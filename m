Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E3C2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUnTgeKpwMPTEJLBRSIpEy3jaluK6K3Ehub8QX2tCcE=; b=1DKG/O/Ai9f/nF7Q4Dv2rjJRIf
	PwMXsjxKalQpyV5OAJBJh7FCdvzs9VPFN9DMT+uDniqCn+nfggX/8XpCARWYwyr/shNc+/kYlDRW6
	fy/Rqu92QInq9oc1vky6CQMi1h+rsCd3XF5moOf3KBcRfTKWK7etJZhCaGb9mlimg0n13QpifqZa2
	OBzTUEDZeyEE0QDWL4TPxrvPi5oqfZoX1Y3mj5tX2HyhRe7RO8sYpoJa3vr9WiKtgVqa6f2l/UdLc
	AeD+b2LwxKR6s99tcLeMtZptS7duIPd5tQ/HV2uQTgYYHMdOm2Lf1CYk2JoFxc0NWU0LfpeXOdHpw
	GQOZm2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMimg-00000009POc-3iv0;
	Thu, 27 Jun 2024 06:39:06 +0000
Received: from mail-psaapc01on20710.outbound.protection.outlook.com ([2a01:111:f400:feae::710] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMimX-00000009PMP-35q1;
	Thu, 27 Jun 2024 06:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwrRme32zYb2wng3vDN1fqRn1b/Gdxha2JMSjuRds6GbNLd2XKwO9kWxw8ePe3qmoei5NIkyV7CZs4M7BI/UppZN2o7UT8xhQMIfCDuDVcHrCKDkGI9a4jJ8a4FLBPubr8X6SqkCaykqq56U9bkKgpTa60YGjdrrXjazp7s82MWDuk16eoq9WsVhuzXQcWYZf23XxWsSDQ8uGZuhEiW+QZ3OaUFv7g4VjMRFi5+dmcLYsouEAvTo8LxYW7xQ3FSG0lc6k4vyH2GzBxp8dVHBrIh3zAQYTc/dd6Bdu0D7dIhW2GMRw6nkg9ONDR/W4MgoU2LZ9E4PkPwdkPYLzIvWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6v8VQPGNL1qDanL4WV3jK2NdoevZO7nfkimhHAjv8w=;
 b=l9P48Ny5bZ+YLDiMvNBEFzIXI4NtkUthFTFDFy7rbqzGEknXVv+WgOMqC3IY+S0qqNMKCp3dGH/MyiLn2NRbScpcOUkEmpcZb+W+AcXc7vinvVULL4p0gcVHZxndPJPanNpSeGgRvmFytXynSQiWhMkjTGGpQ6lme7G9v1REUwQIyqWk+IpHg9+ed+e28uE6jiIlAPwe/3AfbWOTisssKMyDtJecE6jC7J2bulBKLxyWxkCOFrk9XMA2JrQ922j98dbCI4YkrTpF+r8d0PKW4yGLFBVsIZKzosLVj1IfTOdyTDZ98xt3zsV1TkTgOZ7Bm0NFJJo4Ty1TxDD+ANGyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6v8VQPGNL1qDanL4WV3jK2NdoevZO7nfkimhHAjv8w=;
 b=K7e0/A8mWkmW0kCiZGkQCWfjTsqSVxx71bK0Ih4oz7OvwCLq4kiT6bqZAYX53GdWAyKOQtJdHSkkfBMcle/MhJn1GkAXKQdOBvbfAsC8MJeGx3hzL13Ld7uz2/WksFBDmbDoL7GtIzAPXkCqaeeROJW3y9t13gipb5f+vmp9QOU0SdY0ni6+Ar32VFo+uBYfv0jCFtaUw8bhPpcV54oP3IT6X3GjjJoHgSKsD5IzmJe4mgrXj2L6YAAhwrPJzeAy6Vh8eVdD5GbE4Ic6+qy6KjFqGyhrZvzz5QFv9FPadV2ZWuOoeWwhiu1sDygSclwP8d90ADHvaIFy5iieqNLE4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
 by JH0PR03MB8333.apcprd03.prod.outlook.com (2603:1096:990:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:38:49 +0000
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732]) by JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732%7]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 06:38:48 +0000
Message-ID: <a1df5e6f-5f71-4893-b73b-7d3e87274a7c@amlogic.com>
Date: Thu, 27 Jun 2024 14:38:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Junyi Zhao <junyi.zhao@amlogic.com>, George Stark <gnstark@salutedevices.com>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-2-b5bd0a768282@amlogic.com>
 <a5ucz5r4eb2z5uzi4zaunpqhym5b6l37qszozhv4igcuduatnp@lzzk4tvil3yd>
Content-Language: en-US
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <a5ucz5r4eb2z5uzi4zaunpqhym5b6l37qszozhv4igcuduatnp@lzzk4tvil3yd>
X-ClientProxiedBy: SG2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:3:18::25) To JH0PR03MB7384.apcprd03.prod.outlook.com
 (2603:1096:990:11::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7384:EE_|JH0PR03MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 97658f30-5483-4286-5c6c-08dc9673cd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjBFdlJ0WndpR0czK1I2T3ZXbkxzMXdjc1pLeXQwM0x3NmRyZGVJQXNKUHlx?=
 =?utf-8?B?UnU2bUJMMmpMeDdhOVlhTDJGbmZCQWdaMnQxTGRBTTEyeEZuNTZMdldVSFFa?=
 =?utf-8?B?V0ZxMklTSWJvazluVC85dUN6NzFOU1lEWjA1dEZRdTBVcE53S1JGVnZOVWdt?=
 =?utf-8?B?dmxoWVRMTDU5OHZGUFVNbmhSSlVxanVVSWhtdG82TjU4WnNicUVWd1RvdUVP?=
 =?utf-8?B?c3ovQUEwOFM4aWRLWGdKUnBya0oydW12RHdUUVdud0NNYWlFcXBXQitxVURS?=
 =?utf-8?B?NFlmWXRoclFDc2NUYXlVNUpWMjVNbStBVXJoeEhQb1pwNDgrRk1xR29GcHpo?=
 =?utf-8?B?WnN1U0tZTDh6eGdRWnJVRUpYdklldjl5K0xVQVdTczNmQXpXN3ZhUWhZdlEr?=
 =?utf-8?B?aVpIVlAvMTBjWC9QRVhQeE45Mk0rVW5UQnAxMnVRbzJYV0xSQlBmVWthcjVo?=
 =?utf-8?B?SkwwOHNnRGExNXlVT0xsVVUxOTE5TnFvekN6eWl3bEJoUUlCZUh6d3Z3Qkwz?=
 =?utf-8?B?aUFVQVhGVVcxODVBLzZJQnJrVnJVV0dOcU5USHJnOEhqOGdzTXV4dmtncS9a?=
 =?utf-8?B?bnFWMC9oalZodWpyN1N1VzUzVWtud3kyU0hMUHBNZExBemVyUHpzSkZyOXk3?=
 =?utf-8?B?eFUwMTVFVmR3cEhTTGdyOXNoZkVmYXh2dXgvcmIrSkhkTzQzV0lmRlBLT3Fp?=
 =?utf-8?B?ZVp5b1dKTmtDaVFjVzZieU5JUDZQOWRpZVhwMjVPSy9tK0dzZmhJQnlnZzQ2?=
 =?utf-8?B?UFlDTytPL3YxOEtVQXNXdUQ4bWsyV240WUNDR014bThBM2VYRXpwdnZDV0tE?=
 =?utf-8?B?b0JqSFRMeUdhb1JWajM1ZkpDQU1zaG9SV09RSTVURW1wT1BaL1dYbzRqL05t?=
 =?utf-8?B?RjNoVy95SXdLSmc3UTRaek4yQ1FMa1J5cjd6Z2lTeDZ6YmJMRThlL0krWnFZ?=
 =?utf-8?B?RUtVS1dZdi9ObTJTenA3TExyVWRLZEFRNXlCanc2ZkFKa1ZmSHZYTHFCYk9s?=
 =?utf-8?B?RWgxUzVLWUQ0VlhWM2NtbElUSGdDMXBQNnQxWGlHQ25RQUlycyt5WW5la2ZZ?=
 =?utf-8?B?Mis0eDNSaXdzc2ZhRmFFMEp0bis5UWdZZlpDTUF6UGxERFBURkh4c094VG1r?=
 =?utf-8?B?SnVpNXpId0NDejQzUHpuMjFHZ3pMYU9XUW05K21HQVYxbnQyVzgzRmVSc2lY?=
 =?utf-8?B?bSsyVWU2aW91T1E5LzZOb0tJL2p5OGY1Rk5kN1FxZEM1b2dNN25kSUtON2Fv?=
 =?utf-8?B?VlVQYjRxbzMrc1dGcjdmMDhNZjBJcm05alBWR3k3ekF4Znc4VERHT0RuS3BY?=
 =?utf-8?B?dXN3QkxPZm1pVkpEZmpDeHNsdEM3cjNCc0FFSGZ3TG1WOVJHNTQweXZkRXlx?=
 =?utf-8?B?eWtXQ0ZIMy9nWUZOeFVMYVExSTUvKzZUdkh1Ni9HSDBhYm1wclRKZytIZWpr?=
 =?utf-8?B?cTRaQmtoVGlJZUR1T3YyOXgxNmlJWklhVE9FbFFNbFFnamxqTTlTUGhXb0xr?=
 =?utf-8?B?MnMzcnZLVER0UGJta256TFo2cTg4ZlNORnBGb0FFMTdNRVM0VHBlcm84WHZY?=
 =?utf-8?B?bXR3TDgzSXVKVTJuMFVrYS9ZclljMC92aC9seTRCWlBQOVZhSTVsQWIyeXRs?=
 =?utf-8?B?VWVuVXM0dndPWFBGVjVlQUs1U0NJaWl3QTQwRFVSeXlNYzhJMHBaMVB1ZmhJ?=
 =?utf-8?B?RlpOZTZJQ20xM0E5QlE2emZkS0VkSFdLTnkwa1grT2prZi96cUhrN3ZVN2Iz?=
 =?utf-8?B?Z29lOW4xSUhuN3NHWHhZdzlQY1FJcEpuMjZ3Z1BkcTVaanNqcUkwamJ4d3hh?=
 =?utf-8?B?Tm9XZXFMSzEwaUYyTkFTZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7384.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJzWWN2Q3J1a3pBRHEyQWU3RmJIKzlZVCtQYzVuZEtVZDBxcHhTeEt6TGpa?=
 =?utf-8?B?T3FMSENna3NTQ0t2S3o2QlNqNEZwWGdreFAwZDNleThnNFQ2N1hPcFl5VG85?=
 =?utf-8?B?K3NJOWdpSmJBWGdLK2Fqb09MZ2Y2alNMU0dDMnhNTk5COU5Sa09sZ1BNMC9u?=
 =?utf-8?B?RFhEeHZJWjlZMHQ0MkE4OTkxOUlUWVpDUFhQNTMxaW92aTdPWDVZWXkrVGkv?=
 =?utf-8?B?cDZtR3BXL3U0cEhPeEVSYmx4U0pEU2Z0eXJwaGQ1NFFkSEo4RnFlcWd5VEUz?=
 =?utf-8?B?ZTlxNEN6Z0wySTZvRXFZMnRTLzlBdUsyTDRlcVJRbGYzZVk0STZHdTczb3dK?=
 =?utf-8?B?QzJHTDVUdmZXbVp4OC9aSmgzRklDN3lseHNmS3JNc2RJZkJiaWFMK2ZmUkNt?=
 =?utf-8?B?QVBBYjV5SU5WbEY1dnYwRUQvUUxQNXpCU01oZWlLZmw4QkQybEVaNHdJdDBv?=
 =?utf-8?B?MFR1TDg1OGppSmdUdHVpZy9oSWFqRGZDNVpwR1RTdHRqdmhqVzBoM045Vzg0?=
 =?utf-8?B?TENEblNzajNUWElOUEtRalIzd1F3TnIyWEhQNFRlSXRQTmZBbytIWEFmM2lt?=
 =?utf-8?B?MC9TVmJrZWlxVGdZTk0wdUtiRHVaQ1g4am9YSGgySFpkT3R6ZVhZMmY5alhX?=
 =?utf-8?B?bnJyNWlkdDdYTkFoNGtMcEZ1VDJLSnI2cWQzMG1oNlFOUWZYQS9GMlRWbHJq?=
 =?utf-8?B?bWMwZy9tekQxSWVNSldJVGEzbVl6b2ZYSkEvc01Gd3JwOFJFSjk2YlUxTEVO?=
 =?utf-8?B?UWtVODh6dHhaQm1ROHd1ajVtVkdoUDFmSHFaWXA2b1k5YTBGRzlIdzd0Zlhw?=
 =?utf-8?B?Z0tOYVk4c3J3a25vM25Fa2VVa2tjN2RJWFF5ZFhxdm9EZU1sb29aTHBVNHZw?=
 =?utf-8?B?NnZXdzBGVWF5QlBtTHVRVzJNTmVBbW1uYVEyM3p5bFR5a0EvczdvYlo3VEln?=
 =?utf-8?B?Lzl3VHNkcFBYWlRSTVNmNDVGQU82SWpad3NYSDNSazRMc0lZNk5VMlVlSWRC?=
 =?utf-8?B?QWx1U2tzdS9yL0JjZ0ZpMHNUUTlFYWJEaWdPTmMvRE8zc0Znb0VXV2dVQ2tr?=
 =?utf-8?B?SUF1UzVOdjh0YmpoUUtIWi8vb1pQS2dDb1pqQzhsOTh1eit1ZHFZbkVNb2Uy?=
 =?utf-8?B?a3o1WlFuRU1jaTFGTE5idXUyWXFDZUY1WFF4QmJ1UDRKTUFMbjl1bEpFeUFj?=
 =?utf-8?B?UXFibEFYVzRFUUFQcXhsUVMxYTRMYnN2dzA2cndRZWFNWmcySVU3ZmtaLytz?=
 =?utf-8?B?MG1yRmk5b0lyUFFyMndPb3huSzdPY2o1SDROSTJreC9NU2xzZDBpQjdrMFRq?=
 =?utf-8?B?RlduekNqYUxFNG9rMHlkYmVkc2NSUlhqUXR2SnZjalU5c0NHNDROMDBiUk9m?=
 =?utf-8?B?TVVJR3g2eUJFcEduZTk1Qnd4L20zUXVTTWppZmdzWTFTa2xYVEpkY0JqZk8r?=
 =?utf-8?B?a0R2Vjd2eWJzeWlxOTdlY2pyTHVSMlZIZ0NJNlh4djZHYmNiQnc1SjkvOWtO?=
 =?utf-8?B?dWd0VzY1TndJbHhoSXkxQ0lsV3ZGWkN5Z0lHVFg4c0NRaDNkaWtxNGxSSTRh?=
 =?utf-8?B?K1NGelRRT3BMZDhFTEVtdERSRjdTNWVqQ3p4dEcydFoyMks0cS9EY3kyakRO?=
 =?utf-8?B?ZGM0dGRwMTBXNUUxUWdVUkRkN1l5YS9nZFZKT1N1SWRYZi9tcmprR1dHU2Uv?=
 =?utf-8?B?SDBSTXptdk91cWs5WHFnbmhPSFV2c2RNVkhwOVIzcXRvUnB5MGl4TkM0MkZU?=
 =?utf-8?B?dWJvK3grZkZqUHRrbmdaYVZxMFplTjR3aTU5Rm5jM2szbFRQZ1RZcUFRamdJ?=
 =?utf-8?B?TERFNmk2YWkvUitsY2IwaWRoc0RDczNjZi9MSHlscVZpY1FKTVBYWnhjQ1VV?=
 =?utf-8?B?UllZTWs3NmxKTVlmZUxuMTE2eUZXc1VzSFgzWkczMmpXK3JLaU9JWjdoTmF4?=
 =?utf-8?B?R2tKZW1rVHlWaGF1U1d4WWNVSFYwN1A1V2NGbHo0YmJsd2FNZTFqdVFFUnlH?=
 =?utf-8?B?SWkwZWpwNlJVSkhhendxTjFiWXhWb2VHQzZ3aUxOVTlCSm9TVFNrQzFibDln?=
 =?utf-8?B?REtNU25zdXVhVVN2NDAxN2xFSERBbHc3N2FWQXhDcHoxZGw5bUo2RmZqeW10?=
 =?utf-8?B?NVh2L1NUYjlBNTRaV3ZoU0FsdVpraUVGNFEybjJjSzNDS0VINTNrVE9ZVnhR?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97658f30-5483-4286-5c6c-08dc9673cd17
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:38:48.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqIBtkq97rtjjBsCdRjETWwev/1swtBN4zBbZrMhzdgYgmBdJ4D17L7vZct0af5/7uZYoqjc/MzW15rMouay7f6/bY+W9dO4dOizg3NU52E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_233857_830500_D2EFF611 
X-CRM114-Status: GOOD (  14.70  )
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

T24gMjAyNC82LzI3IDEzOjUwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAwNzo0NjozNlBNICswODAwLCBLZWx2aW4gWmhhbmcg
dmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBKdW55aSBaaGFvPGp1bnlpLnpoYW9AYW1sb2dp
Yy5jb20+Cj4+Cj4+IEFkZCBkZXZpY2Ugbm9kZXMgZm9yIFBXTV9BQiwgUFdNX0NELCBQV01fRUYs
IFBXTV9HSCBhbmQgUFdNX0lKCj4+IGFsb25nIHdpdGggR1BJTyBQSU4gY29uZmlncyBvZiBlYWNo
IGNoYW5uZWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bnlpIFpoYW88anVueWkuemhhb0BhbWxv
Z2ljLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBTdGFyazxnbnN0YXJrQHNhbHV0ZWRldmlj
ZXMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWx2aW4gWmhhbmc8a2VsdmluLnpoYW5nQGFtbG9n
aWMuY29tPgo+PiAtLS0KPj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQu
ZHRzaSB8IDE5OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgMTk5IGluc2VydGlvbnMoKykKPiBXaGF0IGlzIHRoZSBtZXJnZSBwbGFuIGZvciB0aGlz
IHBhdGNoPyBUZWNobmljYWxseSBpdCdzIGluZGVwZW5kZW50IGZyb20KPiBkcml2ZXIgc3VwcG9y
dCAoaS5lLiBwYXRjaCAjMSBpbiB0aGlzIHNlcmllcykuIFRoZSBvYnZpb3VzIG9wdGlvbnMgYXJl
Ogo+IAo+ICAgLSBJIHBpY2sgaXQgdXAgdG9nZXRoZXIgd2l0aCBwYXRjaCAjMSB2aWEgcHdtCj4g
ICAtIFlvdSBwaWNrIGl0IHVwIHZpYSBhcm0tc29jCj4gCj4gQ2FuIEkgcGxlYXNlIGdldCBhbiBB
Y2sgaWZmIHlvdSBwcmVmZXIgdGhlIGZpcnN0IG9wdGlvbj8KPiAKSSB1bmRlcnN0YW5kIHRoYXQg
dGhlIERUUyBwYXJ0IGlzIGluZGVwZW5kZW50IG9mIHRoZSBkcml2ZXIuCgpIaSBOZWlsLApBcmUg
dGhlcmUgYW55IGltcHJvdmVtZW50cyBuZWVkZWQgZm9yIHRoaXMgcGF0Y2g/CklmIG5vdCwgd2ls
bCB5b3UgcGljayBpdCB1cD8KVGhhbmtzIHZlcnkgbXVjaCEKCj4gQmVzdCByZWdhcmRzCj4gVXdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
