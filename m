Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF630CD6E55
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk8EXm7/Dxfnveufw8brOFIRyj7qnDf1zoi6PL4dzEU=; b=01FLYTTL7lDO7b
	2UN4zveSEeVqvEB3U1XgmEQVHyVDUXQXrXC6BVZ1zemH6kNdxvkvB9pxpTD9yTwRb0rbGL93ftmxq
	g3813zMpcHlL3QYOiVrBGmdRO8lFrNIEqZCjdDOR76jwqDeopZ2JYaGpn0QXnHkgdMmOAqtxqR5xR
	1YBjWNh199kzMIEfI+rFCdOFDcsRLPWqV+okuxAB9Pu+WSL9RDZrTEf3/Cw4APRNaIz/S4G8++QdU
	Y5dqk5H+yt8YriwrFNICJL4xxvGsBRcR0Tmin3kQ89r93O9wYBGXYyiqlYKnrQ5DoIzBojqg4pS9q
	5/d7SucVopQ5MOycVETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb2f-00000009M22-2jZ4;
	Sun, 31 May 2026 07:57:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb2d-00000009M1g-0C6p
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:57:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4363640AF5;
	Sun, 31 May 2026 07:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC9B1F00893;
	Sun, 31 May 2026 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780214222;
	bh=fdNtpbLd9EbFb23aihrGBP/wx61yrLU/BbGsNeSCf1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=meFlhPJMziLQtdDxTZfNqAH38H2dRkf/tcr4ulJcb851hyXupxuxw9VD8f4mv1Izp
	 aOtaA2swHFdBMT0uu8MuUxRahhGeeHzefLMfoIjmaDzoDGjOy/Qkt9j7XZH/WFji/y
	 P9VcWEYdTcaa5L/hV/fDAE1H2DZ94JkBUxeZ8reIBrX3Mq6/1hSjD+9JOi6NPQOoMH
	 TzmOXiLPSp+T+KP5oJJr3OviJXsJSrIRze2SNCr3gR/jYKUKjb8zua1f7TlYLzg/a5
	 n3KM0SXwYkMc3Ir3C9ZCgiqXSdhglKSrQhF1/XG63iCtf1/PiyrVhNj+PiIC2lJQyV
	 KsHeFHFCT/N6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] drm/tidss: Open-code drm_simple_encoder_init()
