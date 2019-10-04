Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B919C47404
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 16:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6C0215EA
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 16:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glQFbuMg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6C0215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5pHYjFGa4oT4sP/IwB3YmHG0MyfpU0QTFPZccENesA=; b=glQFbuMg6YWXDy
	EKsOQzjU3guvuY0JGJsac63jYyZ7Sl85MHvXq+gQYBm1ewM3fnlcarhjrmCAndvm1Ukdc+sCfned9
	/Dk2uIXuhnUgMmZPlwmT546KFx/96zOF87AyjVpsgjIYgoQLO7YERZqOVDJ8kj8CBuEYSSWxKlhpl
	xhiz4fw8haKRa07ZWoEXH9wyVn5DxtgKKmFHvHS+Y5dCA4wlB/mOpn6L/kPLai4D3TAMmq42Guii3
	zmt6jonkH5xyxPq7Ohlp9ZJI7OI5ZwOLdLYSxRXoHSpN2a6x/yVivGruu1MweLMDain3MknWIiZds
	9CA4GOfFtzo2ovfFHpCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGQ29-0002nc-AC; Fri, 04 Oct 2019 16:02:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGQ26-0002mv-G7
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 16:02:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E8C41597;
 Fri,  4 Oct 2019 09:02:16 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59923F68E;
 Fri,  4 Oct 2019 09:02:14 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
 <7339b7a1-2d1c-4379-89a0-daf8b28d81c8@baylibre.com>
 <94096e4e-0f60-79d1-69b5-c7c3e59a4d78@amd.com>
 <f44204b4-ce5c-b26e-580d-5bb21314be1f@baylibre.com>
 <8c4ecad8-c2e2-eec1-9132-48e126577baa@arm.com>
 <590a1c78-5c86-92e2-01a1-92bd31397be5@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a09950d8-dba7-e359-da07-7383e7ac946e@arm.com>
