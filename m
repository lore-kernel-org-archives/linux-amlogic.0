Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A98AC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpFGdV65BVOxDqflNGISXS3LAAIbrbNzkCNecuhd5gU=; b=Udejf0rg7XQTge
	7Gd3zHI7bwkc5e+Umc/dmZxbZAJjeKtqQTcGqHt3vtLJAynox4C3EdJmGYLu+nH3IWjVwaqLXjKX8
	zKDDWbugjiKdtuXS3v3XlgkmbXukuY5VmwF2ptb2pK5waDq3ZHAvmTZm5CedJ3h2T1IFpBk+/o+gw
	9T+ho85dUVsw+4AXiHbiFf7re7IEc5NMeSTLyt8fssWJreNKaRjIeynuZyppvO37Kjoj2Z7Sv/cg4
	1+RvBkYW9D773Z2n+Xu1ARG0heKwBpIF+SfOail8CHSA2oP3oTdBzJghm/BbW6JlDNidWHY3OXfrP
	mSMBBQODNILgLI6hXkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqJw-00000007H6A-46ky;
	Mon, 20 Jul 2026 15:54:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqJv-00000007H5o-3JfY
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:54:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F64C60254;
	Mon, 20 Jul 2026 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773541F000E9;
	Mon, 20 Jul 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784562858;
	bh=h4FtL+GwCY7Mo+W4nkJ1CUNyHo99Pgq0iuKUvWe5hNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcveVqC7Fgu3NEKvExRHo/w/gxLBE1kaLqLiFg1uNuhrCYPCD78scfcOdN6DIzVEB
	 Svw5cGQvBNW+Yfvr+RHLA5T8UzhpTX2oPn1wT1SKPJKl9dLd6tdwDoqEgtRjWoJ2v5
	 fCDLPchrOSFks4mpbuCW6E1iYo63m3GLApCauvxx8ORdIOHvX0C63Ex8tFdjASzE3A
	 fEf4VRqIwjtPNk4XYZ5N5HVTVoz7O7a08PDoLEG9CKEzAYe3PtwnSU1Eb8X2o4SC07
	 /rqW/i+42Hp1Zu+N3H4Es3ndto56dbneUc0Kus8tzUqb24C+rDPzZLkcttl8FdF+N5
	 M9lEpBET7OPyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 15:54:18 +0000
