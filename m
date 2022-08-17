Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D07C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 23:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99jbyBlMPoMTidVEJLDw8fk3/AmkcPBLWkC7uKOXA/k=; b=g+6Bi7KUkqqCwm
	RUbKOMz2+U0Nm0WGVJI9W7cRJTBq1QbLUr1P3ZIw2AkCpWJk8js+2pA74bmOkYaompIJ4+vIT2qgw
	xyJZgYzdHy8YGipIaAvaGZExj+64cO217DTiItYyoOWRtsel7uwWnQh4bc1gjybEtx7n5vu+AgXbq
	aDKiiCl1sFutw3PqEL5l6Eg3VxHRM9FpgOC3XWlX8wu35NDQy+INisaMdpCiEfpXRH9vgmkZkWmU4
	gYh1F9dCJdQTi/JSPEi8M73MHRDrY7blJtYzr/oBY5fR4oRP7PU+3pGkX9p5dDA3ZP9B1SDfvqKQE
	xju/EyeAO/U95P52wUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOSNu-008R20-KH; Wed, 17 Aug 2022 23:23:38 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOSNh-008QlY-Ru; Wed, 17 Aug 2022 23:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vy8IjC4ytmVgtE4WiKJlzHK2KV7oXQXXOSGLLqZ9y04=; b=oTgogptRyiMoOmoHALGOlPZgMh
	D1Ju0RvJe/0scBxdEqE+ZJQFmvMZC29tOJlBgtT0mVGlwBwWjc9U1T4VIFmP3Ov0G4jh7DYrtKkTu
	cAnxMD+oOg5LMip4DwJHZB/zq6w90/1RCJ48FxhejAi1WbXiKQovN2I5q3pvjOYkR8sPvU+bIc08G
	GSWDKzymJW9GmsKR2A+vKkCLUcl48w78CML+9Qc2xf1haES/zv288eUJyYpjJXq8WRU30mS0ttbuI
	0z5ue40C7i4yXuiZuDIGa+fZ0X53YM4M2EIU10hdhMNVPVZ5qg1ZUjPRj3/HXzlOz8KOmMelCsB7u
	nXSxIrfw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52827)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oOSNZ-0004zx-So; Thu, 18 Aug 2022 01:23:17 +0200
Message-ID: <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
Date: Thu, 18 Aug 2022 01:23:12 +0200
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
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_162325_976142_40821C43 
X-CRM114-Status: GOOD (  18.93  )
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

