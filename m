Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBCC00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHNA4xcjBkkRkQDtdYQK0RReLw8yLU9jx6LjHHH2f1s=; b=jLOW1h2oTUw481
	E7kkW1S2nXRsK92ih1Pw1asTBb/ckDbrcW/a+BUiiRXJ4XBeotlzW3h2vfeTf/z9mMouFFMzLpLPA
	2VvA0IL8bmfTWvPlbzSft3O9ancu4b+0gPAVepcawoShFsBV00yStcuZKwHjOoOGjg5IKXy17WDza
	g6v8F9JExsMuFkL5L7F8ssPMdHQschXYrluiGl0legZh8mvqzTJ6+FoWHNOpMi5Py3FA3Ca+e6xH/
	/Xh6omZBL1IuzfmWalTK9KDY506yBUrdTZRmsg3KHfLwkTMHMr/W3ky6V27T/kc+rHEHC7L6Y5Fsq
	u2ygDY5/rgLeNHISBrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh5o-006Pr1-H3; Thu, 18 Aug 2022 15:05:56 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOh1s-006NKs-EB; Thu, 18 Aug 2022 15:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LccdFbPDSxXP+gACKuKTMuEMaaSrmuhltQbhTM8ys/U=; b=U/p7+XSNH4LJjD0Qr6Vocdo1qZ
	kPXkbxTXApbs7c+pbjX6DjHx0NDSpAn+wyaTG75S2L00/kKFiUs0gOp+HCGYDLCDYF3EFgEbuy1hX
	DJRfD8avqpvWvKDMIOj9hRns71Q0AkeVlwLiz3KuGy30EWm9z2y6McQtlaQmXTTX9iXUN4C/4mHhw
	FqpIRgdt0L7wCYElPHASLD0M2OkJ8dcbaUIawVJ9rT2xLd8DsM3CXMGbMIvGtLtBNCfxdI2vGj/fo
	j2JfIm2nMB8dF0P4fTMreV5BxDZRPDPsELI2wznKsApyducwTOHPOY0jyEvXYixqtY+CPdX77SSfm
	rn2j11jw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=65245)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oOh1l-0000p4-JX; Thu, 18 Aug 2022 17:01:45 +0200
Message-ID: <9daca9bf-838e-c3eb-51de-1cf5188a9341@tronnes.org>
Date: Thu, 18 Aug 2022 17:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
 <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_080152_587700_C6E85D9E 
X-CRM114-Status: GOOD (  24.90  )
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

