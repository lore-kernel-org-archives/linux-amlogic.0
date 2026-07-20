Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9ECC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 16:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjG+82F2ox+k1FC7nzV93IHYqJQ6BwzaXCr3vzkgZ20=; b=3+Qmnub8ByOwv6
	ht9dhEeg92NkSObxv5iNDAK9hCyCjF7dbg96tTxCgVbREy9O25d4jS+ZsFmUfmv5ggTgUjiyLg4Bc
	fhsbsbQtIX2ZMpWyIbLYdUOWvVRdKB+UJgPlkSrkN0ub+ErU+Rk8jKES9jhTUUXAIImxxw3VGBsfN
	pBcEEiobvN3A3GG63YKylO5zkiKo28cVQxm5H4iDks5MLuvMndhIzgZ4Rfcxp2Y3GVzWJJuk0Fwjy
	5ndHSiCvBLX7ygg9FSuiY3TK8ekhyDkSJ9YWMgPhAMTp4qruT4HfxQnX50ra7VuXxsGr69dMQonyF
	R60t6+X4ZkoQH8144DgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqXk-00000007JWk-0o1b;
	Mon, 20 Jul 2026 16:08:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqXi-00000007JWX-3hju
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 16:08:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FE0941B0A;
	Mon, 20 Jul 2026 16:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3311F000E9;
	Mon, 20 Jul 2026 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563714;
	bh=9KrDL8WVRykRNu0EQzamEj6Vx3hZLwfviLgeAZ2Q/J0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dt9TPmxzdzl8Hq/nfOa3hH2HizLmhwCwmeBMcDGIvwGxdrRXIdqqOyLqyHXrMuPm3
	 XS6aNl53STL8Ioyfc2oczocKjyHgZylMIfCEO6GKyAUY9ThGrqxvwWqjt0iguPtugz
	 oQDczUi/99qQbh+PBU0t/8WqcEkIIlu427lZzD8yib2DT5w7Brl/ntb2FRb8fhzRCZ
	 6WZca3vlz4dEMpoc74ngnl3Uv5zOxPcQn7ao/EdshKtZgPn0KaRG6YZjpiQfZ6DSh2
	 mov3C1s4SrTufUBBmavRqjxHdsGH6UPHovayAZKP5licQDAzA4ill6rUHxrI6XH8Mf
	 XkayUWLC5+3FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/15] drm/tidss: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: Frank.Li@kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 16:08:33 +0000
