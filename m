Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220C3C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNmHyF0FYlqXMbGlY6A2UznPhtqXVgicKb2On9Of2g4=; b=xZLmq4KibMemY8
	ui1H36bDs87yZKSHkqAMvl8ugiRztwWTbuVylVApnq3Jl+uQlQcG6uhqsRxnH9FJMv/3eu2IpDOgM
	fWDq6PC1boh1XOIv6g12c49tRMdpzezg8Lgxwod9mRq6iY42DRLeZCtiErnK8Jp8S28ob0YTmlptl
	lLO7/97OWUniH8I9y2RTGNQ2loj9dzG/97KVc0NRnoVLT9LT28HNBl+XHOBVDdSGlwTMQcQTp8hgI
	zuJuWvAtvN7sCbPRVWArTIG2zwzB/nAaZdkNUS/+mfZhpHAH7TggWQuDZWaoVe9k9L/ZRkFB+IQgc
	lv/x4bqpwW4q93OJwG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFNA-00000004I1L-40os;
	Thu, 02 Jul 2026 11:14:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFN9-00000004I1D-1mHY
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 11:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D2E40C2B;
	Thu,  2 Jul 2026 11:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BA01F000E9;
	Thu,  2 Jul 2026 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782990862;
	bh=qR7GbBYuKh69tH9PieCj060gRLv+Ec2jjiViUGvltoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTrFIDYB9EJAs5Rrc+sP2XrZHKi9gScRflCb4i+O7PeHzFZxZJdQFuGh3CvcszxDm
	 1pt3B7bmTnSL87z19Fft+7+CuFZblGMnMMeNTNunSlEOWEtyWxZnSY2SPqUvfCPO4o
	 E5z7v/TKY8qofGMSX8Mj7T11VJfnRA05U7NqlRc2z4Vip8tdN2ZZ2X7ZQySzu0VYfS
	 geyqi9zx9NzqzcJfIP9GxFKNqvXF/9pMgtefckZu8aXLx1qnRQWCv15jVqmFbPIc0R
	 MBImKKmSLBrMqHslsGjSk+iRGkiLcmh5WStFq2CuCkgMhaH0jBL1DPrw+VgMYJx2Yx
	 YIkcvoQrU1nHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset
 from prepare
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
Date: Thu, 02 Jul 2026 11:14:20 +0000
Message-Id: <20260702111422.42BA01F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIHRoZSBw
aXBlbGluZSByZXNldCBmcm9tIGBhaXVfZm9ybWF0dGVyX2kyc19wcmVwYXJlKClgIGJyZWFrcyBk
eW5hbWljIERBUE0gcm91dGluZyAoRFBDTSksIHBvdGVudGlhbGx5IGxlYXZpbmcgdGhlIEkyUyBm
b3JtYXR0ZXIgd2l0aCBhbiB1bi11cGRhdGVkIG9yIGNvcnJ1cHRlZCBzdGF0ZSB3aGVuIGF0dGFj
aGVkIHRvIGFuIGFscmVhZHktcnVubmluZyBzdHJlYW0uCi0tCgpjb21taXQgN2RiYTIxNjkzODU5
MDNhNTA2NDY1MjAwZTAwNTEyODc2NTc0MWNmZQpBdXRob3I6IFZhbGVyaW8gU2V0dGkgPHZzZXR0
aUBiYXlsaWJyZS5jb20+CgpBU29DOiBtZXNvbjogYWl1LWZvcm1hdHRlcjogcmVtb3ZlIHBpcGVs
aW5lIHJlc2V0IGZyb20gcHJlcGFyZQoKVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgcGlwZWxpbmUg
cmVzZXQgZnJvbSBhaXVfZm9ybWF0dGVyX2kyc19wcmVwYXJlKCkuIFRoZQpjb21taXQgbWVzc2Fn
ZSBjbGFpbXMgdGhpcyBpcyByZWR1bmRhbnQgYmVjYXVzZSBpdCBpcyBhbHJlYWR5IGhhbmRsZWQg
YnkKYWl1X2ZpZm9faTJzX3RyaWdnZXIoKSBkdXJpbmcgdHJpZ2dlciB0aW1lLgoKPiBkaWZmIC0t
Z2l0IGEvc291bmQvc29jL21lc29uL2FpdS1mb3JtYXR0ZXItaTJzLmMgYi9zb3VuZC9zb2MvbWVz
b24vYWl1LWZvcm1hdHRlci1pMnMuYwo+IGluZGV4IGI0NjA0NzM0ZmU4OGQuLmNiNTU0YzJlN2Nl
NGEgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL21lc29uL2FpdS1mb3JtYXR0ZXItaTJzLmMKPiAr
KysgYi9zb3VuZC9zb2MvbWVzb24vYWl1LWZvcm1hdHRlci1pMnMuYwpbIC4uLiBdCj4gQEAgLTU1
LDExICs1NCwxMSBAQCBzdGF0aWMgaW50IGFpdV9mb3JtYXR0ZXJfaTJzX3ByZXBhcmUoc3RydWN0
IHJlZ21hcCAqbWFwLAo+ICB7Cj4gIAkvKiBBbHdheXMgb3BlcmF0ZSBpbiBzcGxpdCAoY2xhc3Np
YyBpbnRlcmxlYXZlZCkgbW9kZSAqLwo+ICAJdW5zaWduZWQgaW50IGRlc2MgPSAwOwo+IC0JdW5z
aWduZWQgaW50IHRtcDsKPiAgCj4gLQkvKiBSZXNldCByZXF1aXJlZCB0byB1cGRhdGUgdGhlIHBp
cGVsaW5lICovCj4gLQlyZWdtYXBfd3JpdGUobWFwLCBBSVVfUlNUX1NPRlQsIEFJVV9SU1RfU09G
VF9JMlNfRkFTVCk7Cj4gLQlyZWdtYXBfcmVhZChtYXAsIEFJVV9JMlNfU1lOQywgJnRtcCk7Cj4g
KwkvKgo+ICsJICogUGlwZWxpbmUgcmVzZXQgaXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBhaXVf
Zmlmb19pMnNfdHJpZ2dlcigpIGF0Cj4gKwkgKiB0cmlnZ2VyIHRpbWUuCj4gKwkgKi8KCltTZXZl
cml0eTogSGlnaF0KRG9lcyByZW1vdmluZyB0aGlzIHJlc2V0IGJyZWFrIGR5bmFtaWMgREFQTSBy
b3V0aW5nIChEUENNKT8KCldoZW4gYSBiYWNrZW5kIGlzIGR5bmFtaWNhbGx5IGNvbm5lY3RlZCB0
byBhbiBhbHJlYWR5LXJ1bm5pbmcgZnJvbnRlbmQgdmlhCkRQQ00sIHRoZSBmcm9udGVuZCdzIHRy
aWdnZXIoKSBjYWxsYmFjayBpcyBub3QgaW52b2tlZCBhZ2Fpbi4gCgpGb3IgZXhhbXBsZSwgaWYg
dGhlIEkyUyBGSUZPIGZyb250ZW5kIGlzIHN0YXJ0ZWQgKGUuZy4sIHJvdXRlZCB0byB0aGUgU1BE
SUYKYmFja2VuZCkgYW5kIHRoZW4gdGhlIEkyUyBiYWNrZW5kIGlzIGR5bmFtaWNhbGx5IGNvbm5l
Y3RlZCB3aGlsZSB0aGUgc3RyZWFtIGlzCnJ1bm5pbmcsIHRoZSAiSTJTIEZvcm1hdHRlciIgREFQ
TSB3aWRnZXQgcG93ZXJzIHVwIGFuZCBjYWxscwphaXVfZm9ybWF0dGVyX2kyc19wcmVwYXJlKCku
CgpXaXRob3V0IHRoZSByZXNldCBwdWxzZSBoZXJlLCB3aWxsIHRoZSBoYXJkd2FyZSBmYWlsIHRv
IGxhdGNoIG5ldwpjb25maWd1cmF0aW9ucyAobGlrZSBBSVVfSTJTX1NPVVJDRV9ERVNDKSwgcG90
ZW50aWFsbHkgcmVzdWx0aW5nIGluIGNvcnJ1cHRlZApvciBubyBhdWRpbyBvdXRwdXQgZnJvbSB0
aGUgSTJTIGJhY2tlbmQ/Cgo+ICAKPiAgCXN3aXRjaCAodHMtPnBoeXNpY2FsX3dpZHRoKSB7Cj4g
IAljYXNlIDE2OiAvKiBOb3RoaW5nIHRvIGRvICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAyLWZpeC0yNC1iaXQtaTJzLXBs
YXliYWNrLXYxLTAtYmNkM2E0M2ZlMzJhQGJheWxpYnJlLmNvbT9wYXJ0PTIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
