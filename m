Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C16EC4320A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 12:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0023604DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 12:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0023604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPnB9QpzAi8VUiUuvSvnOpXqOSpkTRI17uMPPuwDeOo=; b=bnzP6YUPcY3pzc
	raTw+C/qjUvOmXxSFiSSBcj/xSsx8v9Y4allwxVvghf9J/+34R9kr92Aq8K45JufNYSrSccrQFA5b
	OXsn7pXZVYF0DySLMiWRjFNjoYBMms7fRqj+4KGC3QMEvL0hTOrMB2yWcvfPESsajXFjdhIxU5a1a
	e94uCZj9Y68sfZr0a18Enby2k8d+hnvVhBOEzm5eIu0yaHmq8tJFmDczZe3SMiVOlaPb/tQxPXvoA
	q6jkoj9Th70XBjQYAGOOg/KWLdt76bXjBQgB/zkKAFVsMOQtLcssx0j1PUrdzBQ+XGAm2NDPzysYG
	LSby6Y8Awg+QoHum7c8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7zOR-00B6eM-IL; Mon, 26 Jul 2021 12:07:35 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7zOO-00B6dk-AB; Mon, 26 Jul 2021 12:07:34 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 59BB25C1E18;
 Mon, 26 Jul 2021 14:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1627301247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cb3kJjOI5RQgxYdCoJfB2si3akWljzkDzjtClkoACr0=;
 b=vuNoAyhME0z3lyM+tPxtBy+zTA+/1FtguP13jyIGtP5bqZvtbZkCZWWcGq3MiRkLQnmfjg
 OLT15VG/NuyIrcrEC0CBjonZCUHdVbfYlll1gr4nM2S/Ae5BmnM/lTWmcu6e1ItASYmZie
 xm6Xz4XYjiCKOmD2IzRO59h4DDobchU=
MIME-Version: 1.0
Date: Mon, 26 Jul 2021 14:07:27 +0200
From: Stefan Agner <stefan@agner.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Byron Stanoszek
 <gandalf@winds.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Mike Rapoport <rppt@kernel.org>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <e0cd09ed-6c24-2bc6-c09a-0c0ccb7ae6c4@baylibre.com>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
 <alpine.LNX.2.23.451.2107221723060.2673@winds.org>
 <c2a16fbc-653f-5993-f9bb-9ee8c707515e@arm.com>
 <d1fefb1ec2e7ed1b40083426ed7102c6@agner.ch>
 <216a006d-6df0-4229-d2c1-32256853c857@arm.com>
 <0067ee4c-b9d2-1c92-2444-759ac9a56de0@arm.com>
 <50c6925775c207d0751e20fa9d45611a@agner.ch>
 <e0cd09ed-6c24-2bc6-c09a-0c0ccb7ae6c4@baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <6987e3b18fc5ef7ac7344fec0d7010af@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_050732_991958_44411E6B 
X-CRM114-Status: GOOD (  19.24  )
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

