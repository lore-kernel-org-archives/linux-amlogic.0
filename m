Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ADCC5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dipvlO031/oSQaRffeITfDHAhDLcD26kD2auTfLEPE=; b=iQ0wp6vpPnyyUT
	gkI2qknB++jmtdAQfPjm8D+rwEKFHpFvdiyp76h7RVnw+5yETYMt5gUF4hURGTDX/ZJ/RXfiT7j7B
	rEGly8KdqwKem9/MLWThxnNWkJRdRv8Lf0cFMq+IydOjroI0J/0NA2Fc5aHrZyqFu9KhX0YhFZMdP
	yYCiAahBA0mCJh+oLBwuueGRCYQr1qnqhhUSqvtaw+l0QotKPFL3Gtl7qj6O5xU+4pgLD9A/Ump3A
	XGX65UJBn24DgKP3Fi2eR+VFsbo/7C1COaD+uvv1Vf3fWok7+TuQ3JEkmP1YeZGLxuJU54Mus/f5l
	Avs5nkG43PMa3pDqQRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlkQ-0000000ARHC-2u0e;
	Wed, 19 Aug 2026 19:14:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlkP-0000000ARH0-3WBh
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 19:14:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E92E40446;
	Wed, 19 Aug 2026 19:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8A91F000E9;
	Wed, 19 Aug 2026 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166889;
	bh=5gWeIj/0e14fYOrOsZrZtjZfZ/2+j7qPQ9iKAH6by/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+03ggscnWlxK0ufvE1a+wvl8PkAOVwc2hh8bjdqTn2R1lSOhSH3HPiCvySV1SOZ6
	 TW6Y/F4S+IANZ2VhvqWLiKUYVnn455S5igLwYYuzxgB5sXvcDeq8a66Qb9Ij9t+6OK
	 tM6z013lM/XkOl8HEsbPnpkoFGukUDfi1bSQ3s99pIGbmJ9Kg3VHw9zbA4MbtWkNJ5
	 HOSHeLWMS2S+8Euy6RWUSOldARL+qUKQsrYNZ0HpaJorTN79on7ElHrssdU9g+AXPG
	 aF2zymTEHPBn2TgWmj7udETh9grFMC4gINesa/vSuDOF3VI12atfl1ft+nkhCQzCSo
	 ko/3GWR+P6Tuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is
 fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
