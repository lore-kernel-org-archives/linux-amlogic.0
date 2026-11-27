Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BD606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7T/ood3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWxrjGMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8AjT8d8XKTRL1sMKu+NJqyKAVOmh58KzuNk+JaEzzns=; b=R7T/ood3q2+3X9S5Z2dQqEfeT4
	aFrz39+dmQuyJHaQ6Bj5rauzjA2JWH0LyRFtaN0zdm/UCoWdlnMYIM86P8jTLjSVx3Rynpwl9CwmA
	epBHoeEYRpoZ/7ozarp5sSOusf5C8n6xTkMHMq+5XYO1exbvNGSGA8n7pSlfw9l/wmoRLrSPmCs/N
	z4oGpw/N/1imKWeuiCp47AN3b3YELp7QuAFvpZgknb7SG0ToLjQr7uDRzx8VfU0GGiXlWGH2wbCW8
	ENEcSji84zNvPKHWtqeRobo8CJYmaBaToLrL6dZzUpbVuC4RTEGpQV1duPMfN52gCATDttXbNvYG1
	QGeZszYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy9-0000000G5O2-069y;
	Fri, 27 Nov 2026 12:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWux6-0000000G4e1-0Wtx
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:21:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 719F062958;
	Fri, 27 Nov 2026 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4357F1F00924;
	Fri, 27 Nov 2026 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782078;
	bh=ZFwKN1Fa/NE4ipfk2II223W7kJwBqBxqrAot+Ny010o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWxrjGMrLFKBHEJheFxE7/iq0h4YMlWz6RPpUp3+P81zuuC+O+ihcEnzFmD7v4oc+
	 RogJ6bK4vz9CQYgTlFKZFrXJNpeTZFrrq68XDObdZjNoHGdtW2yr5TeExZH7mtOTjN
	 KKM3LCPsaJW0jXoKWpFMIQ+2JaQBX0WZvvaYg7xrvP/AUF+xeRKbJKwbuuCXmTDfhD
	 X8rrSWwXLhG3nAKOK9v64goz6Wq/CvEq2UrLEENAaQ9+rZMKD1M953XJwUaNt9Vqsd
	 pnq4t5m3GMibofju4oHUdC6sNTH/rZquv4skOs9x7wkoYpWf4G+fHnpGznNtcyxULi
	 VkreUYCuGNDiw==
