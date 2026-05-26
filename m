Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9795ACD5BD2
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mbN9uv/XhutZmRi3h6dwJMZ02VOjWmIYsCGzS9Jlwc=; b=exEEfiv8klZZG13R5TqhgJ37Pf
	Q72yC9tkheEG6MEO7neHcfXCR6vlENVRJPRl5ci69l3xf95DejJkKSJx909OgqnyaMXqoxgJMGfne
	dtGQUlCIuYv7RqRzGlpLjUnBwEvF5myBE4jLlY74BJxnzadYRkx9/E8bxvZdBC6I3ofrPl5ogUOjM
	69qhl3s/21ozCTBxGsRFskofppFc//HliacwfCyGXIVsP2D0ZMRARbVGtQuneH7f5C8F3O0l9e0eq
	tT3Ql/8mZUWEJ0qvsy0hmRroAi07hQGuXIK8d5WTZXrdrruVAUxOrQHvwFQ0KZGNXA4377B6INCz0
	rqJRkNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoYf-00000001afC-1TL9;
	Tue, 26 May 2026 09:58:45 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoYc-00000001aeg-3vKI;
	Tue, 26 May 2026 09:58:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qre/BnxHvItClEmKiwLiNJRuBZioRxzbgPiDfkB7H2Cl6z7kDm85YI8jw8kUfxkiezDddwS0X2srahoef37hQWOZUea4arNeDH1rDj8hJcUeEwt9JGbp1pYr4lHWTezMIe8WYwYYOyAmO1aL6O4TqmrTKOwLrq0SNHGoc/O4Np8dF2xOS9gXkMwERUmx9XslBCaAQmVQrMbVGHpSJDpjftSdNv8ovyLecdN1eEU+eZTxSFEPj2QbJroNYfEv51uD1SgqL9U9scTcy7VQb6+XwITg3sknOxKc7ShMJY7MykmjNZWUyRBbFisTnDMJNNU5b7uHVXYlhPnxgq/bj0UVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohjKr/7bo4L9MkAcI42YrMqH3TfW+vOG9VO4+llpqU=;
 b=YlNs0DXPs6tIYKkmQXrG48SCE2iU8s/1C12GZv4QHdM9GPBq1Q6izv6ftPCiTMuseaM+JQrtJ0pZ7XhyQTLu4E0tImZl5EiwkNzN3oCyxXQ/LktVjty/TFKF7q5A+aY4pxv9cMn9NxSh041hXcix0uAZS42RHXvCyV9+2J0ppE6rbolKRiEAEnzoyoOwXwtUvjoukPxGINVli3kZ4WcFTlomSPhLx9wXUvNazTSszWEgGTv4DQRIOmAuJCv1kXl03PJqdl+KjaE49GxLFVefLXPCIqwur9Ne1F30BTUZIAu91w2NNGLpIWuCXIvc2SB9I+5H7/oc+NoThtMZkbVeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vohjKr/7bo4L9MkAcI42YrMqH3TfW+vOG9VO4+llpqU=;
 b=L+WH+nIRQevsMzTpMNJDN76x9x0NdR1MwGdES0K4hCRNGfntvnZHypvJSmU5m8lfxE2BSadvHgtaK7UNbP1qfwrGPGZSfBdRdqNRiyHUB3V8VcwS5rDgKugoTqUQrEpvNEkmHGzIkFFP3dU2uSZGX4YHs5Jl5QbchsCcthsYNF078fELp2Ed+2OnIN6TcRVnnBBwtvB1jbKnSYmXMLu2V1MWegPdrPZ1LW3zJXoOYry8mKnL8KbbzdN2hAYNywvJsxbJ1arg/oTuPRQYbBMDSu2kg80hMhRN58WQztUqaqxiAqvijIyNbcHdtf3Dh9LSlj3ytraOZcsPMH3EO/Hntg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB8252.apcprd03.prod.outlook.com (2603:1096:405:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:58:22 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Tue, 26 May 2026
 09:58:21 +0000
Message-ID: <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
Date: Tue, 26 May 2026 17:58:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e8a99-b378-4512-1dfc-08debb0d51f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003|11063799006|6133799003|5023799004|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: XzhcmZB5WWCEGnBxH2bRc7oSKwKmsyo+camFtcor+VYSfAHZCCElBqGADiGLTCru5RSK62zunKJsb7Pv5EjMsjQEauj1enZB4l3PFsQ1xj9G7RJXBfnLaL1HNMRGhTFVsyG1Dtll2k0bT9F/xYO3DeX637km1ax5mbS5QLy5+24hRDXKh47WoIggfO83pd7ga+4rZPUqoUXcGy/ihHzyEBbdtGIOvwGL4w7MsWmZFM0vNEyFtiKqtxblTRcXepE+DRhlfHELYYXNqi8Erj4m36tEoXbZFtnNQCjeW5R85fZn5D0ojmaAywTjBeJua6Os7YLvw3cGtiotVHgI8FLraXSmFtOek6Cpy8OwnJosE2wbnvSERw0wfAx5PFEM2wKzisF6P3jSlEI0inIxuLoTqQmNPOqqZZBDHqFL1V6TcFqD0dXVZZ75jrXWWvxpt05AGsJhW+Lh4c9fNB+O/61+9wIXjLA5Dm9l1JwD1PqGnjHzt1+6S+7fGzTK8WhjNIeUw/9UTDDAYlwY66Vla4cHGKsCpJH2DN4YM1c0RZ9pUGWXBqeLQP/0s3gACFQ0A2Sk5pvkrKa1sDWnipEOcu04/NX7yWyAvSMu+6LoZq2k+ILTBCalgzvzoVu4+jbtGoV0tzFVYLrLqi/9roLhpfxbuU2pbxnLwasFFH2kw2HGefL0ork6APVXvJ2c8rATSNNe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003)(5023799004)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWw1K0pCNEVYRk9qUWx1THAyUnFSeURTWE1VU2kzOElWeFdhWCt3MGJyWk1Z?=
 =?utf-8?B?REowTXRYejhBWGNad2kzWlJualpLanhzYWpsaHRlSUp0MHYwY0tkOUFFL1RW?=
 =?utf-8?B?ZE11U0Z3RC9EWEx1ZkRQeEFMek5LZXNxK3NQQjgvcEdvNmRvU0drYmRxRlVC?=
 =?utf-8?B?M29kYTM3UFRhaFZoVWczbnEwK2JaRzVyQTBJRzJiMW5qQkxscGZid0RKWG14?=
 =?utf-8?B?MXhneU1Ud2c5UXlSZ2dRWEoyRHYxQ2h4ZlpETkthSG1EdzBqd0c0dmhBRUhr?=
 =?utf-8?B?NldBUkx2WG9DSFVWdXFxUnJFRDFLT0dSaTRNVEtNTmNNTVB3ZUlNZVBjeWU4?=
 =?utf-8?B?QklLK01JcTM2VCtqcTRTY3N4NmlqNzhWaDAxdFd2YlNObzRpS25lekVVcjc0?=
 =?utf-8?B?RUxoYllyTGlRUG9ZbWxEL3I2b2xtQVQvNFZHUGdHTmZ1RWRrRXVXNCtnRzh1?=
 =?utf-8?B?WU1XTDUxSVRhRERCOFR6S0VCWG5lRzdyTHMzR3hDOHEvcUFxSFBoZVZ3RURR?=
 =?utf-8?B?NDQxQUZqQTdNZnhtQU5TTlNiN1ZOb0wrYzZLbExQLy9CZU83RFJxYURBRG1m?=
 =?utf-8?B?Z3lFc241SGsyamwwdDJtV0hDa1ZYdjMyOTArcXBUelAweG9DQjUxSzRVMlFG?=
 =?utf-8?B?WVQ0SldqVHlpUFdIaHRscU9RajF2eUVqU2gyZ3hXUkliMWJWQW41VkxxaEJn?=
 =?utf-8?B?WkdGZEE1TjMxQWk2V1pDN1ZZdXdBa0NsZENOY0FvTDFlZ3UxaExGWFk0SCsx?=
 =?utf-8?B?LzlGeTZmU0Iyb2lRMENSME5NQWhiY0orazFOZU5pWDNXZzFJT2dhZlhlalp1?=
 =?utf-8?B?ZXUzVkFseWU1UTFsaWQvSHNETVlMNzI1VHFGWStDS2NsM0c5NWZtWHE1VnF0?=
 =?utf-8?B?MC9CVTJIdzNkMVJ6T1o3bnNzNFlHNEFRSDhNV3oxYkxJS3FXUVVBZXNzN05z?=
 =?utf-8?B?NXAxcUZWL3NCZi9SWHdIR2FhUnZiREJDQlpvSmkycTFZeEsvVVo1aW9ydC8y?=
 =?utf-8?B?bFEzRWpHWmN3NytHV0VqRmtESXRNYVB2Zm1zZXFZZTVHQmFZZzNzVkd6K0VI?=
 =?utf-8?B?TmJFWUFTZE9nNUhEMnp2RUYwZzkxMXlrcEZzSkRFS085TE0zclFjbGhwaXVY?=
 =?utf-8?B?V1IrQ01GSnlCVFhiUHVUazN1YTM5OVM1aGVjSGtCQ2Z1Q3pCdnN5VldZczNa?=
 =?utf-8?B?T1Y2aG1nZDNEeVcrYVhBUTZxdkI3YVZjUWcxZThhNUJVd0pWS2ZlMVpWTXZ1?=
 =?utf-8?B?WDdPalA0OGp3SW1UK0s2Z0Z2VzZkcUZmdE52b01lVHJBdGZ6aktCOW81SGVy?=
 =?utf-8?B?c1Jya1BkQmJ0VG50MVNwOW1LQXRuaWxqMXg0UnRpQjhVa3Y3SGk2dmxwSkpF?=
 =?utf-8?B?UHFuL2Nva1F0OG1TY3Z3RWRrbWpPMExqSVNhbE1UVkNneitCQ3FLZlZuRjZr?=
 =?utf-8?B?eHBuODFtY2F2eFZoN0UzbHNKMFlsWFp0eHU5cjdNdkxkMHA5ZU54NldrckJI?=
 =?utf-8?B?TnZUM0pOeGt4Q1lkWlhTL3RFWXFzWm9UYjcrOUIxd1ZTRUM2QnRjbHpudXlZ?=
 =?utf-8?B?cE5wanFtc21ET1dVMGlHbUM1QzBrS0JnRkl4MlBmZldiekRDaTVSQzY1NnVB?=
 =?utf-8?B?MFZuVVp4VDVpb1BPY1BGZnBjK2xjcHhGMW9zUllvZDZOS0NoQkNxTkt2QWk0?=
 =?utf-8?B?UHRaQlZHR0ZXWEZzQzNWT2JaQkxrb2ROdXpXTWQ0MURyMy9MdzUwcTFRdHNj?=
 =?utf-8?B?cGhBSWhQeGlaOUV4ZnBjKytKZUd6QXpBU1pRTDBBR2FxTng3RmJ0eDR0MlRP?=
 =?utf-8?B?SlBGMVJjYzU0Z0I4R0NoenplWDNXTWxZVVhoVGJWczlzWTIvNk42S2kraFFP?=
 =?utf-8?B?L1VWNWFaRi9lYWZsd0JRSk9xY2wrRGtBUFlzZ0xDcDZTZ0ZYTy9QalIyb1Bq?=
 =?utf-8?B?OG03UEZZVXp5YUVGaFZ5Rk9QdEtMcjFOM1hKV0poRUhzSlJGSDdRTFp3Skd3?=
 =?utf-8?B?RWNiN25aSXJYbERvY2hZMExYMUFFbWxRZDVvV29iRmprSVVYaGw4YmZ2K1pM?=
 =?utf-8?B?YUtxOS9nYlhXK2dHRlpuWG5ZbWtJYzRRSnY0aTNramVIendrL0Vkd3VpK0Q2?=
 =?utf-8?B?UFRQYmxOSDg4ZmNOWWtvaWpGMzBjMkZQN1RlQ3dTMUVCR0xONlRPbXdQT1Rk?=
 =?utf-8?B?TE9uYnVtMTlKQVpwejVob0NNdEYzVk9QLy9UbFFaU2RITGlnSU1uOXd6ZUFT?=
 =?utf-8?B?QmdxRTczWlUxTk1VaXpNTVd6ODVUNjZaU2pMR0lwbVM3QS8remdFRHRMNWVt?=
 =?utf-8?B?eTRlcElwTHVhbDE2bXFaTDh6TXFsNXFlUWpNNU02UWlpWjNVWExEQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e8a99-b378-4512-1dfc-08debb0d51f4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:58:21.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUhYLv2+SM0m/AzidhZXvmrIVBHZIUODk10ZrYIU9Q9LX9ON7ob04IjFCdsZ3LgA9KU7nkV1UCLmZNwLO/giLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_025842_983730_861EF22B 
