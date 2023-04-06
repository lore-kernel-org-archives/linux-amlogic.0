Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A39BC7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJ0K5uYAMq0Z3BoEG0oIvhFm6gsHtFiTNu5ofjqHtXw=; b=vPrW+zHd9gy9EN
	ecEqxk1/bDaY/lnYON364TDlk70GQxCh8CCBAPjd+9HEFmPKQGoh7mtVxm9gVPQr6DjkKfm804DA6
	wjcdGKcKYevdeIYMKYQBQShnYtjPi0MeuUBKacboxwrfPcRVKgPgPSDP9R9bET/2dd65QJeaGR8Ty
	SsKSEzp2oqBaZ26o2DLxL9fhzW1jeAonXoETWR3osnfudbeDizxDoEcXJI4e7jryTMUut54cZM3xS
	hqtnIGLYwMCZOGCyGtMD9N5YdILPxxsSjfVwlb8yJhoUonOT5jd222HckAyICz5R+Wio2J7ZXi0nK
	bYdYQOqOLwnrrovryong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLhX-006qn5-2H;
	Thu, 06 Apr 2023 09:14:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLhU-006qmh-2G;
	Thu, 06 Apr 2023 09:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1F4661E1A;
	Thu,  6 Apr 2023 09:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1288CC433EF;
	Thu,  6 Apr 2023 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680772475;
	bh=NjIpP1xY2SNxegAx9tZnoAzlAcNwzRxkbAg7qEkA59k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncxKjv0ibLLebSZ4GPlWy0iL06qNLIa4t0MwEhvqSrmC30yGMU7MLLjTitMdrG7B4
	 AN6toqr5fQl1PqxfbXhCn3wPGaomuwv8Hj728sgrl0z6B2dAshtMlhP1aauIGTemt8
	 BH2nSzN3EXQ2fVtNYthKu4GaXF+j/FRfSa4TYBO4=
Date: Thu, 6 Apr 2023 11:14:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Message-ID: <2023040604-washtub-undivided-5763@gregkh>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
 <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
 <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
 <71816e38-f919-11a4-1ac9-71416b54b243@leemhuis.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71816e38-f919-11a4-1ac9-71416b54b243@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_021436_813258_0BB4DB99 
X-CRM114-Status: GOOD (  29.29  )
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

