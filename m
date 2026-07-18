Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C5C44521
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crhfaQHoNqDNix8s+huwd69Ok8Y1I6mxluI8InBfSX4=; b=RzuJBnCxD/fbmU
	dMGqezVwRA7jMBzI8kqnIMNXTYtBg3MEIz/z1v0DsmqD3XCy2rrLGrgJ+9HUEOyermbSWV2GMY9TC
	md1iKywLjSnTaoZw8zDn6ywTwFr3J32oNJaEcxY7sYGTx+crfTBFkNClT+SYUKctJFeNWx4sPbfN0
	zuBaSvkwxmAWlPZxoM+NFc7KF6mMQyfxFDeNDxUp4NpiURfymYtfzJCIv94vV5ic/7IATLfX6JOTU
	y1WQR4diS3NI544gMIGoeVdeRu1Zx/WL/YJDXaS1uGeqDmsttFXcShUIl9XpaHh1uUMN//HdIfizz
	2Iia9rAMKCpfoEZ3EEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEob-00000004dBF-1qli;
	Sat, 18 Jul 2026 23:51:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEoa-00000004dB7-26Uo
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E65C60008;
	Sat, 18 Jul 2026 23:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66121F000E9;
	Sat, 18 Jul 2026 23:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784418685;
	bh=4OVsQf/yiuG67ARP6+Rl9z4GLpfAIYz6W7pHbzFxoRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgSZz3sXBEyoc4ZJPqe6zXYKq7KFDW6SjfP6hN3kTqIG/6AhnzVeXH+ZtOPmnIAv6
	 Ef2XmFgYqEFgLICSlNXfLI1GfECIMVvxwfVf+6xoz3tSGGVxGwhURkMcvm9iScM9jS
	 +vvp38J5I2UxJYxfS9WhBrdEEmF8yv9ObZo2SzmTsdDdiWFvg1xci6/PlMXxAkWG7u
	 oQbAMBOHcf7nt2lTbIA8CPs3q5DKGnmfA+Mk5rk4Tk0yOhAmvU1DBwqGTHcd6BHgMB
	 TFHfM7ZEUrLyeeWStrBOzceTrCtUHvl6/DYwGUBtieb1G077Zed9lyxQRoAiS3Wk2b
	 w28Jde70pzdCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
Date: Sat, 18 Jul 2026 23:51:24 +0000
Message-Id: <20260718235124.C66121F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIHBhdGNoIHN1Y2Nl
c3NmdWxseSByZW1vdmVzIGBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpYCBidXQgZmFpbHMgdG8g
cmVtb3ZlIGl0cyBjb3JyZXNwb25kaW5nIGNvbXBsZXRlZCB0YXNrIGZyb20gdGhlIEdQVSBUT0RP
IGxpc3QuCi0tCgotLS0gUGF0Y2ggWzE0XTogW1BBVENIIDE0LzE1XSBkcm0vZHJtX3NpbXBsZTog
cmVtb3ZlIGRlcHJlY2F0ZWQgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQgZnVuY3Rpb24gLS0tCmNv
bW1pdCA3ZmQ1YmU2M2Y0OGJhMjU0MGVjMWI1YjdkYzEzN2M1NGE4NTk5N2Y4CkF1dGhvcjogRGlv
Z28gU2lsdmEgPGRpb2dvbXBhaXNzaWx2YUBnbWFpbC5jb20+Cgpkcm0vZHJtX3NpbXBsZTogcmVt
b3ZlIGRlcHJlY2F0ZWQgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQgZnVuY3Rpb24KClRoaXMgcGF0
Y2ggcmVtb3ZlcyB0aGUgZGVwcmVjYXRlZCBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpIGhlbHBl
ciBzaW5jZSBhbGwKZHJpdmVyIHVzZXJzIGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gZHJtX2VuY29k
ZXJfaW5pdCgpLiBJdCBhbHNvIG9wZW4tY29kZXMKdGhlIHJlbWFpbmluZyBpbnRlcm5hbCB1c2Ug
dG8gcHJldmVudCBhbnkgbmV3IHVzZXJzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9zaW1wbGVfa21zX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21z
X2hlbHBlci5jCj4gaW5kZXggOGUxZDA3YjlmMWUzMC4uNzg3OGI5ZDdkNTI0OCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMKClsgLi4uIF0KCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmgKPiBpbmRleCBjYjY3MmNlMGU4NTZkLi5jOTVmODZmZjM1NWZm
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmgKPiBAQCAtNjgsMTAgKzY4LDYg
QEAgaW50IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKPiAgCQkJY29uc3QgdWludDY0X3QgKmZvcm1hdF9tb2RpZmllcnMsCj4gIAkJCXN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpOwo+ICAKPiAtaW50IGRybV9zaW1wbGVfZW5jb2Rlcl9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gLQkJCSAgICBzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsCj4gLQkJCSAgICBpbnQgZW5jb2Rlcl90eXBlKTsKPiAtCj4gIHZvaWQgKl9fZHJt
bV9zaW1wbGVfZW5jb2Rlcl9hbGxvYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzaXplX3Qgc2l6
ZSwKPiAgCQkJCSAgc2l6ZV90IG9mZnNldCwgaW50IGVuY29kZXJfdHlwZSk7Cj4gIAoKW1NldmVy
aXR5OiBMb3ddClRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBzaW5jZSB0aGlzIHBhdGNoIHN1Y2Nlc3Nm
dWxseSByZW1vdmVzIHRoZQpkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpIGhlbHBlciwgc2hvdWxk
IGl0IGFsc28gcmVtb3ZlIHRoZSBjb3JyZXNwb25kaW5nCmNvbXBsZXRlZCB0YXNrIGZyb20gRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3Q/CgpMZWF2aW5nIHRoZSBpdGVtIGluIHRoZSBUT0RPIGxp
c3QgbWlnaHQgY29uZnVzZSBmdXR1cmUgY29udHJpYnV0b3JzIHNpbmNlIHRoZQpyZWZhY3Rvcmlu
ZyBlZmZvcnQgaXMgbm93IGNvbXBsZXRlLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxOS1kcm1fc2ltcGxlX2VuY29kZXJfaW5p
dC12MS0wLWE3OGM1MDllMzA2MkBnbWFpbC5jb20/cGFydD0xNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
