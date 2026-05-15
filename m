Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F9CD4F25
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2026 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRoAQZNxfIuhHUUihViWuvv8LxB0i7YDPNFGBekE/SQ=; b=VzJ2J+SiV9/lvs
	8+7uajPHFwkuQKuEgwaE5Of+FniwXFT9Pm6jCNL8zFuXlApIsfg74K0idYQo6ryvZrHlHXlQa5hVf
	lwchjJDsFBpU5djOBorj+Q0Vog4Sju4Kl4TBvmf0F4myYOke5jUNSydNo88FRIDLVVWgjzh6IzGBn
	ZxZa/xPVyHJ4gJoFWQd89oAEp/WbVvd+4siUb1I/H9pBUsaHXuJon7suneSZa5XNc3xLbnL0Go2eY
	8OMZ74ZJU4RJWK4gJfKxrziw+YGitneRZe/e26DbN6940p/U6tGacIk3HlPcayy3CfYskoHwCxnpO
	rduAz3CE8taQz2SW2nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwW6-000000090oz-28KX;
	Fri, 15 May 2026 17:40:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwW5-000000090ol-05LH
	for linux-amlogic@lists.infradead.org;
	Fri, 15 May 2026 17:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD8260098;
	Fri, 15 May 2026 17:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB74C2BCB0;
	Fri, 15 May 2026 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778866803;
	bh=TyO6PlKAMTau3nCCOuye0YMSbIXgPgexJURDM+BrAe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bfXx9DCxSLktBainj3nHJ0BE94VgLi8H1zHnzUkgEK6cBCPkBHkWNazfBo0RM+YGQ
	 nIAanFFUCv2qvXJrKYhAZuddDysRYcoBYB3NXfpBWsOiqzDG3ZIX/5dthztTTgGrtg
	 F+wNNhJrO5Fu9jVkSneyX8OhbdSn2EbG7iUKHvpXNdmTf7qeQ0cU0XM81sDVcnzLoH
	 oTiAoY2K2QSzhftEI51nbQcWxQ4MlNo8H+3RW3EesHfdkAQ0USd+JR//N0mwxIWH5T
	 22vVO2CV029wShhQOjZfv0OfV23vl4g6qMBR8ufpNe6L5zgpxrFGoGTlwys8U8soTe
	 M/oqRkLd9qd+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
