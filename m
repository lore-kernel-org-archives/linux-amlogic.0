Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF3606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjMWMTgB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxYJjrQC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JvkAD28VJvacSpEummYxcxgBsRGtajowreuT5cK/r6k=; b=LjMWMTgBv/1BwDEi188Az5w8ug
	OHveriHh50es+IgHwvg3g4GvVl4NPFTeo93VuMsl6jFEbV4kJBHWHmojH+XeH/S91W5GkB2CuW/6J
	PEIhJKK2IWjkIgWWjVeplj29rJsKEUpWndGdABzvcJ/9nOhU2XqvBpSp1KMoeyC76OslZyKv38Srd
	FKHmclGQeNEiIhduHs4QmfOTWwj79KMITaehqESkQbcY0PSHgnBrvQTPuGoeKBu1X5zVpMPjKATTA
	Q/WBR00FtOj68Iraq8sSSThXD16ITVoISfrqgnFBvvq6OpLOBLUF/3eUh/EOG+v6M+iWoJilDzgBM
	4Y82lysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuny-0000000G1Sd-1dy6;
	Fri, 27 Nov 2026 12:11:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWunw-0000000G1RT-3W11
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:11:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0762260E8F;
	Fri, 27 Nov 2026 12:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C861F0089B;
	Fri, 27 Nov 2026 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781511;
	bh=U2UKqho7RiqZPSkkcPut/1/ppKVpudTdBMODtt9mKNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxYJjrQCoXn8jKpccGPJV92RABj6dtqWFrQ+kJnGiCfY0XOjMjtJSgws8GZXXDA/A
	 bAW4mMITA5O0Y6A5PUke3SL9+twwjt83hNafHGIWXt8jp6T3wwy96ZE45oTPvuOcbJ
	 6CnS27JzH/XecIX0kzp9fujcqV29vwZlWw8SKR9ycL67FCXHmr4eLgvIoe3KWGX6Wc
	 uf57GL5l5OJ2rVAX1bdHPVDgvfW5V+ovSlUeSDieDqW/DoVjwoOOXi37N/co2Yui1/
	 IQmKI2tfk1WDUtbPyHemX+6U72wEkVSuVRak8sY0Tj+1PPNoe8F7jOLbQvaKAnhh14
	 LueO+DMUR4w+w==