Message-Id: <20260720160833.BD3311F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGRybV9lbmNvZGVyX2NsZWFudXAoKSBvbiBlcnJvciBwYXRocyBjYXVz
ZXMgYW4gaW1tZWRpYXRlIFVzZS1BZnRlci1GcmVlIGR1cmluZyBwcm9iZSBmYWlsdXJlIGR1ZSB0
byBkZXZtL2RybW0gbGlmZWN5Y2xlIG1pc21hdGNoLgotLQoKLS0tIFBhdGNoIFs3XTogW1BBVENI
IHYyIDA3LzE1XSBkcm0vdGlkc3M6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVs
cGVycyAtLS0KY29tbWl0IGUxYmM3NzM2Y2MzZDkxMmJkNjNhNmU3YWJiYjgzMDQ3OWUyYzgyZTEK
QXV0aG9yOiBEaW9nbyBTaWx2YSA8ZGlvZ29tcGFpc3NpbHZhQGdtYWlsLmNvbT4KCmRybS90aWRz
czogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJzCgpUaGUgc2ltcGxlIEtN
UyBoZWxwZXJzIGFyZSBkZXByZWNhdGVkIGJlY2F1c2UgdGhleSBvbmx5IGFkZCBhbgppbnRlcm1l
ZGlhdGUgbGF5ZXIgYmV0d2VlbiBkcml2ZXJzIGFuZCBhdG9taWMgbW9kZXNldHRpbmcuIFRoaXMg
Y29tbWl0Cm9wZW4tY29kZXMgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBieSBjYWxsaW5nIGRy
bV9lbmNvZGVyX2luaXQoKQpkaXJlY3RseSBhbmQgcHJvdmlkaW5nIGRyaXZlci1sb2NhbCBkcm1f
ZW5jb2Rlcl9mdW5jcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRz
c19lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZW5jb2Rlci5jCj4gaW5k
ZXggNjk4ZjhkOTY0Y2EwMC4uMTBkYmNjNmNkZjZhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGlkc3MvdGlkc3NfZW5jb2Rlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpZHNz
L3RpZHNzX2VuY29kZXIuYwpbIC4uLiBdCj4gQEAgLTk1LDggKzk5LDggQEAgaW50IHRpZHNzX2Vu
Y29kZXJfY3JlYXRlKHN0cnVjdCB0aWRzc19kZXZpY2UgKnRpZHNzLAo+ICAJaWYgKElTX0VSUih0
X2VuYykpCj4gIAkJcmV0dXJuIFBUUl9FUlIodF9lbmMpOwo+ICAKPiAtCXJldCA9IGRybV9zaW1w
bGVfZW5jb2Rlcl9pbml0KCZ0aWRzcy0+ZGRldiwgJnRfZW5jLT5lbmNvZGVyLAo+IC0JCQkJICAg
ICAgZW5jb2Rlcl90eXBlKTsKPiArCXJldCA9IGRybV9lbmNvZGVyX2luaXQoJnRpZHNzLT5kZGV2
LCAmdF9lbmMtPmVuY29kZXIsCj4gKwkJCSAgICAgICAmdGlkc3NfZW5jb2Rlcl9mdW5jcywgZW5j
b2Rlcl90eXBlLCBOVUxMKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCgpbU2V2
ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBi
dXQgZG9lcyB0aGlzIGZ1bmN0aW9uIGxlYWsgdGhlCmluaXRpYWxpemVkIGVuY29kZXIgaW50byB0
aGUgZ2xvYmFsIG1vZGVfY29uZmlnIGxpc3Qgb24gc3Vic2VxdWVudCBlcnJvcgpwYXRocz8KCklm
IGRybV9icmlkZ2VfYXR0YWNoKCkgb3IgZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCgpIGZhaWxz
IGxhdGVyIGluIHRoaXMKZnVuY3Rpb24sIHRoZXkgcmV0dXJuIGFuIGVycm9yIGRpcmVjdGx5IHdp
dGhvdXQgY2xlYW5pbmcgdXAgdGhlIGluaXRpYWxpemVkCkRSTSBlbmNvZGVyOgoKCXJldCA9IGRy
bV9icmlkZ2VfYXR0YWNoKGVuYywgJnRfZW5jLT5icmlkZ2UsIE5VTEwsCgkJCQlEUk1fQlJJREdF
X0FUVEFDSF9OT19DT05ORUNUT1IpOwoJaWYgKHJldCkgewoJCWRldl9lcnIodGlkc3MtPmRldiwg
ImJyaWRnZSBhdHRhY2ggZmFpbGVkOiAlZFxuIiwgcmV0KTsKCQlyZXR1cm4gcmV0OwoJfQoKQmVj
YXVzZSB0X2VuYyBpcyBhbGxvY2F0ZWQgdmlhIGRldm1fZHJtX2JyaWRnZV9hbGxvYygpLCBkZXZy
ZXMgZnJlZXMgdF9lbmMKYXMgc29vbiBhcyBwcm9iZSBmYWlscy4gVGhlIERSTSBkZXZpY2UgaXRz
ZWxmIGlzIGFsc28gZGV2cmVzLW1hbmFnZWQsIHNvCml0cyBjbGVhbnVwIHJ1bnMgYWZ0ZXIgdF9l
bmMgaXMgZnJlZWQuCgpXaGVuIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgaXRlcmF0ZXMgb3Zl
ciB0aGUgZW5jb2Rlcl9saXN0IGFuZCBjYWxscyB0aGUKLmRlc3Ryb3kgaG9vayBvbiB0aGUgbm93
LWZyZWVkIHRfZW5jLT5lbmNvZGVyLCB3aWxsIHRoaXMgdHJpZ2dlciBhCnVzZS1hZnRlci1mcmVl
PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDcyMC1kcm1fc2ltcGxlX2VuY29kZXJfaW5pdC12Mi0wLTUwMjBiNjMwNjY4YUBnbWFp
bC5jb20/cGFydD03CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