Date: Wed, 19 Aug 2026 19:14:48 +0000
Message-Id: <20260819191449.3C8A91F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSB2aXNjb250aV9yZXNldF9zdGF0dXMoKSBpbmNvcnJlY3RseSB1c2VzIHRoZSBiaXQg
aW5kZXggZGlyZWN0bHkgaW5zdGVhZCBvZiBhIGJpdG1hc2ssIHJlc3VsdGluZyBpbiBjb3JydXB0
ZWQgc3RhdHVzIGNoZWNrcy4KLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRDSCB0cmVld2lkZSAyLzVd
IGNsazogdmlzY29udGk6IE1ha2Ugc3VyZSBjbGtfaW5pdF9kYXRhIGlzIGZ1bGx5IGluaXRpYWxp
emVkIC0tLQpjb21taXQgNjE3NzJlYTNjNjEwYTNiM2ViZjQzNWIxOTllNDAwYzFjNWFhZWU0YwpB
dXRob3I6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpjbGs6
IHZpc2NvbnRpOiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseSBpbml0aWFsaXplZAoK
VGhlIGNsa19pbml0X2RhdGEgc3RydWN0dXJlIGNvbnRhaW5zIHNldmVyYWwgbXV0dWFsbHktZXhj
bHVzaXZlIG1lbWJlcnMgZm9yCmRpZmZlcmVudCBtZXRob2RzIHRvIHNwZWNpZnkgdGhlIHBvc3Np
YmxlIHBhcmVudHMgb2YgYSBjbG9jay4gTm90CmluaXRpYWxpemluZyBhbGwgbWVtYmVycyBtYXkg
Y2F1c2Ugc3VidGxlIGlzc3VlcyB3aGVuIHVuaW5pdGlhbGl6ZWQgbWVtYmVycwphcmUgdW5leHBl
Y3RlZGx5IGFjY2Vzc2VkLiBUaGlzIGNvbW1pdCBlbnN1cmVzIGFsbCBtZW1iZXJzIGFyZSBmdWxs
eQppbml0aWFsaXplZCB0byB6ZXJvLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvdmlzY29u
dGkvY2xrYy5jIGIvZHJpdmVycy9jbGsvdmlzY29udGkvY2xrYy5jCj4gaW5kZXggZDBiMTkzYjVk
MGIzNS4uNDAxOGQxMjk4ODgwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay92aXNjb250aS9j
bGtjLmMKPiArKysgYi9kcml2ZXJzL2Nsay92aXNjb250aS9jbGtjLmMKPiBAQCAtODEsOSArODEs
OSBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAqdmlzY29udGlfY2xrX3JlZ2lzdGVyX2dhdGUoc3Ry
dWN0IGRldmljZSAqZGV2LAo+ICAJCQkJCQkgdTgJcnNfaWR4LAo+ICAJCQkJCQkgc3BpbmxvY2tf
dCAqbG9jaykKPiAgewo+ICsJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Owo+ICAJc3Ry
dWN0IHZpc2NvbnRpX2Nsa19nYXRlICpnYXRlOwo+ICAJc3RydWN0IGNsa19wYXJlbnRfZGF0YSAq
cGRhdGE7Cj4gLQlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0Owo+ICAJc3RydWN0IGNsa19odyAq
aHc7Cj4gIAlpbnQgcmV0Owo+ICAKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlz
dGluZyBpc3N1ZSwgYnV0IHdoaWxlIHJldmlld2luZyB0aGUgdmlzY29udGkgY2xvY2sgYW5kCnJl
c2V0IGRyaXZlciBjaGFuZ2VzLCBJIG5vdGljZWQgYSBwb3RlbnRpYWwgcHJvYmxlbSB3aXRoIGhv
dyByc19pZHggaXMgdXNlZC4KCkluIGRyaXZlcnMvY2xrL3Zpc2NvbnRpL3Jlc2V0LmM6dmlzY29u
dGlfcmVzZXRfc3RhdHVzKCk6CgoJc3Bpbl9sb2NrX2lycXNhdmUocmVzZXQtPmxvY2ssIGZsYWdz
KTsKCXJldCA9IHJlZ21hcF9yZWFkKHJlc2V0LT5yZWdtYXAsIGRhdGEtPnJzb25fb2Zmc2V0LCAm
cmVnKTsKCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUocmVzZXQtPmxvY2ssIGZsYWdzKTsKCWlmIChy
ZXQpCgkJcmV0dXJuIHJldDsKCglyZXR1cm4gIShyZWcgJiBkYXRhLT5yc19pZHgpOwoKSXMgdGhp
cyByZXNldCBzdGF0dXMgY2hlY2sgb3BlcmF0aW5nIGFzIGludGVuZGVkPyBTaW5jZSByc19pZHgg
aXMgYSByYXcgYml0CmluZGV4ICgwLTMxKSwgd291bGQgaXQgYmUgbW9yZSBhY2N1cmF0ZSB0byBt
YXNrIHRoZSByZWdpc3RlciB3aXRoCkJJVChkYXRhLT5yc19pZHgpIHJhdGhlciB0aGFuIHRoZSBy
YXcgaW5kZXggdmFsdWU/CgpNYXNraW5nIHdpdGggdGhlIHJhdyBpbmRleCBzZWVtcyBsaWtlIGl0
IGNvdWxkIHByb2R1Y2UgaW5jb3JyZWN0IHN0YXR1cwpyZXR1cm5zLiBGb3IgZXhhbXBsZSwgaWYg
cnNfaWR4IGlzIDAsIHRoZSBtYXNrIHdvdWxkIGFsd2F5cyBldmFsdWF0ZSB0byAwLgoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4x
Nzg3MTY1MzI5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZT9wYXJ0PTIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
