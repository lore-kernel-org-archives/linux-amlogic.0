Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69B5CA9EC7
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntKdlFXhZ5rt968HczpcpHObaDZ4iV10buuBJLNYGoU=; b=ardVtndJjuZtaZ
	FHFdTqQ/CnpcHI+b5dtcxQsfzgMoH+v+k9gk3xSfmmhDJI6pJrIFOdjst+bBwmFzKNI4LO3kBczVa
	q3D2B/7SG3kE3As2Qqet+R4OmxIcfd8iqxm0pCYKB4wYszE1rVyDHzJq8V5DsZpVjaXqG4GexwPYn
	XHyeq8TPKypIDdvLJmz4PbSR7jKLw9nu3I+4Xhn3sFfHSAIz1T/ClG3Zyct414yE3BbymUCO4STF9
	aaIgXLREmcaqyURQBCmdLPglygVSd6uD8v6aCsKit4hslm4rKrTJkvMP/Z8jSYRQtnbrb9STXiuE2
	5qFCCotB4F1rhr8xhCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxHo-00000009FmJ-45Bb;
	Sun, 11 Oct 2026 17:24:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxHn-00000009FmA-32TR
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 17:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA08443D9C;
	Sun, 11 Oct 2026 17:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641081F0089B;
	Sun, 11 Oct 2026 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791739474;
	bh=6m9I9B6GkA5gYCKffsOlJbQ3HJdfav2jM4qozg78pUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtALx2tmXquxyWmF48c6eCrAlU9lh933+8pGJQu+PLPctxqhzHhySYMJWng9oaq1M
	 7Q6WdJ7ahOlPwOJHlpQeBfK51cgVVDMAQFWhR8wpWx2K5dli4rvV3HcxPcJ6lCS0hS
	 BYc0zD+0qn6x6suNBJ+G08vXhhxNafYg96DjMa96fNDoMW8iKxX/FDvHB6zCouQe6e
	 SmcWvrXSaFRk77dAjlMMyKxXivrq+wg/UVRy/WvDxEVWFxUr5jKC60bJ5HOvKsmJN0
	 E5bvu81ViBPUE3Mnx7mY4NmK0dobwzLDLtOTCt3ynFIO8A6q3zsj89Sx0hyB3Ykfbh
	 qnZE0+09tRVWw==
Message-ID: <sashiko-outbox-167345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
 <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
