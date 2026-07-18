Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57AC44523
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTg4IU26/eJdHeGyoS6xQSsMp23tskioKFalgAq1mCY=; b=W3T7VCSMNhIUMY
	+/Jf9GyOKaXwlY0SBWMsGlhZz7HtbVDE10Uyb2OZJFvaa5oL4GL+ZFzlOLp8BqfTHP91lBOkcJLvO
	sdq4mHMPQOPi39fpx21AUbOyG8BBHRmMUleFiSpG6YCGvXnGh4r1PAs0QRVlN3GE7nTfYilHcZ5gt
	lCqIluodOfy6bo9js64SbVtsEAY34N4QYRkBwj/rKl0M29SdMcwW0f38o9V55xAyKpClNYKOtmv7/
	7k/ulfYpwG9eP1NRTev2dpUbcGpVBwbx2aunfngqcsQME6sg/djpKsn9BRssMxPG9o22z9yEiTKVw
	GjdgHK/T0uVSaBre//YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEri-00000004dK5-3NBM;
	Sat, 18 Jul 2026 23:54:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlErh-00000004dJs-3qV1
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EF4760008;
	Sat, 18 Jul 2026 23:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5664F1F000E9;
	Sat, 18 Jul 2026 23:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784418880;
	bh=nHUy++hDRX3zDmfeKYf9s2cnoNqoIu2sJqwOijvW2f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TU2/0IaU8zD0v85PljVEtfywQY4KiZ1DQDKVaQBmTPPKH7JnlKNg9dVti5XcizzRE
	 ATUVK4n59C1hrUqp7okt0VDtvKMAIxfjprkkdrp0CjYJqA/waON5y8zpWlu3b4sASf
	 tsa96v1wORx8aVOv8UM242iQ5juDZ87YdoCCeZWpWkLT+0dZJh3B/bGUNWgljlKFNB
	 2ExPbKn8ezpakLXBZp1ZiujKKrPNHm/KOrapof4Iy7Rjbw4tkHh20R/gPWsgDX4zeA
	 iPKMkyMSR0VS6md2HjRGFIYqqZrmuvJblDjvmJgubxRhiY8ePcujv9QTBN11kySZfK
	 QB7Hl+ebbJqfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/15] drm/tidss: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
