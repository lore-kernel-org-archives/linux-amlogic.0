Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA74606AC13
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tbNb/eBv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZPgdAFT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ftUJx/gKTEiz9ox3kJXzLwLB3KACJFrCVomZxCXj5M=; b=tbNb/eBvXG3KIQO201GgeCyMEn
	+EMQr4SzPJv8wyUZmQPl3Cf6MaxTRkIB0t6M/rI3jS5ICx0OlP164BQJYjbd/pCKhlTUNgJ0Q1xDB
	5v+yewhSXEQGBkzZ2INfF4bkW5qMXFGxGco4E4HEjYitQibSvf7VSpNfPzzHJEInzidn3NJPY0Y4R
	827ObdM/KTJbPZFtNSXUKrDP/G629/A1ebNawO+YMZ//tEbf2SknUfWlyxMcLRw3NCUorroigivUB
	Lu2/lGJco4323OA38EopNQZPG559a4CxVrLxwYeod9msu6KwohMvaWCjC+qV7ixUuckjdSoo0+HAY
	DDplRd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKy-0000000BTuq-0PjO;
	Fri, 30 Oct 2026 10:59:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKw-0000000BTuL-3BX3
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01C4B40527;
	Fri, 30 Oct 2026 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AB31F00A02;
	Fri, 30 Oct 2026 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357993;
	bh=eR2dhcf8p4YWboqWU5hRPpF8mWLyTjiEgnkIONJGNc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gZPgdAFT+VU0wpUSC1+guG81RN61aC4RcI+2FX2vh146GPek14RJiqdOxiu9ECIYj
	 5+uSNjXE47Rl542yQzo97NNsh6V/NDTw5bvasY75Ea+WCtH+ln+BlSpoGhTTFHI7dB
	 9FirJsTOAklF57nxwuUGylLxC2jvKiqjvR2iRP4I7qjbuO/IIuOrI4W32Vl7rIhnLT
	 46L6RmLsNzTnagFjNhZZm3C+MA4/1rkYdKrLJGSSh7LomdP3AqMmeKDIDNgxbjKjhJ
	 eOWGYHPZnf1GqvJiAyxLJfLzTxegf31SHAse408xgxg8ji4Mkyl9oQr7Kh75Pkgtfp
	 fsw68+UoJi63w==
Date: Fri, 30 Oct 2026 11:59:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Message-ID: <20261030-glossy-coral-worm-bf3ff6@quoll>
References: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjM6MDJQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IEdFMkQgaXMg
Y29tcGF0aWJsZSB3aXRoIHRoZSBBWEcgb25lLCBidXQgc2l0cyBpbiBhIHBvd2VyIGRvbWFpbgo+
IG9mIGl0cyBvd24uIEFkZCBhbiBTNCBjb21wYXRpYmxlIHdpdGggdGhlIEFYRyBvbmUgYXMgZmFs
bGJhY2ssIGFuZAo+IGFsbG93IGEgcG93ZXIgZG9tYWluLgoKRG9lcyB0aGUgQVhHIGhhcyBwb3dl
ciBkb21haW4gdG9vPyBUaGUgcGF0Y2ggY2xhaW1zIHRoYXQgeWVzLCBzbyB5b3UgbWlnaHQKYmUg
bWlzc2luZyBleHBsYW5hdGlvbiBvciAiYWxsT2Y6aWY6dGhlbjoiIGJsb2NrIGRpc2FsbG93aW5n
ICg6IGZhbHNlLApzZWUgZXhhbXBsZS1zY2hlbWEpLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPiAtLS0KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