Date: Fri, 15 May 2026 17:40:03 +0000
Message-Id: <20260515174003.ADB74C2BCB0@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBNb2RpZnlpbmcg
YSBnbG9iYWwgc3RhdGljIERBUE0gd2lkZ2V0IHRlbXBsYXRlIHdpdGggYSBkZXZtLW1hbmFnZWQg
cG9pbnRlciBjcmVhdGVzIGEgVXNlLUFmdGVyLUZyZWUgdnVsbmVyYWJpbGl0eS4KLSBbSGlnaF0g
SW5pdGlhbGl6YXRpb24gb3JkZXIgZmxhdyBiZXR3ZWVuIGBzbmRfc29jX3JlZ2lzdGVyX2NvbXBv
bmVudCgpYCBhbmQgYGd4X2Zvcm1hdHRlcl9jcmVhdGUoKWAgY2F1c2VzIGEgdHlwZSBjb25mdXNp
b24ga2VybmVsIHBhbmljLgotLQoKY29tbWl0IGExMmJhMjAwZmU1ZTMzNThiMjI3MDk0Njc5Zjhh
MTdlOWFjNTM1OTEKQXV0aG9yOiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgoK
QVNvQzogbWVzb246IGFpdTogdXNlIGFpdS1mb3JtYXR0ZXItaTJzIHRvIGZvcm1hdCBJMlMgb3V0
cHV0IGRhdGEKClRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgREFQTSB3aWRnZXQgZm9yIHRo
ZSBJMlMgZm9ybWF0dGVyIGFuZCByb3V0ZXMKaXQgYmV0d2VlbiB0aGUgRklGTyBhbmQgb3V0cHV0
IERBSSBpbnRlcmZhY2UuIEl0IGFsc28gcmVtb3ZlcyB0aGUgZXhpc3RpbmcKSTJTIG91dHB1dCBm
b3JtYXR0aW5nIGNvZGUgZnJvbSBhaXUtZW5jb2Rlci1pMnMuCgo+IGRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvbWVzb24vYWl1LmMgYi9zb3VuZC9zb2MvbWVzb24vYWl1LmMKPiBpbmRleCBmMjg5MDEx
MWMxZDJjLi5iMDljMjA1OGVhY2FmIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9haXUu
Ywo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9haXUuYwoKWyAuLi4gXQoKPiBAQCAtMjksMTMgKzI5
LDIyIEBAIHN0YXRpYyBTT0NfRU5VTV9TSU5HTEVfREVDTChhaXVfc3BkaWZfZW5jb2RlX3NlbF9l
bnVtLCBBSVVfSTJTX01JU0MsCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25l
dyBhaXVfc3BkaWZfZW5jb2RlX211eCA9Cj4gIAlTT0NfREFQTV9FTlVNKCJTUERJRiBCdWZmZXIg
U3JjIiwgYWl1X3NwZGlmX2VuY29kZV9zZWxfZW51bSk7Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3Ry
dWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgYWl1X2NwdV9kYXBtX3dpZGdldHNbXSA9IHsKPiAtCVNO
RF9TT0NfREFQTV9NVVgoIlNQRElGIFNSQyBTRUwiLCBTTkRfU09DX05PUE0sIDAsIDAsCj4gLQkJ
CSAmYWl1X3NwZGlmX2VuY29kZV9tdXgpLAo+ICsjZGVmaW5lIEFJVV9XSURHRVRfU1BESUZfU1JD
X1NFTAkwCj4gKyNkZWZpbmUgQUlVX1dJREdFVF9JMlNfRk9STUFUVEVSCTEKPiArCj4gK3N0YXRp
YyBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBhaXVfY3B1X2RhcG1fd2lkZ2V0c1tdID0gewoK
SXMgaXQgc2FmZSB0byBtb2RpZnkgdGhpcyBnbG9iYWwgc3RhdGljIHRlbXBsYXRlIHdpdGggYSBk
ZXZtLW1hbmFnZWQKcG9pbnRlciBsYXRlciBpbiBhaXVfcHJvYmU/CgpJZiBhIHN1YnNlcXVlbnQg
aW5pdGlhbGl6YXRpb24gc3RlcCBmYWlscyBhbmQgYWl1X3Byb2JlIHJldHVybnMgYW4gZXJyb3Is
CnRoZSBkZXZyZXMgc3Vic3lzdGVtIHdpbGwgYXV0b21hdGljYWxseSBmcmVlIHRoZSBhbGxvY2F0
ZWQgbWVtb3J5LiBIb3dldmVyLAp0aGUgZGFuZ2xpbmcgcG9pbnRlciB3aWxsIHJlbWFpbiBpbiB0
aGlzIGdsb2JhbCBzdGF0aWMgdGVtcGxhdGUuCgpVcG9uIGEgc3Vic2VxdWVudCBwcm9iZSBkZWZl
cnJhbCwgd2lsbCBzbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCBjbG9uZQp0aGlzIGNvcnJ1cHRl
ZCB0ZW1wbGF0ZSwgYnJpbmdpbmcgdGhlIGZyZWVkIHBvaW50ZXIgaW50byB0aGUgYWN0aXZlIERB
UE0KY29udGV4dCBhbmQgY2F1c2luZyBhIHVzZS1hZnRlci1mcmVlIHdoZW4gZ3hfZm9ybWF0dGVy
X2V2ZW50IGRlcmVmZXJlbmNlcwp3LT5wcml2PwoKWyAuLi4gXQoKPiBAQCAtMjkxLDYgKzMwNSwx
NCBAQCBzdGF0aWMgaW50IGFpdV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+ICsJLyogQWxsb2NhdGUgdGhlIGFpdS1mb3JtYXR0
ZXIgaW50byBpdHMgd2lkZ2V0ICovCj4gKwlyZXQgPSBneF9mb3JtYXR0ZXJfY3JlYXRlKGRldiwg
JmFpdV9jcHVfZGFwbV93aWRnZXRzW0FJVV9XSURHRVRfSTJTX0ZPUk1BVFRFUl0sCj4gKwkJCQkg
ICZhaXVfZm9ybWF0dGVyX2kyc19kcnYsIG1hcCk7CgpDb3VsZCB0aGlzIGluaXRpYWxpemF0aW9u
IG9yZGVyIGNhdXNlIGEgdHlwZSBjb25mdXNpb24gcGFuaWM/CnNuZF9zb2NfcmVnaXN0ZXJfY29t
cG9uZW50IGlzIGludm9rZWQgcmlnaHQgYmVmb3JlIHRoaXMgaW4gYWl1X3Byb2JlLgoKSWYgQVNv
QyB0cmlnZ2VycyBzeW5jaHJvbm91cyBjYXJkIGJpbmRpbmcgdXBvbiBjb21wb25lbnQgcmVnaXN0
cmF0aW9uLCB0aGUKREFQTSB3aWRnZXRzIGFyZSBjbG9uZWQgZnJvbSB0aGUgdGVtcGxhdGUgd2hp
bGUgdy0+cHJpdiBpcyBzdGlsbCBOVUxMLgoKTGF0ZXIsIGR1cmluZyBhdWRpbyBwbGF5YmFjaywg
aWYgZ3hfZm9ybWF0dGVyX2V2ZW50IHJ1bnMsIGl0IGNoZWNrcwp3LT5wcml2LCBmaW5kcyBpdCBO
VUxMLCBhbmQgZXhlY3V0ZXMgdGhlIGZhbGxiYWNrIHBhdGggdXNpbmcKc25kX3NvY19jb21wb25l
bnRfZ2V0X2RydmRhdGEuCgpUaGUgY29tcG9uZW50IGRydmRhdGEgZm9yIHRoZSBBSVUgQ1BVIGNv
bXBvbmVudCBpcyBleHBsaWNpdGx5IHNldCB0bwpzdHJ1Y3QgYWl1ICogdmlhIHBsYXRmb3JtX3Nl
dF9kcnZkYXRhIGVhcmxpZXIgaW4gdGhlIHByb2JlLCBub3QgYQpzdHJ1Y3QgZ3hfZm9ybWF0dGVy
ICouCgpXaWxsIHRoZSBjb2RlIGVycm9uZW91c2x5IHRyZWF0IHRoZSBzdHJ1Y3QgYWl1ICogYXMg
YSBzdHJ1Y3QgZ3hfZm9ybWF0dGVyICoKYW5kIGF0dGVtcHQgdG8gZGVyZWZlcmVuY2UgaXRzIGZp
ZWxkcywgcmVzdWx0aW5nIGluIGEgcGFuaWM/Cgo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIo
ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIGFpdSBmb3JtYXR0ZXJcbiIpOwo+ICsJCWdvdG8gZXJy
Owo+ICsJfQo+ICsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA1MTUtcmVzaGFwZS1haXUtYXMtYXhnLXYxLTAtNTNiNDU3Nzg0ZmYz
QGJheWxpYnJlLmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
