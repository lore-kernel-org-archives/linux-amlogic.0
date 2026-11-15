Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A813606A330
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40MBvpuJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFB3IIXQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c941VBvUR0j1akW00Bs3A7CEzWub5nImuvgIG+SyiB4=; b=40MBvpuJ2CdGoMZzu8iouS8lUV
	CrqorEWL4tWEGr189arM7dDQuOSy2J9wfOXNCq8SswX4C+x7ZdlWjfwO7dAzbOQaxR/cKTw5U4rWP
	+bZvyDLiuaMhBVhQC1rdGhlXIikifEnA+2IDjFQh6MMNPhF1lDAmiLUu77hczL0+eF/cF1sF6qCON
	X9wXugcmvksdnss7ygm/m85s2aqfFfdd1Y+5PFO1DR93KOyFBI9mX1ajkIrLcsinxVG2k2Hi0YSzb
	louu4RJxbi3Ms3w/j/cRt4i14BDTaNcQmnXCbZqL9OJRlMY2pJQ70FeMpOjSJzkCF0eB6wq5M3LW6
	fploOLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqR-00000000fqc-1lo4;
	Sun, 15 Nov 2026 22:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqQ-00000000fqI-1WbN
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EDD961DAE;
	Sun, 15 Nov 2026 22:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C627A1F000C4;
	Sun, 15 Nov 2026 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782225;
	bh=nraGc+Ficn59rB9MoVoTUdKQoL+FeqzmnSrPInxQ2is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GFB3IIXQ0O35hvi3prtGKBAovZIqxa2I15rVMYKxqDoJaI0C86ktsOuxRkXX6F+eh
	 teHKqModFrKGkGtpC7Qkj7S0mc7BJWg3GFUq3UZXL+zMxzS1RrbBEDgrKNieGOh2mR
	 nEaaJVf1w65J4C1HjtCIAGe1GIu6rl9HVKr+s19ZdwwktWDkNmPmgweO0iACfcUD27
	 cnhk9UIKr9Gzm2i5JweGrk6ql/zBUFg9k0SFkBF4uS2DmWuxNJYC0doQVJShAqiFFT
	 B5waIq3QEyvWgaoJztBbBCUkOFiciMvAVjnswxel0IPjcmrxADVTaR0+i47eb1RU9S
	 Dxq9O1PkZ15PA==
Message-ID: <sashiko-outbox-215882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: amlogic: g12: Add ranges to periphs
 pinctrl node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-4-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
 <20261115-fix-amlogic-dt-warnings-v1-4-94cbd67a32ea@aliel.fr>
