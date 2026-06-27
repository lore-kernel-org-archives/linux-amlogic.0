Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CBC43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0czcVT4iZn3fvLM3r8NbWhEj8BU/Ykob1hO39/yktcI=; b=um6Xfv2BOs882R
	Cg+deEjqzHOecq9/T7Na8AC3WdX0jkAp6vjdeKh0OCnVI1hTbft57V3HO4ze5GFDU//aHwrkQ8PBY
	+kcWc+PQ/SskgvQQJZfYGGS0HbaR3Xd8gSoulQ5VbjNlX7BdvmkBGBsNGKebZ4CAiBLFabkDsLn6x
	63V2aUwXRGwaqjeFhJVN9InxaalTrymoeoPHFytXxYLD+wL+9S+VjGfCx+cEgMoLeE8JoweR7dat0
	F+izJnl9IVvy6VMV1YcLnuIu7Ddevs+QcfjW0E0abvU6kz6Npm1+LE96YUm8aGrBGF5SVSFcGIE6B
	v1+HCc8jU7lDKk0CDqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdN5M-0000000CFDR-3cjS;
	Sat, 27 Jun 2026 07:04:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdN5L-0000000CFDL-2G6A
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 07:04:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49537600AB;
	Sat, 27 Jun 2026 07:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97511F000E9;
	Sat, 27 Jun 2026 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782543853;
	bh=XdHtGEUpkghQgJwSZlXLtsedvayJgmyZEJibNjcFCZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjNKJ9g9y8qKIUYrpWH6x5GfXi5Q2ICpIA4cStS2mHnciP6qUMMW/GegNGirWtzUg
	 m2WNr2eq4K1mCHNvwXLyYR1bKjNoGQQ/LXh7Q0keOIewnSyvTqV7vduzZKXgaw+Lhq
	 qc1+nYp3hwOiQtpdq2kSxSNRs0VugHHZlZHPNZ0DIIt3Tq/LXALVDVyviXSXHna036
	 GIMcpme/0to6cTzqODntS71NH7k5iAPRuZTTz1+CEeyCWQ2OOw4WHT+WMveIXW0IaR
	 85DSv7BaDOQxZzGFFJTQTgg3P8f0YW3+NV8JWKr3yYmP2ydzgW8BC/e8YXQOcdqh/x
	 40PW0+kNO25yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: meson: vdec: guard against NULL prev_frame
 in codec_vp9_set_mpred_mv()
To: "Doruk Tan Ozturk" <doruk@0sec.ai>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260627065534.88527-3-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
 <20260627065534.88527-3-doruk@0sec.ai>
