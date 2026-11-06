Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF87606A329
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+xCT5VE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHNjp+vt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rXLJlxeIn+6kgDhw85rRzcVZyp+Mq+Xt206142gYxTE=; b=u+xCT5VEt7HTWibTQHYe1XtSEV
	ei+LywF1rCZcuI8qra9E08p+TRMXVtQNqioVz5UPW1K5M5cVoa4Jgk8XWm017YwZwCpYlgTiF47yH
	ZW8m1KvdseaOi1mxzV1YO6dOkdLPsUQMtin3FknNJTfPfEGAc1O8UA7mjbPPDZd+jimdqqPpc/UvZ
	6FIJsAlWSZd9SwIklEVx031uBJNgqrddRo+Tv2Nkr6sJhHKZL7VJA2+pOtftd7NBIJIUhU5qV87ww
	08pnbtnYY83g+eHZlA3zo2wpNmSioFwZkXMqZZQTOMIh5hGF04ljGAZXlCiU/lWEOn3d3k+8EYUw2
	ILaugBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFPw-0000000BbR3-0G9y;
	Fri, 06 Nov 2026 08:35:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFPu-0000000BbQh-1bDi
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:35:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0A3860224;
	Fri,  6 Nov 2026 08:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB0B1F008A3;
	Fri,  6 Nov 2026 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954121;
	bh=f3PG1p+JcFz4gGeGrXXjHJetKWIiSij3xc+yaIrEX1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHNjp+vtPW+YXFY8uhIbZ4nb8t2tISru5MOO0SiWR30+lKr8gYkQQHi8TZbJablBi
	 kWZNcUFEcPUjRBH2BpmWB8O3eXekvqlUxO7bTOy7nVVAxMnwPCHtLvTORNX3SjCAVZ
	 u523B1NKo/fPdCqw95ZSAOnn/VVLuD2Lg+9PJpnH0HQjmpTF0BMv/tcK8lG4CahW2g
	 OhPv/othBFWV47/tPYJD4F4wOEGGQP9kGLYtvWECI3WA6085JFkFoBAdtVBd28AWlL
	 9fMNHC0YmrHXPXIB6UlVfSqwnpH5waVhcBUfaJipAPaectPQlxN6j3r7EQZNtKbzUF
	 vtdnz/+VS2wog==
