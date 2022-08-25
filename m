Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF1ECAA27
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiWZNrAqmxVcLdM0nEHKmvi9ixN5qDzpl5K95r8hvOE=; b=TUMhUuw79BmgNt
	VmarHMNeSwDuI3bSF/1uCWg6wUXAvBwKkcFeu8tfqlR6udYQZNR1rtWPFchsH2swZgAeyG0lG7dYI
	jAigS350gB6KCbI4C4rCQLHF6ELURpYb44PIwPNL1ICUop+CRqCwFoq6Zv1fuEdF4/0/gqoGoSLWC
	+m+8DfhtoeijNoePtLPdaeB58HGQ0jgQ6FGUZ+cqOgCrZ5tjo60xYUZsHeRlQaVwTtfY/bxCb41sA
	p0gJeOd9Zksvc++N5mv8YdLlqirErIZEouI2B6CLSx9cVfYEd3DyDNGaQ3By9wIgr481MmDPaTyIY
	gpypD/Ez827MvaDjzJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIex-002lUm-TE; Thu, 25 Aug 2022 19:36:59 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIek-002lOX-If; Thu, 25 Aug 2022 19:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hNcXx9nN3QJm/KwwCuUmxJMM/1rNwvQsLqXj+GDGgR0=; b=iAUKq3byUHJUQwjEQdZa4HBdm+
	TnfaOzLFJUDgeEpKCKO7CR9l31QS6Y2TXLx4DoFuYrKWIC4U2+1whY9M0Ya8Eqwj2bvuceT6a7eUh
	snsQja2LrBdkoQsAzUMoXYkjsFgbTxRikuj7dBpISa9HVStMVuOMUkWpV9n4FYoRhbj+cWYUqOhrm
	0f6lxRNMD1+HBAcD2tQz4QuLakPByIEbiEE9cLt2iZQVyp4LxiQlASHmFPyNTfdM+HXDiXxr2L/8+
	+orYmoEZ4/+KkxlQIGBEaFLbduE06L0rynjVgF/4aQ7JsX56hYzkrEls1sJSbV0B1wAZNjC+cnBND
	FTfSSQwQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=57533)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oRIeg-000615-7S; Thu, 25 Aug 2022 21:36:42 +0200
Message-ID: <32c0b057-02fe-4818-7020-7b8f4942aed6@tronnes.org>
Date: Thu, 25 Aug 2022 21:36:35 +0200
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
 <2f279dd9-9a6b-8bd2-9d54-b7bd39852ba9@tronnes.org>
 <20220825162140.oaob4szbssf6cuvq@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220825162140.oaob4szbssf6cuvq@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_123646_662432_3D2C31C3 
X-CRM114-Status: GOOD (  22.88  )
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

