Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258C8CCF9E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 04:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8H9yk/MvcLLaa0QrXjOXPpuR/pVEGz8oJwezx+wVj0=; b=cgUt8gluDBG/UMAujgdZX9cOsU
	PAiWBxlSaToMi64aEgYoS0rOPvJkYoiKEC4g+G6cgtfMyl0qRhPNe7DeCePkjl5QgUtbunGGLtvIo
	stnx8pwRVHzqJUglqye32bYChfh4F1tTSHKowKxFdhP7km/4slkMQzBIW8SVHIi3oJ9k968ywaqrR
	Yi83clkNW8J9UWzpoetr+bwTAHetmu1D9Oy2WvhLhm4SJGC1OBMWOAD5izu3DucBfNFwoyZO0VN2z
	U7MtUiM+8CapUMwJBfXTlBFDwj/D+o1gkULFbHPTcgzU6+JDJ0y3vQhSaVWBOBj6ZMi9NOIswY7DZ
	y8MUIf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ9t-00000004h7u-3U6l;
	Mon, 10 Nov 2025 04:05:37 +0000
Received: from mail-japanwestazon11022097.outbound.protection.outlook.com ([40.107.75.97] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ9q-00000004h74-3Lbq;
	Mon, 10 Nov 2025 04:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy66GcJBlyGFi1Yo5Kvj+ilNTM3Ab8r8EZbV1KrAtT8Y/krAWPOykrV6+dAqCoopZ5mqxFe1Y5e97HPqzsgJtdz0ZQJmjKYLOX9ASpqWAywiVGEJlZ6ACXRfxSBl06PZYNxspxQuFzZXK/yo2q/SPb6uMb1P4JNDh7VMxkmZPXVjY0iaJLabq5eASKhAwbEY2256+M0RwktAL8ed7WayguZVsM2u50UAJnHoFr0HJjpQTzPAG4UuUV08GRJPulQVEeWxKl6PT1A9kxrv+6Dl1dhI9VvTk3uXSlS8z8BTYX9r3fTFTPcVo94Y1Nk4/1AEfG1Cn5u0S1DHjyqM4vGgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsSCaaiJR1tn9nPg2L4vWhKa5HHmyrMz2mChlJgFSdo=;
 b=QrsuiHv3PG8W36ougWcFvc7uDIt90THUftu7invJDETu54mWP9bCyyCHHmkyU2o3IN/rn6F5NeMYg9Rmur+msynZZlMbDojvIYTukP/G9OQq1IpNuRYmANHottrbOFCLQ//Tx9yVB0eFSIJXvC0Y81EbAuQh/S6MYeFEh6tU9XtQ5dV0zCc/WpEe86pypg/inV24uAHBVb6fl/QJKBNStteNcZKQwcMCpH4vB8VT3fUcaNFHK6OzRaBiPCbutVsVvl+HBaP8udEGGLap2BxJOyfak3jFHYNi025L4dbHi0wUWynE7fX7rQEMh41tHPMg4x/+kasM1uDC7N6nCu1MpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsSCaaiJR1tn9nPg2L4vWhKa5HHmyrMz2mChlJgFSdo=;
 b=UK+sfK3bvbOWMDh82VqvFYiTFY0i66BJ8x0suYhxSDDMxsZ3QyzCz0BIC02qMeoIQwpWeBr+aPNGYi+o+rgghyDi/U12yfILGAB90L5XmOKlhTpo/eSQEMNuoBTGkSPA+oHlhcO8QPTVd3IIHURgHmsYFcBYfwTt/K8rafpM8Cs5KXB+xbhsGZstBRfsnpS252jDhSviEYSCJsj3fCNMm9LUI9Ls1QB8NtQYrd++V4Q0iGk72V13YOzcCwcpgBVOn2SwcB+finaNfJUXyyWY6A98+wjzhzQCyRl3bd9mYUbpZ8OwUFxkZkoI65KpVuEWemZc023SVlC0L0xlYFiCCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KU2PPFD33A87D41.apcprd03.prod.outlook.com (2603:1096:d18::427) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 04:05:24 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 04:05:24 +0000
Message-ID: <56b943f0-d6d4-4210-8fb5-453326f277ba@amlogic.com>
Date: Mon, 10 Nov 2025 12:05:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
 <CAFBinCBy7vPq0oX0PQ=yC5E3Mx3sv6qdVHsMh-NQQzAkbDuvRQ@mail.gmail.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <CAFBinCBy7vPq0oX0PQ=yC5E3Mx3sv6qdVHsMh-NQQzAkbDuvRQ@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KU2PPFD33A87D41:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e5dfde-cc8b-42d5-ae42-08de200e5f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0p2UHZQSDBPdWVKVXdpL0ZqTUswd0piam1qcmduRmpsdDlleWFBOGNzOCtz?=
 =?utf-8?B?VTBWOEF6Yml1eGhQYzdLbkdSTkordEhzS2hPNEZtOHlaMzZrcHROcTRyVDZ4?=
 =?utf-8?B?c29IZUg4UStkcE1teWkrUzZRVS9ZZ3JqeHhXckFFckpNQzluTG9kbXBCY2R0?=
 =?utf-8?B?VHNGNkZPbFJVaGNHaVp2SG9wS0swbDRyaHMwZ2tBS0J5TlBwanNHeEVDVWRa?=
 =?utf-8?B?Y212UUl3ZG9qaFFFTG5zL29GWTNkc0Yyc0g5MVFCU0lRNFJpK1N0OW9CUjZY?=
 =?utf-8?B?NkhZMFhVcjk4cDRjaWtwTHF6ZnRjVU81bHNQNjN0SDRxVi9FN0xMTWt4TUxv?=
 =?utf-8?B?Rnp1RHc2ckV0R005Szg2VFl3T0FycnFSMGgzOStzUTBTY216MGc4MGpVTzNj?=
 =?utf-8?B?bnNwSjJsYS95OERsa0laQ0diVHN0Q0Izc0ZER1MvQ0IzRm9kNFN6Z25Mc01E?=
 =?utf-8?B?bzZadmxOMDllZENOTzVsUU1XQ3JYY0VPcGx5UGVmTWlpSGdvVjB4YUxEdkhw?=
 =?utf-8?B?SmdUSHRZQmZnN3JyUlBTVll3VHpxNC90SnZ0Y1RoUzdnNUFmNEtZN2I4Q0tB?=
 =?utf-8?B?NWhBdWl0eXlPNUxRdXBQREgzVzVlTjExRTlpeXU2cFh3VjFlYjVJS1hoYVo3?=
 =?utf-8?B?eUJTbUYwRzhUQTU4aEJrMVhvRWpxM3hub1U5TmpaUHBHU2hsZnNYK3U3Q3I2?=
 =?utf-8?B?QVMwb282WVl1L1drbml3RUVpbmVXbU1UWDQyaVFHUXF0b21udXBYbktpSWM5?=
 =?utf-8?B?MWJjQnBoUUNFRDVDZ0ZXMlRmeTVTY1RpWURCbFZVc0VUZ1QyRnBjTjhCa2hE?=
 =?utf-8?B?d1l2bFUyNTFlcVZhSW1BUjVmd2ZrZ0k3ZktqbnA0NkFFcCtvemxpL0FUVFVu?=
 =?utf-8?B?czQ3R0dnTTg1ekpQNUlBdlFGd0VjQ3JRd3llNHJGS0dlb2lwQy81T3hCc0lE?=
 =?utf-8?B?T0xTK1JSSGJwakJBVFRVd3ZQUW5yTlY3eGxtMHk1emxRdmVOUDdGN1FzUzYy?=
 =?utf-8?B?S0IwaDRmeTlVVUF2dnRqSHNCQ3B5WWlPZ0IwL1JSNDBNdFpPU2ZCV3NiRXhM?=
 =?utf-8?B?RW1Mc2ZWWi9YVnZ6ejZpQTdmYXl5RUQ3TlovZERIT1FUVFZScnRlaXVZSkxH?=
 =?utf-8?B?ZUdDVysxcmtOdlpKa0s1RDdxUVE1WnNCT3I0dEZVdCtDOWsvd2lJQnltc2F6?=
 =?utf-8?B?azhrb2Yva1dLNzJyV25KQkp1S2M1TFdFdnhWUlN2cFVXSTNwdzc5R0c4SVlB?=
 =?utf-8?B?UEp2SVNSdWlCVkFvcERzWEhMZ200QUxYdGpYSjlIdXBQbXZ2ZFNGQlE5TSsy?=
 =?utf-8?B?MnhYOWd3YUJMdTFMUXhUclkzUkZXK3hwbURZQVlwbC9Va05TSURuNEVrNk1k?=
 =?utf-8?B?My9UTmtySzhFM2R2MGFFc1FMdEQyR2Y5cUNOK2J5cWQyQ3dsRHZyQTlzY0Rz?=
 =?utf-8?B?UUVoZnhyUjhYWng1b05EaEErUkozQ2xtSUx1SWlOTS8wcXlCUm5BR0t6Qmh0?=
 =?utf-8?B?d3ZCSjZ3WEd5T2VqdlNpcnFjRk1ZZVdYOW0yM1FkaDUyZVV1UVg0QXJmNUho?=
 =?utf-8?B?R0V3R0daR1libVJMWGRIOFowWFRwRHg5d1FMVjEyVEtVdGsyNWZHQVVBNDdT?=
 =?utf-8?B?ZW9MZGtTUVd2SHRLU1BvVlpqaUFjdWNWc1NEcVByS0NrdDBZZktHdXVWTzhD?=
 =?utf-8?B?bjRqeitRQ210cUNSU1FnTmxZMWloNHYxcEYrcktxbGhDU2cveDBSZjVaL2p6?=
 =?utf-8?B?SUNLenB5MjNvTml5QlB5Sk1TQTY1T2RKODFhcjlaQnNpMUJhMlh3SXMxWFV1?=
 =?utf-8?B?bU4veG1vd01XS0tBNHFWSEdPVjg5Y3lMMGdFMWgydkxLeU12YWJwMC90TG9o?=
 =?utf-8?B?U0ZVY0MyV2hrZmdkUm90OWh2MUlacWVGcE92Y1RvWlJtRDNINThJOWU4K1ll?=
 =?utf-8?Q?Fay6/usCqYqoeYzd7+1bNXM2AgL6vLBe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dYMEZlUHFDNWkyeGw5WVN0dE90SUpNeERkdHhUVEszNUpLM1l6NzBVRXBP?=
 =?utf-8?B?QkZTaXpKUTJxL2NSNFBlamdKRkhkUTB4VnJEVi9kTXZQcytBRHBjbTQ4K2VI?=
 =?utf-8?B?REVwZTJVSnJCZmJGUk0ydHpROXZVaFV6Z0hxeDBvR3pQbDFtTys5ZVB1Rnlh?=
 =?utf-8?B?YnZhU1pVRG04QlVtWXc5bnBDUGpWbFVMVHNhb29iVWxGckk4bHBLT3lXZzls?=
 =?utf-8?B?K0tCV2NIajN6SGdLbnliOHh6RkFTNGZ6Z1JMSlBuL3pZUkl5c2ZJTUtFTTds?=
 =?utf-8?B?WG9Pb1daM1ZWSjNXNWVDc1VocDU5TlBNUHR4VklFZ2pTZHVSMWNrTWl0MHpW?=
 =?utf-8?B?QjBwbFRuU2VScGNwK215MUh5Y1BERmNiTGJNeTg1VmF0SjNJakdNTzh4L2kv?=
 =?utf-8?B?MDZ0ZWpNejFOaE9pVjZyREF0RUszSzR0ekdUdWhPcGp6cXVvelRVb0YzazdI?=
 =?utf-8?B?RW95TjRuMGVVWGJ4bk55eDVXWStCYTJtNitpR2p0ZXBxSkc0OXJTenZGbllr?=
 =?utf-8?B?clhvVUZBVWo4YlN1SWFmcUhhcEh2T3g0Z1BjaUNubDM4S0lZSERpUjQ4SjFK?=
 =?utf-8?B?elkrV2VWRVdPUWtYK2czSVRxUXRUL3hZcXdVWkhNb2VvQ2NaQkIvMGxCZDYr?=
 =?utf-8?B?a2FuejhPSGEvRVhFUzV3Vm13Vlc5RGxhcGVOcEtLZHF4MXFKRW44KzdpNHpH?=
 =?utf-8?B?RnRUbklxWllYdGhWcWZUa2Z2ajlDd0R6YzZwWjBpcUlnRHRmcDc0NnpSRmhY?=
 =?utf-8?B?V2wvcmN0a3JOZFNLZXFpZ2ZVcWV3WUZualVwaUdiSnEvS2xpNERqa1B1UUZO?=
 =?utf-8?B?VlA3czkxS1BnTnQwdmNaSzMrN1pCeGdXMll1b1VERS9ubTRHTHJKbkkrdW5r?=
 =?utf-8?B?b0poZDIybGFwVkZ3cHlyV3U0aWpiS3dLdkNrYzNQRGxpRlhQNWtTTGozSUlJ?=
 =?utf-8?B?cDlIb0hFazBuUGp5MU9oeDdVY3V5SXRxaE4ydXVvMFNkbjBsM08ySXByQTla?=
 =?utf-8?B?MDlmTFM2OHR4TjVjL3F2cWYxWEE4UjhjWXhiM3p4TDE2WXAvcm1wQlpscUJw?=
 =?utf-8?B?c2RoUHdOV3BzbUJjU1J5VDJPMXBVR2wwRkxvNFlHYjd5blpjK0VCT0lwTlpw?=
 =?utf-8?B?NTJBOWl5TG5ja24yT2FtS3YvNkFLQ2p5MjFSUG83ZUhCOGNJelN4QWhlQldO?=
 =?utf-8?B?dG9OZFhuWlQrRU1zaURIUFZDVUFOblE2SGprSXlRaWVrTWM2Mk5kSTB3UFVQ?=
 =?utf-8?B?RFkwbEN6ZnRQR3AyM0RIc3JnWHJQUk83dUhQdHRxUW0rUmtpWjgrMUlLYzhN?=
 =?utf-8?B?ek8wZHhJQjYwSUhoRVNOdk1sVWFQNUxoWHV3aHdGTWk0bG1xdWpSZlc0TzNU?=
 =?utf-8?B?NkVzZHplNUlRTFdrb3hYRVZVNk9pTmdKQ3FRRXZMcGRJVGtoMDV5dW1mQnBC?=
 =?utf-8?B?UFpWZ2I1Q3BpdXJLdGIrT01NRXdrSDJVdzh0NnF5UU8yakVjZ3ZoU1R3UDd0?=
 =?utf-8?B?Q1dnZ0xBTm8yeWRoM0c5K2xKREtZZ2JtdzJlZXZJam9EREt2U3N2SktUM1JE?=
 =?utf-8?B?eVhpdFJreFhOSHp2SFJDZW1ZcFJYbGdHMllQR2s0NUZ0VWswZ0RuYzREVnQv?=
 =?utf-8?B?N0hoaHYwL0VTUmhNVjBwMlFlbWVSQllZQSsvNWxKdFZVbnZldUxzaVM4MElx?=
 =?utf-8?B?VDNkUDlrSHFueGcrbXlLczV2VUdHNzBDTWNtVWh6VGVKY3NEYVRLSkZWc2ZX?=
 =?utf-8?B?YXhrN2NRTllzY3FYaVA4dittYTlsNTZyaHcwc2RXdS9NcmdMcFVyU1BoTllF?=
 =?utf-8?B?dzd5YVcrZmFhZUg2M2EvYkY3Si82c1M2NldMdG9XeXNJR3pCRko1MWYrMnJU?=
 =?utf-8?B?aFcyMzRZek1JNTJNcGFDbGJCNmo1blFxa1FtRHZldzUvUERWL3VRUzJkQXY5?=
 =?utf-8?B?NUE4dVNLT0hFbGtXZEYyUWtpa2RFZ3JjbHhyUm1sdHN1cFFtOGM4UGZ5WWcy?=
 =?utf-8?B?MnBvNDNYTVRCRVA1WFBQanN4eENMQUoxbEtjTlRqQ3MwYWtaZ1cwamJ2OVkw?=
 =?utf-8?B?TGtYcUF2WTdYMjZNQmg3eHFKcFdEblBocnRXYURLK0QrTk9NWFpGaE9oZU9s?=
 =?utf-8?B?RFJXSGtDbkdFNEN6U2ZwRjBzZWNEVHAzZWZvQ0wwMW16ekVjMzhRVWtOLzhi?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e5dfde-cc8b-42d5-ae42-08de200e5f94
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 04:05:24.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +US+0ovlp/1sRDvjzg5bbLqwuUGgMju9q0S8A1AjRM8mIBZSwrqKrt9F9zV+cSr/cv6gXnEZaneYKScY4ppxAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFD33A87D41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_200534_862678_8AC45BC1 
X-CRM114-Status: GOOD (  24.92  )
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

SGkKCuWcqCAyMDI1LzExLzkgNjo1MywgTWFydGluIEJsdW1lbnN0aW5nbCDlhpnpgZM6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4KPiBIZWxsbywKPgo+IHRoYW5rIHlvdSBmb3IgeW91ciB3b3JrIG9u
IHRoaXMhCj4KPiBPbiBNb24sIE9jdCAyNywgMjAyNSBhdCA2OjQy4oCvQU0gWmhlbnRhbyBHdW8g
dmlhIEI0IFJlbGF5Cj4gPGRldm51bGwremhlbnRhby5ndW8uYW1sb2dpYy5jb21Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gWy4uLl0KPiArLyoqCj4gKyAqIGVudW0gYW1sX3Bvd2VyX3R5cGVfZSAtIFR5
cGUgb2YgZGVjb2RlciBwb3dlci4KPiArICovCj4gK2VudW0gYW1sX3Bvd2VyX3R5cGVfZSB7Cj4g
KyAgICAgICBBTUxfUE1fUEQgPSAwLAo+ICt9Owo+IEFyZSB0aGVyZSBhbnkgb3RoZXIgcG93ZXIg
dHlwZXMgdGhhdCB5b3UgYXJlIGFscmVhZHkgYXdhcmUgb2YgLSBvciBpcwo+IHRoaXMgYWRkZWQg
Imp1c3QgaW4gY2FzZSIgYW4gYWRkaXRpb25hbCB0eXBlIGlzIG5lZWRlZCBpbiBmdXR1cmU/CkN1
cnJlbnRseSwgdGhpcyBpcyB0aGUgb25seSB0eXBlIG9uIFM0IHBsYXRmb3JtLiBUaGUgYWRkaXRp
b25hbCB0eXBlIGlzIApuZWVkZWQgaWggdGhlIGZ1dHVyZS4KPj4gKy8qKgo+PiArICogc3RydWN0
IGdhdGVfc3dpdGNoX25vZGUgLSBjbG9jayBub2RlIGRlZmluaXRpb24KPj4gKyAqIEBjbGs6IFBv
aW50ZXIgdG8gY2xrIGluc3RhbmNlLgo+PiArICogQG5hbWU6IENsb2NrIG5hbWUgdXNlZC4KPj4g
KyAqIEBtdXRleDogTXV0ZXggbG9jayBmb3IgbXVsdGkgZGVjb2RlciBpbnN0YW5jZS4KPj4gKyAq
IEByZWZfY291bnQ6IEN1cnIgY2xrIGluc3RhbmNlIHJlZiBjb3VudC4KPj4gKyAqLwo+PiArc3Ry
dWN0IGdhdGVfc3dpdGNoX25vZGUgewo+PiArICAgICAgIHN0cnVjdCBjbGsgKmNsazsKPj4gKyAg
ICAgICBjb25zdCBjaGFyICpuYW1lOwo+PiArICAgICAgIHN0cnVjdCBtdXRleCBtdXRleDsKPj4g
KyAgICAgICBpbnQgcmVmX2NvdW50Owo+PiArfTsKPiBHZW5lcmFsbHkgSSdtIG5vdCBzdXJlIGlm
IHRoZSB3aG9sZSBzdHJ1Y3QgaXMgbmVlZGVkIGFzIEkgdGhpbmsgdGhlCj4gY29tbW9uIGNsb2Nr
IGZyYW1ld29yayBoYXMgZXZlcnl0aGluZyB3ZSBuZWVkLgo+IFRoZXJlJ3Mgc3RydWN0IGNsa19i
dWxrX2RhdGEgd2hpY2ggYWxsb3dzIG1hcHBpbmcgY2xvY2tzIGZyb20KPiBkZXZpY2UtdHJlZSB0
byBhbiBhcnJheSBpbiB0aGUgY29kZS4KPgo+IGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2
ZS9jYW1zcy9zdGYtY2Ftc3MuaCBmb3IgZGVmaW5lcyBhbiBlbnVtCj4gKHN0Zl9jbGspIHRvIGFj
Y2VzcyBlYWNoIG9mIHRoZSBjbG9ja3MgYnkgaXQncyBpbmRleCBpbiB0aGUgYXJyYXkuCj4gWW91
IGV2ZW4gc2VlbSB0byBoYXZlIGFuIGVudW0gKGNsa190eXBlX2UpIHdoaWNoIHlvdSBjb3VsZCB1
c2UgdG8KPiBzaW1wbGlmeSB0aGUgY29kZS4KPgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBv
bmUgY2FuIGNhbGwgY2xrX3ByZXBhcmVfZW5hYmxlKCkgYW5kCj4gY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKCkgYXMgb2Z0ZW4gYXMgeW91J2QgbGlrZSBhbmQgdGhlc2UgZnVuY3Rpb25zCj4gd2lsbCBk
byB0aGUgcmVmLWNvdW50aW5nIGludGVybmFsbHkuCj4gU28gSSB0aGluayB0aGUgcmVmX2NvdW50
IGlzIG5vdCBleHBsaWNpdGx5IG5lZWRlZCwgYXMgdGhhdCdzIG1hbmFnZWQKPiBieSB0aGUgY29t
bW9uIGNsb2NrIGZyYW1ld29yay4KClRoYW5rcyBmb3IgcmVtaW5kaW5nIG1lIG9mIHRoaXMsIEkn
bGwgY2hlY2sgaXQuIFRoZSBmaWVsZCByZWZfY291bnQgaXMgCmRlc2lnZW5kIGZvciBtdWx0aS1p
bnN0YW5jZSBkZWNvZGluZy4gTW9yZSB0aGFuIG9uZSBkcml2ZXIgaW5zdGFuY2UgCnJldXNlIG9u
ZSBkZWNvZGVyIGhhcmR3YXJlLiBTbyB3ZSB0aGluayB0aGlzIG1heWJlIHN0aWxsIG5lZWRlZC4g
QW55d2F5LCAKd2Ugd2lsbCB0YWtlIHRoaXMgaW50byBjb25zaWRlcmF0aW9uLgoKPgo+IEJlc3Qg
cmVnYXJkcywKPiBNYXJ0aW4KClRoYW5rcwoKWmhlbnRhbwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