Date: Sat, 18 Jul 2026 23:54:39 +0000
Message-Id: <20260718235440.5664F1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBkdXJpbmcgdGVhcmRvd24gZHVlIHRvIG9iamVjdCBsaWZl
dGltZSBtaXNtYXRjaCBiZXR3ZWVuIGBkcm1fYnJpZGdlYCBhbmQgYGRybV9lbmNvZGVyYC4KLS0K
Ci0tLSBQYXRjaCBbN106IFtQQVRDSCAwNy8xNV0gZHJtL3RpZHNzOiByZW1vdmUgZGVwZW5kZW5j
eSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMgLS0tCmNvbW1pdCBlNmFiZmE4ZDU5ZDQ4NTY5N2ZjZmUy
YTNhMTk5ZTdmMzc4YTdlMjNhCkF1dGhvcjogRGlvZ28gU2lsdmEgPGRpb2dvbXBhaXNzaWx2YUBn
bWFpbC5jb20+Cgpkcm0vdGlkc3M6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVs
cGVycwoKVGhlIHBhdGNoIHJlbW92ZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlIEtNUyBoZWxwZXJz
IGZyb20gdGhlIHRpZHNzIGRyaXZlci4KSXQgcmVwbGFjZXMgZHJtX3NpbXBsZV9lbmNvZGVyX2lu
aXQoKSB3aXRoIGEgZGlyZWN0IGNhbGwgdG8KZHJtX2VuY29kZXJfaW5pdCgpLCBwcm92aWRpbmcg
ZHJpdmVyLWxvY2FsIGRybV9lbmNvZGVyX2Z1bmNzIHRvIGhhbmRsZQpjbGVhbnVwLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2VuY29kZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS90aWRzcy90aWRzc19lbmNvZGVyLmMKPiBpbmRleCA2OThmOGQ5NjRjYTAwLi4xMGRi
Y2M2Y2RmNmE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19lbmNv
ZGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZW5jb2Rlci5jClsgLi4u
IF0KPiBAQCAtODEsNiArODEsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1
bmNzIHRpZHNzX2JyaWRnZV9mdW5jcyA9IHsKPiAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZQkJPSBk
cm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfZGVzdHJveV9zdGF0ZSwKPiAgfTsKPiAgCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgdGlkc3NfZW5jb2Rlcl9mdW5jcyA9IHsK
PiArCS5kZXN0cm95ID0gZHJtX2VuY29kZXJfY2xlYW51cCwKPiArfTsKPiArCj4gIGludCB0aWRz
c19lbmNvZGVyX2NyZWF0ZShzdHJ1Y3QgdGlkc3NfZGV2aWNlICp0aWRzcywKPiAgCQkJIHN0cnVj
dCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZSwKPiAgCQkJIHUzMiBlbmNvZGVyX3R5cGUsIHUzMiBw
b3NzaWJsZV9jcnRjcykKPiBAQCAtOTUsOCArOTksOCBAQCBpbnQgdGlkc3NfZW5jb2Rlcl9jcmVh
dGUoc3RydWN0IHRpZHNzX2RldmljZSAqdGlkc3MsCj4gIAlpZiAoSVNfRVJSKHRfZW5jKSkKPiAg
CQlyZXR1cm4gUFRSX0VSUih0X2VuYyk7Cj4gIAo+IC0JcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVy
X2luaXQoJnRpZHNzLT5kZGV2LCAmdF9lbmMtPmVuY29kZXIsCj4gLQkJCQkgICAgICBlbmNvZGVy
X3R5cGUpOwo+ICsJcmV0ID0gZHJtX2VuY29kZXJfaW5pdCgmdGlkc3MtPmRkZXYsICZ0X2VuYy0+
ZW5jb2RlciwKPiArCQkJICAgICAgICZ0aWRzc19lbmNvZGVyX2Z1bmNzLCBlbmNvZGVyX3R5cGUs
IE5VTEwpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBi
dXQgY2FuIHRoaXMgbGVhZCB0byBhIHVzZS1hZnRlci1mcmVlIGR1cmluZwp0ZWFyZG93biBkdWUg
dG8gbWlzbWF0Y2hlZCBvYmplY3QgbGlmZXRpbWVzPwoKSW4gdGlkc3NfZW5jb2Rlcl9jcmVhdGUo
KSwgdGhlIHRfZW5jIHN0cnVjdHVyZSBpcyBhbGxvY2F0ZWQgdmlhCmRldm1fZHJtX2JyaWRnZV9h
bGxvYygpLCB3aGljaCB0aWVzIHRoZSBtZW1vcnkncyBsaWZldGltZSB0byB0aGUgYnJpZGdlJ3MK
a3JlZi4KClRoZW4gdGhlIGVtYmVkZGVkIGVuY29kZXIgaXMgaW5pdGlhbGl6ZWQgaGVyZSBhbmQg
aXRzIGRlc3Ryb3kgY2FsbGJhY2sgaXMgc2V0CnRvIGRybV9lbmNvZGVyX2NsZWFudXAoKSBpbiB0
aWRzc19lbmNvZGVyX2Z1bmNzLgoKSWYgdGhlIGRyaXZlciB1bmJpbmRzIHdoaWxlIGEgdXNlcnNw
YWNlIGFwcGxpY2F0aW9uIGhvbGRzIGEgRFJNIGZpbGUKZGVzY3JpcHRvciwgZGV2bSBkcm9wcyB0
aGUgaW5pdGlhbCBicmlkZ2UgcmVmZXJlbmNlcy4gTGF0ZXIsIHdoZW4gdGhlIGZpbmFsCkRSTSBy
ZWZlcmVuY2UgaXMgZHJvcHBlZCwgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBjYWxscyB0aGUg
ZW5jb2RlcidzCmRlc3Ryb3kgY2FsbGJhY2suCgpJbnNpZGUgZHJtX2VuY29kZXJfY2xlYW51cCgp
LCBpdCBkZXRhY2hlcyB0aGUgYnJpZGdlLiBUaGlzIGRyb3BzIHRoZSBmaW5hbAprcmVmIGFuZCBm
cmVlcyB0aGUgdF9lbmMgY29udGFpbmVyLiBIb3dldmVyLCBkcm1fZW5jb2Rlcl9jbGVhbnVwKCkg
dGhlbgpjb250aW51ZXMgdG8gYWNjZXNzIHRoZSBmcmVlZCBlbmNvZGVyIG1lbW9yeSwgY2F1c2lu
ZyBhIHVzZS1hZnRlci1mcmVlLgoKRG9lcyB0aGlzIHNlcXVlbmNlIGNhdXNlIG1lbW9yeSBjb3Jy
dXB0aW9uIGR1cmluZyB0ZWFyZG93bj8KCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA3MTktZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQtdjEtMC1hNzhjNTA5ZTMwNjJAZ21haWwu
Y29tP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
