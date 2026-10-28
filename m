Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F290606A31A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1YKbU1Wi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iu5NUdQz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CngG4fUoP9FvYF7ykihYzCOMY3XKl4SpxECuHN2Op4M=; b=1YKbU1WiX0sLf2a3Uo3Dj7Cu2l
	ZYL8k4d//M1UZUr6TWA1JVeQLWtmaAcsR88Fx4wK+YWxgBK+kdYRybKDPh99sHhv6CLi03W4WGO4t
	Es7+JOt2zcSTcz5whX/pIE6tNyoK9oCjX0YaBZJN79c/jJVAuavRRuAwkuWTJeBUe+nbCONSeNMGY
	oFKVVc43VuBIlKr7UkTgn1jTqnwUZlJmwWEmFVS4smEbKVADMa9E1MNKDbOe2T1uGRYFTem5cz2z7
	rHmpkwATTI+wQsPWxpCK/wWHyf65rwwz/NRSdGI4i3wNFzObCHsuxgwLxd7It8WW0xTmH8cpZOKGQ
	5lLbn6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu8Q-00000006CFo-1jNe;
	Wed, 28 Oct 2026 03:15:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu8P-00000006CFg-1wKC
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Oct 2026 03:15:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4B1C600C8;
	Wed, 28 Oct 2026 03:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3B01F01829;
	Wed, 28 Oct 2026 03:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793157328;
	bh=JKVE0oHbGCK3KEheqHakd016WqeZ7tntTKiPfLYIsd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iu5NUdQzyd7a65Ku7fJTWRV6m0p2do9Nc/2AJoVNOZJ8x/+qEsVuXsHO4hcXq8ZRh
	 Qb6v2CdqHDwdFXPILzwmPmA3FmGjyQVxKBKPJlt91xPR/r60oVIJDw6+p0n5QDkwis
	 Ksn/qvTJdAdajxJT1oOx2S9YPAudrYYLNY+kiTeG9liPpVK+vllNbk1eUpWHunYx9v
	 U6W+e6/qGXHvA5VWBmqaGOtgc67E++1XrC6nvEtUKIUkfJd633umj7+nHQLfif9Our
	 DU2lKE8+lami6PdQsZmOpB0wbrmLYKjHf/MfU170DApb/WinuidsiqQ+MdiFePL3fz
	 8i0UtSgno10lQ==
Message-ID: <sashiko-outbox-187403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/16] PCI: dwc: Add pcie_cap field and caching
 helper
To: "Hans Zhang" <18255117159@163.com>
Cc: imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261028030652.2917756-2-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
 <20261028030652.2917756-2-18255117159@163.com>
