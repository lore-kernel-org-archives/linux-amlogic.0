Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEF606A326
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxqHMDh2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBhXgPwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3TZowLhIrGtefVLpnKmxWq2wVaJ8HTUg1MEfnlSlsOs=; b=wxqHMDh2eoTEjSbw6azA+suwRs
	1I+7AUowUb9O6oDeqZhCt2bIa2UjTe7fsaXPig4uTV/lMenqW0jwzua+fjcnBOw5PHUK7ALoAXJK8
	+1XXdtzyiRnG5t9R4z8HNEdnh1GgC0uGvq7WnLveqxZif1icH5RfWBQv7hWkRnBaEbabg0dXQtseZ
	Jrnc8c9fSZcgSCKcy0tMH4Ykg6gVu1xSR3jAXpcjHZpMLdGEzbfPokvBXg72PWpuS18sDHUf8+gHJ
	5p6w6GQE1cNwuT31W+Oipl1Sw/g8jfbL77hxkPRXg8ea0gRQeozcVhxCPCzA6TNN5VASZsWliL0lv
	6URvgjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH9R-0000000BvOY-0xoh;
	Fri, 06 Nov 2026 10:26:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH9P-0000000BvOP-3ENN
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87EDD407DB;
	Fri,  6 Nov 2026 10:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1A91F008A5;
	Fri,  6 Nov 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960787;
	bh=J2YlyZsVqqW/WIFQ7AkRTzmr/M9BTQxzjw6sfIi8GB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBhXgPwHABFonr11fJ6AYNGW/lv4IoL7+RQ5Q+6eMBgdh40vund2I5H/KIRp5+P7G
	 arwYhS8NWga86UAil1LJ94FCxQSjEMX29EI9LWDIebpiZ/+MUFm3dl5ZULQEn0YojS
	 Vky/qzpzF5/zsl9bAlehDtLZdUHcnyuOuuJEN3hkZXPU9iq+sXpRuXfRwGsl/DizUg
	 BWtqhfidkMlfTmNa8AQVUeV0xH5AkOLGM5RUpDbylK9455Jo2FOEVnronuue/XZraV
	 jefdmveC5wKb6j5OZNX+u84Man4I77q7PLzFLwDa06ao3YjCjAefMpogG148Vtu+nE
	 jTsuLsBLSgEGw==
Message-ID: <sashiko-outbox-201214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] firmware: meson: sm: make power-off work on S4
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:26:26 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZmlybXdhcmU6IG1lc29uOiBk
dXBsaWNhdGUgbWVzb24tc20gcHJlZml4IGluCiAgbWVzb25fc21fcG93ZXJfb2ZmX3ByZXBhcmUo
KQotLQoKY29tbWl0IDAxNDJiMDMwMGJlNjMyMjM5MzEzOGZiZTRkYmJmMzI0MDU4NzJkZWUKQXV0
aG9yOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4K
CmZpcm13YXJlOiBtZXNvbjogc206IG1ha2UgcG93ZXItb2ZmIHdvcmsgb24gUzQKClRoaXMgY29t
bWl0IHJlZ2lzdGVycyBhIHBvd2VyLW9mZiBwcmVwYXJlIGhhbmRsZXIgZm9yIEFtbG9naWMgUzQg
dGhhdApvZmZsaW5lcyBzZWNvbmRhcnkgQ1BVcyBhbmQgc2V0cyB0aGUgZmlybXdhcmUgc2h1dGRv
d24gZmxhZyBiZWZvcmUgUFNDSQpTWVNURU1fT0ZGLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jIGIvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9z
bS5jCj4gaW5kZXggYWI5NzUxYTU5YjU1Mi4uZGUwYzhlODA5YzUxNiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmMKClsgLi4uIF0KCj4gQEAgLTMwMyw2ICszMDYsMjggQEAgc3RhdGlj
IHN0cnVjdCBhdHRyaWJ1dGUgKm1lc29uX3NtX3N5c2ZzX2F0dHJzW10gPSB7Cj4gIH07Cj4gIEFU
VFJJQlVURV9HUk9VUFMobWVzb25fc21fc3lzZnMpOwo+ICAKPiArLyoKPiArICogVGhlIFM0IGZp
cm13YXJlIGltcGxlbWVudHMgUFNDSSBTWVNURU1fT0ZGIGFzIEREUiBzZWxmLXJlZnJlc2g6IG9u
IHRoZQo+ICsgKiBwb3dlciBrZXkgaXQganVtcHMgYmFjayB0byB0aGUga2VybmVsIGluc3RlYWQg
b2YgYm9vdGluZywgd2hpY2ggaGFuZ3MgdGhlCj4gKyAqIGJvYXJkLiBTZXR0aW5nIHRoZSBzaHV0
ZG93biBmbGFnIGZpcnN0IG1ha2VzIGl0IGNvbGQtYm9vdCBpbnN0ZWFkLCBhbmQgdGhlCj4gKyAq
IHNlY29uZGFyeSBDUFVzIG11c3QgaGF2ZSBiZWVuIHRha2VuIGRvd24gdGhyb3VnaCBQU0NJIENQ
VV9PRkYgYmVmb3JlaGFuZCwKPiArICogb3RoZXJ3aXNlIHRoZSB3YWtlLXVwIHBhdGggaGFuZ3Mg
YXMgd2VsbC4gbWFjaGluZV9wb3dlcl9vZmYoKSBvbmx5IHBhcmtzCj4gKyAqIHRoZW0sIHNvIG9m
ZmxpbmUgdGhlbSBoZXJlLCB3aGlsZSBDUFUgaG90cGx1ZyBzdGlsbCB3b3Jrcy4KPiArICovCj4g
K3N0YXRpYyBpbnQgbWVzb25fc21fcG93ZXJfb2ZmX3ByZXBhcmUoc3RydWN0IHN5c19vZmZfZGF0
YSAqZGF0YSkKPiArewo+ICsJdW5zaWduZWQgaW50IGNwdSwgcHJpbWFyeSA9IGNwdW1hc2tfZmly
c3QoY3B1X29ubGluZV9tYXNrKTsKPiArCj4gKwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+
ICsJCWlmIChjcHUgIT0gcHJpbWFyeSAmJiByZW1vdmVfY3B1KGNwdSkpCj4gKwkJCXByX3dhcm4o
Im1lc29uLXNtOiBmYWlsZWQgdG8gc3RvcCBDUFUldVxuIiwgY3B1KTsKCltTZXZlcml0eTogTG93
XQpEb2VzIHRoaXMgZHVwbGljYXRlIHRoZSAibWVzb24tc206ICIgcHJlZml4IGluIHRoZSBrZXJu
ZWwgbG9nPwpkcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgYWxyZWFkeSBkZWZpbmVz
IHByX2ZtdChmbXQpIGFzCiJtZXNvbi1zbTogIiBmbXQgYXQgdGhlIHRvcCBvZiB0aGUgZmlsZS4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjExMDYxMDE4NTQuNDY1NjktMS1jaHJpc3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWli
ay5hYy5hdD9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
