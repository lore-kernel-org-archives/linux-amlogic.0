Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD1C606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qMaa5lNI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQJ0awWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gy0YbpJuyJ0lhnmKEu5sb+5FXVrQNVKDm4E10yE7TYk=; b=qMaa5lNIsVX4eS9cqTUeKqFBuo
	jHnkxquGqw9N/7mtw13x8nYY5FZkhWu/8ZaQKLgKVm5W3mdUbPu5hZIa9NCmb21Zlx7yEv9AMhgdD
	klid4vxkwsHIy6Iy0t+p27ru6I3ftVkdumOYU7qBs0PkVuECcF50GfaOgsPjhfK/Gltx2hdvF0nTT
	HfqG4WywJtakT9dGm1sYZQzHbr2g2WS2+AVUNqhIzaD9tp78FkXukQPZ4FtJfFoT0pqhwm/4/10FK
	IszKhQq+HconePzcqPzCCDf4KgO2HKwRebqc6N1VW74F/4C5QTIabPw1IxhVqQxRkCUL2ihHPRNFW
	mxio4SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgtB-000000098kD-0tgV;
	Wed, 18 Nov 2026 14:43:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgtA-000000098k1-3kSD
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 14:43:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 328004351C;
	Wed, 18 Nov 2026 14:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FA11F000C5;
	Wed, 18 Nov 2026 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013036;
	bh=cXUV7hKDsKpkJr1SARjDVAABt9+8XnSa63DJnjuCLmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQJ0awWoKGG8YPPENy/lUYu+Mx+E8yX2FQUl9bJTKNEM/iib/LkT+x+nHBBxfH9Iv
	 2y1K3C6mFmrBD94Oc/T1E/FEI7GpIO7BrtBbn48HNbYVtbQCyy5B6l8F1F6dWy4+lN
	 zjiMpY+9KinVtYvRIm6ENpnIil61v0g/KdujuTaePOwUzqWZNFEnO93hTLjQKJKwrY
	 4A9qD4RWP/aS/N9qpLJ1sXgzNcZb7hzlTAxPQeL9l/G4gm+bI6SFFrHoqvOM06tOEm
	 w1/7Ye0BODgs1ex/jCVKjrILgktQP1s/Vxh/PKyLbyZ0ku46hkPA3QILuSrZnf5k6O
	 QfTwnM67SPoJw==
Message-ID: <sashiko-outbox-221245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PCI: meson: Fix potential use-after-free after PHY
 provider removal
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261118-324f82bd41-pci-meson-0@mail.sdu.edu.cn>
References: <20261118-324f82bd41-pci-meson-0@mail.sdu.edu.cn>
Date: Wed, 18 Nov 2026 14:43:55 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gUENJOiBtZXNvbjogb3Blbi1j
b2RlZCBkZXZpY2VfbGlua19hZGQoKSBvbiBtcC0+cGh5LT5kZXYucGFyZW50CiAgaW4gbWVzb25f
cGNpZV9wcm9iZSgpCi0tCgpjb21taXQgYzY1NjEyYjFkMGQzNTc4MDM4NjQ5ZDBmZGM2MWE3NTIx
ZjMzZTFmYwpBdXRob3I6IEd1YW5nc2h1byBMaSA8bGlndWFuZ3NodW9AbWFpbC5zZHUuZWR1LmNu
PgoKUENJOiBtZXNvbjogRml4IHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBhZnRlciBQSFkgcHJv
dmlkZXIgcmVtb3ZhbAoKVGhpcyBjb21taXQgYWRkcyBhIG1hbmFnZWQgZGV2aWNlIGxpbmsgZnJv
bSB0aGUgTWVzb24gUENJZSBkZXZpY2UgdG8gaXRzClBIWSBwcm92aWRlciBpbiBtZXNvbl9wY2ll
X3Byb2JlKCkgc28gdGhlIFBDSWUgY29udHJvbGxlciBpcyB1bmJvdW5kCmJlZm9yZSB0aGUgUEhZ
IHByb3ZpZGVyIHJlbGVhc2VzIGl0cyByZXNvdXJjZXMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaS1tZXNvbi5jCj4gaW5kZXggODU1OWQxMzJkY2RlOC4uMjUxNjczYmM1OTYzYyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gQEAgLTQwMSw2ICs0MDEs
MTAgQEAgc3RhdGljIGludCBtZXNvbl9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAkJcmV0dXJuIFBUUl9FUlIobXAtPnBoeSk7Cj4gIAl9Cj4gIAo+ICsJaWYgKCFk
ZXZpY2VfbGlua19hZGQoZGV2LCBtcC0+cGh5LT5kZXYucGFyZW50LAo+ICsJCQkgICAgIERMX0ZM
QUdfQVVUT1JFTU9WRV9DT05TVU1FUikpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAt
RUlOVkFMLCAiZmFpbGVkIHRvIGxpbmsgUEhZIHByb3ZpZGVyXG4iKTsKCltTZXZlcml0eTogTG93
XQpTaG91bGQgYSBQSFkgY29uc3VtZXIgZHJpdmVyIHJlYWNoIGludG8gbXAtPnBoeS0+ZGV2LnBh
cmVudCB0byBjYWxsCmRldmljZV9saW5rX2FkZCgpIGRpcmVjdGx5PwoKT24gRGV2aWNlIFRyZWUg
cGxhdGZvcm1zLCBmd19kZXZsaW5rIGFscmVhZHkgcGFyc2VzIHRoZSAicGh5cyIgcHJvcGVydHkK
aW4gZHJpdmVycy9vZi9wcm9wZXJ0eS5jIChwYXJzZV9waHlzKCkpIGFuZCBjcmVhdGVzIGEgbWFu
YWdlZCBkZXZpY2UKbGluayBiZXR3ZWVuIGRldiBhbmQgdGhlIFBIWSBwcm92aWRlciwgd2hpY2gg
Y2F1c2VzCl9fZGV2aWNlX3JlbGVhc2VfZHJpdmVyKCkgdG8gdW5iaW5kIG1lc29uLXBjaWUgYmVm
b3JlIHRoZSBQSFkgcHJvdmlkZXIKcmVsZWFzZXMgaXRzIGRldnJlcyByZXNvdXJjZXM7IGRldmlj
ZV9saW5rX2FkZCgpIGhlcmUganVzdCBmaW5kcyB0aGF0CmV4aXN0aW5nIGxpbmsgYW5kIHJldHVy
bnMgaXQgd2l0aG91dCBhZGRpbmcgRExfRkxBR19BVVRPUkVNT1ZFX0NPTlNVTUVSLgpSZWFjaGlu
ZyBpbnRvIHN0cnVjdCBwaHkgaW50ZXJuYWxzIGFsc28gYnlwYXNzZXMgc3RydWN0IHBoeQplbmNh
cHN1bGF0aW9uLCBhbmQgYW55IHByb3ZpZGVyIGRldmljZSBsaW5rIG5lZWRlZCB3aGVuIGZ3X2Rl
dmxpbmsgaXMKZGlzYWJsZWQgYmVsb25ncyBpbiB0aGUgUEhZIGNvcmUgKHBoeV9nZXQoKSBpbiBk
cml2ZXJzL3BoeS9waHktY29yZS5jKQpyYXRoZXIgdGhhbiBpbiBpbmRpdmlkdWFsIGNvbnN1bWVy
IGRyaXZlcnMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYxMTE4LTMyNGY4MmJkNDEtcGNpLW1lc29uLTBAbWFpbC5zZHUuZWR1LmNu
P3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