T24gVGh1LCBBcHIgMDYsIDIwMjMgYXQgMTE6MDY6NTBBTSArMDIwMCwgVGhvcnN0ZW4gTGVlbWh1
aXMgd3JvdGU6Cj4gW0NDaW5nIHRoZSBzdGFibGUgbGlzdCBhcyB3ZWxsIGFzIEdyZWcgYW5kIFNh
c2hhIHNvIHRoZXkgY2FuIGNvcnJlY3QgbWUKPiBpZiBJIHdyaXRlIHNvbWV0aGluZyBzdHVwaWRd
Cj4gCj4gT24gMDYuMDQuMjMgMTA6MjcsIFJpY2FyZG8gQ2HDsXVlbG8gd3JvdGU6Cj4gPiAKPiA+
IE9uIDUvNC8yMyAxOToxNCwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gPj4gV2FpdCwgd2hh
dD8gQSBwYXRjaCAoNTIyNWUxYjg3NDMyICgiQVJNOiBkdHM6IG1lc29uOiBGaXggdGhlIFVBUlQK
PiA+PiBjb21wYXRpYmxlIHN0cmluZ3MiKSkgdGhhdCB3YXMgbWVyZ2VkIGZvciB2NS4xNy1yYzQg
YW5kIGlzIG5vdCBpbiB0aGUKPiA+PiBsaXN0IG9mIHBhdGNoZXMgdGhhdCB3ZXJlIGluIDQuMTQu
MzEyLXJjMQo+ID4+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA0MDMxNDAzNTEu
NjM2NDcxODY3QGxpbnV4Zm91bmRhdGlvbi5vcmcvCj4gPj4gKSBpcyBtZWFudCB0byBzdWRkZW5s
eSBjYXVzZSB0aGlzPyBIb3cgaXMgdGhpcyBwb3NzaWJsZT8gQW0gSSB0b3RhbGx5IG9uCj4gPj4g
dGhlIHdyb25nIHRyYWNrIGhlcmUgYW5kIG1pc3VuZGVyc3RhbmRpbmcgc29tZXRoaW5nLCBvciBp
cyB0aGlzIGEKPiA+PiBiaXNlY3Rpb24gdGhhdCB3ZW50IGhvcnJpYmx5IHNpZGV3YXlzPwo+ID4g
Cj4gPiBJIGRpZG4ndCBzYXkgdGhpcyB3YXMgaW50cm9kdWNlZCBpbiA0LjE0LjMxMi1yYzEsIHRo
aXMgaGFzIGJlZW4gZmFpbGluZwo+ID4gZm9yIGEgbG9uZyB0aW1lIGFuZCBpdCB3YXMgbWVyZ2Vk
IGZvciA0LjE0LjI2NzoKPiA+IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84ODQ5NzcvCj4gPiAK
PiA+IFNvcnJ5IEkgd2Fzbid0IGNsZWFyIGJlZm9yZS4KPiAKPiBBaGgsIG5vIHdvcnJpZXMgYW5k
IHRoeCBmb3IgdGhpcy4gQnV0IHdlbGwsIGluIHRoYXQgY2FzZSBsZXQgbWUgZ2V0IGJhY2sKPiB0
byBzb21ldGhpbmcgZnJvbSB5b3VyIHJlcG9ydDoKPiAKPiA+Pj4gS2VybmVsQ0kgZGV0ZWN0ZWQg
dGhhdCB0aGlzIHBhdGNoIGludHJvZHVjZWQgYSByZWdyZXNzaW9uIGluCj4gPj4+IHN0YWJsZS1y
Yy9saW51eC00LjE0Lnkgb24gYSBtZXNvbjhiLW9kcm9pZGMxLgo+ID4+PiBBZnRlciB0aGlzIHBh
dGNoIHdhcyBhcHBsaWVkIHRoZSB0ZXN0cyBydW5uaW5nIG9uIHRoaXMgcGxhdGZvcm0gZG9uJ3QK
PiA+Pj4gc2hvdyBhbnkgc2VyaWFsIG91dHB1dC4KPiA+Pj4gCj4gPj4+IFRoaXMgZG9lc24ndCBo
YXBwZW4gaW4gb3RoZXIgc3RhYmxlIGJyYW5jaGVzIG5vciBpbiBtYWlubGluZSwgYnV0IDQuMTQK
PiA+Pj4gaGFzbid0IHN0aWxsIHJlYWNoZWQgRU9MIGFuZCBpdCdkIGJlIGdvb2QgdG8gZmluZCBh
IGZpeC4KPiAKPiBXZWxsLCB0aGUgc3RhYmxlIG1haW50YWluZXJzIG1heSBjb3JyZWN0IG1lIGlm
IEknbSB3cm9uZywgYnV0IGFzIGZhciBhcwo+IEkga25vdyBpbiB0aGF0IGNhc2UgaXQncyB0aGUg
ZHV0eSBvZiB0aGUgc3RhYmxlIHRlYW0gKHdoaWNoIHdhcyBub3QgZXZlbgo+IENDZWQgb24gdGhl
IHJlcG9ydCBhZmFpY3MpIHRvIGxvb2sgaW50byB0aGlzIGZvciB0d28gcmVhc29uczoKPiAKPiAq
IHRoZSByZWdyZXNzaW9uIGRvZXMgbm90IGhhcHBlbmVkIGluIG1haW5saW5lIChhbmQgbWF5YmUg
bmV2ZXIgaGFzKQo+IAo+ICogbWFpbmxpbmUgZGV2ZWxvcGVycyBuZXZlciBzaWduZWQgdXAgZm9y
IG1haW50YWluaW5nIHRoZWlyIHdvcmsgaW4KPiBsb25ndGVybSBrZXJuZWxzOyBxdWl0ZSBhIGZl
dyBuZXZlcnRoZWxlc3MgaGVscCBpbiBzaXR1YXRpb24gbGlrZSB0aGlzLAo+IGF0IGxlYXN0IGZv
ciByZWNlbnQgc2VyaWVzIGFuZCBpZiB0aGV5IGFza2VkIGZvciBhIGJhY2twb3J0IHRocm91Z2gg
YQo+ICJDQzogPHN0YWJsZUAiIHRhZyDigJMgYnV0IHRoZSBsYXR0ZXIgZG9lc24ndCBzZWVtIHRv
IGJlIHRoZSBjYXNlIGhlcmUKPiAobm90IHRvdGFsbHkgc3VyZSwgYnV0IGl0IGxvb2tzIGxpa2Ug
QVVUT1NFTCBwaWNrZWQgdGhpcyB1cCkgYW5kIGl0J3MgYQo+IHF1aXRlIG9sZCBzZXJpZXMuCgpU
aGF0IGlzIGFsbCB0cnVlLgoKU28gY2FuIHRoZSBvcmlnaW5hbCByZXBvcnQgYmUgc2VudCB0byBz
dGFibGVAdmdlci5rZXJuZWwub3JnIGFuZCB3ZSBjYW4KdGFrZSBpdCBmcm9tIHRoZXJlPwoKdGhh
bmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
