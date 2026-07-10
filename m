Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DFDC44506
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Btadykt4ti6UY437NdycB5J1RL3bpMv0Px9uVm4pco8=; b=qFs7PA4pZIz9PW
	zuaGN1IViluzwAijkiqWSqdI1UspTe6xx1yol1umBiNdVjCKNaSNm2al9yiddNZ/o+/A9/02HYhYW
	Bt8k1/a5cGTErPAwDaA/OIFiGu9P7xXr5qmrIQm+iQjRqmxb7o7tV/DqnZiFDAprnajYlQptajxyi
	6isSRqcDwI8bKghIY8V7JKFS0jd2s+aALmPnsvz6G4G5evN6N0h0GFcVfUCX3Pzayk97XQZHjurLO
	kkwCLNAJPBGehQCT/1hrAN+alSVj8UFvVN+0IKuLJ7GkQdiVOutHN8zm9M6zeiKkzz/li+ZFGyj8y
	k6XUt7Htg87aNi5luK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIkb-00000005pze-2uSe;
	Fri, 10 Jul 2026 21:27:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIkZ-00000005pyl-3wzb
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64C3B600C3;
	Fri, 10 Jul 2026 21:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26AA1F00A3D;
	Fri, 10 Jul 2026 21:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718831;
	bh=yR72qL3iBpHu6MDPJ2cwKn9366WFiaA7/U9J17dNTrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5ui+6bpjoCuWjHH7SRu5sFpGmgfDQJlxaE+IACZJkPyAQXWoxqREmRkuVetr1OYP
	 sFQfY21iUW7Td0qCZ76NX3I+o7+HKENoFgOI8u1cBrmoirpD9CGGooWuWwrhN7E8pd
	 3+4LLUoNdVmFIkXuyrBCw6HZSWBljWIcj7439HdJaktMPye8A16VpBi/CFFbo+z6jc
	 3ww38h5nS4fdBmJPqWzgwKE4JInByFtD6IK/ylVUSVqPMLDLzN3HkMWFiUyopXzrBK
	 XyfGPM6PV8daAoENWchL7Muj3bpQ/1qQwA5N4u+IxPJijtW0aJRIbal3LoyQBNwVGq
	 PX9mhHq42X0QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ASoC: meson: aiu-encoder-i2s: fix bs quirk
 incompatibility check
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-1-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
 <20260710-aiu-improve-quirk-check-v1-1-2fdd1b6f8896@baylibre.com>