Message-Id: <20260720155418.773541F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gUmVtb3ZpbmcgZHJtX3Np
bXBsZV9lbmNvZGVyX2luaXQoKSBicmVha3MgdGhlIGJ1aWxkIGZvciB0aGUgZ21hNTAwIGRyaXZl
ciwgd2hpY2ggc3RpbGwgaGFzIHVuY29udmVydGVkIGNhbGxlcnMuCi0gW0xvd10gVGhlIHRhc2sg
dG8gcmVtb3ZlIGBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpYCBpcyBzdGlsbCBsaXN0ZWQgaW4g
dGhlIEdQVSBUT0RPIGxpc3QsIGxlYXZpbmcgdGhlIGRvY3VtZW50YXRpb24gc3RhbGUuCi0tCgot
LS0gUGF0Y2ggWzE0XTogW1BBVENIIHYyIDE0LzE1XSBkcm0vZHJtX3NpbXBsZTogcmVtb3ZlIGRl
cHJlY2F0ZWQgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQgZnVuY3Rpb24gLS0tCmNvbW1pdCAwMTcx
NDBkZDhhMDVkNDczY2I2MWY4OTdkYjkwZDgyNzE0MGQ3NmZjCkF1dGhvcjogRGlvZ28gU2lsdmEg
PGRpb2dvbXBhaXNzaWx2YUBnbWFpbC5jb20+Cgpkcm0vZHJtX3NpbXBsZTogcmVtb3ZlIGRlcHJl
Y2F0ZWQgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQgZnVuY3Rpb24KClRoZSBzaW1wbGUgS01TIGhl
bHBlcnMgYXJlIGRlcHJlY2F0ZWQgYmVjYXVzZSB0aGV5IG9ubHkgYWRkIGFuCmludGVybWVkaWF0
ZSBsYXllciBiZXR3ZWVuIGRyaXZlcnMgYW5kIGF0b21pYyBtb2Rlc2V0dGluZy4KCkFsbCBkcml2
ZXIgdXNlcnMgb2YgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBoYXZlIGJlZW4gY29udmVydGVk
IHRvCmRybV9lbmNvZGVyX2luaXQoKS4gRHJvcCB0aGUgaGVscGVyIGFuZCBvcGVuLWNvZGUgaXRz
IHJlbWFpbmluZyBpbnRlcm5hbAp1c2UgaW4gZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfaW5pdCgp
IHRvIHByZXZlbnQgbmV3IHVzZXJzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9zaW1wbGVfa21zX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hl
bHBlci5jCj4gaW5kZXggOGUxZDA3YjlmMWUzMC4uNzg3OGI5ZDdkNTI0OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMKPiBAQCAtMjAsMTYgKzIwLDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBkcm1fc2ltcGxlX2VuY29kZXJfZnVu
Y3NfY2xlYW51cCA9IHsKPiAgCS5kZXN0cm95ID0gZHJtX2VuY29kZXJfY2xlYW51cCwKPiAgfTsK
PiAgCj4gLWludCBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+IC0JCQkgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+IC0JCQkgICAgaW50IGVu
Y29kZXJfdHlwZSkKPiAtewo+IC0JcmV0dXJuIGRybV9lbmNvZGVyX2luaXQoZGV2LCBlbmNvZGVy
LAo+IC0JCQkJJmRybV9zaW1wbGVfZW5jb2Rlcl9mdW5jc19jbGVhbnVwLAo+IC0JCQkJZW5jb2Rl
cl90eXBlLCBOVUxMKTsKPiAtfQo+IC1FWFBPUlRfU1lNQk9MKGRybV9zaW1wbGVfZW5jb2Rlcl9p
bml0KTsKCltTZXZlcml0eTogTG93XQpEb2VzIHJlbW92aW5nIHRoaXMgaGVscGVyIGJyZWFrIHRo
ZSBidWlsZCBmb3IgdGhlIGdtYTUwMCBkcml2ZXI/CgpUaGUgY29tbWl0IG1lc3NhZ2Ugc3RhdGVz
IHRoYXQgYWxsIGRyaXZlciB1c2VycyBoYXZlIGJlZW4gY29udmVydGVkLCBidXQKaXQgbG9va3Mg
bGlrZSB0aGUgZ21hNTAwIGRyaXZlciBzdGlsbCBoYXMgdW5jb252ZXJ0ZWQgY2FsbGVycy4KCkZv
ciBleGFtcGxlLCBpbiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9jcnQuYzpjZHZf
aW50ZWxfY3J0X2luaXQoKToKCiAgICByZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChkZXYs
IGVuY29kZXIsIERSTV9NT0RFX0VOQ09ERVJfREFDKTsKCmFuZCBpbiBkcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2Nkdl9pbnRlbF9kcC5jOmNkdl9pbnRlbF9kcF9pbml0KCk6CgogICAgZHJtX3NpbXBs
ZV9lbmNvZGVyX2luaXQoZGV2LCBlbmNvZGVyLCBEUk1fTU9ERV9FTkNPREVSX1RNRFMpOwoKUmVt
b3ZpbmcgdGhlIGRlZmluaXRpb24gYW5kIGRlY2xhcmF0aW9uIGhlcmUgY2F1c2VzIGltcGxpY2l0
IGZ1bmN0aW9uCmRlY2xhcmF0aW9uIGFuZCB1bmRlZmluZWQgcmVmZXJlbmNlIGVycm9ycyB3aGVu
IGJ1aWxkaW5nIHdpdGgKQ09ORklHX0RSTV9HTUE1MDAgZW5hYmxlZC4KCkFsc28sIHRoaXMgaXNu
J3QgYSBidWcsIGJ1dCBzaG91bGQgdGhlIHRhc2sgdG8gcmVtb3ZlCmRybV9zaW1wbGVfZW5jb2Rl
cl9pbml0KCkgYmUgcmVtb3ZlZCBmcm9tIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmFzIHdl
bGwsIHNpbmNlIHRoaXMgcGF0Y2ggY29tcGxldGVzIHRoYXQgdGFzaz8KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjAtZHJtX3Np
bXBsZV9lbmNvZGVyX2luaXQtdjItMC01MDIwYjYzMDY2OGFAZ21haWwuY29tP3BhcnQ9MTQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
