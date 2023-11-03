Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0432CC4167D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Nov 2023 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIE6eInbdps+xghfkxNLbTs6dW4CtXPNEB+uzjJ8VZ4=; b=ywCo6WihdsjDKFFvSy0UqAEoPo
	PCPAs4BIRkrsRR7N9SDQadNxFu3jwYp5i5WB6YRZTERLXpIrhqrJAdBLcnu8oLxaYN2SBD1KmrYXN
	uZ2s9UCgac0dI/MOSz3JkOXyhzPdCtuSwH1iOvQhfuW+W3Re4nDumrn+xOPAHe7oQj73un9kM5fjF
	Ed0B+g6rlQb7AsuHRHkLl2rV8QglRsHooEcKYTWP11+zYp36r084JezwbDTqKrUoXomtUug/8FQvo
	6Uh+JobCq/9obquO38O8Atu2gqgV8zX41yyaSwjG7ueVx0qlJywZ8i/u+DumEq3jCi49KAntW5dbv
	69gapBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvzX-00BfzR-0W;
	Fri, 03 Nov 2023 15:21:47 +0000
Received: from mail-psaapc01olkn2081f.outbound.protection.outlook.com ([2a01:111:f400:feae::81f] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyvzU-00BfyX-0j;
	Fri, 03 Nov 2023 15:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr+mIUI2RukHUBpaHr+99g4ZiyLVHm8+Rr7XVXpymE15EV9RhNra6i+3ODiKmVf6YLLPhC11Iri+BHY6q2gwec6CWU1j1PE8nTY6o3bCV3bWCMQyEjhGlFYLD3lm5giqUt3vfp7rPz3NMOkgHKv1jqWsTJHL7jyX57UYpha1ukpXSrQ9jE5Dmzh8rGd7AifTiKioR5wPfvuYOGq3aQM/Fp2B6mTs1qZpmYYt9P/hSl3HchQRSb+cqkQldPdKSCvB45apYIkhT2HC0MjRVOGXYxM5gWvI/rnmtxbanY9YPbfDRM7v1kxksKIsfB7faTFguZJA6ADv0MgEQArpDAiufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiRjf11LJKtz3ILd9vZodELe2ftB285NF66nUKCmyMI=;
 b=D1nFsM1FfNRGBjcCNGQ70bTQJzZBndP67XKxxuqYmibm9QRoDzvAu+YrqeOoLkOG86/torA/Cy+WkYnH60wKnT+IMaIqWwi6NF06DOK+O0hBtUdmk/kfbN3iCs07UT//P3OVmBJ8BbH8qdXFlb86tGmx4/PEwonMOgZLtNnODObFbCT2svC3Lka/EQMgguoFBjofJ+rDyWfFj5IrqIoD3Ch1Hrd3mo9+taoJ1/xK9l5m6voDU31uj2luzk4flbuR3OyL6EFCmHf1kt0M/OsNVBFCZbY1C8T8mG3Bmwblwl9LjfxedSaE7M5r74F/U5+ZIykep+AS0weTK8wgQxLPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiRjf11LJKtz3ILd9vZodELe2ftB285NF66nUKCmyMI=;
 b=EMwvMUpNRgoowX4Y3qKVjToIp7LTXkDVvsiWV7mBbFxtd9SkQ04KGT+rUzHQB+t/CSRG/p0VxCfAs6N3mOL6zJ+mt/yiQ48yt9bs/jyKdUW/RXh+qMzb6gOSA/fkfH49oezGhdxrK6JqlF+SGwrRMv3rmtXMlTWHMd9ztUYPfUU+pm4QbgsrzQyjvF14bLjgDRBR31WxtTspTkZLwoDeaOIgoohDcW4m/OC0SKRbSzt7RP3ViTSF3pholPeAAoVs4GctZEuW2EMLY3ZqC45MjQ1ZNlsV6IFP+6F/iZfXwVGcf5O2z7TPHKCymKw3cNNQ6J1akyr9FkcMfKuf9T8CbA==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by SI2PR01MB4300.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:21:28 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::d870:7910:448d:fb6d]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::d870:7910:448d:fb6d%6]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 15:21:28 +0000