X-CRM114-Status: GOOD (  22.55  )
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

T24gNS8yMC8yMDI2IDM6MzUgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBPbiBtZXIuIDIwIG1haSAyMDI2IGF0IDEzOjQ3LCBKaWFuIEh1IDxqaWFuLmh1
QGFtbG9naWMuY29tPiB3cm90ZToKPgo+PiBPbiA1LzE0LzIwMjYgMTE6MTEgUE0sIEplcm9tZSBC
cnVuZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBsdW4uIDExIG1h
aSAyMDI2IGF0IDIwOjQ3LCBKaWFuIEh1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtqaWFuLmh1LmFt
bG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+PiBGcm9tOiBKaWFuIEh1IDxqaWFu
Lmh1QGFtbG9naWMuY29tPgo+Pj4+Cj4+Pj4gVGhlIEE5IFBMTCBwcmUtZGl2aWRlciB1c2VzIGEg
ZGl2aXNpb24gZmFjdG9yIG9mIDJebiB0byBlbnN1cmUgYSBjbG9jawo+Pj4+IGR1dHkgY3ljbGUg
b2YgNTAlIGFmdGVyIHByZWRpdmlzaW9uLgo+Pj4+Cj4+Pj4gQWRkIGZsYWcgJ0NMS19NRVNPTl9Q
TExfTl9QT1dFUl9PRl9UV08nIHRvIGluZGljYXRlIHRoYXQgdGhlIFBMTAo+Pj4+IHByZS1kaXZp
ZGVyIGRpdmlzaW9uIGZhY3RvciBpcyAyXm4uCj4+PiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJl
IGRvaW5nIGhlcmUgYnV0IEkgaGF2ZSB0byBhc2sgd2h5IHRoaXMgY2FuJ3QgYmUKPj4+IGltcGxl
bWVudGVkIHdpdGggaW5kZXBlbmRlbnQgZGl2aWRlcnMgdGhhdCBhbHJlYWR5IHN1cHBvcnRzIHBv
d2VyIG9mIDIgPwo+Pgo+PiBJZiB3ZSB1c2UgaW5kZXBlbmRlbnQgZGl2aWRlcnMsIHRoZSBuIG1l
bWJlciB3b3VsZCBoYXZlIHRvIGJlIHJlbW92ZWQgZnJvbQo+PiBtZXNvbl9jbGtfcGxsX2RhdGEu
Cj4+Cj4+IEhvd2V2ZXIsIG4gaXMgcmVmZXJlbmNlZCAzNSB0aW1lcyBpbiBjbGstcGxsLmMsIHdo
aWNoIG1lYW5zIHdlIHdvdWxkIG5lZWQKPj4gdG8gbW9kaWZ5IGFsbAo+PiByZWxhdGVkIGxvZ2lj
IGFjcm9zcyB0aGUgZmlsZS4gVGhpcyB3b3VsZCBiZSBhIHJlbGF0aXZlbHkgbGFyZ2UKPj4gY2hh
bmdlLgo+IFllcwo+Cj4+Cj4+IE1vcmVvdmVyLCBmb3IgYWxsIEFtbG9naWMgY2hpcHMsIHRoZSBu
IGRpdmlkZXIgaXMgYW4gaW5kaXNwZW5zYWJsZSBwYXJ0IG9mCj4+IHRoZSBEQ08gY2xvY2suCj4g
VGhlcmUgaXMgaGFyZGx5IGEganVzdGlmaWNhdGlvbiBoZXJlCj4KPj4gVGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBTb0MgZ2VuZXJhdGlvbnMgaXMgYXMgZm9sbG93czoKPj4gICAgICBQcmV2aW91cyBT
b0NzIFBMTDogbiA9IDEsIDIsIDMsIDQuLi4gKGxpbmVhciBkaXZpZGVyKQo+PiAgICAgIEE5IFNv
QyBQTEw6ICAgICAgICAgICAgbiA9IDJeMCwgMl4xLCAyXjIsIDJeMywgMl40Li4uIChwb3dlci1v
Zi10d28KPj4gZGl2aWRlcikKPiBZZXMgdGhhdCB3YXMgZmFpcmx5IG9idmlvdXMKPgo+PiBUaGVy
ZWZvcmUsIHNwbGl0dGluZyBvdXQgdGhlIG4gZGl2aWRlciBmcm9tIHRoZSBEQ08gY2xvY2sgbWln
aHQgbm90IGJlIGEKPj4gZ29vZCBkZXNpZ24gY2hvaWNlLgo+IEknbSBub3Qgc3VyZSBJIGFncmVl
IGFuZCB5b3UndmUgb25seSBzdGF0ZWQgeW91ciBwb2ludCBvZiB2aWV3IHdpdGhvdXQKPiBwcm92
aWRpbmcgYW55IHRlY2huaWNhbCBqdXN0aWZpY2F0aW9uIGhlcmUuCj4KPiAgRnJvbSB0aGUgZGF0
YXNoZWV0cyBvZiB0aGUgZGlmZmVyZW50IFNvQyB3ZSBoYXZlLCB0aGUgZG9jdW1lbnRlZAo+IGxp
bWl0YXRpb24gaXMgYWx3YXlzIHRoZSBEQ08gb3V0cHV0IHJhdGUgcmFuZ2UuIE5vdGhpbmcgcmVs
YXRlZCB0byBuIChvcgo+IG0sIG9yIHRoZSBtdWx0LXJhbmdlIGZvciB0aGF0IG1hdHRlcikuIFRo
aXMgaXMgYSBsZWdhY3kgcHJvYmxlbSwgd2UKPiBzdGFydGVkIHdpdGggbW9ub2xpdGhpYyBkcml2
ZXIgYW5kIHNsb3dseSBzaW1wbGlmaWVkIGl0Lgo+Cj4gQXMgZmFyIGFzIEkgY2FuIHNlZSBub3cs
IHJld29ya2luZyB0aGUgUExMIGRyaXZlciB0byBiZSBhIHNpbXBsZQo+IG11bHRpcGxpZXIgZHJp
dmVyIHdpdGggcmFuZ2Ugb3V0cHV0IHJhdGUgY29uc3RyYWludCBjb3VsZCBhY3R1YWxseSBiZQo+
IHNpbXBsZXIgdGhhbiB0aGUgY3VycmVudCBjb2RlLiBJIHdvdWxkIGFsc28gbWFrZSBzaW1wbGVy
IHRvIGFjY29tb2RhdGUKPiBkaWZmZXJlbmNlcyBzdWNoIGFzIHRoZSBvbmUgcHJlc2VudGVkIGhl
cmUuCj4KPiBVbmxlc3MgeW91IGNhbiBwcm92aWRlIHRlY2huaWNhbCByZWFzb25zIHdoeSBnb2lu
ZyBpbiB0aGlzIGRpcmVjdGlvbgo+IHdvdWxkIGJlIGluY29ycmVjdCwgdGhhdCdzIHdoZXJlIEkn
ZCBwcmVmZXIgdG8gZ28uCj4KPj4gWy4uLl0KPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBKaWFu
Cj4gLS0KPiBKZXJvbWUKCgpJIGFncmVlIHRoYXQgaGF2aW5nIGFuIGluZGVwZW5kZW50IE4gZGl2
aWRlciB3b3VsZCBzaW1wbGlmeSB0aGUgUExMIHJhdGUgCmNhbGN1bGF0aW9uLgoKQSBzZXBhcmF0
ZSBwcmUtZGl2aWRlciBmb3IgTiBpcyB0ZWNobmljYWxseSBwb3NzaWJsZSwgYnV0IHRoZXJlIGFy
ZSBzb21lCmhhcmR3YXJlIGNvbnN0cmFpbnRzIHRoYXQgbmVlZCB0byBiZSBjb25zaWRlcmVkOgoK
TiA9IDEgaXMgdGhlIHByZWZlcnJlZCBvcGVyYXRpbmcgbW9kZSBleGNlcHQgYSBmZXcgZml4ZWQt
ZnJlcXVlbmN5IFBMTHMuCkxhcmdlciBOIHZhbHVlcyByZWR1Y2UgdGhlIFBMTCBwaGFzZSBkZXRl
Y3RvciBmcmVxdWVuY3ksIHdoaWNoIG1heSAKbmVnYXRpdmVseSBpbXBhY3QKaml0dGVyIHBlcmZv
cm1hbmNlIGFuZCBvdmVyYWxsIFBMTCBzdGFiaWxpdHkuCgpCZWNhdXNlIG9mIHRoaXMsIHdlIGNh
bm5vdCBndWFyYW50ZWUgc3RhYmxlIHN5c3RlbSBvcGVyYXRpb24gd2hlbiAKYXJiaXRyYXJ5IGxh
cmdlcgpOIHZhbHVlcyBhcmUgdXNlZC4KClNvbWUgUExMcyByZXF1aXJlIG5vbi0xIE4gdmFsdWVz
IHRvIGdlbmVyYXRlIHNwZWNpZmljIGZpeGVkIG91dHB1dCAKZnJlcXVlbmNpZXMgYmVjYXVzZQp0
aGUgdGFyZ2V0IHJhdGUgY2Fubm90IGJlIGFjaGlldmVkIHdpdGggTiA9IDEgd2hpbGUga2VlcGlu
ZyB0aGUgUExMIAp3aGlsZSBrZWVwaW5nIHRoZQpQTEwgd2l0aGluIGl0cyB2YWxpZCBvcGVyYXRp
bmcgcmFuZ2UuIFNvIE4gaXMgZGVzaWduZWQgdG8gaGF2ZSBvdGhlciAKdmFsdWVzIOKAi+KAi3Rv
CnNhdGlzZnkgdGhpcyByZXF1aXJlbWVudC4KCkZvciBleGFtcGxlLCB0aGUgQVhHIFBDSWUgUExM
IHVzZXMgTiA9IDMgdG8gZ2VuZXJhdGUgdGhlIHJlcXVpcmVkIDEwMCAKTUh6IG91dHB1dCBmcmVx
dWVuY3ksCnNpbmNlIHRoZSB0YXJnZXQgZnJlcXVlbmN5IGNhbm5vdCBiZSBhY2hpZXZlZCB3aXRo
IE4gPSAxLgoKCkFkZGl0aW9uYWxseSwgaXMgdGhlIHJlZmFjdG9yZWQgcHJlLWRpdmlkZXIgTiBp
bXBsZW1lbnRlZCBhcyBhIHNlcGFyYXRlIApwYXRjaHNldCwKaW5kZXBlbmRlbnQgZnJvbSB0aGUg
QTkgUExMIGNoYW5nZXM/CgoKQmVzdCByZWdhcmRzLAoKCkppYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
