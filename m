Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABAE606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H6+Hi9RV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFkFGgLQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T0k4e0tEX9LGVz6Ev9Yed6SuJdwHaLyuEnwjsTLrbuM=; b=H6+Hi9RVBwuTGe+HZjHiaVUKJT
	DPLE6Qcuygy31hS+8tUPRpL40o3jAVCyprNty+5X0NJvxb/Hd/u5XCkDDBuQDHUL55K7R/jtMLXwo
	8rVNE/hjijqoxe+CZw1zkmtsoLeSe8KPK2tt7Z29pxE5TJx14uPUzr1db21S2qoYwa36rNhck4OcA
	SkPMbIPThdoAhGoQa9m+pjxG2wnDYXArydCVWli3m000NYdCPJFFW6aaV7Cv2SlnTynW0NjOCTyX4
	q7MQ9IQlnda0UFYvJ63Fn2SiCu6uGHkUuR5IMJHfLek8Q0iaE2jUsSfj2zLrBhcRSmwcbPJA/gJQX
	yxsEzOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuyB-0000000G5TS-3SoS;
	Fri, 27 Nov 2026 12:22:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuxs-0000000G57D-1to6
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:22:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2075609FC;
	Fri, 27 Nov 2026 12:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C411F0089B;
	Fri, 27 Nov 2026 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782127;
	bh=YBtbGhdcHaTPh4Cp45Uwxj8GEBk2yppZmWyURV6PBPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFkFGgLQCvqWdQq1G4gCpTmmTMKGGsU2J3xj1o5GhLKFe5tuqqJ8ZzJOnK+ULjbqh
	 JXVkIbmIIDXCQGaxvZavLMFMY/ZsSZkJta6yW1eQitZK+QUQdcdALAvsMyJ1si/1Cm
	 8xkiarb0bbg6Fx4pTvFcE5iSqvanuBMju5YmB/8Pz5q9Eo4HzpkXaraCh2PCtLyFZD
	 2gO56T5tEvdLB2SUPiqljfI9y2Tb1DoWBVuKGBBoliEcJOpnElGfFNMn7kiFhVkh0x
	 uydTxNeEZQ/dq8lMNQapA80W7EXeLFqznRVCjT0qS77NomsfpYjfcOo7S9aWVuBk0I
	 Yq7/7OvkSrIUA==