Message-ID: <TYZPR01MB555696309FE797E0F0C39D43C9A5A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Fri, 3 Nov 2023 23:21:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Anand Moon <linux.amoon@gmail.com>
Cc: ulf.hansson@linaro.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 yinxin_1989@aliyun.com, regressions@leemhuis.info, briannorris@chromium.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <CANAwSgTqm2-NsMjZWQwfc77CQhL_kCLnbQpm-ithOBS84UV=4w@mail.gmail.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <CANAwSgTqm2-NsMjZWQwfc77CQhL_kCLnbQpm-ithOBS84UV=4w@mail.gmail.com>
X-TMN: [R2jALOy0GfheUgjSJoqoh2FRTbcgE6yZ]
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <bf40dbb9-5b7d-1ee1-f654-2a674dca87fe@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|SI2PR01MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 04df2f89-6ea7-4516-556d-08dbdc808cc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpKp6IDSszHDC6nU3M8UU9X7ic24beuuIOZRy3+K0zfd7PLjKtlM+zw+H38c3a33VjpBGi/f1EgCKrP45ViLeU6ClXDYpXoLbckAF98Vtx29gs8607MhHD78oW4iuRNET0vCfYQgFDx0VWftuU6JYUajHfO4hwr2USHKG4eiy9hdZIYYp6kJHqL3gFQqzE7XbUSMyzxKxsBluICi/xMmypRp1hI5R//MGOTekv9/XWXx9/1kGZW2zKxDwgkFR11rMk67PbxK/Y++GCvbIyVQETYQJE58bWOvCpiibl+DAyPw6+h3uvemlKIHWgEExFiXCiuc93/gahd9iBNPGnbenNqz3R+CqmXWvYAyvdukzvWEmHMXmx2VPjtmt9+t/eEJfkW3n8vZBvx+K8+77OD7p2rS4GHnq4y5l8+5/pupcjwxnNGtBoTNpkFVTvJb3XlVolkfvuC73UTfC34oXDzFfs9dkbwCCyuSIjUbo74xdvhqYiYk+KxtKn0gHQCxTApSAshNRAkJq2zzDa/iNJ3B8GQ4PyziMhegNU292aN1h17yCqmpJZZwSG95giX1qbGK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjNZYWkzNlR2blo5NWJMdHlEU05HUHEyaHMzYjE5Z2ZKbGJSdUVrRHBINVJC?=
 =?utf-8?B?SWxadlNqNnVXUWQ1WVl1Mnk5R21JL2RZTTFBci8vQW1SQ2NoK1g3TllhTHNn?=
 =?utf-8?B?MzFTRVhJVkIzaEttREVPMXdUL1k4SExEMS9RMVB4VHdIUjIzOXdpNzNyTjhB?=
 =?utf-8?B?ZVhEWnFqT1k2TE9Ia1ZKK0l0d1JQQ0I3TjNvdFRKYkRjM25VMU1rZ1l1OHVY?=
 =?utf-8?B?M3AwbDdrd3MrUWZOUFRqdEFwNDRaYmJhYkR0Zmd5NWFsSlNWTGZCSnNIV1RL?=
 =?utf-8?B?OWRwY3JzV3lOaHVEcnJTMmNqUG91NmxxN3VubE03WUVhdjJqSzk0Z0lxZ092?=
 =?utf-8?B?Zlo3ZGxEeGdLTk8zV0g1NC9GbGhETFRqQmR3Q3RDYTNzYmNEWFBKbm84U2sv?=
 =?utf-8?B?QUZkUkNSK0ZlUklnZlE3QzUxRVM0eUVTNlZMWWxFdk0vNG9mMnZpRCtkSjk0?=
 =?utf-8?B?SWtVUUttMEg1S0k1V3ZSYXcweVVxSjY4RTRFOGdJVGlIZVpBR3gvUnFJV1Bu?=
 =?utf-8?B?YnAvc0l1WE55ZnMwMlVDMDhhZlRsNmQwTy9vVmRTZUpObDRLYnd5eG5pd3FG?=
 =?utf-8?B?cFhmNmgwekVVNnF3QVZwenhoTjZ1Ly8wQkl0bFJLcUs5OXdKNXhIVGtDVnVU?=
 =?utf-8?B?R3JDbDRuSS9rZDlJbXREMGhQUzBabkoyMGcxUm4xM28rSEtLVXp0LzhoZTF3?=
 =?utf-8?B?aVNkaklsek9HV29sclNXV3lCaDAyaXhiNWpvT1JHT2ZRR3V1azVpU0NOWFYz?=
 =?utf-8?B?eW03dVZ6bVVCTVdFb0ZUbk9zcXJQaHRnazEzbHpwVjRKSFNodXdJbGpzakNz?=
 =?utf-8?B?bU5Ka0w5cjExMXRBNHBMYVI5TEp4a2hMUTlYMlhteUJQa2Q4VFpyNG10dlFT?=
 =?utf-8?B?WUxBSGVXQm1acCtKWHFRZzJUU2RWeUZDdnZ4Rzd6ZWlrcm1KRzE3Wi9oRTdR?=
 =?utf-8?B?Q0VPa2JXekxCSzJCcmNhUDBBUm9Najlxczh2V1pQS2g4SnYwZlNZVm5jdXkw?=
 =?utf-8?B?NnZ4Qmp4KzZxY0J6aVVweDRvZWtaYWVpN29JcURmMXlpcitkejU3S2NpWVVi?=
 =?utf-8?B?TkIzbDJaUUoxdzVOU2M2YmtTWnoxZ3FFd0YrS2l4Q1poKzVTYTAwUm1rb2h0?=
 =?utf-8?B?M201U1VwWnk0d1g2ZGk5a3RtRTlzQmZCY08vcGcxb0F2S1VLRjBLTTlPTnhE?=
 =?utf-8?B?clV4cUhDeWlVRVRJZzR3RVAyTDI5N2UvL2Z4ZjI3d3A4ZG9XeGhtQ01HSTJr?=
 =?utf-8?B?N3dTT1kvUDdDSHhyRFZZQVIvWk9KVGRTY3M5aEtMV3UzT2x5Yk5nTlJTRU1O?=
 =?utf-8?B?d3NXNWNkN1Q0QjQxb3ViSm9HNkRaVFkrS25qWjZ1dk42QnU1QnQ3Z0ljZ24r?=
 =?utf-8?B?S0RpaktDSWcxQjE5NFgrVFhCa3JZM1hIQ0RvR1JSVGdudkJlV0prbWlmMU9B?=
 =?utf-8?B?aUJxU3VMdWMyczFMYUJLbEV3QlcvczV6NlJkUjFmRStKcTJ1Z0lnVm0wZVFz?=
 =?utf-8?B?Q1ZhNkZTck1Ga1Q4OGZhOVpxUjZCYlBzK2gzb1lwaVAraW5memMrQkpPZDBy?=
 =?utf-8?B?b1hteFZwYm9pWTFpUWZVYm5aK3lBYy9PQm5XejNSNmtNc2RPRlpVbGFKKzFh?=
 =?utf-8?B?cmJXSklxanNxQjFnMjkvYVY0Y1hWZnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04df2f89-6ea7-4516-556d-08dbdc808cc1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:21:28.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR01MB4300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_082144_285038_075BF8ED 