Date: Sun, 11 Oct 2026 17:24:33 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbmV0OiBvZl9nZXRf
bWFjX2FkZHJlc3NfbnZtZW0oKSBmYWlscyBkdWUgdG8gMTYtYnl0ZSBjZWxsCi0tCgpjb21taXQg
MzNjMjg2YWNmYWI5OTBmYjYyNjAzMzg1YjY0ZGU3NmIzYmQyMGRmZQpBdXRob3I6IEZpbCBEdW5z
a3kgPGZpbGlwcC5kdW5za3lAZ21haWwuY29tPgoKYXJtNjQ6IGR0czogbWVzb24tZ3hiYi1vZHJv
aWRjMjogcmVhZCB0aGUgRXRoZXJuZXQgTUFDIGFkZHJlc3MgZnJvbSBlRnVzZQoKVGhpcyBjb21t
aXQgdXBkYXRlcyB0aGUgbWVzb24tZ3hiYi1vZHJvaWRjMiBkZXZpY2UgdHJlZSB0byByZWFkIHRo
ZSBFdGhlcm5ldApNQUMgYWRkcmVzcyBmcm9tIHRoZSBlRnVzZSBudm1lbSBjZWxsIGluc3RlYWQg
b2YgcmVseWluZyBvbiB0aGUgYm9vdGxvYWRlci4KSXQgbGlua3MgdGhlIGV0aG1hYyBub2RlIHRv
IHRoZSBleGlzdGluZyBldGhfbWFjIG52bWVtIGNlbGwgdXNpbmcgc3RhbmRhcmQKcHJvcGVydGll
cy4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJi
LW9kcm9pZGMyLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLW9k
cm9pZGMyLmR0cwo+IGluZGV4IDU5NDNiYzgxMDY3OGUuLjYzOWI5N2FkNTE1YzAgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItb2Ryb2lkYzIuZHRz
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItb2Ryb2lkYzIu
ZHRzCj4gQEAgLTIzMCw2ICsyMzAsOSBAQCAmZXRobWFjIHsKPiAgCXBoeS1oYW5kbGUgPSA8JmV0
aF9waHkwPjsKPiAgCXBoeS1tb2RlID0gInJnbWlpIjsKPiAgCj4gKwludm1lbS1jZWxscyA9IDwm
ZXRoX21hYz47Cj4gKwludm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNzIjsKCltTZXZlcml0
eTogTWVkaXVtXQpXaWxsIHRoaXMgYWN0dWFsbHkgcmVhZCB0aGUgTUFDIGFkZHJlc3Mgc3VjY2Vz
c2Z1bGx5PyBUaGUgbmV0d29yayBjb3JlIHN0cmljdApjaGVja3MgbnZtZW0gY2VsbHMgZm9yIE1B
QyBhZGRyZXNzZXMgdG8gZW5zdXJlIHRoZXkgYXJlIGV4YWN0bHkgNiBieXRlcy4KCkxvb2tpbmcg
YXQgdGhlIGV0aF9tYWMgbm9kZSBkZWZpbmVkIGluIG1lc29uLWd4LmR0c2k6CgoJCWV0aF9tYWM6
IGV0aC1tYWNAMzQgewoJCQlyZWcgPSA8MHgzNCAweDEwPjsKCQl9OwoKVGhpcyBjZWxsIGhhcyBh
IGxlbmd0aCBvZiAxNiBieXRlcyAoMHgxMCkuCgpXaGVuIHRoZSBzdG1tYWMgZHJpdmVyIHByb2Jl
cywgaXQgZXZlbnR1YWxseSBjYWxscyBvZl9nZXRfbWFjX2FkZHJlc3NfbnZtZW0oKQppbiBuZXQv
Y29yZS9vZl9uZXQuYywgd2hpY2ggZW5mb3JjZXMgdGhpcyBjaGVjazoKCglpZiAobGVuICE9IEVU
SF9BTEVOIHx8ICFpc192YWxpZF9ldGhlcl9hZGRyKG1hYykpIHsKCQlrZnJlZShtYWMpOwoJCXJl
dHVybiAtRUlOVkFMOwoJfQoKQmVjYXVzZSAxNiBkb2VzIG5vdCBlcXVhbCBFVEhfQUxFTiwgdGhp
cyB1bmNvbmRpdGlvbmFsbHkgcmV0dXJucyAtRUlOVkFMLiBJdApzZWVtcyB0aGUgZHJpdmVyIHdp
bGwgZmFsbCBiYWNrIHRvIGEgYm9vdGxvYWRlci1wcm9ncmFtbWVkIG9yIHJhbmRvbSBNQUMKYWRk
cmVzcyBpbnN0ZWFkLCB3aGljaCBtaWdodCBiZSB3aHkgaXQgYXBwZWFyZWQgdG8gd29yayBkdXJp
bmcgdGVzdGluZy4KCkNvdWxkIHdlIGFkanVzdCB0aGUgZGV2aWNlIHRyZWUgdG8gcG9pbnQgdG8g
YSA2LWJ5dGUgY2VsbCBpbnN0ZWFkPwoKPiArCj4gIAlhbWxvZ2ljLHR4LWRlbGF5LW5zID0gPDI+
Owo+ICAKPiAgCW1kaW8gewoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTAxMS1vZHJvaWRjMi1kdHMtdjEtMC1mOWYwZTc3OWFmODhA
Z21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
