Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD9606A31B
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RxZoDfUz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htOSli12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tsN3K4+F3rdQ7UYeEGBmkor6LNUfu6sq+MUiZtmeCKg=; b=RxZoDfUzpKkQVyL4p4xq/DO5JJ
	p8HI0WQ1lixapUqZ/EbKZ8au5PebIJ9VxlQFXqGqPFacdXVXnd3zu6Dnur3DY18csV7wno+9/tiZY
	waxEhpDGC7EmKAIhcSO+i8BByjL0hLzLefdpf+uxe/Hj0VBxRd1KMdzfUnp/k9vEjm66MuTh0FvEt
	1Dfe7OlDYfP2KMHl+X2/wiO2R6aLb/NRgNITbdZIjB7HaV/RLRJlkdkgooRyVB3mLrBTwlSNy/DtV
	+lvvSrAUd0gXKvPkQVDhWNPIxxjc8O9bM70Wg1EuQuQPLUSG/b7C91wePl3mVEMEmktiadPfvvMou
	RCYMtJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0pa-0000000F3De-1pG1;
	Thu, 22 Oct 2026 22:00:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0pY-0000000F3DN-3sBW
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 22:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00961601F8;
	Thu, 22 Oct 2026 22:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E61F01825;
	Thu, 22 Oct 2026 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706411;
	bh=8sOgvh4yLZPtERkvJnLyKpUnin0Qq6L08scw/NTm3fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htOSli1215KYpG5FM61DDaMEIRDy8GOeLIolELaVBtUDP7eToIG5FzS0koX/cElLs
	 XZjenwAplNt9WKZ2l92XbTCpgfVzKO4C1Owk2B5zl781R7u8U+VQ5K0ICsaH5b/khe
	 2+8m5gIce3H8Ovy8zga+RwE6QycKrGrYbqlWFq/2oNONZZ8DZBT/odlqM7zluIyUXs
	 oQgJigwLRQwd7RDZL4K3dYFTxgtRDx5JfMMll3qjyKSPv091PAEV9MConxPHGy7lMm
	 Pi327pdl++dqwKgtM5VueIoXYZQqiCvBPpJnfidQyVe7q0rypzX/p22Z/o+LEzdjKq
	 zeIuUYUrv/EtQ==
Message-ID: <sashiko-outbox-182086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
 <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
