Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3EFC44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTr4Vb6H35uyNCBY0F+NZtCSWk/lVPloAVJHv/sANg8=; b=eeVNK0orke9YIm
	e1VFM0oYYTH6LWZpBbyOQ53Bsr8SySdATZoJjUbSLIISShGErGMMSmRAPe0QyDSi8MwCSs2TmiLFC
	Y/X/eq2RwrNp6tvVdI3X61DIMwDsFmWNgudJU4nMrZIE82RbbNRi1nvmPPaRh61rBdql/NlHIcrgU
	Q3T3Nzs7THhJ7cZhaY8bP71y3j5tmG76FeZ5B7SaFavC8DrFhyVNl+tnwzJQdFq7zwkLZPxdGAGy7
	y45rrzYj/jPx4LcMs9ypM2BdCc3dGI4gT32kaEUtB834xInvjlCF4qjFcDO8H6nTpabNOp/TnsSSn
	xwAnzjee98co/cAWt3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqMQ-00000007HRk-1Kuq;
	Mon, 20 Jul 2026 15:56:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqMO-00000007HR9-1pdY
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:56:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E61854396B;
	Mon, 20 Jul 2026 15:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FCB1F00A3D;
	Mon, 20 Jul 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563011;
	bh=Q8EeV4dGpp0/VfWB9tiXvyOV2F3Tc9aWT6jOzV7G/80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYYZIZnHi7WqVfRSOuIM4Sdg7NIHX5hgthdAaOh039bvb/JubnaIWM5hyO7TTN+jY
	 oHaADd5dQXiZQi2BLjH5sei6lLYsrsJqezzsSLviGTisK243azPxxZSnG7jIEUEZ2W
	 XKiJ8Qus969ZD7k4GQeE4ykFoyMeeYx/N4qVvQHuQXN2jzDhsbqXhqOUhio7mTUFP7
	 B5Hti+wgK9cD7p+erURLpG7x9y8B5wKenVDa2kTRIKfuDbYLQJ59H+ysz/nEeOQhr+
	 nLam9ynx0EWTS6uUiosL9hTspeL4enJgMseSV6aSyVdX76hqZKL7xVGuxRvazrRnOA
	 Y40bKOmqjjTcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/15] drm/meson: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org, imx@lists.linux.dev
