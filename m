Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A22C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 12:07:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E93A246EE
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 12:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9el7a/P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Untss5VP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E93A246EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=sj8F6wy31n+ASoFR8TxziDRN+NHVYiYYSAsbbifLWEY=; b=K9el7a/P8TpoHD0AplNtEXaIQ
	9UthQYb6MInrts01UWZ+lIjD7RpqDoJK02W1jiK30Ue/2myrT8iz0DeeLx37PaVI4IgUoh5kSvu4z
	u6+USgxsLH6GilJIieMr44RHPpWAbdXOTNem+lT2UipbwtLwVsays9MkiOQFv0JcIXnAR6b5f3Et5
	yawfyyc6zrGlT+YMuSa5GQ2AcWLtFyInvrBWZczJBZF3Lmox+wKYMzOmE7f/m3uh5gKHJEiVhv5z9
	WN1sdDT/XvY+AH0gJptYB1GO/VdwUTSxcMqEfQD4nM47XiBpyf/Ype7Hzi0z7ArJpEeydNBqB9jxn
	3RxFnFqZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXkEG-0005XV-Ev; Wed, 28 Oct 2020 12:07:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXkED-0005Wh-N2
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 12:06:58 +0000
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F977246E8;
 Wed, 28 Oct 2020 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603886816;
 bh=c3/rdvftJ6JnKD8VUBIW4eoNR5VA7ESNHgN0Zlp4hJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Untss5VPA7L1b4nTbLJJ9hEObyi+ldMQjQ+NARyLMYKn4NiGyFOPYFi/M8trh1iHI
 n3hrChqGa9Gn63erK+GKqTPqX2Uh7401xdku3fJjEzww0qMhVcjTOby8evFYbY9mRz
 zAbJ5BXJ9ZjqBG2Xid4JjZoQ7RD74txrYQfIYfTY=
