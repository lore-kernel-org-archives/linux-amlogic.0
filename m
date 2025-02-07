Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16325C02196
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Feb 2025 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42m2ZO+9+QVSxE5CKlS5z0IGEYUeVlXfg6MTK3fH8nA=; b=ZRSf3NYvxM2HjqTcSNbpqgMmjS
	AmhAx6axeuT1Fu2EfZdfE7YPPYfrIlm/UR6FF0OfJvDvZwCthjLIdV/xJXiWMplAdOxcA69jMuZ8r
	evYLdmvvbJueXv7Gvps8YPLICEzh6aChr0BSbV6xnXGVBeaQ46VC+groeIMyJXOOmODe2+kWJClVA
	crPPUsV7iBIUT6IscC3ws94QGoq7+8KfFt0xKWS/xCN64/W2CMNaj9v/xfWU+sQwPca+aoFl57ve6
	3KnVk8cnUTVpGr2sZuaDS4C/Vhy/0cb7u5TJ9PUTHxg5OHrMgyKck/EtE9wB2n3RbNqY2zqVG0Y5l
	0E/GkLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIU6-00000008bQO-2SEG;
	Fri, 07 Feb 2025 07:09:06 +0000
Received: from mail-psaapc01on20701.outbound.protection.outlook.com ([2a01:111:f403:200e::701] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgISi-00000008bBq-0HMu;
	Fri, 07 Feb 2025 07:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrgRVPCrU1YZo4naKlZDxOtyx9i4h6CsEFhfLzn3RdPeok/rr24mHWjU2uxtlg+mC8myPoi92r7Knt3PudFQKMC5cpZoEd3ggmS9h5S0lMaxmlolNFG2s9UM3ISnD20Z2Kgk50h1t5PWzVOuDPBEcWy78lM+evo5qnVgQ63JM82U4i3QXs4o76KML4u5aG68Y/YqbElJPSkLBSiAxjY2VTak++xoJF2DaksZb3+C+bThKCda+x2bJ7OVJD4D6P5p8DWEdpjdHbKq633oA8+Ih0MSI1GZkyH1otNPjz5f0I8o4RkcNcnkCm6ijbRrQy2h7+b6RYgfqk7tHhlgeSxn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puu2+/4Po2GvPaRCKnnJMrHGieggJ+nvt3cw3+y3yDM=;
 b=MkNOeYFVODT3NtpkbI17VlR3AZ492iNH1jRKUMg5+trNA8VDiAd4X5vLf3xcEQSSwtTxKyV3S6/116NeP4ji6NP8nf3Uo9hsoE6lQH8yYhEB6bqaqLdO3CmSIYgvJZkHrtcROuFuttMEXX45Mbv3VEvpmBNZOht3wtOUvq9aw1YTVGSbcKVMaVbErls/lnYN6dB74szDdYPE7qFkmIssSgaloqmJuJ7OTk+0btsIXsmpvAUp6EtvlMqS6I8XP7oPHyrXwM+XR0VpKgMankAjLKebQp08Vioy3AY102FzsXfamtcGGdcLY9ltVcnW79zq1OM3+12LdMFoAZEB8esiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puu2+/4Po2GvPaRCKnnJMrHGieggJ+nvt3cw3+y3yDM=;
 b=G6mteD0GvYR6gO/nwmn0VSkKCC0c2NvLlFgnPFGM6oxZBBjMlQD9HouXXWrqCQ5d0ehKWctsWJWTskr9gv/yYPbzZ/7BuU2KjUB3OgVCaJa56CYaneuuBs1o6cx4LOeAzjQnUOktfNoH32655dTV7ctcFEmeZRPbW6qhGcfYUo27NtAWBoizuEjDgugkN8qqbYquJijSC9p/0nh3/fRxS4w8DXXT4/BGC+YW02XmpQFAGTzr6eU8PmQcbIVOvZ4acZrADRGSJdS/5OfLM5AnfBU2+HF9uUvCavCBv9xeHgNV7GG3aLK7SRx8uMqatio1+Ms7H+4rUHBZHjKlNAnAjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB6579.apcprd03.prod.outlook.com (2603:1096:101:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 07:07:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 07:07:32 +0000
Message-ID: <fc2ee33d-db32-425f-ae5b-e56a15bc27e4@amlogic.com>
Date: Fri, 7 Feb 2025 15:07:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
 <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
 <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: da074f16-ec6b-46ba-8c32-08dd4746171f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE95Ly9VbHhyR3pSU1ErdUxxQStja0crZnVpUGpHZ0tYRzRnL1VFakNZOTVE?=
 =?utf-8?B?YVFFcFJldUZRSkFSRVMwd2MxRnV5S2JYdlJGdmEyaHpRNWFyZ3B4L0tZVWxC?=
 =?utf-8?B?UkVnRUs0T1pBaE1haEZ4OHVjMGxmT29UeG4vWFcxWFlQNUVKMzVCL1dEUExL?=
 =?utf-8?B?L0Y3UmhBakFyaSsvY2o3djMzSXFTZm1oSGtUWmdMTXZvRFJDWFpPZzA3WVBi?=
 =?utf-8?B?RmZDT2JmU0MzYVhtVjN1aVlOazgxaDNaaTlQMDYwYTlTWng4RDVLTGZ4dy9o?=
 =?utf-8?B?ZExsditsVHlGc1hxUFp6OXN2YlNSeUZoYnpkd09FUjJJczVISElHVndOdm92?=
 =?utf-8?B?VHdMUDU0ZExxMWRPZDB4eW9iMTZFWlpZNmlzVmtIenpVNzl0eTRad1ViM0VV?=
 =?utf-8?B?SCsyb1l4VGN0NVl3MG8wRFNwY1JBZlRPV2tJUHZqMGFiN3pibWxaTmlDcGZo?=
 =?utf-8?B?VEwvYWp3aHk3WFJkQVFPaS9TSTdtZGlkMU9KUW8wbkNBUEFlbWp4dVdaSC9C?=
 =?utf-8?B?N0ZCMTY4Rnd0Q3hHQXRqNldCRHpkSzJFenhuUXNGQkFGSEwwc2V6czBXK3lL?=
 =?utf-8?B?MEd6U0FwQ3J6TjVTWVhJTmNVY2p0T09XYlhiVExJR21kcGdTbEVYeUdwak4z?=
 =?utf-8?B?ZGkzNUdjK29SdlJpRTlUUVhiVS96Tm9lcDl5T1RXM2ltS3dSa3FHc0VvQUJk?=
 =?utf-8?B?emNvd2Jpb3J4RzhYL0RwNjJaeUcxay9nWkN1TnZ5cXpmWDMwNExCUlBSUzV3?=
 =?utf-8?B?enVwVVpvNUxqeEpKWDk1Rzg5MVpDL2xuVExqTzY5Vno1SngrTTc1ZEZ1OHdV?=
 =?utf-8?B?T3hUYlF5SEhEeFRCelQzUTVYS2JmZitodHRmbTJ3NFRuNnVSYldib1NSaHdl?=
 =?utf-8?B?OHNpbFJneWgyK0FlMUtCdDk1VXVuRnhub3JFV0Uxd3ZHZzRsOHpQR1k5cm1H?=
 =?utf-8?B?L1JvdkNRbVhHbk1WZE9LdEovVnRNT0hEVStNMFcyZlZwVTdFQXVXWDJJZkR4?=
 =?utf-8?B?S3dSaUlpdVJJUDZjaTUrSDZUYnVyYkhmeXhKZmNldll3RlpKbVcxZ0l0eDF6?=
 =?utf-8?B?Y3BHci9ycWpSQ3M2WEJoZmxiaEtwL3U3Rjc1TEtOaWRmNWVwNHNGdXRVbGxi?=
 =?utf-8?B?YXM5NWt4OEpqa3hhUEUyS0QvczVvOEhtN1lyN0o0ekNhdzlML1NOSnhtYm1I?=
 =?utf-8?B?cXEveVVvbnhpY05tUEpmRENjTkNoT0RkbEhwL3I4VjZNa3dmUWtSeGNBcFB6?=
 =?utf-8?B?OG9BdE9LeDBOMmV2eGFaNGpQZDFNZWpaNjVPMXR0QTlpeFJHbGNLcHA4VGFH?=
 =?utf-8?B?VHR1cDg2VFRuN09LMlprS0ZoRjFlcW55MC9KQXhWOW5lbWUwL2pjRk02b296?=
 =?utf-8?B?WWw1cm92ZUxUenVvOFkrSW0rS0pvMzhyV3hDc3AwWUM5UTNUczRwc1hhRm9Y?=
 =?utf-8?B?S0lOS0h0blFnMC9neTNJcnlkK3FXeituOXFvaVNCOTd5ZlNaNXZmVW9vR2Nv?=
 =?utf-8?B?aVFRd2JyZUxlNTR0dFpCOUpKVWFWNXhaeUlCbmRZU3NiSzRqa2hOQm5EWW9u?=
 =?utf-8?B?OFY5VFhTTVhQeWpJVWlFcFR0V1Q5RjE3MDg4T2JIZ1NJUzduSFBkNFhuQmtZ?=
 =?utf-8?B?SVh1SFRLM3ZkZ0h1anJRRzVwT2wrYTRHcXFCcEd6SnJvSmJyNCtNL1hjZlZt?=
 =?utf-8?B?THNEWDdXUnRzbmFQc3JsTmRGenQ4bkgyOHRjYkVnUWFqWEhzeG03UHhIcUlB?=
 =?utf-8?B?ek1GMFh3N1lLejN5L2dKSjFDSFh4SkFqOGc5U1YraXU3bUU5dWJJbzBCeGE0?=
 =?utf-8?B?NjhzeGgwMy9ES1QwU0xiem1SUjJUUjNoWW9TR2VuYTlIeTc3dTBjWjl2amJN?=
 =?utf-8?Q?+nDLBOdgrifyi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlUvckN2WHhNRldaN1o5UVlMT016VUt0dTQ2cEZrbjdhK2RMWm1hK0tnUEIv?=
 =?utf-8?B?OFl5b0x6Z2NFdnBKUEVDVmF6TFA2N2xXTGRCRWVEelk3M2poYnV1UGVlRDM4?=
 =?utf-8?B?SklaVE5pM2FwUGRkbVZZcWo0c2dxVmVUa0tDNXFqSktXc2FBWWU3SThzRFNz?=
 =?utf-8?B?Y0dDdHZaQVNxUzZFZHBUNkM3MzdORmdTaWJzUXdZaWdZVWNvbXE1L2lzSUVv?=
 =?utf-8?B?NFpKN3crdi9rQ2g4b1ZiZVB0RTBBUE5yTHI2TkJEOFBRQ0x3dGtTRlVDUnNO?=
 =?utf-8?B?QkVJam83RkovbUdYSHh1TzZXVVA3WUkwd3BOS1AybnFXSjMzQmx1ZGV3OW9M?=
 =?utf-8?B?NlhPZGI1RllENTE5RHd1bExIM1ZaQStxdTh2dFdsVlFmZXZiTU0rT0dSOWov?=
 =?utf-8?B?TVFYTnVDNmE0ZjJZRnE3dW5oVzhneWd1WExueHduR3VWU01weS81MHMvcmxZ?=
 =?utf-8?B?OTNEdmc5TmYxYThpOTBUSndOYmQvT3MvcE91d0Yxa29YS0dGUHNpelZWVldn?=
 =?utf-8?B?R0gyeU4yUHk0cjZ0MnBPYnBudDlHSW13WlVkTitZNDFKU3RqSTExYmZmeGt1?=
 =?utf-8?B?bVpIWGhTLzhFcFh0SjVra2V4T05MY1Q4NThXUEFDYjNGaDRpNjBCa0RJUkw3?=
 =?utf-8?B?cGxtc0pJejZaTXBqTDdxakU4WTlNTy9xVDR4ZmJIcDl1ZjFXblhLRE1TZDN5?=
 =?utf-8?B?SWRuL2NKWkVoU2Q1MkJXZS9lTHhQajVSOTc5RGRMSkxSdXlPNUFydWNzUVRQ?=
 =?utf-8?B?WnNWT2l3SWhUNDNkcHc5L0g1eko1TFpSa3c1M3R4OTNZZFIvSWlkM1dta1py?=
 =?utf-8?B?cFlvUk92QTluMTErOVdEUFMreU1lbXIzb1RycGNFTVYzRllkV2dLUDgzbVJi?=
 =?utf-8?B?K0JmaFBaMW84U0tZT2JuSFhGWUtvQTBlRVh4Q0JZd05CVm5WVDNFU0t4SklI?=
 =?utf-8?B?Y3lHR3lZaExZTHZRK3pHVE01Y01RVC8vUWkxTng0NUdpcmQxZEVwS3JHS3Bi?=
 =?utf-8?B?VHdCUmE5aFArc1RIV0krVnFHVkVmL2U2ZDJyWEJzUVBkdEc3TVMwdllHTzVC?=
 =?utf-8?B?UjhIZHNrVW9SdHR3TWtiL1VOVlR3eW5nSlIyTGt6R2lSaDBtZ3g0NHhCbFQ1?=
 =?utf-8?B?TlY2dG1LdE0rV0NVZ0dNbHBhb3dnTFpqdTZnYTJOMG9vbklmV1ZJSjRPV0RX?=
 =?utf-8?B?RUgxUHhOTGpLTHM0b3NKc0hQSVZUVWJLQ1p6ZjAyQnltTHVSNTEyNFVJMEcv?=
 =?utf-8?B?V1BSS3JIYTVYMjZxY3g5c0lGZGphdW00TlVDMm9aZlBGZUgyUTVHcHlLT2xh?=
 =?utf-8?B?V3VxYmFRTzVWbXIvejc4WUlpMVZmUktydEhNempTcmtodnI1ZjBSL3BITytH?=
 =?utf-8?B?WGdDcWVSOCs5NW9kOFpycklRR0UyajA4dEpJdTVmSThYTzNZb3EvbG5xR3Bo?=
 =?utf-8?B?MEorT2JnRWRPUzhlMzQ0aVFJemdRcmpYVmIxbmNiQTk2S0ZZNnU0YkpEQmhH?=
 =?utf-8?B?T3U1MzVDcUxpQ1RjTWtEQ01kaklqVjBPWFpVU3JpYUlYK3A3NnkvQ09rVHZX?=
 =?utf-8?B?dVFUTjJVVjJxR3Nqem9BeHpIOFlERlVmcFVyM1N0aUt0SkJ3N0tFYmttaER4?=
 =?utf-8?B?dWFqVllwOCs1TVM5SVBWS2dQV2dqUGMzeEpsWHAxQWxzR0FEOTVrL2NIdHJ3?=
 =?utf-8?B?MDZXeWdDbXpuQWR5REJhUXRuTDh2SHpydkZtcUhqR3B2WHFFVGxNQ0FheTJE?=
 =?utf-8?B?MU4xQkNrTWljUnc4Yzk2TENLdHRNYSsxL0lHa2pRbHVGd28wYUNhMU1ydnEr?=
 =?utf-8?B?L2oySU5YbWhOTVY1dEVUeXErWjdxQVBNMVpMRGZhQjRQQWE1V3FFTkZ4T1M2?=
 =?utf-8?B?ZU85eHZoaHZHUW1sZmJvSFNES3NVTzhvU1J3SlJYT1NFYVBSL2l1L3hmMHk2?=
 =?utf-8?B?TlhYUnl6VG80ekNvZWNTT3NhWS8rWWFqcWE3ZFZPZEdYcnNCdGtCNis5K1pl?=
 =?utf-8?B?dTQ5TkJHZmJNQ2h0dlQyY3FycGdXbkpkVng0eko1OENjR0QxOHJodW1aTnpk?=
 =?utf-8?B?QzBLLytwQVpYOFROajVXNnprUm5zeUF1eDFHMm9HbURXOU9ndHFVZkRieTgr?=
 =?utf-8?B?VDBKTFpyV2E5UDhpbERCek5qRHl3TWxNNmk1WTRvMjBzL0VJMXRwaHUzNzhp?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da074f16-ec6b-46ba-8c32-08dd4746171f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 07:07:31.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4j2BLDmefGPbXvdO1NK9qtM6jyivye0q5wdjyakxY9Dt9t6Ww7WULnGw5qLsPA5OSOGMOKO9Zl/qr8x73wGRwndfzmwpu/FGRbXaNBf2C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_230740_105952_DACD02AB 
X-CRM114-Status: GOOD (  16.92  )
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

SGkgTGludXMsCiAgICBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDI1LzEvMjcgMTc6NTks
IExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gSGkgWGlhbndl
aSwKPiAKPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gV2VkLCBKYW4gMjIsIDIwMjUg
YXQgNDoyNuKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCt4aWFud2Vp
LnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4+IEZyb206IFhpYW53ZWkg
WmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBBZGQgYSBuZXcgcGluY3RybCBk
cml2ZXIgZm9yIEFtbG9naWMgU29Dcy4gQWxsIGZ1dHVyZSBBbWxvZ2ljCj4+IFNvQ3MgcGluY3Ry
bCBkcml2ZXMgdXNlIHRoaXMsIHN1Y2ggQTQsIEE1LCBTNiwgUzcgZXRjLiBUbyBzdXBwb3J0Cj4+
IG5ldyBBbWxvZ2ljIFNvQ3MsIG9ubHkgbmVlZCB0byBhZGQgdGhlIGNvcnJlc3BvbmRpbmcgZHRz
IGZpbGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFt
bG9naWMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3BpbmN0cmwvS2NvbmZpZyAgICAgICAgICAg
fCAgIDE4ICsKPj4gICBkcml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgICAgICAgICAgfCAgICAxICsK
Pj4gICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hbWxvZ2ljLmMgfCAxMDUzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAKPiBQbGVhc2UgbW92ZSB0aGlzIGZpbGUgaW50
byBkcml2ZXJzL3BpbmN0cmwvbWVzb24gYXMgSSByZXF1ZXN0ZWQKPiBlYXJsaWVyLiBXZSBjYW4g
cmVuYW1lICJtZXNvbiIgdG8gImFtbG9naWMiIGxhdGVyIGlmIHRoYXQgcGxhY2VtZW50Cj4gaXMg
Y29uZnVzaW5nLgo+IAoKV2lsbCBNb3ZlIHRoaXMgZmlsZSBpbnRvIGRyaXZlcnMvcGluY3RybC9t
ZXNvbiBpbiBuZXh0IHZlcnNpb24uCgo+PiArY29uZmlnIFBJTkNUUkxfQU1MT0dJQwo+IAo+IFRo
ZXJlIGlzIGFscmVhZHkgUElOQ1RSTF9BTUxPR0lDX0MzIGFuZCBQSU5DVFJMX0FNTE9HSUNfVDcK
PiBhcyB3aWxsIGJlIHZlcnkgYXBwYXJlbnQgd2hlbiB5b3UgbW92ZSB0aGlzIGRyaXZlci4KPiAK
PiBXaGF0IGlzIGEgKnByb3BlciogbmFtZSBmb3IgdGhpcyBmYW1pbHkgb2YgU29Dcz8KPiAKClRo
aXMgaXMgZm9yIEE0LCBXaWxsIHVzZSBQSU5DVFJMX0FNTE9HSUNfQTQgaW5zdGVhZC4KCj4+ICtN
T0RVTEVfTElDRU5TRSgiRHVhbCBCU0QvR1BMIik7Cj4gCj4gT24gdGhlIHRvcCBvZiB0aGUgZmls
ZSB5b3UgaGF2ZToKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
PiAKPiBTbyB0aGlzIGRvZXMgbm90IGFkZCB1cC4gRml4IG9uZSBvciB0aGUgb3RoZXIuCj4gCgpX
aWxsIGRyb3AgIk1PRFVMRV9MSUNFTlNFKCJEdWFsIEJTRC9HUEwiKTsiLgoKPiBZb3VycywKPiBM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
