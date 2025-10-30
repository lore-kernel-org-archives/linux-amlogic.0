Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27F4CCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MET9Tolv4QZ6NemVFB9gzbTiLSe8dBz56R1ALGW3EWU=; b=nW+CJXlimAFpXvTfZB0rJZGheb
	CyzH9Fb6Ij5autUSJErmj86iwSyVjCX7D8nXxiOuchbTjoTFd1/41NpXyroeQMUrt2EJsK3LJVp8P
	QtJpdjc+QPXdRKfKSELF8ddB0WFrclhpHNGnMV6iZPEqivvHnZMM0m6plo/i6S7GAyJfjsuNIA26m
	EnbhDoJ2aYZtEvJHfMoEJnaT4T5VcGXD7KtN14WNIUvNdp7hIXvooj2fCqKm6IOk50i4stGpxGZ4f
	oNEZBKe7TGXNINktaddAV1ogf0/UjDmvRMxt6yxjrD1lLPKQ+4IGdlD7fw39ybwztyK2khmI3X3jy
	QcMXnmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOtA-00000003qxQ-3A2G;
	Thu, 30 Oct 2025 09:24:12 +0000
Received: from mail-japanwestazon11022115.outbound.protection.outlook.com ([40.107.75.115] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOt8-00000003qw9-13MM;
	Thu, 30 Oct 2025 09:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2azSDBvOwMoiGR5T1fA4yY5Zd/dxpG/YPGvCKB3mDjP/7REP2QFnJTo3bbczRRgQH9uHnP9nvwYVaIg9X3u6AUW9HpHItSC3PYQeQKAPPT7zLrh352J1YJnz2b59lJ/5QC6C0KXgOr0/hWZFuFOE+ja6h1d6iMwW6NWg71g9keI7URYVesyKVbqje2hCL/wBrili4HOcpWwMgMCuINUXiq1LpqWuievuZkfzhm1W5TiKEtUbehjBUJHu10YhY8M4lcp1MANgViW7JqTluY2Gzr7XVuyrLfuI7y1gRBnKCAcTLe0P7WA3DDk/KoekKIzlirx+zsf/kgZBw4VvuLE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvReN9XqL5Edl2BqBRIdW4dYl7ViFSAS8aMXClKQJ+w=;
 b=kvAY+6briu9HxnThy+Cp0zcPBrZC2dEl91IFBrGCu26SS4plXnJt4uM43T11cwz9dK8IASIuhFXCgroDI7nTgp0BwuyrOYwk6DEsQk+GuX69o53a1mesb2J+GCS3162Z69VTMUuNaDMwAR23nvrSLNkxirriA4r0+m4gwlCZoP9FSy588coup618lKGf0gzP8T0AuBX2NNo0Di1Xxy834j/htKWMYYADq+9qLU4cvOmCYwbFT+jdqEabmH14YpczCAjKcNTxJy5es/jNlo+hALF3kdEOsiBOCUg1psKZjhm8QAsY3pcZfRDy8Q8lZ4ZhLUZNEJsisDraN/ZIAuZHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvReN9XqL5Edl2BqBRIdW4dYl7ViFSAS8aMXClKQJ+w=;
 b=i7uP37L/rnBhBjgVVSSPkekGoFBlTZalW6gFj76m6h1UrEoPoI7WutZPZZOGtmrRvcv6xZn3IGnkqkI9ZYW5Q9YMSAaiZC+KZallPbkogCasqb0T1yDheAQz+QMq2HJ+sirdzaHC5nK84QsyJ1ielY5XMtSP6rYnTdDUwJMT4KvW6x5aO/Bs8GFkljpkbu+5YREYEv0ZNUtZvCylrpsYAIcOi1B2nptTpWw12GNGSWTn6SkRtB3RqQZgFrdBeSSwAeV5EX+erxEfk8VGvHqjGqUg2t++u+NWYn/eWFTTykbv4P/Uy4vM8ivBd6K6OYFcHby9JI8TIq9Tq+zfokkU6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYPPR03MB9475.apcprd03.prod.outlook.com (2603:1096:405:315::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Thu, 30 Oct
 2025 09:24:03 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 09:24:03 +0000
Message-ID: <1c1b699a-6ebe-4c6c-b818-44da8e1bd79c@amlogic.com>
Date: Thu, 30 Oct 2025 17:23:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
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
 <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
 <1ja518zsvu.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1ja518zsvu.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYPPR03MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf237b9-d5b0-409e-eb40-08de179610dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUpkai9KU3R5alB1Sk5OM3BINXQzTXFyN3dLQUV3bmNxN2dDZ1AxUnM4UGtD?=
 =?utf-8?B?SlRYQVJ4VzM0MlJOcFhlcGRmUFc5cldxVnRXcEtGVVlVZjhOKy84SUoxdHpz?=
 =?utf-8?B?QVYvN0NYbEhrRitqT25OcmMrYmZiTFY0WmNKbGJKS2VpdzVNQXVUSWVvSUNt?=
 =?utf-8?B?ZmtqNzlNdGFCdUtwbUVickFQbU9pa0dXK0VhaWpySDI3MmtsRWRLSWFBa0dK?=
 =?utf-8?B?Y20yb250NG90TmZuU2dCVE9sUW1PcmxqdEZFZ2JPNjVMa0tBcTdiVTV5WFQz?=
 =?utf-8?B?VXRkZm9EVVRRMUU5bGtVSWlRNHZDNkhVVFVuYVB1d1NMQ2l5MU5EUGtCcnJB?=
 =?utf-8?B?QjFFbTBWSnJqTFpqT0ZUNWFxMlZzZkxETEM4RFdMTnZOY0h3QlZ0VWIyOWRI?=
 =?utf-8?B?Qm13cjA4ZnloeS9QSzBYT3EwaTJNNXlmTUY5V3FRQStMemJjNTZ6QTVwNlRQ?=
 =?utf-8?B?bWJRUFVFa3V1N3lRLzFJZEIvbmFIaFhPWDRxb0pXbFpnaUV3SlFONWN6bVhO?=
 =?utf-8?B?bVpTZFZoZEUrVTdhYjVaMVJndUpTT08rRk81cmp1WjlSMVBOYU9idkpCNDZw?=
 =?utf-8?B?cEZrMDJYcVlrM2oxelZnb3NJR2RnUFpzU0JKQ2E1VXJFVnI2SVVueHo4MU94?=
 =?utf-8?B?Z0RCSC9ybUJTc1ZML2VaYXJoNjdTVkZ2c2ZidjJIZnBvaklLa2xxeWNsQXFZ?=
 =?utf-8?B?MFlmVEh0dStXYVduTzQzMVRwWU1UcGVxMWQwWW5uTE1sWCtUVUo5RlpKNC8y?=
 =?utf-8?B?Y2Q0WDliTTdLRmRpM2oySWVBM0U0YkJTWEQ5N0w4ZHlKZFlQeGtsVjRaNG85?=
 =?utf-8?B?cTQwSEhrYmxKTEM1WkhvbkdGS2ZtVzZBYS9TVGRncElHMHNuVVFiSCtZL1Ix?=
 =?utf-8?B?ckRRLzE3RUgwTTZZOWpZbDRaKzExNTE5NWJVbVk2NjZSbldadGZIbFVVSWFo?=
 =?utf-8?B?WUdscklJNExheWxFYWNTVmNmRnJJS2phTFJlOTVXL3VKbmFHOGdaQk1yR3pm?=
 =?utf-8?B?Q0ViRVptZFllRGM3MWduUXh0eXNDRHIrS2R0ZS9vOG4xeGo4anhwNWovb21J?=
 =?utf-8?B?R0VSQk1FcXRkQjZ6c0F5OWxZRzdvaGNBZ2U2dy83SG9EY2tkSUxFOHhqNW9l?=
 =?utf-8?B?NEVNWXE3aWhJQTlKZGZ6dEhTWWtJeXhMajMraThPWHRQWHR1Q1graDQwWUNZ?=
 =?utf-8?B?MTBGMWt5OGxnUkZpWitsb21wMHJrNXVTclVLK1RkZW5WaGNxQ2FkSlVtb0FS?=
 =?utf-8?B?VzZrSlYyTU5tRm55ZVdsZUVXVkhFNjBnK1pOZlZwdmQ5cXNzTHd5eWhxSmIz?=
 =?utf-8?B?Zm5nVW9QTlBySU9mT21OTlIzb0tNaGtCU2ZjSkduSFNRamRPV2ZFclpHK0Zh?=
 =?utf-8?B?OVN1bURPZWw1U0tNN1JFMlNBcXZiT0xmakdtVitKamhzVFN1NVcxeWlBbkQr?=
 =?utf-8?B?UzFvYnFva1JlelR1bFdGamNHRWlwWGRMQW5tZGpwc1IxVDE0MHkyKyt0dGR3?=
 =?utf-8?B?cVJNT3hjb3V0aUplbkxDMUVrR3RwWGN3b0g5VHIxRWlWL2dSc3ZWVk5iY215?=
 =?utf-8?B?M2VtODhGdEZiQU16N3RxamJoYkUzOHpKNlR2bVBpbFBXbU9xb0ZLdnVxemJR?=
 =?utf-8?B?Z3VHWlBNd1d0Z3JhbWNOYkJIc3RFVi9zUlRpMnFnb3JjekFvd2pnbEFGK3p4?=
 =?utf-8?B?ZjZTVmIxZzVrL2hSOHFZeTdvdGUwdjZnbFVNRENUblRvcmZrb1RpMmlBM096?=
 =?utf-8?B?UXlGbEsybU90MVg4dmYzRFBrbUloN3lKOERzdW0wZ25TZGVCMkpqMzdOeWRD?=
 =?utf-8?B?Q1poZmxDNzVubERzMmt4eGl5MmdGRE1EUEJBd2RJallwSThRWVJsODFMVXpp?=
 =?utf-8?B?WStabWswZkFkQzRFWUprcGtmeEJ5V3I1TUJrL014Z3RUMmZmVTdQM0ZkaWRr?=
 =?utf-8?Q?OL9TBxrXCNy/zyfFBKC/uzShZl5qk72E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjJVSWJUQW9PQWxvZ1hoMEVLVTdXZnY5OVhONERkc0tnS0dabTdKS2VxSHNH?=
 =?utf-8?B?QXJsbUF0Y29zcG1yM1AvQ2YyWTYxaHk5dGJMYnhFcFZVdmFLamMzWWtGVFRa?=
 =?utf-8?B?eDlaQnJ1QUpOTlArenpxVWtRT3ArRFliL2RVaGhxNy9VV29mTExpRFR5eXEy?=
 =?utf-8?B?S1lyTWNpdEkxSzlBMXJNUzdQQTRqamk5dGZ1SHFDSGczRStiMXkwRmJjWnFI?=
 =?utf-8?B?WERLRktrTW1kakorQTlEcXNJTzllT09Hbmh3YTJBNHNWMiswMVlrVmFKOTY5?=
 =?utf-8?B?MUdqTnNTd1p6YVFhNGlhRE9xbStEbWxnbkt0bnBETmJ0ZElpOThweEp4ZDNo?=
 =?utf-8?B?eDV6WVpPUjJ3blplbzZYalV1Ym95bGY2aGdrOGVDTnBNTWk3SmgxRGI4RUtx?=
 =?utf-8?B?RjRrN1JNOXpEd0NuSmdRTVpHYVZGdTdOdSt2Sm43cTlaUVlGbEluRTUwM0J3?=
 =?utf-8?B?emNxVmQxSk0xN1J4ZVR5V1U3dTlZeDhGM2FtUlVSVkhBSnpXdDdKS1AyWWZE?=
 =?utf-8?B?am8rTTNIaDM2K0R3Mjl2NnpidVRaMHpLckVFcmlERXlsYVB5OXpXZHBMd20x?=
 =?utf-8?B?ZG4yeUNQazFlTm4yMUlxQ1hFUzdFT29LZDBvQzZJMWRoSjA3Vi9JS2EweFVI?=
 =?utf-8?B?enk2RjJ0c0JMYUFYRmhTV255a3ZXZUxsWFMzcGgxWGFWV3BKNi92S0pNL3Rj?=
 =?utf-8?B?bjZlYm1WNTFMRUxxdnY3Z3VhS2lZWXNNTlROOEM1dkVXUjhuRHpBb3JQYnFJ?=
 =?utf-8?B?VmF1ajAvdnBISHJVTFJjNlpNZzMwNHBLR2R4R0NXd212RGRqOFRDNG9lMkRH?=
 =?utf-8?B?b2lxQ3Nac2kxaFR4Ri9jQ0N1c29ZdGJDR0dEZFNSMjB1VnNmTThEcE5UeTkx?=
 =?utf-8?B?akVaNGNHMUQra2RvVGdSdzlXcnZ0UnlPUnQwVmJCTFErS1dvNTZLMXk1V3F4?=
 =?utf-8?B?Y2cxTEw5MjJjRmRYVXNLUmNXSCtuY1RKa2VDMGlzaGRZTHY1dnY1NURPdjZk?=
 =?utf-8?B?VXdaN0dKZVBaS0xzWHFKOThvbTVxdnBxSDFjMGhDMy9SY0x2bWdxZC9kcGZB?=
 =?utf-8?B?dHY3UzBNbkRvb3NNZVR6N3dld0xHdE02NE05aHdvSWZpL21xaXBrMzZtYi9S?=
 =?utf-8?B?VHF5a1p3eFBkR1UrdzBKYk93MUZvckYyS3BaMS9mSHpMK05JZC9jT2R0VVpW?=
 =?utf-8?B?M01oVHpac2p5ZG90N2ttNEZQU1FXUnZQWUlWTUY5eS9pQlJoaWdZMDNXL1Ja?=
 =?utf-8?B?NzErVS9VSWFkakNta2k5aGwxTkxidWZ3WDNwc2lOcHgyVTd3em9OaUxkUHZQ?=
 =?utf-8?B?NmorSXVVcktrd2o1a3BtcWtzN3hxTC82ZThEbGRmRmNkZERjVWVPVWgzVm9L?=
 =?utf-8?B?UlFUWk9hdFowZXdrUFB2UmVFVlZvMUVZWjhYYXlwd09jamZGYUVzSExkdTVi?=
 =?utf-8?B?bEljZUN5T3VVT0E3dFFqejZRNHNkcUtRZ1FhUVpKVURQSVltdWNaWW5RVmw5?=
 =?utf-8?B?M3BLR0lnR2x2Ui9McGc2MllOZVF0LzRDRGV3WlllTFcvMnpKU3c0MVo1RmlV?=
 =?utf-8?B?MExRY2FRZ21zbnllbDY4R2llQ3B0Z1hORjFtS29NL2ZMbGV3bC9FSVhZT1dQ?=
 =?utf-8?B?N1dHNWl1b0ZOWnE1NS8wblIvbk9RUUp4UDdwWFpDT1RVdXRVVDJPTmF0Tzl5?=
 =?utf-8?B?Y0tueS8yQ1R4UFlNZXZEcDYrY1lhUmw3QTJBM0k1VWREYUtKd25KQlVRNWU1?=
 =?utf-8?B?L08rUXZtR1EvSE41a0djazdSWmYzbVdPQzZhMUwzcURVOTlYdzRsd2lXQ2dk?=
 =?utf-8?B?alVYUXNMNmI4VzhJbHZDRkxwUy9GbEhFQlBpaHBaekZLNkdZNXZiOVpCanVt?=
 =?utf-8?B?SDkvNTlPYVpHOFdqTWRXb3FyWkxUQWNKS211bXlwdThsWGluWFAvNWxrcTR1?=
 =?utf-8?B?NlB1Z0VZcVRTdXJFWlJCUzRxVWlETXhEZEc3VlBwRUxaYlJmVGQxOTcvNHE4?=
 =?utf-8?B?eFluaGpGbnBRSVY2RVUxd0tWQzFGY2lHUGt5aUZ4eU0zQ2UrVVRmaEhjaHha?=
 =?utf-8?B?YVBzSmdsTEkrK1lGWnJuMjJyMDBOd1c5RWh4cFdKR2tMMEpjMmxCYklEZC84?=
 =?utf-8?Q?5LsxANRUhnoY+BvSK46PQ2kMg?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf237b9-d5b0-409e-eb40-08de179610dd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:24:03.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+95xtL3gALbwPbUxGVbTTyYVl5X6vzK/HmJmmEIYdj//RYEPaJwfCa4fwCMwZguZ5rDb1t2OSt6Y6IifulSuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022410_304601_F1CC7C69 
X-CRM114-Status: GOOD (  22.59  )
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

SGkgSmVyb21lLAoKT24gMTAvMzAvMjAyNSA0OjM4IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIFRodSAzMCBPY3QgMjAyNSBhdCAxMzoyNCwgQ2h1
YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4+IEZyb206IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29t
Pgo+Pgo+PiBsX2RldGVjdCBjb250cm9scyB0aGUgZW5hYmxlbWVudCBvZiB0aGUgUExMIGxvY2sg
ZGV0ZWN0aW9uIG1vZHVsZS4KPj4gSXQgc2hvdWxkIHJlbWFpbiBkaXNhYmxlZCB3aGlsZSB0aGUg
aW50ZXJuYWwgUExMIGNpcmN1aXRzIGFyZQo+PiByZWFjaGluZyBhIHN0ZWFkeSBzdGF0ZTsgb3Ro
ZXJ3aXNlLCB0aGUgbG9jayBzaWduYWwgbWF5IGJlIGZhbHNlbHkKPj4gdHJpZ2dlcmVkIGhpZ2gu
Cj4+Cj4+IEJlZm9yZSBlbmFibGluZyB0aGUgaW50ZXJuYWwgcG93ZXIgc3VwcGx5IG9mIHRoZSBQ
TEwsIGxfZGV0ZWN0IHNob3VsZAo+PiBiZSBkaXNhYmxlZC4gQWZ0ZXIgdGhlIFBMTOKAmXMgaW50
ZXJuYWwgY2lyY3VpdHMgaGF2ZSBzdGFiaWxpemVkLAo+PiBsX2RldGVjdCBzaG91bGQgYmUgZW5h
YmxlZCB0byBwcmV2ZW50IGZhbHNlIGxvY2sgc2lnbmFsIHRyaWdnZXJzLgo+IAo+IFlvdSB0byBy
ZWZvcm1hdCB0aGlzIGRlc2NyaXB0aW9uLiBJdCBmZWVsIHRoYXQgYm90aCBwYXJhZ3JhcGggYXJl
IHNheWluZwo+IHRoZSBzYW1lIHRoaW5nLgo+IAoKT2ssIGRyb3AgaXQuCgo+Pgo+PiBDdXJyZW50
bHksIG9ubHkgQTEgc3VwcG9ydHMgYm90aCBsX2RldGVjdCBhbmQgY3VycmVudF9lbiwgc28gdGhp
cwo+PiBwYXRjaCB3aWxsIG9ubHkgYWZmZWN0IEExLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVh
biBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVz
b24vY2xrLXBsbC5jIHwgMjggKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyBiL2RyaXZlcnMvY2xrL21lc29uL2Ns
ay1wbGwuYwo+PiBpbmRleCA2Yzc5NGFkYjhjY2QuLmM2ZWViZGUxZjUxNiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29u
L2Nsay1wbGwuYwo+PiBAQCAtMzgzLDM2ICszODMsMzggQEAgc3RhdGljIGludCBtZXNvbl9jbGtf
cGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4gICAgICAgIGlmIChNRVNPTl9QQVJNX0FQ
UExJQ0FCTEUoJnBsbC0+cnN0KSkKPj4gICAgICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShj
bGstPm1hcCwgJnBsbC0+cnN0LCAxKTsKPj4KPj4gKyAgICAgLyogRGlzYWJsZSB0aGUgUExMIGxv
Y2stZGV0ZWN0IG1vZHVsZSAqLwo+PiArICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZw
bGwtPmxfZGV0ZWN0KSkKPj4gKyAgICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFw
LCAmcGxsLT5sX2RldGVjdCwgMSk7Cj4+ICsKPj4gICAgICAgIC8qIEVuYWJsZSB0aGUgcGxsICov
Cj4+ICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxsLT5lbiwgMSk7Cj4+ICAg
ICAgICAvKiBXYWl0IGZvciBCYW5kZ2FwIGFuZCBMRE8gdG8gcG93ZXIgdXAgYW5kIHN0YWJpbGl6
ZSAqLwo+PiAgICAgICAgdWRlbGF5KDIwKTsKPj4KPj4gLSAgICAgLyogVGFrZSB0aGUgcGxsIG91
dCByZXNldCAqLwo+PiAtICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkp
Cj4+IC0gICAgICAgICAgICAgbWVzb25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAw
KTsKPiAKPiBXaHkgaXMgdGhlIHJlc2V0IG1vdmluZyBhcm91bmQgPyBub3RoaW5nIGlzIHNhaWQg
aW4gdGhlIGRlc2NyaXB0aW9uIGFib3V0Cj4gdGhhdAo+IAoKVGhlIGZ1bmN0aW9uIG9mIGN1cnJl
bnRfZW4gaW4gdGhlIFBMTCBpcyBzaW1pbGFyIHRvIGVuLiBJdCdzIG1vcmUKcmVsaWFibGUgdG8g
YXNzZXJ0IHRoZSByZXNldCBzaWduYWwgYWZ0ZXIgY3VycmVudF9lbiBpcyBzZXQgaGlnaC4KCkkn
bGwgdXBkYXRlIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYWNjb3JkaW5nbHkgaW4gdGhlIG5leHQg
dmVyc2lvbi4KCj4+IC0KPj4gLSAgICAgLyogV2FpdCBmb3IgUExMIGxvb3Agc3RhYmlsaXphdGlv
biAqLwo+PiAtICAgICB1ZGVsYXkoMjApOwo+PiAtCj4+ICAgICAgICAvKgo+PiAgICAgICAgICog
Q29tcGFyZWQgd2l0aCB0aGUgcHJldmlvdXMgU29Dcywgc2VsZi1hZGFwdGlvbiBjdXJyZW50IG1v
ZHVsZQo+PiAgICAgICAgICogaXMgbmV3bHkgYWRkZWQgZm9yIEExLCBrZWVwIHRoZSBuZXcgcG93
ZXItb24gc2VxdWVuY2UgdG8gZW5hYmxlIHRoZQo+PiAgICAgICAgICogUExMLiBUaGUgc2VxdWVu
Y2UgaXM6Cj4+IC0gICAgICAqIDEuIGVuYWJsZSB0aGUgcGxsLCBkZWxheSBmb3IgMTB1cwo+PiAr
ICAgICAgKiAxLiBlbmFibGUgdGhlIHBsbCwgZGVsYXkgZm9yIDIwdXMKPj4gICAgICAgICAqIDIu
IGVuYWJsZSB0aGUgcGxsIHNlbGYtYWRhcHRpb24gY3VycmVudCBtb2R1bGUsIGRlbGF5IGZvciA0
MHVzCj4+ICAgICAgICAgKiAzLiBlbmFibGUgdGhlIGxvY2sgZGV0ZWN0IG1vZHVsZQo+PiAgICAg
ICAgICovCj4+ICAgICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmN1cnJlbnRf
ZW4pKSB7Cj4+IC0gICAgICAgICAgICAgdWRlbGF5KDEwKTsKPj4gICAgICAgICAgICAgICAgbWVz
b25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+Y3VycmVudF9lbiwgMSk7Cj4+IC0gICAgICAg
ICAgICAgdWRlbGF5KDQwKTsKPj4gKyAgICAgICAgICAgICB1ZGVsYXkoMjApOwo+PiAgICAgICAg
fQo+Pgo+PiAtICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPmxfZGV0ZWN0KSkg
ewo+PiAtICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0
ZWN0LCAxKTsKPj4gKyAgICAgLyogVGFrZSB0aGUgcGxsIG91dCByZXNldCAqLwo+PiArICAgICBp
ZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkpCj4+ICsgICAgICAgICAgICAgbWVz
b25fcGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+cnN0LCAwKTsKPj4gKwo+PiArICAgICAvKiBX
YWl0IGZvciBQTEwgbG9vcCBzdGFiaWxpemF0aW9uICovCj4+ICsgICAgIHVkZWxheSgyMCk7Cj4+
ICsKPj4gKyAgICAgLyogRW5hYmxlIHRoZSBsb2NrLWRldGVjdCBtb2R1bGUgKi8KPj4gKyAgICAg
aWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkpCj4+ICAgICAgICAgICAg
ICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAwKTsKPj4gLSAg
ICAgfQo+Pgo+PiAgICAgICAgaWYgKG1lc29uX2Nsa19wbGxfd2FpdF9sb2NrKGh3KSkgewo+PiAg
ICAgICAgICAgICAgICAvKiBkaXNhYmxlIFBMTCB3aGVuIFBMTCBsb2NrIGZhaWxlZC4gKi8KPiAK
PiAtLQo+IEplcm9tZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
