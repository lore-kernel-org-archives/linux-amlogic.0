Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C26DCCD1BB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Oct 2025 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P0vEEGwlk/NQUn90FZ4ADeAzX2fdR7wgj3XV934ePo=; b=KDDlSJdj+V1qPMFFC4GAhAq79a
	1/Bm0+RoN21hZU8L+PwytUDgqxznLCudyMi0GerTZePj8f3QdP7WyqeCxa1VRf3psfo3Ugsclnbjb
	GUWE7gKCTb7/q/l7QRI+azI5X3HIvaKdZYLqyMvUsSRbBzh1szfz/1ql1GSUiO5iZfBl0wyoyJHiY
	hE5yUdji7xz7rDKDkBL9IaFtTiQTjF3N0tuNYDmh99SmSIz1Ef4WWys0LHJFjonrxPMJy24mjghYv
	eqOxscaGMKUDIXj0AxA4lE3t8d5fYOliQmnP4cz+gwde3v1buV+9fwckKTXb98Kb9T39ZVJjoLla7
	IcXyoP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOIj-00000001Crj-17Cu;
	Wed, 22 Oct 2025 02:10:09 +0000
Received: from mail-japaneastazon11023076.outbound.protection.outlook.com ([52.101.127.76] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOIg-00000001CrH-3DFu;
	Wed, 22 Oct 2025 02:10:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODJz16GswZYSMOA412m8YQxIrgJVyylAc7cYWdUWDZXPm9goligsVjt/SO4POgEVCJwetjY6xEDQkiKf17X3+n9BX43deoRXomBtTZ0R6gAp/FvwTgnRRqTY0tGRFvB3jh9hhU4fghw89u0aD5WxjbPmaMUZZpgtVrTzXShARzXGQiMMFoERfUGwLhasbHuHniWj+9UpqnXF6Euktb3v/5HpfcEhBXYu/APZXcunDHSAN3YmTMo6qBJookcrh3dxP16WftEoyQVYNLDu0U8W3V7glytxRIPemiseeliIJHOLSjFrYBX2SbJUuh1oVRSSbKhr/D6itpP5tTm0e9mnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgFanAJFt1rRuXXBQk1spHvxbX+f09Y+vjcZ3duqY34=;
 b=OmspVzF7cx4P92v8wJi45sNbgTSGsA2iz31vhMR937rdemB3bE6HKJEvbxBsfAHrGYCjx4qKN1vj4cgr9IvC1FGMKqYJ5kR7G8ogjy0neGiPGOubo4XUbnq7qpKjGCt8Se4931NZjKJkP6mBb6hHHCB0NKGMJtVHlbfgnyzHocSthqRCWV9KAkx/j9HzGa6+fS11fL+pSy/I9jmUkmmVTCez2FZ4CI0Du0FjxjqO5y91RkfMDKXiF0oExgMPEBgY6YowZIOq7s9PBGzPtBjnV55qvkq9yzdW1dSyB9cWoasTysr3BPx1DDjOp3UOOzlLybprW3KjWULbn+mx6C90mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgFanAJFt1rRuXXBQk1spHvxbX+f09Y+vjcZ3duqY34=;
 b=bOuz7nruqkULfrZY7p9dfnQXDdRBXlvaXAUu628D2FXoVgGyeQ1SHzIiMSqAP6i5VZVAPYY+krGnCyUw3pEx+Zq0kDCtdQp7IAPo61x3R8z/wLtbfyq2qiemxN3yYB9a0xyCozJqkSUYLXxEY2WL+ido66zMDbYHNPuHWEepdQ/ZKnX2bLF8zB6Nf61JASFc47ry9gMw2B8pFsxmLHogFHD0pQGtBQJRIU7gxfC1tX1BaajNcTnlhAceMux9/5WYry3Xy2OC8b6hQVGztcIyYLXRHxpG4H3BcV+p572qCt158/dBOGWxgG+PCAKbveIcNGmqqJzKMlZotVfMQ7ieKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB7282.apcprd03.prod.outlook.com (2603:1096:400:21d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 02:09:58 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 02:09:58 +0000
Message-ID: <5d8e439a-9ad0-4d2e-b106-d6e65a3e4638@amlogic.com>
Date: Wed, 22 Oct 2025 10:09:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
 <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
 <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d9afaf-d495-420e-8886-08de1110199d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDlyYkhpdHN1Q1ZMWnltYyt5bTdOSk4wZGRhNHcvQWZ6Vlc5c3hUMVozLzVO?=
 =?utf-8?B?SG93TzQxMWVOZkFjaEpqaE1hOGhvdHN6VE8ramdRZG03OXBXVHdZajdsUGpw?=
 =?utf-8?B?cVQ0OWFpOTkwaVNXTmNPSkQwVFRZZWxxS0RQZE9GV1liZlh5QXhOUnF1MlNq?=
 =?utf-8?B?cE5SL0hEeGcxTXl1M1NxYTBBdGF1eDR0Mnd5WXJXbVBkTTUwcTZRSHp2QTBW?=
 =?utf-8?B?Q2FodVR3N2ticTlhVjlRMjV4ZEZ4R2h3ZHdJTWJhNDhtTW5YNURTWkNqZVRB?=
 =?utf-8?B?V2xzTzBBeE04SW1yOHh3c2JmTUVHT1dtMlBsMnpPL2FTRks3YUlTM2NXNnRQ?=
 =?utf-8?B?aGdTa2pVYk9IOTJWT1p2eCtQUFliaFZmZHNYUXF4MklhRkVSaDAvUkk5cFJn?=
 =?utf-8?B?VG14ekovTU9hL09xMGRWZStyVGpFQ0RBbExTM3RNV0Jmbm1mZjBsYTc2eFVG?=
 =?utf-8?B?Y0kydlZ4aHlYeTFZM2lJMmtYT3RjNDlDdjRUYjZuSTNCcGJhaXI1RlpRUVYy?=
 =?utf-8?B?dXhHd3dpVFByQUxPS1NueGRKTzJmZWd3TDFqRURWUkxQbkNOTnZJSmYyWjc3?=
 =?utf-8?B?VzlHMDRHMTF6cVBtbmd2VWZ2amZ4U284VVhMM0U3NU9sWHpJV3J5SldxL21X?=
 =?utf-8?B?NFBCVDh3azRsL0tGWC9jU0Z2cVdoN2Y3SXB1Z2RLcHJJS1NQdkxFMjBydHJT?=
 =?utf-8?B?dUFzNE8vaU9kREdzQXVGWDNLbWRUV2d5WmdkYUJqVm90TWFidlBnbmpJMUhO?=
 =?utf-8?B?dW5abjlrT0YvVVptWTBlRFBVWGpLNENaODJoYXFYYk03eWlZVDVqd2tRMFdD?=
 =?utf-8?B?aGt4RUQ4WUZVSzFEbU55NmtIdSt4dGJmdERoLzl5ZHo0VE50cXorcmRpZUtu?=
 =?utf-8?B?MlJzREZhTXhsNG41OHZNUHA1Ym01L0VTYXVqdUhmS3hRMFNSZWdQTXgyL2VT?=
 =?utf-8?B?SEp5U0RndHUrcDZmeHdSczdkQUpZUjRoZndKMndwNXJCcmY5bzROSTQ0cGUx?=
 =?utf-8?B?aFh5M3B4VHVBTE1BMThpMlROQjRhRFZlTWpUTWJRNlNldHQwRU4wQTRzWmVs?=
 =?utf-8?B?ZkYvWHJrbFFRRm1NSmdQNFUzMW9ML21ZWXVYZzBwd3oxaTZJeTd5VnFheXJE?=
 =?utf-8?B?OTdOYkZUSmg5RGdJWWNjTVBKQys5dWZjb04yU21uQkpER09GK0Z2Q2tVdnpH?=
 =?utf-8?B?Rm5SbVVORElkMk1Hai9GSkpHQ3doYnA3T1AvWFUvby9RaWd5aklpTEphTEJj?=
 =?utf-8?B?cEV5bWtHUXpRNmJxZENUOXQxVkJMYjVjUE5Rc3dzbGxGaXdOWkphRHdPZ0lG?=
 =?utf-8?B?RzA2WmViazZiZzBMbEs0dHVKVzFXTldUbi9KdHEwdWpDMHk3SVhJNzRZcFY3?=
 =?utf-8?B?d1MrWUREUU9EVVh3d1pMUGVGSUltQk5VeGJwRzZadllGNnNZbE8zampHdWZp?=
 =?utf-8?B?OGFZQ29SSFl4RmhkY1VuM1N3dTNDK0ZGaklmalpEWjlFWjNoTGZ3dVhSSkIv?=
 =?utf-8?B?Rk9ibDVESDhwVmVYYzEwQUJtUTNSK0E0YlZURVpJcUR3OStZelk2QU9jYkNC?=
 =?utf-8?B?OXh2KzZLWExvendtN2JQeHQrclk5d3crREpUVTluS09BcDI5Z2VWMFQ5ZVY4?=
 =?utf-8?B?ZEtkZjBJQXdJNDRBRzFNbVJSdDYrSHRINkJ2UEtCOGErTC81NkpQQS9SR2xK?=
 =?utf-8?B?bW5SNG1Fa0F4THRIME5TdGswdWl1ZEJadDNseitwWGp4VjRIeCs3UlArNnJm?=
 =?utf-8?B?M0tZckUvV1RENnZNWXlQNm03TFM3UTdoVGFmZGZGWXhvL00yYUlyR0VkOFo2?=
 =?utf-8?B?Nnd3b0VmUGppeUNHd0xlTnJMUEQzMy9HR0h0N290S1FjWUhGRi9IeTRMUEpU?=
 =?utf-8?B?UHlTREdkUjdpTkdyNWpiMnZjVEorYys2dlVSS3hBM1JEV0RFRm5aR0hZL3BB?=
 =?utf-8?Q?e8NG5lTDCeMTIc1rVH4eR9p1Bny2ad5q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJyM2hUYUtZZjMwdERRVU94N1g0T2lQKzVieHBmVFZvelA5QmJxcm5rRlk0?=
 =?utf-8?B?cW92NlBtTWRHQ2k4Mkd2b3RlQkNpUzliNzBOUFFZenNzbFpRamxSa2hLTkQ4?=
 =?utf-8?B?VTlzcnUzdWpmNm50ckxIeFdOTk5jcGZZZC9RRll5Zmsra3A3NkYxdDVLT3Er?=
 =?utf-8?B?aDRVdjVpNVVrTHBKSko0dk90aEQ0NGFscXRhcG5PWjlkYzVZd0F3VWx0MXlZ?=
 =?utf-8?B?NVpkVXFFNldDM0g4TW9zWCtNQ3g5Wk0yVnlocWdwWGovOGVLeGdKS0NwNmZN?=
 =?utf-8?B?OXN0dkppMGtRamUvZE0wQkdvN1c3RVhNTGJyV0NEdkx5R21Fb21LNXI2UUVG?=
 =?utf-8?B?bC9KZGNOOTZsUXdyWE9BNHBQeER4WGhXWFR2Y0pibEd2dllRVWRkaWM4SWE0?=
 =?utf-8?B?Nm9nSFZnTDlOTFQ1TVlQRVJWdE5iMmtGY1hDOW5hakFhN0ZiMnRmWHBvczlC?=
 =?utf-8?B?UWFrOWNWN0x5U1gyVVFReTFTZTVOMzBlZDFVdlU4V3AxbVgxTHBQczZtbGpR?=
 =?utf-8?B?STFUUVYwUFdwSEd2Myt6SVpTWUVEaHd1UWJPK1VienlqWFZOSHFEWEJ0d1FO?=
 =?utf-8?B?TU9uRXdta3prWG5rMDNCeUpaWE9oUTdLRlNTQUwvSXRYVG1BR1o5dTgxSUFQ?=
 =?utf-8?B?YTBxR0FKSzR4YlB1MzUyeldZZDhMN2tlWlBsOVRTWnUvSkg2SG5EMW1hd0Vz?=
 =?utf-8?B?cTlVQmVtK3IzL2RzUStLb0VGTEJkUWdXZHhVVkpPNVNMdVNzY2VJMDJ4WTg5?=
 =?utf-8?B?NnFkb0crSDFlQ0VZYlhNMVM3K3hadmkvM3g1dHpsQ2trMWk2TTQ5U1NFY09N?=
 =?utf-8?B?cmFGQUNXd3JRdGp4cDNGL0pqUGNyYk1GcCt4ZHZYZHVIemZZcE1SdG01TDlJ?=
 =?utf-8?B?VUJPcGg1ZHVlWkxRN3ZJU1UzSHBwYkxQZC91NjJRME5OQjlwaUhDa0ZER0pT?=
 =?utf-8?B?WU5OM25IMjVCNXV1L2MyQ1hjR09Vc0tpbXVKcm5sdTZVMXg4M2ViaDMxUG5B?=
 =?utf-8?B?YkE4TFlUOUZlSmRsbi9uV1VUKzd1dlFESkhDZ2lOTkg5WmhJSUkySnRrVGV0?=
 =?utf-8?B?bytIemZVT1ErVVM4dkxqRVUvMEQ5SVhBaUtVMlBjR0ZjOUowUTZaVis3RkhP?=
 =?utf-8?B?cHA2b2ZuVm93TWhOUkMwNjNmWDVWTG9sejJEMGI4ZGE4dm5qWDErcEdlcnli?=
 =?utf-8?B?OG9tNnBORmVYWTErT3p6Zi91cTV4S3h4TzNLQ1d6YWhzL2pzSkZiU1NoTG4z?=
 =?utf-8?B?QWsrNTVZM2lKREVMTy9yd3prTzgzL0hiUVJjNVNLOUtsMTh6eTQ0Qmt2NkNL?=
 =?utf-8?B?Vms3NnlzTG1UMVkvN2I0RmhhN3JjNC91UkpHdCtvcnBvTkRFNHl3SjVnZkw1?=
 =?utf-8?B?cWlVcUFISGR3cWx1MWU5cU5JZ3E2QnZDVDg1NHFFZUJkdmE0aWV3VVFFZVhW?=
 =?utf-8?B?L015NUx0THNiVGhmRWJmRnpPTmFlSXI4d1hjYjJpZ3NwQ3U1akNiTlQ4TExO?=
 =?utf-8?B?OTMyWVVnbVhSMXpYOGVoZnM5SlN4Y0N0bUJtcGY3ZFlIR1RmSjVxMzZJaC9l?=
 =?utf-8?B?US9pOFRlT29md1p1VE9vU2ZYa0xpVVZBYitSUW5NWncrZEI1S1pqRkUvclU0?=
 =?utf-8?B?MGVYU0NxdXJyTGYzOGdWZEhYaHMrbzdpQzlHUWRmTjdEMkF5Y2tEU2JJaEd1?=
 =?utf-8?B?TTNCWEt3am16NnkvbExENEIwbEdKRnNwRWNqZkxtenVIN2M2RWlBeUpscEkz?=
 =?utf-8?B?dnJIdEl4OEt3N3pjdnlnTWdidy9hVjFDWW5pd1RlaGF4Tit2SnlPOEJWSEJV?=
 =?utf-8?B?QVpIeGlOdWV6ZUdOMjJJOHNzVkdVK1JybzRzZG44WEdPWjdrSHplNllNdU1J?=
 =?utf-8?B?WlZ2Q2NLaGFiWGxlZnlZT01Qb3dvWnc5UVNIajZOTDc0N1Q5SUVjWVg1K0hn?=
 =?utf-8?B?WWhmcGEvWHF2OTJwOXFISGovZ01CbUtvQzZ0NzhsTGx5RG9GdEdUZkx1RjBq?=
 =?utf-8?B?cnJmY21raHhtMzQ2QTBCMFdHTFExbXRNc3gwSnJxdnYvWSt2eVNXYzM5Zm1o?=
 =?utf-8?B?cGdhczRjNU9tdHROajBRTkRmQ0JtZjZuU0pOMTJnQ2h0d1dIMVlvME1YT0F2?=
 =?utf-8?B?bkhVaS9BZlFuNkxuNFJUcyt1aGRwdC9Ub2tZNERUdkJ6SExDS0c1bmpsb0M1?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d9afaf-d495-420e-8886-08de1110199d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 02:09:58.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGB62r1UZMQ0fnPt4QOQQvnyoBL1wE+mq0E4xad7PJixVsnHrFtk5O4TpgINuiqEVOffhNvRTLPP+SsI23wymNLFGD1eAZJqJul5BEZCJBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_191006_930179_5E6DA667 
X-CRM114-Status: GOOD (  13.43  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjUvMTAvMjEgMjA6MjMs
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpLAo+IAo+
IAo+IE9uIDkvNS8yNSAwNToxOSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+PiBIaSBOZWlsLAo+PiDC
oMKgwqAgQ291bGQgeW91IHBsZWFzZSB0YWtlIHNvbWUgdGltZSB0byByZXZpZXcgdGhpcyBzdWJt
aXNzaW9uPwo+IAo+IENvdWxkIHlvdSByZWJhc2Ugb24gdjYuMTgtcmMxID8KPiAKCldpbGwgZG8u
Cgo+IFRoYW5rcywKPiBOZWlsCj4gCj4+Cj4+IE9uIDIwMjUvNC8zIDE2OjMzLCBYaWFud2VpIFpo
YW8gdmlhIEI0IFJlbGF5IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gRnJv
bTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gQWRkIHBp
bmN0cmwgZGV2aWNlIHRvIHN1cHBvcnQgQW1sb2dpYyBBNS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaSB8IDkwIAo+Pj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9hbWxvZ2ljLWE1LmR0c2kgCj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLWE1LmR0c2kKPj4+IGluZGV4IDMyZWQxNzc2ODkxYi4uODQ0MzAyZGIyMTMzIDEwMDY0NAo+
Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaQo+Pj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaQo+Pj4gQEAg
LTQsNiArNCw3IEBACj4+PiDCoMKgICovCj4+Pgo+Pj4gwqAgI2luY2x1ZGUgImFtbG9naWMtYTQt
Y29tbW9uLmR0c2kiCj4+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvYW1sb2dpYyxw
aW5jdHJsLmg+Cj4+PiDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvYW1sb2dpYyxhNS1w
d3JjLmg+Cj4+PiDCoCAvIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgY3B1cyB7Cj4+PiBAQCAtNTAs
NiArNTEsOTUgQEAgcHdyYzogcG93ZXItY29udHJvbGxlciB7Cj4+PiDCoCB9Owo+Pj4KPj4+IMKg
ICZhcGIgewo+Pj4gK8KgwqDCoMKgwqDCoCBwZXJpcGhzX3BpbmN0cmw6IHBpbmN0cmxANDAwMCB7
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMs
cGluY3RybC1hNSIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJhbWxvZ2ljLHBpbmN0cmwtYTQiOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJhbmdlcyA9IDwweDAgMHgwIDB4MCAweDQwMDAgMHgwIDB4MzAwPjsKPj4+ICsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW96OiBncGlvQGMwIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4
YzAgMHgwIDB4NDA+LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDwweDAgMHgxOCAweDAgMHg4PjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWctbmFtZXMgPSAiZ3BpbyIsICJtdXgi
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW8t
Y29udHJvbGxlcjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAjZ3Bpby1jZWxscyA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBncGlvLXJhbmdlcyA9IDwmcGVyaXBoc19waW5jdHJsIDAgCj4+PiAo
QU1MT0dJQ19HUElPX1o8PDgpIDE2PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlveDogZ3Bpb0Ax
MDAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDAgMHgxMDAgMHgwIDB4NDA+LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwweDAgMHhjwqDCoCAweDAgMHhjPjsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWctbmFtZXMg
PSAiZ3BpbyIsICJtdXgiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdwaW8tY29udHJvbGxlcjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjZ3Bpby1jZWxscyA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvLXJhbmdlcyA9IDwmcGVyaXBoc19w
aW5jdHJsIDAgCj4+PiAoQU1MT0dJQ19HUElPX1g8PDgpIDIwPjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH07Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBncGlvdDogZ3Bpb0AxNDAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHgxNDAgMHgwIDB4NDA+LAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwweDAgMHgyY8Kg
IDB4MCAweDg+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZy1uYW1lcyA9ICJncGlvIiwgIm11eCI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpby1jb250cm9sbGVyOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNncGlvLWNlbGxzID0gPDI+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW8tcmFuZ2Vz
ID0gPCZwZXJpcGhzX3BpbmN0cmwgMCAKPj4+IChBTUxPR0lDX0dQSU9fVDw8OCkgMTQ+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdwaW9kOiBncGlvQDE4MCB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDE4MCAweDAgMHg0MD4sCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPDB4MCAweDQwwqAgMHgwIDB4OD47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVnLW5hbWVzID0gImdwaW8iLCAibXV4IjsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2dwaW8tY2Vs
bHMgPSA8Mj47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNfcGluY3RybCAwIAo+Pj4gKEFNTE9HSUNfR1BJT19E
PDw4KSAxNj47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb2U6IGdwaW9AMWMwIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4MWMw
IDB4MCAweDQwPiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8MHgwIDB4NDjCoCAweDAgMHg0PjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWctbmFtZXMgPSAiZ3BpbyIsICJtdXgi
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW8t
Y29udHJvbGxlcjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAjZ3Bpby1jZWxscyA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBncGlvLXJhbmdlcyA9IDwmcGVyaXBoc19waW5jdHJsIDAgCj4+PiAo
QU1MT0dJQ19HUElPX0U8PDgpIDI+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9jOiBncGlvQDIw
MCB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDB4MCAweDIwMCAweDAgMHg0MD4sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPDB4MCAweDI0wqAgMHgwIDB4OD47Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnLW5hbWVzID0g
ImdwaW8iLCAibXV4IjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgI2dwaW8tY2VsbHMgPSA8Mj47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNfcGlu
Y3RybCAwIAo+Pj4gKEFNTE9HSUNfR1BJT19DPDw4KSAxMT47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z3Bpb2I6IGdwaW9AMjQwIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4MjQwIDB4MCAweDQwPiwKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8MHgwIDB4MMKgwqAg
MHgwIDB4OD47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnLW5hbWVzID0gImdwaW8iLCAibXV4IjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2dwaW8tY2VsbHMgPSA8Mj47Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpby1yYW5nZXMg
PSA8JnBlcmlwaHNfcGluY3RybCAwIAo+Pj4gKEFNTE9HSUNfR1BJT19CPDw4KSAxND47Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ3Bpb2g6IGdwaW9AMjgwIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4MjgwIDB4MCAweDQwPiwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8MHgwIDB4NGPCoCAweDAgMHg0PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWctbmFtZXMgPSAiZ3BpbyIsICJtdXgiOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW8tY29udHJvbGxlcjsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjZ3Bpby1jZWxs
cyA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBncGlvLXJhbmdlcyA9IDwmcGVyaXBoc19waW5jdHJsIDAgCj4+PiAoQU1MT0dJQ19HUElPX0g8
PDgpIDU+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9fdGVzdF9uOiBncGlvQDJjMCB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAw
eDJjMCAweDAgMHg0MD4sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPDB4MCAweDNjwqAgMHgwIDB4ND47Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnLW5hbWVzID0gImdwaW8iLCAi
bXV4IjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
cGlvLWNvbnRyb2xsZXI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgI2dwaW8tY2VsbHMgPSA8Mj47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNfcGluY3RybCAwIAo+
Pj4gKEFNTE9HSUNfR1BJT19URVNUX048PDgpIDE+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfTsKPj4+ICvCoMKgwqDCoMKgwqAgfTsKPj4+ICsKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0MDgwIHsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhNS1ncGlvLWludGMi
LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiYW1sb2dpYyxtZXNvbi1ncGlvLWludGMiOwo+Pj4KPj4+IC0tIAo+Pj4gMi4zNy4x
Cj4+Pgo+Pj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
