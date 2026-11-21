Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500B606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKL05kHc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2d3E1x+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tmkP1ijbRpqopwfl9mfGkiyETmzYhN/JcA4edAgVbe0=; b=pKL05kHcu/+u9tf6oZRgNhngJa
	DwDsxY9ZaKfg2/pkcYrhD0g4KWpCYGLvL3GlG1JAIsJlCYj60WqkmphxpsOU5YiKEk5agZ4hdW2tg
	J5bCwj6IXoRVOZrL6QrBel1qdewjdJ4ghkXWgLtjwCvqHU5DmIBEpr0HimaH9SZER9VJTJUkhHZwb
	vI6+GfP1poxGljVF+wkIFqf4Zvh6T1CNSvcqSYPjYXULFUnr6am8wzXHNd+GzlhvJQJUK0zM/9hjS
	3p6jR7mY8ELA1t6Ihd7FKH3JSM46U0KTqmf7pX01zoIZS2t4cDBBOZg3i1QHenwjJ6RjLwHMwgVb1
	bvN8DUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqiz-000000007EG-2FW0;
	Sat, 21 Nov 2026 19:26:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqix-000000007Dw-28vp;
	Sat, 21 Nov 2026 19:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E85A3613B0;
	Sat, 21 Nov 2026 19:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E21F000C4;
	Sat, 21 Nov 2026 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289170;
	bh=4VgQthRtCDUTKQc+MlhvCROWbeiQaB+99GbrW7fcYl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2d3E1x+RfWObZkRLhQQ71TVS2GIubQN06VgoJpDNmCTz3Vj2f2ksnBvYucuCsZL7
	 DJwBhcQrzFUYas44mJbhJ0WxZLtMP4v3nV2Lmtz/vxgU9nnvkrqiSk0DtKqsAt1XJr
	 YybPPlX8KgZo+ntkXitiPns67ghteFSHr+ZHoDqsQ2DYvFVHogNpEP6O200C5kSVbg
	 DYQ5Rg+nISt6IljxClcq4tN9cqj+kJAaDt27erJB11L1BLfV5c4aT/tA7YZCDld0Hf
	 zVpJeeCCz5rEIkRx3hjJEdlcyMwY7n/7SX5o3zlg0Qakehgno4D5oZ0J+2qIb/hssZ
	 pIjP40QLDRnBQ==
Message-ID: <sashiko-outbox-227302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX
 PHY binding
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
Date: Sat, 21 Nov 2026 19:26:09 +0000
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IHBoeTog
YW1sb2dpYzogcmVkdW5kYW50IHdvcmQgYmluZGluZyBpbiBjb21taXQKICBzdWJqZWN0Ci0tCgpj
b21taXQgZmJkNDU2M2I1Y2QxMGRiM2Y3NWRiMDUyMTk3ZjgwOGUzYjM2YmM1NQpBdXRob3I6IFJv
bmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKZHQtYmluZGluZ3M6IHBo
eTogYW1sb2dpYzogQWRkIE1lc29uIEhETUkgVFggUEhZIGJpbmRpbmcKClRoaXMgY29tbWl0IGFk
ZHMgYSBEZXZpY2UgVHJlZSBiaW5kaW5nIHNjaGVtYSBmb3IgdGhlIEhETUkgVFggUEhZIGZvdW5k
IG9uCkFtbG9naWMgTWVzb24gR1hCQiwgR1hMLCBhbmQgRzEyQSBTb0NzLgoKPiBkdC1iaW5kaW5n
czogcGh5OiBhbWxvZ2ljOiBBZGQgTWVzb24gSERNSSBUWCBQSFkgYmluZGluZwoKW1NldmVyaXR5
OiBMb3ddClRoZSBkdC1iaW5kaW5nczogcHJlZml4IGFscmVhZHkgaW5kaWNhdGVzIHRoYXQgdGhp
cyBwYXRjaCBhZGRzIGEgYmluZGluZywKc28gcmVwZWF0aW5nICJiaW5kaW5nIiBhdCB0aGUgZW5k
IG9mIHRoZSBzdWJqZWN0IGlzIHJlZHVuZGFudCAoImR0LWJpbmRpbmdzOgpwaHk6IGFtbG9naWM6
IEFkZCBNZXNvbiBIRE1JIFRYIFBIWSIpLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyMS1tZXNvbi1kcm0tY3JlYXRlLWhkbWl0
eC1waHktdjMtMC1mOGY0NzE3ODgwNzZAYWxpZWwuZnI/cGFydD0yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
