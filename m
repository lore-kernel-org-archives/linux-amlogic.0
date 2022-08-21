Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FDEC00140
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Aug 2022 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gYA9x9Y7SCIyNnK5tuME4I1CaGxUX2GXc6YKfhd19w=; b=q/PKgSowZknwwa
	nVqYTR1XxwSpfoEl2T1fJLZwSZT5kn9ewntOXyGHMn23s3JtmcE+C9Mnt50T6XhEwOBlDclrQCpUo
	H1Upeo0b7wp/Gwsmn+280cPI2ybSvs+MBU4wIy6ii8ieBMJKlr54h6U9vh4XjPHcbZZRrVuyaQWK3
	gSwWj/HprIcUBQqcpiMIzPQiZUfGx0NCL0pSYf4UqppuBWk9pR/i8QRY7ugfVPlaKxmo97DGzlYQX
	BhXaFYuQ6toy5t6YbGA8dhwxeMu+O7tT3DD71WZw11VHJc7do8yMPwjqE12w0KYjabt6G5IITqzol
	v0JSB6NnYiHXYVNjn0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjNE-009rGR-7b; Sun, 21 Aug 2022 11:44:12 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjMu-009r7z-Ly; Sun, 21 Aug 2022 11:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+ZoIW7lMeANBkFH1s5Rhmlkpatn+9yf4YSzovoyzSME=; b=Rog/DIBA9Pgcy9FHr0jeCRloS5
	T5bjh9kuls4yosv4p+VMRFi/9YqdOz104uBICNY3rScXHsRaJXVZXkIhBgVrZBZpaNbjOdS+fdQHT
	wWL9PrrSNN/Ci1hV1l9EsDcOgA7urAi/LCox0ajZs10oE/TfWBPc3tqtMiErWowCuMw+zCSN69Jf2
	u+NArMAqAkp7g1iymcKnjCFFyaCjZqvk7FbAm9VEz6tQK6IgJjwrUNpEmVlOctXrxxZx/3TbR2pik
	EWPPn4ThY+1hApReu2IzXpU0PkFEOsZIQgWoE0T12DZyEM3T5ERCjxM2CVFPVm22Tx/wTtm1acNh/
	1iTE3/NQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62402)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oPjMp-0003Fz-F1; Sun, 21 Aug 2022 13:43:47 +0200
Message-ID: <9e0256bd-b37a-0b94-45d5-59e06cd1547c@tronnes.org>
Date: Sun, 21 Aug 2022 13:43:40 +0200
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
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
 <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
 <9daca9bf-838e-c3eb-51de-1cf5188a9341@tronnes.org>
 <20220818153101.c25x33vkl6qboswe@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220818153101.c25x33vkl6qboswe@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_044352_963563_5B678EC3 
X-CRM114-Status: GOOD (  27.29  )
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

