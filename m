Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD704C88E7F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IE+QUurgN2IEW5YzPhz9mr/f6HMKXWbbr1Ws1Xju8VM=; b=af/US8PqXdi/VW
	L7MWJHOP0jJODqEgPRgVI60zqWx0IFYUZ0fTJjG4jyV84dSQy24GlV4IbPUzCBr6y+1B6KFVehbJS
	HjopJNFhsvXp+yF13pcjdxhB7u7TpYBDM8oT/fflDk0OJUCkJEmWEWsrm5+9uT5kd1+QVx6lClc6T
	idqtMLZ7DKjfCFr584rCqHW/GFTMRRe3KTN/jQSxStCmDfVU2aS7KpW0q6VFkAJwqOroxFW/Voaa2
	i3hhFxi4mtKYhQAg2qcB6tbQDaZbRnGQD8y5GSDI5RanbWuvm7Tq1PG2gTkqbcyk1GxdLnB9KS+0z
	vlrHKxmzhmn5s6vL365w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tsW-00000009uiS-3Vdo;
	Wed, 16 Sep 2026 17:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tsW-00000009uiB-0knT
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 17:57:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47A9A601FD;
	Wed, 16 Sep 2026 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32161F000FF;
	Wed, 16 Sep 2026 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789581423;
	bh=Rxf52q7m0XLLaGWl95zuXypp2FtwcdsJBVE4lvNVpCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ll6H4fbznSI7mNLP1pLgKpFGoUnNVytKimGf/ORTpIx5kyOXc9nhP68m4+k766wMD
	 9mHP+E1CA25rsjH47vXpij+1LWNaMjLis9cCM34zmqcmeo5jCCaa7MH+SveIdWUSrH
	 wTm6ZujhmJPrtFxPKDNkjtaunKcjo1fx3Sy5bbLDBGjKQJ6mPLE909unDz9fJ9MXmu
	 K07+wpBS1TMePRdP0tneIz70+IbGUiqn1rSMetsIWOgyBC3HboGPRrEk7CHzOseEzQ
	 KAqdOd/UHrsoVCHB0MluQ5WkXP235WMSJgRT+yReaRiIL3w8Wkx5y0j43OfVs0al65
	 b3mx1fRw3dbXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/meson: Fix next_bridge reference leak in
 meson_encoder_dsi_probe()
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260916174543.2089062-1-vulab@iscas.ac.cn>
References: <20260916174543.2089062-1-vulab@iscas.ac.cn>
Date: Wed, 16 Sep 2026 17:57:02 +0000
Message-Id: <20260916175702.B32161F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHJtL21lc29uOiBp
bmNvcnJlY3QgZml4IGNyZWF0ZXMgbGF0ZW50IGRvdWJsZS1wdXQgb2YgbmV4dF9icmlkZ2UKLS0K
CmNvbW1pdCAzZmY3NTdjZTQ2ODFmYzhlZTQ5MTU3OTEzNTQyYWYzNDNmZDNlMDIxCkF1dGhvcjog
V2VudGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KCmRybS9tZXNvbjogRml4IG5leHRfYnJp
ZGdlIHJlZmVyZW5jZSBsZWFrIGluIG1lc29uX2VuY29kZXJfZHNpX3Byb2JlKCkKClRoZSBjb21t
aXQgYXR0ZW1wdHMgdG8gZml4IGEgcmVmZXJlbmNlIGxlYWsgb24gdGhlIG5leHQgYnJpZGdlIGJ5
IG1hbnVhbGx5CmNhbGxpbmcgZHJtX2JyaWRnZV9wdXQoKSBvbiBlcnJvciBwYXRocyB3aGVuIGRy
bV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkKb3IgZHJtX2JyaWRnZV9hdHRhY2goKSBmYWlscy4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfZHNpLmMKPiBpbmRleCAzZTQyMmI2
MTJmNzRiLi40MzY3MTQ1ZDM3NzUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9lbmNvZGVyX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2VuY29kZXJfZHNpLmMKPiBAQCAtMTM1LDE3ICsxMzUsMjEgQEAgaW50IG1lc29uX2VuY29kZXJf
ZHNpX3Byb2JlKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpCj4gIAkvKiBFbmNvZGVyICovCj4gIAly
ZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChwcml2LT5kcm0sICZtZXNvbl9lbmNvZGVyX2Rz
aS0+ZW5jb2RlciwKPiAgCQkJCSAgICAgIERSTV9NT0RFX0VOQ09ERVJfRFNJKTsKPiAtCWlmIChy
ZXQpCj4gKwlpZiAocmV0KSB7Cj4gKwkJZHJtX2JyaWRnZV9wdXQobWVzb25fZW5jb2Rlcl9kc2kt
PmJyaWRnZS5uZXh0X2JyaWRnZSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIG1hbnVh
bCBwdXQgaW5jb3JyZWN0bHkgY2lyY3VtdmVudCB0aGUgYnJpZGdlIGxpZmVjeWNsZSBBUEkgaW5z
dGVhZApvZiBwcm9wZXJseSByZW1vdmluZyB0aGUgbWFpbiBicmlkZ2U/CgpUaGUgY29ycmVjdCB3
YXkgdG8gbWFuYWdlIHRoaXMgcmVmZXJlbmNlIGlzIHZpYSB0aGUgbWFpbiBicmlkZ2UncyBsaWZl
Y3ljbGUsCmFzIF9fZHJtX2JyaWRnZV9mcmVlKCkgYXV0b21hdGljYWxseSBkcm9wcyB0aGUgbmV4
dF9icmlkZ2UgcmVmZXJlbmNlIHdoZW4gdGhlCm1haW4gYnJpZGdlIGlzIGZyZWVkLiBCZWNhdXNl
IHRoZSBwYXRjaCBuZWdsZWN0cyB0byBjYWxsIGRybV9icmlkZ2VfcmVtb3ZlKCkKZm9yIHRoZSBt
YWluIGJyaWRnZSAod2hpY2ggaXMgd2h5IG5leHRfYnJpZGdlIHdhcyBsZWFraW5nIGluIHRoZSBm
aXJzdCBwbGFjZSksCnRoZSBtYWluIGJyaWRnZSBpcyBsZWZ0IGxlYWtpbmcgaW4gdGhlIGdsb2Jh
bCBicmlkZ2VfbGlzdC4KCklmIHRoZSBtYWluIGJyaWRnZSBsZWFrIGlzIGV2ZXIgcHJvcGVybHkg
Zml4ZWQgaW4gdGhlIGZ1dHVyZSAoZS5nLiwgYnkgYWRkaW5nCmRybV9icmlkZ2VfcmVtb3ZlKCkg
b3IgdXNpbmcgZGV2bV9kcm1fYnJpZGdlX2FkZCgpKSwgdGhlIG1hbnVhbApkcm1fYnJpZGdlX3B1
dCgpIGludHJvZHVjZWQgaGVyZSB3aWxsIHJlc3VsdCBpbiBhIGRvdWJsZS1wdXQgYW5kCnVzZS1h
ZnRlci1mcmVlLgoKPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShwcml2LT5kZXYsIHJldCwKPiAg
CQkJCSAgICAgIkZhaWxlZCB0byBpbml0IERTSSBlbmNvZGVyXG4iKTsKPiArCX0KPiAgCj4gIAlt
ZXNvbl9lbmNvZGVyX2RzaS0+ZW5jb2Rlci5wb3NzaWJsZV9jcnRjcyA9IEJJVCgwKTsKPiAgCj4g
IAkvKiBBdHRhY2ggRFNJIEVuY29kZXIgQnJpZGdlIHRvIEVuY29kZXIgKi8KPiAgCXJldCA9IGRy
bV9icmlkZ2VfYXR0YWNoKCZtZXNvbl9lbmNvZGVyX2RzaS0+ZW5jb2RlciwgJm1lc29uX2VuY29k
ZXJfZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+IC0JaWYgKHJldCkKPiArCWlmIChyZXQpIHsKPiAr
CQlkcm1fYnJpZGdlX3B1dChtZXNvbl9lbmNvZGVyX2RzaS0+YnJpZGdlLm5leHRfYnJpZGdlKTsK
CltTZXZlcml0eTogTWVkaXVtXQpDYW4gdGhpcyBzZWNvbmQgbWFudWFsIGNsZWFudXAgYWxzbyBh
Y3QgYXMgYSBsYXRlbnQgZG91YmxlLXB1dCB0cmFwPwoKVGhpcyBhcHBsaWVzIHRoZSBzYW1lIGlu
Y29ycmVjdCBtYW51YWwgY2xlYW51cCBvbiB0aGUgc2Vjb25kIGVycm9yIHBhdGguCgo+ICAJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKHByaXYtPmRldiwgcmV0LAo+ICAJCQkJICAgICAiRmFpbGVkIHRv
IGF0dGFjaCBicmlkZ2VcbiIpOwo+ICsJfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNjE3NDU0My4yMDg5MDYyLTEtdnVsYWJA
aXNjYXMuYWMuY24/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
