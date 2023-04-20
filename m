Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71E9C77B73
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Apr 2023 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aaoNYze7hSohSU+A5lwGE8dQ95jqBjXwHFlI2vfKhs=; b=gI4iAWdpgU7ROSVHMgo+m+C0lr
	g7HDfheN3aqKlp1J2NaODPg2Teksv4ZPDoXCWGf8rkvYBgs3Te6meHNu06g8PdlsRPk2HmklRlBLA
	GtPcy9pcWH0k8Pa1+zvUiOy8lIck3cplq+f9hXak4U7GfG1xFUb0fvkavF5hGlUbbia5ZgOhFh3h8
	N6NCaJr/q3sWS0u9bKRTc35AfwFRYThKooCCNU3MqrDiTScUzJcsYcWXcJUGz+jKD9m4c+Ffrth89
	N+OlOVoYnuO9lLl7mbgDIAeCUFCyoTY5TRCUNBT8GgxUOcZ0HFMtMK4EBI1pEq2nh9qHktgfSnf/7
	SPkWOAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPtd-007RLE-20;
	Thu, 20 Apr 2023 08:44:05 +0000
Received: from mail-psaapc01on2071a.outbound.protection.outlook.com ([2a01:111:f400:feae::71a] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPtZ-007RK7-0b;
	Thu, 20 Apr 2023 08:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROhxDDm+pzc2AVMYoUsiWUyO9WK027heKsRmQGVvcWCbO8qxGUZK/f0pgNSPuTzXGDNAIPYs0vGuq7dDw99XnpKrIT5WIL6g87+L1cfXosKbbWoK3Nt0HzEW3I+wD9VvNQr1LdrUjiVLQqpRfg2oBIGiQcKU+lLZaGCkE+v3CTX/vEU58N+mCNL47bDF1uHpvvwtraIkP6e1W2R5+E/3Qr2Y2AmbgBKDyJ7IED+RkNqwwOEgmrG8YyuaYF02xyDUL6kD2U3qC6YBU1KQYvXzMS0+DjfOGnlHdXCa7p5Ggn43Rs+3gZKaMekly/5veacSaNHBTLVokXoekS65dkXh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CghG2Slv8gmivGg+Io3vlsM0D6+rRhOth2U7N343ePU=;
 b=XwDq/tLS5pR2Ec5542Vbh1/98fEwBwI82dcNgRQJRkkxYbM2/zFOtLBFRYnpU/Do/QgVDJUmBFfVsnt6hO45VRKDclB8wZnMPN8AmGuCbhRzpwuuxOBVp0GfFAcfBhwYfEBtHn2NqPWVndABw2YJH0hN6vm4oUIud+HH9c/hXPbf5O8SkewkGz0QFUzAufdarbUvOnn1p3QTMtMMfn5jVLCrgtvEKizY0a8v6ILZAa6mBnlcEtgEd4m9LnIFlKru+BPBkYvSNI+D61el+axBuqCX8Mv3Yk881bi8G0qhhKJxvg6q5/itfJtSWh+sjHFFLaBQxHYEXfyG3x625H+CAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com (2603:1096:101:e2::14)
 by PSAPR03MB5639.apcprd03.prod.outlook.com (2603:1096:301:66::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 08:43:52 +0000
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086]) by SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:43:51 +0000
Message-ID: <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
Date: Thu, 20 Apr 2023 16:43:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
 <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
 <20230419160405.d7qfir3nv6tlxx2a@CAB-WSD-L081021>
 <427e79ef-156d-027e-9296-6f4e6513a04d@linaro.org>
 <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