CgpEZW4gMTcuMDguMjAyMiAxNS4xMSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxNy4wOC4yMDIyIDEzLjQ2LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+PiBPbiBUdWUsIEF1ZyAx
NiwgMjAyMiBhdCAwOTozNToyNFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+PiBE
ZW4gMTYuMDguMjAyMiAxMS40OSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPj4+PiBPbiBUdWUsIEF1
ZyAxNiwgMjAyMiBhdCAxMTo0MjoyMEFNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Pj4+IERlbiAxNi4wOC4yMDIyIDEwLjI2LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4+Pj4gSGks
Cj4+Pj4+Pgo+Pj4+Pj4gT24gTW9uLCBBdWcgMDgsIDIwMjIgYXQgMDI6NDQ6NTZQTSArMDIwMCwg
Tm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+Pj4+Pj4+IERlbiAyOS4wNy4yMDIyIDE4LjM0LCBza3Jl
diBNYXhpbWUgUmlwYXJkOgo+Pj4+Pj4+PiBUaGUgVFYgbW9kZSBwcm9wZXJ0eSBoYXMgYmVlbiBh
cm91bmQgZm9yIGEgd2hpbGUgbm93IHRvIHNlbGVjdCBhbmQgZ2V0IHRoZQo+Pj4+Pj4+PiBjdXJy
ZW50IFRWIG1vZGUgb3V0cHV0IG9uIGFuIGFuYWxvZyBUViBjb25uZWN0b3IuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IERlc3BpdGUgdGhhdCBwcm9wZXJ0eSBuYW1lIGJlaW5nIGdlbmVyaWMsIGl0cyBjb250
ZW50IGlzbid0IGFuZCBoYXMgYmVlbgo+Pj4+Pj4+PiBkcml2ZXItc3BlY2lmaWMgd2hpY2ggbWFr
ZXMgaXQgaGFyZCB0byBidWlsZCBhbnkgZ2VuZXJpYyBiZWhhdmlvdXIgb24gdG9wCj4+Pj4+Pj4+
IG9mIGl0LCBib3RoIGluIGtlcm5lbCBhbmQgdXNlci1zcGFjZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4g
TGV0J3MgY3JlYXRlIGEgbmV3IGJpdG1hc2sgdHYgbm9ybSBwcm9wZXJ0eSwgdGhhdCBjYW4gY29u
dGFpbiBhbnkgb2YgdGhlCj4+Pj4+Pj4+IGFuYWxvZyBUViBzdGFuZGFyZHMgY3VycmVudGx5IHN1
cHBvcnRlZCBieSBrZXJuZWwgZHJpdmVycy4gRWFjaCBkcml2ZXIgY2FuCj4+Pj4+Pj4+IHRoZW4g
cGFzcyBpbiBhIGJpdG1hc2sgb2YgdGhlIG1vZGVzIGl0IHN1cHBvcnRzLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBXZSdsbCB0aGVuIGJlIGFibGUgdG8gcGhhc2Ugb3V0IHRoZSBvbGRlciB0diBtb2RlIHBy
b3BlcnR5Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWVAY2Vybm8udGVjaD4KPj4+Pj4+Pj4KCj4+PiBIb3cgZG8geW91IHRlc3QgdGhlIHByb3Bl
cnR5PyBJJ3ZlIHVzZWQgbW9kZXRlc3QgYnV0IEkgY2FuIG9ubHkgY2hhbmdlCj4+PiB0byBhIHR2
Lm1vZGUgdGhhdCBtYXRjaGVzIHRoZSBjdXJyZW50IGRpc3BsYXkgbW9kZS4gSSBjYW4ndCBzd2l0
Y2ggZnJvbQo+Pj4gbnRzYyB0byBwYWwgZm9yIGluc3RhbmNlLgo+Pgo+PiBZZXAsIGlmIHlvdSB3
YW50IHRvIGNoYW5nZSBmcm9tIFBBTCB0byBOVFNDLCBpdCB3aWxsIHJlcXVpcmUgYSBuZXcgbW9k
ZS4KPj4KPiAKPiBTbyB1c2Vyc3BhY2UgaGFzIHRvIGNoZWNrIHR2Lm1vZGUgZmlyc3QgYW5kIHRo
ZW4gY3JlYXRlIGEgZGlzcGxheSBtb2RlCj4gdGhlIGRyaXZlciB3aWxsIGFjY2VwdCBpZiBzd2l0
Y2hpbmcgdG8gYSBkaWZmZXJlbnQgZGlzcGxheSBtb2RlIGlzCj4gbmVjZXNzYXJ5PyBJbiBvdGhl
ciB3b3JkcywgdXNlcnNwYWNlIGNhbid0IGRpc2NvdmVyIGZyb20gdGhlIGtlcm5lbAo+IHdoaWNo
IGRpc3BsYXkgbW9kZXMgYSBjZXJ0YWluIHR2Lm1vZGUvbm9ybSBwcm92aWRlcyBiZWZvcmUgaXQg
aXMKPiBzZWxlY3RlZD8gSWYgc28sIG1heWJlIGxpYmRybSBzaG91bGQgaGF2ZSBzb21lIGZ1bmN0
aW9uKHMpIHRvIGRlYWwgd2l0aAo+IHN3aXRjaGluZyBiZXR3ZWVuIG1vZGVzIHRoYXQgcmVxdWly
ZSBhIGRpZmZlcmVudCBkaXNwbGF5IG1vZGUgc2luY2UKPiBrbm93bGVkZ2UgYWJvdXQgd2hpY2gg
ZGlzcGxheSBtb2RlcyBhIHR2Lm1vZGUgc3VwcG9ydHMgaXMgbmVlZGVkIGJlZm9yZQo+IGhhbmQu
Cj4gCgpJIGhhdmVuJ3QgdXNlZCB2YzQgb24gUGk0IGluIG1haW5saW5lIGJlZm9yZSBhbmQgaGF2
ZSBmaW5hbGx5IGdvdHRlbiBpdAp0byB3b3JrLgoKSSBzZWUgdGhhdCB0aGUgY29ubmVjdG9yIHJl
cG9ydHMgMiBtb2RlcyB0aGF0IHRvZ2V0aGVyIGZpdCBhbGwgdHYubm9ybXMKc28gdXNlcnNwYWNl
IGRvZXNuJ3QgaGF2ZSB0byBjb250cnVjdCBhIGRpc3BsYXkgbW9kZSwgYnV0IGl0IGRvZXMgbmVl
ZAp0byBrbm93IHdoaWNoIGRpc3BsYXkgbW9kZSBiZWxvbmdzIHRvIGEgY2VydGFpbiB0di5ub3Jt
LgoKV2hlbiBJIHRyeSB0byB1c2UgbW9kZXRlc3QgSSdtIHVuYWJsZSB0byBzZXQgYSBtb2RlOgoK
cGlAcGk0dDp+ICQgbW9kZXRlc3QgLU0gdmM0IC1zIDQ1OjcyMHg0ODBpCnNldHRpbmcgbW9kZSA3
MjB4NDgwaS0yOS45N0h6IG9uIGNvbm5lY3RvcnMgNDUsIGNydGMgNjgKZmFpbGVkIHRvIHNldCBt
b2RlOiBGdW5jdGlvbiBub3QgaW1wbGVtZW50ZWQKClRoZSBlcnJubyBpcyBtaXNsZWFkaW5nLCBt
b2RldGVzdCBkb2VzIGEgZHJtTW9kZURpcnR5RkIgYmVmb3JlIGNoZWNraW5nCnRoZSBlcnJvciBy
ZXR1cm5lZCBieSBkcm1Nb2RlU2V0Q3J0Yy4KClNldHRpbmcgdGhlIHByb3BlcnR5IHN1Y2NlZWRz
LCBidXQgdGhlIG1vZGVzZXQgc3RpbGwgZmFpbHM6CgpwaUBwaTR0On4gJCBtb2RldGVzdCAtTSB2
YzQgLXMgNDU6NzIweDQ4MGkgLXcgNDU6InR2IG5vcm0iOjIKc2V0dGluZyBtb2RlIDcyMHg0ODBp
LTI5Ljk3SHogb24gY29ubmVjdG9ycyA0NSwgY3J0YyA2OApmYWlsZWQgdG8gc2V0IG1vZGU6IEZ1
bmN0aW9uIG5vdCBpbXBsZW1lbnRlZAoKcGlAcGk0dDp+ICQgbW9kZXRlc3QgLU0gdmM0IC1jCiAg
ICAgICAgMzcgdHYgbm9ybToKICAgICAgICAgICAgICAgIGZsYWdzOiBiaXRtYXNrCiAgICAgICAg
ICAgICAgICB2YWx1ZXM6IE5UU0MtNDQzPTB4MSBOVFNDLUo9MHgyIE5UU0MtTT0weDQgUEFMLUI9
MHgxMApQQUwtTT0weDIwMCBQQUwtTj0weDQwMCBTRUNBTS1CPTB4MjAwMAogICAgICAgICAgICAg
ICAgdmFsdWU6IDIKCkhlcmUncyB0aGUgbG9nLCBjYW4geW91IHNlZSBpZiB0aGVyZSdzIGFueXRo
aW5nIG9idmlvdXMgaW4gdGhlcmU6Cmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL25vdHJvL2EwNzk0
OThiZjZiNjQzMjcxMDU3NTJiMmJhZmE4ODU4CgpOb3JhbGYuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
