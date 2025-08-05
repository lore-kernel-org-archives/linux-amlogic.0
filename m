Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB05C87FD1
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Aug 2025 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgL8cuDk7lURhyAmQE3A7khILVOr8w7kLDgGsHczGwA=; b=Ek9a8gzVFu0GlV
	56zO4g/xR1FpfsW5soOexISQDWxoDjOVUxQ+8PBe09ASZWaTsAsC70GfRb/cnXM87SPC4niOoZWOQ
	e0pL53TUFrIGSWGJVZPIguflvdJdDRd9VvD9sFv8pAmYyUWj8BLiztzPbHFSm1l0WZsaGnG5RRcVs
	MzxU5jmCLDiKTrohzwSYEO3mvvx21AVmOI8FK7Al2r5pP1ANBgINyRuihSnXdAjg/gT2YQ/KTu8lP
	1nakcBzpuHTwwr44X3Y6H9uk/IPheHEc3ZjQbFz1ToU7mz14DBMpbSl9HbftMO5tCfYBTtV7iPTlu
	9GZw0C1KKdN0mzysRTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJZn-0000000D8rA-216T;
	Tue, 05 Aug 2025 15:27:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIE3-0000000CvRg-04DM;
	Tue, 05 Aug 2025 14:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE/ldy0FDTt7IC49M5CbfUyy2b5R6vprrDYK+RoAW8E+2Av20tLRQYxSlFmEVVTNpa7z05sENLfK0pAuYn4A+sZAnK4SATyY89kWo4VwG7NgJyRS0Bxb2Dv86V6Lj/PN6y163jP2UEoNYcRru6CIFuWTxxQyPDOPJ71Z/cR9ABG3TgsKDu7ok4OkgU3nK2a0iHP4FZ5wT070/Gt0QpZa1lkUYcJGU7aEBx1HT2vWQhhJAdnEPPmW9ltJkFJTsHUfrFh5Ut7yy/4nZbvW4dkyQ0gvQIIRS9A2wBZECZ3EAPqG3c4Lql66lDavjyUeSdLjoHApV8t/V9x+Q0g8NXeV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhrmX+VbZyfEClCyV8Hc7TX19PG0jza5H7iQ8Gy4srE=;
 b=sh3baCP+/AVdRKk3ca6LmgEeiDTvjJRnvtUn3DKHGKRC5c6nXo+Jt3bGY2LYhdKHqU6mzZKVKJzOcXss8Ios8lUMbM1Jo3yW8zeBskijE5aKu34pBu+0uZOhi8D9Ebu6I7XPqq5gOitoYeHP0vTwJS4zc4gNjVjRQR7ugLpFW2UCaTrVewrsmEInu9fv8ccics5zwOVr+O8BpdaYV3fCNYG0y6QRixzMLCpdI3gFZPBKKkRTtq2KdMtcStwpoANouqzhghGKbviaYVmbJ1ywJCc0EGHZ9noHprnDNe+oX71HtFEskaYaCnWSstZdXOZo83+d1z8C6VKNARPIfLRxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhrmX+VbZyfEClCyV8Hc7TX19PG0jza5H7iQ8Gy4srE=;
 b=NvuHngQ81Wju2d3/ohcEpW5o3aQ0028R3YIzUofm3v8XPYB42u1h/EvFclEcA4uDMPIpaKRnsFDWSRNLJhetTKjg65nNrIn99WoOR7Q/XHs/AtHLmV1kBphgRmo5CscwDr0YDwa1/PMOm3O+R3/dZZX/Z7OHv+f73wkSK3Jb61k=
