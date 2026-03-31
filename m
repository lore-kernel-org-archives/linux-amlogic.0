Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ACF1061B2C
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2026 02:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZZJaSbZgmZnGyRU8a1tTfAvaRbcwfHPLETd1rsclTM=; b=3XH27OP0iqlKeuAAvfEtCH8LQf
	0X/X1F3DlBXPWQf4/c82+UTpgCBAehRAOToV8crJpeKZiBPwOyrxdK53NM4rgvNMSgqJdNr64vneo
	Dm3EikJn3ed6gDLT/mhNxqk0+Trdc0Fnw+xYh/xCEJNcrznWbSh7OJ0xdwgaw28l/3pYCNUCCUbFg
	yAdcH8edcrgFgql69NAdUpAS1WfixmJJrr9Q3sfhN4AUHn5pQEHIdCPUpa95wrgxz1ZerBVhtR2EP
	tvV4s1wUsst5sVChYAxLjCFUunK6tVjnTRyi5otbs1PbFN1qxEpVKYQtyuL3IM3U5dz8jKnHgD219
	hwLQkMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PA1-0000000CCSu-0tkc;
	Tue, 31 Mar 2026 02:48:57 +0000
Received: from mail-koreacentralazon11023099.outbound.protection.outlook.com ([40.107.44.99] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7P9y-0000000CCRc-26ah;
	Tue, 31 Mar 2026 02:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2qRYRGNrDDfjJvwA/dBVk3g1u0TYt22tlwZn0ALviBN+lcTqSOa8PIDCuwgjcyu4z5decuy0vM4D2K3lP709Nr2jxYEi8hB00z7r2Hmq8U/c4bNKUrILiwu4wxAHKa0qz9bKTRoTurFW1oKT4MB3nL+5UZ0Hrblru3QaCFOFzFkjhIcHRCk4nqR4qpBMxGLqzn2thGKMv/qwhbS3U/OqS4S0dZDpoFtXAx632u3SQnbHuwfyRMMr3oT5oTZWKj5fdtUX00Zw0J7cDOlbyLgLC7iJ52CNlQEa+uMjNjho5uaOTfgw+/Ge2ocFd+MgqA9oUKE6cr+vgDZH/4nwYCJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sozgCNhtywv92zdUZwDHpgSAXrEUvj1kf8dSd6QpfRw=;
 b=ikYgL5IvNyANUdzwPcuHzxrimdhvTub3plzSX65VKiy1BM5VzOctEfrP//jChrBov9628A+4PCJRwBs6ZrOz25iGNefv0IGuou7RC6nSqPGimk2QtvuEzwAPutjRm0EyNzC5KIzXZl3cjg8VwOt0ZKjz8eQtMHKGaPSHCWD60E6RW+F4ifHQkI5TeKW3+w7QLTiXUgK/IO+JBrCkjH6Kre+QNEx4UCi0HfdrmQNZS7wbx9B0SawvENzEdHAKXD35YP9/ICLRG17Wy64Elv00WmjzdVkZ6nmtuFG5orteD8+b4Rox7u9hVewmawBpEce+LHc28kYLFJjzTYpvskWkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sozgCNhtywv92zdUZwDHpgSAXrEUvj1kf8dSd6QpfRw=;
 b=kwTr6TCqSE5WVug89MfGtPM7UqfABVCNokbwerBHFp/ccnIDbRSNhlJmA2sx6kRwI8kUPAq3yQ11UQtQ9cC7e+war3EcwMKaHHcP0oFhSptCVGvNmYd+F4uQTx1RfSRi1jqcMbRaPG41wi7cr20KynR1UZACqp0uiHT0AWTITr0EksdM66xOOPnPVdXO1HdWTeBFGwsa9eDFVzWCQVdGC1u9+oceugOjcOMM0MSYqNI6brJBsXYsV9olhCI77GadOUM0YtoCMcOA+FTy9VDKv9+USxrxhXlvAUe7tymH18CZNQhnAjb/xr/9LZOgyym9+YseAolcLSru+Edb9eBlqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by PUZPR03MB6988.apcprd03.prod.outlook.com (2603:1096:301:f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 02:48:38 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 02:48:38 +0000
Message-ID: <59b5c878-dad8-4ce3-9864-f4706c993d4d@amlogic.com>
Date: Tue, 31 Mar 2026 10:48:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pwm: meson: Add support for Amlogic S7
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
 <CAFBinCD-4dwp7pmM_GHK_N1kag_5VBZbP9VAwQOxcyg6aquj3w@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCD-4dwp7pmM_GHK_N1kag_5VBZbP9VAwQOxcyg6aquj3w@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0039.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::8)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|PUZPR03MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a65925-24e5-4394-1921-08de8ed002ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 81p4gaxQ3I3MacqJQAKKOFTms6bAPfdVJOlFs3yqHi7Y7ungsVsuuuD/wHHLgoX+zjvBDNMknCepyvy75jQ/Zn2MdKmcQcAR9yertTeZ9j1Nv9RRQQepwH1tVtxV3tpjxHd4GIPrnFwbyps6EQclGtQlT8Zelikv4S5v0OeJ8fMsaKPC4EHxILxXGbshbvGat/bxrTLasoJNeN0mjYFOSoXI4/HDcapUPoxxoZ1W6Whg2KImtI2RWHq95iuPN3Gsm319LQL7H/kOFNvnBo06x/Tsvzg6zOa2lRD1+PHaoudMZKPvcpHFkm+zvDFEryCWCgrIGFANHDIW78vxwj59J4M1fQTcjKZmuekcglpHPW4/klUFy+J6az+HfwhOyN5Ws+p+bHt0BJZ+W4dhVE9KyGP/qNUmN92cwFR6oVHCDAbQ4h1k4DN8sJzgxNeECBF8R6bl3XwJ3h5FWl4ev5wc6Ac4NG6GvNbjeYtEFBy3OIqivLNULIsLZ1lLo/pC1ZmT6khmAjtVImXm36oQ/igaCZ0J9lf0i5bnRGT/HxE/QPbdCwFE2dS/v+2DE+xI/QaV+m/6MYAGJLgawXlPp/lPyC5hsNB7ZEzV1Ak/OdUwrv9bPb03zci1laD8nRD2PEjeK1pXqDPtJqyOPUeQxWRtYZKN2XNYcJ1zXZGRTmxvbWaxGoUhl7Ne/zKYuVZzhVpiPWQnGKVKXinouk5JS/VR3ugfcH+OjEoudRHblBMNYWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlV1WC9GZlFNMTBNR3FNM1FITHBxTGd6TmdqdmdIUGN5NGc2N24yaHllSUVz?=
 =?utf-8?B?WTNxeXF2ODF2Y1NzUlFyRVFScEwvZDFJMlNxZXU0QmRjb3JNN1FVakQxQndP?=
 =?utf-8?B?YmJ6eUFtVmwweUxvQ0hraE5VRTRneDNOc3locHhna2xFVVZ3T0xjUHRDdXhy?=
 =?utf-8?B?eFNSdENBRGRZVzRwaFlDR0gvVkNJT1JUYWpiZytieXZXcEw5bVpUcTF6dE11?=
 =?utf-8?B?dGFxajRlN2hodVFFbWlXUXhadzcvSnB5T05YRUVUVHBVM1V1eStjRkZoTFhK?=
 =?utf-8?B?eUFkTVZBQ21NV1R0TmNlajVkcklyeWVjM01oUUpmOU1QNzN1RU1ydXJqbkRh?=
 =?utf-8?B?VHdMVG9iRXFUREo5UXNnSWtnMGFMMnVLZGFSR3kwU0FXUnViVXBSV0NRZHhC?=
 =?utf-8?B?TVpJUlBiRVdnVm0rVVhzUXF5WlcwbEVIdlRIVkh4RnlhV0pCejFuNnJiNzFq?=
 =?utf-8?B?bEpvbm5ob3JTTUhxYXg2ZFdQWVVoVlFhZGx3UW1TNlI5dFBkbXFWM01RR0E5?=
 =?utf-8?B?cWhSU0FySHN6YUFMb1J3bE5FemtBTzNWa1dYeWUvbTAxQUNNdG9FSHVDZ0c3?=
 =?utf-8?B?ZlJBSVFzQm51dVlkdmJ1Y3ZwemM5bjBEdkc0OFpSNlZUbW5oMi9hMmtLSWRM?=
 =?utf-8?B?ejZtclF1ekxXbXhmOS85WlRMT1RhQ25jTnFyUGhLdTFwYUlzaVhxQ1FMcFdq?=
 =?utf-8?B?OGphOHRackVpNHEyckJtUXZabytncFpvQzVOd2k5WUQwbGcrWVpoOEhEOEZt?=
 =?utf-8?B?eUZiUUtkcHFlN0VPRmZva1RJaHNBTDVPeDI2anFGM05KV1BkOEFJUGMwTDc3?=
 =?utf-8?B?aDJoRHB2azlSdkxiVjEzTHo3b0VXOXBMM3RXZHZxN1hJa25YbHI3a3dCL1lS?=
 =?utf-8?B?ZXFzZ0dSSStxcXMyWlQwckJLNzlCekZVeTVyY08yZXNrbnp1TTlLWEJJN3lO?=
 =?utf-8?B?REJOa0dCQ2xXMlVGUzh5YjgwWWRHYnJCc0tVMUh0S0lIM05oWjc1YmFYd3l1?=
 =?utf-8?B?cW14RERsT0U1V3JaZDBuSS9CKzRvQjdrRHlzNzRlRkVNZEFiMXljTVNMYzh2?=
 =?utf-8?B?R054ZSthUHlpb01hZUF4anU2REoyN1lLck5vOTZVS0ltdERLNDlpZ2pQNlZy?=
 =?utf-8?B?dHEvN1BuaU1RNW53MmhrdGFOZ3FTdU1DVTRkS1B5dE9iRWFaQ2VFWmtkNDh0?=
 =?utf-8?B?WkNLOUM4L3AwaXBRV3AwZ01OdDUxRzdTZVpPMEE2cFNQTVZneFdGaXlic3N6?=
 =?utf-8?B?KzVNSGtlclJIR0NDM0llV0FhbjE0NkpXS2doUmxrWXA0eTFxWlpGS3c5MTg0?=
 =?utf-8?B?d2hiL3drelpCZlRvVWlIa2xRNXlhOGRjSUIxbHZPRStCVU82aUVuVXZVQlZL?=
 =?utf-8?B?QzkrcDRIRXBZUmMxdmo3WGJ5SjY2cHhzdTBNdW91NE90cGd4VGNCaDgybVNC?=
 =?utf-8?B?VTU1UklDOWJNQzlpVnpqYTVhbmxOWSs1UVZQdlFVbmxaMzFGVXpqcHc2UFNi?=
 =?utf-8?B?ek81elJUUlpweTY3UjNURE83bmpWWm1KSjZUb0RTL3lMbW9VWmZaT1lGSWJl?=
 =?utf-8?B?aU9xYUF2QXJMYzZBaVk2Z0t0Z3FzQlc4T3VlTFo2NVhzU0cycmpqOFk4TVV2?=
 =?utf-8?B?SlEydWxLSDVvZU4xYjZoZ2RaQ2h4WUZZT0QwVG9MZ293ZDVheVk1dE9MMUtr?=
 =?utf-8?B?Zmg0WGdtc2t1am5QMDFkKy9aUmcwMEFzZjlZclNaeW9oMTNBTnNRVnZ5aU5J?=
 =?utf-8?B?UVl1d3ROTzU5NWZ6VDJiaXRhWUI0Sk1ETFltVk5BTWNrbUtPRVR0dytDZzdZ?=
 =?utf-8?B?Q1o0QnMwa09GMG5WMHNYR1k2QlVnUTEraFh3c3NmUzl5aG5DQkxtRWdHc1RY?=
 =?utf-8?B?TGx3K00vWnZnSFJ0clZNK1RSUHVEbElxRzZGMS9ZZ1E4bzYydkF6Unc0dnEx?=
 =?utf-8?B?UWhzbGUvdkh3RkhhTmJ5dk9VeHNiY05tVUZxSDJiN0MvcVhLWmRKSjVmNXFv?=
 =?utf-8?B?dGxFVFBIYU03MUNzU1JsbHh4NXNWaGNONkpibzY2b1RLd1NDWENYaGNXcmFQ?=
 =?utf-8?B?OSt6Tlc0dURxNDh5dmhCd0pRSUR3Q1ZwQXhTblRGUi9jVm1TRE9vb3FreTMw?=
 =?utf-8?B?UDA2WlBrMytOK1RZUmNyRzk5R1k1SVlkdlgrMlp6RlNJZEVWQ3cvcVV1bms0?=
 =?utf-8?B?aFA0a3hoR2VXeHpKSVlOS0xJdDJHNFBadHcraFQ4Myt3OTdTMk1WU2JPYmlB?=
 =?utf-8?B?V1ZiK1BYZzJ0NC9CdG8rQjJ6R3ZvMjZBOHlydmwzOHRSVFMyaHA1eUVXMndZ?=
 =?utf-8?B?V1p0R29CZkdnRGJLYmdTR1dJc1FkcVpqa0dKbkxwdWg0a01wRElvZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a65925-24e5-4394-1921-08de8ed002ab
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:48:38.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfQt1QaD6iMJZw9e89wYDrAXz53rvakNwGT4qjlFgQrLhcXR97FIKFk8U+rIz13tRk3VBJIPokWLPUg/HTHqhOq6mDu7Ky5v/gR+d2mFt7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_194854_550898_21611D37 
X-CRM114-Status: GOOD (  30.74  )
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

SGkgTWFydGluLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvMy8zMSAwNTo0
NCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBYaWFud2VpIFpoYW8sCj4gCj4gT24g
VGh1LCBNYXIgMjYsIDIwMjYgYXQgNzozNeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkK
PiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gIHdyb3RlOgo+
PiBGcm9tOiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBBZGQg
c3VwcG9ydCBmb3IgQW1sb2dpYyBTNyBQV00uIEFtbG9naWMgUzcgZGlmZmVyZW50IGZyb20gdGhl
Cj4+IHByZXZpb3VzIFNvQ3MsIGEgY29udHJvbGxlciBpbmNsdWRlcyBvbmUgcHdtLCBhdCB0aGUg
c2FtZSB0aW1lLAo+PiB0aGUgY29udHJvbGxlciBoYXMgb25seSBvbmUgaW5wdXQgY2xvY2sgc291
cmNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20t
bWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCj4+IGluZGV4IDhjNmJmM2Q0OTc1My4u
M2QxNjY5NGUyNTRlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiAr
KysgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiBAQCAtMTEzLDYgKzExMyw3IEBAIHN0cnVj
dCBtZXNvbl9wd21fZGF0YSB7Cj4+ICAgICAgICAgIGludCAoKmNoYW5uZWxzX2luaXQpKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCk7Cj4+ICAgICAgICAgIGJvb2wgaGFzX2NvbnN0YW50Owo+PiAgICAg
ICAgICBib29sIGhhc19wb2xhcml0eTsKPj4gKyAgICAgICBib29sIHNpbmdsZV9wd207Cj4gQXQg
Zmlyc3QgSSB3YXNuJ3Qgc3VyZSBhYm91dCB0aGlzIGFuZCB0aG91Z2h0IHdlIHNob3VsZCByZXBs
YWNlIGl0Cj4gd2l0aCBhIG51bV9wd21zIChvciBzaW1pbGFyKSB2YXJpYWJsZS4KPiBIb3dldmVy
LCBJIHRoaW5rIGl0IHdpbGwgYmUgaGFyZCB0byBhZGQgYSB0aGlyZCAob3IgZXZlbiBtb3JlKQo+
IGNoYW5uZWxzIHRvIHRoZSBQV00gY29udHJvbGxlciAobm90IGp1c3QgZnJvbSBkcml2ZXIgcGVy
c3BlY3RpdmUgYnV0Cj4gYWxzbyBmcm9tIGhhcmR3YXJlIHBlcnNwZWN0aXZlKS4gU28gSSB0aGlu
ayB0aGlzIGlzIGdvb2QgZW5vdWdoIGFzIHRoZQo+IGNob2ljZSB3aWxsIG9ubHkgYmUgMSBvciAy
Lgo+ID4gWy4uLl0KClRoaXMgaXMgbm90IGEgdGhpcmQgY2hhbm5lbCBhZGRlZCBoZXJlLgpDb21w
YXJlZCB3aXRoIHRoZSBwcmV2aW91cyBjb250cm9sbGVyIGhhdmluZyB0d28gY2hhbm5lbHMsIGhl
cmUgdGhlIApjb250cm9sIGhhcyBvbmx5IG9uZSBjaGFubmVsLiBJdCdzIGVxdWl2YWxlbnQgdG8g
dGhlIGZpcnN0IGNoYW5uZWwgCmJlZm9yZSwgd2hpbGUgdGhlIHNlY29uZCBjaGFubmVsIGlzIHJl
c2VydmVkLgoKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEgcHdtX3M3X2Rh
dGEgPSB7Cj4+ICsgICAgICAgLmNoYW5uZWxzX2luaXQgPSBtZXNvbl9wd21faW5pdF9jaGFubmVs
c19zNywKPiBJIHRoaW5rIHlvdSBjYW4gdXNlIC5jaGFubmVsc19pbml0ID0gbWVzb25fcHdtX2lu
aXRfY2hhbm5lbHNfczQsIGlmCj4geW91IGNoYW5nZSB0aGUgY29kZSBpbnNpZGUgdGhhdCBmdW5j
dGlvbiBmcm9tOgo+ICAgICAgZm9yIChpID0gMDsgaSA8IE1FU09OX05VTV9QV01TOyBpKyspIHsK
PiB0bzoKPiAgICAgIGZvciAoaSA9IDA7IGkgPCBjaGlwLT5ucHdtOyBpKyspIHsKPiAKPiBbLi4u
XQoKVGhlIG1ldGhvZCB5b3Ugc3VnZ2VzdGVkIHdhcyBleGFjdGx5IHdoYXQgSSBkaWQgaW4gdGhl
IGZpcnN0IHZlcnNpb24sIApidXQgYWZ0ZXIgbXkgc3Vic2VxdWVudCBvcHRpbWl6YXRpb24sIGl0
J3Mgd2hhdCB5b3Ugc2VlIG5vdy4KClNpbmNlIGluaXRpYWxpemF0aW9uIG9ubHkgaW52b2x2ZXMg
b2J0YWluaW5nIHRoZSBjbG9jaywgSSBtb2RpZnkgdGhlIApjb2RlIGxlc3MgaW4gdGhpcyB3YXkg
YW5kIHRoZSBsb2dpYyBpcyBhbHNvIHNpbXBsZXIuCgo+PiBAQCAtNjUwLDkgKzY3NCwxMyBAQCBz
dGF0aWMgaW50IG1lc29uX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
PiAgIHsKPj4gICAgICAgICAgc3RydWN0IHB3bV9jaGlwICpjaGlwOwo+PiAgICAgICAgICBzdHJ1
Y3QgbWVzb25fcHdtICptZXNvbjsKPj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2Rh
dGEgKnBkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+PiAgICAg
ICAgICBpbnQgZXJyOwo+Pgo+PiAtICAgICAgIGNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2MoJnBk
ZXYtPmRldiwgTUVTT05fTlVNX1BXTVMsIHNpemVvZigqbWVzb24pKTsKPj4gKyAgICAgICBpZiAo
cGRhdGEtPnNpbmdsZV9wd20pCj4+ICsgICAgICAgICAgICAgICBjaGlwID0gZGV2bV9wd21jaGlw
X2FsbG9jKCZwZGV2LT5kZXYsIDEsIHNpemVvZigqbWVzb24pKTsKPj4gKyAgICAgICBlbHNlCj4+
ICsgICAgICAgICAgICAgICBjaGlwID0gZGV2bV9wd21jaGlwX2FsbG9jKCZwZGV2LT5kZXYsIE1F
U09OX05VTV9QV01TLCBzaXplb2YoKm1lc29uKSk7Cj4gSSBkb24ndCB0aGluayB0aGlzIGNvZGUg
aXMgdG9vIGJhZCBmb3Igbm93Lgo+IEhvd2V2ZXIsIEknbSB3b25kZXJpbmcgaWYgeW91IHdhbnQg
dG8gbWFrZSAiY2hhbm5lbHMiIGZyb20gc3RydWN0Cj4gbWVzb25fcHdtIGEgZmxleGlibGUgYXJy
YXkgbWVtYmVyIGluIGEgZnV0dXJlIHBhdGNoLiBJbiB0aGF0IGNhc2UgaXQKPiB3aWxsIGJlIGhl
bHBmdWwgdG8gaGF2ZSBhbiAidW5zaWduZWQgaW50IG5wd20gPSBwZGF0YS0+c2luZ2xlX3B3bSA/
IDEKPiA6IE1FU09OX05VTV9QV01TOyIgKG9yIHNpbWlsYXIpIHZhcmlhYmxlIHRvIGZ1dHVyZS1w
cm9vZiB5b3VyIGNvZGUuCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpJIGNvbnNpZGVyZWQgdGhpcywg
YnV0IGNob3NlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBJIHdpbGwgc3dpdGNoIAp0byB5
b3VyIHN1Z2dlc3Rpb24gaW4gdGhlIG5leHQgdmVyc2lvbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
