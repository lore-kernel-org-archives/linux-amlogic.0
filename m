Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C931C4727D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:36:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97A7207BC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 17:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FnHlpA4E";
	dkim=temperror (0-bit key) header.d=outlook.com header.i=@outlook.com header.b="JGjsCLTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C97A7207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Im9z3X7KcF+Zkv/RmI3A8m92mQdUbIKHhfLjvvxbH0g=; b=FnHlpA4EJjqfUqOasDcMg8YUIO
	o30xZ92IlvGuHTRVk6ZmSv8o8hxmLjMxkpD8+/2yP7wE96j4JwP43fPckxZ6oSkuRD8R+hrcf4L4A
	CqQXC7PVD164uo7FmPJmyzaKkTkoVjfnrfWpsP+5xBQ+pyU0PbBPDFr11U6ICdFZz6U5kev92TIvo
	hwEA3t58eE+muHhMGe1xkVm0690gYUxuDIS3c6UiqBhnXUK9/LZUGDKNIpy4QbMkHOud5NDYcKka6
	GjtB8tGhBVAXCIHBOBeI5PeGi2CEcanXI9O5idbpBc2OrRP9pq+UJtRmSJK7jZlOPvPX3XiujHqsr
	iBvbAzmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPUPZ-0007R6-R5; Mon, 05 Oct 2020 17:36:33 +0000
Received: from mail-oln040092255013.outbound.protection.outlook.com
 ([40.92.255.13] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQno-0003sw-Ft
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 13:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpyueq09/a3ajHZZu28/S8LL+PBa1MUHzUgfzGy/u+rOl/T3IvQz1XVWKdDLVMdY6d42qPtnq3wk7St5D18FyPKBJyd9ZKegYDXZqNeDbtK3/1608A/vQYIZ5Rtw22v9oHOJZdtYBFN/giNntlEPTq6SAvy4lUStG8wR6OZrhugpzOyUD+he9AZ9QZFmESINzTl1BjqXC1beYO5u0SMl2NSs/ukZ6njFkeo72tBSebNlJIf3b12o1yWroIJIyzHd7WnyVpXuoMqikhwW2xy8kL2g+6NxKUM5O6a4OzkqKooRVQ+57o1WUmbNGeSGSYpfjkfARso4GDaiUpFNOSgMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4kxwm2YOUepgt9rPMTjLPK7VrpBuHVz65WwcK95a1U=;
 b=mkLsQK02VXMRk+WkbgPIKBhbeccUd9kizZ9418t5oZOJJ3aMnKOR3XqR7gk4plp1pI3aHBRAXLVORd1h+GIWiVyRzOaWT0+7aotPE3hsISdVeeWdcxY/p/usYCuN5Ama3XJqMRKVXyYFE24Rqlc/3ZQ6xxIqhyJyoAx6Lwb4v+VDBBtsmqO9PVAfuGqYBgHKgSXgl9h3IsDKPFsWofDmePQFE8mycL8YNuksT0ALnhpfLywTZGuMgXDeimgqfzNFw3bUSN82MFwnz4VSETAXNWKmMrm73XvwsgudvOQZN7PmjAerS62omGXRsq6FN6wWzEnpf6M1YLi7mGzPWyIaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4kxwm2YOUepgt9rPMTjLPK7VrpBuHVz65WwcK95a1U=;
 b=JGjsCLTuU4HBNQYXvWi99mkxY/ERUzL7zJstNiiceETskSe+7pp3yiU4vzGx8kgX6XPteJsd8bWLdJLnrny5VLuWbobmsK8Ptfkv2ZWD8PayguzBmw8DdY4unyhjFbn85Fn4RjusgHjWZ6B9gz5zRrnRtB8wsLzr/Si3G0I48DrsqEa5F9pdKD+3d2RElE4f63jf+YAm3UvggXrEed4Z00GFWTqFHXuwLtZFJzNNnwOjQZ+Mr+b7zaa6yNx0779SI43bwXn8oMk9diW2yunlRMmc6RUSCRCogCcaN6eKMSct+AmFGWocbWzFI2M8GsXc8lv41l7u0/YUBOlmUBD6RA==
Received: from HK2APC01FT040.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::46) by
 HK2APC01HT151.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::370)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 13:45:11 +0000