X-CRM114-Status: GOOD (  13.54  )
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

5ZyoIDIwMjMvMTAvMjkgMjE6MDgsIEFuYW5kIE1vb24g5YaZ6YGTOgo+IEhpIFppeWFuZywKPiAK
PiBPbiBUdWUsIDEwIE9jdCAyMDIzIGF0IDIyOjE1LCBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRs
b29rLmNvbT4gd3JvdGU6Cj4+Cj4+IENvbW1pdCA0YmMzMWVkZWJkZTUgKCJtbWM6IGNvcmU6IFNl
dCBIUyBjbG9jayBzcGVlZCBiZWZvcmUgc2VuZGluZwo+PiBIUyBDTUQxMyIpIHNldCBIUyBjbG9j
ayAoNTJNSHopIGJlZm9yZSBzd2l0Y2hpbmcgdG8gSFMgbW9kZS4gRm9yIHRoaXMKPj4gZnJlcSwg
RkNMS19ESVY1IHdpbGwgYmUgc2VsZWN0ZWQgYW5kIGRpdiB2YWx1ZSBpcyAxMCAocmVnIHZhbHVl
IGlzIDkpLgo+PiBUaGVuIHdlIHNldCByeF9jbGtfcGhhc2UgdG8gMTEgb3IgMTUgd2hpY2ggaXMg
b3V0IG9mIHJhbmdlIGFuZCBtYWtlCj4+IGhhcmR3YXJlIGZyb3plbi4gQWZ0ZXIgd2Ugc2VuZCBj
b21tYW5kIHJlcXVlc3QsIG5vIGlycSB3aWxsIGJlCj4+IGludGVycnVwdGVkIGFuZCB0aGUgbW1j
IGRyaXZlciB3aWxsIGtlZXAgdG8gd2FpdCBmb3IgcmVxdWVzdCBmaW5pc2hlZCwKPj4gZXZlbiBk
dXJuaW5nIHJlYm9vdGluZy4KPj4KPj4gU28gbGV0J3Mgc2V0IGl0IHRvIFBoYXNlIDkwIHdoaWNo
IHNob3VsZCB3b3JrIGluIG1vc3QgY2FzZXMuIFRoZW4gbGV0Cj4+IG1lc29uX214X3NkaGNfZXhl
Y3V0ZV90dW5pbmcoKSB0byBmaW5kIHRoZSBhY2N1cmF0ZSB2YWx1ZSBmb3IgZGF0YQo+PiB0cmFu
c2Zlci4KPj4KPj4gSWYgdGhpcyBkb2Vzbid0IHdvcmssIG1heWJlIG5lZWQgdG8gZGVmaW5lIGEg
ZmFjdG9yIGluIGR0cy4KPj4KPj4gRml4ZXM6IGU0YmYxYjA5NzBlZiAoIm1tYzogaG9zdDogbWVz
b24tbXgtc2RoYzogbmV3IGRyaXZlciBmb3IgdGhlIEFtbG9naWMgTWVzb24gU0RIQyBob3N0IikK
Pj4gU2lnbmVkLW9mZi1ieTogWml5YW5nIEh1YW5nIDxoenlpdGNAb3V0bG9vay5jb20+Cj4+IC0t
LQo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAgICBVc2UgUGhhc2UgOTAgaW5zdGFuZCBvZiB2YWx1
ZSAxCj4+Cj4gCj4gSSBoYXZlIHRlc3RlZCB0aGlzIHBhdGNoIG9uIG15IE9kcm9pZCBDMSsgYm9h
cmQuCj4gUGxlYXNlIGFkZCBteQo+IAo+IFRlc3RlZC1ieTogQW5hbmQgTW9vbiA8bGludXguYW1v
b25AZ21haWwuY29tPgo+IAo+IFthbGFybUBhbGFybSB+XSQgc3VkbyBjYXQgL3N5cy9rZXJuZWwv
ZGVidWcvbW1jMS9pb3MKPiBjbG9jazogICAgICAgICAgMTAwMDAwMDAwIEh6Cj4gYWN0dWFsIGNs
b2NrOiAgIDk0NDQ0NDQ1IEh6Cj4gdmRkOiAgICAgICAgICAgIDIxICgzLjMgfiAzLjQgVikKPiBi
dXMgbW9kZTogICAgICAgMiAocHVzaC1wdWxsKQo+IGNoaXAgc2VsZWN0OiAgICAwIChkb24ndCBj
YXJlKQo+IHBvd2VyIG1vZGU6ICAgICAyIChvbikKPiBidXMgd2lkdGg6ICAgICAgMyAoOCBiaXRz
KQo+IHRpbWluZyBzcGVjOiAgICA5IChtbWMgSFMyMDApCj4gc2lnbmFsIHZvbHRhZ2U6IDEgKDEu
ODAgVikKPiBkcml2ZXIgdHlwZTogICAgMCAoZHJpdmVyIHR5cGUgQikKPiBbYWxhcm1AYWxhcm0g
fl0kIHN5bmMgJiYgZGQgaWY9L2Rldi96ZXJvIG9mPX4vdGVzdGZpbGUgYnM9MTAwTSBjb3VudD0x
Cj4gb2ZsYWc9ZHN5bmMgJiYgc3luYwo+IDErMCByZWNvcmRzIGluCj4gMSswIHJlY29yZHMgb3V0
Cj4gMTA0ODU3NjAwIGJ5dGVzICgxMDUgTUIsIDEwMCBNaUIpIGNvcGllZCwgNS43MDIzNSBzLCAx
OC40IE1CL3MKPiBbYWxhcm1AYWxhcm0gfl0kIHN5bmMgJiYgZGQgaWY9fi90ZXN0ZmlsZSBvZj0v
ZGV2L251bGwgYnM9MTAwTSBjb3VudD0xCj4gaWZsYWc9ZHN5bmMgJiYgc3luYwo+IDErMCByZWNv
cmRzIGluCj4gMSswIHJlY29yZHMgb3V0Cj4gMTA0ODU3NjAwIGJ5dGVzICgxMDUgTUIsIDEwMCBN
aUIpIGNvcGllZCwgMC4yMDI2NyBzLCA1MTcgTUIvcwo+IAo+IFRoYW5rcwo+IC1BbmFuZAo+IAoK
T2gsIHRoYW5rIHlvdS4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
