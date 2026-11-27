Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C7606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICFdh3yb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2C2JuwP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3jLK/wAtXNcyJr5lnINeI/iEZuZq89Um4SjgmP99pA=; b=ICFdh3ybqU+OS7IiOcbEbsAElg
	fIpEWZJwL//VP9fWtPYgSYZhVtHecedd/gIyqLPQGeN1qkOTDAmE4EhxgubIOv1tqQO8FJDZ06jTN
	r1Lq3P80m5LxObOy0WbktTr3kBpeusVtZe5JVuWSme/4e9d63pOAlro2nJTzW3cW13uGaxdlgfQfu
	XDs5mr9uvKJ2zpraNVYng2bQcW4IHgmP9e76hW0SSzZboGFLTonLecZ2iO1aQG+XenkFRKrC3kG+S
	ZsWi5gwjRpm+/9oHt71p0gQHtqFektiIvGn9ENnPzONcjXvvZdRrJu4bEma6cWi3/f5X58OtWVDLC
	jLXxhuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWurD-0000000G2BJ-1koJ;
	Fri, 27 Nov 2026 12:15:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuqy-0000000G278-0LEF
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:15:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D32A2435BC;
	Fri, 27 Nov 2026 12:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0306F1F00893;
	Fri, 27 Nov 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781699;
	bh=KC0sI7U+oGi2L5pMJnKt6twXEoJzYwf8xpYFpCfd4vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2C2JuwPdWPpGuGVNoVqDhIbANp5RRInz2EYIBNOhA+rONwrlCrmbQUDHz5QBcMOp
	 NAiwX6XlAxQokdQ8b/lv70p+GGaRzYJKG+HfjSLCIy4RGSXiJvm2npfpTTsvpywhJk
	 Tv74Kjj6BvdyLxTPKLRrtnve77xrmaitMMevCAi7/k7FFSwjpwwpgf7uuhXc59hRa+
	 LiD9yqnNW4Jsm6k1DZQQ/1TJMIR8RkvzaNCUJmKBO1fy7Xsc9CW3Uhp+qy9zKEp7q9
	 lq1YC7e24H5O/XyUQwsKx56A0osr5heD+Ldm9hgrZ+QIl9k/Vsil0yyn/nW8MjRgSK
	 7kZiLr6BLB/+g==
Message-ID: <sashiko-outbox-237340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 09/30] crypto: amlogic - Move algs definition and
 cipher API to cipher.c
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261127120103.1532882-10-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-10-jnieto.alaber@gmail.com>
Date: Fri, 27 Nov 2026 12:14:58 +0000
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gY3J5cHRvOiBhbWxvZ2ljOiBt
ZXNvbl9oYW5kbGVfY2lwaGVyX3JlcXVlc3QoKSBsZWZ0IG5vbi1zdGF0aWMKLS0KCmNvbW1pdCAw
NmEzYWZjNjdkZTQ5ZmIzYWY2MDk2MzQwNmY1MDk1NDc5YmJhODk1CkF1dGhvcjogQWxleGV5IFJv
bWFub3YgPHJvbWFub3YuYWxleGV5MjAwMEBnbWFpbC5jb20+CgpjcnlwdG86IGFtbG9naWMgLSBN
b3ZlIGFsZ3MgZGVmaW5pdGlvbiBhbmQgY2lwaGVyIEFQSSB0byBjaXBoZXIuYwoKVGhpcyBjb21t
aXQgbW92ZXMgdGhlIHNrY2lwaGVyIGFsZ29yaXRobSB0ZW1wbGF0ZXMgYW5kIGNpcGhlciByZWdp
c3RyYXRpb24KaGVscGVycyBpbnRvIGFtbG9naWMtZ3hsLWNpcGhlci5jLCBtYWtpbmcgdGhlIGNp
cGhlciBjYWxsYmFjayBmdW5jdGlvbnMKc3RhdGljLgoKW1NldmVyaXR5OiBMb3ddCkluIGRyaXZl
cnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY2lwaGVyLmMgKGxpbmUgMjc2KSBhbmQKZHJp
dmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC5oIChsaW5lIDE3MiksIHNob3VsZAptZXNv
bl9oYW5kbGVfY2lwaGVyX3JlcXVlc3QoKSBhbHNvIGJlIG1hZGUgc3RhdGljIGFuZCBoYXZlIGl0
cyBkZWNsYXJhdGlvbgpyZW1vdmVkIGZyb20gYW1sb2dpYy1neGwuaD8gTGlrZSB0aGUgb3RoZXIg
Y2lwaGVyIGNhbGxiYWNrcywgaXQgaXMgb25seQpyZWZlcmVuY2VkIGJ5IHRoZSBhbGdzW10gYXJy
YXkgaW4gYW1sb2dpYy1neGwtY2lwaGVyLmMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3MTIwMTAzLjE1MzI4ODItMS1qbmll
dG8uYWxhYmVyQGdtYWlsLmNvbT9wYXJ0PTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