Received: from SYCPR01MB3776.ausprd01.prod.outlook.com (10.152.248.57) by
 HK2APC01FT040.mail.protection.outlook.com (10.152.249.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 13:45:10 +0000
Received: from SYCPR01MB3776.ausprd01.prod.outlook.com
 ([fe80::861:b63c:843d:56c6]) by SYCPR01MB3776.ausprd01.prod.outlook.com
 ([fe80::861:b63c:843d:56c6%7]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 13:45:10 +0000
From: =?utf-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>
To: Oleg <balbes-150@yandex.ru>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?B?5Zue5aSNOiBTOTA1eCAoVklNKSByYW1kb24gY3Jhc2hlcywgbWF5YmUgZHVl?=
 =?utf-8?Q?_to_display_driver.?=
Thread-Topic: S905x (VIM) ramdon crashes, maybe due to display driver.
Thread-Index: AQHWmxIV9VG3nVaQekid8xf2L+tWvqmI+pMAgAAGYdo=
Date: Mon, 5 Oct 2020 13:45:10 +0000
Message-ID: <SYCPR01MB3776EFAD4209225E2F4FBE31CD0C0@SYCPR01MB3776.ausprd01.prod.outlook.com>
References: <SYCPR01MB37764A52D0614522A279AC76CD0C0@SYCPR01MB3776.ausprd01.prod.outlook.com>,
 <6d14a14f-d212-d2b3-794d-b52c60a68c0c@yandex.ru>
In-Reply-To: <6d14a14f-d212-d2b3-794d-b52c60a68c0c@yandex.ru>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B7CF53EE20764FE60F225A3CCE44CCD4497862CC4F6B7DA8BB00E5B5A4A8A6F9;
 UpperCasedChecksum:FB607C9C227523886BC96C22D553F14FF8D79F4151295872F2024546347B83D7;
 SizeAsReceived:7035; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [D+zcb2G2KivgGflHILawwduhg3Ptqzjm]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 9f1cf428-5878-4cad-90c1-08d86934e120
x-ms-traffictypediagnostic: HK2APC01HT151:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90Wp8cd5RsaFgaIxYQ4q669yG8GapoyXmWxOG2GpOj91SJi5Py+laZU3uh5eecbSRn3sck/41lxSCa0Ryxc8SYkjk+U480ocL0TLEvsJBYAAevuT6Bq4UNo+nuXYVomq8KZpNLbgSooso3c/M4evOSMZBOfMKVIPwEpPWGCta9va2U4hI0bgLYgMjaqE9XMz/wSGlWnzRJEhjlt4tDyrhyizR9vPgld7n3P1CfYhQeBKjClP+/9Kumq4GIVgDKoy
x-ms-exchange-antispam-messagedata: 5FHVLJ5Tz98Ldb/Rm4GQJMZi8nMSfLxOHB09aCFO6LhCbeMuxWOL9HF+/dEsEhTAQa2fd4/sJx/jalxRpFX0x7D25SXn9R0PD7BkrppkoAIgFldK7/+ysfd2iyHyb/Qk7rhRw6cN5rwZ93Q5QvE6Bg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT040.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1cf428-5878-4cad-90c1-08d86934e120
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 13:45:10.8209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT151
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_094520_649205_16BC026F 
X-CRM114-Status: GOOD (  14.45  )
X-Mailman-Approved-At: Mon, 05 Oct 2020 13:36:32 -0400
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

QE9sZWcKCkkgYnVpbGQgaXQgb24gVklNLCBuYXRpdmVseSBidWlsZCBrZXJuZWwsIGNvZGUgaW4g
TkZTLCBhYm91dCAxMk1CL3MgYWNjZXNzIGJpbmR3aWR0aCwgdXNpbmcgV0lGSSwgYW5kIG9uIGJv
YXJkIDEwME1icHMgZXRoZXJuZXQgZXZlbiBzbG93ZXIuIArCoApBbmQgSSB1c2UgZGViaWFu4oCZ
cyBrZXJuZWwgYnVpbGQgc2NyaXB0cyB0byBidWlsZCwgZnVsbHkgYnVpbGQgYmluYXJ5LWFyY2gg
dGFyZ2V0IHdpbGwgdGFrZSBhYm91dCAxOGgsIG1vc3RseSBkdWUgdG8gbmV0d29yaywgYmVjYXVz
ZSB0aGVybWFsIGlzIGFib3V0IDQwLCB3aXRoIGZ1bi4KCm1heSBiZSB1c2UgdXNiIHN0b3JhZ2Ug
d2lsbCBiZSBmYXN0ZXIuCgpATmVpbAphZnRlciByZXZpZXcgdGhlIHBhdGNoZXMgSSBhcHBsaWVk
IHRvIDUuOS1yYzcsIG5vIGRpc3BsYXkgcmVsYXRlZCBwYXRjaGVzLiAgYW5kIDUuOS1yYzcgc3Rp
bGwgaGFzIHRoaXMgaXNzdWUuCgpJIHVuZGVyc3RhbmQgcmVwb3J0IGlzc3VlIHRoaXMgd2F5IHdo
aWNoIGlzIG5vIGhlbHAgZm9yIGRlYnVnLgpJIHdpbGwgdHJ5IHRvIG5hcnJvdyBkb3duIHRvIGZp
bmQgb3V0IHRoZSBwYXRjaGVzIGJldHdlZW4gNS42fjUuNywgIHVzZSBjaHJvb3QtYXJtNjQtd2l0
aC1xZW11IG9uIHBvd2VyZnVsIHg4Nl82NCBidWlsZCBzZXJ2ZXIsIHRoaXMgd2lsbCB0YWtlIDZo
IG9uIGk3LTQ3NzBLLCB3aXRoIGxvY2FsIGNvZGUgc3RvcmFnZSwgZm9yIDEgYnVpbGQuCgpCUi4K
TmluZy4KCiAKCgoK5Y+R5Lu25Lq6OiBPbGVnIDxiYWxiZXMtMTUwQHlhbmRleC5ydT4K5Y+R6YCB
5pe26Ze0OiAyMDIw5bm0MTDmnIg15pelIDEzOjA2CuaUtuS7tuS6ujogemhhbmduMTk4NUBvdXRs
b29rLmNvbSA8emhhbmduMTk4NUBvdXRsb29rLmNvbT4K5Li76aKYOiBSZTogUzkwNXggKFZJTSkg
cmFtZG9uIGNyYXNoZXMsIG1heWJlIGR1ZSB0byBkaXNwbGF5IGRyaXZlci4gCsKgCkhpCkRpZCBJ
IHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgaXQgdGFrZXMgMyBkYXlzIHRvIGJ1aWxkIHRoZSBr
ZXJuZWwgZGlyZWN0bHkgb24gdGhlIGRldmljZSBpdHNlbGYgKEFSTSk/Pz8/PwoKCmhpLAoKSSBv
YnNlcnZlZCBWSU0gcmFtZG9uIGNyYXNoZXMgZnJvbSA1Ljcga2VybmVsIHdpdGggV0lQIHBhdGNo
ZXNbMV0gZnJvbSB0aGlzIG1haWwgbGlzdC4gCgpJIGhhdmUgdHJpZWQgdG8gZmluZCBiZXR0ZXIg
cG93ZXIgc3VwcGx5LMKgIHJlbW92ZSBjYXNlLCDCoCBpbnN0YWxsIGNvb2xpbmcgZnVuLCBkaXNh
YmxlIFhzZXJ2ZXIuIFZJTSBzdGlsbCByYW1kb24gY3Jhc2hlcy4KClRodXMgSSB0aGluayB0aGlz
IG1heWJlIFZJTSBpcyBicm9rZW4sIG1heWJlIGR1ZSB0byB0aGVybWFsLgoKSSBkb24ndCBoYXZl
IGEgY2hhbmNlIHRvIGdldCB0aGUgbG9nLCBldmVuIG5vIGxvZyBwcmludCB0byBjb25zb2xlLCB3
aGVuIGNyYXNoIGhhcHBlbnMuCgp0aGVzZSBkYXlzLCBJIG1hZGUgaXQgYW4gYXJtNjQgYnVpbGQg
c2VydmVyLCB3aXRob3V0IGNvbm5lY3QgYSBIRE1JIGRpc3BsYXkuIGl0IHJ1bnMgdmVyeSB3ZWxs
LCBidWlsZCBrZXJuZWwgMyBkYXlzIHdpdGhvdXQgYW55IGNyYXNoLgoKZnJvbSB0aGXCoHBoZW5v
bWVub24gSSB0aGluayBzb21lIGhpZGRlbiBpc3N1ZXMgbWF5IGluIGRpc3BsYXkgZHJpdmVyLgoK
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3poYW5nbjE5ODUvbGludXgvY29tbWl0cy9tYXN0ZXIv
ZGViaWFuL3BhdGNoZXMva2hhZGFzCgpCUi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
