Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20463CD98D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPlmFqdfXbM1JZ6wQkmQnUTalccIk+kC1ZVVPHnltR4=; b=mi5sdUrtvHsPYq
	dlXyZLzqXvcx5dPRdqUbzYoyK9vy77NfZbucQ3rGOw9E1mCwquEWfQ3MhkBDN4U96yAIsmDMHX8uO
	zRbgVkIz/RIVu29L2n43A9LaOK53FezzRorAeCNpfR2pXhHJudk+jdCMSB0JB2DGqDKy6txIA8jkG
	vZPcSwAtAbLBunI9YSdLNERazcc1cAhYaF9YDcBe1NpsMX7wms5R8qFSsxyW0rTtRLeOHBWLVdnNF
	qS9xuvmqtS7rquuAYmuYub7BtcyE798ClMufjYwqJN3Axs+NfnDIbklyqa7tePpfeoa6bZIhbZXXc
	TO1SCpzTS2ProGdy+vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaMt-00000008ww7-1DUM;
	Thu, 11 Jun 2026 08:02:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaMs-00000008wvr-2SLc
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:02:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2888643EAD;
	Thu, 11 Jun 2026 08:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE9D1F00893;
	Thu, 11 Jun 2026 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164946;
	bh=EQM1VJawKxw/i2NTQxcq+FzM1j2cLHvSGsarXEBjE+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LwA0pS85c9MvgFTu+PKSLtkJVFRrr0IoIDrH6iNGdUqaBo4Ra7ZOrmPhBh+EM4N3L
	 rMQZVdUVwrnBIJEU6jDocfVtlr87yPg+NCDNsITr9lNLDett1aqYwcyGHZiQURLjKf
	 OmdO+64goh01XyjNPXlCKhN6BrRutIvXJk9627R/i9SmQXSjN/gRwFaEkTa3JDgwMs
	 gSACu9S8bNKSFpX/dkWGLqFDz0G1bx5PTaHNgVG/TU2/lvwpykIP4hjbFB2y26xcIW
	 RPz4V/mypdofg49vUAcXqkJtUnV7iA3cZ/Tma46AhTFR1d0QiGq/CvquK2SyL1o5nb
	 cVdLopW9imd1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] pinctrl: meson: amlogic-a4: support
 gpiod_to_irq
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
Date: Thu, 11 Jun 2026 08:02:25 +0000
Message-Id: <20260611080225.BBE9D1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFByZW1hdHVyZSBgb2Zf
bm9kZV9wdXQoKWAgaW4gYGFtbF9nZXRfb2ZfaXJxKClgIGNyZWF0ZXMgYSBkYW5nbGluZyBwb2lu
dGVyLCBsZWFkaW5nIHRvIGEgVXNlLUFmdGVyLUZyZWUuCi0tCgpjb21taXQgNjgyZThmZjhiNTFh
MzEwZGRmNDExNzdkMDQ4MjhhYjJmZDhhNTY3MApBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndl
aS56aGFvQGFtbG9naWMuY29tPgoKcGluY3RybDogbWVzb246IGFtbG9naWMtYTQ6IHN1cHBvcnQg
Z3Bpb2RfdG9faXJxCgpUaGlzIHBhdGNoIGFkZHMgdGhlIHRvX2lycSgpIGNhbGxiYWNrIGltcGxl
bWVudGF0aW9uIHNvIHRoYXQgZ3Bpb2RfdG9faXJxKCkKY2FuIG1hcCBHUElPIGxpbmVzIHRvIElS
UXMgY29ycmVjdGx5LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0
cmwtYW1sb2dpYy1hNC5jIGIvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1h
NC5jCj4gaW5kZXggNWFlMGMxOWQwMDdkNy4uNjYzNjgxODg3ZjM1YyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1hbWxvZ2ljLWE0LmMKPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvbWVzb24vcGluY3RybC1hbWxvZ2ljLWE0LmMKClsgLi4uIF0KCj4gQEAgLTgzNiw2
ICs4MzksMzIgQEAgc3RhdGljIGludCBhbWxfcGN0bF9wYXJzZV9mdW5jdGlvbnMoc3RydWN0IGRl
dmljZV9ub2RlICpucCwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGRl
dmljZV9ub2RlICphbWxfZ2V0X29mX2lycShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICt7Cj4g
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX2lycTsKPiArCj4gKwlvZl9pcnEgPSBvZl9pcnFfZmlu
ZF9wYXJlbnQobnApOwo+ICsJaWYgKG9mX2lycSAmJiBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShv
Zl9pcnEsICJhbWxvZ2ljLG1lc29uLWdwaW8taW50YyIpKSB7Cj4gKwkJb2Zfbm9kZV9wdXQob2Zf
aXJxKTsKPiArCQlyZXR1cm4gb2ZfaXJxOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgcHJl
bWF0dXJlIG9mX25vZGVfcHV0KCkgY2FsbCBjcmVhdGUgYSB1c2UtYWZ0ZXItZnJlZSByaXNrPwoK
b2ZfaXJxX2ZpbmRfcGFyZW50KCkgcmV0dXJucyBhIGRldmljZSBub2RlIHdpdGggYW4gaW5jcmVt
ZW50ZWQgcmVmZXJlbmNlCmNvdW50LiBCeSBjYWxsaW5nIG9mX25vZGVfcHV0KCkgYmVmb3JlIHJl
dHVybmluZyB0aGUgcG9pbnRlciwgdGhlIHJlZmVyZW5jZQppcyBkcm9wcGVkIHdoaWxlIHRoZSBw
b2ludGVyIGlzIHN0aWxsIHBhc3NlZCBiYWNrIGFuZCBjYWNoZWQgaW4gYmFuay0+b2ZfaXJxLgoK
TGF0ZXIsIGFtbF9ncGlvX3RvX2lycSgpIGRlcmVmZXJlbmNlcyB0aGlzIHBvaW50ZXI6CgogICAg
ZndzcGVjLmZ3bm9kZSA9IG9mX2Z3bm9kZV9oYW5kbGUoYmFuay0+b2ZfaXJxKTsKCklmIHRoZSBk
ZXZpY2Ugbm9kZSBpcyBkeW5hbWljYWxseSBmcmVlZCAoZm9yIGV4YW1wbGUsIGR1cmluZyBEZXZp
Y2UgVHJlZQpvdmVybGF5IHJlbW92YWwpIGJldHdlZW4gY2FjaGluZyBhbmQgdXNlLCB0aGlzIHdv
dWxkIGxlYWQgdG8gYQp1c2UtYWZ0ZXItZnJlZS4gU2hvdWxkIHdlIHJldGFpbiB0aGUgcmVmZXJl
bmNlIGhlcmUgdW50aWwgZHJpdmVyIHRlYXJkb3duCmluc3RlYWQ/Cgo+ICsJfQo+ICsKPiArCWlm
IChvZl9pcnEpCj4gKwkJb2Zfbm9kZV9wdXQob2ZfaXJxKTsKPiArCj4gKwlyZXR1cm4gTlVMTDsK
PiArfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDYxMS1ncGlvLXRvLWlycS12MS0wLTEyMjAxNzE2ZjIzZkBhbWxvZ2ljLmNvbT9w
YXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
