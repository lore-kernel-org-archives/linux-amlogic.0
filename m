Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89D606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r05Up/gt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8JDFsKt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5mDd99vPwWyijrz7lk2W4eXMMtKxjGhNnfwcB3C9YSs=; b=r05Up/gtUERnTxH10ZMa1hNItO
	z4WpwT4bHcmFQLBU8KSLbpqdy2yvi7eAtYn7nK2mzoOtSTLiQ77+p8vUjS96s2QUJBMUBrwOtkAX5
	w4lA6ZKPPub4NuEyWWC+n+Hjpnuq3mEuINixauShcZvCt6Fm4u6Xrqbr5M5m1kMcBqCW3/gY6fV3z
	adgwi8LIA8HVcM5wXlCpmcUkhJeDCPjIyBE09RndCle7PaJWjVvLo2GZnZzTLd2rLsp5e3ihWHAf+
	FFvtycD8WlLrzCea9fiPOfOJFeB3kBHcZW4OALUyC6j3cENVDDFkS1bF0XZLZaQInmUduG99b2+AT
	KPKAx4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuqt-0000000G24k-0t4j;
	Fri, 27 Nov 2026 12:14:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuqs-0000000G246-0aYX
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 908AF61EB8;
	Fri, 27 Nov 2026 12:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0261F0089A;
	Fri, 27 Nov 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781692;
	bh=cleNDJpyMwlEBL17eRU13w6kn3iEKvIT+1gdk3IytiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8JDFsKtETP+zHNB131/9ZZTmUEUaWmoJ9uuozJ2Ar7hcOYExlDQQdgaxI66mmw8N
	 x4iOjfSrs9sJPlt+Wh/SLGUePAMmmOHoELDM/qSR+npAVUmZhkFvGK9B/KGlwKi+Lg
	 LBya1hm0uWZZMdhnE2hSnuMcznZ9l4H2IxtsGBi874mWV/5YpF7oALFZs3AGpRQ6/b
	 Z/Lh63eBegZ42isIPHSWx+J6QWJSymLwEIelL00KelbAkyWEW40ZcDbGLUVhddx4+u
	 AUzo4whBGJK0vfLycdG9HgZOEYsuj1kyu0LWUsN6XREtyKbdYNbHnzOfcvJ7DM57Tq
	 UNcQloaHzBbZA==
Message-ID: <sashiko-outbox-237339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 05/30] crypto: amlogic - Remove clock input
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261127120103.1532882-6-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-6-jnieto.alaber@gmail.com>
Date: Fri, 27 Nov 2026 12:14:51 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gY3J5cHRvOiBhbWxvZ2lj
IC0gbWVzb25fY3J5cHRvX3Byb2JlKCkgZHJvcHMgcmVxdWlyZWQgRFQKICBjbG9jayBlbmFibGVt
ZW50Ci0tCgpjb21taXQgNDIzMjI2OGFmYzJhY2JmNzAwOGU3ZDA4ZTVmNDJiYzgxZDAyMDUzOApB
dXRob3I6IEFsZXhleSBSb21hbm92IDxyb21hbm92LmFsZXhleTIwMDBAZ21haWwuY29tPgoKY3J5
cHRvOiBhbWxvZ2ljIC0gUmVtb3ZlIGNsb2NrIGlucHV0CgpUaGlzIGNvbW1pdCByZW1vdmVzIHRo
ZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGNhbGwgZnJvbSBtZXNvbl9jcnlwdG9fcHJvYmUoKQph
bmQgZHJvcHMgdGhlIGJ1c2NsayBtZW1iZXIgZnJvbSBzdHJ1Y3QgbWVzb25fZGV2LgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgYi9kcml2
ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwo+IGluZGV4IDI0ZWY3ZDVhNTYw
NzUuLjM3MjI0ZDc1ZWRmYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9h
bWxvZ2ljLWd4bC1jb3JlLmMKPiArKysgYi9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMt
Z3hsLWNvcmUuYwpbIC4uLiBdCj4gQEAgLTI2NywxMyArMjY2LDYgQEAgc3RhdGljIGludCBtZXNv
bl9jcnlwdG9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChJU19F
UlIobWMtPmJhc2UpKQo+ICAJCXJldHVybiBQVFJfRVJSKG1jLT5iYXNlKTsKPiAgCj4gLQltYy0+
YnVzY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgImJsa212Iik7Cj4gLQlp
ZiAoSVNfRVJSKG1jLT5idXNjbGspKSB7Cj4gLQkJZXJyID0gUFRSX0VSUihtYy0+YnVzY2xrKTsK
PiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDYW5ub3QgZ2V0L2VuYWJsZSBjb3JlIGNsb2NrIGVy
cj0lZFxuIiwgZXJyKTsKPiAtCQlyZXR1cm4gZXJyOwo+IC0JfQo+IC0KPiAgCWVyciA9IG1lc29u
X2FsbG9jYXRlX2NoYW5saXN0KG1jKTsKPiAgCWlmIChlcnIpCj4gIAkJcmV0dXJuIGVycjsKCltT
ZXZlcml0eTogTWVkaXVtXQpTaG91bGQgbWVzb25fY3J5cHRvX3Byb2JlKCkgcGFzcyBOVUxMIHRv
IGRldm1fY2xrX2dldF9lbmFibGVkKCkgaW5zdGVhZCBvZgpkcm9wcGluZyBjbG9jayBlbmFibGVt
ZW50IGFsdG9nZXRoZXI/CgpFYXJsaWVyIGluIHRoaXMgc2VyaWVzLCBjb21taXQgImR0LWJpbmRp
bmdzOiBjcnlwdG86IGFtbG9naWMsZ3hsLWNyeXB0bzoKY29ycmVjdCBjbGsgYW5kIGludGVycnVw
dCBsaW5lcyIgc3RhdGVzIHRoYXQgdGhlIGNyeXB0byBibG9jayBpcyBjbG9ja2VkIGJ5CmNsazgx
IHJhdGhlciB0aGFuIGJsa212LCByZW1vdmVzIG9ubHkgY2xvY2stbmFtZXMsIGFuZCBrZWVwcyBj
bG9ja3MgYXMgYQpyZXF1aXJlZCBwcm9wZXJ0eSBpbgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY3J5cHRvL2FtbG9naWMsZ3hsLWNyeXB0by55YW1sOgoKICByZXF1aXJlZDoKICAg
IC0gY29tcGF0aWJsZQogICAgLSByZWcKICAgIC0gaW50ZXJydXB0cwogICAgLSBjbG9ja3MKCldp
dGhvdXQgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCksIHRoZSByZXF1aXJl
ZCBjbG9jayBkZWZpbmVkIGluCnRoZSBiaW5kaW5nIGFuZCBkZXZpY2UgdHJlZSBub2RlcyBpcyBu
ZXZlciBjbGFpbWVkIG9yIGVuYWJsZWQgYnkgdGhlIGRyaXZlciwKbGVhdmluZyB0aGUgY3J5cHRv
IERNQSBlbmdpbmUgdW5jbG9ja2VkIGlmIHRoZSBnYXRlIGlzIG5vdCBrZXB0IG9uIGJ5IHRoZQpi
b290bG9hZGVyIG9yIHRlbXBvcmFyeSBDTEtfSVNfQ1JJVElDQUwgLyBDTEtfSUdOT1JFX1VOVVNF
RCBmbGFncy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMjcxMjAxMDMuMTUzMjg4Mi0xLWpuaWV0by5hbGFiZXJAZ21haWwuY29t
P3BhcnQ9NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