Received: from AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) by AS4PR02MB8670.eurprd02.prod.outlook.com
 (2603:10a6:20b:58d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 14:01:02 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::d6) by AM0PR01CA0118.outlook.office365.com
 (2603:10a6:208:168::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Tue,
 5 Aug 2025 14:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 14:01:01 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 16:00:48 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, <kernel@axis.com>,
	<linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pwm: meson: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <sveurgnigarzdjreweoibcxkkl7rekcpufuwqr7bxcrdx7zdrd@kz4ohstmfyjh>
	("Uwe =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Tue, 5 Aug 2025
 15:23:12 +0200")
References: <pndwm7ikt8v.a.out@axis.com>
	<sveurgnigarzdjreweoibcxkkl7rekcpufuwqr7bxcrdx7zdrd@kz4ohstmfyjh>
User-Agent: a.out
Date: Tue, 5 Aug 2025 16:00:48 +0200
Message-ID: <pndcy99lvfz.a.out@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|AS4PR02MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 459f408e-5f37-4d04-4919-08ddd428829e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJmdXRmMEVKMDI5M2RLcVpYY09PUEFsMnlrRS9PV2VlMEp4UDk5cHFrUTl1?=
 =?utf-8?B?UHVyQ0JkTVRpSlBzRDV3QTR5alJ0S0ljK0pCWUFXYkJ3NTR3eUw1TXRWWjg5?=
 =?utf-8?B?U3RUbExhcGd0djZSSnNtVWJIa21kYnVJZmd4OU9oclZqdWNFTjdsRDVvNnVw?=
 =?utf-8?B?Z0dBTFJnam5JSnRIMjArSWdYWTBvdlRhS0p0enlHM1cxbGRpbnlOWTFnQzBY?=
 =?utf-8?B?WXUzRmp4ZUlyQ05VNlRBVTBzU1ZJNVVrZUF4U3ViZVIzNjNIMUpPRDl6dElu?=
 =?utf-8?B?dmh5RTUrQnJMclAwcDZDUzFKTlcwUmxCL1pBanhNV2RIOStUT1A3MlNvQkEy?=
 =?utf-8?B?SG9xZHFVY3Y0N0ttSmI4MnJBRXZKY2daOG5pQllVZ3lGNTA4WG5zTDAyMVps?=
 =?utf-8?B?SjZhOE5mb2h2cm04QnJEelJOeWFyVGo3UlFZejFpK040T3g3S1lZaEx3UytJ?=
 =?utf-8?B?SnFZZy9Wd0pQMW90SUVKQjVZZTYyeGxYVG95MFlqaUtHM0M1WkkzZVllRlhv?=
 =?utf-8?B?MkZuamE2b0JUVFlPUFhhekJ5MlRhaE9TS3k4WmhLTnB2L2xvRzQ4SGxOL3hj?=
 =?utf-8?B?M2RBL3ZRQUdKL0RnVGNBTUxNYXR2WS9XdDJnZ0xrdCtSMWVscE5wVkZabGpv?=
 =?utf-8?B?L2IreGkrRFFpU05GTG9jdUR3eHNPNmltcm9DVHhrajFiSmlqU2JWZ1d3eDdK?=
 =?utf-8?B?MXBDb2ZOdFBCWjJ6STl5dXZPK3BzbEhWY2VNMlB2TmljZTJHNFpaUmNrVHJZ?=
 =?utf-8?B?OFl5Rm1FdHVuaDFPaEUweVpqWTdJTlJMN0k0dGI3VXlJTGVhUC81T2gyNjhJ?=
 =?utf-8?B?cGVEb0tYZ2pPdDQ2LzhjMU1oaTYxUDYySnRnanV4THc3eTBCYVlqMi8rT0NQ?=
 =?utf-8?B?UmpqL1ZCWThLZXZQTjRrYWxVYzNZWmZ5ZWVxbENzS0tmbUxHd3h1MGorWEdK?=
 =?utf-8?B?MVhxdFZpTkVKMzJjS3NhMUN1NTlxRWlLQmlHWGthMk1PNGU1eXROVythRjhF?=
 =?utf-8?B?UDYvaTRhTGxDeTVVMXFzVHJOYzBkOENWQ2hGVkFqSW9KQytEeHhvWW4yNUtP?=
 =?utf-8?B?OWV5eFhDZUF3ZlR0U1VxNmNOT2xWUXY3MThIVGhDc0NwQnpOVFh1VXZXNGNi?=
 =?utf-8?B?bHAvYlpMTkVMOU9LcXpJR1VmdWJOcWIrZS9HTEdZY3NGeG5USjJ2ZXZrZXJH?=
 =?utf-8?B?VUxUWkZLVnh1ZEhsN2FhNnBGQ3J3eFM3Ni90R1czYkROck9nVzBHYkZ4SWk1?=
 =?utf-8?B?NW95a2NOYVMvTEJCNHMxUkVMblZoblZiTEF6TW15Sjltc3hOMkdOZGtmU0lU?=
 =?utf-8?B?OGZ5TlQxV0xKU1FyWUxPa2pab3NkbklTdXR6dmg1REpsV0JmU0VqU1V5UmNt?=
 =?utf-8?B?dkpzRmpFRnJlZ21FNGozLzFUYUZwRnUvOHFUSkVxRS9NbWxUOVJjR1B1QWlu?=
 =?utf-8?B?eGZxTm5QVENEdEtoeDBWYWZFUXlPTXlLYWR5YzNuUDNYK01OV2ZJaWIwNDR1?=
 =?utf-8?B?ODFDcE15cWFySVVnZVVBWFkvb0hydFRDek41VGF4UTZnUFhodXM4VnJlV1FP?=
 =?utf-8?B?ZnYxNFM4NDJwaUpkUFNvdUcwU2NjcTBiQXlRZlFiZEFJSTRDMDh1dSt0aWNp?=
 =?utf-8?B?S05nVnhtQXJ4S2MzOERERStncjBRMmtUZVpRSjdFbnJ6ZDRvbXdSYWRGYVZp?=
 =?utf-8?B?ZUFqUkpRRUFUTXdsUGh0dVROYU8vQ2NtOFFFajgzdkZZa042aXNpejFCVlNS?=
 =?utf-8?B?My9vaVdxVldmSGROdXhEYnJQM2MyaVRLU3d0RlVZY1VET0ZEaGdld1Zla3Rx?=
 =?utf-8?B?bFU2OVcrekVIR3JoZGRpTVVBQkNIWG5CbjJFTmlxTlVkVFVKeGthdENqRm05?=
 =?utf-8?B?QWZRN1A2QW1iakhPa0w1R0laYUxmMEtmSCtVMGQzWENDSVdkMkxJU1JVUmtu?=
 =?utf-8?B?NHZxcnoyVWhhQmVpbmE2UEN3N3UxWnR3YjV2N1NEY2pzOWR6dVBtZFhFdXl4?=
 =?utf-8?B?b2dvWUdtQUNBPT0=?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:01:01.1246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 459f408e-5f37-4d04-4919-08ddd428829e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_070111_102831_4FDD3D57 
X-CRM114-Status: GOOD (  28.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMDUsIDIwMjUgYXQgMTU6MjMgKzAyMDAgVXdlIEtsZWluZS1Lw7ZuaWcgPHVr
bGVpbmVrQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIZWxsbyBXYXFhciwKPgo+IE9uIFR1ZSwgQXVn
IDA1LCAyMDI1IGF0IDExOjMzOjM2QU0gKzAyMDAsIFdhcWFyIEhhbWVlZCB3cm90ZToKPj4gV2hl
biBgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KClgIGZhaWxzLCBpdCBpcyBkdWUgdG8gYSBmYWls
ZWQgbWVtb3J5Cj4+IGFsbG9jYXRpb24gYW5kIHdpbGwgdGh1cyByZXR1cm4gYC1FTk9NRU1gLiBg
ZGV2X2Vycl9wcm9iZSgpYCBkb2Vzbid0IGRvCj4+IGFueXRoaW5nIHdoZW4gZXJyb3IgaXMgYC1F
Tk9NRU1gLiBUaGVyZWZvcmUsIHJlbW92ZSB0aGUgdXNlbGVzcyBjYWxsIHRvCj4+IGBkZXZfZXJy
X3Byb2JlKClgIHdoZW4gYGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpYCBmYWlscywgYW5kIGp1
c3QKPj4gcmV0dXJuIHRoZSB2YWx1ZSBpbnN0ZWFkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogV2Fx
YXIgSGFtZWVkIDx3YXFhci5oYW1lZWRAYXhpcy5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYy
Ogo+PiAKPj4gKiBTcGxpdCB0aGUgcGF0Y2ggdG8gb25lIHNlcGVyYXRlIHBhdGNoIGZvciBlYWNo
IHN1Yi1zeXN0ZW0uCj4+IAo+PiBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvcG5kN2MwczZqaTIuZnNmQGF4aXMuY29tLwo+PiAKPj4gIGRyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jIHwgMyArLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZl
cnMvcHdtL3B3bS1tZXNvbi5jCj4+IGluZGV4IDhjNmJmM2Q0OTc1My4uZTkwZDM3ZDRmOTU2IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiArKysgYi9kcml2ZXJzL3B3
bS9wd20tbWVzb24uYwo+PiBAQCAtNTIwLDggKzUyMCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdt
X2luaXRfY2hhbm5lbHNfczQoc3RydWN0IHB3bV9jaGlwICpjaGlwKQo+PiAgCQlyZXQgPSBkZXZt
X2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBtZXNvbl9wd21fczRfcHV0X2NsaywKPj4gIAkJCQkJ
ICAgICAgIG1lc29uLT5jaGFubmVsc1tpXS5jbGspOwo+PiAgCQlpZiAocmV0KQo+PiAtCQkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsCj4+IC0JCQkJCSAgICAgIkZhaWxlZCB0byBhZGQg
Y2xrX3B1dCBhY3Rpb25cbiIpOwo+PiArCQkJcmV0dXJuIHJldDsKPgo+IE9uIHRoZSBvdGhlciBo
YW5kIHRoZSBjYWxsIHRvIGRldl9lcnJfcHJvYmUoKSBhbHNvIGRvZXNuJ3QgaHVydCwgcmlnaHQ/
Cj4gQW5kIHdoZW4gd2Uga2VlcCBpdCwgaXQgaXMgY2xlYXIgdGhhdCB0aGlzIGVycm9yIHBhdGgg
aXMgY29ycmVjdGx5Cj4gaGFuZGxlZCB3aXRob3V0IGhhdmluZyB0byBrbm93IHRoYXQgZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KCkgY2FuIG9ubHkKPiByZXR1cm4gc3VjY2VzcyBvciAtRU5PTUVN
IGFuZCB3ZSBkb24ndCBoYXZlIHRvIHdhdGNoCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkg
dG8gbm90IGdyb3cgc29tZXRoaW5nIGxpa2UKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2RldmljZS9kZXZyZXMuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNlL2RldnJlcy5oCj4gaW5kZXgg
YWU2OTZkMTBmYWZmLi4wODc2Y2NlNjg3NzYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9k
ZXZpY2UvZGV2cmVzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RldmljZS9kZXZyZXMuaAo+IEBA
IC0xNTYsNiArMTU2LDkgQEAgc3RhdGljIGlubGluZSBpbnQgX19kZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICgqYWN0aW9uKSgKPiAgewo+ICAJaW50IHJl
dDsKPiAgCj4gKwlpZiAoSVNfRVJSX09SX05VTEwoZGV2KSkKPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiArCj4gIAlyZXQgPSBfX2Rldm1fYWRkX2FjdGlvbihkZXYsIGFjdGlvbiwgZGF0YSwgbmFtZSk7
Cj4gIAlpZiAocmV0KQo+ICAJCWFjdGlvbihkYXRhKTsKPgo+IEZyb20gYSBzdWJzeXN0ZW0gbWFp
bnRhaW5lcidzIFBPViBpdCB3b3VsZCBiZSBncmVhdCBpZiBpdCB3YXMgZWFzeSB0bwo+IG5vdGlj
ZSBpZiBhIGdpdmVuIGZ1bmN0aW9uIG5lZWRzIGFuIGVycm9yIG1lc3NhZ2Ugb3Igbm90LiBPbmUg
ZXhjZWxsZW50Cj4gd2F5IHRvIGNvdmVyIGZ1bmN0aW9ucyB0aGF0IGNhbiBvbmx5IHJldHVybiAt
RU5PTUVNIG9uIGZhaWx1cmUgaXMgdG8KPiBvcHRpbWl6ZSBvdXQgdGhlIHNtYWxsIG92ZXJoZWFk
IG9mIHRoZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBjYWxsLgo+Cj4gU2VlCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL3lscjdjdXhsZHdiMjRjY2VuZW40a2h0eWRkenEzb3dnenpm
Ymxib2hrZHhiN3A3ZWVvQHFwdWRkbjZ3cnozeC8KPiBmb3IgYSBwcm90b3R5cGUgb2Ygd2hhdCBJ
IGltYWdpbmUuIE9oLCB5b3Ugd2VyZSB0aGUgYWRkcmVzc2VlIG9mIHRoYXQKPiBtYWlsLCBzbyB5
b3UgYWxyZWFkeSBrbm93Lgo+Cj4gVG8gbWFrZSBteSBwb3NpdGlvbiBoZXJlIGV4cGxpY2l0OiBU
aGlzIGlzIGEgbmFjay4KCkkgZnVsbHkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IGFuZCBhZ3JlZSB0
aGF0IHRoZXJlIHNob3VsZCBub3QgYmUgYQptZW50YWwgYnVyZGVuIG9mIGtub3dpbmcgdGhlIGV4
YWN0IHJldHVybiB2YWx1ZXMgZnJvbSBhIGZ1bmN0aW9uLiBUaGF0CnNob3VsZCBiZSBoYW5kbGVk
IGF1dG9tYXRpY2FsbHksIGUuZy4gYnkgdGhlIGNvbXBpbGVyIG9yIG90aGVyIHRvb2xzLgoKVGhl
cmUgd2FzIG5vIHJlYWwgY29uc2Vuc3VzIGluIHRoZSBwcmV2aW91cyB0aHJlYWQgKEpvbmF0aGFu
IENhbWVyb24KZXZlbiBDQzplZCBzb21lIGNoZWNrcGF0Y2gtcGVvcGxlIHRvIGdldCBzb21lIGlu
cHV0IGZvciBhdXRvbWF0aWMKZGV0ZWN0aW9uIGZyb20gdG9vbHMsIGJ1dCB3aXRoIG5vIHJlc3Bv
bnNlKS4gSSBob3BlIHRoYXQgd2UgY2FuIGhhdmUKc29tZSBnb29kIHdheSBvZiBzb2x2aW5nIHRo
ZXNlIGluIHRoZSBmdXR1cmUsIGJlY2F1c2UgdGhpcyBjdXJyZW50bHkKZG9lc24ndCBzY2FsZSB3
ZWxsIGFuZCBJJ20gZmFpcmx5IHN1cmUgYW5vdGhlciBkcml2ZXIgaW4gdGhlIGZ1dHVyZSB3aWxs
CmhpdCB0aGlzIGV4YWN0IHNpdHVhdGlvbiBhZ2Fpbi4uLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
