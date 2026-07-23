Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B342C531C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2026 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+IlKyZZ7KTM2GoxNlg9tjlurvlRoRiHZfl4rPaRlKo=; b=K+jyWAJf61VfHy
	xe278vPV1M6J50sftu6bQGAqd+jqbTKsi4BP4lyKz/VMfmFrWIhqVa+5BJBwagzVvPCiH60vlomFz
	foj6a6G2XsLBw//alp86Dxjr7Na4T+ftMEXmOqqkdsN5qu6bgNdpl88q3DHEWAh9/KuNJMDGKq6vq
	bnnFd2EfM8JJ+HRaFHxugWRv/t8Y4vXWLfxHdnhK2bVVfrXl6rSxm+FNvlDyJQI9tg0XiTErVdWor
	5kiEH4NDylNxzZrlhAbFdmD0alg9dzPROvbZA+Ik7D4YajYQLD6BIfAr9HDfn9DVSd3Cp2VcPJ2FD
	j7rJXKSkkL+fKiZcAnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqF4-0000000Dy9S-4BlW;
	Thu, 23 Jul 2026 10:01:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqF3-0000000Dy9E-2v9j
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Jul 2026 10:01:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C276A600AD;
	Thu, 23 Jul 2026 10:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279F31F000E9;
	Thu, 23 Jul 2026 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784800884;
	bh=xcGeRsaCXUPiTng/VJjzRdaiMVo2I3vFvm7CnHaRBDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=INJjp5dYsF+IiZ3NV0Oe44JBPvWr0YkgNg1rQPWYuG/HYy/4HnVhcq5MEfRxLKsF/
	 JfmdCZHJf4FqFXoIrwnzBIXmPv4J2N6vrGDchs+nWypksD9MVLLA/e9pXWPSgyNVY9
	 eQFhj0uvxwXUprQG3nSm4N3Wol62qcxYieDq2by7QDVNpG9EVvmKhDmgHovhL8bCRq
	 2Tsw8Z0EMtBYNPt8Xubp90PBUgP1ZqxMRjQ2t6UWd5iXWwDTde1uI+iOUuCrUFdH77
	 A3mCRKeaXbMht/tpCBU90uG4764NbNauHgMmNoA40wNRMBTlLlKTs1sX5HFU53v6Qj
	 KT5moAun1Fnow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] media: cec: ao-cec: Remove redundant dev_err()
To: "Pan Chuang" <panchuang@vivo.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20260723095500.523448-2-panchuang@vivo.com>
References: <20260723095500.523448-1-panchuang@vivo.com>
 <20260723095500.523448-2-panchuang@vivo.com>
