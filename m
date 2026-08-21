Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D93C5DF7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEt8xzZh0EGxRbFk2wQ8mxFBb/V2iC2gx5zzHEC4gcU=; b=dG4y95Xxi3RCbL
	SeAbZsJdGD88VgqLHPQMqSoAF15yIFPP5vhUNBYtImCp0v/JGF4epfcXLSXpLcV/XFeWXQwka+zxu
	YRgP6khOst7lGqLyY7+HZIYO3bmQPUaBpWsmfYsXYj4iIO6/we1k4oCMbyzUY5mekFD/2J5MCcp40
	kwuw+zKB9nbwD3VEAYfnKcAXAIN1p4XeUhnBwuaKjwSpUNpN45zqrjApyLIdHA9jPjD4qHUdXoeRE
	/Abw6pze7ksExhA1sdJ1jEfc5pVgjtCPYQG0rr5YV589kCqhWGgIfTKHTTPxN0gNPwfWUWpSyGAt0
	YEDGFH3SBN3bj1BkAlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMHV-0000000D4dA-3gcN;
	Fri, 21 Aug 2026 10:15:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMHU-0000000D4cn-3vtj
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 10:15:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6443160DB6;
	Fri, 21 Aug 2026 10:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01291F000E9;
	Fri, 21 Aug 2026 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307324;
	bh=1782I0SVlKTMUnzkgO7tYHy1NNV0f8J3mXNegURaqj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZcgXIAInZ7sB2W1n2pC4rTkaKpn0WAPCuujF09nICG1Xt/uEXH1PpnxvRssLq/3I
	 jABxepZfBuYcjHdaWYMxxJkSJlXMV8O6teGF9dusxwIG12KVs5cgiiQyuf/224p8kk
	 WYb3NodbH+QXpvphKw62kUzT7pTpCiD9NJ3SsT3wl4GZPxPXiCPk8iqmvjWdBc6pxS
	 zpgBBP+2cPx/3AWOFRXp8fTO7wRQY9QT2XPM7niWtK9B6+vDxelDPxlEo+F6JIGiNp
	 XdjJS0cWQamwCcqrfRRm1qa0otyP0zxqrgpMKcve17MNL4HHJ6fBVIw4Ncp4KTOc6k
	 vE7f41Y8yrc+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is
 fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
