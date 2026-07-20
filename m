Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC7C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RZU0Qs2tHrtNRhfrk1rsHI9n0xW34YUZ2FsulJU7k0=; b=0GGYWnmB8XMynZ
	tk/2b63eIKJoKbvbNaQLw2RxT5n//+FDLkam9hStjrn2h6n3+04X7bKzYT+aKKrT4CZqT/F7pfeRw
	r3tMdohsf4xpe7LCuuWhK+PSc4zNqfUyWcQWpK4OkcNHe5ggi3lx+epMUz8Bs6jQjHHJXXxDx62px
	RjaQZev9aEeKB3t8geAEYfqXGPZjOMgAx1H6dTRCHzfgyJTof+OuFjxGxdC4P6yX2IX9kREK7Y8uU
	FjsA8/FAq+kG5B+T3tnb4XrNEgbXqhbuTNW/S7db9C2XSHqAPCn0StVx6Vwar2StBL9fnuSf1HjdO
	b++YVTqt1vm9ji04pxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpro-00000007B7m-14H5;
	Mon, 20 Jul 2026 15:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlprn-00000007B6y-1arQ
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1ED141741;
	Mon, 20 Jul 2026 15:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4111F000E9;
	Mon, 20 Jul 2026 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561113;
	bh=oNi2kliUC3U2BTDBipp0e0zj3PKLL7u5AJ7MEuvmSr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UheNLwzkqzMDXOXTqAv7A9Dncsgib19vPYLFI5NzcvksU4CQFIkLUC/DP3+FvMeeC
	 BjPsYmc4CFzYkbtTo88/fcTTaxNkOy/OuQ4IxfzwLn/kAU6aaqqgP9ta2iXK+rDKIs
	 +Y2lCs5d9pgi+1XPUHBWuzT3/N5oAb73w0thFNIKfI3eqF8txIDFQcxfd68wGYRoL7
	 s3WCnLEAsMNVyUVkP5/s+2re9sFGuio+zmllbFN6R9I1nAguqVuW4jDvtrjat2dEKP
	 RN4EJXZZ/h85vsZB42Cg5ApBUHRF+8Pz5jAI7cP0o5eLV/uFd91K2TM5Ku4DW54kGf
	 f2280S5USYamQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/16] PCI: dwc: layerscape-ep: Use cached PCIe
 capability offset
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-pci@vger.kernel.org, neil.armstrong@linaro.org, imx@lists.linux.dev, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260720150619.24733-5-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-5-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:25:12 +0000
Message-Id: <20260720152513.7D4111F000E9@smtp.kernel.org>
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
IFtIaWdoXSBSZWFkLW1vZGlmeS13cml0ZSBkYXRhIHJhY2Ugb24gUENJRV9NSVNDX0NPTlRST0xf
MV9PRkYgaGFyZHdhcmUgcmVnaXN0ZXIuCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggdjMgMDQv
MTZdIFBDSTogZHdjOiBsYXllcnNjYXBlLWVwOiBVc2UgY2FjaGVkIFBDSWUgY2FwYWJpbGl0eSBv
ZmZzZXQgLS0tCmNvbW1pdCA3MDJhYjZlMTZiYzMzNDNiYjY2MjM3ZTZlYTYxOWVjYzllMDg2Yzdm
CkF1dGhvcjogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4KClBDSTogZHdjOiBsYXll
cnNjYXBlLWVwOiBVc2UgY2FjaGVkIFBDSWUgY2FwYWJpbGl0eSBvZmZzZXQKClRoaXMgY29tbWl0
IHJlcGxhY2VzIGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KCkgd2l0aCBkd19wY2llX2dldF9wY2ll
X2NhcCgpCnRvIGNhY2hlIGFuZCByZXVzZSB0aGUgUENJZSBjYXBhYmlsaXR5IG9mZnNldC4gVGhp
cyBhdm9pZHMgcmUtc2VhcmNoaW5nCnRoZSBjYXBhYmlsaXR5IGxpc3QgZHVyaW5nIHByb2JlIGFu
ZCBpbnRlcnJ1cHQgaGFuZGxpbmcuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpLWxheWVyc2NhcGUtZXAuYwo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aS1sYXllcnNjYXBlLWVwLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bGF5ZXJzY2FwZS1lcC5jCj4gQEAgLTgzLDkgKzgyLDYgQEAgc3RhdGljIGlycXJldHVybl90IGxz
X3BjaWVfZXBfZXZlbnRfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAkJcmV0dXJu
IElSUV9OT05FOwo+ICAKPiAgCWlmICh2YWwgJiBQRVhfUEYwX1BNRV9NRVNfRFJfTFVEKSB7Cj4g
LQo+IC0JCW9mZnNldCA9IGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9JRF9F
WFApOwo+IC0KPiAgCQkvKgo+ICAJCSAqIFRoZSB2YWx1ZXMgb2YgdGhlIE1heGltdW0gTGluayBX
aWR0aCBhbmQgU3VwcG9ydGVkIExpbmsKPiAgCQkgKiBTcGVlZCBmcm9tIHRoZSBMaW5rIENhcGFi
aWxpdGllcyBSZWdpc3RlciB3aWxsIGJlIGxvc3QKPiAgCQkgKiBkdXJpbmcgbGluayBkb3duIG9y
IGhvdCByZXNldC4gUmVzdG9yZSBpbml0aWFsIHZhbHVlCj4gIAkJICogdGhhdCBjb25maWd1cmVk
IGJ5IHRoZSBSZXNldCBDb25maWd1cmF0aW9uIFdvcmQgKFJDVykuCj4gIAkJICovCj4gIAkJZHdf
cGNpZV9kYmlfcm9fd3JfZW4ocGNpKTsKPiAtCQlkd19wY2llX3dyaXRlbF9kYmkocGNpLCBvZmZz
ZXQgKyBQQ0lfRVhQX0xOS0NBUCwgcGNpZS0+bG5rY2FwKTsKPiArCQlkd19wY2llX3dyaXRlbF9k
YmkocGNpLCBwY2ktPnBjaWVfY2FwICsgUENJX0VYUF9MTktDQVAsCj4gKwkJCQkgICBwY2llLT5s
bmtjYXApOwo+ICAJCWR3X3BjaWVfZGJpX3JvX3dyX2RpcyhwY2kpOwoKW1NldmVyaXR5OiBIaWdo
XQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGlzIHRoZXJl
IGEgcG90ZW50aWFsIGRhdGEgcmFjZSAKb24gdGhlIFBDSUVfTUlTQ19DT05UUk9MXzFfT0ZGIGhh
cmR3YXJlIHJlZ2lzdGVyIGhlcmU/CgpUaGUgbHNfcGNpZV9lcF9ldmVudF9oYW5kbGVyKCkgZnVu
Y3Rpb24gcnVucyBpbiBoYXJkaXJxIGNvbnRleHQuIFdoZW4gaXQKY2FsbHMgZHdfcGNpZV9kYmlf
cm9fd3JfZW4oKSBhbmQgZHdfcGNpZV9kYmlfcm9fd3JfZGlzKCksIGl0IHBlcmZvcm1zIGFuCnVu
bG9ja2VkIHJlYWQtbW9kaWZ5LXdyaXRlIG9uIHRoZSByZWdpc3RlciBhbmQgdGhlbiB1bmNvbmRp
dGlvbmFsbHkgY2xlYXJzCnRoZSBlbmFibGUgYml0OgoKZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLmg6ZHdfcGNpZV9kYmlfcm9fd3JfZGlzKCkgewogICAgcmVnID0g
UENJRV9NSVNDX0NPTlRST0xfMV9PRkY7CiAgICB2YWwgPSBkd19wY2llX3JlYWRsX2RiaShwY2ks
IHJlZyk7CiAgICB2YWwgJj0gflBDSUVfREJJX1JPX1dSX0VOOwogICAgZHdfcGNpZV93cml0ZWxf
ZGJpKHBjaSwgcmVnLCB2YWwpOwp9CgpJZiB0aGUgaG9zdCB0cmlnZ2VycyBhIExpbmsgVXAgZXZl
bnQgd2hpbGUgdGhlIGVuZHBvaW50IGNvbmZpZ3VyYXRpb24gaXMKdGFraW5nIHBsYWNlIHZpYSBj
b25maWdmcyAod2hpY2ggcnVucyBpbiBwcm9jZXNzIGNvbnRleHQpLCBjb3VsZG4ndCB0aGUKaW50
ZXJydXB0IHByZWVtcHQgdGhlIGNvbmZpZ3VyYXRpb24gdGhyZWFkPyAKCklmIHRoZSBwcmVlbXB0
ZWQgdGhyZWFkIGhhZCBqdXN0IHNldCBQQ0lFX0RCSV9ST19XUl9FTiB0byB3cml0ZSByZWdpc3Rl
cnMsCnRoZSBpbnRlcnJ1cHQgd291bGQgdW5jb25kaXRpb25hbGx5IGNsZWFyIGl0LiBXaGVuIHRo
ZSBwcmVlbXB0ZWQgdGhyZWFkCnJlc3VtZXMsIGl0cyB3cml0ZXMgdG8gcmVhZC1vbmx5IGhhcmR3
YXJlIHJlZ2lzdGVycyAobGlrZSBWZW5kb3IgSUQgb3IKQkFSIGNvbmZpZ3VyYXRpb25zKSB3b3Vs
ZCBiZSBzaWxlbnRseSBpZ25vcmVkIGJ5IHRoZSBjb250cm9sbGVyLCB3aGljaApjb3VsZCBsZWFk
IHRvIGVudW1lcmF0aW9uIGZhaWx1cmUgb24gdGhlIGhvc3QuCgpTaG91bGQgdGhpcyByZWdpc3Rl
ciBhY2Nlc3MgYmUgcHJvdGVjdGVkIGJ5IGEgbG9jaywgb3Igc2hvdWxkIHRoZQplbmFibGUvZGlz
YWJsZSBmdW5jdGlvbnMgc2F2ZSBhbmQgcmVzdG9yZSB0aGUgcHJldmlvdXMgcmVnaXN0ZXIgc3Rh
dGU/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzIwMTUwNjE5LjI0NzMzLTEtMTgyNTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