Message-ID: <sashiko-outbox-201071@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Fri, 06 Nov 2026 08:35:20 +0000
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
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gY2xrOiBtZXNvbjog
MzItYml0IGludGVnZXIgb3ZlcmZsb3cgaW4KICBtZXNvbl9jbGtfZ2V0X3BsbF9yYW5nZV9pbmRl
eCgpIFsxXQotLQoKY29tbWl0IDI0MTAzNWVjZmRiMjA2YWNkY2YyOTBhNWUyODgxMDRhMDU2YTNm
OGIKQXV0aG9yOiBDYXJsbyBDYWlvbmUgPGNjYWlvbmVAYmF5bGlicmUuY29tPgoKY2xrOiBtZXNv
bjogcGxsOiBTdXBwb3J0IFBMTHMgd2l0aG91dCBhIHByZS1kaXZpZGVyCgpUaGlzIGNvbW1pdCBt
YWtlcyB0aGUgUExMIHByZS1kaXZpZGVyIHBhcmFtZXRlciBvcHRpb25hbCBpbiB0aGUgY29tbW9u
IE1lc29uClBMTCBkcml2ZXIsIGRlZmF1bHRpbmcgdGhlIGRpdmlkZXIgdG8gMSB3aGVuIHRoZSBw
YXJhbWV0ZXIgaXMgbm90IGFwcGxpY2FibGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMKPiBpbmRleCAxZWE2
NTc5YTc2MGYzLi40NGIzMzA1MTQwNWY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29u
L2Nsay1wbGwuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwoKWyAuLi4gXQoK
PiBAQCAtMTc0LDcgKzE3Niw3IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xrX2dldF9wbGxfcmFuZ2Vf
aW5kZXgodW5zaWduZWQgbG9uZyByYXRlLAo+ICAJKm4gPSBpbmRleCArIDE7Cj4gIAo+ICAJLyog
Q2hlY2sgdGhlIHByZWRpdmlkZXIgcmFuZ2UgKi8KPiAtCWlmICgqbiA+PSAoMSA8PCBwbGwtPm4u
d2lkdGgpKQo+ICsJaWYgKCpuID49IChNRVNPTl9QQVJNX0FQUExJQ0FCTEUoJnBsbC0+bikgPyAx
IDw8IHBsbC0+bi53aWR0aCA6IDIpKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAKPiAgCWlmICgq
biA9PSAxKSB7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNl
ZCBieSB0aGlzIHBhdGNoLCBidXQgY2FuIGBwbGwtPnJhbmdlLT5tYXggKgpwYXJlbnRfcmF0ZWAg
aW4gbWVzb25fY2xrX2dldF9wbGxfcmFuZ2VfaW5kZXgoKSBhbmQgYHBhcmVudF9yYXRlICogbWAg
aW4KX19wbGxfcGFyYW1zX3dpdGhfZnJhYygpIG92ZXJmbG93IDMyLWJpdCB1bnNpZ25lZCBsb25n
IGFyaXRobWV0aWMgWzFdPwoKZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jOm1lc29uX2Nsa19n
ZXRfcGxsX3JhbmdlX2luZGV4KCkgewoJLi4uCglpZiAoKm4gPT0gMSkgewoJCS8qIEdldCB0aGUg
Ym91bmRhcmllcyBvdXQgdGhlIHdheSAqLwoJCWlmIChyYXRlIDw9IHBsbC0+cmFuZ2UtPm1pbiAq
IHBhcmVudF9yYXRlKSB7CgkJCSptID0gcGxsLT5yYW5nZS0+bWluOwoJCQlyZXR1cm4gLUVOT0RB
VEE7CgkJfSBlbHNlIGlmIChyYXRlID49IHBsbC0+cmFuZ2UtPm1heCAqIHBhcmVudF9yYXRlKSB7
CgkJCSptID0gcGxsLT5yYW5nZS0+bWF4OwoJCQlyZXR1cm4gLUVOT0RBVEE7CgkJfQoJfQoJLi4u
Cn0KCmRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYzpfX3BsbF9wYXJhbXNfd2l0aF9mcmFjKCkg
ewoJLi4uCgkvKiBCYWlsIG91dCBpZiB3ZSBhcmUgYWxyZWFkeSBvdmVyIHRoZSByZXF1ZXN0ZWQg
cmF0ZSAqLwoJaWYgKHJhdGUgPCBwYXJlbnRfcmF0ZSAqIG0gLyBuKQoJCXJldHVybiAwOwoJLi4u
Cn0KCk9uIDMyLWJpdCBhcmNoaXRlY3R1cmVzLCBtdWx0aXBseWluZyBhIDI0IE1IeiBgcGFyZW50
X3JhdGVgIGJ5IGEgdHlwaWNhbAptdWx0aXBsaWVyIChzdWNoIGFzIGBwbGwtPnJhbmdlLT5tYXhg
IG9mIDI1MCkgcmVhY2hlcyA2LDAwMCwwMDAsMDAwIGFuZCB3cmFwcwphcm91bmQgMzItYml0IGBV
TE9OR19NQVhgLiAgVGhpcyBjYXVzZXMgdGhlIHJhbmdlIGNoZWNrIGluCm1lc29uX2Nsa19nZXRf
cGxsX3JhbmdlX2luZGV4KCkgdG8gbWlzY2FsY3VsYXRlIGBtYCBhbmQgdGhlIGd1YXJkIGluCl9f
cGxsX3BhcmFtc193aXRoX2ZyYWMoKSB0byBiZSBieXBhc3NlZCwgdW5kZXJmbG93aW5nIGB2YWwg
LT0gbSAqIGZyYWNfbWF4YAphbmQgd3JpdGluZyBjb3JydXB0ZWQgbXVsdGlwbGllciBhbmQgZnJh
Y3Rpb25hbCB2YWx1ZXMgdG8gdGhlIFBMTCBoYXJkd2FyZS4KClsxXSBodHRwczovL3Nhc2hpa28u
ZGV2LyMvYnVnL2xpbnV4LThhNWVjNDMyLWVmYmQtNGQzZi04M2M3LTJhNTBmYzI4NTBjNwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTEwNi11cHN0cmVhbS1zNy1jbGstdjEtMC03ZDUwMWQ2MjYyMWZAYmF5bGlicmUuY29tP3BhcnQ9
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