Message-ID: <sashiko-outbox-237327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 03/30] crypto: amlogic - Don't hardcode IRQ count
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261127120103.1532882-4-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-4-jnieto.alaber@gmail.com>
Date: Fri, 27 Nov 2026 12:11:50 +0000
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
IC0gSVJRIHJlcXVlc3RlZCBiZWZvcmUgaW5pdF9jb21wbGV0aW9uKCkgaW4KICBwcm9iZQotLQoK
Y29tbWl0IGI0MmM1OGQyNjUwYmUxMDQ0ZTBmZWMwYTdlZjg3NTg0MTNiMzA0YjYKQXV0aG9yOiBB
bGV4ZXkgUm9tYW5vdiA8cm9tYW5vdi5hbGV4ZXkyMDAwQGdtYWlsLmNvbT4KCmNyeXB0bzogYW1s
b2dpYyAtIERvbid0IGhhcmRjb2RlIElSUSBjb3VudAoKVGhpcyBjb21taXQgcmVwbGFjZXMgdGhl
IGhhcmRjb2RlZCBNQVhGTE9XIGNvbnN0YW50IHdpdGggYSBkeW5hbWljIGZsb3cKY291bnQgcXVl
cmllZCB2aWEgcGxhdGZvcm1faXJxX2NvdW50KCkgYW5kIG1vdmVzIHBlci1mbG93IElSUSByZWdp
c3RyYXRpb24KaW50byBtZXNvbl9hbGxvY2F0ZV9jaGFubGlzdCgpLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgYi9kcml2ZXJzL2NyeXB0
by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwo+IGluZGV4IDQ4ZGJkZjQ1MjAzNDguLmI2OTMz
YmUzOWEzNzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4
bC1jb3JlLmMKPiArKysgYi9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUu
YwoKWyAuLi4gXQoKPiBAQCAtMTU0LDEzICsxNTQsMzEgQEAgc3RhdGljIHZvaWQgbWVzb25fZnJl
ZV9jaGFubGlzdChzdHJ1Y3QgbWVzb25fZGV2ICptYywgaW50IGkpCj4gICAqLwo+ICBzdGF0aWMg
aW50IG1lc29uX2FsbG9jYXRlX2NoYW5saXN0KHN0cnVjdCBtZXNvbl9kZXYgKm1jKQo+ICB7Cj4g
KwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKG1jLT5k
ZXYpOwo+ICAJaW50IGksIGVycjsKPiAgCj4gLQltYy0+Y2hhbmxpc3QgPSBkZXZtX2t6YWxsb2Nf
b2JqcyhtYy0+ZGV2LCBzdHJ1Y3QgbWVzb25fZmxvdywgTUFYRkxPVyk7Cj4gKwltYy0+Zmxvd19j
bnQgPSBwbGF0Zm9ybV9pcnFfY291bnQocGRldik7Cj4gKwlpZiAobWMtPmZsb3dfY250IDw9IDAp
IHsKPiArCQlkZXZfZXJyKG1jLT5kZXYsICJObyBJUlFzIGRlZmluZWRcbiIpOwo+ICsJCXJldHVy
biAtRU5PREVWOwo+ICsJfQo+ICsKPiArCW1jLT5jaGFubGlzdCA9IGRldm1fa3phbGxvY19vYmpz
KG1jLT5kZXYsIHN0cnVjdCBtZXNvbl9mbG93LCBtYy0+Zmxvd19jbnQpOwo+ICAJaWYgKCFtYy0+
Y2hhbmxpc3QpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IE1B
WEZMT1c7IGkrKykgewo+ICsJZm9yIChpID0gMDsgaSA8IG1jLT5mbG93X2NudDsgaSsrKSB7Cj4g
KwkJbWMtPmNoYW5saXN0W2ldLmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgaSk7Cj4gKwkJ
aWYgKG1jLT5jaGFubGlzdFtpXS5pcnEgPCAwKQo+ICsJCQlyZXR1cm4gbWMtPmNoYW5saXN0W2ld
LmlycTsKPiArCj4gKwkJZXJyID0gZGV2bV9yZXF1ZXN0X2lycShtYy0+ZGV2LCBtYy0+Y2hhbmxp
c3RbaV0uaXJxLAo+ICsJCQkJICAgICAgIG1lc29uX2lycV9oYW5kbGVyLCAwLCAiYW1sLWNyeXB0
byIsIG1jKTsKPiArCQlpZiAoZXJyIDwgMCkgewo+ICsJCQlkZXZfZXJyKG1jLT5kZXYsICJDYW5u
b3QgcmVxdWVzdCBJUlEgZm9yIGZsb3cgJWRcbiIsIGkpOwo+ICsJCQlyZXR1cm4gZXJyOwo+ICsJ
CX0KPiArCj4gIAkJaW5pdF9jb21wbGV0aW9uKCZtYy0+Y2hhbmxpc3RbaV0uY29tcGxldGUpOwoK
W1NldmVyaXR5OiBNZWRpdW1dCkNhbiBtZXNvbl9pcnFfaGFuZGxlcigpIGZpcmUgYmVmb3JlIGlu
aXRfY29tcGxldGlvbigpIGluaXRpYWxpemVzCm1jLT5jaGFubGlzdFtpXS5jb21wbGV0ZT8KCk1v
dmluZyBkZXZtX3JlcXVlc3RfaXJxKCkgYWhlYWQgb2YgaW5pdF9jb21wbGV0aW9uKCkgZW5hYmxl
cyB0aGUgSVJRCndoaWxlIG1jLT5jaGFubGlzdFtpXS5jb21wbGV0ZSBpcyBzdGlsbCB6ZXJvLWZp
bGxlZCwgc28gYSBwZW5kaW5nCmludGVycnVwdCB3aXRoIGEgbm9uLXplcm8gZmxvdyBzdGF0dXMg
cmVnaXN0ZXIgd2lsbCBjYWxsIGNvbXBsZXRlKCkgb24gYW4KdW5pbml0aWFsaXplZCBzd2FpdF9x
dWV1ZV9oZWFkIGFuZCBkZXJlZmVyZW5jZSBhIE5VTEwgdGFza19saXN0Lm5leHQKcG9pbnRlci4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjExMjcxMjAxMDMuMTUzMjg4Mi0xLWpuaWV0by5hbGFiZXJAZ21haWwuY29tP3BhcnQ9MwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
