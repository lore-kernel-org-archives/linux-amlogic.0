Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCC1C79F9E
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Sep 2026 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD7LcS3HR5p7eNPk3PEau0inB4naH7jRwUWyGyCp9Ps=; b=EbtiqAMsz94vn5
	rbY2Pc5RCDVja7VA5VbhjkC/wL4XMBWh9Ht7wzXgvh2uH5JONncemiW0ozyxshywRLQAhY2feg1WF
	H5B3LC6sfhyqgEY9AkwPMzgdBeOjNt6I7Fr4yGxVMWYGMPkELYW1GBzdicSLW0V3Am/HKuYdrBGsF
	zwzCxH5Mf70Ip7GRCztIkEqCbQtZR+NCpMtHgSA8rB+68icNJwfppt2UzWBCZ6wL/JjAijMtkOexr
	t4jYocrapjvAnn8I7qpu4whp04nV8rUDxQcjtWE8mlO9dU6Xvmv1cfjG1W9XOB++bAE0wiw4s/GHP
	NLUqFFeALs2AvJO6/7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Iy7-00000005X2d-24s4;
	Sun, 06 Sep 2026 19:55:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Iy6-00000005X2O-1MLY
	for linux-amlogic@lists.infradead.org;
	Sun, 06 Sep 2026 19:55:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 038CD601DE;
	Sun,  6 Sep 2026 19:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6DE1F00A3A;
	Sun,  6 Sep 2026 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788724555;
	bh=VBEDqqN7Y9WjX8AeCVSMHJyKdPTX7pxJOXPP6EKJQBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxtnz6aLCnEkIIofzvAkGtL+JFk0VK/u+hq28CTCw33O+lwXBSkd1r9aF3yH44J8P
	 rhRhu12zQYBzGND75EBOSHteFJV/TUGBUKN5qt+fFJnocD+Ag1uofa4brnk+8KkgMR
	 bU9BjfvD/0uaVSseKHhu9kqjVFUSoOEb8Yi3osvmkgnhWkaT31h7f1wQe7YcJCdpbd
	 Bzacjf7v+UcowN+/o0hWYKouVZgxmCLNmWb6pHNicdYGtq0MtpKLEcNp+XPNOoYNX0
	 qDKgxkZMaKxVjIMl7JlSLoWRUGwDq3BItYiEu+139I/xBKSSDk9khNHtRMdSJUOopd
	 JPgbm/EatxzAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