To: "Naman Arora" <namanarora029@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260531073532.8609-3-namanarora029@gmail.com>
References: <20260531073532.8609-3-namanarora029@gmail.com>
Date: Sun, 31 May 2026 07:57:01 +0000
Message-Id: <20260531075701.ECC9B1F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_005703_112494_7B7C22A5 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBvbiBkcml2ZXIgdW5iaW5kIG9yIHByb2JlIGZhaWx1cmUg
ZHVlIHRvIG1peGVkIGRldm0vZHJtbSBsaWZlY3ljbGVzIGZvciB0aGUgY29tYmluZWQgZW5jb2Rl
ci9icmlkZ2Ugc3RydWN0dXJlLgotLQoKY29tbWl0IGI3NDIxZjJhMDYzNGQ0YTY0ODg0NzhjYjE2
NTEzOWI5MWY5YWZjN2QKQXV0aG9yOiBOYW1hbiBBcm9yYSA8bmFtYW5hcm9yYTAyOUBnbWFpbC5j
b20+Cgpkcm0vdGlkc3M6IE9wZW4tY29kZSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpCgpUaGUg
aGVscGVyIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgaXMgYSB0aGluIHdyYXBwZXIgYXJvdW5k
CmRybV9lbmNvZGVyX2luaXQoKSB3aXRoIGEgc2ltcGxlIGRlc3Ryb3ktb25seSBlbmNvZGVyIGZ1
bmNzIHN0cnVjdC4KUmVtb3ZlIHRoZSBkZXBlbmRlbmN5IG9uIGRybV9zaW1wbGVfa21zX2hlbHBl
ciBieSBvcGVuLWNvZGluZyB0aGUKZW5jb2RlciBpbml0aWFsaXphdGlvbiBkaXJlY3RseSBpbiB0
aGUgZHJpdmVyLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2Vu
Y29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19lbmNvZGVyLmMKPiBpbmRleCAz
NGRiOGQyYTM3OTJlLi4xODQxZGMxNGM3MzliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aWRzcy90aWRzc19lbmNvZGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlk
c3NfZW5jb2Rlci5jCgpbIC4uLiBdCgo+IEBAIC05NSw4ICs5OCw5IEBAIGludCB0aWRzc19lbmNv
ZGVyX2NyZWF0ZShzdHJ1Y3QgdGlkc3NfZGV2aWNlICp0aWRzcywKPiAgCWlmIChJU19FUlIodF9l
bmMpKQo+ICAJCXJldHVybiBQVFJfRVJSKHRfZW5jKTsKPiAgCj4gLQlyZXQgPSBkcm1fc2ltcGxl
X2VuY29kZXJfaW5pdCgmdGlkc3MtPmRkZXYsICZ0X2VuYy0+ZW5jb2RlciwKPiAtCQkJCSAgICAg
IGVuY29kZXJfdHlwZSk7Cj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KCZ0aWRzcy0+ZGRldiwg
JnRfZW5jLT5lbmNvZGVyLAo+ICsJCQkgICAgICAgJnRpZHNzX2RybV9lbmNvZGVyX2Z1bmNzLAo+
ICsJCQkgICAgICAgZW5jb2Rlcl90eXBlLCBOVUxMKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBp
cyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNvdWxkIHRoaXMgbWl4IG9mIGRldm0gYW5kIGRy
bSBsaWZlY3ljbGVzCmxlYWQgdG8gYSB1c2UtYWZ0ZXItZnJlZSBkdXJpbmcgZHJpdmVyIHVuYmlu
ZCBvciBwcm9iZSBmYWlsdXJlPwoKVGhlIHRfZW5jIHN0cnVjdCBpcyBhbGxvY2F0ZWQgdXNpbmcg
ZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCksIGdpdmluZyBpdCBhbgppbml0aWFsIHJlZmNvdW50IG9m
IDEuIEhlcmUsIGRybV9lbmNvZGVyX2luaXQoKSByZWdpc3RlcnMgdGhlIGVtYmVkZGVkCnRfZW5j
LT5lbmNvZGVyLiBMYXRlciBpbiB0aGlzIGZ1bmN0aW9uLCBkcm1fYnJpZGdlX2F0dGFjaCgpIHdp
bGwgaW5jcmVhc2UKdGhlIHJlZmNvdW50IHRvIDIuCgpEdXJpbmcgZHJpdmVyIHVuYmluZCwgZGV2
cmVzIExJRk8gY2xlYW51cCBleGVjdXRlcyB0aGUgYnJpZGdlIHJlbGVhc2UgYWN0aW9uLApjYWxs
aW5nIGRybV9icmlkZ2VfcHV0KCkgYW5kIGRyb3BwaW5nIHRoZSByZWZjb3VudCB0byAxLiBOZXh0
LCB0aGUgZHJtX2RldmljZQpyZWxlYXNlIGFjdGlvbiB0cmlnZ2VycyBkcm1fbW9kZV9jb25maWdf
Y2xlYW51cCgpLCB3aGljaCBjYWxscwpkcm1fZW5jb2Rlcl9jbGVhbnVwKCkuCgpJbnNpZGUgZHJt
X2VuY29kZXJfY2xlYW51cCgpLCBjYWxsaW5nIGRybV9icmlkZ2VfZGV0YWNoKCkgZHJvcHMgdGhl
IGZpbmFsCnJlZmNvdW50IHRvIDAsIGNhdXNpbmcgdF9lbmMgdG8gYmUgZnJlZWQuIEltbWVkaWF0
ZWx5IGFmdGVyIHRoYXQsCmRybV9lbmNvZGVyX2NsZWFudXAoKSBhY2Nlc3NlcyB0aGUgbm93LWZy
ZWVkIGVuY29kZXIgc3RydWN0dXJlLgoKQSBzaW1pbGFyIGlzc3VlIGFwcGVhcnMgdG8gaGFwcGVu
IGlmIGRybV9icmlkZ2VfYXR0YWNoKCkgZmFpbHMgZHVyaW5nIHByb2JlLAphcyBkZXZyZXMgd291
bGQgZnJlZSB0X2VuYywgbGVhdmluZyBhIGRhbmdsaW5nIHBvaW50ZXIgZm9yCmRybV9tb2RlX2Nv
bmZpZ19jbGVhbnVwKCkgdG8gdHJpcCBvdmVyLgoKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJl
dDsKPgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDUzMTA3NDYyNy44OTM2LTEtbmFtYW5hcm9yYTAyOUBnbWFpbC5jb20/cGFydD0y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
