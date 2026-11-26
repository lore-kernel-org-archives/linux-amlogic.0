Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32031606A326
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDrfoNE8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EI8CSyo0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O4DZ9nOmUHCXuQRph2hHOjNcLzvLsyNgpj34U7vB2rc=; b=nDrfoNE8VDHloPwi6pl0w5eANx
	nEwTE5T4fFYG2jslC9raMPziMc5ybTrmx+6TqngkwYMpSJsqNFMgSBJ8f6wcrhZzgvb5QW3CG6U8r
	4dkkDyvXKewk9OwXvcExi0f5LuP8vZu+CEZqp4/XXocfiX9xwYED/N5v/5iLgHwrwBCFCzzaqYgF2
	zTzWrIH2p9qQV+2V2nq2hINLKJnx9j1zUjSoeKlkKj3PH2W8bf8UhAXr3C8pvX6UtrOur/tAL4gxR
	n9hIkBRV9QQJOtOE6CCNWQ2+UfoqSsOc++1qsYECc9tBbzYKhLdBVmvntKww+q90wNxbDvYjh1gU2
	G7vhafIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfO9-0000000ENNQ-3mNZ;
	Thu, 26 Nov 2026 19:44:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfO8-0000000ENN8-0T1R
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:44:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D91EA40A73;
	Thu, 26 Nov 2026 19:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14EC1F000E0;
	Thu, 26 Nov 2026 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722251;
	bh=QwKK9giXi3Mifiny2Uylg0cCiIO9ScqGZxIfscA3Np8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EI8CSyo064WHZfPU/gT46c6fun4q/KdGJ7x3OcpnrxKTVnCvIw0XgQldJjwK2LPKG
	 C0OwQzC/nhA0ItmOKlJefI/0xXVqmKhLU4unrRXwNzP0DCFxv7jajP1A/4MTIm8Vwi
	 aik/vKruuTnbYDkJA4HdkcT/r33COESC4v0ycnqG5/RUpUpQmP1SkqV93DmWV4OJqZ
	 l0M/Jd02amOQnknyApixurN15T8oijIuzVWQx0wVPwJVDc5HgVjXYrsW/XBeGuoeCN
	 1zbT+etN6xMloHGJuos18fhnK4XvL1n2QaJ4pcbS0MLDDhJ4sQAYWhM5q1xu1KYdxp
	 8867DMfmtYHCw==
Message-ID: <sashiko-outbox-236113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 05/25] crypto: amlogic - Remove clock input
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261126193241.1471372-6-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-6-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 19:44:10 +0000
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
ZW50Ci0tCgpjb21taXQgNmUyYTFiMDY0ODIyNjcwNzhiNDdmZjNlMjFmYmRmMWJiZWI1ZDYwMwpB
dXRob3I6IEFsZXhleSBSb21hbm92IDxyb21hbm92LmFsZXhleTIwMDBAZ21haWwuY29tPgoKY3J5
cHRvOiBhbWxvZ2ljIC0gUmVtb3ZlIGNsb2NrIGlucHV0CgpUaGlzIGNvbW1pdCByZW1vdmVzIHRo
ZSAiYmxrbXYiIGNsb2NrIGFjcXVpc2l0aW9uIGFuZCB0aGUgYnVzY2xrIGZpZWxkCmZyb20gdGhl
IEFtbG9naWMgR1hMIGNyeXB0byBkcml2ZXIuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0
by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1s
b2dpYy1neGwtY29yZS5jCj4gaW5kZXggMjRlZjdkNWE1NjA3NS4uMzcyMjRkNzVlZGZiZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwo+ICsr
KyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jClsgLi4uIF0KPiBA
QCAtMjY3LDEzICsyNjYsNiBAQCBzdGF0aWMgaW50IG1lc29uX2NyeXB0b19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihtYy0+YmFzZSkpCj4gIAkJcmV0
dXJuIFBUUl9FUlIobWMtPmJhc2UpOwo+ICAKPiAtCW1jLT5idXNjbGsgPSBkZXZtX2Nsa19nZXRf
ZW5hYmxlZCgmcGRldi0+ZGV2LCAiYmxrbXYiKTsKPiAtCWlmIChJU19FUlIobWMtPmJ1c2Nsaykp
IHsKPiAtCQllcnIgPSBQVFJfRVJSKG1jLT5idXNjbGspOwo+IC0JCWRldl9lcnIoJnBkZXYtPmRl
diwgIkNhbm5vdCBnZXQvZW5hYmxlIGNvcmUgY2xvY2sgZXJyPSVkXG4iLCBlcnIpOwo+IC0JCXJl
dHVybiBlcnI7Cj4gLQl9Cj4gLQo+ICAJZXJyID0gbWVzb25fYWxsb2NhdGVfY2hhbmxpc3QobWMp
Owo+ICAJaWYgKGVycikKPiAgCQlyZXR1cm4gZXJyOwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3Vs
ZCBtZXNvbl9jcnlwdG9fcHJvYmUoKSBwYXNzIE5VTEwgdG8gZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
KSBpbnN0ZWFkIG9mCmRyb3BwaW5nIHRoZSBjbG9jayBlbmFibGVtZW50IGVudGlyZWx5PwoKRWFy
bGllciBpbiB0aGlzIHNlcmllcywgY29tbWl0ICJkdC1iaW5kaW5nczogY3J5cHRvOiBhbWxvZ2lj
LGd4bC1jcnlwdG86CmNvcnJlY3QgY2xrIGFuZCBpbnRlcnJ1cHQgbGluZXMiIHJlbW92ZWQgY2xv
Y2stbmFtZXMgYmVjYXVzZSB0aGUgY3J5cHRvIElQCmlzIGNsb2NrZWQgYnkgY2xrODEgcmF0aGVy
IHRoYW4gYmxrbXYsIGJ1dCBrZXB0IHRoZSB1bm5hbWVkIGNsb2Nrcwpwcm9wZXJ0eSByZXF1aXJl
ZCBpbiB0aGUgYmluZGluZzoKCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlw
dG8vYW1sb2dpYyxneGwtY3J5cHRvLnlhbWwgewogICAgLi4uCiAgICByZXF1aXJlZDoKICAgICAg
LSBjb21wYXRpYmxlCiAgICAgIC0gcmVnCiAgICAgIC0gaW50ZXJydXB0cwogICAgICAtIGNsb2Nr
cwp9CgpSZW1vdmluZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGxlYXZlcyB0aGUgcmVxdWlyZWQg
RFQgY2xvY2sgdW5jbGFpbWVkIGFuZAp1bmVuYWJsZWQgYnkgdGhlIGRyaXZlci4KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjYx
OTMyNDEuMTQ3MTM3Mi0xLWpuaWV0by5hbGFiZXJAZ21haWwuY29tP3BhcnQ9NQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
