Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C460A260E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oo00IXd4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klE1KVR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pCjMJXHOb0y2OJ6syZgK6pAz40UkS3KLd9wEDOEW1DU=; b=oo00IXd4/eLOGV/URAKTdQoTRX
	p7baEbv4mPPO3TWOBlS7dCGjZXHxZE5xLIcnFQus0JKZcH3tMZBBoNNMPgaxTjiUKY7FUIW3hYqfP
	ElPKi4LTU93zjyaRGaEP46C7bkurmYiwIDEbmAcpuKVFr6oY9iGKy4A2iHx5xpkY8Q0segdxr+icj
	gMCdZAu/TXb/uevE83P4U9zhIr3uHlN0TdfvcgHj7uqrTLSwuPyNCOr9gYBtKpiv5UBzFAKwAHQ5I
	u33h2fmiCchkQyda/egOOBEogRN/6DZ7TYn6mFw3JtWDPBqQnVz3+zdyp0WTr3uM6+i0jTm3fGySF
	OLvP3SZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToH-0000000Fzgs-11LG;
	Fri, 20 Nov 2026 18:58:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToD-0000000Fzf6-3VFT;
	Fri, 20 Nov 2026 18:58:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EFCC761483;
	Fri, 20 Nov 2026 18:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0917A1F000E1;
	Fri, 20 Nov 2026 18:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795201084;
	bh=kLa/ktQb6nF/IzsmolVfdoxy/DHth7joboUFEBOLt+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klE1KVR4l6PX7i/nb1eBMolzEKmELQURpJbBaGFF9PAuYBxi8go1DjZScUUv4BK6N
	 mRFQDA+3C8POPEt10LPqIP1pdiTSVF2cHJ/PDrPR9JD8sOoXL6Oq9qUTd00j4cDfpm
	 T7x/R3J3N1EoZR1W7KgrDrJgbVEFPrS4Uapm41fEZUFentV7SU6P3mlOtCGNrsq22z
	 J5JXr+7BpUSzuqH3oO0Qi90PNttMhpKaU0XpVMCETlFzGvEdyYx2yKJDGSdxR3wSdb
	 zGVY4xGp8IyB5dL38AqBOHEc33Qo0sgvMPDBUlOTGVXJbCgsIxPUrheP5Yfw9Q8QiI
	 VYgQE9JQbAQ9A==
Message-ID: <sashiko-outbox-225878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
Date: Fri, 20 Nov 2026 18:58:03 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gcG1kb21haW46IGFtbG9naWM6
IGR1cGxpY2F0ZWQgbWVtb3J5IHBvd2VyLXVwIGxvb3AgaW4KICBtZXNvbl9lZV9wd3JjX29uKCkK
LS0KCmNvbW1pdCBhNjlhNjRlZTNlMTNiYTdmOTA3MmRiYWRiMGYyNWVjM2UxNDZjMzM2CkF1dGhv
cjogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpwbWRvbWFpbjog
YW1sb2dpYzogbWVzb24tZWUtcHdyYzogcG93ZXIgdXAgbWVtb3JpZXMgZm9yIGJvb3QtZW5hYmxl
ZCBkb21haW5zCgpUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgaGVscGVyIHRvIGNsZWFyIHRoZSBI
SEkgbWVtb3J5IHBvd2VyLWRvd24gYml0cwpmb3IgcG93ZXIgZG9tYWlucyB0aGF0IGFyZSBmb3Vu
ZCBhbHJlYWR5IGVuYWJsZWQgYXQgcHJvYmUgdGltZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cG1kb21haW4vYW1sb2dpYy9tZXNvbi1lZS1wd3JjLmMgYi9kcml2ZXJzL3BtZG9tYWluL2FtbG9n
aWMvbWVzb24tZWUtcHdyYy5jCj4gaW5kZXggMzM4ZjcwZDc3YmYwMy4uNDA0YWY0NjE5MjU2MiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BtZG9tYWluL2FtbG9naWMvbWVzb24tZWUtcHdyYy5jCj4g
KysrIGIvZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVlLXB3cmMuYwo+IEBAIC00Mjgs
NiArNDI4LDE2IEBAIHN0YXRpYyBpbnQgbWVzb25fZWVfcHdyY19vbihzdHJ1Y3QgZ2VuZXJpY19w
bV9kb21haW4gKmRvbWFpbikKPiAgCQkJCSAgICAgICBwd3JjX2RvbWFpbi0+Y2xrcyk7Cj4gIH0K
PiAgCj4gK3N0YXRpYyB2b2lkIG1lc29uX2VlX3B3cmNfbWVtX3Bvd2VyX3VwKHN0cnVjdCBtZXNv
bl9lZV9wd3JjX2RvbWFpbiAqZG9tKQo+ICt7Cj4gKwlpbnQgaTsKPiArCj4gKwlmb3IgKGkgPSAw
OyBpIDwgZG9tLT5kZXNjLm1lbV9wZF9jb3VudDsgaSsrKQo+ICsJCXJlZ21hcF91cGRhdGVfYml0
cyhkb20tPnB3cmMtPnJlZ21hcF9oaGksCj4gKwkJCQkgICBkb20tPmRlc2MubWVtX3BkW2ldLnJl
ZywKPiArCQkJCSAgIGRvbS0+ZGVzYy5tZW1fcGRbaV0ubWFzaywgMCk7Cj4gK30KCltTZXZlcml0
eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgbWVzb25fZWVfcHdyY19vbigpIHJpZ2h0IGFi
b3ZlIGhhcyB0aGUgc2FtZSBsb29wOgoKZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVl
LXB3cmMuYzptZXNvbl9lZV9wd3JjX29uKCkgewogICAgLi4uCglmb3IgKGkgPSAwIDsgaSA8IHB3
cmNfZG9tYWluLT5kZXNjLm1lbV9wZF9jb3VudCA7ICsraSkKCQlyZWdtYXBfdXBkYXRlX2JpdHMo
cHdyY19kb21haW4tPnB3cmMtPnJlZ21hcF9oaGksCgkJCQkgICBwd3JjX2RvbWFpbi0+ZGVzYy5t
ZW1fcGRbaV0ucmVnLAoJCQkJICAgcHdyY19kb21haW4tPmRlc2MubWVtX3BkW2ldLm1hc2ssIDAp
OwogICAgLi4uCn0KCkNvdWxkIG1lc29uX2VlX3B3cmNfbWVtX3Bvd2VyX3VwKCkgYmUgZGVmaW5l
ZCBhYm92ZSBtZXNvbl9lZV9wd3JjX29uKCkKYW5kIHJldXNlZCB0aGVyZSBhcyB3ZWxsPwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTEyMC1tZXNvbi1kcm0tY3JlYXRlLWhkbWl0eC1waHktdjItMC05M2Q2MjJkOWJiMDdAYWxpZWwu
ZnI/cGFydD02CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
