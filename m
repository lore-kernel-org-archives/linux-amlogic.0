Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52349EB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FKdtYbFhXJ6xmABy1Gz6b0Z3yR3yYFqNqEtFYe9AJ8=; b=WKJNMHDai0TtH/
	oKsUx4iL8XHR13aQEGDTYmna8zxBn+jLWqSjtbxgBwlxEAp2qyrFJioMp02dxcTSsDTGkAWE8GWMD
	jEaZQ//5lud9fNGg7+rmN6+fo7PfcfD4afunatEPEAGwmskJQ9A4b+IayxvsJeY6WdnpVCr/a1Q1R
	RiX+lohyCmFE2L16Z8GIvLugG7+7sFGXnicaS6aKKl/9lqn54+Ots2ZOpVQtmha7537yV12cqHXRE
	K6o3ogm6DU3ApFFxc3VyPtd8cZsrBBz+bQ0AuRC/+ETzYEraiBHx3ByPXSpQsXIo1evGwZH9nOSL6
	0TSzLaHASCkSEWIjuAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGi14-00Dg5A-0o;
	Tue, 04 Jul 2023 15:32:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGi11-00Dg3I-14;
	Tue, 04 Jul 2023 15:32:32 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688484746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmZggtDAqIb+3H1DsPGwwstHZSthhYTo+MwlhjHAqx4=;
	b=bxCsWMXFWRSn3xc8vS5MZRFRhjSv4lVUq9yZ9VsYWfa5AuX342bdiV3TkSRHxUpB0L1zK1
	qDhQbAFUgylbk4X/p0Pn6souCDlx1rLvCd4cceP1NTvG9OR+uDywHn92+VnoHLmobYTiNg
	2vG70IOMxjhvxbujHZWZ+Vgfd1IDFcteMdffHBOkfyGcHJ0Syt1fmwjc5wq8ruz62HwWR4
	yG7DLXfuRwMrKP7/3qXA61FZZSDahDz9EkJIdROeeD0ZndkdfM7fbCMoUTu8DTjGOHq3dR
	da45tf+8+tJwZ6OLiHF+5w2RgI8aqVvexYC2g0QiW9LCpXKAyYiMlcdOmS/VCg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4787FF80F;
	Tue,  4 Jul 2023 15:32:24 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:32:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC
 step size
Message-ID: <20230704173223.771acd99@xps-13>
In-Reply-To: <e45afb19-d77b-6ef3-08bf-68e8626371be@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-3-AVKrasnov@sberdevices.ru>
	<20230704103617.4affae8a@xps-13>
	<9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
	<20230704114110.25ca9de4@xps-13>
	<aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
	<20230704115628.55320428@xps-13>
	<ee2eb73a-fb25-58ae-cf7e-83d971b7b8b2@sberdevices.ru>
	<20230704154106.5c5aafd8@xps-13>
	<e45afb19-d77b-6ef3-08bf-68e8626371be@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_083231_630905_4625F5BE 
