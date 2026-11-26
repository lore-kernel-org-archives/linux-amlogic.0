Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895A606A32A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3qRTtU7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3KaNpQm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u1dMplzqP/e5X5XLlM4hGYSblRZN3aT4ftXrtGRx8rA=; b=a3qRTtU72/zkzoQZ2X2q1j7bIN
	KzFafP+49QScbOMlk066mDdNvyy+ALIkby/2KfmmhzuIlvpvF0Ntszzx+S5OPJgI0Z3rw2gSJ+fI2
	dUAmBiacDOMbVDyN8jLEImFXBLogS/gZfKZz50M1oaaVqyK6+H4BraYXBuX+gEVt24i6xg10BjkVP
	85pnS2LVza/iyvh4BDxGp6wzxuNGh16Y7z3c2bJqd6dXEn2gCto8UFFnjuJ6lCB/frL9gu/qCJtrt
	cCd2oUPvkVRqMzo7xzjEJrzpkXb/uNXGvegQNEzlmDa2lYkRJhQUpjMfQyKuj5YYiGNliaADzeHih
	+J29XoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfMD-0000000EN9Q-1lLM;
	Thu, 26 Nov 2026 19:42:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfMC-0000000EN9C-1IDb
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:42:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B6436120A;
	Thu, 26 Nov 2026 19:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72CA1F000C6;
	Thu, 26 Nov 2026 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722131;
	bh=FceHbLJv0TZU2/eRKdZZpK7MySJPD+3V05bKGzXmo10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3KaNpQm+qo6sodjsaNUbl7Kw4YkA7A97cTuPl0VEcuurcKlScZ8MVSOsN5LrNJc+
	 e+2I63dQYvUo2u+JdyYWzfDVlnudDyITNMuGdA+QJXneZwPt7haUfvLwTNCcO2s/83
	 9Vzi5KdeA5JzEbR3B4WVEJFzBkG/keNiJTiPHo2M30lCOzc+P5wouLUdO/sxEnfI2a
	 KLQH7z8tDsKq4D6EbOfvQlzmSgj8hDAaBK9b89ZV84QIBBu3DCebEbJVgmPHxFyMIW
	 mWAfBUnLcqbvXIhwIBvj2PHxUifH2vUFiBV6FwTv35itGf+kTkcxO56h1a76A8SfQ9
	 EZtWPr6AnsGmw==