Date: Fri, 4 Oct 2019 17:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <590a1c78-5c86-92e2-01a1-92bd31397be5@amd.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_090218_629686_7AC1C406 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDQvMTAvMjAxOSAxNjozNCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMDQuMTAu
MTkgdW0gMTc6Mjcgc2NocmllYiBTdGV2ZW4gUHJpY2U6Cj4+IE9uIDA0LzEwLzIwMTkgMTY6MDMs
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gT24gMDQvMTAvMjAxOSAxNjo1MywgR3JvZHpvdnNr
eSwgQW5kcmV5IHdyb3RlOgo+Pj4+IE9uIDEwLzMvMTkgNDozNCBBTSwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4+Pj4+IEhpIEFuZHJleSwKPj4+Pj4KPj4+Pj4gTGUgMDIvMTAvMjAxOSDDoCAxNjo0
MCwgR3JvZHpvdnNreSwgQW5kcmV5IGEgw6ljcml0IDoKPj4+Pj4+IE9uIDkvMzAvMTkgMTA6NTIg
QU0sIEhpbGxmIERhbnRvbiB3cm90ZToKPj4+Pj4+PiBPbiBNb24sIDMwIFNlcCAyMDE5IDExOjE3
OjQ1ICswMjAwIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+Pj4+PiBEaWQgYSBuZXcgcnVuIGZy
b20gNS4zOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBbICAgMzUuOTcxOTcyXSBDYWxsIHRyYWNlOgo+Pj4+
Pj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMvMHhmMAo+
Pj4+Pj4+PiAJCQlmZmZmMDAwMDEwNjY3ZjM4CUZGRkYwMDAwMTA2NjdGOTQKPj4+Pj4+Pj4gCQkJ
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6MzM1Cj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IFRoZSBjcmFzaGluZyBsaW5lIGlzIDoKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoYmFkLT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRpdHktPmZlbmNl
X2NvbnRleHQpIHsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gRG9lc24ndCBzZWVtIHJlbGF0ZWQgdG8gZ3Vp
bHR5IGpvYi4KPj4+Pj4+PiBCYWlsIG91dCBpZiBzX2ZlbmNlIGlzIG5vIGxvbmdlciBmcmVzaC4K
Pj4+Pj4+Pgo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
Pj4+Pj4+PiBAQCAtMzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJt
YShzdHJ1Y3QgZHJtCj4+Pj4+Pj4gICAgIAo+Pj4+Pj4+ICAgICAJCQlzcGluX2xvY2soJnJxLT5s
b2NrKTsKPj4+Pj4+PiAgICAgCQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGVudGl0eSwgdG1w
LCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+Pj4+Pj4gKwkJCQlpZiAoIXNtcF9sb2FkX2FjcXVp
cmUoJmJhZC0+c19mZW5jZSkpIHsKPj4+Pj4+PiArCQkJCQlzcGluX3VubG9jaygmcnEtPmxvY2sp
Owo+Pj4+Pj4+ICsJCQkJCXJldHVybjsKPj4+Pj4+PiArCQkJCX0KPj4+Pj4+PiAgICAgCQkJCWlm
IChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+Pj4+Pj4gICAgIAkJCQkgICAg
ZW50aXR5LT5mZW5jZV9jb250ZXh0KSB7Cj4+Pj4+Pj4gICAgIAkJCQkJaWYgKGF0b21pY19yZWFk
KCZiYWQtPmthcm1hKSA+Cj4+Pj4+Pj4gQEAgLTU0Myw3ICs1NDcsNyBAQCBFWFBPUlRfU1lNQk9M
KGRybV9zY2hlZF9qb2JfaW5pdCk7Cj4+Pj4+Pj4gICAgIHZvaWQgZHJtX3NjaGVkX2pvYl9jbGVh
bnVwKHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IpCj4+Pj4+Pj4gICAgIHsKPj4+Pj4+PiAgICAg
CWRtYV9mZW5jZV9wdXQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpOwo+Pj4+Pj4+IC0Jam9iLT5z
X2ZlbmNlID0gTlVMTDsKPj4+Pj4+PiArCXNtcF9zdG9yZV9yZWxlYXNlKCZqb2ItPnNfZmVuY2Us
IDApOwo+Pj4+Pj4+ICAgICB9Cj4+Pj4+Pj4gICAgIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2pv
Yl9jbGVhbnVwKTsKPj4+Pj4gVGhpcyBmaXhlZCB0aGUgcHJvYmxlbSBvbiB0aGUgMTAgQ0kgcnVu
cy4KPj4+Pj4KPj4+Pj4gTmVpbAo+Pj4+Cj4+Pj4gVGhlc2UgYXJlIGdvb2QgbmV3cyBidXQgSSBz
dGlsbCBmYWlsIHRvIHNlZSBob3cgdGhpcyBmaXhlcyB0aGUgcHJvYmxlbSAtCj4+Pj4gSGlsbGYs
IGRvIHlvdSBtaW5kIGV4cGxhaW5pbmcgaG93IHlvdSBjYW1lIHVwIHdpdGggdGhpcyBwYXJ0aWN1
bGFyIGZpeCAtCj4+Pj4gd2hhdCB3YXMgdGhlIGJ1ZyB5b3Ugc2F3ID8KPj4+IEFzIFN0ZXZlbiBl
eHBsYWluZWQsIHNlZW1zIHRoZSBzYW1lIGpvYiB3YXMgc3VibWl0dGVkIG9uIGJvdGggSFcgc2xv
dHMsCj4+PiBhbmQgdGhlbiB3aGVuIHRpbWVvdXQgb2NjdXJzIGVhY2ggdGhyZWFkIGNhbGxzIHBh
bmZyb3N0X2pvYl90aW1lZG91dAo+Pj4gd2hpY2ggbGVhZHMgdG8gZHJtX3NjaGVkX3N0b3AoKSBv
biB0aGUgZmlyc3QgY2FsbCBhbmQgb24gdGhlCj4+PiBzZWNvbmQgY2FsbCB0aGUgam9iIHdhcyBh
bHJlYWR5IGZyZWVkLgo+Pj4KPj4+IFN0ZXZlbiBwcm9wb3NlZCBhIHdvcmtpbmcgZml4LCBhbmQg
dGhpcyBvbmUgZG9lcyB0aGUgc2FtZSBidXQgb24KPj4+IHRoZSBkcm1fc2NoZWQgc2lkZS4gVGhp
cyBvbmUgbG9va3MgY2xlYW5lciwgYnV0IHBhbmZyb3N0IHNob3VsZAo+Pj4gbm90IGNhbGwgZHJt
X3NjaGVkX3N0b3AoKSB0d2ljZSBmb3IgdGhlIHNhbWUgam9iLgo+PiBJJ20gbm90IHN1cmUgdGhh
dCBIaWxsZidzIGZpeCBpcyBzdWZmaWNpZW50LiBJbiBwYXJ0aWN1bGFyIGluCj4+IGRybV9zY2hl
ZF9pbmNyZWFzZV9rYXJtYSgpIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhlIHNtcF9sb2FkX2Fj
cXVpcmUoKQo+PiBjYWxsIHByZXZlbnRzIGJhZC0+c19mZW5jZSBiZWNvbWluZyBOVUxMIGltbWVk
aWF0ZWx5IGFmdGVyd2FyZHMgKGJ1dAo+PiBhZG1pdHRlZGx5IHRoZSB3aW5kb3cgaXMgbXVjaCBz
bWFsbGVyKS4gQnV0IHJlYWxseSB0aGlzIGlzIGp1c3QgYQo+PiBQYW5mcm9zdCBidWcgKGNhbGxp
bmcgZHJtX3NjaGVkX3N0b3AoKSB0d2ljZSBvbiB0aGUgc2FtZSBqb2IpLgo+Pgo+PiBUaGUgcGFy
dCBvZiBteSBjaGFuZ2UgdGhhdCBJJ2Qgd2VsY29tZSBmZWVkYmFjayBvbiBpcyBjaGFuZ2luZwo+
PiBjYW5jZWxfZGVsYXllZF93b3JrKCkgdG8gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCkgaW4g
ZHJtX3NjaGVkX3N0b3AoKQo+PiB3aGVuIGNhbGxlZCBvbiBkaWZmZXJlbnQgc2NoZWR1bGVyIHRv
IHRoZSBiYWQgam9iLiBJdCdzIG5vdCBjbGVhciB0byBtZQo+PiBleGFjdGx5IHdoYXQgdGhlIHNl
bWFudGljcyBvZiB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlLCBhbmQgSSBoYXZlbid0Cj4+IHRlc3Rl
ZCB0aGUgZWZmZWN0IG9mIHRoZSBjaGFuZ2Ugb24gZHJpdmVycyBvdGhlciB0aGFuIFBhbmZyb3N0
Lgo+IAo+IFllYWgsIGF0IGxlYXN0IG9mIGhhbmQgdGhhdCBjaGFuZ2UgZG9lc24ndCBzZWVtIHRv
IG1ha2Ugc2Vuc2UgdG8gbWUuCgpXZSBuZWVkIHRvIGVuc3VyZSB0aGF0IGFueSBvdGhlciB0aW1l
b3V0cyB0aGF0IG1pZ2h0IGhhdmUgc3RhcnRlZApwcm9jZXNzaW5nIGFyZSBjb21wbGV0ZSBiZWZv
cmUgYWN0dWFsbHkgcmVzZXR0aW5nIHRoZSBoYXJkd2FyZS4KT3RoZXJ3aXNlIGFmdGVyIHRoZSBy
ZXNldCBhbm90aGVyIHRocmVhZCBjb3VsZCBjb21lIGFsb25nIGFuZCBhdHRlbXB0IHRvCnJlc2V0
IHRoZSBoYXJkd2FyZSBhZ2FpbiAoYW5kIGNhdXNlIGEgZG91YmxlIGZyZWUgb2YgYSBqb2IpLiBN
eSBjaGFuZ2UKdG8gdXNlIHRoZSBfc3luYygpIHZhcmlhbnQgcHJldmVudHMgdGhpcyBoYXBwZW5p
bmcuCgo+IE11bHRpcGxlIHRpbWVvdXQgd29ya2VycyBjYW4gcGVyZmVjdGx5IHJ1biBpbiBwYXJh
bGxlbCwgUGFuZnJvc3QgbmVlZHMgCj4gdG8gbWFrZSBzdXJlIHRoYXQgdGhleSBkb24ndCBhZmZl
Y3QgZWFjaCBvdGhlci4KPiAKPiBUaGUgc2ltcGxlc3Qgd2F5IG9mIGRvaW5nIHRoaXMgaXMgdG8g
aGF2ZSBhIG11dGV4IHlvdSB0cnlsb2NrIHdoZW4gCj4gc3RhcnRpbmcgdGhlIHJlc2V0Lgo+IAo+
IFRoZSBmaXJzdCBvbmUgZ3JhYmJpbmcgaXQgd2lucywgYWxsIG90aGVyIGp1c3Qgc2lsZW50bHkg
cmV0dXJuLgoKQWggdGhhdCB3b3VsZCBzaW1wbGlmeSBteSBjaGFuZ2UgcmVtb3ZpbmcgdGhlIG5l
ZWQgZm9yIHRoZSBuZXcgdmFyaWFibGUuCkkgaGFkbid0IHRob3VnaHQgdG8gdXNlIHRyeWxvY2su
IEknbGwgZ2l2ZSB0aGF0IGEgc3BpbiBhbmQgcG9zdCBhIG5ldwpzaW1wbGVyIHZlcnNpb24uCgpU
aGFua3MsCgpTdGV2ZQoKPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPiAKPj4KPj4gU3RldmUKPj4K
Pj4+IE5laWwKPj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pj4+IERvZXMgdGhpcyBjaGFuZ2UgaGVs
cCB0aGUgcHJvYmxlbSA/IE5vdGUgdGhhdCBkcm1fc2NoZWRfam9iX2NsZWFudXAgaXMKPj4+Pj4+
IGNhbGxlZCBmcm9tIHNjaGVkdWxlciB0aHJlYWQgd2hpY2ggaXMgc3RvcHBlZCBhdCBhbGwgdGlt
ZXMgd2hlbiB3b3JrX3Rkcgo+Pj4+Pj4gdGhyZWFkIGlzIHJ1bm5pbmcgYW5kIGFueXdheSB0aGUg
J2JhZCcgam9iIGlzIHN0aWxsIGluIHRoZQo+Pj4+Pj4gcmluZ19taXJyb3JfbGlzdCB3aGlsZSBp
dCdzIGJlaW5nIGFjY2Vzc2VkIGZyb20KPj4+Pj4+IGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSBz
byBJIGRvbid0IHRoaW5rIGRybV9zY2hlZF9qb2JfY2xlYW51cCBjYW4gYmUKPj4+Pj4+IGNhbGxl
ZCBmb3IgaXQgQkVGT1JFIG9yIHdoaWxlIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSBpcyBleGVj
dXRlZC4KPj4+Pj4+Cj4+Pj4+PiBBbmRyZXkKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+ICAgICAKPj4+
Pj4+PiAtLQo+Pj4+Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPj4+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