CgpEZW4gMTguMDguMjAyMiAxNy4zMSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBPbiBUaHUsIEF1
ZyAxOCwgMjAyMiBhdCAwNTowMTozOFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Cj4+Cj4+IERlbiAxOC4wOC4yMDIyIDAxLjIzLCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4+Pgo+
Pj4KPj4+IERlbiAxNy4wOC4yMDIyIDE1LjExLCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4+Pj4K
Pj4+Pgo+Pj4+IERlbiAxNy4wOC4yMDIyIDEzLjQ2LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4+
PiBPbiBUdWUsIEF1ZyAxNiwgMjAyMiBhdCAwOTozNToyNFBNICswMjAwLCBOb3JhbGYgVHLDuG5u
ZXMgd3JvdGU6Cj4+Pj4+PiBEZW4gMTYuMDguMjAyMiAxMS40OSwgc2tyZXYgTWF4aW1lIFJpcGFy
ZDoKPj4+Pj4+PiBPbiBUdWUsIEF1ZyAxNiwgMjAyMiBhdCAxMTo0MjoyMEFNICswMjAwLCBOb3Jh
bGYgVHLDuG5uZXMgd3JvdGU6Cj4+Pj4+Pj4+IERlbiAxNi4wOC4yMDIyIDEwLjI2LCBza3JldiBN
YXhpbWUgUmlwYXJkOgo+Pj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT24gTW9uLCBB
dWcgMDgsIDIwMjIgYXQgMDI6NDQ6NTZQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+
Pj4+Pj4+Pj4+IERlbiAyOS4wNy4yMDIyIDE4LjM0LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4+
Pj4+Pj4+PiBUaGUgVFYgbW9kZSBwcm9wZXJ0eSBoYXMgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUg
bm93IHRvIHNlbGVjdCBhbmQgZ2V0IHRoZQo+Pj4+Pj4+Pj4+PiBjdXJyZW50IFRWIG1vZGUgb3V0
cHV0IG9uIGFuIGFuYWxvZyBUViBjb25uZWN0b3IuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IERl
c3BpdGUgdGhhdCBwcm9wZXJ0eSBuYW1lIGJlaW5nIGdlbmVyaWMsIGl0cyBjb250ZW50IGlzbid0
IGFuZCBoYXMgYmVlbgo+Pj4+Pj4+Pj4+PiBkcml2ZXItc3BlY2lmaWMgd2hpY2ggbWFrZXMgaXQg
aGFyZCB0byBidWlsZCBhbnkgZ2VuZXJpYyBiZWhhdmlvdXIgb24gdG9wCj4+Pj4+Pj4+Pj4+IG9m
IGl0LCBib3RoIGluIGtlcm5lbCBhbmQgdXNlci1zcGFjZS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4gTGV0J3MgY3JlYXRlIGEgbmV3IGJpdG1hc2sgdHYgbm9ybSBwcm9wZXJ0eSwgdGhhdCBjYW4g
Y29udGFpbiBhbnkgb2YgdGhlCj4+Pj4+Pj4+Pj4+IGFuYWxvZyBUViBzdGFuZGFyZHMgY3VycmVu
dGx5IHN1cHBvcnRlZCBieSBrZXJuZWwgZHJpdmVycy4gRWFjaCBkcml2ZXIgY2FuCj4+Pj4+Pj4+
Pj4+IHRoZW4gcGFzcyBpbiBhIGJpdG1hc2sgb2YgdGhlIG1vZGVzIGl0IHN1cHBvcnRzLgo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXZSdsbCB0aGVuIGJlIGFibGUgdG8gcGhhc2Ugb3V0IHRoZSBv
bGRlciB0diBtb2RlIHByb3BlcnR5Lgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KPj4+Pj4+Pj4+Pj4KPj4+Cj4+
Pj4+PiBIb3cgZG8geW91IHRlc3QgdGhlIHByb3BlcnR5PyBJJ3ZlIHVzZWQgbW9kZXRlc3QgYnV0
IEkgY2FuIG9ubHkgY2hhbmdlCj4+Pj4+PiB0byBhIHR2Lm1vZGUgdGhhdCBtYXRjaGVzIHRoZSBj
dXJyZW50IGRpc3BsYXkgbW9kZS4gSSBjYW4ndCBzd2l0Y2ggZnJvbQo+Pj4+Pj4gbnRzYyB0byBw
YWwgZm9yIGluc3RhbmNlLgo+Pj4+Pgo+Pj4+PiBZZXAsIGlmIHlvdSB3YW50IHRvIGNoYW5nZSBm
cm9tIFBBTCB0byBOVFNDLCBpdCB3aWxsIHJlcXVpcmUgYSBuZXcgbW9kZS4KPj4+Pj4KPj4+Pgo+
Pj4+IFNvIHVzZXJzcGFjZSBoYXMgdG8gY2hlY2sgdHYubW9kZSBmaXJzdCBhbmQgdGhlbiBjcmVh
dGUgYSBkaXNwbGF5IG1vZGUKPj4+PiB0aGUgZHJpdmVyIHdpbGwgYWNjZXB0IGlmIHN3aXRjaGlu
ZyB0byBhIGRpZmZlcmVudCBkaXNwbGF5IG1vZGUgaXMKPj4+PiBuZWNlc3Nhcnk/IEluIG90aGVy
IHdvcmRzLCB1c2Vyc3BhY2UgY2FuJ3QgZGlzY292ZXIgZnJvbSB0aGUga2VybmVsCj4+Pj4gd2hp
Y2ggZGlzcGxheSBtb2RlcyBhIGNlcnRhaW4gdHYubW9kZS9ub3JtIHByb3ZpZGVzIGJlZm9yZSBp
dCBpcwo+Pj4+IHNlbGVjdGVkPyBJZiBzbywgbWF5YmUgbGliZHJtIHNob3VsZCBoYXZlIHNvbWUg
ZnVuY3Rpb24ocykgdG8gZGVhbCB3aXRoCj4+Pj4gc3dpdGNoaW5nIGJldHdlZW4gbW9kZXMgdGhh
dCByZXF1aXJlIGEgZGlmZmVyZW50IGRpc3BsYXkgbW9kZSBzaW5jZQo+Pj4+IGtub3dsZWRnZSBh
Ym91dCB3aGljaCBkaXNwbGF5IG1vZGVzIGEgdHYubW9kZSBzdXBwb3J0cyBpcyBuZWVkZWQgYmVm
b3JlCj4+Pj4gaGFuZC4KPj4+Pgo+Pj4KPj4+IEkgaGF2ZW4ndCB1c2VkIHZjNCBvbiBQaTQgaW4g
bWFpbmxpbmUgYmVmb3JlIGFuZCBoYXZlIGZpbmFsbHkgZ290dGVuIGl0Cj4+PiB0byB3b3JrLgo+
Pj4KPj4+IEkgc2VlIHRoYXQgdGhlIGNvbm5lY3RvciByZXBvcnRzIDIgbW9kZXMgdGhhdCB0b2dl
dGhlciBmaXQgYWxsIHR2Lm5vcm1zCj4+PiBzbyB1c2Vyc3BhY2UgZG9lc24ndCBoYXZlIHRvIGNv
bnRydWN0IGEgZGlzcGxheSBtb2RlLCBidXQgaXQgZG9lcyBuZWVkCj4+PiB0byBrbm93IHdoaWNo
IGRpc3BsYXkgbW9kZSBiZWxvbmdzIHRvIGEgY2VydGFpbiB0di5ub3JtLgo+Pj4KPj4+IFdoZW4g
SSB0cnkgdG8gdXNlIG1vZGV0ZXN0IEknbSB1bmFibGUgdG8gc2V0IGEgbW9kZToKPj4+Cj4+PiBw
aUBwaTR0On4gJCBtb2RldGVzdCAtTSB2YzQgLXMgNDU6NzIweDQ4MGkKPj4+IHNldHRpbmcgbW9k
ZSA3MjB4NDgwaS0yOS45N0h6IG9uIGNvbm5lY3RvcnMgNDUsIGNydGMgNjgKPj4+IGZhaWxlZCB0
byBzZXQgbW9kZTogRnVuY3Rpb24gbm90IGltcGxlbWVudGVkCj4+Pgo+Pj4gVGhlIGVycm5vIGlz
IG1pc2xlYWRpbmcsIG1vZGV0ZXN0IGRvZXMgYSBkcm1Nb2RlRGlydHlGQiBiZWZvcmUgY2hlY2tp
bmcKPj4+IHRoZSBlcnJvciByZXR1cm5lZCBieSBkcm1Nb2RlU2V0Q3J0Yy4KPj4+Cj4+PiBTZXR0
aW5nIHRoZSBwcm9wZXJ0eSBzdWNjZWVkcywgYnV0IHRoZSBtb2Rlc2V0IHN0aWxsIGZhaWxzOgo+
Pj4KPj4+IHBpQHBpNHQ6fiAkIG1vZGV0ZXN0IC1NIHZjNCAtcyA0NTo3MjB4NDgwaSAtdyA0NToi
dHYgbm9ybSI6Mgo+Pj4gc2V0dGluZyBtb2RlIDcyMHg0ODBpLTI5Ljk3SHogb24gY29ubmVjdG9y
cyA0NSwgY3J0YyA2OAo+Pj4gZmFpbGVkIHRvIHNldCBtb2RlOiBGdW5jdGlvbiBub3QgaW1wbGVt
ZW50ZWQKPj4+Cj4+PiBwaUBwaTR0On4gJCBtb2RldGVzdCAtTSB2YzQgLWMKPj4+ICAgICAgICAg
MzcgdHYgbm9ybToKPj4+ICAgICAgICAgICAgICAgICBmbGFnczogYml0bWFzawo+Pj4gICAgICAg
ICAgICAgICAgIHZhbHVlczogTlRTQy00NDM9MHgxIE5UU0MtSj0weDIgTlRTQy1NPTB4NCBQQUwt
Qj0weDEwCj4+PiBQQUwtTT0weDIwMCBQQUwtTj0weDQwMCBTRUNBTS1CPTB4MjAwMAo+Pj4gICAg
ICAgICAgICAgICAgIHZhbHVlOiAyCj4+Pgo+Pj4gSGVyZSdzIHRoZSBsb2csIGNhbiB5b3Ugc2Vl
IGlmIHRoZXJlJ3MgYW55dGhpbmcgb2J2aW91cyBpbiB0aGVyZToKPj4+IGh0dHBzOi8vZ2lzdC5n
aXRodWIuY29tL25vdHJvL2EwNzk0OThiZjZiNjQzMjcxMDU3NTJiMmJhZmE4ODU4Cj4+Pgo+Pgo+
PiBJJ20gb25lIHN0ZXAgY2xvc2VyIGFzIEkgbm93IGhhdmUgZmJjb24gd29ya2luZywgSSBoYWQg
Zm9yZ290dGVuIHRvIGFkZAo+PiBlbmFibGVfdHZvdXQ9MSBhbmQgSSBoYWQgZGlzYWJsZV9md19r
bXNfc2V0dXA9MSB3aGljaCBkaXNhYmxlcyB0aGUKPj4gdmlkZW89IG1vZGUgb24gdGhlIGtlcm5l
bCBjb21tYW5kbGluZS4KPj4KPj4gbW9kZXRlc3Qgc3RpbGwgZmFpbHMgdGhvdWdoLCBhZnRlciBh
bG90IG9mIHByaW50ayBzcHJpbmtsaW5nLCBJJ3ZlCj4+IHRyYWNrZWQgaXQgZG93biB0byB0aGUg
ZHJtX21vZGVfZXF1YWwgdGVzdCBpbgo+PiBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZf
Y2hlY2soKS4gVGhlIGFzcGVjdCByYXRpb3MgZGlmZmVyOgo+Pgo+PiBbICAgNjEuMzM2Mjk1XSBk
cm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfdHZfY2hlY2s6Cj4+IG1vZGUtPnBpY3R1cmVfYXNw
ZWN0X3JhdGlvPTEKPj4gWyAgIDYxLjMzNjMwMV0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3R2X2NoZWNrOgo+PiAmY3J0Y19zdGF0ZS0+bW9kZS0+cGljdHVyZV9hc3BlY3RfcmF0aW89MAo+
IAo+IEkgaGF2ZW4ndCBzZWVuIHRoaXMgd2hlbiB0ZXN0aW5nLCBidXQgSSdsbCBoYXZlIGEgbG9v
aywgdGhhbmtzIQoKSSBoYXZlIGZvdW5kIHRoZSBjYXVzZSwgdGhlIGtlcm5lbCBzdHJpcHMgb2Zm
IHRoZSBhc3BlY3QgcmF0aW8gaW4KZHJtX21vZGVfZ2V0Y29ubmVjdG9yKCkgaWYgZHJtX2ZpbGUt
PmFzcGVjdF9yYXRpb19hbGxvd2VkIGlzIGZhbHNlLiBTbyBJCnRoaW5rIHRoZSBkcm1fbW9kZV9l
cXVhbCgpIHRlc3QgbmVlZHMgdG8gYmUgcmVsYXhlZCBmb3IKbGVnYWN5L25vbi1hdG9taWMgdXNl
cnNwYWNlIHRvIHdvcmsuCgpJZiBJIHVzZSBtb2RldGVzdCB3aXRoIGF0b21pYyBjb21taXQgKC1h
KSBpdCB3b3JrcyBhcyBpcywgaGF2aW5nIHRoZQpkcm1fbW9kZV9lcXVhbCgpIHRlc3Q6CgokIG1v
ZGV0ZXN0IC1NIHZjNCAtYSAtUCA2MUA2ODo3MjB4NDgwIC1zIDQ1OjcyMHg0ODBpCgpJIGhhdmUg
YSBwcm9ibGVtIGJlY2F1c2UgdGhlIGJvYXJkIGhhbmdzLCBlaXRoZXIgcmlnaHQgYXdheSBvciBh
ZnRlciBJCnByZXNzIDxlbnRlcj4gdG8gcXVpdCBtb2RldGVzdC4KCkkgb2Z0ZW4gZ2V0IHRoaXMs
IHNvbWV0aW1lcyBhZnRlciAxMHMgb2Ygc2Vjb25kczoKClsgIDEzNi44MjI5NjNdIFVuaGFuZGxl
ZCBmYXVsdDogYXN5bmNocm9ub3VzIGV4dGVybmFsIGFib3J0ICgweDEyMTEpIGF0CjB4MDAwMDAw
MDAKLi4uClsgIDEzNy4yNDg0OTZdICBiY20yNzExX2dldF90ZW1wIFtiY20yNzExX3RoZXJtYWxd
IGZyb20KdGhlcm1hbF96b25lX2dldF90ZW1wKzB4NTQvMHg3NAoKVW5sb2FkaW5nIGJjbTI3MTFf
dGhlcm1hbCBkaWRuJ3QgaGVscCwgaW4gdGhhdCBjYXNlIEkgZ290IG5vdGhpbmcsIHNvCnRoZSBw
cm9ibGVtIGxpZXMgZWxzZXdoZXJlLgpJIGhhdmUgZXZlbiB0cmllZCB3aXRoIGEgZnJlc2ggU0Qg
aW1hZ2UgYW5kIGEgZnJlc2gga2VybmVsLCBidXQgaXQKZGlkbid0IGhlbHAuCgpJIGNhbiBzd2l0
Y2ggZnJvbSBOVFNDIHRvIFBBTCBsaWtlIHRoaXMgKGJ1dCBpdCBzdGlsbCBjcmFzaGVzKToKCiQg
bW9kZXRlc3QgLU0gdmM0IC1hIC13IDQ1OiJ0diBub3JtIjoxNiAtUCA2MUA2ODo3MjB4NTc2IC1z
IDQ1OjcyMHg1NzZpCgpJIGhhZCB0byBwYXRjaCBtb2RldGVzdCBmb3IgdGhhdCB0byB3b3JrOgoK
ZGlmZiAtLWdpdCBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVzdC9t
b2RldGVzdC5jCmluZGV4IDhmZjZjODBkLi5hY2NkMjE2NiAxMDA2NDQKLS0tIGEvdGVzdHMvbW9k
ZXRlc3QvbW9kZXRlc3QuYworKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC0yMTg4
LDEyICsyMTg3LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAlkdW1wX3Jl
c291cmNlKCZkZXYsIHBsYW5lcyk7CiAJZHVtcF9yZXNvdXJjZSgmZGV2LCBmcmFtZWJ1ZmZlcnMp
OwoKKwlpZiAoZGV2LnVzZV9hdG9taWMpCisJCWRldi5yZXEgPSBkcm1Nb2RlQXRvbWljQWxsb2Mo
KTsKKwogCWZvciAoaSA9IDA7IGkgPCBwcm9wX2NvdW50OyArK2kpCiAJCXNldF9wcm9wZXJ0eSgm
ZGV2LCAmcHJvcF9hcmdzW2ldKTsKCiAJaWYgKGRldi51c2VfYXRvbWljKSB7Ci0JCWRldi5yZXEg
PSBkcm1Nb2RlQXRvbWljQWxsb2MoKTsKLQogCQlpZiAoc2V0X3ByZWZlcnJlZCB8fCAoY291bnQg
JiYgcGxhbmVfY291bnQpKSB7CiAJCQl1aW50NjRfdCBjYXAgPSAwOwoKCkkgdXNlIGEgY29tcG9z
aXRlIHRvIFVTQiBhZGFwdGVyIHRvIHNlZSB0aGUgb3V0cHV0OgpodHRwczovL3d3dy5hZGFmcnVp
dC5jb20vcHJvZHVjdC80NzE1CgpOb3JhbGYuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