Message-ID: <sashiko-outbox-237361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 19/30] crypto: amlogic: hasher: add one-shot digest
 path
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20261127120103.1532882-20-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-20-jnieto.alaber@gmail.com>
Date: Fri, 27 Nov 2026 12:22:06 +0000
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
OiB1bm1hcHBlZCBwYXJ0aWFsX2FkZHIgRE1BIGJ1ZmZlciBvbgogIG1lc29uX2tpY2tfaGFyZHdh
cmUoKSBlcnJvcgotLQoKY29tbWl0IDNjMTlkNGZiMzdlOWYzOTk1MWQyZmVjNjA3YTUwNGMyZGZm
ZWU3M2EKQXV0aG9yOiBKb3NlIE5pZXRvIDxqbmlldG8uYWxhYmVyQGdtYWlsLmNvbT4KCmNyeXB0
bzogYW1sb2dpYzogaGFzaGVyOiBhZGQgb25lLXNob3QgZGlnZXN0IHBhdGgKClRoaXMgY29tbWl0
IGFkZHMgdGhlIGFoYXNoIC0+ZGlnZXN0IGNhbGxiYWNrIGZvciBvbmUtc2hvdCBTSEEgcmVxdWVz
dHMsCnVucmVnaXN0ZXJzIHRoZSBoYXNoZXIgb24gZGV2aWNlIHJlbW92YWwsIGFuZCBsb3dlcnMg
dGhlIHVuc3VwcG9ydGVkCnBsYXRmb3JtIG1lc3NhZ2UgdG8gZGV2X2RiZy4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtaGFzaGVyLmMgYi9kcml2ZXJz
L2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWhhc2hlci5jCj4gaW5kZXggYzgzNzM5ZWMzNDU2
Ni4uOTc4Y2RjZDhhNGY5MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2Ft
bG9naWMtZ3hsLWhhc2hlci5jCj4gKysrIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2lj
LWd4bC1oYXNoZXIuYwpbIC4uLiBdCj4gQEAgLTMxMCw2ICszMjksOSBAQCBzdGF0aWMgaW50IG1l
c29uX2hhc2hlcl9kb19vbmVfcmVxdWVzdChzdHJ1Y3QgY3J5cHRvX2VuZ2luZSAqZW5naW5lLCB2
b2lkICphcmVxKQo+ICAJCWlmICghY3R4LnRvZG8gJiYgY3R4Lm5ieXRlcykKPiAgCQkJY29udGlu
dWU7Cj4gIAo+ICsJCWlmICghY3R4LnRvZG8gJiYgcmN0eC0+ZmluYWxfcmVxICYmIHJjdHgtPnBh
cnRpYWxfc2l6ZSkKPiArCQkJY29udGludWU7Cj4gKwo+ICAJCWlmICghY3R4LnRvZG8gJiYgIXJj
dHgtPmZpbmFsX3JlcSAmJiAhY3R4LnRsb2Zmc2V0KQo+ICAJCQljb250aW51ZTsKCltTZXZlcml0
eTogTWVkaXVtXQpEb2VzIG1lc29uX2hhc2hlcl9kb19vbmVfcmVxdWVzdCgpIGxlYWsgdGhlIHJj
dHgtPnBhcnRpYWxfYWRkciBETUEKbWFwcGluZyB3aGVuIG1lc29uX2tpY2tfaGFyZHdhcmUoKSBm
YWlscyBvciB0aW1lcyBvdXQgd2hpbGUgZmx1c2hpbmcgYQpwYXJ0aWFsIGJsb2NrPwoKV2hlbiBt
ZXNvbl9maWxsX3BhcnRpYWxfYnVmZmVyKCkgbWFwcyByY3R4LT5wYXJ0aWFsLCBpdCBzZXRzCnJj
dHgtPnBhcnRpYWxfbWFwcGVkID0gdHJ1ZS4gIElmIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91
dCgpIGZhaWxzIGluCm1lc29uX2tpY2tfaGFyZHdhcmUoKSwgaXQgcmV0dXJucyBiZWZvcmUgcmVh
Y2hpbmcgdGhlIGRtYV91bm1hcF9zaW5nbGUoKQpibG9jayBmb3IgcmN0eC0+cGFydGlhbF9hZGRy
LCBhbmQgdGhlIGZhaWwgY2xlYW51cCBwYXRoIGluCm1lc29uX2hhc2hlcl9kb19vbmVfcmVxdWVz
dCgpIG9ubHkgdW5tYXBzIHJlcS0+c3JjIGFuZCBjdHguc3RhdGVfYWRkcjoKCmRyaXZlcnMvY3J5
cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtaGFzaGVyLmM6bWVzb25fa2lja19oYXJkd2FyZSgpIHsK
CS4uLgoJcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZmbG93LT5jb21wbGV0ZSwK
CQkJCQkgIG1zZWNzX3RvX2ppZmZpZXMoNTAwKSk7CglpZiAocmV0ID09IDApIHsKCQlkZXZfZXJy
KG1jLT5kZXYsICJETUEgdGltZW91dCBmb3IgZmxvdyAlZFxuIiwgcmN0eC0+Zmxvdyk7CgkJcmV0
dXJuIC1FSU5WQUw7Cgl9IGVsc2UgaWYgKHJldCA8IDApIHsKCQlkZXZfZXJyKG1jLT5kZXYsICJX
YWl0aW5nIGZvciBETUEgY29tcGxldGlvbiBpcyBmYWlsZWQgKCVkKVxuIiwgcmV0KTsKCQlyZXR1
cm4gcmV0OwoJfQoKCWlmIChyY3R4LT5wYXJ0aWFsX21hcHBlZCkgewoJCWRtYV91bm1hcF9zaW5n
bGUobWMtPmRldiwgcmN0eC0+cGFydGlhbF9hZGRyLAoJCQkJIHJjdHgtPnBhcnRpYWxfc2l6ZSwK
CQkJCSBETUFfVE9fREVWSUNFKTsKCS4uLgp9CgpVbm1hcHBpbmcgcmN0eC0+cGFydGlhbF9hZGRy
IHdoZW4gcmN0eC0+cGFydGlhbF9tYXBwZWQgaXMgc2V0IGluIHRoZQplcnJvciBwYXRoIChvciBi
ZWZvcmUgcmV0dXJuaW5nIGluIG1lc29uX2tpY2tfaGFyZHdhcmUoKSkgd291bGQgYXZvaWQKbGVh
a2luZyB0aGUgRE1BIG1hcHBpbmcuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3MTIwMTAzLjE1MzI4ODItMS1qbmlldG8uYWxh
YmVyQGdtYWlsLmNvbT9wYXJ0PTE5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
