Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6337C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fq8fom0k6EZ677n/adstSLXSCwaz3Cx8MgTxyOCAWvI=; b=3aq0pgtAxs2T+u
	gIT1OfpuarWaPlDMQs0nYPPeiRQ3P7uREYHctcmzgzbB+tgNXErr13aqj4tb6AMrosnp+Bh7b4pkH
	YXy2T9rpn8QQuAP4eW8w8NENSgMK1AmfBH1pTeZwpUo/zVotrxaQb6Z3NUqsWXlE6PKMuHXnkAqnH
	NCQ6Nu859Z66AelIguRvQGIrb+EXQqH+ns8Zzbuq2wcstHIIeuLvrNbZWRDVyC8TDTwMZB7IXD0rW
	0j/GKahGdu5qtwKeO68vfWL+f31HGYDKEJQqxNwEp8FOUl1gCeXgSmsEqgWpn9nXwPnY3i/459WxN
	wujSF0a6Vpn5+JYBFn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGEm-00000009Gfn-3Dzx;
	Mon, 13 Jul 2026 12:58:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGEl-00000009GfO-15XN
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09FF34350A;
	Mon, 13 Jul 2026 12:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15F41F00A3A;
	Mon, 13 Jul 2026 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783947498;
	bh=oQXIeuFDt2x1IooAp/jXPp3spYtiZ2O4nwmXV034HN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZaz1DOucckr8P9Tr2rkhkTyX2pidajW//N2joj1+wy0XTjyHO/3ukN0fKp2U+wO1
	 KehvuUisTl0zDN1pZYfWLjh7wWhpt04E0Ipo/UfJw6sdJaLPzoYLAXRb19mYdj2+VV
	 yhGnZiIqNfqZ5cpjfGqPQgvyasNAvA7uuqMZ92cyBq57QBWy2x8tXMMB1GH4w/XXVh
	 pN3VH/fRnNSBtzMpmvAJUq4Hh+tuiE+/w/RIF9ukbOSbsLBRQqjd5d8deRjrhufMWK
	 1hJ+KeU5vTubTPK0PG0iJUys+43n4mNjLHvpFlBrE7gKwHrVI8VCHyp+P+v5szn92E
	 xvR3c3Vst1PQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/19] media: meson: canvas: Fix Use-After-Free by
 linking canvas provider device
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260713120840.17427-18-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <20260713120840.17427-18-linux.amoon@gmail.com>
Date: Mon, 13 Jul 2026 12:58:18 +0000
Message-Id: <20260713125818.A15F41F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBB
IFRpbWUtb2YtQ2hlY2sgdG8gVGltZS1vZi1Vc2UgKFRPQ1RPVSkgcmFjZSBjb25kaXRpb24gZXhp
c3RzIGJldHdlZW4gcmV0cmlldmluZyB0aGUgc3VwcGxpZXIncyBkcml2ZXIgZGF0YSBhbmQgZXN0
YWJsaXNoaW5nIHRoZSBkZXZpY2UgbGluaywgd2hpY2ggYWxsb3dzIHRoZSBzdXBwbGllciB0byB1
bmJpbmQgYW5kIGZyZWUgdGhlIGRhdGEgYmVmb3JlIHRoZSBsaW5rIGNhbiBwcm90ZWN0IGl0LgoK
UHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbSGlnaF0gVGhlIGRldmljZSBsaW5rIGZhaWxzIHRvIHBy
ZXZlbnQgdGhlIFVzZS1BZnRlci1GcmVlIGluIHRoZSBgdmRlY2AgZHJpdmVyIGJlY2F1c2UgVjRM
MiBmaWxlIGRlc2NyaXB0b3JzIG91dGxpdmUgdGhlIGNvbnN1bWVyJ3MgZHJpdmVyIHVuYmluZCBz
ZXF1ZW5jZS4KLS0KCi0tLSBQYXRjaCBbMTddOiBbUEFUQ0ggdjcgMTcvMTldIG1lZGlhOiBtZXNv
bjogY2FudmFzOiBGaXggVXNlLUFmdGVyLUZyZWUgYnkgbGlua2luZyBjYW52YXMgcHJvdmlkZXIg
ZGV2aWNlIC0tLQpjb21taXQgYmY2YTIyZDM2OGIzMDQxMzkyMTA1MmU0Y2I2NTljNWEyNzllZmFl
YQpBdXRob3I6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KCm1lZGlhOiBtZXNv
bjogY2FudmFzOiBGaXggVXNlLUFmdGVyLUZyZWUgYnkgbGlua2luZyBjYW52YXMgcHJvdmlkZXIg
ZGV2aWNlCgpUaGlzIGNvbW1pdCBhdHRlbXB0cyB0byBmaXggYSBVc2UtQWZ0ZXItRnJlZSBieSBl
c3RhYmxpc2hpbmcgYSBkZXZpY2UgbGluawpiZXR3ZWVuIHRoZSB2ZGVjIGNvbnN1bWVyIGFuZCB0
aGUgY2FudmFzIHByb3ZpZGVyLiBUaGUgbGluayBhaW1zIHRvCmF1dG9tYXRpY2FsbHkgdW5iaW5k
IHRoZSBjb25zdW1lciBkcml2ZXIgd2hlbiB0aGUgcHJvdmlkZXIgdW5iaW5kcy4KCkNsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTMwMTExMDIyLjlDNkQ3MUYwMDg5M0Bz
bXRwLmtlcm5lbC5vcmcKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24t
Y2FudmFzLmMgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNhbnZhcy5jCj4gaW5kZXggNzk2
ODFhZmVhOGM2MS4uNTEwMmE0OTFiZjc3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9hbWxv
Z2ljL21lc29uLWNhbnZhcy5jCj4gKysrIGIvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jYW52
YXMuYwoKWyAuLi4gXQoKPiBAQCAtNzAsOSArNzEsMTggQEAgc3RydWN0IG1lc29uX2NhbnZhcyAq
bWVzb25fY2FudmFzX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAkgKiBjdXJyZW50IHN0YXRl
LCB0aGlzIGRyaXZlciBwcm9iZSBjYW5ub3QgcmV0dXJuIC1FUFJPQkVfREVGRVIKPiAgCSAqLwo+
ICAJY2FudmFzID0gZGV2X2dldF9kcnZkYXRhKCZjYW52YXNfcGRldi0+ZGV2KTsKCltTZXZlcml0
eTogSGlnaF0KSXMgdGhlcmUgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHJldHJpZXZpbmcgdGhl
IGRyaXZlciBkYXRhIGFuZCBjcmVhdGluZwp0aGUgZGV2aWNlIGxpbms/CgpJZiB0aGUgY2FudmFz
IHByb3ZpZGVyIHVuYmluZHMgaW1tZWRpYXRlbHkgYWZ0ZXIgZGV2X2dldF9kcnZkYXRhKCkgYnV0
CmJlZm9yZSBkZXZpY2VfbGlua19hZGQoKSwgZGV2cmVzX3JlbGVhc2VfYWxsKCkgd2lsbCBmcmVl
IHRoZSBjYW52YXMgZGF0YS4KCkJlY2F1c2UgdGhlIGRyaXZlciBjb3JlIGFsbG93cyBsaW5rcyB0
byB1bmJvdW5kIHN1cHBsaWVycywgZGV2aWNlX2xpbmtfYWRkKCkKd291bGQgc3RpbGwgc3VjY2Vl
ZCBhbmQgY3JlYXRlIGEgZG9ybWFudCBsaW5rLCBhbmQgdGhlbiBtZXNvbl9jYW52YXNfZ2V0KCkK
d291bGQgcmV0dXJuIGEgZnJlZWQgcG9pbnRlciB0byB0aGUgY2FsbGVyLgoKPiAtCXB1dF9kZXZp
Y2UoJmNhbnZhc19wZGV2LT5kZXYpOwo+IC0JaWYgKCFjYW52YXMpCj4gKwlpZiAoIWNhbnZhcykg
ewo+ICsJCXB1dF9kZXZpY2UoJmNhbnZhc19wZGV2LT5kZXYpOwo+ICAJCXJldHVybiBFUlJfUFRS
KC1FSU5WQUwpOwo+ICsJfQo+ICsKPiArCS8qIEVzdGFibGlzaCBkZXZpY2UgbGluayB0byBwcmV2
ZW50IFVzZS1BZnRlci1GcmVlICovCj4gKwlsaW5rID0gZGV2aWNlX2xpbmtfYWRkKGRldiwgJmNh
bnZhc19wZGV2LT5kZXYsCj4gKwkJCSAgICAgICBETF9GTEFHX0FVVE9SRU1PVkVfQ09OU1VNRVIp
OwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9l
cyB0aGlzIGRldmljZSBsaW5rIGZ1bGx5IHJlc29sdmUgdGhlCnVzZS1hZnRlci1mcmVlIGZvciB0
aGUgdmRlYyBkcml2ZXI/CgpCZWNhdXNlIHZkZWMgaXMgYSBWNEwyIGRyaXZlciwgdXNlcnNwYWNl
IGZpbGUgZGVzY3JpcHRvcnMgY2FuIG91dGxpdmUgdGhlCmNvbnN1bWVyIGRyaXZlcidzIHVuYmlu
ZCBzZXF1ZW5jZS4gSWYgYSB1c2VyIGhvbGRzIHRoZSB2aWRlbyBkZXZpY2Ugb3BlbjoKCjEuIFRo
ZSBjYW52YXMgcHJvdmlkZXIgdW5iaW5kcy4KMi4gVGhlIGRldmljZSBsaW5rIGZvcmNlcyB0aGUg
dmRlYyBkcml2ZXIgdG8gdW5iaW5kLgozLiBkZXZyZXNfcmVsZWFzZV9hbGwoKSBmcmVlcyB0aGUg
ZGV2bS1tYW5hZ2VkIGNhbnZhcyBhbmQgdmRlYyBjb3JlIGNvbnRleHRzLgo0LiBVc2Vyc3BhY2Ug
bGF0ZXIgY2xvc2VzIHRoZSBmaWxlIGRlc2NyaXB0b3IuCgpXaGVuIHRoZSBmaWxlIGRlc2NyaXB0
b3IgaXMgY2xvc2VkLCB2ZGVjX2Nsb3NlKCkgY2FsbHMgdmRlY19mcmVlX2NhbnZhcygpLAp3aGlj
aCBhdHRlbXB0cyB0byBkZXJlZmVyZW5jZSB0aGUgYWxyZWFkeSBmcmVlZCBzZXNzLT5jb3JlLT5j
YW52YXMgcG9pbnRlci4KCj4gKwlwdXRfZGV2aWNlKCZjYW52YXNfcGRldi0+ZGV2KTsKPiArCWlm
ICghbGluaykKPiArCQlyZXR1cm4gRVJSX1BUUihkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwK
PiArCQkJCSAgICAgIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGxpbmsgY2FudmFzXG4iKSk7Cj4g
IAo+ICAJcmV0dXJuIGNhbnZhczsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMzEyMDg0MC4xNzQyNy0xLWxpbnV4LmFt
b29uQGdtYWlsLmNvbT9wYXJ0PTE3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
