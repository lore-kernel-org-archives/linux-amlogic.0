Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CD2CD5BD1
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rmbq7HFNLJ6uZrENoi34bMxY4mv5YP6wPZCCy8AdmI=; b=k0KVUy1znLOojs
	8MCek+BrAjVCEiyq0McyxiaPOO1CrLysyI049xG3l0MRA+1JWpW+bEM8Xcen+KUe1GRqF+sofmacr
	3h7KGHk4idTg7L3ZF+8gy9pasqNEPmDI83kyB2CWnayY5L+uoe2c4SEsEnO8c6rq8fS4WPMMGaB3L
	L0bOxaSumLOC61GYKDdhxOrZoVBcjm7LT29u0NMXSwxwYAmA4eAhk5oyVIbihAkRrDzEz+sy+PBPx
	GUvOIZcRM7d9RH2dvQBaZObM7mNS0gcrXW4nSkqWirOCxOXrLylN6S5VEj/Gkv+BMXgImsNMDxEX8
	BO6s7OC4zJrdPL4LpVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb6R-00000009MCo-0gtC;
	Sun, 31 May 2026 08:00:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb6O-00000009MC8-0CO6
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 08:00:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FF941AB3;
	Sun, 31 May 2026 08:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032E81F00893;
	Sun, 31 May 2026 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780214455;
	bh=iiD82Ll+gP7nWVyf3YpFzQ3F/DjdsDDI3glfJoCG6JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dxaHYPhJ5+uWZhubremED0vnllv4JQohC2kY36ApJgggdbtxv5GYvVOvI/ADKPAqq
	 xE+YDMFT9J3yj3aBI7i3WBcdA/LqeiKy3u9GAg5dyBsf0J7i60jMjq5N5iRdmCuPHS
	 UfZ4f89xMnDCORGtyeGMiasEq8KHXGG1L+2ekwiGcbtkSn4BpsTu5E8YDiWHNZx+Cv
	 ep7bf260TyzJeKghocWgKWqB03n8B+lMZjsZz15TUFIt+MsMipjkEvw8yipdt/pQBg
	 ylpMZ3ihlyTtSSe0u7F/hdYSSZdLc4z+ooAaJM3N4Ohnawpa/sln89ajkWsXMvaZkM
	 EXBJPOJZbBfOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] drm/virtio: Open-code drm_simple_encoder_init()
To: "Naman Arora" <namanarora029@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260531073532.8609-4-namanarora029@gmail.com>
References: <20260531073532.8609-4-namanarora029@gmail.com>
Date: Sun, 31 May 2026 08:00:54 +0000
Message-Id: <20260531080055.032E81F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_010056_108306_FF3757FD 
X-CRM114-Status: GOOD (  11.49  )
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
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSByZXR1cm4gdmFsdWUgb2YgZHJtX2VuY29kZXJfaW5pdCgpIGlzIGlnbm9yZWQsIG1lYW5p
bmcgZmFpbHVyZXMgZHVyaW5nIGluaXRpYWxpemF0aW9uIGdvIHVuZGV0ZWN0ZWQgYW5kIGNvdWxk
IGxlYWQgdG8gYSBrZXJuZWwgcGFuaWMgb3Igb29wcy4KLS0KCmNvbW1pdCAyYWVhNjRmMzBkZWZl
ZDE1NTUzNDZmMWY5YTZkOTZlNGIxYzU0OGM5CkF1dGhvcjogTmFtYW4gQXJvcmEgPG5hbWFuYXJv
cmEwMjlAZ21haWwuY29tPgoKZHJtL3ZpcnRpbzogT3Blbi1jb2RlIGRybV9zaW1wbGVfZW5jb2Rl
cl9pbml0KCkKClRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBkcm1fc2ltcGxlX2VuY29kZXJfaW5p
dCgpIHdyYXBwZXIgd2l0aCBhbiBvcGVuLWNvZGVkCmRybV9lbmNvZGVyX2luaXQoKSBpbiB0aGUg
dmlydGlvIGRyaXZlciB0byByZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gdGhlCmRybV9zaW1wbGVf
a21zX2hlbHBlci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMKClsgLi4uIF0KCj4gQEAgLTMw
Niw3ICszMDksOCBAQCBzdGF0aWMgaW50IHZnZGV2X291dHB1dF9pbml0KHN0cnVjdCB2aXJ0aW9f
Z3B1X2RldmljZSAqdmdkZXYsIGludCBpbmRleCkKPiAgCWlmICh2Z2Rldi0+aGFzX2VkaWQpCj4g
IAkJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IpOwo+ICAKPiAt
CWRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGRldiwgZW5jb2RlciwgRFJNX01PREVfRU5DT0RFUl9W
SVJUVUFMKTsKPiArCWRybV9lbmNvZGVyX2luaXQoZGV2LCBlbmNvZGVyLCAmdmlydGlvX2dwdV9k
cm1fZW5jb2Rlcl9mdW5jcywKPiArCQkJIERSTV9NT0RFX0VOQ09ERVJfVklSVFVBTCwgTlVMTCk7
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLCBidXQgc2hvdWxkIHRoZSByZXR1cm4gdmFsdWUgb2YKZHJtX2VuY29kZXJfaW5pdCgpIGJl
IGNoZWNrZWQgaW4gdmdkZXZfb3V0cHV0X2luaXQoKSBoZXJlPwoKSWYgZHJtX2VuY29kZXJfaW5p
dCgpIGZhaWxzIChmb3IgZXhhbXBsZSwgcmV0dXJuaW5nIC1FTk9NRU0gaWYgYWxsb2NhdGluZwp0
aGUgZW5jb2RlciBuYW1lIGZhaWxzKSwgdGhlIGVycm9yIGlzIGlnbm9yZWQuIERvZXMgdGhpcyBh
bGxvdyB0aGUgY29kZSB0bwpwcm9jZWVkIGFuZCBhdHRhY2ggYW4gaW5jb21wbGV0ZWx5IGluaXRp
YWxpemVkIGVuY29kZXIgdG8gdGhlIGNvbm5lY3RvciwKcG90ZW50aWFsbHkgbGVhZGluZyB0byBh
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvciBjcmFzaCBsYXRlciB3aGVuIHRoZSBEUk0KY29y
ZSBpbnRlcmFjdHMgd2l0aCBpdD8KCj4gIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIs
ICZ2aXJ0aW9fZ3B1X2VuY19oZWxwZXJfZnVuY3MpOwo+ICAJZW5jb2Rlci0+cG9zc2libGVfY3J0
Y3MgPSAxIDw8IGluZGV4Owo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTMxMDc0NjI3Ljg5MzYtMS1uYW1hbmFyb3JhMDI5QGdt
YWlsLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