To: "Miles Krause" <mileskrause5200@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
References: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
Date: Sun, 06 Sep 2026 19:55:54 +0000
Message-Id: <20260906195555.6C6DE1F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGRybV9icmlkZ2VfcmVtb3ZlKCkgb24gZXJyb3IgcGF0aHMgYWZ0ZXIg
ZHJtX2JyaWRnZV9hZGQoKSBsZWF2ZXMgdGhlIGJyaWRnZSBwZXJtYW5lbnRseSBsZWFrZWQgYW5k
IGF0dGFjaGVkIHRvIHRoZSBnbG9iYWwgYnJpZGdlX2xpc3QuCi0tCgpjb21taXQgMzE0Nzc2ZTc5
YTYxZTMyNDVmZDQxMzUzYTdhOGUyMmRlOTVhZmM2MwpBdXRob3I6IE1pbGVzIEtyYXVzZSA8bWls
ZXNrcmF1c2U1MjAwQGdtYWlsLmNvbT4KCmRybS9tZXNvbjogZml4IGRldmljZV9ub2RlIGxlYWsg
aW4gbWVzb25fZW5jb2Rlcl9kc2lfcHJvYmUoKQoKVGhpcyBjb21taXQgZml4ZXMgYSBkZXZpY2Vf
bm9kZSBsZWFrIGluIG1lc29uX2VuY29kZXJfZHNpX3Byb2JlKCkgYnkKZHJvcHBpbmcgdGhlIHJl
ZmVyZW5jZSB0byB0aGUgcmVtb3RlIG5vZGUgYWZ0ZXIgYWNxdWlyaW5nIHRoZSBicmlkZ2UuCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2RzaS5jCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2kuYwo+IEBAIC0xMjAsNiArMTIwLDcgQEAgaW50IG1l
c29uX2VuY29kZXJfZHNpX3Byb2JlKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpCj4gIAl9Cj4gIAo+
ICAJbWVzb25fZW5jb2Rlcl9kc2ktPmJyaWRnZS5uZXh0X2JyaWRnZSA9IG9mX2RybV9maW5kX2Fu
ZF9nZXRfYnJpZGdlKHJlbW90ZSk7Cj4gKwlvZl9ub2RlX3B1dChyZW1vdGUpOwo+ICAJaWYgKCFt
ZXNvbl9lbmNvZGVyX2RzaS0+YnJpZGdlLm5leHRfYnJpZGdlKQo+ICAJCXJldHVybiBkZXZfZXJy
X3Byb2JlKHByaXYtPmRldiwgLUVQUk9CRV9ERUZFUiwKPiAgCQkJCSAgICAgIkZhaWxlZCB0byBm
aW5kIERTSSB0cmFuc2NlaXZlciBicmlkZ2VcbiIpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlz
IGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgc2luY2UgeW91IGFyZSBmaXhpbmcgbGVha3MgaW4g
dGhpcyBwcm9iZQpmdW5jdGlvbiwgY291bGQgd2UgYWxzbyBhZGRyZXNzIGEgYnJpZGdlIGxlYWsg
ZnVydGhlciBkb3duIGluCm1lc29uX2VuY29kZXJfZHNpX3Byb2JlKCk/CgpXaGVuIGRybV9icmlk
Z2VfYWRkKCkgaXMgY2FsbGVkLCBpdCBhZGRzIHRoZSBicmlkZ2UgdG8gdGhlIGdsb2JhbCBicmlk
Z2VfbGlzdAphbmQgaW5jcmVtZW50cyBpdHMgcmVmY291bnQuIElmIGEgc3Vic2VxdWVudCBpbml0
aWFsaXphdGlvbiBzdGVwIGZhaWxzLCBzdWNoCmFzIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkg
cmV0dXJuaW5nIGFuIGVycm9yOgoKICAgIGRybV9icmlkZ2VfYWRkKCZtZXNvbl9lbmNvZGVyX2Rz
aS0+YnJpZGdlKTsKCiAgICBtZXNvbl9lbmNvZGVyX2RzaS0+cHJpdiA9IHByaXY7CgogICAgcmV0
ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQocHJpdi0+ZHJtLCAmbWVzb25fZW5jb2Rlcl9kc2kt
PmVuY29kZXIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9FTkNP
REVSX0RTSSk7CiAgICBpZiAocmV0KQogICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKHByaXYt
PmRldiwgcmV0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gaW5pdCBE
U0kgZW5jb2RlclxuIik7CgpEb2VzIHRoaXMgZXJyb3IgcGF0aCByZXR1cm4gZGlyZWN0bHkgd2l0
aG91dCBjYWxsaW5nIGRybV9icmlkZ2VfcmVtb3ZlKCk/CgpCZWNhdXNlIHRoZSBkZXZyZXMgY2xl
YW51cCBmb3IgZGV2bV9kcm1fYnJpZGdlX2FsbG9jIG9ubHkgZHJvcHMgdGhlIHJlZmNvdW50CmJ5
IDEsIHRoZSBicmlkZ2UgcmVtYWlucyBhdHRhY2hlZCB0byB0aGUgbGlzdCBhbmQgbWVtb3J5IGlz
IG5ldmVyIGZyZWVkLiBJZgp0aGUgbW9kdWxlIGlzIHVubG9hZGVkLCB0cmF2ZXJzaW5nIHRoZSBs
aXN0IGxhdGVyIGNvdWxkIG9vcHMgYmVjYXVzZSB0aGUKYnJpZGdlIGZ1bmN0aW9uIHBvaW50ZXJz
IHdpbGwgcG9pbnQgdG8gZnJlZWQgbW9kdWxlIHRleHQuCgpUaGlzIHNhbWUgbWlzc2luZyBkcm1f
YnJpZGdlX3JlbW92ZSgpIHBhdHRlcm4gYWxzbyBleGlzdHMgb24gdGhlIGVycm9yIHBhdGhzCmFm
dGVyIGRybV9icmlkZ2VfYWRkKCkgaW4gbWVzb25fZW5jb2Rlcl9oZG1pX3Byb2JlKCkgaW4gbWVz
b25fZW5jb2Rlcl9oZG1pLmMKYW5kIG1lc29uX2VuY29kZXJfY3Zic19wcm9iZSgpIGluIG1lc29u
X2VuY29kZXJfY3Zicy5jLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkwNi1tZXNvbi1kc2ktb2Ytbm9kZS1sZWFrLXYxLTEtOWQx
ODM1NjAyNzlkQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
