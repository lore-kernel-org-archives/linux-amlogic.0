Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11ABCD4F3C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OM445DtOoQTO4FF/EBnjD5xhKFJHvRbKAs1zBPlT7aU=; b=fqxUHShi3ZVsyo
	BCRooJ7bfLl0PizsvTEMjwSV5YADdRueZ/bnSSpQFjsuPnWjb6Dz+RY7fIB9bPiGBH4N8ub4gIzmS
	z3Sw7W8QEWRT27CZQY0+cWMeXG3uLdC4s5ygYgf+8GL/P6yfRxzur4vbnfTGPn85wxL3Tkl0Xw2J1
	xSGgNqwwJI7Q/nF/jUN+yWVYpz1WlNVYefr/xlyAxCKHGDYfyszcOtk7XQ6TNeJ9pvmu5rpsNTjES
	m83CSY+RdFVXPKHb0X4FYITKBj2P65SmRiKlCd+JzZVCkjctAMgwHhD0CbGiFYQoj/93phI0qkMKL
	wOmunV/k2R6VuRUVED6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtaB-0000000ErZA-3bvZ;
	Mon, 18 May 2026 08:44:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtaB-0000000ErYv-2JBx
	for linux-amlogic@bombadil.infradead.org;
	Mon, 18 May 2026 08:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Reply-To:
	Subject:From:Sender:MIME-Version:Content-ID:Content-Description;
	bh=G0ipTXP5+s2XTxC29V6vNqJu5Si1NzMws0KbG97yohg=; b=RjsrKZRn5Xh9OMfyzsVL7RmFVA
	KCmyfcfFH11nrRiMViCaAkk+CDcGzrvPA3/fyTYIBAKg2EOGrTSsx8NYfiFHGinycgweYIyz7A8/4
	+GxZidJwdCB6c7rSuPd+fY0AsZ4HyyOWuFU+pFUrpNE26GEvrkB2lii6wEZe0Kwr6avTebtwEyJCP
	pm156hdkCoWuhZdEkQaAQZl60Eh0m8dV1lvlYn1EYUVme+iQExSZPQi9xXYlfzd1usj4CcoZ/S/Es
	F0oAX0FqM97VrSDftVw3w5X4s4ZuErwxv/NlvfP+KaCp6WOjNwdD+8LSbiVVKjXXlqNFqVBXn/biP
	vcfCpS8Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOta7-0000000AR8a-410o
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 08:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B90A843B94;
	Mon, 18 May 2026 08:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AC9C2BCB7;
	Mon, 18 May 2026 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779093850;
	bh=GDWli9pmUG2KiP4exeFJ5QJcI5U6ei4NjxUrKtxPBgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fuLknw73j8/I+axhI+QiuoNT11Z5+9fKyM0QDpCgsUg5u/vrWzwR4/AvpXGkwgSEB
	 fm4tUFKZldqJKWhyk8BPLOeU77wBN/SzB2v5FdEAaxwPvxs1dEKDLiuxaYdKzqzQn1
	 YXHqQwOpB43QXhM+EionAzi6yjAcd0yACV4OY6NPIH/lgVUtza7jM2LqekHa3uxx9F
	 RfLXcXb/VZ91WwqT9TRnvSx8RDs5wfkZN3bZslMHVmwbyI+TMW0CFCarGV4eRUxEN7
	 wRyUL5eHxBz5lVW7H/yv79e6KFo18cjULaISF3aUsufdHQ+E0rYI5R2bTnJrrSf+mO
	 8x8pNV76VJkAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
