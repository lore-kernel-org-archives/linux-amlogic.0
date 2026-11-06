Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190D606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9s13qcK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb74MZKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vJveM9DEvKipUHbILrKA5uOdi+zu47oft+KLOOGAScE=; b=S9s13qcKVAJXryhKgByvguT5Sn
	F+7+r0Q3qvcUqSPyYcLkEasreaEgCs5YwLLBZ7euMHIE3HhROFcpME7iD1RGm2hdM1i8/lT9R0r7g
	8TYQkV3KytiX4TJ5zh9R41ketk316tRYQsLyv0nn9ieJvFke9uQ/gMIown5SOYhPKpQkmeRmIyLg4
	cULSdv1UNdjZCBWAJv09ZiZViPoSWKJkGSbQiOKjhlqmTdXoq0u34QMbYtwROGh9OvC67tTsin/2X
	Zjt32kzKhRt9GgX+7NuXx3A0x8rCkHF5kQEq2nMN5zXVDXzVvXvtApvDEh+DQrSEEb0lyhYBBeT5s
	mRKZ3DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZV-0000000C2hN-1Kbl;
	Fri, 06 Nov 2026 10:53:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZU-0000000C2gs-1p4g
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88F25605EB;
	Fri,  6 Nov 2026 10:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6BE1F008A2;
	Fri,  6 Nov 2026 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962403;
	bh=8uOm752qSbHewlwvTq64qs6Wrb1DhXsjIgUxAiKYfJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lb74MZKPJpgMAashAyeBJ3hqeVIsyKY3nxEyEE7IUrH0+9Iteovv0PfkkCdV7tyIY
	 Jh34W4RQjNCcpPf92hs/CAEb9ni85zCqqyRhwUfYt9cc3aPMMVLyTtLLnUdq6jjAZA
	 ioiNEcCY6PIQjGIHxj1nnKk5JCEv7JUdpS04YWFwkpriWLYTWcXU1hri0eODadgS/A
	 D9J6yo1FJhLZrhQ8KQBqWzTfJf5c9XbFOH2vUqC5Hh9g2MFk4U7F9hcHHs2jNBlHTg
	 e4+XIBhuqEtJBXWM9KnVGn2tg2aUDHZXX1m4ubzpMV5+f/PW7N5MLf+P8wG2gohl5J
	 5XtT8iMOVLqBw==
Message-ID: <sashiko-outbox-201239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] arm64: dts: amlogic: meson-s4: add the GE2D
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:53:22 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gYXJtNjQ6IGR0czogYW1s
b2dpYzogbWVzb24tczQ6IGdlMmQgbm9kZSBtaXNzaW5nCiAgYW1sb2dpYyxheGctZ2UyZCBmYWxs
YmFjawotLQoKY29tbWl0IDBkYjQwYTI4YWIxOGJhM2M3MmEzNDY1OWJkNzA4ZDNlODYwNzNjNzAK
QXV0aG9yOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5k
ZT4KCmFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29uLXM0OiBhZGQgdGhlIEdFMkQKClRoaXMgY29t
bWl0IGFkZHMgdGhlIEdFMkQgMkQgZ3JhcGhpY3MgYWNjZWxlcmF0b3Igbm9kZSB0byB0aGUgQW1s
b2dpYyBTNCBTb0MKZGV2aWNldHJlZS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLXM0LmR0c2kKPiBpbmRleCAxZThiODQ1YjgwYzMxLi44YmJkNzBlNTJhMjk5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiBAQCAtMTk5LDYgKzE5
OSwxNiBAQCBzb2Mgewo+ICAJCSNzaXplLWNlbGxzID0gPDI+Owo+ICAJCXJhbmdlczsKPiAgCj4g
KwkJZ2UyZDogZ2UyZEBmZjA0MDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC1n
ZTJkIjsKPiArCQkJcmVnID0gPDB4MCAweGZmMDQwMDAwIDB4MCAweDEwMDAwPjsKPiArCQkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDIxNyBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4gKwkJCWNsb2Nr
cyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX0dFMkQ+Owo+ICsJCQlyZXNldHMgPSA8JnJlc2V0IFJF
U0VUX0dFMkQ+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZwd3JjIFBXUkNfUzRfR0UyRF9JRD47
Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwkJfTsKCltTZXZlcml0eTogTWVkaXVtXQpT
aG91bGQgdGhlIGdlMmQgbm9kZSBpbmNsdWRlICJhbWxvZ2ljLGF4Zy1nZTJkIiBhcyBhIGZhbGxi
YWNrIGNvbXBhdGlibGUgc3RyaW5nPwoKbWVzb25fZ2UyZF9tYXRjaCBpbiBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2FtbG9naWMvbWVzb24tZ2UyZC9nZTJkLmMgb25seQptYXRjaGVzICJhbWxvZ2lj
LGF4Zy1nZTJkIiwgc28gd2l0aG91dCB0aGUgZmFsbGJhY2sgY29tcGF0aWJsZSB0aGUgZHJpdmVy
IHdpbGwKbmV2ZXIgYmluZCB3aGVuIHRoaXMgbm9kZSBpcyBlbmFibGVkLiAgSW4gYWRkaXRpb24s
CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLGF4Zy1nZTJk
LnlhbWwgc2V0cwphZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UgYW5kIGRvZXMgbm90IGRvY3Vt
ZW50ICJhbWxvZ2ljLHM0LWdlMmQiIG9yCnBvd2VyLWRvbWFpbnMsIHdoaWNoIGNhdXNlcyBkdGJz
X2NoZWNrIHRvIGZhaWwuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTA2MTA0NjU5LjU0NjU2LTEtY2hyaXN0aWFuLmtvZXZlci1k
cmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ/cGFydD03CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
