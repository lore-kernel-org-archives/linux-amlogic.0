Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C3BCAC5B5
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9hOHcCy0NVhrK0wgKm6GN8NqgU/WbhPOv1mlZl7xPI=; b=keAKX0XVkjpKvH+GzBNWMCHORA
	/TATRqZgcanSzE22iuoiO9JerZUddObl9ZzcwvixJZHZ4jnrQ689pKZUiWb7/GwxHrf79fe+yYT6g
	V4cnCR4eKI46ICp4MsMzxCImIkQniwDGdbXCKvWVjQmMK40mntUfdbiJLPBtsIyKdyGlxeSUDZ9wV
	QxxaNd4MYJ6bzyP/eJGVBOBlj67GEcP/4It1hWJBoOlQven6VJThrfdTY8Lm2qBsHvQQEcdelejuu
	7iMISc0RJ5VSzE6srOAQSagSbYwpBvU5700b2nCKUfS8F+2oCmyEjmBJJmo4ErupR8fvBmomDPQKA
	lSvW8R7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2kXk-0000000DyXA-2Kku;
	Sun, 28 Sep 2025 06:05:56 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2kXh-0000000DyVz-1KKJ;
	Sun, 28 Sep 2025 06:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFXYNPoCQA4GeAZmBvz/MAIIRdRyPYpk0DWmdx++ZQHr0BAUwfL2tikqVf9NcoEQJnSHefqNomRoBsnuxgTl+ezDjWKntfJWEe+yMwWKIPtzC4xqYEL5KF3ACAR0d7D4AypyIJFmp91VACMF6/fAJ/IwymSGFFUOP00cacdrlsyAErE3jQc+uC/Luzzv4tkRT+zzuBKzkXhaUKE8iNKORpNul3Cg1SXjGMxmb/1rkvCSrlel2k0ViW0xleU9A2gwGRovh3bcFfjhE0nCB6ki6bau7ZKACAlB5EWS+GMAWpagC443/nMWnM7yaQRJ0ip5x0GL3XsnqG0p95Zw5jO22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zl1mFg/rikISaRzGn+ceuwbLOGr/ymtYi/HRQKrUFk=;
 b=c0XZdQBKkROsJDdV0CmtJ4V6ZJ9Nt3qas59VM41/rXOfou9fXjtPSVFMG7fwX5GvyR2UM2AVuxp/BpRfS2TiUHhWyaKxD385n1wcKm6rrSCYpTwxHwmDZ66f4EQuaVEYy3DlrLcbflfdPBremJv8dij4/RWkIL0C8JP9dRQ+9qk+oiZ1AyuwkjlVTza+9dO3YqPU7afqtaSjSdwQCJB6kjSuPPIj3GPqWP34t9UIiut+0FmziQVxAYJzEKC84hL4JMWrYCnyXcBzoymkHnaqROkRWIJNrIlDUSuPWeYzmJMR7x7MxpMyqHFXDo61twvFvoudJ7iJhI3gWTXvZTHgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zl1mFg/rikISaRzGn+ceuwbLOGr/ymtYi/HRQKrUFk=;
 b=B19Xa756PVDTZB/I54RUK3xvKlG8t7kBXbHQGvf10sfIdHkbt+IsDSBYn8quxSqQbSqnCFD/R7zZbPJDSkOmYMDeVl7app2YhMsbK3oAVlwcOH8i2xKJwdrQmanoCoyrwTGflyXeBGijBovQIqVDxioGo3h/MSkSfsHObZrlkLtLst5uXdpxVBl29n2A02IEEyHeBVFFIVgCtZJOg1B+afWcBrFuKx0N+85P1c2J+3HQxbKU2ItpeorhWlF6tsnGOGy6gCeI2TuDO2DrWVQ3EpDd8ehjH2FRlqPDQejV++8GAdLgKU6UVaeY46sX4nPocFGpVLla36WSwk69RCVAvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TY0PR03MB6476.apcprd03.prod.outlook.com (2603:1096:400:1bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Sun, 28 Sep
 2025 06:05:39 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 06:05:38 +0000
Message-ID: <e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
Date: Sun, 28 Sep 2025 14:05:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
 <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
 <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
 <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
 <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TY0PR03MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 76758cea-e447-4f2b-29f3-08ddfe550c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzVGa3h1dkF1VVh0UG9vUmozZ0lLMnBrT0dQMFpTWXRYV0lLTGNIK0ZUdkhC?=
 =?utf-8?B?NGtBRldkSXRuN1M0SVJvMis0SCtvd3BNVGlyUUZhcmhFVzl2NDlSdkNYNUl6?=
 =?utf-8?B?R1d5ZkFrQmlDZkhuN1FFMXRIeGJjZnBLWFpCd2pJczRNR1RYZjNqc2I3Vm1E?=
 =?utf-8?B?aENoTG1kcC91SVBSNkpuS2pueUo5alcyelppRzQxRGpPZ0o3dXR1Vy9Vb1la?=
 =?utf-8?B?aXVBRW4vc2FmQjdIeFVJdDlRZElZTS9JZ0NHT2JnVmxUYjBQNUErU25sM0hx?=
 =?utf-8?B?amllV0J5YTl6a0dZMU5YNHBId2N6YytGZjJCdk11WGx4c3kxRWp2U0tJdnB2?=
 =?utf-8?B?NzhTb0c1WStHc1M3YUZFNlo1dEltMEJuRHFsUlNDTktqWVdLMW8zTE1OdzBp?=
 =?utf-8?B?cEhhTzk5L1RnZ0prTWdtR2NSTmFGeXpJMXg1bzU2cndsMWNSVEVSVUFJeEta?=
 =?utf-8?B?R2xOZ0ppVFdkakJvSVFBRlkxLzE5R1RYTksvaHdwb2Q5QU1kaEsvNDJUanNs?=
 =?utf-8?B?MkpTYUI0eEpVSDNSaUJPdHFhMFZHSFBVMW9JaDdXUmI1Nm45K3djMldQV1BM?=
 =?utf-8?B?a2o2RmNMQ3NjSVZZZFhJZlIyOWE4dXNqQW1DV2NCWElpNFY1Vm5vclh6bE03?=
 =?utf-8?B?ZmtOSDMxUzhrVCsrME9La0V3RE53Wmd0em82S05GLytxU2tHRWhIMGM2aTBJ?=
 =?utf-8?B?aEpoQ2xpQSt2UVpxcU8yL0hTMXEvNWNyaTBDMWszT0pjcXp2WnlnOU43THJh?=
 =?utf-8?B?dUhNbnhFV3lEdWt2ME9WMVZnWE81MlY1aEhnQXFqWTN3c2JOcGUvaXM0Yjc0?=
 =?utf-8?B?c3N2UHhqY0ZISFUyNEpFVGlNM0JaUmJ4U3hMSzIrNFpyWmJPRytKMDMrSVdh?=
 =?utf-8?B?WEEvUWk5bzd0RHNtM3g1K2M5SXA5ZUZVVElXSzJBRUlvanJxOXl1eGtCbTJk?=
 =?utf-8?B?WUlLWDlGTmpqcTgxdXBOTlM5blpKTm1zYTNpOWl2M0hhTzdjbXpKYy80ejZQ?=
 =?utf-8?B?RjVFRnVKKzNjR1kzT1BMZmZUK2txWFJXTG1qNVVPU0NFQnVzek1Ec0EremVV?=
 =?utf-8?B?ZWxmUlJ6SVNiVTFscVpwRmQ2dHgxLzE1eFRwQUVnVjdIamZ6Z0NMdjBBK3cw?=
 =?utf-8?B?dEI1UmxaaXJTczdZTUxncUlrMEJTem1hdjRQT3RBQTlEWWRVMXBWVFIzUmk0?=
 =?utf-8?B?SlBaNEFGN2xhQjlBNFpzT2NRRklLc1I5NXNDVkRmZHN5OExTb240ZC9lZW1L?=
 =?utf-8?B?VDlHblc5MWozN0l6WEN0NzNQdTQrWWlhRFFYZGREME9pZlYrL29JWlFrT2tQ?=
 =?utf-8?B?RlUrbGJtOXRxRnQraytDTElNQmcvd1RPUEJPMU1NSDlNU0VSeDZiT1Fza3Fh?=
 =?utf-8?B?eXkwbUZzVTV3R0JQMjU0aFFIMkp6MitXTk8yeWwweEQ3VFd4OVUxRS9keHRK?=
 =?utf-8?B?dTBCMDhVVlpoWGNVR082OHUzOUtkd0RtcDVVOENMYmVUdHE5K01KN0xYV2d2?=
 =?utf-8?B?VkJvNHcxWE0ybXVJVTlHTTBwdTNJREhucjN2UUc4TThDd1UwZmt2S1VOOFNn?=
 =?utf-8?B?aEtndTR3UUVVaEFKZ1JkSUp3M1pBYitCQzB3K3B3QnNPM2szTGhrM2xlazJw?=
 =?utf-8?B?c0FBbnpyK1JuUnRJR3JVYlIyOWhwekJBcFRhdTBQQlZVb204dHhITVJCeEh0?=
 =?utf-8?B?SVFNOVRzZHd1ekt0TGVOamdqOXkxRmRxMEI2NjZVZWpxb2lDK3NJSi93RWpH?=
 =?utf-8?B?S1lObjZ3aTBsME5mdlRBb1d0bmJxUFZCbG4zalNzQ090VHYzcXE5TG9mZ2ZU?=
 =?utf-8?B?VXVUcFR3eVNqTVpMOTdjMjBFNDNuRkk1cDNJQy9pVG9OQlVxUUFrRnRUVlZt?=
 =?utf-8?B?bmlHTUFxOEhMUUdrdktlZjd4Z0ZJelROWFcxU2duUmRrc1FVWmdxMVhoUGdV?=
 =?utf-8?Q?Ar7kV1GGmBKMaC7DV+bqCNSc+cRikTid?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3Q0VVRKajNKdC8xMTFpejdIeFV6ZVJ6RTI3N0pxWGVzNnBvMVRhL1hyMk5v?=
 =?utf-8?B?aEozMHBKT1M2Y1dybmRWZ3VXaDArVTlkQmhCRWVEaXZsc2l2WWJXbjVvSEJn?=
 =?utf-8?B?MTBjWXJrdGR1Rm92R29VN3NMNlhmV2I0NVd4ejlaeC9KTmJZeWVKbTNSbkR0?=
 =?utf-8?B?c1RwemV0QmR2NkEvSWoyd0c3cGRMZnNSY2lEaCtxSzBTY3lNSjlwV2tYYlhv?=
 =?utf-8?B?Y3pDRzBKMUtySjZYRkROSmtRd0ZkTkdPbW5aVUxPc1g2ckJIQXo0aFRhUllB?=
 =?utf-8?B?L0xnbFJrQm1NSGphLzdoRGovdHEreVdTTVpwOXUwSmtxdW42NnlKTUFLWFRs?=
 =?utf-8?B?NDRya3oyaStUUGhqYlBWVUVucDBsdUg0bkplZDV4eVpHVTZGYUtBRnFpeUha?=
 =?utf-8?B?Mm4xdlNabUpNemM5d0JKMVd5VWxBaVNHQytmWTZhcjlBUnRUM0VCVC80TUR2?=
 =?utf-8?B?ck4reW9qcVBqNm1tYis0S0xqcjA4R2dRVHdoNHhFTkdxUUpjZzVNYnBBOFhN?=
 =?utf-8?B?NnNmeVZQemJISWNlc1FxSWZMZXNyRjVoMFhFTi9UUTVyZ0JtdHdZTGJzV3Zq?=
 =?utf-8?B?K2NXbENJZzVwVk54Z0x1b0NzLzlRTFh4ajFmQ0w3RWVkdWJBeTFJNXVJZFBi?=
 =?utf-8?B?OWxmK1RRRFJETXdveHkzaXpEUnYwM083Vk9Tb1M1N2VhOGNGamprZERyYnIy?=
 =?utf-8?B?bVRBQjlNa21kSmFhaERIQjlCaVc5bUZGRS9XUnNzM1I5VDI1TUIrL3NiRWhE?=
 =?utf-8?B?aHNmUzN5aXh0T1NyeGh0K0NIaW5wQWJ2Skp1Nkl1QlhIc2NzZ05SdGZLSmVk?=
 =?utf-8?B?dTdBMGpCblZYYktnVnd0Nllub1QzRUlFbFFwYzdhN05PYnpkbHNGRDdORUov?=
 =?utf-8?B?S21UK05HWjZ4aFJIYTBEYWQyOEdVaDI4bHBmcHJobU1NeDFuNFp0NlFtWHNh?=
 =?utf-8?B?WFNEQXpRUE1YR3NXcG1hTWdJNGxzVmZ3aUlVKzM4ZWxucFBjWTZwb0l2U2gw?=
 =?utf-8?B?TDBhWmplaEM5Z1QySzN1cGtuY1VrQUhJV0VJSXhBRU9pakFhRUVVc3hvOUly?=
 =?utf-8?B?V2pLeVlIbEdNMUlJZjVBZHk4STJSbmVLUDJOYXJnbmxNVi9rcEhWZ1pPSHNz?=
 =?utf-8?B?M1JaMEpTRFdoVUUrMFBhek1ESUxUdkNtL0NJSU1pc25NdkdjVUU2cXJGV041?=
 =?utf-8?B?b280MURUVzJyaVRtd2NRLzdzc09DQ3dpc1YxYW5POE9rT2syNzBhbXlveit2?=
 =?utf-8?B?UDlWQjRXSzR5MEthc3N6T2pDS3lvS3NWQ2FWZmhvY0dBS2lVVC9CQ1F4SzJ0?=
 =?utf-8?B?VnFZNzFwT1YyTFVVNkx0Y3ZnR0JvTkN0bTZvSHN5Wk5xK0hQT0dCRDQ0VWpS?=
 =?utf-8?B?NjJvTXdSQVIzNDlhMlE2dUNoanI0alhmT1FBL1d5T1ZMZFVwajJmWjhOc1Z2?=
 =?utf-8?B?bkxuMlFYY0xJaGhEcHQwQTBMNDRBMkllMytaUHkrMGkwanBLbjBIbEdvUHg2?=
 =?utf-8?B?Q0ttRElCVUVWamlMSjh1V0ZTTmx1aGVLUHJ6TWdObXVpSWVKcUtuQXN0SktJ?=
 =?utf-8?B?VDNsaTlpZ29nZjIwVnZYdW0zSWJuU2VoNDFoYWExT3cwR3l4SFM4R29CMWVL?=
 =?utf-8?B?YkswQzVxbERtbkJ3MTJkRzdOSmpZQ1VJSGwrbllhek9DOXVFWmpjWG1YaUl6?=
 =?utf-8?B?RWI0aXZVdGdlVm9NUHBEcjhSbXVrSXF0MnRmTmh6RVlOdlRGSytRQlA4NkJK?=
 =?utf-8?B?bW41Z3JXcldKOEcrTG1YRE5XV0tsUURQcko5UnE1UDUxeVVKQk94Q1dtSXZV?=
 =?utf-8?B?R0l0RXkvTDlqQUNSdFp0RzROOHMzRlpkUjJSZm9NTFRMSThXT0t4QTc3QjFt?=
 =?utf-8?B?b2l0OTVERWFRd1hXRjQ3UytGOWNheU93bTJEMVh1T2FpSmZsRnJEV1Q4Z3Vp?=
 =?utf-8?B?Nk00aUoyYjNuQnRDaWJ2ODVzWmp2b0IvVjRyeG1VMXFaaU5Ub2pRRzhiOXNi?=
 =?utf-8?B?Z3IzYWdsbGNlYXVSeVpnMDNBWkxFU2VpOHd1TGJCWUVDaUYrb1JYdXBnbDV5?=
 =?utf-8?B?cG9tUFlPRjFLZHplN25ydDFZN0hPUnAzZml6RXRXd2MzZ2dtZ3QvWWU2RHYz?=
 =?utf-8?Q?vk6NNmBfWKkLmy/cKiJJ/8Iax?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76758cea-e447-4f2b-29f3-08ddfe550c23
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 06:05:38.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT+L8Ujm7wq79AZWI+k4VlsPFcOhKhT31+bWEGW/Dke+ccxtxIiPG+6ELhwR9Kej3kyT8oTp0kqlnakItniE3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_230553_468551_553F327A 
X-CRM114-Status: GOOD (  28.60  )
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

SGkgSmVyb21lICYgTWFydGluOgoKU29ycnkgZm9yIHRoZSBpbXByZWNpc2UgZGVzY3JpcHRpb24g
b2YgdGhlIGdsaXRjaC1mcmVlIG11eCBlYXJsaWVyLgoKUmVjZW50bHksIHdoaWxlIHRyb3VibGVz
aG9vdGluZyBhIENQVSBoYW5nIGlzc3VlIGNhdXNlZCBieSBnbGl0Y2hlcywKSSByZWFsaXplZCB0
aGVyZSB3YXMgYSBkaXNjcmVwYW5jeSBmcm9tIG91ciBwcmV2aW91cyB1bmRlcnN0YW5kaW5nLApz
byBJJ2QgbGlrZSB0byBjbGFyaWZ5IGl0IGhlcmUuCgpPbiAxMC84LzIwMjQgMjowMiBQTSwgSmVy
b21lIEJydW5ldCB3cm90ZToKCj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4KPiBPbiBUdWUgMDggT2N0
IDIwMjQgYXQgMTM6NDQsIENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPiB3cm90ZToK
Pgo+PiBIaSBNYXJ0aW4sCj4+Cj4+Cj4+IE9uIDIwMjQvMTAvMSA0OjA4LCBNYXJ0aW4gQmx1bWVu
c3RpbmdsIHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gSGVsbG8sCj4+Pgo+
Pj4gT24gU3VuLCBTZXAgMjksIDIwMjQgYXQgODoxMOKAr0FNIENodWFuIExpdSB2aWEgQjQgUmVs
YXkKPj4+IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Pj4+PiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4+Pgo+Pj4+IGds
aXRjaCBmcmVlIG11eCBoYXMgdHdvIGNsb2NrIGNoYW5uZWxzIChjaGFubmVsIDAgYW5kIGNoYW5u
ZWwgMSkgd2l0aAo+Pj4+IHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24uIFdoZW4gdGhlIGZyZXF1ZW5j
eSBuZWVkcyB0byBiZSBjaGFuZ2VkLCB0aGUgdHdvCj4+Pj4gY2hhbm5lbHMgcGluZy1wb25nIHRv
IGVuc3VyZSBjbG9jayBjb250aW51aXR5IGFuZCBzdXBwcmVzcyBnbGl0Y2guCj4+PiBZb3UgZGVz
Y3JpYmUgdGhlIHNvbHV0aW9uIHRvIHRoaXMgYmVsb3c6Cj4+Pj4gQWRkIGZsYWcgQ0xLX1NFVF9S
QVRFX0dBVEUgdG8gY2hhbm5lbHMgMCBhbmQgMSB0byBpbXBsZW1lbnQgUGluZy1Qb25nCj4+Pj4g
c3dpdGNob3ZlciB0byBzdXBwcmVzcyBnbGl0Y2guCj4+PiBJdCB3b3VsZCBiZSBncmVhdCB0byBo
YXZlIHRoaXMgY2hhbmdlIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4+PiBUaGUgY2xvY2tzIHRvIHdo
aWNoIHlvdSdyZSBhZGRpbmcgQ0xLX1NFVF9SQVRFX0dBVEUgYXJlbid0IHN3aXRjaGVkIGF0Cj4+
PiBydW50aW1lIGluIG1haW5saW5lIGtlcm5lbHMgKGF0IGxlYXN0IEkgdGhpbmsgc28pLgo+Pgo+
PiBPa2F5LCBJIHdpbGwgc2VwYXJhdGUgaXQgaW50byB0d28gcGF0Y2hlcyBhbmQgc3VibWl0IGl0
IGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Cj4+Cj4+Pj4gQ2hhbm5lbCAwIG9mIGdsaXRjaCBmcmVl
IG11eCBpcyBub3Qgb25seSB0aGUgY2xvY2sgc291cmNlIGZvciB0aGUgbXV4LAo+Pj4+IGJ1dCBh
bHNvIHRoZSB3b3JraW5nIGNsb2NrIGZvciBnbGl0Y2ggZnJlZSBtdXguIFRoZXJlZm9yZSwgd2hl
biBnbGl0Y2gKPj4+PiBmcmVlIG11eCBzd2l0Y2hlcywgaXQgaXMgbmVjZXNzYXJ5IHRvIGVuc3Vy
ZSB0aGF0IGNoYW5uZWwgMCBoYXMgYSBjbG9jawo+Pj4+IGlucHV0LCBvdGhlcndpc2UgZ2xpdGNo
IGZyZWUgbXV4IHdpbGwgbm90IHdvcmsgYW5kIGNhbm5vdCBzd2l0Y2ggdG8gdGhlCj4+Pj4gdGFy
Z2V0IGNoYW5uZWwuCj4+PiBbLi4uXQo+Pj4+IGdsaXRjaCBmcmVlIG11eCBBZGQgZmxhZyBDTEtf
T1BTX1BBUkVOVF9FTkFCTEUgdG8gZW5zdXJlIHRoYXQgY2hhbm5lbCAwCj4+Pj4gaGFzIGNsb2Nr
IGlucHV0IHdoZW4gc3dpdGNoaW5nIGNoYW5uZWxzLgo+Pj4gVGhpcyBkZXNjcmliZXMgYSBzZWNv
bmQgcHJvYmxlbS4gSSB0aGluayBpdCdzIGJlc3QgdG8gaGF2ZSB0aGlzIGluIGEKPj4+IHNlcGFy
YXRlIGNvbW1pdC9wYXRjaC4KPj4+IEFsc28geW91J3JlIHVwZGF0aW5nIHNvbWUgbWFsaSBjbG9j
a3MgKGUuZy4gb24gRzEyIGFuZCBHWCkgYnV0IG5vdCBhbGwKPj4+IG9mIHRoZW0gKE1lc29uOGIg
Zm9yIGV4YW1wbGUgaXMgbWlzc2luZykuCj4+Cj4+IFllcywgTTggbWlzc2VkIGl0LCBJIHdpbGwg
Y29tcGxldGUgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPj4KPj4KPj4+IEkgc3RpbGwgaGF2ZSBz
b21lIHF1ZXN0aW9ucyB0byB0aGUgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGFwcHJvYWNoIC0KPj4+
IHBsZWFzZSBzaGFyZSB5b3VyIGZpbmRpbmdzIG9uIHRoaXMuCj4+Pgo+Pj4gVGhlcmUncyBtdWx0
aXBsZSBjbG9ja3MgaW52b2x2ZWQgaW4gYSBnbGl0Y2gtZnJlZSBtdXggaGllcmFyY2h5Ogo+Pj4g
LSBhIG51bWJlciBvZiBjbG9jayBpbnB1dHMgKGUuZy4gZmNsaywgeHRhbCwgLi4uKQo+Pj4gLSB0
d28gbXV4ZXMgKG9uZSBmb3IgZXZlcnkgY2hhbm5lbCBvZiB0aGUgZ2xpdGNoLWZyZWUgbXV4KQo+
Pj4gLSB0d28gZGl2aWRlcnMgKG9uZSBmb3IgZXZlcnkgY2hhbm5lbCBvZiB0aGUgZ2xpdGNoLWZy
ZWUgbXV4KQo+Pj4gLSB0d28gZ2F0ZXMgKG9uZSBmb3IgZXZlcnkgY2hhbm5lbCBvZiB0aGUgZ2xp
dGNoLWZyZWUgbXV4KQo+Pj4gLSB0aGUgZ2xpdGNoLWZyZWUgbXV4Cj4+Pgo+Pj4gV2hlbiBzd2l0
Y2hpbmcgZnJvbSBjaGFubmVsIDAgKHdoaWNoIGlzIGFjdGl2ZSBhbmQgZW5hYmxlZCkgQ0NGCj4+
PiAoY29tbW9uIGNsb2NrIGZyYW1ld29yaykgd2lsbDoKPj4+IGEpIG9uIGNoYW5uZWwgMToKPj4+
IC0gZmluZCB0aGUgYmVzdCBpbnB1dCBjbG9jawo+Pj4gLSBjaG9vc2UgdGhlIGJlc3QgaW5wdXQg
Y2xvY2sgaW4gdGhlIG11eAo+Pj4gLSBzZXQgdGhlIGRpdmlkZXIKPj4+IC0gZW5hYmxlIHRoZSBn
YXRlCj4+PiBiKSBzd2l0Y2ggdGhlIGdsaXRjaC1mcmVlIG11eAo+Pj4gYykgb24gY2hhbm5lbCAy
Ogo+Pj4gLSBkaXNhYmxlIHRoZSBnYXRlCj4+Pgo+Pj4gVG8gbWUgaXQncyBub3QgY2xlYXIgYXQg
d2hpY2ggbGV2ZWwgdGhlIHByb2JsZW0gb2NjdXJzIChnbGl0Y2gtZnJlZQo+Pj4gbXV4LCBnYXRl
LCBkaXZpZGVyLCBtdXgsIGlucHV0IGNsb2NrKS4KPj4+IEFsc28gSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSBlbmFibGluZyB0aGUgY2xvY2tzIHdpdGgKPj4+IENMS19PUFNfUEFSRU5UX0VOQUJMRSBz
b2x2ZXMgYW55IHByb2JsZW0gc2luY2UgQ0NGIGlzIGRvaW5nIHRoaW5ncwo+Pj4gYXV0b21hdGlj
YWxseSBmb3IgdXMuCj4+PiBDYW4geW91IHBsZWFzZSBleHBsYWluIChwcmVmZXJhYmx5IHdpdGgg
YW4gZXhhbXBsZSkgd2hhdCBwcm9ibGVtIGlzCj4+PiBzb2x2ZWQgd2l0aCB0aGlzIGFwcHJvYWNo
Pwo+Pgo+PiBJZiBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgaXMgY29uZmlndXJlZCBpbiBtdXgsICdu
ZXdfcGFyZW50JyBhbmQKPj4gJ29sZF9wYXJlbnQnIHdpbGwgYmUgZW5hYmxlZCBmaXJzdCB3aGVu
IF9fY2xrX3NldF9wYXJlbnRfYmVmb3JlKCkgaXMKPj4gY2FsbGVkLiBBbmQgZGlzYWJsZSB0aGVt
IGF0IF9fY2xrX3NldF9wYXJlbnRfYWZ0ZXIoKS4gT3VyIGdsaXRjaCBmcmVlCj4+IG9ubHkgaGFz
IHR3byBjbG9jayBzb3VyY2VzLCBzbyBhZGRpbmcgdGhpcyBmbGFnIGVuc3VyZXMgdGhhdCBib3Ro
Cj4+IGNoYW5uZWxzIDAgYW5kIDEgYXJlIGVuYWJsZWQgd2hlbiBtdXggc3dpdGNoZXMuCj4+Cj4+
IEluIGZhY3QsIHdlIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBjaGFubmVsIDAgaXMgZW5h
YmxlZC4gVGhlCgpJdCBpcyBpbmRlZWQgbmVjZXNzYXJ5IHRvIGVuYWJsZSB0aGUgZ2xpdGNoLWZy
ZWUgbXV4IG9uICpib3RoKiBjaGFubmVsIDAgCmFuZCBjaGFubmVsIDEgdG8gYWxsb3cgcHJvcGVy
IHN3aXRjaGluZy4gbXVsdGlwbGUgb3JpZ2luYWwgY2hhbm5lbCBjbG9jayAKY3ljbGVzIGFuZCBu
ZXcgY2hhbm5lbCBjbG9jayBjeWNsZXMgd2lsbCBiZSBmaWx0ZXJlZCBkdXJpbmcgbXV4IApzd2l0
Y2hpbmcuIEFuIGV4YW1wbGUgb2YgdGhlIGNsb2NrIHdhdmVmb3JtIGlzIHNob3duIGJlbG93OiBf
XyBfXyBfXyBfXyAKX18gX18gX18gX18gb3JpOiDihpEgfF9f4oaRIHxfX+KGkSB8X1/ihpEgfF9f
4oaRIHxfX+KGkSB8X1/ihpEgfF9f4oaRIHxfX+KGkSBeIDEgKiBjeWNsZSAKb3JpZ2luYWwgY2hh
bm5lbC4gXyBfIF8gXyBfIF8gXyBfIF8gXyBfIF8gbmV3OiDihpEgfF/ihpEgfF/ihpEgfF/ihpEg
fF/ihpEgfF/ihpEgfF/ihpEgCnxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIF4g
NSAqIGN5Y2xlcyBuZXcgY2hhbm5lbC4gX18gX18gXyBfIF8gXyBvdXQ6IOKGkSAKfF9f4oaRIHxf
X19fX19fX19fX19fX19fX19fX19f4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIF4gXiBzdGFy
dCBzd2l0Y2hpbmcgbXV4LiAKc3dpdGNoIHRvIG5ldyBjaGFubmVsLgoKPj4gcHVycG9zZSBvZiBD
TEtfT1BTX1BBUkVOVF9FTkFCTEUgbWF5IG5vdCBiZSB0byBzb2x2ZSBvdXIgc2l0dWF0aW9uLAo+
PiBidXQgYWRkaW5nIHRoaXMgZmxhZyBkb2VzIHNvbHZlIG91ciBjdXJyZW50IHByb2JsZW0uCj4g
VGhpcyBpcyBsYXN0IHBvaW50IGlzIGltcG9ydGFudC4KPgo+IEl0IGlzIE9LIHRvIHVzZSBhIHNp
ZGUgZWZmZWN0IG9mIENMS19PUFNfUEFSRU5UX0VOQUJMRSBidXQgaXQgbmVlZHMgdG8KPiBiZSBk
b2N1bWVudGVkIHNvbWVob3csIHNvIHdoYXQgcmVhbGx5IG1hdHRlcnMgaXMgc3RpbGwga25vd24g
MnkgZnJvbSBub3cuCj4KPiBNYWtlIHN1cmUgdGhlIGluZm9ybWF0aW9uIGFwcGVhcnMgaW4gdGhl
IGNvZGUgY29tbWVudHMgYXQgbGVhc3Qgb25jZS4KPgo+Pgo+Pj4gTGFzdCBidXQgbm90IGxlYXN0
OiBpZiB3ZSdyZSBydW5uaW5nIGludG8gYnVncyB3aGVuCj4+PiBDTEtfT1BTX1BBUkVOVF9FTkFC
TEUgaXMgbWlzc2luZyB0aGVuIHRoYXQgcGF0Y2ggc2hvdWxkIGNhcnJ5IGEgRml4ZXMKPj4+IHRh
Zy4KPj4KPj4gVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAuIEknbGwga2VlcCBhbiBleWUgb24gaXQg
aW4gdGhlIG5leHQgdmVyc2lvbi4KPj4KPj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IE1hcnRpbgo+
IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