Date: Wed, 28 Oct 2020 07:06:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "yue.wang@amlogic.com" <yue.wang@amlogic.com>
Subject: Re: pci-meson covery issue #1442509
Message-ID: <20201028120655.GA306101@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2020102810175892085918@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_080658_014428_74966711 
X-CRM114-Status: GOOD (  19.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci <linux-pci@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SXQncyBiZXN0IGlmIHlvdSBjYW4gcmVwbHkgd2l0aCBwbGFpbi10ZXh0IGVtYWlsLCBiZWNhdXNl
IEkgZG9uJ3QKdGhpbmsgbXVsdGktcGFydCBNSU1FIG1lc3NhZ2VzIGFyZSBhY2NlcHRlZCBieSB0
aGUgbWFpbGluZyBsaXN0czoKaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5o
dG1sCgpPbiBXZWQsIE9jdCAyOCwgMjAyMCBhdCAxMDoxNzo1OUFNICswODAwLCB5dWUud2FuZ0Bh
bWxvZ2ljLmNvbSB3cm90ZToKPiBISSBCam9ybiwKPiAKPiBhbWxvZ2ljIFBDSUVfQ0ZHX1NUQVRV
UzE3IHJlZ2lzdGVyOgo+IAo+IGFuZCBiaXQ3IG1hY19waHlfcmF0ZSA6Cj4gCj4gQW1sb2dpYyBw
Y2llIHdvcmtpbmcgbW9kZSBpcyBvbmx5IEdFTjEgJiBHRU4y77yMc28gbWFjX3BoeV9yYXRlIGlz
IDAgb3IgMe+8mwo+IAo+IFBNX0NVUlJFTlRfU1RBVEUoc3RhdGUxNykgIGlzIHJlbGF0ZWQgdG8g
QW1sb2dpYyBwY2llIHdvcmtpbmcgbW9kZe+8jGFuZCAgbm90ICByZWxhdGVkIHRvIHBvd2VyIG1h
bmFnZW1lbnQuCj4gCj4gIlBNX0NVUlJFTlRfU1RBVEUoc3RhdGUxNykgPCBQQ0lFX0dFTjMiICBp
cyBhbHdheXMgdHJ1ZS4gCgpUaGVyZSdzIG5vIHBvaW50IGluIG1ha2luZyBhIGNvbXBhcmlzaW9u
IHRoYXQncyBhbHdheXMgdHJ1ZS4gIEl0IGp1c3QKY2x1dHRlcnMgdGhlIGNvZGUgd2l0aG91dCBh
ZGRpbmcgdmFsdWUuICBJTU8geW91IHNob3VsZCBkbyBzb21ldGhpbmcKbGlrZSB0aGUgZm9sbG93
aW5nLiAgSWYgYW5kIHdoZW4geW91IGFjdHVhbGx5ICpuZWVkKiB0byBjaGVjayB0aGUKbWFjX3Bo
eV9yYXRlIGFuZCB0aGVyZSdzIGEgcG9zc2liaWxpdHkgdGhhdCBpdCBtaWdodCBub3QgYmUgT0ss
IHlvdQpjYW4gYWRkIGl0IGJhY2suCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpLW1lc29uLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24u
YwppbmRleCAxOTEzZGMyYzhmYTAuLmJiN2EzNWM3YzU3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpLW1lc29uLmMKQEAgLTM1LDkgKzM1LDYgQEAKICNkZWZpbmUgSVNfUkRMSF9MSU5L
X1VQKHgpCQkoKHgpICYgKDEgPDwgMTYpKQogI2RlZmluZSBJU19MVFNTTV9VUCh4KQkJCSgoKCh4
KSA+PiAxMCkgJiAweDFmKSA9PSAweDExKQogCi0jZGVmaW5lIFBDSUVfQ0ZHX1NUQVRVUzE3CQkw
eDQ0Ci0jZGVmaW5lIFBNX0NVUlJFTlRfU1RBVEUoeCkJCSgoKHgpID4+IDcpICYgMHgxKQotCiAj
ZGVmaW5lIFdBSVRfTElOS1VQX1RJTUVPVVQJCTQwMDAKICNkZWZpbmUgUE9SVF9DTEtfUkFURQkJ
CTEwMDAwMDAwMFVMCiAjZGVmaW5lIE1BWF9QQVlMT0FEX1NJWkUJCTI1NgpAQCAtMzQxLDMwICsz
MzgsMjMgQEAgc3RhdGljIGludCBtZXNvbl9wY2llX2xpbmtfdXAoc3RydWN0IGR3X3BjaWUgKnBj
aSkKIHsKIAlzdHJ1Y3QgbWVzb25fcGNpZSAqbXAgPSB0b19tZXNvbl9wY2llKHBjaSk7CiAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gcGNpLT5kZXY7Ci0JdTMyIHNwZWVkX29rYXkgPSAwOwogCXUzMiBj
bnQgPSAwOwotCXUzMiBzdGF0ZTEyLCBzdGF0ZTE3LCBzbWxoX3VwLCBsdHNzbV91cCwgcmRsaF91
cDsKKwl1MzIgc3RhdGUxMiwgc21saF91cCwgbHRzc21fdXAsIHJkbGhfdXA7CiAKIAlkbyB7CiAJ
CXN0YXRlMTIgPSBtZXNvbl9jZmdfcmVhZGwobXAsIFBDSUVfQ0ZHX1NUQVRVUzEyKTsKLQkJc3Rh
dGUxNyA9IG1lc29uX2NmZ19yZWFkbChtcCwgUENJRV9DRkdfU1RBVFVTMTcpOwogCQlzbWxoX3Vw
ID0gSVNfU01MSF9MSU5LX1VQKHN0YXRlMTIpOwogCQlyZGxoX3VwID0gSVNfUkRMSF9MSU5LX1VQ
KHN0YXRlMTIpOwogCQlsdHNzbV91cCA9IElTX0xUU1NNX1VQKHN0YXRlMTIpOwogCi0JCWlmIChQ
TV9DVVJSRU5UX1NUQVRFKHN0YXRlMTcpIDwgUENJRV9HRU4zKQotCQkJc3BlZWRfb2theSA9IDE7
Ci0KIAkJaWYgKHNtbGhfdXApCiAJCQlkZXZfZGJnKGRldiwgInNtbGhfbGlua191cCBpcyBvblxu
Iik7CiAJCWlmIChyZGxoX3VwKQogCQkJZGV2X2RiZyhkZXYsICJyZGxoX2xpbmtfdXAgaXMgb25c
biIpOwogCQlpZiAobHRzc21fdXApCiAJCQlkZXZfZGJnKGRldiwgImx0c3NtX3VwIGlzIG9uXG4i
KTsKLQkJaWYgKHNwZWVkX29rYXkpCi0JCQlkZXZfZGJnKGRldiwgInNwZWVkX29rYXlcbiIpOwog
Ci0JCWlmIChzbWxoX3VwICYmIHJkbGhfdXAgJiYgbHRzc21fdXAgJiYgc3BlZWRfb2theSkKKwkJ
aWYgKHNtbGhfdXAgJiYgcmRsaF91cCAmJiBsdHNzbV91cCkKIAkJCXJldHVybiAxOwogCiAJCWNu
dCsrOwoKPiB5dWUud2FuZ0BhbWxvZ2ljLmNvbQo+ICAKPiBGcm9tOiBCam9ybiBIZWxnYWFzCj4g
RGF0ZTogMjAyMC0xMC0yOCAwMDo0MAo+IFRvOiBZdWUgV2FuZwo+IENDOiBsaW51eC1wY2k7IEtl
dmluIEhpbG1hbjsgbGludXgtYW1sb2dpYwo+IFN1YmplY3Q6IHBjaS1tZXNvbiBjb3ZlcnkgaXNz
dWUgIzE0NDI1MDkKPiBIaSBZdWUsCj4gIAo+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIGlz
c3VlIHJlcG9ydGVkIGJ5IENvdmVyaXR5Ogo+ICAKPiAzNDAgc3RhdGljIGludCBtZXNvbl9wY2ll
X2xpbmtfdXAoc3RydWN0IGR3X3BjaWUgKnBjaSkKPiAzNDEgewo+IDM0MiAgICAgICAgc3RydWN0
IG1lc29uX3BjaWUgKm1wID0gdG9fbWVzb25fcGNpZShwY2kpOwo+IDM0MyAgICAgICAgc3RydWN0
IGRldmljZSAqZGV2ID0gcGNpLT5kZXY7Cj4gMzQ0ICAgICAgICB1MzIgc3BlZWRfb2theSA9IDA7
Cj4gMzQ1ICAgICAgICB1MzIgY250ID0gMDsKPiAzNDYgICAgICAgIHUzMiBzdGF0ZTEyLCBzdGF0
ZTE3LCBzbWxoX3VwLCBsdHNzbV91cCwgcmRsaF91cDsKPiAzNDcKPiAzNDggICAgICAgIGRvIHsK
PiAzNDkgICAgICAgICAgICAgICAgc3RhdGUxMiA9IG1lc29uX2NmZ19yZWFkbChtcCwgUENJRV9D
RkdfU1RBVFVTMTIpOwo+IDM1MCAgICAgICAgICAgICAgICBzdGF0ZTE3ID0gbWVzb25fY2ZnX3Jl
YWRsKG1wLCBQQ0lFX0NGR19TVEFUVVMxNyk7Cj4gMzUxICAgICAgICAgICAgICAgIHNtbGhfdXAg
PSBJU19TTUxIX0xJTktfVVAoc3RhdGUxMik7Cj4gMzUyICAgICAgICAgICAgICAgIHJkbGhfdXAg
PSBJU19SRExIX0xJTktfVVAoc3RhdGUxMik7Cj4gMzUzICAgICAgICAgICAgICAgIGx0c3NtX3Vw
ID0gSVNfTFRTU01fVVAoc3RhdGUxMik7Cj4gMzU0Cj4gIAo+IENJRCAxNDQyNTA5ICgjMSBvZiAx
KTogT3BlcmFuZHMgZG9uJ3QgYWZmZWN0IHJlc3VsdAo+IChDT05TVEFOVF9FWFBSRVNTSU9OX1JF
U1VMVCkgcmVzdWx0X2luZGVwZW5kZW50X29mX29wZXJhbmRzOiAoKHN0YXRlMTcKPiA+PiA3KSAm
IDEpIDwgUENJRV9HRU4zIGlzIGFsd2F5cyB0cnVlIHJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlcyBv
ZiBpdHMKPiBvcGVyYW5kcy4gVGhpcyBvY2N1cnMgYXMgdGhlIGxvZ2ljYWwgb3BlcmFuZCBvZiBp
Zi4KPiAgCj4gMzU1ICAgICAgICAgICAgICAgIGlmIChQTV9DVVJSRU5UX1NUQVRFKHN0YXRlMTcp
IDwgUENJRV9HRU4zKQo+IDM1NiAgICAgICAgICAgICAgICAgICAgICAgIHNwZWVkX29rYXkgPSAx
Owo+ICAKPiAgCj4gIlBNIiBzZWVtcyBsaWtlIGEgZnVubnkgbmFtZSBmb3IgYSBsaW5rIHNwZWVk
LiAgSXQgc291bmRzIG1vcmUgbGlrZQo+IHNvbWV0aGluZyByZWxhdGVkIHRvIHBvd2VyIG1hbmFn
ZW1lbnQsIGUuZy4sIEQwLCBEMy4KPiAgCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