Message-ID: <sashiko-outbox-237356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 27/30] crypto: amlogic: fix probe and algorithm
 registration error paths
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20261127120103.1532882-28-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-28-jnieto.alaber@gmail.com>
Date: Fri, 27 Nov 2026 12:21:17 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIGNyeXB0bzogYW1sb2dp
Yzogc3RhbGUgbWMgcG9pbnRlcnMgbGVmdCBieQogIG1lc29uX3VucmVnaXN0ZXJfYWxncygpCi0g
W01lZGl1bV0gY3J5cHRvOiBhbWxvZ2ljOiBjb21wbGV0aW9uIGluaXRpYWxpemVkIGFmdGVyIElS
USBpbgogIG1lc29uX2FsbG9jYXRlX2NoYW5saXN0KCkKLS0KCmNvbW1pdCA2ZjZhYjZmYWRjZDgy
ODBhNmE1NjNkZGNmMWU4ZmVhNjJiNDQ3YjAwCkF1dGhvcjogSm9zZSBOaWV0byA8am5pZXRvLmFs
YWJlckBnbWFpbC5jb20+CgpjcnlwdG86IGFtbG9naWM6IGZpeCBwcm9iZSBhbmQgYWxnb3JpdGht
IHJlZ2lzdHJhdGlvbiBlcnJvciBwYXRocwoKVGhpcyBjb21taXQgdXBkYXRlcyBtZXNvbl9hbGxv
Y2F0ZV9jaGFubGlzdCgpIHRvIHByb3BhZ2F0ZSBuZWdhdGl2ZQpyZXR1cm4gdmFsdWVzIGZyb20g
cGxhdGZvcm1faXJxX2NvdW50KCkgYW5kIHVud2luZCBhbGxvY2F0ZWQgY2hhbm5lbHMgb24KSVJR
IGZhaWx1cmUsIGFuZCBjbGVhcnMgYWxnc1tpXS5tYyBvbiByZWdpc3RyYXRpb24gZmFpbHVyZSBp
bgptZXNvbl9yZWdpc3Rlcl9hbGdzKCkuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9h
bWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dp
Yy1neGwtY29yZS5jCj4gaW5kZXggOGNlM2Y2NjQwNzUzNy4uYzExZDdkODI1MGVhZSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCgpbIC4uLiBdCgo+IEBA
IC0xMTcsMTQgKzExOSwxOCBAQCBzdGF0aWMgaW50IG1lc29uX2FsbG9jYXRlX2NoYW5saXN0KHN0
cnVjdCBtZXNvbl9kZXYgKm1jKQo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBtYy0+Zmxvd19jbnQ7
IGkrKykgewo+ICAJCW1jLT5jaGFubGlzdFtpXS5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IGkpOwo+IC0JCWlmIChtYy0+Y2hhbmxpc3RbaV0uaXJxIDwgMCkKPiAtCQkJcmV0dXJuIG1jLT5j
aGFubGlzdFtpXS5pcnE7Cj4gKwkJaWYgKG1jLT5jaGFubGlzdFtpXS5pcnEgPCAwKSB7Cj4gKwkJ
CWVyciA9IG1jLT5jaGFubGlzdFtpXS5pcnE7Cj4gKwkJCWktLTsKPiArCQkJZ290byBlcnJvcl9l
bmdpbmU7Cj4gKwkJfQo+ICAKPiAgCQllcnIgPSBkZXZtX3JlcXVlc3RfaXJxKG1jLT5kZXYsIG1j
LT5jaGFubGlzdFtpXS5pcnEsCj4gIAkJCQkgICAgICAgbWVzb25faXJxX2hhbmRsZXIsIDAsICJh
bWwtY3J5cHRvIiwgbWMpOwo+ICAJCWlmIChlcnIgPCAwKSB7Cj4gIAkJCWRldl9lcnIobWMtPmRl
diwgIkNhbm5vdCByZXF1ZXN0IElSUSBmb3IgZmxvdyAlZFxuIiwgaSk7Cj4gLQkJCXJldHVybiBl
cnI7Cj4gKwkJCWktLTsKPiArCQkJZ290byBlcnJvcl9lbmdpbmU7Cj4gIAkJfQo+ICAKPiAgCQlp
bml0X2NvbXBsZXRpb24oJm1jLT5jaGFubGlzdFtpXS5jb21wbGV0ZSk7CgpbU2V2ZXJpdHk6IE1l
ZGl1bV0KQ2FuIG1lc29uX2lycV9oYW5kbGVyKCkgZmlyZSBiZWZvcmUgbWMtPmNoYW5saXN0W2ld
LmNvbXBsZXRlIGlzCmluaXRpYWxpemVkPwoKZGV2bV9yZXF1ZXN0X2lycSgpIGVuYWJsZXMgdGhl
IGludGVycnVwdCBiZWZvcmUgaW5pdF9jb21wbGV0aW9uKCkgcnVucy4KSWYgYSBwZW5kaW5nIGlu
dGVycnVwdCBpcyByYWlzZWQgaW4gdGhhdCB3aW5kb3csIG1lc29uX2lycV9oYW5kbGVyKCkKY2Fs
bHMgY29tcGxldGUoJm1jLT5jaGFubGlzdFtmbG93XS5jb21wbGV0ZSkgb24gYSB6ZXJvZWQgY29t
cGxldGlvbiB3aG9zZQp3YWl0LnRhc2tfbGlzdCBwb2ludGVycyBhcmUgc3RpbGwgTlVMTCwgY2F1
c2luZyBhIE5VTEwgcG9pbnRlcgpkZXJlZmVyZW5jZSBpbiBzd2FrZV91cF9sb2NrZWQoKS4gIElu
aXRpYWxpemluZyB0aGUgY29tcGxldGlvbiBiZWZvcmUKcmVxdWVzdGluZyB0aGUgSVJRIGF2b2lk
cyB0aGlzIHdpbmRvdy4KCj4gQEAgLTE2OSw2ICsxNzUsNyBAQCBpbnQgbWVzb25fcmVnaXN0ZXJf
YWxncyhzdHJ1Y3QgbWVzb25fZGV2ICptYywgc3RydWN0IG1lc29uX2FsZ190ZW1wbGF0ZSAqYWxn
cywKPiAgCQkJaWYgKGVycikgewo+ICAJCQkJZGV2X2VycihtYy0+ZGV2LCAiRmFpbCB0byByZWdp
c3RlciAlc1xuIiwKPiAgCQkJCQlhbGdzW2ldLmFsZy5za2NpcGhlci5iYXNlLmJhc2UuY3JhX25h
bWUpOwo+ICsJCQkJYWxnc1tpXS5tYyA9IE5VTEw7Cj4gIAkJCQltZXNvbl91bnJlZ2lzdGVyX2Fs
Z3MobWMsIGFsZ3MsIGNvdW50KTsKPiAgCQkJCXJldHVybiBlcnI7Cj4gIAkJCX0KPiBAQCAtMTc4
LDYgKzE4NSw3IEBAIGludCBtZXNvbl9yZWdpc3Rlcl9hbGdzKHN0cnVjdCBtZXNvbl9kZXYgKm1j
LCBzdHJ1Y3QgbWVzb25fYWxnX3RlbXBsYXRlICphbGdzLAo+ICAJCQlpZiAoZXJyKSB7Cj4gIAkJ
CQlkZXZfZXJyKG1jLT5kZXYsICJGYWlsIHRvIHJlZ2lzdGVyICVzXG4iLAo+ICAJCQkJCWFsZ3Nb
aV0uYWxnLmFoYXNoLmJhc2UuaGFsZy5iYXNlLmNyYV9uYW1lKTsKPiArCQkJCWFsZ3NbaV0ubWMg
PSBOVUxMOwo+ICAJCQkJbWVzb25fdW5yZWdpc3Rlcl9hbGdzKG1jLCBhbGdzLCBjb3VudCk7Cj4g
IAkJCQlyZXR1cm4gZXJyOwo+ICAJCQl9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBtZXNvbl91
bnJlZ2lzdGVyX2FsZ3MoKSBsZWF2ZSBzdGFsZSBub24tTlVMTCBhbGdzW2ldLm1jIHBvaW50ZXJz
IGluCnRoZSBzdGF0aWMgYWxnb3JpdGhtIHRlbXBsYXRlIGFycmF5cz8KCmRyaXZlcnMvY3J5cHRv
L2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jOm1lc29uX3VucmVnaXN0ZXJfYWxncygpIHsKCWZv
ciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CgkJaWYgKCFhbGdzW2ldLm1jKQoJCQljb250aW51
ZTsKCQlzd2l0Y2ggKGFsZ3NbaV0udHlwZSkgewoJCWNhc2UgQ1JZUFRPX0FMR19UWVBFX1NLQ0lQ
SEVSOgoJCQljcnlwdG9fZW5naW5lX3VucmVnaXN0ZXJfc2tjaXBoZXIoJmFsZ3NbaV0uYWxnLnNr
Y2lwaGVyKTsKCQkJYnJlYWs7CgkJY2FzZSBDUllQVE9fQUxHX1RZUEVfQUhBU0g6CgkJCWNyeXB0
b19lbmdpbmVfdW5yZWdpc3Rlcl9haGFzaCgmYWxnc1tpXS5hbGcuYWhhc2gpOwoJCQlicmVhazsK
CQl9Cgl9Cn0KCkJlY2F1c2UgdGhlIHRlbXBsYXRlIGFycmF5cyBpbiBhbWxvZ2ljLWd4bC1jaXBo
ZXIuYyBhbmQKYW1sb2dpYy1neGwtaGFzaGVyLmMgYXJlIHN0YXRpYyBhbmQgbWVzb25fdW5yZWdp
c3Rlcl9hbGdzKCkgZG9lcyBub3QgY2xlYXIKYWxnc1tpXS5tYyBhZnRlciB1bnJlZ2lzdGVyaW5n
LCBhbnkgdW5iaW5kIG9yIHByb2JlIHJvbGxiYWNrIGxlYXZlcwpkYW5nbGluZyBtYyBwb2ludGVy
cyBhY3Jvc3MgYWxsIGVudHJpZXMuICBJZiBhIGxhdGVyIHByb2JlIGZhaWxzIHBhcnR3YXkKdGhy
b3VnaCBtZXNvbl9yZWdpc3Rlcl9hbGdzKCkgYXQgaW5kZXggaSA8IGNvdW50IC0gMSwgY2xlYXJp
bmcgb25seQphbGdzW2ldLm1jIHN0aWxsIGxlYXZlcyBhbGdzW2kgKyAxIC4uIGNvdW50IC0gMV0u
bWMgbm9uLU5VTEwgZnJvbSB0aGUKcHJldmlvdXMgcnVuLCBzbyBtZXNvbl91bnJlZ2lzdGVyX2Fs
Z3MobWMsIGFsZ3MsIGNvdW50KSB3aWxsIHRyeSB0bwp1bnJlZ2lzdGVyIGFsZ29yaXRobXMgdGhh
dCB3ZXJlIG5vdCByZWdpc3RlcmVkIGFuZCBoaXQgV0FSTl9PTigpIGluCmNyeXB0b191bnJlZ2lz
dGVyX2FsZygpLiAgQ2xlYXJpbmcgYWxnc1tpXS5tYyA9IE5VTEwgaW4KbWVzb25fdW5yZWdpc3Rl
cl9hbGdzKCkgKG9yIHBhc3NpbmcgaSBpbnN0ZWFkIG9mIGNvdW50IG9uIHJvbGxiYWNrKSB3b3Vs
ZApwcmV2ZW50IHRoaXMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3MTIwMTAzLjE1MzI4ODItMS1qbmlldG8uYWxhYmVyQGdt
YWlsLmNvbT9wYXJ0PTI3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
