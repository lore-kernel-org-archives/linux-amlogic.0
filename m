Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FB606A332
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TYivVRfk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiFJu/8S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eqc/xRX2CKEgZjvx0zrzv98rZcT0gxwO3HP3dQ0cG9A=; b=TYivVRfkH3twJir7yz1cND9w8x
	zHJGTPdbQWuu6r44HIeAf1L1q4k4QcNPrkEKPOd0Do19IsGIKGm+lLHUn/F4xad7TNaOWrwzhoUPF
	k2LhU+S0bOn5YTvOxU0qS7AHqavQX1mUSy0g1YCe4ERRa4iveKCtrMEjdmGx9gHNHwevsLwfdbGFF
	I3QWO2/uaybclHNfptMu8sRo/36XOCijgCMLXbWUuLg1XTtW6vIO1DcDWQ06rnvuHDorddLjTC8vH
	qRJvelsUySsyZWj5tCKAu8Lrw32OoqyDBy3dDQBJFdxcpkBorPXMsX2Y6e+AeTUauzVFOIorCep8M
	JBky62aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHDR-0000000BwK2-1C7F;
	Fri, 06 Nov 2026 10:30:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHDQ-0000000BwJo-1pap
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:30:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAB1643762;
	Fri,  6 Nov 2026 10:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DC61F0089F;
	Fri,  6 Nov 2026 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961035;
	bh=hybp8j82ToTVcRwshBegrkEhpIZerXiawkFTh+apM/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iiFJu/8SqOuolDMQeCwNZ1O8SV/V7Oi+TLffOQk6D4jvSoNCP7onDKH+8913jLDjz
	 VGnNSPRHu6vBUsmqiQwixBPCrmSeohksTocIeDTXjqejDI50mur6V/um6AC6TxLj1K
	 7zHFl9qP60uWOe+aY5js+W0uDVcyemqjv5z0+pKqIiJimNzvSl/khkjHQy5R+j/pQw
	 bAtnn/65v4AI/scsBr5OgD0Hq7SKyDinGlrKyZR2lfLsodbtY4e4h0lFEx7YSF7AEv
	 SX/B6+zMaWTYElJ/xrRN/XBjhMvMCeAJXUMzEYVglQipC3Opy9p4BhtfN/2F1ZMTc0
	 794WT5w7fuShg==
Message-ID: <sashiko-outbox-201220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
Date: Fri, 06 Nov 2026 10:30:35 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gdGhlcm1hbDogYW1sb2dpYzog
cmVkdW5kYW50IGFtbG9naWMsczQtdGhlcm1hbCBtYXRjaCBlbnRyeQotLQoKY29tbWl0IGQ3M2Rl
N2FkNTlkYmY3NDNjY2E5YjA4NjQ5MzI5MGMyYzc0ZWIxMjEKQXV0aG9yOiBDaHJpc3RpYW4gU3Rl
ZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KCnRoZXJtYWwvZHJpdmVycy9h
bWxvZ2ljOiBhZGQgUzQgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBhIG1hdGNoIHRhYmxlIGVu
dHJ5IGZvciAiYW1sb2dpYyxzNC10aGVybWFsIiB0bwpvZl9hbWxvZ2ljX3RoZXJtYWxfbWF0Y2hb
XSwgdXNpbmcgdGhlIGV4aXN0aW5nIGFtbG9naWNfdGhlcm1hbF90N19wYXJhbQpjb25maWd1cmF0
aW9uLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIGIv
ZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gaW5kZXggNjA3MjhkZTY5NjhhYy4u
NGMxMDdiMzEwMGMwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVy
bWFsLmMKPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBAQCAtMjky
LDYgKzI5MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9hbWxvZ2lj
X3RoZXJtYWxfbWF0Y2hbXSA9IHsKPiAgCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGExLWNwdS10
aGVybWFsIiwKPiAgCQkuZGF0YSA9ICZhbWxvZ2ljX3RoZXJtYWxfYTFfY3B1X3BhcmFtLAo+ICAJ
fSwKPiArCXsKPiArCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHM0LXRoZXJtYWwiLAo+ICsJCS5k
YXRhID0gJmFtbG9naWNfdGhlcm1hbF90N19wYXJhbSwKPiArCX0sCj4gIAl7Cj4gIAkJLmNvbXBh
dGlibGUgPSAiYW1sb2dpYyx0Ny10aGVybWFsIiwKPiAgCQkuZGF0YSA9ICZhbWxvZ2ljX3RoZXJt
YWxfdDdfcGFyYW0sCgpbU2V2ZXJpdHk6IExvd10KQXMgcmVwb3J0ZWQgYnkgS3J6eXN6dG9mIEtv
emxvd3NraSBvbiB2MSBbMV0sIGlzIGEgc2VwYXJhdGUKImFtbG9naWMsczQtdGhlcm1hbCIgZW50
cnkgaW4gb2ZfYW1sb2dpY190aGVybWFsX21hdGNoW10gbmVlZGVkIHdoZW4gaXQgdXNlcwp0aGUg
ZXhhY3Qgc2FtZSBhbWxvZ2ljX3RoZXJtYWxfdDdfcGFyYW0gZGF0YSBhbmQgYmluZGluZyBjb25z
dHJhaW50cyBhcwoiYW1sb2dpYyx0Ny10aGVybWFsIj8gIFBhaXJpbmcgImFtbG9naWMsczQtdGhl
cm1hbCIgd2l0aCAiYW1sb2dpYyx0Ny10aGVybWFsIgphcyBhIGZhbGxiYWNrIGNvbXBhdGlibGUg
aW4gdGhlIERldmljZXRyZWUgYmluZGluZyB3b3VsZCBtYWtlIHRoaXMgZHJpdmVyCmNoYW5nZSB1
bm5lY2Vzc2FyeS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMDMwLWZ1bm55
LWliZXgtb2YtbW9kZXJuaXNtLWI5OTVmZUBxdW9sbAoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNjEwMTkxMy40NjY2NC0xLWNo
cmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0P3BhcnQ9MgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