Date: Fri, 21 Aug 2026 10:15:23 +0000
Message-Id: <20260821101523.D01291F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBBbm90aGVyIGRyaXZlciBpbiB0aGUgc2FtZSBzdWJzeXN0ZW0gKG1lc29uLW14LXNk
aW8uYykgc3VmZmVycyBmcm9tIHRoZSBleGFjdCBzYW1lIHVuaW5pdGlhbGl6ZWQgc3RydWN0IGNs
a19pbml0X2RhdGEgaXNzdWUgdGhhdCB0aGlzIHBhdGNoIGZpeGVzLgotIFtIaWdoXSBUaGUgZHJp
dmVyIHJlZ2lzdGVycyBtdWx0aXBsZSBjbG9jayBwcm92aWRlcnMgZm9yIHRoZSBzYW1lIGRldmlj
ZSBub2RlIGJ1dCBvbmx5IGRlbGV0ZXMgb25lIG9uIHRlYXJkb3duLCBsZWFkaW5nIHRvIGEgbGVh
a2VkIHByb3ZpZGVyIHN0cnVjdCwgYSBsZWFrZWQgZGV2aWNlIG5vZGUgcmVmZXJlbmNlLCBhbmQg
YSBkYW5nbGluZyBVQUYgcG9pbnRlciBpbiB0aGUgZ2xvYmFsIGNsb2NrIHByb3ZpZGVycyBsaXN0
LgotLQoKLS0tIFBhdGNoIFsyXTogW1BBVENIIDIvMl0gbW1jOiBzZGhjaS1vZi1hcmFzYW46IE1h
a2Ugc3VyZSBjbGtfaW5pdF9kYXRhIGlzIGZ1bGx5IGluaXRpYWxpemVkIC0tLQpjb21taXQgMzRh
NDlmMDgzZGY2MzBmMjVhMjQwNTJiMzU4MjQ5YTJjNDhiNjA1NQpBdXRob3I6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgptbWM6IHNkaGNpLW9mLWFyYXNhbjog
TWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQKClRoZSBjbGtfaW5p
dF9kYXRhIHN0cnVjdHVyZSBjb250YWlucyBtdXR1YWxseS1leGNsdXNpdmUgbWVtYmVycyBmb3IK
c3BlY2lmeWluZyBjbG9jayBwYXJlbnRzLiBVbmluaXRpYWxpemVkIG1lbWJlcnMgY2FuIGNhdXNl
IGlzc3VlcyBleHBvc2VkIGJ5CmNlcnRhaW4gc3RhY2sgaW5pdGlhbGl6YXRpb24gY29uZmlncy4g
VGhpcyBjb21taXQgemVyb2VzIHRoZSBzdHJ1Y3QgdG8gcHJldmVudApidWdzIGFuZCBmdXR1cmUg
YnJlYWthZ2UuCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBi
eSB0aGlzIHBhdGNoLCBidXQgSSBub3RpY2VkIGFub3RoZXIgZHJpdmVyIGluCnRoZSBzYW1lIHN1
YnN5c3RlbSBzdWZmZXJzIGZyb20gdGhlIGV4YWN0IHNhbWUgdW5pbml0aWFsaXplZCBzdHJ1Y3QK
Y2xrX2luaXRfZGF0YSBpc3N1ZSB0aGF0IHRoaXMgcGF0Y2ggZml4ZXMuCgpJbiBkcml2ZXJzL21t
Yy9ob3N0L21lc29uLW14LXNkaW8uYzptZXNvbl9teF9tbWNfcmVnaXN0ZXJfY2xrcygpOgoKCXN0
cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7CgkuLi4KCWluaXQubmFtZSA9IGRldm1fa2FzcHJpbnRm
KGhvc3QtPmNvbnRyb2xsZXItPnBhcmVudCwgLi4uKTsKCWluaXQub3BzID0gJm1lc29uX214X21t
Y19jZmdfZGl2X29wczsKCWluaXQuZmxhZ3MgPSAwOwoJLi4uCgpEb2VzIHRoaXMgYWxzbyBuZWVk
IHplcm8taW5pdGlhbGl6YXRpb24gdG8gYXZvaWQgbGVhdmluZyBmaWVsZHMgbGlrZQpwYXJlbnRf
ZGF0YSBhbmQgcGFyZW50X2h3cyBhcyBzdGFjayBnYXJiYWdlLCB3aGljaCBjb3VsZCBsZWFkIHRv
IG1lbW9yeQpjb3JydXB0aW9uIGR1cmluZyBkZXZpY2UgcHJvYmU/Cgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhj
aS1vZi1hcmFzYW4uYwo+IGluZGV4IDBhNGI0Njk2YmMwMWMuLmFlYzYxN2FhOGUwY2EgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYwo+ICsrKyBiL2RyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMKWyAuLi4gXQo+IEBAIC0xNjM4LDggKzE2Mzgs
OCBAQCBzZGhjaV9hcmFzYW5fcmVnaXN0ZXJfc2FtcGxlY2xrKHN0cnVjdCBzZGhjaV9hcmFzYW5f
ZGF0YSAqc2RoY2lfYXJhc2FuLAo+ICAJCQkJc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlz
dHJ1Y3Qgc2RoY2lfYXJhc2FuX2Nsa19kYXRhICpjbGtfZGF0YSA9ICZzZGhjaV9hcmFzYW4tPmNs
a19kYXRhOwo+ICsJc3RydWN0IGNsa19pbml0X2RhdGEgc2FtcGxlY2xrX2luaXQgPSB7fTsKPiAg
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7CgpbU2V2ZXJpdHk6IEhpZ2hd
ClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBJIG5vdGljZWQgYSBwb3RlbnRpYWwg
bGVhayBhbmQgZGFuZ2xpbmcKcG9pbnRlciBoYXphcmQgd2hlbiB0ZWFyaW5nIGRvd24gdGhlc2Ug
Y2xvY2sgcHJvdmlkZXJzLgoKSWYgI2Nsb2NrLWNlbGxzID4gMCwgdGhpcyBkcml2ZXIgcmVnaXN0
ZXJzIGJvdGggdGhlIHNkY2FyZGNsayBhbmQgc2FtcGxlY2xrCnByb3ZpZGVycyBmb3IgdGhlIHNh
bWUgZGV2LT5vZl9ub2RlIHZpYSBvZl9jbGtfYWRkX3Byb3ZpZGVyKCkuCgpEdXJpbmcgdW5iaW5k
LCBzZGhjaV9hcmFzYW5fdW5yZWdpc3Rlcl9zZGNsaygpIGNhbGxzOgoKCW9mX2Nsa19kZWxfcHJv
dmlkZXIoZGV2LT5vZl9ub2RlKTsKClNpbmNlIG9mX2Nsa19kZWxfcHJvdmlkZXIoKSBzdG9wcyBh
ZnRlciBkZWxldGluZyB0aGUgZmlyc3QgbWF0Y2hpbmcgcHJvdmlkZXIKaXQgZmluZHMgKHdoaWNo
IHdvdWxkIGJlIHNhbXBsZWNsayksIGRvZXMgdGhpcyBsZWF2ZSB0aGUgc2RjYXJkY2xrIHByb3Zp
ZGVyCm9uIHRoZSBnbG9iYWwgbGlzdD8gCgpXaGVuIHRoZSB1bmRlcmx5aW5nIGNsb2NrIGlzIGZy
ZWVkIGJ5IGRldm0sIGFueSBzdWJzZXF1ZW50IERUIGxvb2t1cCBvbiB0aGlzCm5vZGUgbWlnaHQg
ZmV0Y2ggdGhlIGRhbmdsaW5nIHByb3ZpZGVyIGFuZCByZXR1cm4gYSBmcmVlZCBzdHJ1Y3QgY2xr
IHBvaW50ZXIuCkNvdWxkIHdlIGJlIGxlYWtpbmcgYSBwcm92aWRlciBhbmQgZGV2aWNlIG5vZGUg
cmVmZXJlbmNlIGhlcmU/Cgo+IC0Jc3RydWN0IGNsa19pbml0X2RhdGEgc2FtcGxlY2xrX2luaXQ7
Cj4gIAljb25zdCBjaGFyICpwYXJlbnRfY2xrX25hbWU7Cj4gIAlpbnQgcmV0Owo+CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2NvdmVyLjE3
ODcyNDAwOTAuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlP3BhcnQ9MgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
