Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D569CD5BAB
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2026 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VUIDQBM55vmubA3DqIXsLJIlyMWhygwkBd7QehrrWA=; b=g16RLXk8H9KL+7
	LX8zQ/zaLKBfa74RiIHVyvZF1fEFlRtx4JELakVomY1e6SQLkolCTgkA33+LZlzsnVAUDcWm8Kd20
	+njY0r00y1WXC1q0PSTRLXNJAlgC8n4aNTnTgbv/maTNXJ7fff92Nwkypxoo9M1daId01VlXr/VTn
	RwFpXOHew4gGYPUETLELx3JMIlA7PU7sB0QmVarzDRdqnzNYLE+c7shMV9u0yqfKkRoarWucBOsA1
	1QU3cuvbtShKpyic2kVWztloy+Zpn8Sbf0UYj9Fi9zs9fwyYOo4YnSAqWBWg+dOjANB0q7lM58kXP
	DLOtFXlliuz1K5B1P/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBdw-0000000FGR4-3Gnp;
	Sun, 24 May 2026 16:25:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBdu-0000000FGQb-3O9Q
	for linux-amlogic@lists.infradead.org;
	Sun, 24 May 2026 16:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02C74441EF;
	Sun, 24 May 2026 16:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98601F000E9;
	Sun, 24 May 2026 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779639933;
	bh=4SH7zxB5wFxy1auSNk6gNEVGgrrieyIUVIuEy4jEWbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y++VnX1F8JFBCZBRlUIzOVBPm54Bm8qR5xvDFu+QYP38EI00p5LPIcQsIiQJcxmw6
	 mvvshI4nFST4CMY1i+CTICz+RqieN5/z9N+XU0vX0e3X377z39Js+LF5r0IyyEa29s
	 AOEnztWPlHqMFMnjCAPfMh/AlZy1SLyfImGAtbxTXRfnED0jiMkH/9WpsA1uulTQu+
	 hUkFwryaG3aXPNobOML2C8IucAxhPpV3xku59QRupbU+bL3eMoSjoer9CtyQ+B+DqQ
	 PemDg26NM1pTMyfZ/UduKDzmC0tXiBetIYNssswvGcBrTgHZE6LZdLN1vW5KWQhj3j
	 d1rfTkZXvY+Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/meson: clean up KMS polling on register failure
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
Date: Sun, 24 May 2026 16:25:33 +0000
Message-Id: <20260524162533.A98601F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_092534_878111_4DE4F832 
X-CRM114-Status: GOOD (  11.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBVc2UtYWZ0ZXItZnJlZSBvZiB0aGUgYGRybWAgcG9pbnRlciBpbiB0aGUgYGZyZWVf
ZHJtYCBlcnJvciBwYXRoIG9mIGBtZXNvbl9kcnZfYmluZF9tYXN0ZXIoKWAuCi0gW0hpZ2hdIE1l
bW9yeSBsZWFrIG9mIGBkZXZtXypgIGFsbG9jYXRlZCByZXNvdXJjZXMgZHVyaW5nIGNvbXBvbmVu
dCBiaW5kIGZhaWx1cmVzIG9yIHVuYmluZCBvcGVyYXRpb25zLgotLQoKY29tbWl0IDBhMWI4ODJk
ZmYzNjg5ZTgwYzU1NDZmN2MwYmYzOGM2OTMwYTE2NTIKQXV0aG9yOiBNeWVvbmdodW4gUGFrIDxt
aHVuNTEyQGdtYWlsLmNvbT4KZHJtL21lc29uOiBjbGVhbiB1cCBLTVMgcG9sbGluZyBvbiByZWdp
c3RlciBmYWlsdXJlCgpUaGlzIGNvbW1pdCBmaXhlcyBhbiBpc3N1ZSBpbiBtZXNvbl9kcnZfYmlu
ZF9tYXN0ZXIoKSB3aGVyZSB0aGUgS01TCnBvbGxpbmcgaGVscGVyIGlzIGxlZnQgcnVubmluZyBp
ZiBkcm1fZGV2X3JlZ2lzdGVyKCkgZmFpbHMuIEl0IGludHJvZHVjZXMKYSBuZXcgdW5pbnN0YWxs
X3BvbGwgZXJyb3IgcGF0aCB0byBjYWxsIGRybV9rbXNfaGVscGVyX3BvbGxfZmluaSgpIGJlZm9y
ZQpmcmVlaW5nIHRoZSBJUlEuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiBpbmRleCA0
OWZmOWYxZjE2ZDMyLi5lNDlkZTVkZjczODY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYwo+IEBAIC0zNTIsMTIgKzM1MiwxNCBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21h
c3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4gIAo+ICAJcmV0
ID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOwo+ICAJaWYgKHJldCkKPiAtCQlnb3RvIHVuaW5z
dGFsbF9pcnE7Cj4gKwkJZ290byB1bmluc3RhbGxfcG9sbDsKPiAgCj4gIAlkcm1fY2xpZW50X3Nl
dHVwKGRybSwgTlVMTCk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIAo+ICt1bmluc3RhbGxfcG9sbDoK
PiArCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwo+ICB1bmluc3RhbGxfaXJxOgo+ICAJ
ZnJlZV9pcnEocHJpdi0+dnN5bmNfaXJxLCBkcm0pOwo+ICBleGl0X2FmYmNkOgoKW1NldmVyaXR5
OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRv
ZXMgdGhlIGVycm9yIHVud2luZGluZyBwYXRoCmhhdmUgYSB1c2UtYWZ0ZXItZnJlZT8KCkxvb2tp
bmcgZnVydGhlciBkb3duIGluIHRoaXMgZnVuY3Rpb24gYXQgdGhlIGZyZWVfZHJtIGxhYmVsOgoK
ZnJlZV9kcm06Cglkcm1fZGV2X3B1dChkcm0pOwoKCW1lc29uX2VuY29kZXJfZHNpX3JlbW92ZShw
cml2KTsKCW1lc29uX2VuY29kZXJfaGRtaV9yZW1vdmUocHJpdik7CgltZXNvbl9lbmNvZGVyX2N2
YnNfcmVtb3ZlKHByaXYpOwoKCWlmIChoYXNfY29tcG9uZW50cykKCQljb21wb25lbnRfdW5iaW5k
X2FsbChkZXYsIGRybSk7CgpTaW5jZSBkcm1fZGV2X3B1dCgpIGRyb3BzIHRoZSBmaW5hbCByZWZl
cmVuY2UgYW5kIGZyZWVzIHRoZSBkcm0gc3RydWN0dXJlLAp3b24ndCBjb21wb25lbnRfdW5iaW5k
X2FsbCgpIHRyaWdnZXIgYSB1c2UtYWZ0ZXItZnJlZSB3aGVuIHVuYmluZCBjYWxsYmFja3MKZGVy
ZWZlcmVuY2UgdGhlIGZyZWVkIHBvaW50ZXI/CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYWxz
byBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGFyZSB3ZSBsZWFraW5nIGRldm1fKiByZXNvdXJj
ZXMKZHVyaW5nIGNvbXBvbmVudCBiaW5kIGZhaWx1cmVzIG9yIHVuYmluZCBvcGVyYXRpb25zPwoK
QmVjYXVzZSBkZXZtIGFsbG9jYXRpb25zIGFyZSBzY29wZWQgdG8gdGhlIGRldmljZSBwcm9iZSBs
aWZlY3ljbGUsIHRoZXkKYXJlIG5vdCBpbXBsaWNpdGx5IHJlbGVhc2VkIGR1cmluZyBiaW5kIGZh
aWx1cmUgcGF0aHMgb3IgdW5iaW5kIGNhbGxzLgoKQ291bGQgdGhpcyByZXN1bHQgaW4gcGVybWFu
ZW50IG1lbW9yeSBsZWFrcyBhY3Jvc3MgcmV0cmllcyBpZiBjb21wb25lbnQKYmluZGluZyBmYWls
cyBhbmQgaXMgbGF0ZXIgcmV0cmllZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjQxNjA2NTcuMTc4MDItMS1taHVuNTEyQGdt
YWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
