Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E5C28D13
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Aug 2022 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WyQWBn9w3Wn0Rldwpx9MieMFcwWJgfkCURxhRvtQ/I=; b=G+2mHCH684/0+X
	Fr1ED6Y3ElrCxWUyo0PW1AiOEZI0KB5d5/f3Jrz3goheJl0Q6OReebDO1lO95X2bncKzroTQGEQxb
	UM8Oe0JdvFPg6toPecqzsYAFRQT5UmZk1iGosL6Ze7JjpXYoFm7mWZAbuJUszSoNZ050j6FarEk7I
	SwF5wgGKGXaWlY1BE1Uykp1ZJexdxwrk8li1PQiYb90J9bHqOk+5bax8zxel4AF7spHLkGNwLbM4O
	CBebU5nbOtqyQWZin/p4/g/MmMXVsTN4//5VEk3XZfBIKIenTfEQIZZdRSeL9tCFKmbmkrcgxXj56
	l36CNhgySWbHlTIOSZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7NV-009tvN-Vk; Mon, 22 Aug 2022 13:22:06 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7NC-009tRP-5M; Mon, 22 Aug 2022 13:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5/IQY2bAacxoEKLBSNxpFWEsMzg1UnOO/FjIDvTzAwo=; b=OA/E1SvlGVwMNSen7gQbYjjgVy
	r/vYJH0+bwsw9uE9wnIU1e7D4VYlZHLOuuAXSNSLElI5U6IVlKtgQfoqzW+ZdQn4N+idseDPAZfm6
	kGTOzmS5vA/yHWodp75z9wg4qr8k/HusEctZz4XXOHuyWuYid/mo61S0WAnx+iuK0ADGqSFBiSaar
	ZpWaWmTGU0PVtxNEKDcNw0FsECmofbbndMo/FtxUN9B3GAEOgPF3sYYPb/rV6Sc15pfJPfuFfY8kz
	24QUHp8XvGJqbiyKzUzAXjPL2yCPH1Br4B0mlWOPkpDGwGK/KeyyGQfz3stJNz9fZlEVeqTI1rM/u
	dJrEYauA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=58561)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oQ7N2-000391-S8; Mon, 22 Aug 2022 15:21:36 +0200
Message-ID: <2f279dd9-9a6b-8bd2-9d54-b7bd39852ba9@tronnes.org>
Date: Mon, 22 Aug 2022 15:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
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
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220822074800.qzyctchqn5usr55g@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_062146_246625_3DA846D7 
X-CRM114-Status: GOOD (  20.00  )
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