Date: Fri, 10 Jul 2026 21:27:10 +0000
Message-Id: <20260710212710.D26AA1F00A3D@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBU
aGUgYnMtcXVpcmsgaW5jb21wYXRpYmlsaXR5IGNoZWNrIGV2YWx1YXRlcyBhIG5vbi1leGlzdGVu
dCBjYXB0dXJlIHN0cmVhbSBhbmQgaXMgdW5jb25kaXRpb25hbGx5IGJ5cGFzc2VkLgoKUHJlLWV4
aXN0aW5nIGlzc3VlczoKLSBbSGlnaF0gVGhlIEFJVSBlbmNvZGVyIEkyUyB0cmlnZ2VyIGNhbGxi
YWNrIHVuY29uZGl0aW9uYWxseSBhY3F1aXJlcyBhIG11dGV4IHdoaWxlIGhvbGRpbmcgYW4gSVJR
LWRpc2FibGVkIHNwaW5sb2NrLgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIDEvM10gQVNvQzog
bWVzb246IGFpdS1lbmNvZGVyLWkyczogZml4IGJzIHF1aXJrIGluY29tcGF0aWJpbGl0eSBjaGVj
ayAtLS0KY29tbWl0IGRjNDIwNzM1MDY1ZWY1MjE1Nzc2YzJjYmY3ZDY0ODIxMjY5YzNmNjAKQXV0
aG9yOiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgoKQVNvQzogbWVzb246IGFp
dS1lbmNvZGVyLWkyczogZml4IGJzIHF1aXJrIGluY29tcGF0aWJpbGl0eSBjaGVjawoKVGhpcyBw
YXRjaCBtb2RpZmllcyB0aGUgYnMtcXVpcmsgaW5jb21wYXRpYmlsaXR5IGNoZWNrIHRvIGV2YWx1
YXRlIHRoZSBxdWlyawpyZXF1aXJlbWVudCBvZiBpbmNvbWluZyBwYXJhbWV0ZXJzIGFnYWluc3Qg
dGhlIGNvbW1pdHRlZCBjb25maWd1cmF0aW9uIG9mIHRoZQpvcHBvc2l0ZSBzdHJlYW0gYXQgaHdf
cGFyYW1zKCkgdGltZS4gSXQgcmVtb3ZlcyB0aGUgaW50ZXJmYWNlLXdpZGUgZmxhZyBhbmQKY2xl
YXJzIGNvbW1pdHRlZCBjaGFubmVscy93aWR0aCBpbiBod19mcmVlKCkuCgo+IGRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvbWVzb24vYWl1LWVuY29kZXItaTJzLmMgYi9zb3VuZC9zb2MvbWVzb24vYWl1
LWVuY29kZXItaTJzLmMKPiBpbmRleCA4M2I1NzllOThmMWM3Li5jMmEyODBiZmRmZTJlIDEwMDY0
NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYwo+ICsrKyBiL3NvdW5k
L3NvYy9tZXNvbi9haXUtZW5jb2Rlci1pMnMuYwpbIC4uLiBdCj4gQEAgLTYyLDEzICs2MiwzNiBA
QCBzdGF0aWMgaW50IGFpdV9lbmNvZGVyX2kyc19zZXRfbGVnYWN5X2RpdihzdHJ1Y3Qgc25kX3Nv
Y19jb21wb25lbnQgKmNvbXBvbmVudCwKWyAuLi4gXQo+ICtzdGF0aWMgaW50IGFpdV9lbmNvZGVy
X2NoZWNrX2JzX3F1aXJrKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+ICsJ
CQkJICAgICAgc3RydWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsCj4gKwkJCQkgICAgICBz
dHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPiArewo+ICsJc3RydWN0IGd4X3N0cmVhbSAqb3RoZXJf
c3RyZWFtID0gc25kX3NvY19kYWlfZG1hX2RhdGFfZ2V0KGRhaSwgIXN1YnN0cmVhbS0+c3RyZWFt
KTsKPiArCj4gKwkvKiBOb3RoaW5nIHRvIGRvIGlmIHRoZSBvdGhlciBzdHJlYW0gZG9lc24ndCBl
eGlzdCBvciBpdCdzIG5vdCBjb25maWd1cmVkIHlldC4gKi8KPiArCWlmICghb3RoZXJfc3RyZWFt
IHx8ICFvdGhlcl9zdHJlYW0tPmNoYW5uZWxzKQo+ICsJCXJldHVybiAwOwoKW1NldmVyaXR5OiBI
aWdoXQpXaWxsIG90aGVyX3N0cmVhbSBhbHdheXMgYmUgTlVMTCBoZXJlPwoKTG9va2luZyBhdCBh
aXVfY3B1X2RhaV9kcnYgaW4gc291bmQvc29jL21lc29uL2FpdS5jLCBDUFVfSTJTX0VOQ09ERVIg
aXMKZGVmaW5lZCBhcyBhIHBsYXliYWNrLW9ubHkgREFJOgoKW0NQVV9JMlNfRU5DT0RFUl0gPSB7
CiAgICAubmFtZSA9ICJJMlMgRW5jb2RlciIsCiAgICAucGxheWJhY2sgPSB7CiAgICAuLi4KClNp
bmNlIHRoZXJlIGlzIG5vIGNhcHR1cmUgc3RyZWFtLCB3b24ndCAhc3Vic3RyZWFtLT5zdHJlYW0g
YWx3YXlzIHJlc29sdmUgdG8gYQpub24tZXhpc3RlbnQgc3RyZWFtPwoKSWYgc28sIG90aGVyX3N0
cmVhbSB3aWxsIGJlIHVuY29uZGl0aW9uYWxseSBOVUxMLCB3aGljaCB3b3VsZCBjYXVzZSB0aGlz
CmZ1bmN0aW9uIHRvIGltbWVkaWF0ZWx5IHJldHVybiAwIGFuZCBieXBhc3MgdGhlIGluY29tcGF0
aWJpbGl0eSBjaGVjayBlbnRpcmVseS4KClsgLi4uIF0KCltTZXZlcml0eTogSGlnaF0KVGhpcyBp
cyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhlIHRyaWdnZXIgY2FsbGJhY2sgYWNx
dWlyZSBhIG11dGV4CndoaWxlIGluIGF0b21pYyBjb250ZXh0PwoKVGhlIEFMU0EgLnRyaWdnZXIg
b3BlcmF0aW9uIGNhbGxzIGFpdV9lbmNvZGVyX2kyc190cmlnZ2VyKCksIHdoaWNoIGludm9rZXMK
Z3hfc3RyZWFtX3N0YXJ0KCkuIFRoaXMgdGhlbiBhY3F1aXJlcyBhIG11dGV4OgoKYWl1X2VuY29k
ZXJfaTJzX3RyaWdnZXIoKQogICAgZ3hfc3RyZWFtX3N0YXJ0KHRzKQogICAgICAgIG11dGV4X2xv
Y2soJnRzLT5sb2NrKTsKClNpbmNlIHRoZSBNZXNvbiBHWCBtYWNoaW5lIGRyaXZlciBkb2VzIG5v
dCBzZXQgbm9uYXRvbWljID0gdHJ1ZSBvbiBpdHMgREFJCmxpbmtzLCB0aGUgUENNIHN0cmVhbSBs
b2NrIGlzIGFuIElSUS1kaXNhYmxlZCBzcGlubG9jayB3aGVuIC50cmlnZ2VyIGlzCmludm9rZWQu
CgpXb3VsZCB0aGlzIHJlc3VsdCBpbiBhIHNjaGVkdWxpbmcgd2hpbGUgYXRvbWljIGJ1ZyB3aGVu
IHRoZSBzbGVlcGFibGUgbXV0ZXggaXMKYWNxdWlyZWQgd2hpbGUgaG9sZGluZyB0aGUgSVJRLWRp
c2FibGVkIHNwaW5sb2NrPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMC1haXUtaW1wcm92ZS1xdWlyay1jaGVjay12MS0wLTJm
ZGQxYjZmODg5NkBiYXlsaWJyZS5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