Date: Sat, 27 Jun 2026 07:04:12 +0000
Message-Id: <20260627070412.B97511F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBUaGUgcGF0Y2gg
aW50cm9kdWNlcyBhIGNyaXRpY2FsIHZ1bG5lcmFiaWxpdHkgYnkgdXNpbmcgYW4gZWFybHkgcmV0
dXJuIHRvIGZpeCBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4gV2hlbiBgdnA5LT5wcmV2X2Zy
YW1lYCBpcyBOVUxMLCBgY29kZWNfdnA5X3NldF9tcHJlZF9tdigpYCByZXR1cm5zIGVhcmx5IGFu
ZCBza2lwcyBwcm9ncmFtbWluZyB0aGUgaGFyZHdhcmUncyBtb3Rpb24gdmVjdG9yIHdyaXRlIHJl
Z2lzdGVycyAoYEhFVkNfTVBSRURfTVZfV1JfU1RBUlRfQUREUmAgYW5kIGBIRVZDX01QUkVEX01W
X1dQVFJgKSBmb3IgdGhlIGN1cnJlbnQgZnJhbWUuIFdoZW4gdGhlIGRlY29kZXIgaXMgc3Vic2Vx
dWVudGx5IHN0YXJ0ZWQsIGl0IHBlcmZvcm1zIGEgd2lsZCBETUEgd3JpdGUgdG8gd2hhdGV2ZXIg
dW5pbml0aWFsaXplZCBvciBzdGFsZSBwaHlzaWNhbCBhZGRyZXNzIGlzIGxpbmdlcmluZyBpbiB0
aGUgaGFyZHdhcmUgcmVnaXN0ZXIsIGNhdXNpbmcgYXJiaXRyYXJ5IHBoeXNpY2FsIG1lbW9yeSBj
b3JydXB0aW9uLgotLQoKY29tbWl0IGJmMTE3NzBhOGY5YzcxMjgyZjMyNGRmOWQ1YWMzMGNjZGNi
ODY5OTYKQXV0aG9yOiBEb3J1ayBUYW4gT3p0dXJrIDxkb3J1a0Awc2VjLmFpPgptZWRpYTogbWVz
b246IHZkZWM6IGd1YXJkIGFnYWluc3QgTlVMTCBwcmV2X2ZyYW1lIGluIGNvZGVjX3ZwOV9zZXRf
bXByZWRfbXYoKQoKVGhpcyBjb21taXQgYWRkcmVzc2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlIGluIGNvZGVjX3ZwOV9zZXRfbXByZWRfbXYoKQpieSBhZGRpbmcgYW4gZWFybHkgcmV0dXJu
IHdoZW4gdnA5LT5wcmV2X2ZyYW1lIGlzIE5VTEwuIFRoZSBjcmFzaCB3b3VsZApwcmV2aW91c2x5
IHRyaWdnZXIgd2hlbiBkZWNvZGluZyBtYWxmb3JtZWQgYml0c3RyZWFtcyB0aGF0IHN0YXJ0IG9u
IGEgbm9uLWtleQpmcmFtZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9t
ZXNvbi92ZGVjL2NvZGVjX3ZwOS5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMv
Y29kZWNfdnA5LmMKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy9jb2Rl
Y192cDkuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL2NvZGVjX3Zw
OS5jClsgLi4uIF0KPiBAQCAtOTkzLDE5ICs5OTMsMzIgQEAgc3RhdGljIHZvaWQgY29kZWNfdnA5
X3NldF9tcHJlZF9tdihzdHJ1Y3QgYW12ZGVjX2NvcmUgKmNvcmUsClsgLi4uIF0KPiArCS8qCj4g
KwkgKiBwcmV2X2ZyYW1lIGlzIE5VTEwgd2hlbiBhbiBpbnRlciBmcmFtZSBpcyB0aGUgZmlyc3Qg
ZnJhbWUgZGVjb2RlZAo+ICsJICogKGUuZy4gYSBzdHJlYW0gc3RhcnRpbmcgb24gYSBub24ta2V5
IGZyYW1lLCBvciB0aGUgZmlyc3QgZnJhbWUKPiArCSAqIGFmdGVyIGEgZmx1c2gpLiBUaGVyZSBh
cmUgbm8gcHJldmlvdXMtZnJhbWUgbW90aW9uIHZlY3RvcnMgdG8gdXNlCj4gKwkgKiBhbmQgZXZl
cnkgcmVhZCBiZWxvdyB3b3VsZCBkZXJlZmVyZW5jZSBhIE5VTEwgcG9pbnRlciwgc28gbGVhdmUK
PiArCSAqIHByZXYtTVYgdXNlIGRpc2FibGVkIChCSVQoNikgYWxyZWFkeSBjbGVhcmVkKSBhbmQg
YmFpbCBvdXQuCj4gKwkgKi8KPiArCWlmICghdnA5LT5wcmV2X2ZyYW1lKQo+ICsJCXJldHVybjsK
CltTZXZlcml0eTogQ3JpdGljYWxdCkRvZXMgdGhpcyBlYXJseSByZXR1cm4gYnlwYXNzIHRoZSBp
bml0aWFsaXphdGlvbiBvZiB0aGUgaGFyZHdhcmUncyBtb3Rpb24KdmVjdG9yIHdyaXRlIHJlZ2lz
dGVycyBmb3IgdGhlIGN1cnJlbnQgZnJhbWU/CgpMb29raW5nIGF0IHRoZSByZXN0IG9mIGNvZGVj
X3ZwOV9zZXRfbXByZWRfbXYoKSwgdGhlIGZvbGxvd2luZyByZWdpc3RlcnMgYXJlCnNldCBhZnRl
ciB0aGlzIGVhcmx5IHJldHVybiBibG9jazoKCglhbXZkZWNfd3JpdGVfZG9zKGNvcmUsIEhFVkNf
TVBSRURfTVZfV1JfU1RBUlRfQUREUiwKCQkJIGNvZGVjX3ZwOV9nZXRfZnJhbWVfbXZfcGFkZHIo
dnA5LCB2cDktPmN1cl9mcmFtZSkpOwoJYW12ZGVjX3dyaXRlX2Rvcyhjb3JlLCBIRVZDX01QUkVE
X01WX1dQVFIsCgkJCSBjb2RlY192cDlfZ2V0X2ZyYW1lX212X3BhZGRyKHZwOSwgdnA5LT5jdXJf
ZnJhbWUpKTsKCklmIHRoZXNlIHdyaXRlcyBhcmUgc2tpcHBlZCB3aGVuIHZwOS0+cHJldl9mcmFt
ZSBpcyBOVUxMLCBjb3VsZCB0aGUgZGVjb2RlcgpwZXJmb3JtIHVuY29uc3RyYWluZWQgRE1BIHdy
aXRlcyB0byB3aGF0ZXZlciB1bmluaXRpYWxpemVkIG9yIHN0YWxlIHBoeXNpY2FsCmFkZHJlc3Nl
cyBhcmUgbGluZ2VyaW5nIGluIHRoZSBoYXJkd2FyZSByZWdpc3RlciB3aGVuIGRlY29kaW5nIGJl
Z2lucz8KClNpbmNlIHRoaXMgc3RhdGUgY2FuIGJlIHJlYWNoZWQgdmlhIG1hbGZvcm1lZCBzdHJl
YW1zIGZyb20gdW5wcml2aWxlZ2VkIHVzZXJzCmFzIG5vdGVkIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSwgY2FuIHRoaXMgbGVhZCB0byBhcmJpdHJhcnkgcGh5c2ljYWwgbWVtb3J5CmNvcnJ1cHRpb24/
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNjI3MDY1NTM0Ljg4NTI3LTEtZG9ydWtAMHNlYy5haT9wYXJ0PTIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