Date: Thu, 23 Jul 2026 10:01:23 +0000
Message-Id: <20260723100124.279F31F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGNoZWNrIGZvciBgcGxhdGZvcm1fZ2V0X2lycSgpYCByZXR1cm5pbmcg
YSBuZWdhdGl2ZSBlcnJvciBjb2RlIGNhdXNlcyBmYWlsdXJlcyBsaWtlIGAtRVBST0JFX0RFRkVS
YCB0byBiZSBsb3N0IGFuZCBjb252ZXJ0ZWQgaW50byBgLUVJTlZBTGAuCi0tCgotLS0gUGF0Y2gg
WzFdOiBbUEFUQ0ggMS8zXSBtZWRpYTogY2VjOiBhby1jZWM6IFJlbW92ZSByZWR1bmRhbnQgZGV2
X2VycigpIC0tLQpjb21taXQgMWY0N2QyZWYwYmE2M2NhMmFmMWY3YWFjZjFkNzQ4MTliOTFlYTk0
MApBdXRob3I6IFBhbiBDaHVhbmcgPHBhbmNodWFuZ0B2aXZvLmNvbT4KCm1lZGlhOiBjZWM6IGFv
LWNlYzogUmVtb3ZlIHJlZHVuZGFudCBkZXZfZXJyKCkKClRoaXMgY29tbWl0IHJlbW92ZXMgcmVk
dW5kYW50IGRldl9lcnIoKSBjYWxscyBhZnRlcgpkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkg
aW4gdGhlIE1lc29uIEFPIENFQyBkcml2ZXJzLCBhcyB0aGUgY29yZSBpcnEKY29kZSBub3cgbG9n
cyB0aGVzZSBlcnJvcnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9y
bS9tZXNvbi9hby1jZWMtZzEyYS5jIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24v
YW8tY2VjLWcxMmEuYwo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2Fv
LWNlYy1nMTJhLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1j
ZWMtZzEyYS5jCj4gQEAgLTY4OSwxMCArNjg5LDggQEAgc3RhdGljIGludCBtZXNvbl9hb19jZWNf
ZzEyYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCQkJCW1lc29uX2Fv
X2NlY19nMTJhX2lycSwKPiAgCQkJCQltZXNvbl9hb19jZWNfZzEyYV9pcnFfdGhyZWFkLAo+ICAJ
CQkJCTAsIE5VTEwsIGFvX2NlYyk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgc2luY2UgeW91IGFyZSBtb2RpZnlpbmcgdGhl
CmVycm9yIGhhbmRsaW5nIGhlcmUsIGlzIHRoZXJlIGEgbWlzc2luZyBjaGVjayBmb3IgaXJxIDwg
MCBiZWZvcmUgY2FsbGluZwpkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkgaW4gbWVzb25fYW9f
Y2VjX2cxMmFfcHJvYmUoKT8KCnBsYXRmb3JtX2dldF9pcnEoKSBjYW4gcmV0dXJuIG5lZ2F0aXZl
IGVycm9yIGNvZGVzIGxpa2UgLUVQUk9CRV9ERUZFUi4KQmVjYXVzZSBkZXZtX3JlcXVlc3RfdGhy
ZWFkZWRfaXJxKCkgdGFrZXMgYW4gdW5zaWduZWQgaW50IGZvciB0aGUgSVJRIG51bWJlciwKYSBu
ZWdhdGl2ZSB2YWx1ZSBnZXRzIGNhc3QgdG8gYSBsYXJnZSBwb3NpdGl2ZSBpbnRlZ2VyIGFuZCBm
YWlscyB3aXRoIC1FSU5WQUwuCgpUaGlzIG1hc2tzIHRoZSBvcmlnaW5hbCAtRVBST0JFX0RFRkVS
IGFuZCBjYXVzZXMgdGhlIHByb2JlIHRvIGZhaWwgcGVybWFuZW50bHkKaW5zdGVhZCBvZiBkZWZl
cnJpbmcuCgo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImlycSByZXF1
ZXN0IGZhaWxlZFxuIik7Cj4gKwlpZiAocmV0KQo+ICAJCWdvdG8gb3V0X3Byb2JlX2FkYXB0ZXI7
Cj4gLQl9CgpbIC4uLiBdCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9y
bS9tZXNvbi9hby1jZWMuYyBiL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNl
Yy5jCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMKPiAr
KysgYi9kcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYwo+IEBAIC02MzYs
MTAgKzYzNiw4IEBAIHN0YXRpYyBpbnQgbWVzb25fYW9fY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAkJCQkJbWVzb25fYW9fY2VjX2lycSwKPiAgCQkJCQltZXNvbl9h
b19jZWNfaXJxX3RocmVhZCwKPiAgCQkJCQkwLCBOVUxMLCBhb19jZWMpOwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzIHRoZSBzYW1lIHByZS1leGlzdGluZyBpc3N1ZSBhcyBhYm92ZSwgYnV0IGlu
IG1lc29uX2FvX2NlY19wcm9iZSgpLgpEb2VzIHRoaXMgaXJxIHZhbHVlIG5lZWQgdG8gYmUgY2hl
Y2tlZCBmb3IgPCAwIGJlZm9yZSBpdCBnZXRzIGltcGxpY2l0bHkgY2FzdAp0byBhbiB1bnNpZ25l
ZCBpbnQgYnkgZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpLCBtYXNraW5nIC1FUFJPQkVfREVG
RVI/Cgo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImlycSByZXF1ZXN0
IGZhaWxlZFxuIik7Cj4gKwlpZiAocmV0KQo+ICAJCWdvdG8gb3V0X3Byb2JlX2FkYXB0ZXI7Cj4g
LQl9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzIzMDk1NTAwLjUyMzQ0OC0xLXBhbmNodWFuZ0B2aXZvLmNvbT9wYXJ0PTEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