Content-Language: en-US
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To SEZPR03MB7033.apcprd03.prod.outlook.com (2603:1096:101:e2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7033:EE_|PSAPR03MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec77e24-939d-4a79-6aef-08db417b5cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HFpQ3Gdl6y63zDvKo0onDEaOvFmqdZLiVoPsuf/X4Ld1VIY8ymngAptDhHmkhKCkrjryKoQsV8KJSIgnT7ZZ47m543p0d6FnMHhKGYr3BgwMHxMmGVyfx9Xe/tx1NvApaUspeZeVYQ1iTzjX6ANhKFxuenZZYWJ3i9Citrl6pxmSfC2gB5Lb52Xb5T+MCQWWpFnQC4IdFZi8SOW9ahoMx6GHe8E1Y4hltTVqfucXO48Pq1PGCc41pKeMzaOFNIA/vmTatG2ypH1A2gFHbobZLEyabGTIoZUK7nosYCAzN1gyFFMPDSQccrBml7ePjn+X6D869h7cVHCyQhezdr0vkpcOIN3Aq47prurj6x2mbSK7lqZLPXKUF881XC31qZuuo13w8uIt9PYf/NRL1WIIYlipfeNbzIwwh8PvpPrhrXzmUHKPR12467Upfdv/iBH9HB44X3WkL5NAuOVh/XWM/4YRJEQ9u7YMsf7/LqHqaz+5CX20Iez/WyOW7yjRPmTxANX5LyaVcDvxlNmlRFHQAALEb/dVL7foEFmZ6TGFUK1tJko/gRNkBUKkpN55mH/RXAu2391RSvsToVJgtyxpOrSsbWSlBjk5gG9qkipPMQqo8ZByfVIa1z5D7oSZvqTR8XfQfb7A/Bml/FPWbBl5Aw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7033.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(346002)(366004)(376002)(136003)(451199021)(31696002)(2906002)(86362001)(36756003)(31686004)(6486002)(6666004)(53546011)(186003)(2616005)(6506007)(6512007)(26005)(966005)(478600001)(66476007)(4326008)(66556008)(66946007)(41300700001)(38100700002)(7416002)(110136005)(316002)(54906003)(44832011)(8936002)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?U3RRaXlHZ2RVcjlXMFJ5dDdVQWxndDJBeHlzenY5d0lsTGdXbXZjR09uc3Rx?=
 =?utf-8?B?K3JvYkMrcjNFMVBxZkx5UlF6Q1dTd3FRSlhDdTQwaFVkangyeXRReE9MN0tE?=
 =?utf-8?B?TDZjZGRndHBrbFBXOVpnRkZ4NTM1SE5iZjcwMnM1dEE5Zm5OQnVKWEtjcjJy?=
 =?utf-8?B?d0RESmNBa0Nzdk5pdDhkdWJjbW9pbnhCMXdYM3k5S2FRQnRJY0ZqSlBYR05k?=
 =?utf-8?B?YWZxQXVYVW54MHF2Qms1WmtQRjZ2NUpSdUhTc0ZUb21RSVdSQklFZFJIOCtF?=
 =?utf-8?B?dDRJVFVCUGpUajNBMHUyVERpeDhCbkV0RTdRdDB0OWc3eDdsVDlFRjlma050?=
 =?utf-8?B?T2F6Mm02YkVhdmpvVmtlL2Y1VHkrUVVjcThKaHEyLzNIRVlYUlpEMWt4T2M0?=
 =?utf-8?B?T3MzZUVFUm4xZWVFMHNwYU9HamVEY0dLQzZCNi81NkkzZ2IrK1djUlEybzlU?=
 =?utf-8?B?WmliRmRkWlV0ZnJBekhVd3JKY0gvQVlKQmprTUluUWtqM0Q5VFZJQ0lyZzJI?=
 =?utf-8?B?bzI5ZUx1bHlBNE5vWjUwVlpzVmRtdDJhc01HdERhUXFEWmxkZm5qNlhibFZT?=
 =?utf-8?B?cG5Qd1BUN0Y5MVRpUVhwejREazJVMlFOVTdHTzZPQXZCUzFpNFVPbDBqb3Y5?=
 =?utf-8?B?NktXNG5kRjFzOXJvdUN3QWhLMlhWZStGRXVXUXVzTm1aZGQwM0MzNWdoY1Jm?=
 =?utf-8?B?QUtPSjZpT1lOSHBBcXBlMWlnQzVZU1NWZE1hZHd1V3M4WW9wNnNERkMydkNr?=
 =?utf-8?B?TUMwZTN2bE9KekZYZVlURGxPNmZ4WjM3bThXTmo0d0JjQTZxTXZpb25SY1lG?=
 =?utf-8?B?ZWtVL003T1FvUnd3cEtMWTZrOHBWa0FJNTlkOXBJeWV6bytQaFcyamU0MXNI?=
 =?utf-8?B?NjFiN2x1V00yTWUwOGNpbEE0eEo5NDFwY3NldjFUbEd6QnNrRjV6S0gyeDFw?=
 =?utf-8?B?VGpRRVNUUEdWYmdYVkt4WG1PZnQzaDZZWWNRVVZCeWpaVldReFRxS2NXdThq?=
 =?utf-8?B?V3NyVlBxM0JsTXNSUGdaNWpqUnIydlBROHJKRExWM1JBRkRCejdSdW8wWHdZ?=
 =?utf-8?B?OVIvMStjUnhjQ0YwVm9oRkFDNmYxdUZoOG51aFpzMGlENkYyNU1NSUMvYzBS?=
 =?utf-8?B?MDl1TnN6TnRjVmRYZTRlc3c4NDNpUWRxdTVlNUcrSzYzeENIS042aCs4a3Fq?=
 =?utf-8?B?RWF2MHo3RHo3M0JTa0FoSVdpL2JXc2UzNzN5ZDNiRG42YXQ1NDlESi9rTDk5?=
 =?utf-8?B?bkNwb2RKcUY3Qk41aThUYXJRM1c3RmQ3QzliT011OFE1WGVpSTRhNHppdThq?=
 =?utf-8?B?QzFaYTBxcXE0MmRxTG91VC9WdEdwVnF4MVRKOUNqbVppai91N2xUdEpsbjJY?=
 =?utf-8?B?cDFHOTc3aHBuRGRiZjNQa1V0MDlYOHFXd2RHaU1NQi9iK3dXeXdjZUdJRXI2?=
 =?utf-8?B?M1IzempWaUZINHduWVIrT0NKanVBZVRzSFdmalhZb2dyalRXMTVBVmlxZTNR?=
 =?utf-8?B?ak9zVlEzQkt5ZkhHMjJJZGJJd01RRnBSdk5YWGtsOXh5WmhKeFFRRFFHRUNR?=
 =?utf-8?B?NHVkaEVlVmU3L2pJWmJzTXB2ZkVTTDVGL3dDalU0Qnl4MWRVd1psY2c4bnpq?=
 =?utf-8?B?WXJSSzBJMEwxTmVFa2NYcDBZWUc0cTN1Ty9jZldLVHdmVUlhRVhYcjcrOGRK?=
 =?utf-8?B?dlh0aDdKMldxdXZiQ0VxSlZRMEtyZnIvUmhlb2lIRmpqbjJiVWpoRFhwaHFp?=
 =?utf-8?B?SkV5MVFvd2YxR1grSDg5VXh4b3lHRHI3WHZZcXJWanYvSEpUQzlxOTdpQ0Nn?=
 =?utf-8?B?aTF0a1ZkTjhBdGl2N1VjOVpnTlZEUSt2Z1NTWk16TFp3VW0rRjE5TGRzYUZr?=
 =?utf-8?B?QmFRSjZKV0tvRCs5aVlYcThLM0ZydTdOZEhMMytGN2FkdkJiYXVya01QQ0Rv?=
 =?utf-8?B?MUM1alBuVFJxTEFpM251UVJqT216Q3RlRnlidW1ZNnNwQ2pLeGpaVVNnS21T?=
 =?utf-8?B?M1M1Rm5NQWZOT0RQOWI0UWNYdnhvWi9scDJ1S1F2NVFzbHk4U1pYc1EzZkg2?=
 =?utf-8?B?YWRZcDVBQ3grMTgwbnNDMlVMVGlCNFUvQy9ibmd3QU13ZXZaRWRTcm9adkY1?=
 =?utf-8?B?U2pyZ3UrdzVzL3R1aHhwNGdCaXJIWHZTWGVsWHU0R1BaeFFpT3ZxcnJVVlNr?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec77e24-939d-4a79-6aef-08db417b5cc0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7033.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:43:50.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHr6qSiiHLHHSV/lbw5SaBcz7H8E/sLZl2qQrw4lVeonYPI8kyltG9EfS6sJWB7XznERgDUPOTBRnl793nC9NSofjgGcIBmo6xZSatSlnow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_014401_246146_49B3EBA1 
X-CRM114-Status: GOOD (  31.00  )
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

T24gMjAyMy80LzIwIDAxOjAwLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KPgo+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDA2OjI1OjA3UE0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+PiBPbiAxOS8wNC8yMDIzIDE4OjA0LCBEbWl0cnkgUm9rb3NvdiB3
cm90ZToKPj4+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDAzOjQzOjEyUE0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+Pj4+IE9uIDE5LzA0LzIwMjMgMTU6MTQsIERtaXRyeSBSb2tvc292
IHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAwMzozODozM1BNICswODAwLCA9
WGlhbndlaSBaaGFvIHdyb3RlOgo+Pj4+Pj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpo
YW9AYW1sb2dpYy5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIEMgc2VyaWVzIFNvQ3MgYXJlIGRlc2ln
bmVkIGZvciBzbWFydCBJUCBjYW1lcmEKPj4+Pj4+IGFwcGxpY2F0aW9ucywgd2hpY2ggZG9lcyBu
b3QgYmVsb25nIHRvIE1lc29uIHNlcmllcy4KPj4+Pj4+IFNvLCBBZGQgQVJDSF9BTUxJUEMgZm9y
IHRoZSBuZXcgc2VyaWVzLgo+Pj4+Pj4KPj4+Pj4+IFRoZXJlIGFyZSBub3cgbXVsdGlwbGUgYW1s
b2dpYyBTb0Mgc2VpZXMgc3VwcG9ydGVkLCBzbyBncm91cCB0aGVtIHVuZGVyCj4+Pj4+PiB0aGVp
ciBvd24gbWVudS4gd2UgY2FuIGVhc2lseSBhZGQgbmV3IHBsYXRmb3JtcyB0aGVyZSBpbiB0aGUg
ZnV0dXJlLgo+Pj4+Pj4gSW50cm9kdWNlIEFSQ0hfQU1MT0dJQyB0byBjb3ZlciBhbGwgQW1sb2dp
YyBTb0Mgc2VyaWVzLgo+Pj4+Pj4KPj4+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRyb2R1
Y2VkLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgYXJjaC9hcm02NC9LY29uZmln
LnBsYXRmb3JtcyB8IDEyICsrKysrKysrKysrKwo+Pj4+Pj4gICAgIGFyY2gvYXJtNjQvY29uZmln
cy9kZWZjb25maWcgfCAgMiArKwo+Pj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcucGxh
dGZvcm1zIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+Pj4+Pj4gaW5kZXggODlhMGIx
M2IwNThkLi5iZmJjODE3ZWVmOGYgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9hcmNoL2FybTY0L0tjb25m
aWcucGxhdGZvcm1zCj4+Pj4+PiArKysgYi9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zCj4+
Pj4+PiBAQCAtMTYyLDEyICsxNjIsMjQgQEAgY29uZmlnIEFSQ0hfTUVESUFURUsKPj4+Pj4+ICAg
ICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBNZWRpYVRlayBNVDI3eHgsIE1UNjV4eCwg
TVQ3Nnh4Cj4+Pj4+PiAgICAgICAgICAmIE1UODF4eCBBUk12OCBTb0NzCj4+Pj4+PiArbWVudWNv
bmZpZyBBUkNIX0FNTE9HSUMKPj4+Pj4+ICsgICAgIGJvb2wgIk5YUCBTb0Mgc3VwcG9ydCIKPj4+
Pj4gTlhQPyBEaWQgeW91IG1lYW4gIkFtbG9naWMiPwo+Pj4+Pgo+Pj4+Pj4gKwo+Pj4+Pj4gK2lm
IEFSQ0hfQU1MT0dJQwo+Pj4+Pj4gKwo+Pj4+Pj4gICAgIGNvbmZpZyBBUkNIX01FU09OCj4+Pj4+
PiAgICAgICAgYm9vbCAiQW1sb2dpYyBQbGF0Zm9ybXMiCj4+Pj4+PiAgICAgICAgaGVscAo+Pj4+
Pj4gICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBhcm02NCBiYXNlZCBBbWxv
Z2ljIFNvQ3MKPj4+Pj4+ICAgICAgICAgIHN1Y2ggYXMgdGhlIHM5MDUsIFM5MDVYL0QsIFM5MTIs
IEExMTNYL0Qgb3IgUzkwNVgvRDIKPj4+Pj4+ICtjb25maWcgQVJDSF9BTUxJUEMKPj4+Pj4gRG8g
d2UgcmVhbGx5IG5lZWQgYSBkaWZmZXJlbnQgQVJDSCBmb3IgQW1sb2dpYyBJUEM/Cj4+Pj4+IEkg
Y2FuIGltYWdpbmUgdGhhdCBpdCdzIG5vdCB0aGUgTWVzb24gYXJjaGl0ZWN0dXJlIGF0IGFsbC4K
Pj4+Pj4gQnV0IG1heWJlIGEgYmV0dGVyIHNvbHV0aW9uIGlzIGp1c3QgdG8gcmVuYW1lIEFSQ0hf
TUVTT04gdG8gQVJDSF9BTUxPR0lDPwo+Pj4+IEl0IHNob3VsZCBiZSBjaGFuZ2VkIHRyZWV3aWRl
LCBhbmQgaXMgaXQgd29ydGggaXQgPwo+Pj4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgdGhlIEEx
IGFuZCBTNCBmYW1pbGllcyBhcmUgbm90IGZ1bGx5IGNvbXBhdGlibGUKPj4+IHdpdGggdGhlIE1l
c29uIGFyY2hpdGVjdHVyZSwgYW5kIHdlIGhhdmVuJ3QgcHJvdmlkZWQgYWRkaXRpb25hbCBBUkNI
XyoKPj4+IGZvciB0aGVtLgo+PiBUaGUgR1hCQiwgR1hML0dYTSwgRzEyQSwgRzEyQiAmIFNNMSBh
cmUgYWxzbyBub3QgZnVsbHkgY29tcGF0aWJsZSwKPj4gYnV0IHRoZXkgbGllIHVuZGVyIHRoZSAi
TUVTT04iIHVtYnJlbGxhIHdoaWNoIGNvdmVycyBTb0Mgc2luY2UgdGhlCj4+IE1lc29uNiBhcmNo
aXRlY3R1cmUuIEl0J3MgYSBmYWNpbGl0eSB0byBpbmNsdWRlL2V4Y2x1ZGUgQW1sb2dpYwo+PiBk
cml2ZXJzL0RULCBub3RoaW5nIGVsc2UuCkdYQkIsIEdYTC9HWE0sIEcxMkEsIEcxMkIgLCBTTTEg
YW5kIFM0IGJlbG9uZyB0byBtZWRpYSBib3guClNvLCAiTUVTT04iIHJlcHJlc2VudHMgdGhlIG1l
ZGlhIGJveCBzZXJpZXMuClVwIHRvIG5vdywgIk1FU09OIiB3b3JrcyB3ZWxsIGZvciBhbGwgZXhp
c3RpbmcgY2hpcHMgZXhjZXB0IEExIGFuZCBBWEcuCj4+IElmIHlvdSBjb21wYXJlIGl0IHRvIEJD
TSBvciBOWFAsIGl0J3MgZGlmZmVyZW50IHNpdHVhdGlvbiwgdGhlCj4+IGRpZmZlcmVudCBBUkNI
XyogYWN0dWFsbHkgdGFyZ2V0cyB0b3RhbGx5IGRpZmZlcmVudCBTb0NzIGZyb20KPj4gY29tcGxl
dGVseSBkaWZmZXJlbnQgQnVzaW5lc3MgVW5pdHMgb3IgZnJvbSBjb21wYW5pZXMgYWNxdWlzaXRp
b25zLgpGaXJzdGx5LCB0aGUgbmV3IEMgc2VyaWVzIGlzIHRvdGFsbHkgZGlmZmVyZW50IGZyb20g
cHJldmlvdXMgTUVTT04gc2VyaWVzLgogRnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgYXBwbGljYXRp
b24sIHRoZSBuZXcgQyBzZXJpZXMgaXMgZGVzaWduZWQgZm9yIApzbWFydCBJUCBjYW1lcmEgYXBw
bGljYXRpb25zLAp3aGlsZSBNRVNPTiBzZXJpZXMgaXMgZGVzaWduZWQgZm9yIGh5YnJpZCBPVFQv
IElQIFNldCBUb3AgQm94wqAgYW5kIApoaWdoLWVuZCBtZWRpYSBib3ggYXBwbGljYXRpb25zLgog
RnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgYXJjaGl0ZWN0dXJlLCB0aGUgbmV3IEMgc2VyaWVzIGlu
dGVncmF0ZXMgdGhlIApzZW5zb3IgaW50ZXJmYWNlLCBpbWFnZSBzaWduYWwgcHJvY2Vzc2luZyB1
bml0LCBEZXdhcnAsIHZpZGVvIGVuY29kZXIsIApuZXVyYWwgbmV0d29ya2luZyBwcm9jZXNzaW5n
IHVuaXQsCndoaWNoIE1FU09OIHNlcmllcyBkb2VzIG5vdCBhbmQgd2lsbCBuZXZlciBoYXZlLgpT
ZWNvbmRseSwgdGhlcmUgYXJlIEMxIGFuZCBDMiBiZXNpZGVzIEMzLgpNb3Jlb3ZlciwgbW9yZSBv
dGhlciBzZXJpZXMgYXJlIG9uIHRoZSB3YXksIHN1Y2ggYXMgVCBzZXJpZXMuCklmIHdlIGFsd2F5
cyBzdGljayB0byAiTUVTT04iLCBwZW9wbGUgd2lsbCBnZXQgbW9yZSBhbmQgbW9yZSBjb25mdXNl
ZC4KVGhlcmVmb3JlLCBJIHRoaW5rIGl0IGlzIHRoZSByaWdodCB0aW1lIHRvIGFkZCBBUkNIX0FN
TElQQy4KPj4gV2Ugc2hvdWxkIGhhdmUgbmFtZWQgaXQgQVJDSF9BTUxPR0lDIHNpbmNlIHRoZSBi
ZWdpbm5pbmcsIGJ1dCB3ZQo+PiBjYW4ndCBjaGFuZ2UgaGlzdG9yeS4KU2hvdWxkbid0IHdlIGRl
c2VydmUgYSBjaGFuY2UgdG8gbWFrZSBpdCByaWdodD8KPj4+IEluIG15IG9waW5pb24sIGl0J3Mg
YSBnb29kIHRpbWUgdG8gc3BsaXQgdGhlIE1lc29uIGFyY2hpdGVjdHVyZSBpbnRvCj4+PiBwcm9w
ZXIgc3Vic2V0cywgb3IgcmVuYW1lIGl0IHRyZWV3aWRlIChtYXliZSBvbmx5IGNvbmZpZyBvcHRp
b24KPj4+IEFSQ0hfTUVTT04gPT4gQVJDSF9BTUxPR0lDKS4KPj4gTUVTT04gaXMgb25seSBhIGNv
ZGVuYW1lIHRvIGRpZmZlcmVudGlhdGUgZnJvbSBvdGhlciBTb0MgdmVuZG9ycwo+PiBiZWNhdXNl
IEFtbG9naWMgdXNlZCBpdCBhcyBhIGNvZGVuYW1lIGZvciBhIGxvbmcgdGltZS4KPj4gQ29tcGFy
ZSB0aGlzIHRvIEFsbHdpbm5lcidzICJzdW54aSIgb3IgUXVhbGNvbW0ncyAibXNtIi4KPj4KPj4g
VGhpcyBjb25maWcgaGFzIG5vIGZ1bmN0aW9uYWwgbWVhbiwgaXQncyBvbmx5IGEgY29uZmlnIG5h
bWVzcGFjZS4KPj4KPj4gUmVuYW1pbmcgaXQgd291bGQgbmVlZCByZW5hbWluZyBpdCBpbiBhbGwg
c3Vic3lzdGVtcyBLY29uZmlnL01ha2VmaWxlcwo+PiBhbmQgd2lsbCBjZXJ0YWlubHkgYnJlYWsg
YnVpbGRzIHdpdGggY3VzdG9tIGtlcm5lbCBjb25maWdzCj4+IGluIHZhcmlvdXMgcHVibGljbHkg
dXNlZCBidWlsZHMgbGlrZSBBcm1iaWFuLCBtZXRhLW1lc29uLCBMaWJyZUVMRUMsCj4+IERlYmlh
biwgU3VzZSwgLi4uCkxldCdzIGdldCBiYWNrIHRvIEFSQ0hfQU1MSVBDLgpXZSBqdXN0IG5lZWQg
dG8gYWRkIEFSQ0hfQU1MSVBDIGluIHRoZSBuZWNlc3Nhcnkgc3Vic3lzdGVtcyAKS2NvbmZpZy9N
YWtlZmlsZS4KVGhpcyBjaGFuZ2Ugd2lsbCBrZWVwIHRoZSBleGlzdGluZyBNRVNPTiByZWxhdGVk
IGNvZGUswqAgYW5kIHdpbGwgbmVpdGhlciAKaW52b2x2ZSByZW5hbWluZyBub3IgYnJlYWsgYW55
IGJ1aWxkcy4KPj4gU28gaXQncyBwb2ludGxlc3MgdG8gY2hhbmdlLCBhbmQgZXZlbiBhZGQgYSBk
aWZmZXJlbnQgb25lIHNpbmNlCj4+IGl0J3Mgbm90IGEgZmFtaWx5IGRpZmZlcmVudGlhdG9yIHNp
bmNlIHRoZSBLZXJuZWwgaXMgbW9kdWxhcgo+PiBhbmQgd29ya3MgYXJvdW5kIERUIHRvIGRldGVy
bWluZSB3aGljaCBkcml2ZXJzIHRvIHByb2JlLgpQcm9wZXIgbmFtZXMgcGxheSBhbiBpbXBvcnRh
bnQgcm9sZSBpbiB1bmRlcnN0YW5kaW5nIHRoZSBjb2RlLCByaWdodD8KPj4gTmVpbAo+Pgo+IFRo
YW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uOyBpdCBtYWtlcyBzZW5zZSEKPiBB
Y3R1YWxseSwgSSBkaXNhZ3JlZSB3aXRoIGNyZWF0aW5nIGEgc2VwYXJhdGUgQVJDSCB3aXRob3V0
IGZpcnN0IHJld29ya2luZwo+IGFsbCBvZiBpdHMgc3Vic2V0cyAtIHRoYXQncyB3aHkgSSBzdGFy
dGVkIHRoaXMgZGlzY3Vzc2lvbi4KPiBOb3csIEkgc2VlIHRoYXQgeW91IHNoYXJlIG15IHBlcnNw
ZWN0aXZlIGFuZCBiZWxpZXZlIHRoYXQgQzMKPiBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIEFSQ0hf
TUVTT04gc3Vic2V0LCBzbyBJIGhhdmUgbm8gb2JqZWN0aW9ucy4KPgo+IFsuLi5dCj4KPiAtLQo+
IFRoYW5rIHlvdSwKPiBEbWl0cnkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
