Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3CEC4167D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Nov 2023 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxwhB5gKgF/pwhVFCYvd6AlmUhnnJqgGp7WG33igPFA=; b=KWfvcna2GUAOU9JZNVWtR5J0FK
	KgCGlo7etKHF2ZrCiffE+ijI5jXnWKYL5F1j9zJzsuV3pcu9Z40Y9fYm/yepgjDwWMss37oIH2NBl
	hkt0tw3Je9QOfSwC7Z8tjQADKRzqGIqqA61GdlgSBvqAR8y9oz2mW3tU9HnZfCqMg+LdT/M2bqfRo
	LdonnkChUpCT2utgrepLiL5IyhKr70su7xePPyE+kZK7HaK/a/wQPYFxQ7YA6qHize/WkXar4hDkT
	ZI/H56oV+OekAnD+oUZlI5N78RePsCiZIvT4Vk+qGeMIQiOEgv8PMymdRxTCqbVmaMgqvFBrEoRvw
	4jR93y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywGS-00BhqE-0K;
	Fri, 03 Nov 2023 15:39:16 +0000
Received: from mail-psaapc01olkn20810.outbound.protection.outlook.com ([2a01:111:f400:feae::810] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywGM-00BhpQ-3C;
	Fri, 03 Nov 2023 15:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9Nl2TRMYSCcrhdMi0sTG6f4C7t5qh8+V8RuaGOVqlD7UMuvBXFIrqypk0lGufXotr3cbQfZrJLc7y6KqttB70VzW+VKP3ZJaINvoLrMToFSSaEket3kXjHaJAWS9vuaJijcJQbZ5eqjMqADg0zprJlb21FdTMZ0EYIkzVp/nx68H/b3KEOjC7ekTfYXGJK3A6+UzEinjKitvbX7nKQ0k/qBy9xHD098zEAf3Bo7h2/rp3rv7wKujok6xwgzKkOaVYX/kt7rG9njD6e0jlkV5yTWKxrq0Lzn4RYHtAtbdLKXwQoJBS+VGTWTypudjMJnf04xGSmfV+fimC4okZ8VZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s07GJj0xohj7k67Moqvk1YfVm0rcmdlGXiUQoLNw7M=;
 b=C65jLIHAfvkmu1cG/xi1Qkmk0klt53DcLjVy89HUMlj2bPUvCfB9S6kJi01TUdAPmrOLpVTd1eF8uA/X4ECRxUHOR2D4UtrFWk+F2zDo8oHOBEiEdflt3BiZrrusEK8P9Wqp0NjmVYvxrvOjqNHD1FQyfUwvZLlFZWp7rl/bAIMYyPlDN9LagwD0tO/k9uBqtUcVnsYLLWgIe0AYwCVX5QuGd9B0VgHienBMOqnmgYs1y6n8MNN/10Uw2i0VykVwaK7zHeCmEhJ1Pgl8gGd5DhC1Qh6ny0VwPDKqGrTbnTFCa3FokU/ireiBibUlJeeHFPTu87llygCX6ccD4sE9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s07GJj0xohj7k67Moqvk1YfVm0rcmdlGXiUQoLNw7M=;
 b=MBS0mHDauB0fgAxhaRCtZGutcxeF1bulP8aEFu4XXk4+rMtG5c8MwUgiEbYd3kwRulAqoWSLeWDgmm4NQn0aPvxrxGodB9qDyYLOkngIiGXYvTdcjbUelVAUD+mcjUeMLpDY4CYA8T57u/ulWKjmnc1oNP7rn5RwH0fNUFT8ldRSFjATZ4Qk1/0xhwrDG+lWvJeVFwHmOuE3yqdUkG/9DPMJJefnKgpn/njD5TMi9SFeCxP1tTvORreOujQuHz1ISli0Q2JJ5sE/4ZCy8r3W60kEXmOEAzPvX3U1GVFaHFEbSGCHi7IfrMH9AI1Yo10St3InUaXzR2hd6Q2lMm1R4Q==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by SI2PR01MB4300.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:22:45 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::d870:7910:448d:fb6d]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::d870:7910:448d:fb6d%6]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 15:22:45 +0000