Date: Mon, 18 May 2026 08:44:09 +0000
Message-Id: <20260518084410.74AC9C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_094412_689039_AEB83202 
X-CRM114-Status: GOOD (  13.38  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEluY29tcGxldGUgZml4
OiBUaGUgR1BJTyBvdXRwdXQgZ2xpdGNoIGJ1ZyBpcyBpZGVudGljYWxseSBwcmVzZW50IGluIHRo
ZSBjb3JlIGBwaW5jdHJsLW1lc29uLmNgIGRyaXZlciwgbGVhdmluZyBvdGhlciBBbWxvZ2ljIFNv
Q3MgdnVsbmVyYWJsZS4KLSBbSGlnaF0gQUEgZGVhZGxvY2sgaW4gYGFtbF9waW5jb25mX3NldF8q
YCBmdW5jdGlvbnMgdHJpZ2dlcmFibGUgZnJvbSB1c2Vyc3BhY2UgdmlhIEdQSU8gY2hhcmFjdGVy
IGRldmljZS4KLS0KCmNvbW1pdCA5MWQ5M2EwNmEwZTk2ODFiOTQ2MjE1MDRhZjc5NjhiOGE2ZjRm
MTU1CkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpwaW5j
dHJsOiBtZXNvbjogYW1sb2dpYy1hNDogZml4IGdwaW8gb3V0cHV0IGdsaXRjaAoKVGhpcyBjb21t
aXQgZml4ZXMgYSBicmllZiBsb3ctbGV2ZWwgZ2xpdGNoIG9uIEdQSU8gbGluZXMgZHVyaW5nIHRo
ZQp0cmFuc2l0aW9uIGZyb20gYm9vdGxvYWRlciB0byBrZXJuZWwuIEl0IGRvZXMgdGhpcyBieSBz
d2FwcGluZyB0aGUKY29uZmlndXJhdGlvbiBvcmRlciB0byBzZXQgdGhlIG91dHB1dCB2YWx1ZSBi
ZWZvcmUgc3dpdGNoaW5nIHRoZSBwaW4KZGlyZWN0aW9uIHRvIG91dHB1dC4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9naWMtYTQuYyBiL2RyaXZlcnMv
cGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9naWMtYTQuYwo+IGluZGV4IDM1ZDI3NjI2YTMzNmIu
LjFiZDU4ZmJiZDI2YWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0
cmwtYW1sb2dpYy1hNC5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1s
b2dpYy1hNC5jCj4gQEAgLTU0OCwxMSArNTQ4LDExIEBAIHN0YXRpYyBpbnQgYW1sX3BpbmNvbmZf
c2V0X291dHB1dF9kcml2ZShzdHJ1Y3QgYW1sX3BpbmN0cmwgKmluZm8sCj4gIHsKPiAgCWludCBy
ZXQ7Cj4gIAo+IC0JcmV0ID0gYW1sX3BpbmNvbmZfc2V0X291dHB1dChpbmZvLCBwaW4sIHRydWUp
Owo+ICsJcmV0ID0gYW1sX3BpbmNvbmZfc2V0X2RyaXZlKGluZm8sIHBpbiwgaGlnaCk7CgpEb2Vz
IHRoaXMgY2FsbCBjaGFpbiB0cmlnZ2VyIGFuIEFBIGRlYWRsb2NrIHdoZW4gY29uZmlndXJlZCBh
dCBydW50aW1lPwoKV2hlbiBhIEdQSU8gbGluZSdzIGNvbmZpZ3VyYXRpb24gaXMgY2hhbmdlZCBm
cm9tIHVzZXJzcGFjZSAoZm9yIGV4YW1wbGUsIHZpYQp0aGUgR1BJT19WMl9MSU5FX1NFVF9DT05G
SUdfSU9DVEwpLCB0aGUgY29yZSBwaW5jdHJsX2dwaW9fc2V0X2NvbmZpZygpCmZ1bmN0aW9uIGFj
cXVpcmVzIHBjdGxkZXYtPm11dGV4IGJlZm9yZSBpbnZva2luZyB0aGUgLnBpbl9jb25maWdfc2V0
IGNhbGxiYWNrLgoKSWYgYW1sX3BpbmNvbmZfc2V0X2RyaXZlKCkgY2FsbHMgYW1sX3BpbmNvbmZf
c2V0X2dwaW9fYml0KCksIGFuZCB0aGF0IGZ1bmN0aW9uCnN0aWxsIHVzZXMgcGluY3RybF9maW5k
X2dwaW9fcmFuZ2VfZnJvbV9waW4oKSwgaXQgd2lsbCBhdHRlbXB0IHRvIGFjcXVpcmUgdGhlCnNh
bWUgcGN0bGRldi0+bXV0ZXguCgpBIHByZXZpb3VzIGNvbW1pdCBmaXhlZCBhIHNpbWlsYXIgZGVh
ZGxvY2sgZm9yIHRoZSBfZ2V0IGZ1bmN0aW9ucyBieSBzd2l0Y2hpbmcKdG8gcGluY3RybF9maW5k
X2dwaW9fcmFuZ2VfZnJvbV9waW5fbm9sb2NrKCkuIERvIHRoZSBfc2V0IGZ1bmN0aW9ucyBuZWVk
IHRoZQpzYW1lIHVwZGF0ZT8KCkFkZGl0aW9uYWxseSwgd2hpbGUgdGhpcyByZXNvbHZlcyB0aGUg
Z2xpdGNoIGZvciB0aGUgYW1sb2dpYy1hNCBkcml2ZXIsIGRvZXMKdGhlIGNvcmUgcGluY3RybC1t
ZXNvbi5jIGRyaXZlciBoYXZlIHRoZSBzYW1lIGlzc3VlPyBMb29raW5nIGF0Cm1lc29uX3BpbmNv
bmZfc2V0X291dHB1dF9kcml2ZSgpIGluIHRoZSBjb3JlIGRyaXZlciwgaXQgYXBwZWFycyB0byBz
dGlsbApjYWxsIG1lc29uX3BpbmNvbmZfc2V0X291dHB1dCgpIGJlZm9yZSBtZXNvbl9waW5jb25m
X3NldF9kcml2ZSgpLiBDb3VsZApvdGhlciBBbWxvZ2ljIFNvQ3MgYmUgdnVsbmVyYWJsZSB0byB0
aGUgc2FtZSByZWd1bGF0b3IgY29udHJvbCBnbGl0Y2gKdW5sZXNzIHRoZSBvcmRlciBpcyBzd2Fw
cGVkIHRoZXJlIGFzIHdlbGw/Cgo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAt
CXJldHVybiBhbWxfcGluY29uZl9zZXRfZHJpdmUoaW5mbywgcGluLCBoaWdoKTsKPiArCXJldHVy
biBhbWxfcGluY29uZl9zZXRfb3V0cHV0KGluZm8sIHBpbiwgdHJ1ZSk7Cj4gIH0KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MTgt
Zml4LXNldC12YWx1ZS1nbGl0Y2gtdjEtMS1kMzUwNzMyZGM5MzRAYW1sb2dpYy5jb20/cGFydD0x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