X-CRM114-Status: GOOD (  28.74  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDQgSnVs
IDIwMjMgMTg6MDc6MDQgKzAzMDA6Cgo+IE9uIDA0LjA3LjIwMjMgMTY6NDEsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gICAKPiA+Pj4+Pj4gWWVzLCB0aGlzIGNvZGUg
bG9va3Mgc3RyYW5nZS4gJ25zZWN0b3JzJyBpcyB1c2VkIHRvIGNhbGN1bGF0ZSBzcGFjZSBpbiBP
T0IKPiA+Pj4+Pj4gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5IEVDQyBlbmdpbmUgKHRoaXMgdmFsdWUg
d2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2YWlsJwo+ID4+Pj4+PiB0byAnbmFuZF9lY2NfY2hvb3Nl
X2NvbmYoKScpLiBJZGVhIG9mIDUxMiBpcyB0byBjb25zaWRlciAid29yc3QiIGNhc2UKPiA+Pj4+
Pj4gZm9yIEVDQywgZS5nLiBtaW5pbWFsIG51bWJlciBvZiBieXRlcyBmb3IgRUNDIGVuZ2luZSAo
YW5kIGF0IHRoZSBzYW1lIHRpbWUKPiA+Pj4+Pj4gbWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRl
cykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAgc2l6ZSBpcyA1MTIsIHRoZW4gd2UKPiA+Pj4+Pj4g
aGF2ZSA0IHggMiBmcmVlIGJ5dGVzIGluIE9PQiAoaWYgc3RlcCBzaXplIGlmIDEwMjQgdGhlbiB3
ZSBoYXZlIDIgeCAyIGZyZWUKPiA+Pj4+Pj4gYnl0ZXMgaW4gT09CKS4KPiA+Pj4+Pj4KPiA+Pj4+
Pj4gSSB0aGluayB0aGlzIGNvZGUgY291bGQgYmUgcmV3b3JrZWQgaW4gdGhlIGZvbGxvd2luZyB3
YXk6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IGlmIEVDQyBzdGVwIHNpemUgaXMgYWxyZWFkeSBrbm93biBo
ZXJlIChmcm9tIERUUyksIGNhbGN1bGF0ZSAnbnNlY3RvcnMnIHVzaW5nCj4gPj4+Pj4+IGdpdmVu
IHZhbHVlIChkaXYgYnkgNTEyIGZvciBleGFtcGxlKS4gT3RoZXJ3aXNlIGNhbGN1bGF0ZSAnbnNl
Y3RvcnMnIGluIHRoZQo+ID4+Pj4+PiBjdXJyZW50IG1hbm5lcjogICAgICAKPiA+Pj4+Pgo+ID4+
Pj4+IEl0IHdpbGwgYWx3YXlzIGJlIGtub3duIHdoZW4gdGhlc2UgZnVuY3Rpb24gYXJlIHJ1bi4g
VGhlcmUgaXMgbm8KPiA+Pj4+PiBndWVzc2luZyBoZXJlLiAgICAgIAo+ID4+Pj4KPiA+Pj4+IEht
IEkgY2hlY2tlZCwgdGhhdCBidXQgaWYgc3RlcCBzaXplIGlzIG5vdCBzZXQgaW4gRFRTLCBoZXJl
IGl0IHdpbGwgYmUgMCwgCj4gPj4+PiB0aGVuIGl0IHdpbGwgYmUgc2VsZWN0ZWQgaW4gJ25hbmRf
ZWNjX2Nob29zZV9jb25mKCknIGFjY29yZGluZyBwcm92aWRlZCAnZWNjX2NhcHMnCj4gPj4+PiBh
bmQgJ29vYmF2YWlsJy4uLgo+ID4+Pj4KPiA+Pj4+IEFueXdheSwgSSdsbCBkbyB0aGUgZm9sbG93
aW5nIHRoaW5nOgo+ID4+Pj4KPiA+Pj4+IGludCBuc2VjdG9yczsKPiA+Pj4+Cj4gPj4+PiBpZiAo
bmFuZC0+ZWNjLnNpemUpCj4gPj4+PiAgICAgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIG5h
bmQtPmVjYy5zaXplOyA8LS0tIHRoaXMgaXMgZm9yIDUxMiBFQ0MgICAgCj4gPj4+Cj4gPj4+IFlv
dSBzaG91bGQgc2V0IG5hbmQtPmVjYy5zaXplIGluIC0+YXR0YWNoX2NoaXAoKSBpbnN0ZWFkLiAg
ICAKPiA+Pgo+ID4+IFNvcnJ5LCBkaWRuJ3QgZ2V0IGl0Li4uIGlmIEVDQyBzdGVwIHNpemUgaXMg
c2V0IGluIERUUywgdGhlbiBoZXJlLCBpbiBjaGlwIGF0dGFjaAo+ID4+IGNhbGxiYWNrIGl0IHdp
bGwgYmUgYWxyZWFkeSBrbm93biAoRFQgcGFydCB3YXMgcHJvY2Vzc2VkIGluICdyYXduYW5kX2R0
X2luaXQoKScpLgo+ID4+IElmIEVDQyBzdGVwIHNpemUgaXMgdW5rbm93biAoZS5nLiAwIGhlcmUp
LCAnbmFuZF9lY2NfY2hvb3NlX2NvbmYoKScgd2lsbCBzZXQgaXQKPiA+PiBhY2NvcmRpbmcgcHJv
dmlkZWQgZWNjIGNhcHMuIFdoYXQgZG8gWW91IG1lYW4gZm9yICJZb3Ugc2hvdWxkIHNldCAuLi4i
ID8gIAo+ID4gCj4gPiBUaGUgY3VycmVudCBhcHByb2FjaCBpcyB3cm9uZywgaXQgZGVjaWRlcyB0
aGUgbnVtYmVyIG9mIEVDQyBjaHVua3MKPiA+IChjYWxsZWQgbnNlY3RvcnMgaW4gdGhlIGRyaXZl
cikgYW5kIHRoZW4gYXNrcyB0aGUgY29yZSB0byBkZWNpZGUgdGhlCj4gPiBudW1iZXIgb2YgRUND
IGNodW5rcyB0byB1c2UuICAKPiAKPiBZZXMhIEkgd2FzIGFsc28gY29uZnVzZWQgYWJvdXQgdGhh
dC4KPiAKPiA+IAo+ID4gSnVzdCBwcm92aWRlIG10ZC0+b29ic2l6ZSAtIDIgYXMgbGFzdCBwYXJh
bWV0ZXIgYW5kIHRoZW4gcmVseSBvbiB0aGUKPiA+IGNvcmUncyBsb2dpYyB0byBmaW5kIHRoZSBy
aWdodCBFQ0Mgc3RlcC1zaXplL3N0cmVuZ3RoPwo+ID4gCj4gPiBUaGVyZSBpcyBubyBwb2ludCBp
biByZXF1ZXN0aW5nIGEgcGFydGljdWxhciBzdGVwIHNpemUgd2l0aG91dCBhCj4gPiBzcGVjaWZp
YyBzdHJlbmd0aCwgb3I/IFNvIEkgYmVsaWV2ZSB5b3Ugc2hvdWxkIHByb3ZpZGUgYm90aCBpbiB0
aGUgRFRTCj4gPiBpZiB5b3Ugd2FudCBwYXJ0aWN1bGFyIHBhcmFtZXRlcnMgdG8gYmUgYXBwbGll
ZCwgb3RoZXJ3aXNlIHlvdSBjYW4gbGV0Cj4gPiB0aGUgY29yZSBkZWNpZGUgd2hhdCBpcyBiZXN0
LiAgCj4gCj4gU28gSSB0aGluayB0aGlzIGNvdWxkIGJlIGEgc2VwYXJhdGVkIHBhdGNoIGFzIGl0
IGRvZXNuJ3QgcmVseSBvbiA1MTIgc3RlcCBzaXplIEVDQwo+IHN1cHBvcnQgZm9yIE1lc29uIGFu
ZCBtYXkgYmUgaXQgc2hvdWxkIGJlICJGaXgiIHRhZ2dlZC4KCll1cCEgVGhhbmtzIGZvciBjbGVh
bmluZyBzbyB0aG9yb3VnaGx5IHRoaXMgZHJpdmVyIDopCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