CgpEZW4gMjUuMDguMjAyMiAxOC4yMSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBPbiBNb24sIEF1
ZyAyMiwgMjAyMiBhdCAwMzoyMToyOVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Cj4+Cj4+IERlbiAyMi4wOC4yMDIyIDA5LjQ4LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4gSGks
Cj4+Pgo+Pj4gT24gU3VuLCBBdWcgMjEsIDIwMjIgYXQgMDY6MzM6MTJQTSArMDIwMCwgTm9yYWxm
IFRyw7hubmVzIHdyb3RlOgo+Pj4+IERlbiAyOS4wNy4yMDIyIDE4LjM0LCBza3JldiBNYXhpbWUg
UmlwYXJkOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gSGVyZSdzIGEgc2VyaWVzIGFpbWluZyBhdCBp
bXByb3ZpbmcgdGhlIGNvbW1hbmQgbGluZSBuYW1lZCBtb2RlcyBzdXBwb3J0LAo+Pj4+PiBhbmQg
bW9yZSBpbXBvcnRhbnRseSBob3cgd2UgZGVhbCB3aXRoIGFsbCB0aGUgYW5hbG9nIFRWIHZhcmlh
bnRzLgo+Pj4+Pgo+Pj4+PiBUaGUgbmFtZWQgbW9kZXMgc3VwcG9ydCB3ZXJlIGluaXRpYWxseSBp
bnRyb2R1Y2VkIHRvIGFsbG93IHRvIHNwZWNpZnkgdGhlCj4+Pj4+IGFuYWxvZyBUViBtb2RlIHRv
IGJlIHVzZWQuCj4+Pj4+Cj4+Pj4+IEhvd2V2ZXIsIHRoaXMgd2FzIGNhdXNpbmcgbXVsdGlwbGUg
aXNzdWVzOgo+Pj4+Pgo+Pj4+PiAgICogVGhlIG1vZGUgbmFtZSBwYXJzZWQgb24gdGhlIGNvbW1h
bmQgbGluZSB3YXMgcGFzc2VkIGRpcmVjdGx5IHRvIHRoZQo+Pj4+PiAgICAgZHJpdmVyLCB3aGlj
aCBoYWQgdG8gZmlndXJlIG91dCB3aGljaCBtb2RlIGl0IHdhcyBzdXBwb3NlIHRvIG1hdGNoOwo+
Pj4+Pgo+Pj4+PiAgICogRmlndXJpbmcgdGhhdCBvdXQgd2Fzbid0IHJlYWxseSBlYXN5LCBzaW5j
ZSB0aGUgdmlkZW89IGFyZ3VtZW50IG9yIHdoYXQKPj4+Pj4gICAgIHRoZSB1c2Vyc3BhY2UgbWln
aHQgbm90IGV2ZW4gaGF2ZSBhIG5hbWUgaW4gdGhlIGZpcnN0IHBsYWNlLCBidXQKPj4+Pj4gICAg
IGluc3RlYWQgY291bGQgaGF2ZSBwYXNzZWQgYSBtb2RlIHdpdGggdGhlIHNhbWUgdGltaW5nczsK
Pj4+Pj4KPj4+Pj4gICAqIFRoZSBmYWxsYmFjayB0byBtYXRjaGluZyBvbiB0aGUgdGltaW5ncyB3
YXMgbW9zdGx5IHdvcmtpbmcgYXMgbG9uZyBhcwo+Pj4+PiAgICAgd2Ugd2VyZSBzdXBwb3J0aW5n
IG9uZSA1MjUgbGluZXMgKG1vc3QgbGlrZWx5IE5TVEMpIGFuZCBvbmUgNjI1IGxpbmVzCj4+Pj4+
ICAgICAoUEFMKSwgYnV0IGNvdWxkbid0IGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0d28gbW9kZXMg
d2l0aCB0aGUgc2FtZQo+Pj4+PiAgICAgdGltaW5ncyAoTlRTQyB2cyBQQUwtTSB2cyBOU1RDLUog
Zm9yIGV4YW1wbGUpOyAKPj4+Pj4KPj4+Pj4gICAqIFRoZXJlIHdhcyBhbHNvIHNvbWUgb3Zlcmxh
cCB3aXRoIHRoZSB0diBtb2RlIHByb3BlcnR5IHJlZ2lzdGVyZWQgYnkgCj4+Pj4+ICAgICBkcm1f
bW9kZV9jcmVhdGVfdHZfcHJvcGVydGllcygpLCBidXQgbmFtZWQgbW9kZXMgd2VyZW4ndCBpbnRl
cmFjdGluZwo+Pj4+PiAgICAgd2l0aCB0aGF0IHByb3BlcnR5IGF0IGFsbC4KPj4+Pj4KPj4+Pj4g
ICAqIEV2ZW4gdGhvdWdoIHRoYXQgcHJvcGVydHkgd2FzIGdlbmVyaWMsIGl0cyBwb3NzaWJsZSB2
YWx1ZXMgd2VyZQo+Pj4+PiAgICAgc3BlY2lmaWMgdG8gZWFjaCBkcml2ZXJzLCB3aGljaCBtYWRl
IHNvbWUgZ2VuZXJpYyBzdXBwb3J0IGRpZmZpY3VsdC4KPj4+Pj4KPj4+Pj4gVGh1cywgSSBjaG9z
ZSB0byB0YWNrbGUgaW4gbXVsdGlwbGUgc3RlcHM6Cj4+Pj4+Cj4+Pj4+ICAgKiBBIG5ldyBUViBu
b3JtIHByb3BlcnR5IHdhcyBpbnRyb2R1Y2VkLCB3aXRoIGdlbmVyaWMgdmFsdWVzLCBlYWNoIGRy
aXZlcgo+Pj4+PiAgICAgcmVwb3J0aW5nIHRocm91Z2ggYSBiaXRtYXNrIHdoYXQgc3RhbmRhcmQg
aXQgc3VwcG9ydHMgdG8gdGhlIHVzZXJzcGFjZTsKPj4+Pj4KPj4+Pj4gICAqIFRoaXMgb3B0aW9u
IHdhcyBhZGRlZCB0byB0aGUgY29tbWFuZCBsaW5lIHBhcnNpbmcgY29kZSB0byBiZSBhYmxlIHRv
Cj4+Pj4+ICAgICBzcGVjaWZ5IGl0IG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLCBhbmQgbmV3
IGF0b21pY19jaGVjayBhbmQgcmVzZXQKPj4+Pj4gICAgIGhlbHBlcnMgd2VyZSBjcmVhdGVkIHRv
IGludGVncmF0ZSBwcm9wZXJseSBpbnRvIGF0b21pYyBLTVM7Cj4+Pj4+Cj4+Pj4+ICAgKiBUaGUg
bmFtZWQgbW9kZSBwYXJzaW5nIGNvZGUgaXMgbm93IGNyZWF0aW5nIGEgcHJvcGVyIGRpc3BsYXkg
bW9kZSBmb3IKPj4+Pj4gICAgIHRoZSBnaXZlbiBuYW1lZCBtb2RlLCBhbmQgdGhlIFRWIHN0YW5k
YXJkIHdpbGwgdGh1cyBiZSBwYXJ0IG9mIHRoZQo+Pj4+PiAgICAgY29ubmVjdG9yIHN0YXRlOwo+
Pj4+Pgo+Pj4+PiAgICogVHdvIGRyaXZlcnMgd2VyZSBjb252ZXJ0ZWQgYW5kIHRlc3RlZCBmb3Ig
bm93ICh2YzQgYW5kIHN1bjRpKSwgd2l0aAo+Pj4+PiAgICAgc29tZSBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IGNvZGUgdG8gdHJhbnNsYXRlIHRoZSBvbGQgVFYgbW9kZSB0byB0aGUKPj4+Pj4gICAg
IG5ldyBUViBtb2RlOwo+Pj4+Pgo+Pj4+PiBVbml0IHRlc3RzIHdlcmUgY3JlYXRlZCBhbG9uZyB0
aGUgd2F5LiBOb3V2ZWF1LCBjaDcwMDYgYW5kIGd1ZCBhcmUKPj4+Pj4gY3VycmVudGx5IGJyb2tl
biBmb3Igbm93IHNpbmNlIEkgZXhwZWN0IHRoYXQgd29yayB0byBiZSByZXdvcmtlZCBmYWlybHkK
Pj4+Pj4gc2lnbmlmaWNhbnRseS4gSSdtIGFsc28gbm90IGVudGlyZWx5IHN1cmUgYWJvdXQgaG93
IHRvIG1pZ3JhdGUgR1VEIHRvIHRoZQo+Pj4+PiBuZXcgcHJvcGVydHkuCj4+Pj4+Cj4+Pj4+IExl
dCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLAo+Pj4+PiBNYXhpbWUKPj4+Pj4KPj4+Pgo+Pj4+IEkg
ZG9uJ3Qga25vdyBpZiBpdCdzIHJlbGF0ZWQgdG8gdGhpcyBwYXRjaHNldCBvciBub3QsIGJ1dCBJ
IGRvIGdldCB0aGlzOgo+Pj4+Cj4+Pj4gcGlAcGk0dDp+ICQgc3VkbyBkbWVzZyAtQyAmJiBzdWRv
IG1vZHByb2JlIC1yIHZjNCAmJiBzdWRvIG1vZHByb2JlIHZjNAo+Pj4+ICYmIGRtZXNnCj4+Pj4g
WyAgNDMwLjA2NjIxMV0gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBkdW1teSBkZXZpY2Ug
ODB4MzAKPj4+PiBbICA0MzEuMjk0Nzg4XSB2YzQtZHJtIGdwdTogYm91bmQgZmU0MDAwMDAuaHZz
IChvcHMgdmM0X2h2c19vcHMgW3ZjNF0pCj4+Pj4gWyAgNDMxLjI5NTExNV0gdmM0LWRybSBncHU6
IGJvdW5kIGZlYzEzMDAwLnZlYyAob3BzIHZjNF92ZWNfb3BzIFt2YzRdKQo+Pj4+IFsgIDQzMS4y
OTU0NjddIHZjNC1kcm0gZ3B1OiBib3VuZCBmZTAwNDAwMC50eHAgKG9wcyB2YzRfdHhwX29wcyBb
dmM0XSkKPj4+PiBbICA0MzEuMjk1ODA0XSB2YzQtZHJtIGdwdTogYm91bmQgZmVjMTIwMDAucGl4
ZWx2YWx2ZSAob3BzIHZjNF9jcnRjX29wcwo+Pj4+IFt2YzRdKQo+Pj4+IFsgIDQzMS4yOTg4OTVd
IFtkcm1dIEluaXRpYWxpemVkIHZjNCAwLjAuMCAyMDE0MDYxNiBmb3IgZ3B1IG9uIG1pbm9yIDAK
Pj4+PiBbICA0NDEuNDQ0MjUwXSB2YzQtZHJtIGdwdTogW2RybV0gKkVSUk9SKiBbQ1JUQzo2ODpj
cnRjLTFdIGZsaXBfZG9uZQo+Pj4+IHRpbWVkIG91dAo+Pj4+IFsgIDQ0MS40NDY1MjldIENvbnNv
bGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSA5MHgzMAo+Pj4+IFsg
IDQ1MS42ODQzMjFdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBv
dXQKPj4+PiBbICA0NTEuNjg0MzQ3XSB2YzQtZHJtIGdwdTogW2RybV0gKkVSUk9SKiBbQ1JUQzo2
ODpjcnRjLTFdIGNvbW1pdCB3YWl0Cj4+Pj4gdGltZWQgb3V0Cj4+Pj4gWyAgNDYxLjkyNDI1NV0g
dmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiogZmxpcF9kb25lIHRpbWVkIG91dAo+Pj4+IFsgIDQ2
MS45MjQyODFdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIFtDT05ORUNUT1I6NDU6Q29tcG9z
aXRlLTFdCj4+Pj4gY29tbWl0IHdhaXQgdGltZWQgb3V0Cj4+Pj4gWyAgNDcyLjE2NDAwNl0gdmM0
LWRybSBncHU6IFtkcm1dICpFUlJPUiogZmxpcF9kb25lIHRpbWVkIG91dAo+Pj4+IFsgIDQ3Mi4x
NjQwMzFdIHZjNC1kcm0gZ3B1OiBbZHJtXSAqRVJST1IqIFtQTEFORTo2MTpwbGFuZS0xXSBjb21t
aXQgd2FpdAo+Pj4+IHRpbWVkIG91dAo+Pj4+IFsgIDQ4Mi40MDM4NzddIHZjNC1kcm0gZ3B1OiBb
ZHJtXSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBvdXQKPj4+PiBbICA0ODIuNDAzOTAzXSB2YzQt
ZHJtIGdwdTogW2RybV0gKkVSUk9SKiBUaW1lZCBvdXQgd2FpdGluZyBmb3IgY29tbWl0Cj4+Pj4g
WyAgNDkyLjY0Mzc5OV0gdmM0LWRybSBncHU6IFtkcm1dICpFUlJPUiogW0NSVEM6Njg6Y3J0Yy0x
XSBmbGlwX2RvbmUKPj4+PiB0aW1lZCBvdXQKPj4+PiBbICA0OTIuNjQ3MDczXSB2YzQtZHJtIGdw
dTogW2RybV0gZmIwOiB2YzRkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlCj4+Pgo+Pj4gTW9kdWxl
IHVubG9hZGluZy9yZWxvYWRpbmcgaGFzIGJlZW4gamFua3kgZm9yIGEgd2hpbGUuCj4+Pgo+Pj4g
SSd2ZSBmaXhlZCBpdCB1cCByZWNlbnRseSBidXQgaXQgZG9lc24ndCBzdXJwcmlzZSBtZSB0aGF0
IHRoZXJlJ3Mgc3RpbGwKPj4+IHNvbWUgc2l0dWF0aW9uIHRoYXQgd29uJ3Qgd29yay4gSXMgaXQg
b24gYSBQaTM/Cj4+Pgo+Pgo+PiBJdCdzIGEgUGk0Lgo+IAo+IFdpdGggd2hpY2gga2VybmVsPyBJ
IGp1c3QgdGVzdGVkIGl0IG9uIGxhc3QgbmV4dCBhbmQgaXQgc2VlbXMgdG8gd29yayBvawo+IHRo
ZXJlLiBJJ3ZlIGZpeGVkIGl0IHJlY2VudGx5IHRob3VnaCwgc28gaXQncyBvbmx5IGluIGRybS1t
aXNjLW5leHQgYW5kCj4gbGludXgtbmV4dCBhdCB0aGUgbW9tZW50Lgo+IAoKSSdtIG9uIGEgd2Vl
ayBvbGQgZHJtLW1pc2MtbmV4dC4KCldoYXQncyB5b3VyIHNldHVwIHNvIEkgY2FuIHRyeSB0aGF0
LgoKVGhpcyBpcyBtaW5lOgpodHRwczovL2dpc3QuZ2l0aHViLmNvbS9ub3Ryby80MWM1OWQ3N2Mz
MDIyZGM2ZDkzMWQ0Zjk1NDdjNGVhNgoKSSBjYW4ndCBzZWUgYW55dGhpbmcgdGhhdCBzaG91bGQg
ZGlmZmVyIHNpZ25pZmljYW50bHkgZnJvbSB3aGF0IHlvdQpjb3VsZCBoYXZlIGRvbmUuIE9ubHkg
bWF5YmUgdGhhdCBJIHVzZSB0aGUgbGF0ZXN0IGZpcm13YXJlIGFuZCBwZXJoYXBzCnlvdSd2ZSBn
b3QgYSA2NC1iaXQga2VybmVsLgoKTm9yYWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