Message-ID: <TYZPR01MB5556902EB8800164FE460D4AC9A5A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Fri, 3 Nov 2023 23:22:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, yinxin_1989@aliyun.com,
 regressions@leemhuis.info, briannorris@chromium.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <CAPDyKFpqCkxD9LmFqRM_AaEie0pbgFEsLTYmoj71pEr78+OssA@mail.gmail.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <CAPDyKFpqCkxD9LmFqRM_AaEie0pbgFEsLTYmoj71pEr78+OssA@mail.gmail.com>
X-TMN: [OGBCUR1kPoODALTAZI1HKLlO3Bz9MvLm]
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <67a9127b-0e69-f528-44bd-307436320008@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|SI2PR01MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: e47a38cf-3064-4de2-96de-08dbdc80bab2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYbBJaqiytFpei9rd8/7KxbcuevHBpDYWsC508gufjUtXJoL8sB6R6UCcN5PhBwaFP5aQYFHxkImlZhtZf0dSXDYAs1077Sc+561es+kgBqHDZYIUZxtLpA0tpDaRiIqJMwP2jn4UuadFyAZ0I0WTiDow+E7uOanPgRiR9wySgZppI5FZvMNAbe6bNdKA28iH8Ght3l6KCa6jP8ZDWc5PIt87FmkmlfvVA/uvyo6boOTxGf3WFbRszbKixkeDurXybqeHKEXGWmrGYCji0dJ/tNvpZc9yo5my3YpS6P3vr1qllkiqzuXGxsbd6lEhw5IdEzmlPcMvSyl0nZmxTRctmwd5aUd2kfvbKGkeFjkJaBw9nlaOnVTqmdCaLOt7/pYHNTp2bPeKxUsjMpJwASw5Ttf2SGM1kSUvBdSvlMyddX9NH7GuO90kMSTbMwhtzmbksCgpBODzOnn39rVTwy9lcHisrghEnjQSuqCfCNoo1I5ide3HWRPJgqjrh8Q2NdyNETvP5qyT3GNFgEYr/R3aAPGyuDGJqr7zaXyrUXZidHcQlpv6pZmMmSVyP7E5qIf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWR0VDZVTStuSlpYbGZRZEQ3MGVrc2l0M0dvMkFKMXg1aHNROU1oL2E5RDlF?=
 =?utf-8?B?WU81OHdaRjlrNHBCUDl3YUhXeTRVcEp3OXdMalV5RDc2bkxMN1hoQUVjMzc2?=
 =?utf-8?B?M2dPRmJ6a0xYYXNyMys5bFhMMEJLbFJIMUpSVnphZStIVjRYakZYTjVRRmpq?=
 =?utf-8?B?eWRwNkJlY3owRWZlbUlCM09CT3dzUFp4dXJUK2JFOThTL2tvcVp5QXBnOEZ5?=
 =?utf-8?B?UC9Xd01OeUovUkxOa2hnNTkrdG9zbEVFUSt3WXlxTjR0bUZlMkx6RzZnUlhp?=
 =?utf-8?B?M0FMTHlGQXR1RDI4bTNhZ2hoaUFKckRzZENkK1QxREZsTkF1QzVON1JaaVln?=
 =?utf-8?B?ZlJBRlV2bmZUMHFHY0dpK0VWamZiVlNFam5rUTFuOU9ldGRiUytZNlEwV0VW?=
 =?utf-8?B?bFUzUkxRRjlOcE1SU2JKTHg0ZmhrbERoK3gvaW9DdEx1UyswaHVmTGhHMzZr?=
 =?utf-8?B?U0ZGZDVhS29uRW93dWw4NUo5bzBnK1ZFZjZOcDg4YzZscllsdjVod2lET1lv?=
 =?utf-8?B?d2dQTjlNZ1Joakt2L0lnNis0dk1IVS9mNHpTRjVmejN6Yk1CaVhjN053c2Qy?=
 =?utf-8?B?bW5UajNIb3pKdzB3eUJId3ZFWTBFeG9EV2hVWURmMmY5enRhNk5vcU5PL0Ry?=
 =?utf-8?B?SVhrMFNlSEV1YXNvbGlzSVhPMmd1MlJVcVFsRjF2KzVDNVFPN2M5NWZvdkhh?=
 =?utf-8?B?aXk5NkZjWVhycXk3RXFrd2RWZHlVcGM0UFdpeWd1N2pOcGVxeWdkYUR1UnNt?=
 =?utf-8?B?Ni9icktzYk8yRzVWSll4WlNBTUdWd2JVNTFHUmo3YTJpdTVwdzJvbVNVa1FM?=
 =?utf-8?B?RWFkRXU2SjBqekdFVkR6Ti9oSUJxVjQvY2dOTVBuNGg1QVNCcXVrRVRqU1l2?=
 =?utf-8?B?VjZZdDlJam5tZHVuRjArYjBkdmFqSjl1L29ZZkd3amRpeTh6ZlZaR3hBOUQ4?=
 =?utf-8?B?Ni9MZzA4dGRzZ1RYN0NFcSsvcDhqUmVOM21xTktDRDhpaDFIeE5rckF5VHhU?=
 =?utf-8?B?NDhFVVI3UVgvWGUrRzluM0ErRFBxdVJuR2lsZnJNNlhFdmFMRy9KUmFYU05k?=
 =?utf-8?B?enJKdmYvUkFEOVdMaVBGVVkvZGFlRU5qWlRFY3NmSFFBMEdVVVBubmxleXdV?=
 =?utf-8?B?U0pxZkdRSHo1SzZiL0YzUGgwdzlabnVLN2JkN2JISG5TOG91T0tsTlJLdHlW?=
 =?utf-8?B?Q2xZQWJZK0JTdEZ4Ync3QkFrSGt0YTB6L1d0eEMrbmhpMmtnbTJHTzNmTWd3?=
 =?utf-8?B?Q1drRGRVMVJxdTJ0UTVhSmhaRjJ3ZVAraUpwNEYyd2Fpc3FtZzZaalIvL3Bx?=
 =?utf-8?B?am1kcUUrZTI3NnZLRGJQU3pXZHA3MUxnK2d3MDRjSWR3SThjdWZSRm1ET0lT?=
 =?utf-8?B?dW9oVTZCR3Y0SmlzQjRJb3J2SUhiWndIVTl6NkczWmZ0K0VRQVFXMnQxOU5B?=
 =?utf-8?B?NWtEalFCZVk3d0l5VVpsM1BFR3RSc1dOVGE4aURMeU1seWpndzdDVmp3UkdT?=
 =?utf-8?B?SEFvL3lRR0FWS09sdGhWUU1OdUg1R1ZkMmtNdGd1eXdON1RlQkFpMkxkeFRt?=
 =?utf-8?B?NEZUM0VOOUZ4OG9ncGJrTXJuQVFQM3Q3d2pTd2JieURnZi9ZR3poZ2w4QTNT?=
 =?utf-8?B?RTFDZDEySXAwNTVjdVZDWTczL2tQVFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47a38cf-3064-4de2-96de-08dbdc80bab2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:22:45.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR01MB4300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_083912_940895_9C4DEAFE 
