Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FCA606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 20:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zH5+ZCpg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQ+8kPxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m7Pu8WGUm+ouTZ/8wrV+ddW6OKFplqxI3StBw1ij/AM=; b=zH5+ZCpgZtH18j/oi0X4KSV2Hc
	TtioggRtdBQu8GwoqAq9Oru2JHHsuPf42o7Fg9f9qXih2PlqC55efVFP2AWxxnnF5YrCtMxje7FJh
	FO0qYvHzzNyw4zy3RnhTChX3bNWYQvhlFGHA1ttgYhREz3uTlpPW28RHOa7xRzQO321+mDB8w7dQB
	w1R3VN8FPun4GZbhrv8AsxdxjUOkvnIfQuzUBOCXnuGpOkx6UaTanejIt4dWpi5kOkGVCbgKPrl6Q
	GjPeLRBrv8wkcGczfwBJilEbZqfoZnWgdPbtSoDJ5L2e5XnkSO8h+ZNa2Ija+TDuRQamHzMBl/IJt
	uPpih45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfeS-0000000EQEc-484j;
	Thu, 26 Nov 2026 20:01:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfeS-0000000EQEW-0Fh8
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 20:01:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFA0E41A68;
	Thu, 26 Nov 2026 20:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0880A1F000D2;
	Thu, 26 Nov 2026 20:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795723263;
	bh=JCXkt01VM6U/p+0B+tdrqVqUmglqEINGvVX7k+vJJ0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QQ+8kPxarTAXPrxzVhz6Wm20mtwm9s1ldQX1dNi1cBpqnC5iq8aQbcRFNbW+aNkxp
	 9RKY91D2pCLbPzsajyW5pvc42wALgiHKemoFyi8Gq/ikXXrtDWhYHSKmq3nRnXhwvG
	 uxaaCc9tzwSM3wRsyFudkaihA48SbyQ8GL9gL4dFdDUW7eSPTmN79yVZyJPNQrMEdb
	 jfPQGq/ynke5W2tEqeNRph9RIxFwMJFxmELbHH/g7AZrkJoCzGNz9UeuFE1EKnnThp
	 rbzfQP21TtwFXsyDhHi/ZKZnGrB0FdGV+XX7lzYFyh8IOR9PtKWdOVXNeh7ZcjNIJx
	 P2G9QwWh/0DIw==
Message-ID: <sashiko-outbox-236139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 22/25] arm64: dts: amlogic: a1: add crypto node
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261126193241.1471372-23-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-23-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 20:01:02 +0000
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
b2dpYzogYTE6IGZha2UgY2xrODEgZml4ZWQtY2xvY2sgdXNlZCBpbnN0ZWFkCiAgb2YgY2xrY19w
ZXJpcGhzCi0tCgpjb21taXQgZjYzMjQ4NTRkMWM4NjQyZWVlNTFlZDExYzA4NDNiYjgxYmQyY2U3
NgpBdXRob3I6IEFsZXhleSBSb21hbm92IDxyb21hbm92LmFsZXhleTIwMDBAZ21haWwuY29tPgoK
YXJtNjQ6IGR0czogYW1sb2dpYzogYTE6IGFkZCBjcnlwdG8gbm9kZQoKVGhpcyBjb21taXQgYWRk
cyBhIGNyeXB0byBjb250cm9sbGVyIG5vZGUgYW5kIGEgZml4ZWQtY2xvY2sgY2xrODEgbm9kZSB0
bwp0aGUgQW1sb2dpYyBNZXNvbiBBMSBkZXZpY2V0cmVlLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tYTEuZHRzaQo+IGluZGV4IDZmNmE2MTQ1Y2JhMTIuLjM5NjI2MGI3YjM5
ODkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0
c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+IEBA
IC02ODYsNiArNjg2LDE0IEBAIHNkX2VtbWM6IG1tY0AxMDAwMCB7Cj4gIAkJCQlhc3NpZ25lZC1j
bG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DPjsKPiAgCQkJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDI0MDAwMDAwPjsKPiAgCQkJfTsKPiArCj4gKwkJCWNyeXB0bzogY3J5cHRv
QDYwMDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGExLWNyeXB0byI7Cj4gKwkJCQly
ZWcgPSA8MHgwIDB4NjAwMCAweDAgMHg0OD47Cj4gKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTIwIElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiArCQkJCWNsb2NrcyA9IDwmY2xrODE+Owo+ICsJ
CQkJcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX0RNQV9JRD47Cj4gKwkJCX07Cj4gIAkJfTsK
PiAgCj4gIAkJdXNiOiB1c2JAZmUwMDQ0MDAgewo+IEBAIC03NjcsNCArNzc1LDEwIEBAIHh0YWw6
IHh0YWwtY2xrIHsKPiAgCQljbG9jay1vdXRwdXQtbmFtZXMgPSAieHRhbCI7Cj4gIAkJI2Nsb2Nr
LWNlbGxzID0gPDA+Owo+ICAJfTsKPiArCj4gKwljbGs4MTogY2xrODEgewo+ICsJCWNvbXBhdGli
bGUgPSAiZml4ZWQtY2xvY2siOwo+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCQljbG9jay1m
cmVxdWVuY3kgPSA8NjQwMDAwMDA+Owo+ICsJfTsKPiAgfTsKCltTZXZlcml0eTogTWVkaXVtXQpT
aG91bGQgY3J5cHRvQDYwMDAgdGFrZSBpdHMgY2xvY2sgZnJvbSAmY2xrY19wZXJpcGhzIGluc3Rl
YWQgb2YgZGVmaW5pbmcgYQpzZXBhcmF0ZSByb290IGZpeGVkLWNsb2NrIG5vZGU/CgptZXNvbi1h
MS5kdHNpIGFscmVhZHkgZGVmaW5lcyBjbGtjX3BlcmlwaHMgKCJhbWxvZ2ljLGExLXBlcmlwaGVy
YWxzLWNsa2MiKSwKd2hpY2ggcmVnaXN0ZXJzIHRoZSBBMSBzeXN0ZW0gYW5kIERNQSBjbG9ja3Mg
KENMS0lEX1NZUyBhbmQgQ0xLSURfRE1BKS4KQWRkaW5nIGEgc3ludGhldGljIDY0IE1IeiBjbGs4
MSBmaXhlZC1jbG9jayBub2RlIGJ5cGFzc2VzIHRoZSBTb0MgY2xvY2sKY29udHJvbGxlciBhbmQg
dXNlcyBhIG5vbi1nZW5lcmljIG5vZGUgbmFtZSB0aGF0IGRvZXMgbm90IG1hdGNoIHRoZQpeY2xv
Y2stKFswLTldK3xbYS16MC05LV0rKSQgcGF0dGVybiByZXF1aXJlZCBieSBmaXhlZC1jbG9jay55
YW1sLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MTEyNjE5MzI0MS4xNDcxMzcyLTEtam5pZXRvLmFsYWJlckBnbWFpbC5jb20/cGFy
dD0yMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