CgpEZW4gMTguMDguMjAyMiAwMS4yMywgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxNy4wOC4yMDIyIDE1LjExLCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4+Cj4+Cj4+IERlbiAx
Ny4wOC4yMDIyIDEzLjQ2LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4gT24gVHVlLCBBdWcgMTYs
IDIwMjIgYXQgMDk6MzU6MjRQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+Pj4+IERl
biAxNi4wOC4yMDIyIDExLjQ5LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4+PiBPbiBUdWUsIEF1
ZyAxNiwgMjAyMiBhdCAxMTo0MjoyMEFNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Pj4+PiBEZW4gMTYuMDguMjAyMiAxMC4yNiwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPj4+Pj4+PiBI
aSwKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIE1vbiwgQXVnIDA4LCAyMDIyIGF0IDAyOjQ0OjU2UE0gKzAy
MDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4+Pj4+Pj4gRGVuIDI5LjA3LjIwMjIgMTguMzQs
IHNrcmV2IE1heGltZSBSaXBhcmQ6Cj4+Pj4+Pj4+PiBUaGUgVFYgbW9kZSBwcm9wZXJ0eSBoYXMg
YmVlbiBhcm91bmQgZm9yIGEgd2hpbGUgbm93IHRvIHNlbGVjdCBhbmQgZ2V0IHRoZQo+Pj4+Pj4+
Pj4gY3VycmVudCBUViBtb2RlIG91dHB1dCBvbiBhbiBhbmFsb2cgVFYgY29ubmVjdG9yLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IERlc3BpdGUgdGhhdCBwcm9wZXJ0eSBuYW1lIGJlaW5nIGdlbmVyaWMs
IGl0cyBjb250ZW50IGlzbid0IGFuZCBoYXMgYmVlbgo+Pj4+Pj4+Pj4gZHJpdmVyLXNwZWNpZmlj
IHdoaWNoIG1ha2VzIGl0IGhhcmQgdG8gYnVpbGQgYW55IGdlbmVyaWMgYmVoYXZpb3VyIG9uIHRv
cAo+Pj4+Pj4+Pj4gb2YgaXQsIGJvdGggaW4ga2VybmVsIGFuZCB1c2VyLXNwYWNlLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IExldCdzIGNyZWF0ZSBhIG5ldyBiaXRtYXNrIHR2IG5vcm0gcHJvcGVydHks
IHRoYXQgY2FuIGNvbnRhaW4gYW55IG9mIHRoZQo+Pj4+Pj4+Pj4gYW5hbG9nIFRWIHN0YW5kYXJk
cyBjdXJyZW50bHkgc3VwcG9ydGVkIGJ5IGtlcm5lbCBkcml2ZXJzLiBFYWNoIGRyaXZlciBjYW4K
Pj4+Pj4+Pj4+IHRoZW4gcGFzcyBpbiBhIGJpdG1hc2sgb2YgdGhlIG1vZGVzIGl0IHN1cHBvcnRz
Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdlJ2xsIHRoZW4gYmUgYWJsZSB0byBwaGFzZSBvdXQgdGhl
IG9sZGVyIHR2IG1vZGUgcHJvcGVydHkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4+Pj4+Pj4+Pgo+IAo+Pj4+IEhv
dyBkbyB5b3UgdGVzdCB0aGUgcHJvcGVydHk/IEkndmUgdXNlZCBtb2RldGVzdCBidXQgSSBjYW4g
b25seSBjaGFuZ2UKPj4+PiB0byBhIHR2Lm1vZGUgdGhhdCBtYXRjaGVzIHRoZSBjdXJyZW50IGRp
c3BsYXkgbW9kZS4gSSBjYW4ndCBzd2l0Y2ggZnJvbQo+Pj4+IG50c2MgdG8gcGFsIGZvciBpbnN0
YW5jZS4KPj4+Cj4+PiBZZXAsIGlmIHlvdSB3YW50IHRvIGNoYW5nZSBmcm9tIFBBTCB0byBOVFND
LCBpdCB3aWxsIHJlcXVpcmUgYSBuZXcgbW9kZS4KPj4+Cj4+Cj4+IFNvIHVzZXJzcGFjZSBoYXMg
dG8gY2hlY2sgdHYubW9kZSBmaXJzdCBhbmQgdGhlbiBjcmVhdGUgYSBkaXNwbGF5IG1vZGUKPj4g
dGhlIGRyaXZlciB3aWxsIGFjY2VwdCBpZiBzd2l0Y2hpbmcgdG8gYSBkaWZmZXJlbnQgZGlzcGxh
eSBtb2RlIGlzCj4+IG5lY2Vzc2FyeT8gSW4gb3RoZXIgd29yZHMsIHVzZXJzcGFjZSBjYW4ndCBk
aXNjb3ZlciBmcm9tIHRoZSBrZXJuZWwKPj4gd2hpY2ggZGlzcGxheSBtb2RlcyBhIGNlcnRhaW4g
dHYubW9kZS9ub3JtIHByb3ZpZGVzIGJlZm9yZSBpdCBpcwo+PiBzZWxlY3RlZD8gSWYgc28sIG1h
eWJlIGxpYmRybSBzaG91bGQgaGF2ZSBzb21lIGZ1bmN0aW9uKHMpIHRvIGRlYWwgd2l0aAo+PiBz
d2l0Y2hpbmcgYmV0d2VlbiBtb2RlcyB0aGF0IHJlcXVpcmUgYSBkaWZmZXJlbnQgZGlzcGxheSBt
b2RlIHNpbmNlCj4+IGtub3dsZWRnZSBhYm91dCB3aGljaCBkaXNwbGF5IG1vZGVzIGEgdHYubW9k
ZSBzdXBwb3J0cyBpcyBuZWVkZWQgYmVmb3JlCj4+IGhhbmQuCj4+Cj4gCj4gSSBoYXZlbid0IHVz
ZWQgdmM0IG9uIFBpNCBpbiBtYWlubGluZSBiZWZvcmUgYW5kIGhhdmUgZmluYWxseSBnb3R0ZW4g
aXQKPiB0byB3b3JrLgo+IAo+IEkgc2VlIHRoYXQgdGhlIGNvbm5lY3RvciByZXBvcnRzIDIgbW9k
ZXMgdGhhdCB0b2dldGhlciBmaXQgYWxsIHR2Lm5vcm1zCj4gc28gdXNlcnNwYWNlIGRvZXNuJ3Qg
aGF2ZSB0byBjb250cnVjdCBhIGRpc3BsYXkgbW9kZSwgYnV0IGl0IGRvZXMgbmVlZAo+IHRvIGtu
b3cgd2hpY2ggZGlzcGxheSBtb2RlIGJlbG9uZ3MgdG8gYSBjZXJ0YWluIHR2Lm5vcm0uCj4gCj4g
V2hlbiBJIHRyeSB0byB1c2UgbW9kZXRlc3QgSSdtIHVuYWJsZSB0byBzZXQgYSBtb2RlOgo+IAo+
IHBpQHBpNHQ6fiAkIG1vZGV0ZXN0IC1NIHZjNCAtcyA0NTo3MjB4NDgwaQo+IHNldHRpbmcgbW9k
ZSA3MjB4NDgwaS0yOS45N0h6IG9uIGNvbm5lY3RvcnMgNDUsIGNydGMgNjgKPiBmYWlsZWQgdG8g
c2V0IG1vZGU6IEZ1bmN0aW9uIG5vdCBpbXBsZW1lbnRlZAo+IAo+IFRoZSBlcnJubyBpcyBtaXNs
ZWFkaW5nLCBtb2RldGVzdCBkb2VzIGEgZHJtTW9kZURpcnR5RkIgYmVmb3JlIGNoZWNraW5nCj4g
dGhlIGVycm9yIHJldHVybmVkIGJ5IGRybU1vZGVTZXRDcnRjLgo+IAo+IFNldHRpbmcgdGhlIHBy
b3BlcnR5IHN1Y2NlZWRzLCBidXQgdGhlIG1vZGVzZXQgc3RpbGwgZmFpbHM6Cj4gCj4gcGlAcGk0
dDp+ICQgbW9kZXRlc3QgLU0gdmM0IC1zIDQ1OjcyMHg0ODBpIC13IDQ1OiJ0diBub3JtIjoyCj4g
c2V0dGluZyBtb2RlIDcyMHg0ODBpLTI5Ljk3SHogb24gY29ubmVjdG9ycyA0NSwgY3J0YyA2OAo+
IGZhaWxlZCB0byBzZXQgbW9kZTogRnVuY3Rpb24gbm90IGltcGxlbWVudGVkCj4gCj4gcGlAcGk0
dDp+ICQgbW9kZXRlc3QgLU0gdmM0IC1jCj4gICAgICAgICAzNyB0diBub3JtOgo+ICAgICAgICAg
ICAgICAgICBmbGFnczogYml0bWFzawo+ICAgICAgICAgICAgICAgICB2YWx1ZXM6IE5UU0MtNDQz
PTB4MSBOVFNDLUo9MHgyIE5UU0MtTT0weDQgUEFMLUI9MHgxMAo+IFBBTC1NPTB4MjAwIFBBTC1O
PTB4NDAwIFNFQ0FNLUI9MHgyMDAwCj4gICAgICAgICAgICAgICAgIHZhbHVlOiAyCj4gCj4gSGVy
ZSdzIHRoZSBsb2csIGNhbiB5b3Ugc2VlIGlmIHRoZXJlJ3MgYW55dGhpbmcgb2J2aW91cyBpbiB0
aGVyZToKPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9ub3Ryby9hMDc5NDk4YmY2YjY0MzI3MTA1
NzUyYjJiYWZhODg1OAo+IAoKSSdtIG9uZSBzdGVwIGNsb3NlciBhcyBJIG5vdyBoYXZlIGZiY29u
IHdvcmtpbmcsIEkgaGFkIGZvcmdvdHRlbiB0byBhZGQKZW5hYmxlX3R2b3V0PTEgYW5kIEkgaGFk
IGRpc2FibGVfZndfa21zX3NldHVwPTEgd2hpY2ggZGlzYWJsZXMgdGhlCnZpZGVvPSBtb2RlIG9u
IHRoZSBrZXJuZWwgY29tbWFuZGxpbmUuCgptb2RldGVzdCBzdGlsbCBmYWlscyB0aG91Z2gsIGFm
dGVyIGFsb3Qgb2YgcHJpbnRrIHNwcmlua2xpbmcsIEkndmUKdHJhY2tlZCBpdCBkb3duIHRvIHRo
ZSBkcm1fbW9kZV9lcXVhbCB0ZXN0IGluCmRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9j
aGVjaygpLiBUaGUgYXNwZWN0IHJhdGlvcyBkaWZmZXI6CgpbICAgNjEuMzM2Mjk1XSBkcm1fYXRv
bWljX2hlbHBlcl9jb25uZWN0b3JfdHZfY2hlY2s6Cm1vZGUtPnBpY3R1cmVfYXNwZWN0X3JhdGlv
PTEKWyAgIDYxLjMzNjMwMV0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X2NoZWNrOgom
Y3J0Y19zdGF0ZS0+bW9kZS0+cGljdHVyZV9hc3BlY3RfcmF0aW89MAoKTm9yYWxmLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