RldJVywgSSBkaWQgcnVuIHR3byBib2FyZHMgb3ZlciB0aGUgd2Vla2VuZCB3aXRoIHN0cmVzcy1u
ZyB2bSB0ZXN0CnJ1bm5pbmcgdG8gY2F1c2UgbWVtb3J5IHByZXNzdXJlLCBvbmUgYm9hcmQgd2l0
aCA4YTVhNzVlNWU5ZTU1ICgib2YvZmR0OgpNYWtlIHN1cmUgbm8tbWFwIGRvZXMgbm90IHJlbW92
ZSBhbHJlYWR5IHJlc2VydmVkIHJlZ2lvbnMiKSByZXZlcnRlZC4KVGhlIG9uZSB3aXRob3V0IHRo
ZSByZXZlcnQgY3Jhc2hlZCBhZnRlciB+MjRoLCB0aGUgb3RoZXIgZGlkIHJ1biB0aHJvdWdoCnRo
ZSB3ZWVrZW5kLiBCYXNpY2FsbHkgY29uZmlybWluZyB3aGF0IEJ5cm9uIHJlcG9ydGVkLgoKT24g
MjAyMS0wNy0yNiAwOTo1NCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjMv
MDcvMjAyMSAyMTo0OCwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+PiBPbiAyMDIxLTA3LTIzIDE5OjQ3
LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+PiBPbiAyMDIxLTA3LTIzIDE3OjE0LCBSb2JpbiBNdXJw
aHkgd3JvdGU6Cj4+Pj4gT24gMjAyMS0wNy0yMyAxNjo1NiwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+
PiA8c25pcD4KPj4+Pj4+Cj4+Pj4+PiBCb290aW5nIHdpdGggImVmaT1kZWJ1ZyIgc2hvdWxkIChh
bW9uZyBvdGhlciB0aGluZ3MpIHByaW50IHRoZSBtZW1vcnkKPj4+Pj4+IG1hcCBhdCBib290IGlm
IHlvdSB3YW50IHRvIGRvdWJsZS1jaGVjayB0aGF0IHRoYXQgaXMgdGhlIHNvdXJjZSBvZiB0aGUK
Pj4+Pj4+IG1pc21hdGNoLiBPdXIgRUZJIGNvZGUgc2hvdWxkIGJlIHBlcmZlY3RseSBjYXBhYmxl
IG9mIHNldHRpbmcgdGhlCj4+Pj4+PiBtZW1ibG9jayBmbGFnIGlmIHRoZSByZWdpb24gKmlzKiBk
ZXNjcmliZWQgYXBwcm9wcmlhdGVseSwgc2VlCj4+Pj4+PiByZXNlcnZlX3JlZ2lvbnMoKSBpbiBk
cml2ZXJzL2Zpcm13YXJlL2VmaS9lZmktaW5pdC5jLgo+Pj4+Pgo+Pj4+PiBCb290aW5nIDUuMTIu
MTAgd2l0aCAiZWZpPWRlYnVnIiBvbiBVLUJvb3QgMjAyMS4wNCBnYXZlIHRoaXM6Cj4+Pj4+IFvC
oMKgwqAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IEhhcmRrZXJuZWwgT0RST0lELU4yUGx1cwo+
Pj4+PiBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IEdldHRpbmcgVUVGSSBwYXJhbWV0ZXJzIGZyb20g
L2Nob3NlbiBpbiBEVDoKPj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gZWZpOiBVRUZJIG5vdCBmb3Vu
ZC4KPj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6IGZkdDogUmVzZXJ2ZWQgbWVtb3J5OiBmYWls
ZWQgdG8gcmVzZXJ2ZSBtZW1vcnkgZm9yCj4+Pj4+IG5vZGUgJ3NlY21vbkA1MDAwMDAwJzogYmFz
ZSAweDAwMDAwMDAwMDUwMDAwMDAsIHNpemUgMyBNaUIKPj4+Pj4KPj4+Pj4gU28gaXQgc2VlbXMg
VUVGSSBpcyBub3QgaW4gdGhlIHBsYXkgaGVyZT8KPj4+Pgo+Pj4+IEFoLCBPSywgaW4gdGhhdCBj
YXNlIEkgZ3Vlc3MgdGhlIHF1ZXN0aW9uIHJlbWFpbnMgd2h5IGRvZXMgZWFybHlfaW5pdF9kdF9y
ZXNlcnZlX21lbW9yeV9hcmNoKCkgdGhpbmsgdGhlIHJlZ2lvbiBpcyBhbHJlYWR5IHJlc2VydmVk
PyBNeSBpbnN0aW5jdGl2ZSBhc3N1bXB0aW9uIHdhcyBhbiBFRkkgbWVtb3J5IG1hcCBiZWluZyBw
cmVzZW50OyBzZWVpbmcgdGhhdCBVLUJvb3QgZG9lcyBpbmRlZWQgcmVmbGVjdCBEVCByZXNlcnZh
dGlvbnMgdGhlcmUgKmFuZCogaGFzIGhhZCBhIGxpa2VseS1sb29raW5nIGJ1ZyByZWNlbnRseSB3
YXMgdGhlbiBqdXN0IG92ZXJ3aGVsbWluZ2x5IHN1Z2dlc3RpdmUgOikKPj4+Cj4+PiBBY3R1YWxs
eSwgcG9raW5nIGF0IFUtQm9vdCBhIGJpdCBtb3JlIEkgZmluZAo+Pj4gbWVzb25fYm9hcmRfYWRk
X3Jlc2VydmVkX21lbW9yeSgpIC0gY2FuIHlvdSBjaGVjayAvc3lzL2Zpcm13YXJlL2ZkdAo+Pj4g
YW5kIHNlZSBpZiB0aGUgcmVnaW9uIGVuZHMgdXAgYmVpbmcgcGFzc2VkIGFzIGEgL21lbXJlc2Vy
dmUvIGFzIHdlbGwKPj4+IGFzIGEgcHJvcGVyIHJlc2VydmVkLW1lbW9yeSBub2RlPwo+Pj4KPj4+
IElJUkMgdGhlIHNlbWFudGljcyBvZiAvbWVtcmVzZXJ2ZS8gYXJlbid0IHJlYWxseSB3ZWxsLWRl
ZmluZWQgZW5vdWdoCj4+PiB0byBiZSBzdWl0YWJsZSBmb3IgdGhlIGtpbmQgb2YgdGhpbmdzIHdo
aWNoIHJlcXVpcmUgbm8tbWFwLCBhbmQgbXkgbmV3Cj4+PiBndWVzcyBpcyB0aGF0IHRoYXQncyB3
aGF0IGVuZHMgdXAgY29uZmxpY3RpbmcgaGVyZS4KPj4KPj4gU2VlbXMgdG8gYmUgcHJlc2VudCBp
biBib290aDoKPiAKPiBJbmRlZWQsIGluIG9yZGVyIHNvIHN1cHBvcnQgYW55IGNvbWJpbmF0aW9u
Ogo+IC0gdXBzdHJlYW0gdS1ib290Cj4gLSB2ZW5kb3IgdS1ib290Cj4gLSB1cHN0cmVhbSBsaW51
eAo+IC0gb3RoZXIgT1MKPiAKPiBUaGUgc2VjbW9uIGlzIGluIHRoZSB1cHN0cmVhbSBMaW51eCBE
VCwgYW5kIHVwc3RyZWFtIHUtYm9vdCByZWFkcyB0aGUKPiBzZWN1cmUgbWVtb3J5IHJlZ2lvbnMK
PiBmcm9tIHRoZSBmaXJzdCBzdGFnZSBib290bG9hZGVycyBhbmQgYWRkcyB0aGVtIGludG8gdGhl
IERUIG1lbXJlc2VydmUuCj4gCj4gSXQgd29ya2VkIGZpbmUgc2luY2UgTGludXggNC4xMC1pc2gs
IHVudGlsIDUuMTAuCgpKdXN0IHZlcmlmaWVkIHdoYXQgaXMgcHJvYmFibHkgb2J2aW91cyBhdCB0
aGlzIHBvaW50OiBCeSByZW1vdmluZwptZXNvbl9ib2FyZF9hZGRfcmVzZXJ2ZWRfbWVtb3J5KCkg
dGhlIC9tZW1yZXNlcnZlLyByZWdpb24gaXNuJ3QgcHJlc2VudAphbmQgImZhaWxlZCB0byByZXNl
cnZlIG1lbW9yeSIgbWVzc2FnZSBkaXNhcHBlYXJzIGluZGVlZC4KCldoeSBpcyByZXNlcnZpbmcg
bWVtb3J5IG5vdCBlbm91Z2g/IEZyb20gd2hhdCBJJ3ZlIHJlYWQgbm8tbWFwIGFsc28gbWFrZQpz
dXJlIHRoZXJlIGlzIG5vIFZNIG1hcHBpbmcsIGJ1dCBpZiB0aGUgcmVnaW9uIGlzIHJlc2VydmVk
LCBzaG91bGRuJ3QKdGhhdCBiZSBlbm91Z2ggZm9yIExpbnV4IHRvIG5vdCBhY2Nlc3MgdGhlIHJl
Z2lvbj8gSSd2ZSByZWFkIHRoYXQgbm8tbWFwCmFsc28gcHJldmVudHNhY2Nlc3MgZHVlIHRvIHNw
ZWN1bGF0aW9uLCBpcyB0aGlzIHdoYXQgaXMgaGFwcGVuaW5nIGhlcmU/CgpXaGF0IGlzIHRoZSBw
cm9wZXIgc29sdXRpb24gaGVyZT8gQ291bGQgbWF5YmUKbWVzb25fYm9hcmRfYWRkX3Jlc2VydmVk
X21lbW9yeSgpIGNoZWNrIGlmIHJlc2VydmVkLW1lbW9yeSBpcyBwcmVzZW50LAphbmQgaWYgc28g
YXZvaWQgYWRkaW5nIC9tZW1yZXNlcnZlLz8KCi0tClN0ZWZhbgoKPiAKPiBOZWlsCj4gCj4+Cj4+
IE9uIHY1LjEyLjEwCj4+ICMgZmR0ZHVtcCAvc3lzL2Zpcm13YXJlL2ZkdAo+PiAuLi4KPj4gL21l
bXJlc2VydmUvIDB4NTAwMDAwMCAweDMwMDAwMDsKPj4gLi4uCj4+ICAgICByZXNlcnZlZC1tZW1v
cnkgewo+PiAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDAwMDAwMDI+Owo+PiAgICAgICAg
ICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDI+Owo+PiAgICAgICAgIHJhbmdlczsKPj4gICAgICAg
ICBzZWNtb25ANTAwMDAwMCB7Cj4+ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDUw
MDAwMDAgMHgwMDAwMDAwMCAweDAwMzAwMDAwPjsKPj4gICAgICAgICAgICAgbm8tbWFwOwo+PiAg
ICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNjg+Owo+PiAgICAgICAgIH07Cj4+ICAgICAg
ICAgbGludXgsY21hIHsKPj4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBv
b2wiOwo+PiAgICAgICAgICAgICByZXVzYWJsZTsKPj4gICAgICAgICAgICAgc2l6ZSA9IDwweDAw
MDAwMDAwIDB4MTAwMDAwMDA+Owo+PiAgICAgICAgICAgICBhbGlnbm1lbnQgPSA8MHgwMDAwMDAw
MCAweDAwNDAwMDAwPjsKPj4gICAgICAgICAgICAgbGludXgsY21hLWRlZmF1bHQ7Cj4+ICAgICAg
ICAgfTsKPj4gICAgIH07Cj4+Cj4+IC0tCj4+IFN0ZWZhbgo+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