Date: Sun, 15 Nov 2026 22:37:04 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gYXJtNjQ6IGR0czogYW1sb2dp
YzogY29tbWl0IHN1YmplY3QgYW5kIG1lc3NhZ2UgbWlzbWF0Y2ggd2l0aAogIG1vZGlmaWVkIG5v
ZGVzCi0tCgpjb21taXQgZDAxOGI4NTFkMGI3NmJhNTkxNWE2YmZhODg0YTFiMWM0YmU1ZDAzZQpB
dXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKPiBhcm02
NDogZHRzOiBhbWxvZ2ljOiBnMTI6IEFkZCByYW5nZXMgdG8gcGVyaXBocyBwaW5jdHJsIG5vZGUK
Pgo+IEJ1aWxkaW5nIHRoZSBhbWxvZ2ljIERUQnMgd2l0aCBXPTEgcmVwb3J0cyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzCj4gZm9yIHRoZSBwZXJpcGhzIHBpbmN0cmwgbm9kZToKPgo+ICAgbWVzb24t
ZzEyLWNvbW1vbi5kdHNpOjI3MS4zMy0xNTU0Ljc6IFdhcm5pbmcgKHVuaXRfYWRkcmVzc192c19y
ZWcpOgo+ICAgL3NvYy9idXNAZmY2MDAwMDAvYnVzQDM0NDAwL3BpbmN0cmxANDA6IG5vZGUgaGFz
IGEgdW5pdCBuYW1lLCBidXQgbm8KPiAgIHJlZyBvciByYW5nZXMgcHJvcGVydHkKPiAgIG1lc29u
LWcxMi1jb21tb24uZHRzaToxNzY4LjI3LTIwNDAuNjogV2FybmluZyAodW5pdF9hZGRyZXNzX3Zz
X3JlZyk6Cj4gICAvc29jL2J1c0BmZjgwMDAwMC9waW5jdHJsQDE0OiBub2RlIGhhcyBhIHVuaXQg
bmFtZSwgYnV0IG5vIHJlZwo+ICAgb3IgcmFuZ2VzIHByb3BlcnR5Cj4gICBtZXNvbi1nMTItY29t
bW9uLmR0c2k6MjcxLjMzLTE1NTQuNzogV2FybmluZyAoc2ltcGxlX2J1c19yZWcpOgo+ICAgL3Nv
Yy9idXNAZmY2MDAwMDAvYnVzQDM0NDAwL3BpbmN0cmxANDA6IG1pc3Npbmcgb3IgZW1wdHkgcmVn
L3Jhbmdlcwo+ICAgcHJvcGVydHkKPiAgIG1lc29uLWcxMi1jb21tb24uZHRzaToxNzY4LjI3LTIw
NDAuNjogV2FybmluZyAoc2ltcGxlX2J1c19yZWcpOgo+ICAgL3NvYy9idXNAZmY4MDAwMDAvcGlu
Y3RybEAxNDogbWlzc2luZyBvciBlbXB0eSByZWcvcmFuZ2VzIHByb3BlcnR5Cj4gICBtZXNvbi1n
MTItY29tbW9uLmR0c2k6MjIzOS4yMy0yMjc5LjY6IFdhcm5pbmcKPiAgIChhdm9pZF91bm5lY2Vz
c2FyeV9hZGRyX3NpemUpOiAvc29jL2J1c0BmZmQwMDAwMC9kc2lANzAwMDoKPiAgIHVubmVjZXNz
YXJ5ICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIHdpdGhvdXQgInJhbmdlcyIsICJkbWEtcmFu
Z2VzIgo+ICAgb3IgY2hpbGQgInJlZyIgb3IgInJhbmdlcyIgcHJvcGVydHkKPgo+IFRoZSBwaW5j
dHJsIG5vZGUgaGFzIG5vIHJlZyBwcm9wZXJ0eSBvZiBpdHMgb3duLCBhbmQgaXRzIGVtcHR5Cj4g
InJhbmdlczsiIGRvZXMgbm90IGRlc2NyaWJlIHdoaWNoIGFkZHJlc3Mgc3BhY2UgaXMgdHJhbnNs
YXRlZCB0byB0aGUKPiBjaGlsZHJlbgo+Cj4gICAvc29jL2J1c0BmZmQwMDAwMC9kc2lANzAwMDog
dW5uZWNlc3NhcnkgI2FkZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMKPiAgIHdpdGhvdXQgInJhbmdl
cyIsICJkbWEtcmFuZ2VzIiBvciBjaGlsZCAicmVnIiBvciAicmFuZ2VzIiBwcm9wZXJ0eQo+Cj4g
VGhlIERTSSBjb250cm9sbGVyIG5vZGUgaGFzIG5vIGNoaWxkIG5vZGVzIHdpdGggYSByZWcgcHJv
cGVydHksCj4gc28gI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIHNlcnZlIG5vIHB1cnBv
c2UuIFJlbW92ZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4
LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpc24ndCBhIGJ1Zywg
YnV0IHRoZSBjb21taXQgc3ViamVjdCBhbmQgb3BlbmluZyBzZW50ZW5jZSBvbmx5IG1lbnRpb24K
dGhlIHBlcmlwaHNfcGluY3RybCBub2RlIChwaW5jdHJsQDQwKSwgd2hlcmVhcyB0aGUgcGF0Y2gg
YWxzbyBhZGRzIHJhbmdlcyB0bwphb19waW5jdHJsIChwaW5jdHJsQDE0KSBhbmQgcmVtb3ZlcyAj
YWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgZnJvbSB0aGUKdW5yZWxhdGVkIG1pcGlfZHNp
IG5vZGUgKGRzaUA3MDAwKS4KClNob3VsZCB0aGUgbWlwaV9kc2kgY2hhbmdlIGJlIHNwbGl0IGlu
dG8gYSBzZXBhcmF0ZSBjb21taXQgKG9yIHJlZmxlY3RlZCBpbgp0aGUgc3ViamVjdCBhbG9uZ3Np
ZGUgYW9fcGluY3RybCksIGFuZCB0aGUgZHVwbGljYXRlZCBkc2lANzAwMCB3YXJuaW5nIHRleHQK
YWZ0ZXIgdGhlIHVucHVuY3R1YXRlZCBzZW50ZW5jZSAoIi4uLnRyYW5zbGF0ZWQgdG8gdGhlIGNo
aWxkcmVuIikgYmUgY2xlYW5lZAp1cD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTUtZml4LWFtbG9naWMtZHQtd2FybmluZ3Mt
djEtMC05NGNiZDY3YTMyZWFAYWxpZWwuZnI/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