X-CRM114-Status: GOOD (  12.63  )
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

5ZyoIDIwMjMvMTEvMyAxOToxNSwgVWxmIEhhbnNzb24g5YaZ6YGTOgo+ICsgQW5hbmQKPiAKPiBP
biBUdWUsIDEwIE9jdCAyMDIzIGF0IDE4OjQ0LCBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29r
LmNvbT4gd3JvdGU6Cj4+Cj4+IENvbW1pdCA0YmMzMWVkZWJkZTUgKCJtbWM6IGNvcmU6IFNldCBI
UyBjbG9jayBzcGVlZCBiZWZvcmUgc2VuZGluZwo+PiBIUyBDTUQxMyIpIHNldCBIUyBjbG9jayAo
NTJNSHopIGJlZm9yZSBzd2l0Y2hpbmcgdG8gSFMgbW9kZS4gRm9yIHRoaXMKPj4gZnJlcSwgRkNM
S19ESVY1IHdpbGwgYmUgc2VsZWN0ZWQgYW5kIGRpdiB2YWx1ZSBpcyAxMCAocmVnIHZhbHVlIGlz
IDkpLgo+PiBUaGVuIHdlIHNldCByeF9jbGtfcGhhc2UgdG8gMTEgb3IgMTUgd2hpY2ggaXMgb3V0
IG9mIHJhbmdlIGFuZCBtYWtlCj4+IGhhcmR3YXJlIGZyb3plbi4gQWZ0ZXIgd2Ugc2VuZCBjb21t
YW5kIHJlcXVlc3QsIG5vIGlycSB3aWxsIGJlCj4+IGludGVycnVwdGVkIGFuZCB0aGUgbW1jIGRy
aXZlciB3aWxsIGtlZXAgdG8gd2FpdCBmb3IgcmVxdWVzdCBmaW5pc2hlZCwKPj4gZXZlbiBkdXJu
aW5nIHJlYm9vdGluZy4KPj4KPj4gU28gbGV0J3Mgc2V0IGl0IHRvIFBoYXNlIDkwIHdoaWNoIHNo
b3VsZCB3b3JrIGluIG1vc3QgY2FzZXMuIFRoZW4gbGV0Cj4+IG1lc29uX214X3NkaGNfZXhlY3V0
ZV90dW5pbmcoKSB0byBmaW5kIHRoZSBhY2N1cmF0ZSB2YWx1ZSBmb3IgZGF0YQo+PiB0cmFuc2Zl
ci4KPj4KPj4gSWYgdGhpcyBkb2Vzbid0IHdvcmssIG1heWJlIG5lZWQgdG8gZGVmaW5lIGEgZmFj
dG9yIGluIGR0cy4KPj4KPj4gRml4ZXM6IGU0YmYxYjA5NzBlZiAoIm1tYzogaG9zdDogbWVzb24t
bXgtc2RoYzogbmV3IGRyaXZlciBmb3IgdGhlIEFtbG9naWMgTWVzb24gU0RIQyBob3N0IikKPj4g
U2lnbmVkLW9mZi1ieTogWml5YW5nIEh1YW5nIDxoenlpdGNAb3V0bG9vay5jb20+Cj4gCj4gTGV0
J3MgZ2l2ZSB0aGlzIGEgdHJ5ISBBbHRob3VnaCwgcmF0aGVyIHRoYW4gcXVldWluZyBpdCBhcyBh
IGZpeCBmb3IKPiB2Ni43LCBJIGFtIHBpY2tpbmcgaXQgZm9yIHY2LjggYW5kIGFkZGluZyBhIHN0
YWJsZSB0YWcsIHRoaXMgc2hvdWxkCj4gYWxsb3cgaXQgdG8gYmVjb21lIGEgYml0IG1vcmUgdGVz
dGVkIGZpcnN0Lgo+IAo+IEtpbmQgcmVnYXJkcwo+IFVmZmUKPiAKPiAKClllcywgSSB0aGluayBh
bnkgZml4ZXMgYmV0dGVyIHRoYW4gbm93IHNpbmNlIGl0J3MgYnJva2VuIGFuZCBjYW4ndCB3b3Jr
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