Message-ID: <sashiko-outbox-236107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/25] crypto: amlogic - Don't hardcode IRQ count
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alexey Romanov" <romanov.alexey2000@gmail.com>
In-Reply-To: <20261126193241.1471372-4-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-4-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 19:42:10 +0000
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
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIGNyeXB0bzogYW1sb2dp
YyAtIGxlYWsgb24gSVJRIGVycm9yIGluCiAgbWVzb25fYWxsb2NhdGVfY2hhbmxpc3QoKQotIFtN
ZWRpdW1dIGNyeXB0bzogYW1sb2dpYyAtIElSUSBlbmFibGVkIGJlZm9yZSBpbml0X2NvbXBsZXRp
b24oKSBpbgogIHByb2JlCi0gW01lZGl1bV0gY3J5cHRvOiBhbWxvZ2ljIC0gbWVzb25fYWxsb2Nh
dGVfY2hhbmxpc3QoKSBjbG9iYmVycwogIC1FUFJPQkVfREVGRVIKLS0KCmNvbW1pdCBiM2Y1Zjhj
OWVkNjE2MTBmYWMzZGUxMmYwMTA0YWE2NDRlMzYwNzE4CkF1dGhvcjogQWxleGV5IFJvbWFub3Yg
PHJvbWFub3YuYWxleGV5MjAwMEBnbWFpbC5jb20+CgpjcnlwdG86IGFtbG9naWMgLSBEb24ndCBo
YXJkY29kZSBJUlEgY291bnQKClRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBoYXJkY29kZWQgTUFY
RkxPVyBjb25zdGFudCB3aXRoIGEgZHluYW1pYyBmbG93X2NudApvYnRhaW5lZCB2aWEgcGxhdGZv
cm1faXJxX2NvdW50KCkgYW5kIG1vdmVzIHBlci1mbG93IElSUSBsb29rdXAgYW5kCnJlZ2lzdHJh
dGlvbiBpbnRvIG1lc29uX2FsbG9jYXRlX2NoYW5saXN0KCkuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2RyaXZlcnMvY3J5cHRvL2Ft
bG9naWMvYW1sb2dpYy1neGwtY29yZS5jCj4gaW5kZXggNDhkYmRmNDUyMDM0OC4uYjY5MzNiZTM5
YTM3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCgpb
IC4uLiBdCgo+IEBAIC0xNTQsMTMgKzE1NCwzMSBAQCBzdGF0aWMgdm9pZCBtZXNvbl9mcmVlX2No
YW5saXN0KHN0cnVjdCBtZXNvbl9kZXYgKm1jLCBpbnQgaSkKPiAgICovCj4gIHN0YXRpYyBpbnQg
bWVzb25fYWxsb2NhdGVfY2hhbmxpc3Qoc3RydWN0IG1lc29uX2RldiAqbWMpCj4gIHsKPiArCXN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UobWMtPmRldik7
Cj4gIAlpbnQgaSwgZXJyOwo+ICAKPiAtCW1jLT5jaGFubGlzdCA9IGRldm1fa3phbGxvY19vYmpz
KG1jLT5kZXYsIHN0cnVjdCBtZXNvbl9mbG93LCBNQVhGTE9XKTsKPiArCW1jLT5mbG93X2NudCA9
IHBsYXRmb3JtX2lycV9jb3VudChwZGV2KTsKPiArCWlmIChtYy0+Zmxvd19jbnQgPD0gMCkgewo+
ICsJCWRldl9lcnIobWMtPmRldiwgIk5vIElSUXMgZGVmaW5lZFxuIik7Cj4gKwkJcmV0dXJuIC1F
Tk9ERVY7Cj4gKwl9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIG92ZXJ3cml0ZSAtRVBS
T0JFX0RFRkVSIGZyb20gcGxhdGZvcm1faXJxX2NvdW50KCkgd2l0aCAtRU5PREVWPwpXaGVuIHRo
ZSBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBub3QgcmVhZHkgeWV0LCBwbGF0Zm9ybV9pcnFfY291
bnQoKQpyZXR1cm5zIC1FUFJPQkVfREVGRVIsIHNvIHJldHVybmluZyAtRU5PREVWIGJyZWFrcyBk
ZWZlcnJlZCBwcm9iaW5nIGFuZApsb2dzIGEgZmFsc2UgZXJyb3IuICBSZXR1cm5pbmcgbWMtPmZs
b3dfY250IHdoZW4gbWMtPmZsb3dfY250IDwgMCBhdm9pZHMKdGhpcyByZWdyZXNzaW9uLgoKPiAr
Cj4gKwltYy0+Y2hhbmxpc3QgPSBkZXZtX2t6YWxsb2Nfb2JqcyhtYy0+ZGV2LCBzdHJ1Y3QgbWVz
b25fZmxvdywgbWMtPmZsb3dfY250KTsKPiAgCWlmICghbWMtPmNoYW5saXN0KQo+ICAJCXJldHVy
biAtRU5PTUVNOwo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBNQVhGTE9XOyBpKyspIHsKPiArCWZv
ciAoaSA9IDA7IGkgPCBtYy0+Zmxvd19jbnQ7IGkrKykgewo+ICsJCW1jLT5jaGFubGlzdFtpXS5p
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOwo+ICsJCWlmIChtYy0+Y2hhbmxpc3RbaV0u
aXJxIDwgMCkKPiArCQkJcmV0dXJuIG1jLT5jaGFubGlzdFtpXS5pcnE7Cj4gKwo+ICsJCWVyciA9
IGRldm1fcmVxdWVzdF9pcnEobWMtPmRldiwgbWMtPmNoYW5saXN0W2ldLmlycSwKPiArCQkJCSAg
ICAgICBtZXNvbl9pcnFfaGFuZGxlciwgMCwgImFtbC1jcnlwdG8iLCBtYyk7Cj4gKwkJaWYgKGVy
ciA8IDApIHsKPiArCQkJZGV2X2VycihtYy0+ZGV2LCAiQ2Fubm90IHJlcXVlc3QgSVJRIGZvciBm
bG93ICVkXG4iLCBpKTsKPiArCQkJcmV0dXJuIGVycjsKPiArCQl9CgpbU2V2ZXJpdHk6IE1lZGl1
bV0KSWYgcGxhdGZvcm1fZ2V0X2lycSgpIG9yIGRldm1fcmVxdWVzdF9pcnEoKSBmYWlscyBvbiBp
dGVyYXRpb24gaSA+IDAsIGRvZXMKcmV0dXJuaW5nIGRpcmVjdGx5IHNraXAgbWVzb25fZnJlZV9j
aGFubGlzdCgpIGZvciB0aGUgZWFybGllciBjaGFubmVscz8KCkVhY2ggY29tcGxldGVkIGl0ZXJh
dGlvbiBzdGFydHMgYSBjcnlwdG9fZW5naW5lIGt0aHJlYWQgYW5kIGFsbG9jYXRlcwptYy0+Y2hh
bmxpc3RbaV0udGwgd2l0aCBkbWFfYWxsb2NfY29oZXJlbnQoKS4gIFJldHVybmluZyB3aXRob3V0
IHVud2luZGluZwpjaGFubmVscyAwIC4uIGkgLSAxIGxlYWtzIHRoZWlyIGNvaGVyZW50IERNQSBi
dWZmZXJzIGFuZCBsZWF2ZXMgdGhlaXIKa3dvcmtlciB0aHJlYWRzIHJ1bm5pbmcgYWZ0ZXIgZGV2
cmVzIGZyZWVzIHRoZSBzdHJ1Y3QgY3J5cHRvX2VuZ2luZQpvYmplY3RzIG9uIHByb2JlIGZhaWx1
cmUuICBEZWNyZW1lbnRpbmcgaSBhbmQganVtcGluZyB0byBlcnJvcl9lbmdpbmUKY2xlYW5zIHVw
IHRoZSBpbml0aWFsaXplZCBjaGFubmVscy4KCj4gKwo+ICAJCWluaXRfY29tcGxldGlvbigmbWMt
PmNoYW5saXN0W2ldLmNvbXBsZXRlKTsKCltTZXZlcml0eTogTWVkaXVtXQpDYW4gbWVzb25faXJx
X2hhbmRsZXIoKSBmaXJlIGJlZm9yZSBpbml0X2NvbXBsZXRpb24oKSBpbml0aWFsaXplcwptYy0+
Y2hhbmxpc3RbaV0uY29tcGxldGU/CgpkZXZtX3JlcXVlc3RfaXJxKCkgZW5hYmxlcyB0aGUgaW50
ZXJydXB0IGxpbmUgd2hpbGUgbWMtPmNoYW5saXN0W2ldLmNvbXBsZXRlCmlzIHN0aWxsIHplcm8t
aW5pdGlhbGl6ZWQsIGFuZCBtZXNvbl9pcnFfaGFuZGxlcigpIGNhbGxzCmNvbXBsZXRlKCZtYy0+
Y2hhbmxpc3RbZmxvd10uY29tcGxldGUpIHdoZW4gdGhlIGZsb3cgc3RhdHVzIHJlZ2lzdGVyIGlz
Cm5vbi16ZXJvLCB3aGljaCB3b3VsZCBkZXJlZmVyZW5jZSBhIE5VTEwgd2FpdHF1ZXVlIHBvaW50
ZXIuICBDYWxsaW5nCmluaXRfY29tcGxldGlvbigpIGJlZm9yZSBkZXZtX3JlcXVlc3RfaXJxKCkg
YXZvaWRzIHRoaXMgd2luZG93LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyNjE5MzI0MS4xNDcxMzcyLTEtam5pZXRvLmFsYWJl
ckBnbWFpbC5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