Date: Wed, 28 Oct 2026 03:15:27 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gUENJOiBkd2M6IHVu
Y29uZmlybWVkIG9mZnNldCByZXR1cm5lZCBpbiBkd19wY2llX2dldF9wY2llX2NhcCgpCi0tCgpj
b21taXQgYzZmY2Q4NDBjZGI1N2RkMzUxZWExNzg3Y2FlOTE1YWQzMTY0ZmIxMwpBdXRob3I6IEhh
bnMgWmhhbmcgPDE4MjU1MTE3MTU5QDE2My5jb20+CgpQQ0k6IGR3YzogQWRkIHBjaWVfY2FwIGZp
ZWxkIGFuZCBjYWNoaW5nIGhlbHBlcgoKVGhpcyBjb21taXQgYWRkcyBhIHBjaWVfY2FwIGZpZWxk
IHRvIHN0cnVjdCBkd19wY2llIGFuZCBpbnRyb2R1Y2VzIGEKZHdfcGNpZV9nZXRfcGNpZV9jYXAo
KSBoZWxwZXIgdGhhdCBsYXppbHkgbG9va3MgdXAgYW5kIGNhY2hlcyB0aGUgUENJCkV4cHJlc3Mg
Q2FwYWJpbGl0eSBvZmZzZXQgb24gZmlyc3QgdXNlIG9uY2UgY29uZmlybWVkIHZpYSBhIERCSSBy
ZWFkLWJhY2suCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUuaCBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2Fy
ZS5oCj4gaW5kZXggNmQ3ODhhYTAwMDExNy4uZGVkZTZiMzk2NjU4NSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaAo+ICsrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oClsgLi4uIF0KPiBAQCAtODMy
LDYgKzgzNCw0MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHdfcGNpZV9kYmlfcm9fd3JfZGlzKHN0
cnVjdCBkd19wY2llICpwY2kpCj4gIAlkd19wY2llX3dyaXRlbF9kYmkocGNpLCByZWcsIHZhbCk7
Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBkd19wY2llX2dldF9wY2llX2NhcCgpIC0gUmV0dXJuIHRo
ZSBQQ0llIENhcGFiaWxpdHkgb2Zmc2V0Cj4gKyAqIEBwY2k6IERXQyBpbnN0YW5jZQo+ICsgKgpb
IC4uLiBdCj4gKyAqIFJldHVybjogdGhlIG9mZnNldCBvZiB0aGUgUENJZSBDYXBhYmlsaXR5LCBv
ciAwIGlmIGl0IGNvdWxkIG5vdCBiZQo+ICsgKiBmb3VuZCBvciBoYXMgbm90IGJlZW4gY29uZmly
bWVkIHlldC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgdTggZHdfcGNpZV9nZXRfcGNpZV9jYXAo
c3RydWN0IGR3X3BjaWUgKnBjaSkKPiArewo+ICsJdTggY2FwID0gUkVBRF9PTkNFKHBjaS0+cGNp
ZV9jYXApOwo+ICsKPiArCWlmICghY2FwKSB7Cj4gKwkJY2FwID0gZHdfcGNpZV9maW5kX2NhcGFi
aWxpdHkocGNpLCBQQ0lfQ0FQX0lEX0VYUCk7Cj4gKwkJaWYgKGNhcCAmJiBkd19wY2llX3JlYWRi
X2RiaShwY2ksIGNhcCkgPT0gUENJX0NBUF9JRF9FWFApCj4gKwkJCVdSSVRFX09OQ0UocGNpLT5w
Y2llX2NhcCwgY2FwKTsKPiArCX0KPiArCj4gKwlyZXR1cm4gY2FwOwo+ICt9CgpbU2V2ZXJpdHk6
IE1lZGl1bV0KSW4gZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmgs
IHRoZSBrZXJuZWwtZG9jIGZvcgpkd19wY2llX2dldF9wY2llX2NhcCgpIHN0YXRlcyB0aGF0IGl0
IHJldHVybnMgMCBpZiB0aGUgY2FwYWJpbGl0eSBjb3VsZCBub3QKYmUgZm91bmQgb3IgaGFzIG5v
dCBiZWVuIGNvbmZpcm1lZCB5ZXQuCgpIb3dldmVyLCB3aGVuIHBjaS0+cGNpZV9jYXAgaXMgMCBh
bmQgdHJhbnNpZW50IERCSSBkYXRhIGNhdXNlcwpkd19wY2llX2ZpbmRfY2FwYWJpbGl0eShwY2ks
IFBDSV9DQVBfSURfRVhQKSB0byByZXR1cm4gYSBub24temVybyBvZmZzZXQgY2FwCndoaWxlIHRo
ZSBjb25maXJtYXRpb24gY2hlY2sgZHdfcGNpZV9yZWFkYl9kYmkocGNpLCBjYXApID09IFBDSV9D
QVBfSURfRVhQCmV2YWx1YXRlcyB0byBmYWxzZSwgcGNpLT5wY2llX2NhcCBpcyBsZWZ0IGFzIDAs
IGJ1dCB0aGUgdW5jb25maXJtZWQgbm9uLXplcm8KY2FwIGlzIHN0aWxsIHJldHVybmVkIHRvIHRo
ZSBjYWxsZXIuCgpDYWxsZXJzIHRoYXQgZ3VhcmQgREJJIHdyaXRlcyBvbiBhIG5vbi16ZXJvIHJl
dHVybiAoc3VjaCBhcwpyb2NrY2hpcF9wY2llX2VuYWJsZV9sMHMoKSkgb3IgY2FjaGUgYSBub24t
emVybyByZXR1cm4gaW4gZHJpdmVyIHN0YXRlIChzdWNoCmFzIHRlZ3JhX3BjaWVfZHdfaG9zdF9p
bml0KCkgc2V0dGluZyBwY2llLT5wY2llX2NhcF9iYXNlIHdoZW4KIXBjaWUtPnBjaWVfY2FwX2Jh
c2UpIHdpbGwgdGhlbiBjb25zdW1lIG9yIHBlcm1hbmVudGx5IHN0b3JlIHRoZSB1bmNvbmZpcm1l
ZApvZmZzZXQuCgpTaG91bGQgZHdfcGNpZV9nZXRfcGNpZV9jYXAoKSByZXR1cm4gMCB3aGVuIHRo
ZSBjb25maXJtYXRpb24gcmVhZC1iYWNrIGZhaWxzLApvciBzaG91bGQgdGhlIGtlcm5lbC1kb2Mg
Y29tbWVudCBiZSB1cGRhdGVkIHRvIG1hdGNoIHRoZSBpbXBsZW1lbnRhdGlvbj8KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMjgw
MzA2NTIuMjkxNzc1Ni0xLTE4MjU1MTE3MTU5QDE2My5jb20/cGFydD0xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
