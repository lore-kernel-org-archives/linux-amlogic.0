Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9377606A32F
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SZ7uIv6M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klesofrt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BqLJmwDcdNRgNlLcqUjRii81hYxlE72HX+gRHbJIC94=; b=SZ7uIv6MACt1sokTyq95+YgpVg
	bD9aGQvh7JYFv+l08ayxS1E8w7ceBdokj62wHzL/m1MuH0yFf6Tyli/y8cLx9D63ovI9vQYaIlOeq
	BzPDD4mSGsdn+3MQPMRbgpngjy/2+uIn0P3NRJbco3S7C7x+WMTnyG6JIenKvqa1SsdnnguNedmYx
	s0NByVlX9PZdM+hgjbgCRWqvnfrS7zwII15S0BM7uxVCBvQzkFEAPtEss9tkayUjlHa2oDZXXqXiM
	v+N+ZrKOFXqDWMNsIUN7SwjKsFv46azc1kjUBrLh+iNT1lWNWC06kCxCIY2qLYDAZYifZHtPmyAGU
	wvOaTYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjnq-0000000F4Qg-2Zev;
	Sat, 07 Nov 2026 17:02:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjno-0000000F4QV-450a
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 17:02:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65BD0436A0;
	Sat,  7 Nov 2026 17:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C05B1F008A1;
	Sat,  7 Nov 2026 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070924;
	bh=JYKQcJOPplSFtWjteWjp77XJSS0p3knHJud3KPquMEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klesofrtIKM0MLDrX5nUeknQaEfn3tC3EgQIlbkqMuRBzRsxCHMXANfK5hEPwkbs6
	 BdqyzC+2FEQA2WEj83IqDE4FsOQ8/w35MpBO1SOlTJ72gI9Zhi2Ud9laru2F68Kd0+
	 h30W8cNMwfOE+6Fsw9PRMnDZb8Y240yZwn2/0S7ak0WICZVPoidmxOy0QjTdNTyWOF
	 E/fRHEML55kkRLwqJkthXNZdUq7mzWr/CBhYf5FNrL/A6dQEpfa3D1Y0daX9t1hlVR
	 A/E8QCno/cFT6D2tw2oA8NTibsLt03sjHbKoEf2HTZzV4Ya9/Um77nb78Gj7spJylM
	 I0cO657B4ZS4A==
Message-ID: <sashiko-outbox-203084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
To: "Jude Gyimah" <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261107165527.576383-3-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
 <20261107165527.576383-3-jude.gyimah87@gmail.com>
Date: Sat, 07 Nov 2026 17:02:03 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gQVNvQzogbWVzb246IGF4Zy1w
ZG06IGNvbW1pdCBtZXNzYWdlIHJlZmVycyB0byB0aHJlZSBzdGFuemFzIGJ1dAogIG9ubHkgdXBk
YXRlcyBvbmUKLS0KCmNvbW1pdCAxYWE5N2FhMzdmOTc0Yzk2MTUwMzI2ZmY0YWUzMmYxYjc1NWZi
YWQwCkF1dGhvcjogSnVkZSBHeWltYWggPGp1ZGUuZ3lpbWFoODdAZ21haWwuY29tPgoKQVNvQzog
bWVzb246IGF4Zy1wZG06IHNlbGVjdCBSRUdNQVBfTU1JTwoKVGhpcyBjb21taXQgYWRkcyBhIHNl
bGVjdCBSRUdNQVBfTU1JTyBzdGF0ZW1lbnQgdG8gdGhlIFNORF9NRVNPTl9BWEdfUERNCktjb25m
aWcgZW50cnkgdG8gcHJldmVudCBsaW5rIGZhaWx1cmVzIHdoZW4gU05EX01FU09OX0FYR19QRE0g
aXMgYnVpbHQtaW4KYW5kIFJFR01BUF9NTUlPIGlzIGJ1aWx0IGFzIGEgbW9kdWxlLgoKPiBTZXZl
cmFsIHN0YW56YXMgaW4gdGhlIHNhbWUgZmlsZSBhbHJlYWR5IHNlbGVjdCBSRUdNQVBfTU1JTywK
PiBTTkRfTUVTT05fRzEyQV9UT0FDT0RFQyBhbW9uZyB0aGVtLiAgVGhlc2UgdGhyZWUgZG8gbm90
LgoKW1NldmVyaXR5OiBMb3ddCldoYXQgZG9lcyAiVGhlc2UgdGhyZWUiIHJlZmVyIHRvIGhlcmU/
ICBOb3RoaW5nIGVhcmxpZXIgaW4gdGhlIGNvbW1pdAptZXNzYWdlIG5hbWVzIHRocmVlIHN0YW56
YXMsIGFuZCB0aGlzIHBhdGNoIG9ubHkgdXBkYXRlcyBTTkRfTUVTT05fQVhHX1BETQp3aGlsZSB0
aGUgb3RoZXIgc3RhbnphcyBhcmUgdXBkYXRlZCBpbiBzZXBhcmF0ZSBjb21taXRzLgoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEw
NzE2NTUyNy41NzYzODMtMS1qdWRlLmd5aW1haDg3QGdtYWlsLmNvbT9wYXJ0PTIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