Date: Thu, 22 Oct 2026 22:00:11 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGNsazogbWVzb246IGcx
MmE6IGluY29ycmVjdCByYXRlIGZvciBnMTJhX2ZjbGtfZGl2MnA1X2RpdiBkdWUgdG8gNCBHSHog
cGFyZW50Ci0tCgpjb21taXQgNjNlZWM5YzM5ZjJjY2Q3NzAzN2E5Mjk0MDg5MjhjMzU3ZTE1MDA3
NQpBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKY2xr
OiBtZXNvbjogZzEyYTogZml4IGZjbGtfZGl2MnA1IG11bHRpcGxpZXIKClRoaXMgY29tbWl0IGNo
YW5nZXMgdGhlIG11bHRpcGxpZXIgb2YgZzEyYV9mY2xrX2RpdjJwNV9kaXYgaW4KZHJpdmVycy9j
bGsvbWVzb24vZzEyYS5jIGZyb20gMSB0byAyIHNvIHRoYXQgaXRzIGZpeGVkIGZhY3RvciByYXRp
byBiZWNvbWVzCjIvNSBpbnN0ZWFkIG9mIDEvNS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L21lc29uL2cxMmEuYyBiL2RyaXZlcnMvY2xrL21lc29uL2cxMmEuYwo+IGluZGV4IGQwZDRjN2I2
ZGM4MjcuLjRlYzVmMTVkYWY5ODAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vZzEy
YS5jCj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4gQEAgLTk5NSw3ICs5OTUsNyBA
QCBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgZzEyYV9mY2xrX2RpdjcgPSB7Cj4gIH07Cj4gIAo+
ICBzdGF0aWMgc3RydWN0IGNsa19maXhlZF9mYWN0b3IgZzEyYV9mY2xrX2RpdjJwNV9kaXYgPSB7
Cj4gLQkubXVsdCA9IDEsCj4gKwkubXVsdCA9IDIsCj4gIAkuZGl2ID0gNSwKPiAgCS5ody5pbml0
ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4gIAkJLm5hbWUgPSAiZmNsa19kaXYycDVfZGl2
IiwKCltTZXZlcml0eTogSGlnaF0KV29uJ3Qgc2V0dGluZyAubXVsdCA9IDIgaGVyZSBjYXVzZSBn
MTJhX2ZjbGtfZGl2MnA1X2RpdiBhbmQgZzEyYV9mY2xrX2RpdjJwNQp0byByZXBvcnQgMS42IEdI
eiBpbnN0ZWFkIG9mIHRoZSBleHBlY3RlZCA4MDAgTUh6IHdoZW4gY2xrX2ZpeGVkX2ZhY3Rvcl9v
cHMKY2FsY3VsYXRlcyB0aGUgY2xvY2sgcmF0ZT8KClVubGlrZSB0aGUgb3RoZXIgZzEyYV9mY2xr
X2RpdipfZGl2IGNsb2NrcyBpbiBkcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMsIHdoaWNoCnVzZSBn
MTJhX2ZpeGVkX3BsbCAofjIgR0h6KSBhcyB0aGVpciBwYXJlbnQ6Cgpkcml2ZXJzL2Nsay9tZXNv
bi9nMTJhLmM6CnN0YXRpYyBzdHJ1Y3QgY2xrX2ZpeGVkX2ZhY3RvciBnMTJhX2ZjbGtfZGl2NV9k
aXYgPSB7CgkubXVsdCA9IDEsCgkuZGl2ID0gNSwKCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2lu
aXRfZGF0YSl7CgkJLm5hbWUgPSAiZmNsa19kaXY1X2RpdiIsCgkJLm9wcyA9ICZjbGtfZml4ZWRf
ZmFjdG9yX29wcywKCQkucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgeyAm
ZzEyYV9maXhlZF9wbGwuaHcgfSwKCQkubnVtX3BhcmVudHMgPSAxLAoJfSwKfTsKCmcxMmFfZmNs
a19kaXYycDVfZGl2IGlzIHBhcmVudGVkIGRpcmVjdGx5IHRvIGcxMmFfZml4ZWRfcGxsX2RjbyAo
fjQgR0h6KSwKYmVmb3JlIHRoZSBnMTJhX2ZpeGVkX3BsbCBwb3N0LWRpdmlkZXIgZGl2aWRlcyB0
aGUgRENPIGJ5IDI6Cgpkcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmM6CnN0YXRpYyBzdHJ1Y3QgY2xr
X2ZpeGVkX2ZhY3RvciBnMTJhX2ZjbGtfZGl2MnA1X2RpdiA9IHsKCS5tdWx0ID0gMiwKCS5kaXYg
PSA1LAoJLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsKCQkubmFtZSA9ICJmY2xr
X2RpdjJwNV9kaXYiLAoJCS5vcHMgPSAmY2xrX2ZpeGVkX2ZhY3Rvcl9vcHMsCgkJLnBhcmVudF9o
d3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsKCQkJJmcxMmFfZml4ZWRfcGxsX2Rjby5o
dwoJCX0sCgkJLm51bV9wYXJlbnRzID0gMSwKCX0sCn07CgpCZWNhdXNlIGcxMmFfZml4ZWRfcGxs
X2RjbyBydW5zIGF0IH40IEdIeiAoMyw5OTksOTk5LDkzOCBIeiwgYXMgYWxzbyBzZWVuIGluCmcx
MmFfbXBsbF81MG1fZGl2IHdoaWNoIGRpdmlkZXMgZzEyYV9maXhlZF9wbGxfZGNvIGJ5IDgwIHRv
IGdldCA1MCBNSHopLApkaXZpZGluZyBnMTJhX2ZpeGVkX3BsbF9kY28gYnkgNSB3aXRoIC5tdWx0
ID0gMSBhbHJlYWR5IHByb2R1Y2VzIHRoZSA4MDAgTUh6CnJhdGUgKDc5OSw5OTksOTg3IEh6LCBv
ciBnMTJhX2ZpeGVkX3BsbCAvIDIuNSkgZXhwZWN0ZWQgYnkgY29uc3VtZXJzIHN1Y2ggYXMKZ3B1
X29wcF90YWJsZSBpbiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1v
bi5kdHNpOgoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRz
aToKCQlvcHAtNzk5OTk5OTg3IHsKCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDw3OTk5OTk5ODc+OwoJ
CQlvcHAtbWljcm92b2x0ID0gPDgwMDAwMD47CgkJfTsKCldpdGggLm11bHQgPSAyIGFuZCAuZGl2
ID0gNSBvbiBnMTJhX2ZpeGVkX3BsbF9kY28sIHdvdWxkbid0IGZjbGtfZGl2MnA1CnJlcG9ydCB+
MS42IEdIeiAoMSw1OTksOTk5LDk3NSBIeikgYW5kIGNhdXNlIGRvd25zdHJlYW0gZGl2aWRlcnMg
c3VjaCBhcyB0aGUKTWFsaSBHUFUsIE5OQSwgVkRFQywgVkFQQiwgYW5kIE1JUEkgSVNQIGNsb2Nr
cyB0byBwcm9ncmFtIGEgLzIgZGl2aWRlciBhbmQKcnVuIGF0IGhhbGYgdGhlaXIgcmVxdWVzdGVk
IGZyZXF1ZW5jeT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjEwMjItZml4LWcxMmEtY2xrLXYxLTAtZTJiZDhmM2YxYWZhQGFsaWVs
LmZyP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
