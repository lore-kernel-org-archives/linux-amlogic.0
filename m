Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C60ECCF9F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riw9NgcZKtPww27ttA+QI9EWsI3v8gS//1MiZJePW7U=; b=p8OlS5M7p6Hy8vrp4UELeRphLX
	Ru/EsgNpgmU79QJfuETRYqfILwEISezRetRWlO14+vTLuCblOm325uebt+rLASdk15pm2uSHUuIUN
	xR/YSX8WO/FBvrKqNV2EKn2wWcuvlUDWvPpoHUgswIJ3FrPoF4IJ4o2m2ujGLwIeV9EnN30iRqTqA
	RJj3QR9TNpP9dD2d1gPzKhIqMbecAYpt3ibTz+JZ/Y7E6jyZ+PwqxA5QYGxK7a8tTO17r78odrNh+
	kgsBn2x+7fCmIiYfqa0DuCsazvloGwiEFbI9DS/+xFLSYJ9N8ePdAvTG6/I6bTwLoXMDVRBLui5mu
	0jAjNerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOlI-00000003pZS-1rsR;
	Thu, 30 Oct 2025 09:16:04 +0000
Received: from mail-japaneastazon11023078.outbound.protection.outlook.com ([52.101.127.78] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOlF-00000003pZ4-1L3q;
	Thu, 30 Oct 2025 09:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQcbYM7l6+kSj2h6p8UKe68QvnLftde/V45sZDesCJm8PkZR3OiApmdpgdaTL868YIUZALXC5T1YTV4CPxDaBytlVQfYPuqFQke9euT1yPVQr0hpwWicMRhjigcs5AhYaNOKKEmalzQaRApqmsDA3pEp3OoVr6t4mrhtlWBz7czofKEirBwsxROvwbqrbvk9aqfAuXfOzYY3suX/lvePZj7agdr5weFzQhqOPMwvpl6auUek9LPXYqeNifohx54NaX/iIIdcH0sn0ReHpb5TNQX3dl2mAAgfFUK/KKNEBj9I1SQNwuqY968/ebDO3N9davDlSjxtiQ36h9s3wtdz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQiJDPnbQT0AreR9PkjMbtGDTjJDICmALyTbkdmaZf0=;
 b=hKP52Dyw7JOWcIpuzV5EMgCBn9aKzyK33SR4pz0TtNQOZI2KlEStUTaglRbQPxjS10tf3AIyMKnsoHtHev/x7m67aguio4K2NMnZejNQdnMm2zhEVSjx/yRkwPn0D5sxLYhXfG6C6znkqCQesN8qlQdbHfjwiVgQ+CRCKWF9Pj7elrfGZ8PZUvzpAjKxv5TlUWRpIKq+0ys9riXeT3ODggUOBVu17wOqVeEHRCXwbrfl5U2yIh4riQ+mpux57fx0NOA73pcU+uaDGbHKzTQ3dzwcydFY/8CA5wmJBx0Jum4Ja1bnN5L8fVRL8WNvgFCOw6obsYWgBHGoWdwIqBql/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQiJDPnbQT0AreR9PkjMbtGDTjJDICmALyTbkdmaZf0=;
 b=Cr/eYB0e3CVmLRR42t9MgUwhZJCZHYbJnQI5dJaQsH3yxLmD84Rz6WV9OJpVlycrvZ7RN7vLPSLfZUrkKL7qa0C+5Ssh1//eAoQ46+XaMCez0B3Z0gAGTibBqFPPSKU7f98Bj6iVnCjcWhAcInYJys/0IpBT5KA54RzN6ya65f6lh+U2Yujqag18LoJ/Ywh84Aqk7DNhYUT9MvaOJFPGNPAaQ8jkTlG+tay5A0r1swy3Fa7uu17p5lY1hFvc71ogMFXNCr1ro40qRzbAnHW/lInAp34MzWcLBfyjJmX8HBa3oQligvIWJxyhf4JoX654o07Z4iRuIPNLdW47m6GyaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KUZPR03MB9526.apcprd03.prod.outlook.com (2603:1096:d10:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 09:15:55 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 09:15:55 +0000
Message-ID: <4f245c6a-5a03-4321-bbf8-61249a7a550f@amlogic.com>
Date: Thu, 30 Oct 2025 17:15:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: amlogic: Add handling for PLL lock failure
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 da@libre.computer
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
 <20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
 <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KUZPR03MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a689233-76e4-4c30-79b2-08de1794ee03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZ1ZFJMYjgxck84TzdBeldPb1ZZbmR2UnprNit4dlV4dTduSDZQMmE5TzNZ?=
 =?utf-8?B?RlhKYzJoQ3JaYWVPMTBQa1NDZTBya3J1dVlJOERPWE50eDJBVFpxRXlteXh4?=
 =?utf-8?B?VEcwOXBBck4xbnZmNExOdEhpclFCbElqd1d2aWRYOTRBTmI2T1JFV2Jzb3F2?=
 =?utf-8?B?U2NnT2JYVEVMQTdwajRSSkZtNWd6TGFSSDhLYkE3aTNvTEpDZ1dwdHRINjR4?=
 =?utf-8?B?WTdJRzVFSTdyK241cVFPMktJdFBRYVVYOGxvdTBSZXc0MmlmdTF5YjBGVXEv?=
 =?utf-8?B?emVKcHR6aHBleFp1ZUdnTFVoTVkyckFrRmVQQUVPU0dtV1ArZyt4VG8zWWNQ?=
 =?utf-8?B?cklZTW1UMUdrUVNPYSt6Wm16UGxLUmE4OUIwcERGRlREeVFYTW0yeGFRVUtZ?=
 =?utf-8?B?MnBmWVprdXcrMGtmUzVBSitqV05RNCtOU3lHNHF0c1RibVd0UERvL3UyOFRu?=
 =?utf-8?B?RmoyVUVqNHRzRy9qWnVhdStPOTRqdUZrRGFZTWRRZU82d3FHeHdMNXppSVp4?=
 =?utf-8?B?YnZxUER6ZVlTaFp3U0J6RzFvaC9tMXhsbUpCa25tN3ZnSEVsaUlkOGxsc3NC?=
 =?utf-8?B?YlV6NnZ3SWRtQmRRaWlBWlRIYjd1MW10cGZVYjEyS3BleUQwS2JSaTdHMEkr?=
 =?utf-8?B?TWVPQ1dxYlBYUWcxNVJZRDV1THRMT1FZWDR0UnR3dGVRUFYzYjdRVFJuMW5S?=
 =?utf-8?B?b09neGlXT1hrNVVWRDkwT0ZGN0trZU0yZUNYdDU0dng2dFdlSHZVQ1U5cjVh?=
 =?utf-8?B?UVlFODFyaFZHbU9ETlkrSGJiVFFDS0p1eEF4UnQ0M05CaTloUGFhOGxRTVE5?=
 =?utf-8?B?N0VuZTZ2cnBrOW5udzI5Y2tRbTdTdHJ5bWIvUGlPRy9scGZheTBtNCtpOWlP?=
 =?utf-8?B?Yk1OcURsVHcyMXZ4ZXJpSE1MMDVuRlRsaGFqNzA4RUlZZjNwa2xCcTJjWTAr?=
 =?utf-8?B?Mys4QVVaWkl2cDg1TjNSOTdoMmZyZ2J5Q0ZOcDVEd3JhRUhjaHhmNi9SWmUx?=
 =?utf-8?B?Q0xGTmZSMnZ6ZjFjZlh1TTFjWkVLcEdOVEwxWTVGVExTNEE3ejRHZzZZRjY1?=
 =?utf-8?B?TjhGazBCSUthbmpCVkF3aGtwRnRVeWFiOEUwSWdRSk1IajBFR1czNUFUVWJl?=
 =?utf-8?B?WlZsRlc3R21XSjRBL256d0o1clBGeENjSUF5aHhSa3B3ZUtRQURFQmpaMmE3?=
 =?utf-8?B?T3dUNlRFWCtIN2dyRFN5YVFBVXdEdlRDdU5Mbng5SWFEeWhNSWoxQ3dJbjNL?=
 =?utf-8?B?TUZ1TEVRUFAvMTdxWWprU0ZpSlNRU2g1Qld6c21hQjArR1hpSCt1eXRIb0Ny?=
 =?utf-8?B?dkpkT09RVnBiaDl4eUp4anRnN2krUnZQY3R4T1Q0YkZhemtVTE1STFZvb0h1?=
 =?utf-8?B?Nm1PR2M3SlFrRTFOU0YyNzZFY2tHMDhCdnlKejAxZklLaXZ1dzJkZDRidGEr?=
 =?utf-8?B?Tm5HUFJHZUNzM2VGVTlnWGZyNDlMUXR0ZTk0bGF3OGcxVElGVlVhQlRxNGkv?=
 =?utf-8?B?bmJhVXNrSU5KcjZnSzVlaTJIdVhteVlMZFhyZnp2RE1NSUFHTVk1WTJ6U1dk?=
 =?utf-8?B?SjJVWWFQNG9DcTN6Z3VkZTZnQm1JSzRhZFErbytNTDhRcHc1RHErOEs0Ty90?=
 =?utf-8?B?a1k0QVJvL2hjYWZheXhXRktnbFBST3cxLytvcFkvVWxvdi9kcnV3bjJNQkRr?=
 =?utf-8?B?SEk3b2h3RnRmVUliTnFZZ3kvS3dXbmllY2NubkQ5QVpsUFZieVpCU0dObHlu?=
 =?utf-8?B?aTN3cVNhUWxiVk5jbW1wbUUzTCtabk9XMStLVy9UZ0cxUGVKcFVvdGxMK291?=
 =?utf-8?B?dHJNTGs1WHZPOU9QdmZFMlFZbS9kSjBUUnFCNDVPR1hEQzRhUElBT1ovK2dN?=
 =?utf-8?B?Z2tkaDA5YTJJT1MwQkpBeHJQc28xbDBBZzRoS2xhUUNydmhNM010S0YxZyt2?=
 =?utf-8?Q?ufQBFCZdlBaAK/HxzPsbLyIHOgmex1dc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpKRHYvdFNkQUZJNytQVHZSa01NUVh6MC9JUDgvRG9Wb1p0SHNNOXVUbDRs?=
 =?utf-8?B?ZXlVRUVUb2x0dWNrbDdFM2psMW1HOS96MWdVTE1GajRJM0tScmxWODQ2Rld0?=
 =?utf-8?B?WUw5RElhQ1RESUVXNklUSE5SRWRhTlZoMUpTbEowM1NrMVdrTWVGTzhSQ21q?=
 =?utf-8?B?dWVFU3h0NnVyZXlLL21GNTFLSG9tRGdudFBCcllMN1ZwQ3Y2amkyVmQ0Z3M3?=
 =?utf-8?B?a1pGenNwZU5VMmNURE5aM3NoRjc1R3lTUXNuUHUwYm1nN2daU3NzRXVReFlE?=
 =?utf-8?B?VUNwZUY5SnVkT2tJcHV4RGl5aW9rcXJhc2VhRW0xSVROUkp4VldMYW12ek1S?=
 =?utf-8?B?a1FnaURPRk02N3VURzJ3U1JCclNvVVd3RC9Tek9MKzBnUmxDSmdMVVBUZXBa?=
 =?utf-8?B?REhDaUdzNHRRd1l4dDcya3p1K0Fldkh6dGF5emxqeDlrNURwaFBIaUpQeUFK?=
 =?utf-8?B?aFZ5MFJldFo5bUI3UXJMZnhBUFJkaFJDRThjWjBFSE93YWYzNTJYYjQrN3FV?=
 =?utf-8?B?OG1RTUNwcE00SGIrSjN3VjJMcVZLREhYNEFxbDNScXMrd2ZXWWVURHdta2NG?=
 =?utf-8?B?eVhJN1BjSmo4WlExN0wyNXJVSldWK1g2R3hPVE9vSFlKSGk4bWtmVW50ZTJH?=
 =?utf-8?B?UzhqeW1hL21UdlNhVzhPY1hHRzhvUWVYN2J6aUR6UWRpV3NhZFk0NElFcUhv?=
 =?utf-8?B?N0ljbTlpZHkyb1FOS1JWd1YybHNhQ0wxV1pJZWRmQ2JIN01oQXBDVU1xMVBJ?=
 =?utf-8?B?NGlUeGdoRE5INjRubVE3Qm9wR1pXZW5CeXpOc3AzcXgrWWdkTVBYeEwxa05Z?=
 =?utf-8?B?VXpCbi9RYjU2NnVLcUEzbnJrM3Ftc0ovTDUreWxJRzZ0aHJvK0JuTERNWlc0?=
 =?utf-8?B?bjU3Nlpkc1BYWkhXeHF0MnRxbWJEb1MxQzAxYWllNS9rcWxPMy9DOFEwUDBl?=
 =?utf-8?B?RnNPUTNyT1liTUwvdWc3ODBFQlk1MVNOSjRlMVMwdUpseTR3TXczMmlpL0xI?=
 =?utf-8?B?WkZmcUovVlJOMkdRVlVkUEZtV2Z0VmJZNmszKzNKVlFPSGFlZC9UeDhsUzVx?=
 =?utf-8?B?TzF5ODFNK2ZVaG9lNWVBNzNkY05vVDR5MnF0SVQvbTVxZlhwWHJSUk4yU1B6?=
 =?utf-8?B?YUVFNGxZckJETEpsWkFvMzdTUVM4bkNmNGdEdENTYXliVzBEQ2Z0RGRZamZI?=
 =?utf-8?B?N09xb09IM0hjS01OUmlkUXpVRk5obTVNaVBsMzJ4YVc1aTN4VjdNd0lpOXRU?=
 =?utf-8?B?N3dUMDdMc0hnWVlzdmg1Vlc1MS8wM203TGR3bUxFY0Y0MHdCRG4wL3ZyL2dR?=
 =?utf-8?B?NE5nVkRURGlqUFhPRDZQQTJjbURUTXZHcjQwM3BpOThVazZtdGdoUVlhRENE?=
 =?utf-8?B?QStFT0R4UmxFU1k1THV6TnRGRE1SNkVxemhJTWF5Y3lyV1lPMGpqd3NiaTBh?=
 =?utf-8?B?ODA2WkNHbUx3QTNwS2ZEN1VrbUo5Rk9OaDloZzBqdnpYS0liZUpxRXlEa00z?=
 =?utf-8?B?cDNXTC9kUmNNOFFKWWRZTVA3UjB3N1dFMlBGLys0RDFuQ21XSXZ0Z0x5OGJD?=
 =?utf-8?B?dHc1YnUrYnhQM1E1c00xWERuTTJ6MjRqbWZPRmpQNnF4bHBvQjFMWGtCSGtx?=
 =?utf-8?B?MkZ1bWtVYmluK3VkREZLSkVBRmo2c2svU3FXUlN1eUg1YlhKR0J4eHBKSlhB?=
 =?utf-8?B?L010cFR5WHk3eXNzZzY1OUhvMlh5MlhUemlXMmFnM09CZm5LdXZoaFUrVFVq?=
 =?utf-8?B?VldsQmJzMElmVmp5d0MrcVg4S3FJZ3ZvSnphdDRLS095YXFwejJyUEZYNjFU?=
 =?utf-8?B?TWFNcUZ3RjNHa2U1VWZ2WmtjVFJKc282anJzanBSRmIwN1E2TmprWWVtQ3Mv?=
 =?utf-8?B?UnZtODBkTERRbTF2Q1VtTWNXT3ladXQxWFRvYkVObHZpTnFlclVCTTdjWFVW?=
 =?utf-8?B?SDh6enNSRE1QejN3dDJZUmVBV0Q0SzJybGhIVXlNY1pxUG5adldFd29WQWw2?=
 =?utf-8?B?c2duclpsV2JBdlN3T2llQldLaXBrWXhjUGY0SE0wSm1lcTJNZlNkMnllZTZF?=
 =?utf-8?B?MWNEQzFDaW1qMXEzbldhMFI3aUp4SS9GMytvSGZ2ZHJ5K2RReGFGUHlHKy9K?=
 =?utf-8?Q?bCPzp8HFT8IuX8h5bjqEGere3?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a689233-76e4-4c30-79b2-08de1794ee03
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:15:55.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci0guYXqZ9Bvm0zCuF0I3dl6FjnSnGWMX8oY58oN366uY+uEzut3sWE27Pl3voCdx6EcsV0n932naP01FDLQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021601_367427_9FDD4E5A 
X-CRM114-Status: GOOD (  19.86  )
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

SGkgSmVyb21lLAoKT24gMTAvMzAvMjAyNSA0OjMyIFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIFRodSAzMCBPY3QgMjAyNSBhdCAxMzoyNCwgQ2h1
YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4+IEZyb206IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29t
Pgo+Pgo+PiBJZiB0aGUgUExMIGZhaWxzIHRvIGxvY2ssIGl0IHNob3VsZCBiZSBkaXNhYmxlZCwg
VGhpcyBtYWtlcyB0aGUgbG9naWMKPj4gbW9yZSBjb21wbGV0ZSwgYW5kIGFsc28gaGVscHMgc2F2
ZSB1bm5lY2Vzc2FyeSBwb3dlciBjb25zdW1wdGlvbiB3aGVuCj4+IHRoZSBQTEwgaXMgbWFsZnVu
Y3Rpb25pbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9n
aWMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgfCA0MSArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+
PiBpbmRleCBmODFlYmY2Y2M5ODEuLjZjNzk0YWRiOGNjZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9jbGsvbWVzb24vY2xrLXBsbC5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwu
Ywo+PiBAQCAtMzUzLDYgKzM1MywyMyBAQCBzdGF0aWMgaW50IG1lc29uX2Nsa19wY2llX3BsbF9l
bmFibGUoc3RydWN0IGNsa19odyAqaHcpCj4+ICAgICAgICByZXR1cm4gLUVJTzsKPj4gICB9Cj4+
Cj4+ICtzdGF0aWMgdm9pZCBtZXNvbl9jbGtfcGxsX2Rpc2FibGUoc3RydWN0IGNsa19odyAqaHcp
Cj4+ICt7Cj4+ICsgICAgIHN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3
KTsKPj4gKyAgICAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsID0gbWVzb25fY2xrX3Bs
bF9kYXRhKGNsayk7Cj4+ICsKPj4gKyAgICAgLyogUHV0IHRoZSBwbGwgaXMgaW4gcmVzZXQgKi8K
Pj4gKyAgICAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKQo+PiArICAgICAg
ICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMSk7Cj4+ICsKPj4g
KyAgICAgLyogRGlzYWJsZSB0aGUgcGxsICovCj4+ICsgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xr
LT5tYXAsICZwbGwtPmVuLCAwKTsKPj4gKwo+PiArICAgICAvKiBEaXNhYmxlIFBMTCBpbnRlcm5h
bCBzZWxmLWFkYXB0aW9uIGN1cnJlbnQgbW9kdWxlICovCj4+ICsgICAgIGlmIChNRVNPTl9QQVJN
X0FQUExJQ0FCTEUoJnBsbC0+Y3VycmVudF9lbikpCj4+ICsgICAgICAgICAgICAgbWVzb25fcGFy
bV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMCk7Cj4+ICt9Cj4+ICsKPj4gICBz
dGF0aWMgaW50IG1lc29uX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAgIHsK
Pj4gICAgICAgIHN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4g
QEAgLTM5NywyOSArNDE0LDE3IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX3BsbF9lbmFibGUoc3Ry
dWN0IGNsa19odyAqaHcpCj4+ICAgICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5t
YXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4gICAgICAgIH0KPj4KPj4gLSAgICAgaWYgKG1lc29u
X2Nsa19wbGxfd2FpdF9sb2NrKGh3KSkKPj4gKyAgICAgaWYgKG1lc29uX2Nsa19wbGxfd2FpdF9s
b2NrKGh3KSkgewo+PiArICAgICAgICAgICAgIC8qIGRpc2FibGUgUExMIHdoZW4gUExMIGxvY2sg
ZmFpbGVkLiAqLwo+PiArICAgICAgICAgICAgIG1lc29uX2Nsa19wbGxfZGlzYWJsZShodyk7Cj4+
ICsgICAgICAgICAgICAgcHJfd2FybigiJXM6IFBMTCBsb2NrIGZhaWxlZCEhIVxuIiwgY2xrX2h3
X2dldF9uYW1lKGh3KSk7Cj4+ICsKPiAKPiBUaGlzIGlzIHNvbWV0aGluZyB0aGF0J3MgbGlrZWx5
IHRvIHNwYW0sIHNvIHByX3dhcm5fb25jZSgpIChpZiB5b3UgbXVzdCB3YXJuKQo+IGFuZCBJIGRv
bid0IHRoaW5rIDMgIiEiIGFyZSBuZWNlc3NhcnkgdG8gY29udmV5IHRoZSBtZXNzYWdlLgo+IAoK
SW4gdGhlIG5leHQgdmVyc2lvbiwgSSdsbCByZW1vdmUgdGhlICIhIiwgYW5kIHJlcGxhY2UgcHJf
d2FybiB0bwpwcl93YXJuX29uY2UuCgpTb21lIGRyaXZlcnMgdGhhdCByZWZlcmVuY2UgdGhlIGNs
b2NrIG1heSBub3QgY2hlY2sgdGhlIGZ1bmN0aW9u4oCZcwpyZXR1cm4gdmFsdWUgKGV2ZW4gdGhv
dWdoIHRoYXQncyBub3QgaWRlYWwpLCBzbyBhZGRpbmcgdGhpcyB3YXJuaW5nCm1ha2VzIHRoZSBp
c3N1ZSBtb3JlIG5vdGljZWFibGUuCgo+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPj4g
KyAgICAgfQo+Pgo+PiAgICAgICAgcmV0dXJuIDA7Cj4+ICAgfQo+Pgo+PiAtc3RhdGljIHZvaWQg
bWVzb25fY2xrX3BsbF9kaXNhYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAtewo+PiAtICAgICBz
dHJ1Y3QgY2xrX3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4+IC0gICAgIHN0cnVj
dCBtZXNvbl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19wbGxfZGF0YShjbGspOwo+PiAt
Cj4+IC0gICAgIC8qIFB1dCB0aGUgcGxsIGlzIGluIHJlc2V0ICovCj4+IC0gICAgIGlmIChNRVNP
Tl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+cnN0KSkKPj4gLSAgICAgICAgICAgICBtZXNvbl9wYXJt
X3dyaXRlKGNsay0+bWFwLCAmcGxsLT5yc3QsIDEpOwo+PiAtCj4+IC0gICAgIC8qIERpc2FibGUg
dGhlIHBsbCAqLwo+PiAtICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5lbiwg
MCk7Cj4+IC0KPj4gLSAgICAgLyogRGlzYWJsZSBQTEwgaW50ZXJuYWwgc2VsZi1hZGFwdGlvbiBj
dXJyZW50IG1vZHVsZSAqLwo+PiAtICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwt
PmN1cnJlbnRfZW4pKQo+PiAtICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAs
ICZwbGwtPmN1cnJlbnRfZW4sIDApOwo+PiAtfQo+PiAtCj4+ICAgc3RhdGljIGludCBtZXNvbl9j
bGtfcGxsX3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3Jh
dGUpCj4+ICAgewo+IAo+IC0tCj4gSmVyb21lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