CgpEZW4gMjIuMDguMjAyMiAwOS40OCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSwKPiAKPiBP
biBTdW4sIEF1ZyAyMSwgMjAyMiBhdCAwNjozMzoxMlBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+IERlbiAyOS4wNy4yMDIyIDE4LjM0LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4g
SGksCj4+Pgo+Pj4gSGVyZSdzIGEgc2VyaWVzIGFpbWluZyBhdCBpbXByb3ZpbmcgdGhlIGNvbW1h
bmQgbGluZSBuYW1lZCBtb2RlcyBzdXBwb3J0LAo+Pj4gYW5kIG1vcmUgaW1wb3J0YW50bHkgaG93
IHdlIGRlYWwgd2l0aCBhbGwgdGhlIGFuYWxvZyBUViB2YXJpYW50cy4KPj4+Cj4+PiBUaGUgbmFt
ZWQgbW9kZXMgc3VwcG9ydCB3ZXJlIGluaXRpYWxseSBpbnRyb2R1Y2VkIHRvIGFsbG93IHRvIHNw
ZWNpZnkgdGhlCj4+PiBhbmFsb2cgVFYgbW9kZSB0byBiZSB1c2VkLgo+Pj4KPj4+IEhvd2V2ZXIs
IHRoaXMgd2FzIGNhdXNpbmcgbXVsdGlwbGUgaXNzdWVzOgo+Pj4KPj4+ICAgKiBUaGUgbW9kZSBu
YW1lIHBhcnNlZCBvbiB0aGUgY29tbWFuZCBsaW5lIHdhcyBwYXNzZWQgZGlyZWN0bHkgdG8gdGhl
Cj4+PiAgICAgZHJpdmVyLCB3aGljaCBoYWQgdG8gZmlndXJlIG91dCB3aGljaCBtb2RlIGl0IHdh
cyBzdXBwb3NlIHRvIG1hdGNoOwo+Pj4KPj4+ICAgKiBGaWd1cmluZyB0aGF0IG91dCB3YXNuJ3Qg
cmVhbGx5IGVhc3ksIHNpbmNlIHRoZSB2aWRlbz0gYXJndW1lbnQgb3Igd2hhdAo+Pj4gICAgIHRo
ZSB1c2Vyc3BhY2UgbWlnaHQgbm90IGV2ZW4gaGF2ZSBhIG5hbWUgaW4gdGhlIGZpcnN0IHBsYWNl
LCBidXQKPj4+ICAgICBpbnN0ZWFkIGNvdWxkIGhhdmUgcGFzc2VkIGEgbW9kZSB3aXRoIHRoZSBz
YW1lIHRpbWluZ3M7Cj4+Pgo+Pj4gICAqIFRoZSBmYWxsYmFjayB0byBtYXRjaGluZyBvbiB0aGUg
dGltaW5ncyB3YXMgbW9zdGx5IHdvcmtpbmcgYXMgbG9uZyBhcwo+Pj4gICAgIHdlIHdlcmUgc3Vw
cG9ydGluZyBvbmUgNTI1IGxpbmVzIChtb3N0IGxpa2VseSBOU1RDKSBhbmQgb25lIDYyNSBsaW5l
cwo+Pj4gICAgIChQQUwpLCBidXQgY291bGRuJ3QgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHR3byBt
b2RlcyB3aXRoIHRoZSBzYW1lCj4+PiAgICAgdGltaW5ncyAoTlRTQyB2cyBQQUwtTSB2cyBOU1RD
LUogZm9yIGV4YW1wbGUpOyAKPj4+Cj4+PiAgICogVGhlcmUgd2FzIGFsc28gc29tZSBvdmVybGFw
IHdpdGggdGhlIHR2IG1vZGUgcHJvcGVydHkgcmVnaXN0ZXJlZCBieSAKPj4+ICAgICBkcm1fbW9k
ZV9jcmVhdGVfdHZfcHJvcGVydGllcygpLCBidXQgbmFtZWQgbW9kZXMgd2VyZW4ndCBpbnRlcmFj
dGluZwo+Pj4gICAgIHdpdGggdGhhdCBwcm9wZXJ0eSBhdCBhbGwuCj4+Pgo+Pj4gICAqIEV2ZW4g
dGhvdWdoIHRoYXQgcHJvcGVydHkgd2FzIGdlbmVyaWMsIGl0cyBwb3NzaWJsZSB2YWx1ZXMgd2Vy
ZQo+Pj4gICAgIHNwZWNpZmljIHRvIGVhY2ggZHJpdmVycywgd2hpY2ggbWFkZSBzb21lIGdlbmVy
aWMgc3VwcG9ydCBkaWZmaWN1bHQuCj4+Pgo+Pj4gVGh1cywgSSBjaG9zZSB0byB0YWNrbGUgaW4g
bXVsdGlwbGUgc3RlcHM6Cj4+Pgo+Pj4gICAqIEEgbmV3IFRWIG5vcm0gcHJvcGVydHkgd2FzIGlu
dHJvZHVjZWQsIHdpdGggZ2VuZXJpYyB2YWx1ZXMsIGVhY2ggZHJpdmVyCj4+PiAgICAgcmVwb3J0
aW5nIHRocm91Z2ggYSBiaXRtYXNrIHdoYXQgc3RhbmRhcmQgaXQgc3VwcG9ydHMgdG8gdGhlIHVz
ZXJzcGFjZTsKPj4+Cj4+PiAgICogVGhpcyBvcHRpb24gd2FzIGFkZGVkIHRvIHRoZSBjb21tYW5k
IGxpbmUgcGFyc2luZyBjb2RlIHRvIGJlIGFibGUgdG8KPj4+ICAgICBzcGVjaWZ5IGl0IG9uIHRo
ZSBrZXJuZWwgY29tbWFuZCBsaW5lLCBhbmQgbmV3IGF0b21pY19jaGVjayBhbmQgcmVzZXQKPj4+
ICAgICBoZWxwZXJzIHdlcmUgY3JlYXRlZCB0byBpbnRlZ3JhdGUgcHJvcGVybHkgaW50byBhdG9t
aWMgS01TOwo+Pj4KPj4+ICAgKiBUaGUgbmFtZWQgbW9kZSBwYXJzaW5nIGNvZGUgaXMgbm93IGNy
ZWF0aW5nIGEgcHJvcGVyIGRpc3BsYXkgbW9kZSBmb3IKPj4+ICAgICB0aGUgZ2l2ZW4gbmFtZWQg
bW9kZSwgYW5kIHRoZSBUViBzdGFuZGFyZCB3aWxsIHRodXMgYmUgcGFydCBvZiB0aGUKPj4+ICAg
ICBjb25uZWN0b3Igc3RhdGU7Cj4+Pgo+Pj4gICAqIFR3byBkcml2ZXJzIHdlcmUgY29udmVydGVk
IGFuZCB0ZXN0ZWQgZm9yIG5vdyAodmM0IGFuZCBzdW40aSksIHdpdGgKPj4+ICAgICBzb21lIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkgY29kZSB0byB0cmFuc2xhdGUgdGhlIG9sZCBUViBtb2RlIHRv
IHRoZQo+Pj4gICAgIG5ldyBUViBtb2RlOwo+Pj4KPj4+IFVuaXQgdGVzdHMgd2VyZSBjcmVhdGVk
IGFsb25nIHRoZSB3YXkuIE5vdXZlYXUsIGNoNzAwNiBhbmQgZ3VkIGFyZQo+Pj4gY3VycmVudGx5
IGJyb2tlbiBmb3Igbm93IHNpbmNlIEkgZXhwZWN0IHRoYXQgd29yayB0byBiZSByZXdvcmtlZCBm
YWlybHkKPj4+IHNpZ25pZmljYW50bHkuIEknbSBhbHNvIG5vdCBlbnRpcmVseSBzdXJlIGFib3V0
IGhvdyB0byBtaWdyYXRlIEdVRCB0byB0aGUKPj4+IG5ldyBwcm9wZXJ0eS4KPj4+Cj4+PiBMZXQg
bWUga25vdyB3aGF0IHlvdSB0aGluaywKPj4+IE1heGltZQo+Pj4KPj4KPj4gSSBkb24ndCBrbm93
IGlmIGl0J3MgcmVsYXRlZCB0byB0aGlzIHBhdGNoc2V0IG9yIG5vdCwgYnV0IEkgZG8gZ2V0IHRo
aXM6Cj4+Cj4+IHBpQHBpNHQ6fiAkIHN1ZG8gZG1lc2cgLUMgJiYgc3VkbyBtb2Rwcm9iZSAtciB2
YzQgJiYgc3VkbyBtb2Rwcm9iZSB2YzQKPj4gJiYgZG1lc2cKPj4gWyAgNDMwLjA2NjIxMV0gQ29u
c29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBkdW1teSBkZXZpY2UgODB4MzAKPj4gWyAgNDMxLjI5
NDc4OF0gdmM0LWRybSBncHU6IGJvdW5kIGZlNDAwMDAwLmh2cyAob3BzIHZjNF9odnNfb3BzIFt2
YzRdKQo+PiBbICA0MzEuMjk1MTE1XSB2YzQtZHJtIGdwdTogYm91bmQgZmVjMTMwMDAudmVjIChv
cHMgdmM0X3ZlY19vcHMgW3ZjNF0pCj4+IFsgIDQzMS4yOTU0NjddIHZjNC1kcm0gZ3B1OiBib3Vu
ZCBmZTAwNDAwMC50eHAgKG9wcyB2YzRfdHhwX29wcyBbdmM0XSkKPj4gWyAgNDMxLjI5NTgwNF0g
dmM0LWRybSBncHU6IGJvdW5kIGZlYzEyMDAwLnBpeGVsdmFsdmUgKG9wcyB2YzRfY3J0Y19vcHMK
Pj4gW3ZjNF0pCj4+IFsgIDQzMS4yOTg4OTVdIFtkcm1dIEluaXRpYWxpemVkIHZjNCAwLjAuMCAy
MDE0MDYxNiBmb3IgZ3B1IG9uIG1pbm9yIDAKPj4gWyAgNDQxLjQ0NDI1MF0gdmM0LWRybSBncHU6
IFtkcm1dICpFUlJPUiogW0NSVEM6Njg6Y3J0Yy0xXSBmbGlwX2RvbmUKPj4gdGltZWQgb3V0Cj4+
IFsgIDQ0MS40NDY1MjldIENvbnNvbGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVy
IGRldmljZSA5MHgzMAo+PiBbICA0NTEuNjg0MzIxXSB2YzQtZHJtIGdwdTogW2RybV0gKkVSUk9S
KiBmbGlwX2RvbmUgdGltZWQgb3V0Cj4+IFsgIDQ1MS42ODQzNDddIHZjNC1kcm0gZ3B1OiBbZHJt
XSAqRVJST1IqIFtDUlRDOjY4OmNydGMtMV0gY29tbWl0IHdhaXQKPj4gdGltZWQgb3V0Cj4+IFsg
IDQ2MS45MjQyNTVdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBv
dXQKPj4gWyAgNDYxLjkyNDI4MV0gdmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiogW0NPTk5FQ1RP
Ujo0NTpDb21wb3NpdGUtMV0KPj4gY29tbWl0IHdhaXQgdGltZWQgb3V0Cj4+IFsgIDQ3Mi4xNjQw
MDZdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBvdXQKPj4gWyAg
NDcyLjE2NDAzMV0gdmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiogW1BMQU5FOjYxOnBsYW5lLTFd
IGNvbW1pdCB3YWl0Cj4+IHRpbWVkIG91dAo+PiBbICA0ODIuNDAzODc3XSB2YzQtZHJtIGdwdTog
W2RybV0gKkVSUk9SKiBmbGlwX2RvbmUgdGltZWQgb3V0Cj4+IFsgIDQ4Mi40MDM5MDNdIHZjNC1k
cm0gZ3B1OiBbZHJtXSAqRVJST1IqIFRpbWVkIG91dCB3YWl0aW5nIGZvciBjb21taXQKPj4gWyAg
NDkyLjY0Mzc5OV0gdmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiogW0NSVEM6Njg6Y3J0Yy0xXSBm
bGlwX2RvbmUKPj4gdGltZWQgb3V0Cj4+IFsgIDQ5Mi42NDcwNzNdIHZjNC1kcm0gZ3B1OiBbZHJt
XSBmYjA6IHZjNGRybWZiIGZyYW1lIGJ1ZmZlciBkZXZpY2UKPiAKPiBNb2R1bGUgdW5sb2FkaW5n
L3JlbG9hZGluZyBoYXMgYmVlbiBqYW5reSBmb3IgYSB3aGlsZS4KPiAKPiBJJ3ZlIGZpeGVkIGl0
IHVwIHJlY2VudGx5IGJ1dCBpdCBkb2Vzbid0IHN1cnByaXNlIG1lIHRoYXQgdGhlcmUncyBzdGls
bAo+IHNvbWUgc2l0dWF0aW9uIHRoYXQgd29uJ3Qgd29yay4gSXMgaXQgb24gYSBQaTM/Cj4gCgpJ
dCdzIGEgUGk0LgoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
