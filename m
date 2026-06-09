Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96552CD8CA8
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4r/Np3HiIB7PwC76uTITBgL9NE2Xa0Clta1EfB/aN84=; b=u4RNvzxL0Tcv9R
	UTaNYG0MMJt4uqsDjrxgv4RxXempUtLxYakDL0ERbWO55VCW40Ywita05uNUtPefBA+7+vepruO6F
	tnhZ/dDlwhqAZ+/vf6XDUdzVJxMjAIdssfsB+AK57OSmZDCDLMXisIwREtMEn5VFylAJANvnuwxkf
	25KuLdt+Bk5xUCOuC+Bl588AKxfrz+SJ22Vcxsi0un59Ha+LALiHyL6nK+wmsHDUX9QvTNK8Xy/I3
	8sNRKoEO4RPDub/IBoM8ZJuYIY7THayt8Um2+Gd/DEggGpFnjcUXC/ormapWING9BtDDojWNqS5ic
	74OANpI/fqbJsJpBR9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw1T-00000005bt0-0fAw;
	Tue, 09 Jun 2026 12:57:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw1R-00000005bsn-0tWU
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 12:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 532EC601D6;
	Tue,  9 Jun 2026 12:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB651F00893;
	Tue,  9 Jun 2026 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781009856;
	bh=izZ2QDQwA88V3EqqmQuT8/jO9V2+mCKlKelmB6Rv9Vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKxMmxGr4xFMbfsTXNkiWXM5q54LZTltFamAtPPr2y12k3HrVJYk2s2bjso/OXpRy
	 X15ANGz7nDg2gXgEGOCRrXOkFdR0LFuUJkJjY5C9Q7ISAXOvIiKO9ulDtNDhLKyfl5
	 74Xekujkp234kqCwiFBSyclQL15nr6n4GZEo3U5U7C5lWLq69lJUd56KFAEyFNjC6P
	 5F1X27tbwSAUAlYGsREj59sp2fmO8MXfL5xTsrlq5eSsJAWBHXVQrSfX/HasDWQhoQ
	 ZAqmBkHReoGBMXTv1lOvAlPaz8IrV4ZgSQeSCiFP/ADORGiltH4ErTL5jaFCE+hQhh
	 VTTLwRSEljh4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: aiu: Validate written enum values
To: "HyeongJun An" <sammiee5311@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260609124317.38046-3-sammiee5311@gmail.com>
References: <20260609124317.38046-3-sammiee5311@gmail.com>
Date: Tue, 09 Jun 2026 12:57:35 +0000
Message-Id: <20260609125735.CEB651F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIGJvdW5kcyBjaGVjayBvbiB1c2VyLXN1cHBsaWVkIGBpdGVtWzBdYCBp
bmRleCBsZWFkcyB0byBhbiBvdXQtb2YtYm91bmRzIGhlYXAgcmVhZCB3aGVuIGV2YWx1YXRpbmcg
YHNuZF9zb2NfZW51bV9pdGVtX3RvX3ZhbGAuCi0tCgpjb21taXQgOWE2ZjIyM2QzYTQzYzRkOTQ2
ZjQ2Yjk1NmU4NDRjZGUzN2QwOWJlZgpBdXRob3I6IEh5ZW9uZ0p1biBBbiA8c2FtbWllZTUzMTFA
Z21haWwuY29tPgoKQVNvQzogbWVzb246IGFpdTogVmFsaWRhdGUgd3JpdHRlbiBlbnVtIHZhbHVl
cwoKVGhpcyBjb21taXQgZml4ZXMgbWlzc2luZyBib3VuZHMgY2hlY2tpbmcgb24gdXNlci1zdXBw
bGllZCBlbnVtZXJhdGlvbgp2YWx1ZXMgaW4gdGhlIEFJVSBIRE1JIGFuZCBpbnRlcm5hbCBjb2Rl
YyBtdXggcHV0IGNhbGxiYWNrcyBiZWZvcmUgdGhleQphcmUgcGFzc2VkIHRvIHNuZF9zb2NfZW51
bV9pdGVtX3RvX3ZhbCgpLgoKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lc29uL2FpdS1hY29k
ZWMtY3RybC5jIGIvc291bmQvc29jL21lc29uL2FpdS1hY29kZWMtY3RybC5jCj4gaW5kZXggNDgz
NzcyYmE2OWNkNy4uOTRjNWQ2NTMzNTIzMyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvbWVzb24v
YWl1LWFjb2RlYy1jdHJsLmMKPiArKysgYi9zb3VuZC9zb2MvbWVzb24vYWl1LWFjb2RlYy1jdHJs
LmMKPiBAQCAtMzYsNiArMzYsOSBAQCBzdGF0aWMgaW50IGFpdV9hY29kZWNfY3RybF9tdXhfcHV0
X2VudW0oc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gIAlzdHJ1Y3Qgc29jX2VudW0g
KmUgPSAoc3RydWN0IHNvY19lbnVtICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7Cj4gIAl1bnNp
Z25lZCBpbnQgbXV4LCBjaGFuZ2VkOwo+ICAKPiArCWlmICh1Y29udHJvbC0+dmFsdWUuZW51bWVy
YXRlZC5pdGVtWzBdID49IGUtPml0ZW1zKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKCltTZXZl
cml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHdoaWxlIHlvdSBh
cmUgZml4aW5nIG1pc3NpbmcgZW51bQp2YWxpZGF0aW9ucyBoZXJlLCBkb2VzIHNvdW5kL3NvYy9z
ZGNhL3NkY2FfYXNvYy5jOmdlX3B1dF9lbnVtX2RvdWJsZSgpCnN1ZmZlciBmcm9tIHRoZSBleGFj
dCBzYW1lIG91dC1vZi1ib3VuZHMgcmVhZD8KCkluIGdlX3B1dF9lbnVtX2RvdWJsZSgpLCB0aGUg
dXNlci1zdXBwbGllZCBpbmRleCBpdGVtWzBdIGlzIHBhc3NlZCB0bwpzbmRfc29jX2VudW1faXRl
bV90b192YWwoKSB3aXRob3V0IHZlcmlmeWluZyBpZiBpdCBpcyBsZXNzIHRoYW4gZS0+aXRlbXM6
CgpyZXQgPSBzbmRfc29jX2VudW1faXRlbV90b192YWwoZSwgaXRlbVswXSk7CgpCZWNhdXNlIGUt
PnZhbHVlcyBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQgb24gdGhlIGhlYXAsIGFuIHVuY2hlY2tl
ZApsYXJnZSBpdGVtWzBdIGNhbiByZWFkIG1lbW9yeSBwYXN0IHRoZSBlbmQgb2YgdGhlIHZhbHVl
cyBidWZmZXIuIElmIHRoaXMKb3V0LW9mLWJvdW5kcyByZWFkIGhpdHMgYW4gdW5tYXBwZWQgcGFn
ZSwgY291bGQgaXQgdHJpZ2dlciBhIHBhZ2UgZmF1bHQKdmlhIHRoZSBBTFNBIGNvbnRyb2wgaW50
ZXJmYWNlPwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDYwOTEyNDMxNy4zODA0Ni0xLXNhbW1pZWU1MzExQGdtYWls
LmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