In-Reply-To: <20260720-drm_simple_encoder_init-v2-13-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-13-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 15:56:50 +0000
Message-Id: <20260720155651.66FCB1F00A3D@smtp.kernel.org>
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
IFtIaWdoXSBQb3RlbnRpYWwgVXNlLUFmdGVyLUZyZWUgZHVlIHRvIG1peGluZyBkZXZyZXMgKGBk
ZXZtX2ApIGFsbG9jYXRpb24gd2l0aCBEUk0gb2JqZWN0IGxpZmVjeWNsZS4KLS0KCi0tLSBQYXRj
aCBbMTNdOiBbUEFUQ0ggdjIgMTMvMTVdIGRybS9tZXNvbjogcmVtb3ZlIGRlcGVuZGVuY3kgb24g
RFJNIHNpbXBsZSBoZWxwZXJzIC0tLQpjb21taXQgZjYwMTI1MmQ0NTYzNGQ5NTRhNzA4N2NkNjgw
MDlhZGNlM2ZiZjVmNwpBdXRob3I6IERpb2dvIFNpbHZhIDxkaW9nb21wYWlzc2lsdmFAZ21haWwu
Y29tPgoKZHJtL21lc29uOiByZW1vdmUgZGVwZW5kZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMK
ClRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlIEtNUyBoZWxwZXIgZHJt
X3NpbXBsZV9lbmNvZGVyX2luaXQoKQp3aXRoIGRybV9lbmNvZGVyX2luaXQoKSBhY3Jvc3MgdGhl
IENWQlMsIERTSSwgYW5kIEhETUkgZW5jb2RlcnMgaW4gdGhlIG1lc29uCkRSTSBkcml2ZXIuCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9jdmJzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9jdmJzLmMKPiBpbmRleCAyMmNh
Y2IxNjYwYzRmLi5jZGI4NGQyMjgzZjgzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9lbmNvZGVyX2N2YnMuYwpbIC4uLiBdCj4gQEAgLTIxOCw2ICsyMTgsMTAgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIG1lc29uX2VuY29kZXJfY3Zic19icmlkZ2Vf
ZnVuY3MgPSB7Cj4gIAkuYXRvbWljX2NyZWF0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Jy
aWRnZV9jcmVhdGVfc3RhdGUsCj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9l
bmNvZGVyX2Z1bmNzIG1lc29uX2VuY29kZXJfY3Zic19mdW5jcyA9IHsKPiArCS5kZXN0cm95ID0g
ZHJtX2VuY29kZXJfY2xlYW51cCwKPiArfTsKPiArCj4gIGludCBtZXNvbl9lbmNvZGVyX2N2YnNf
cHJvYmUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKPiAgewpbIC4uLiBdCj4gQEAgLTI1Nyw4ICsy
NjEsOSBAQCBpbnQgbWVzb25fZW5jb2Rlcl9jdmJzX3Byb2JlKHN0cnVjdCBtZXNvbl9kcm0gKnBy
aXYpCj4gIAltZXNvbl9lbmNvZGVyX2N2YnMtPnByaXYgPSBwcml2Owo+ICAKPiAgCS8qIEVuY29k
ZXIgKi8KPiAtCXJldCA9IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KHByaXYtPmRybSwgJm1lc29u
X2VuY29kZXJfY3Zicy0+ZW5jb2RlciwKPiAtCQkJCSAgICAgIERSTV9NT0RFX0VOQ09ERVJfVFZE
QUMpOwo+ICsJcmV0ID0gZHJtX2VuY29kZXJfaW5pdChwcml2LT5kcm0sICZtZXNvbl9lbmNvZGVy
X2N2YnMtPmVuY29kZXIsCj4gKwkJCSAgICAgICAmbWVzb25fZW5jb2Rlcl9jdmJzX2Z1bmNzLAo+
ICsJCQkgICAgICAgRFJNX01PREVfRU5DT0RFUl9UVkRBQywgTlVMTCk7CgpbU2V2ZXJpdHk6IEhp
Z2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHVzaW5nIGRldnJlcyBm
b3IgdGhlIGVuY29kZXIgYWxsb2NhdGlvbgpjcmVhdGUgYSB1c2UtYWZ0ZXItZnJlZSByaXNrIGR1
cmluZyBkZXZpY2UgdW5iaW5kPwoKTG9va2luZyBlYXJsaWVyIGluIG1lc29uX2VuY29kZXJfY3Zi
c19wcm9iZSgpLCB0aGUgc3RydWN0dXJlIGNvbnRhaW5pbmcgdGhlIERSTQplbmNvZGVyIGlzIGFs
bG9jYXRlZCB3aXRoIGRldnJlczoKCgltZXNvbl9lbmNvZGVyX2N2YnMgPSBkZXZtX2RybV9icmlk
Z2VfYWxsb2MocHJpdi0+ZGV2LAoJCQkJCQkgICBzdHJ1Y3QgbWVzb25fZW5jb2Rlcl9jdmJzLAoJ
CQkJCQkgICBicmlkZ2UsCgkJCQkJCSAgICZtZXNvbl9lbmNvZGVyX2N2YnNfYnJpZGdlX2Z1bmNz
KTsKCklmIHRoZSBwaHlzaWNhbCBkZXZpY2UgaXMgdW5ib3VuZCAoZS5nLiwgdmlhIHN5c2ZzKSB3
aGlsZSBhIHVzZXIgYXBwbGljYXRpb24KaG9sZHMgYSBEUk0gZmlsZSBkZXNjcmlwdG9yIG9wZW4s
IHRoZSBkZXZyZXMgZnJhbWV3b3JrIHdpbGwgZnJlZSB0aGlzIG1lbW9yeSwKaW5jbHVkaW5nIHRo
ZSBlbWJlZGRlZCBzdHJ1Y3QgZHJtX2VuY29kZXIuCgpMYXRlciwgd2hlbiB0aGUgZmlsZSBkZXNj
cmlwdG9yIGlzIGNsb3NlZCBhbmQgdGhlIERSTSBjb3JlIHRlYXJzIGRvd24gdGhlCmRldmljZSwg
aXQgd2lsbCBjYWxsIGRybV9lbmNvZGVyX2NsZWFudXAoKSBvbiB0aGUgYWxyZWFkeS1mcmVlZCBl
bmNvZGVyLgoKVGhlIGV4YWN0IHNhbWUgZGV2cmVzIGFsbG9jYXRpb24gcGF0dGVybiBpcyBhbHNv
IHByZXNlbnQgaW4gCm1lc29uX2VuY29kZXJfZHNpX3Byb2JlKCkgZm9yIG1lc29uX2VuY29kZXJf
ZHNpLCBhbmQgaW4KbWVzb25fZW5jb2Rlcl9oZG1pX3Byb2JlKCkgZm9yIG1lc29uX2VuY29kZXJf
aGRtaS4KCkNvdWxkIHRoZXNlIGJlIGNvbnZlcnRlZCB0byB1c2UgRFJNLW1hbmFnZWQgYWxsb2Nh
dG9ycyAobGlrZSBkcm1tX2t6YWxsb2MpIHRvCmVuc3VyZSB0aGUgbWVtb3J5IHNhZmVseSBvdXRs
aXZlcyB0aGUgcGh5c2ljYWwgZGV2aWNlIHVuYmluZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjAtZHJtX3NpbXBsZV9lbmNv
ZGVyX2luaXQtdjItMC01MDIwYjYzMDY2OGFAZ21haWwuY29tP3BhcnQ9MTMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
