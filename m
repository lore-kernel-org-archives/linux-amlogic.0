Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FF0CC6B38
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 18:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qCNH41nhftKaqYCvfScBKrFM2pnSnNAY8wUQ7cKX1A=; b=Dl1f0sIuwvgBkD
	TfYXIjAnp/oKi4Sr+Kgyqrnrov61gu6g4gxkdqyBD1epApL6kERiZShKasChcYSZnLcf5JHioQAk8
	0jhUbzT4qefOi8AQyyfNs05xtUhg48BbS4w/N7YmWoxOPQjMYQFC/KEYNjbZRbx/5IgaXcdMVmthb
	VJ2NIhQjPJ9U2R3gFeewUkMDd52hipNKY38SOv3js9d2jauNvipHGakxUfW8ve5DDFVppRjl5UD0U
	VNkOvsdLZhgM2yYLDBVXjgGWzOSSVPbk8nyUlUp+fS9jN1zPSklhtf4ODASuXHaV0bak9Eh065dqu
	i7C0ljZrX1SaEErFBXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPkT-0000000150H-1Dr5;
	Thu, 15 Oct 2026 18:00:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPkR-000000014zP-1mxE
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Oct 2026 18:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F3F7601EF;
	Thu, 15 Oct 2026 18:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F4C1F000C4;
	Thu, 15 Oct 2026 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792087210;
	bh=7ryhJUAfiwEf2MvvxBLcg44tPrm4oL2OIT9TYlnZLc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpEeGByPWz1MDTfx9+c/e1wS58eqyu5ZXVWMvuQaKIccWa6jEi2OZyaZaaiKSq7BE
	 dX+WJbVFqydZcGMWyea3Nm7RplCltL19IXbcY4kgIFOErOvdh8yTs1VbA/SKLWxAoH
	 7KgfZ6uASS+4VJMVFGgWMrJ119qNQrqOtRcOP5qf4HirPhvpG/FAhNMd+1j6Rbj/Wy
	 /YYBn4PaNGFWR8vcsMikhBIiqmI9WpJQleJ2uaEAPWokg5HVJc1MOGEMB91Gf21m1L
	 o/1QHVImx2I1o6CalBXwEInihH0prWtcWld34YHLBAtudKptKyllXcOBUFRAZL7IaL
	 LOikosWKfLrNw==
Message-ID: <sashiko-outbox-173272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: amlogic: t7: Add thermal zones
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
References: <20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr>
 <20261015-add-thermal-t7-vim4-v6-3-37d1c954390c@aliel.fr>
Date: Thu, 15 Oct 2026 18:00:09 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHRzOiB0aGVybWFs
IHRyaXAgcG9pbnRzIGxhYmVsZWQgYXMgJ2hvdCcgYXJlIGluY29ycmVjdGx5IHR5cGVkIGFzICdw
YXNzaXZlJwotLQoKY29tbWl0IGYyMjEyOWVmZWQ3YzY0Mzk3MTRjMWMyNTAxODM0YTZjMDFiZTll
OWUKQXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCmFy
bTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBBZGQgdGhlcm1hbCB6b25lcwoKVGhpcyBjb21taXQgYWRk
cyB0aGVybWFsIHpvbmVzIGZvciBhbGwgc2l4IHNlbnNvcnMgKGE1MywgYTczLCBncHUsIG5uYSwK
dnB1LCBhbmQgaGV2YykgdG8gdGhlIGFtbG9naWMgdDcgZGV2aWNlIHRyZWUgY29uZmlndXJhdGlv
bi4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gaW5k
ZXggYzgxNjMyZDM5ODRlOC4uNDU0YTA0Mjg2NWE1YSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQoKWyAuLi4gXQoKPiArCQlncHVfdGhlcm1hbDog
Z3B1LXRoZXJtYWwgewo+ICsJCQlwb2xsaW5nLWRlbGF5ID0gPDEwMDA+Owo+ICsJCQlwb2xsaW5n
LWRlbGF5LXBhc3NpdmUgPSA8MTAwPjsKPiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZncHVfdHNl
bnNvcj47Cj4gKwo+ICsJCQl0cmlwcyB7Cj4gKwkJCQlncHVfcGFzc2l2ZTogZ3B1LXBhc3NpdmUg
ewo+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDk1MDAwPjsKPiArCQkJCQloeXN0ZXJlc2lzID0gPDUw
MDA+Owo+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gKwkJCQl9Owo+ICsKPiArCQkJCWdwdV9o
b3Q6IGdwdS1ob3Qgewo+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEwNTAwMD47Cj4gKwkJCQkJaHlz
dGVyZXNpcyA9IDw1MDAwPjsKPiArCQkJCQl0eXBlID0gInBhc3NpdmUiOwoKW1NldmVyaXR5OiBN
ZWRpdW1dCkRvZXMgdGhpcyBpbmNvcnJlY3RseSBzZXQgdGhlIHRyaXAgdHlwZSBmb3IgZ3B1LWhv
dCB0byAicGFzc2l2ZSIgaW5zdGVhZApvZiAiaG90Ij8gVGhlIHRoZXJtYWwgc3Vic3lzdGVtIHdp
bGwgdHJlYXQgdGhpcyBhcyBhIHBhc3NpdmUgdHJpcCBwb2ludCwKbWVhbmluZyB0aGUgc3RhbmRh
cmQgaG90IHRoZXJtYWwgZXZlbnRzIHdvbid0IHRyaWdnZXIgYXQgdGhlIDEwNcKwQwp0aHJlc2hv
bGQuCgo+ICsJCQkJfTsKClsgLi4uIF0KCj4gKwkJaGV2Y190aGVybWFsOiBoZXZjLXRoZXJtYWwg
ewo+ICsJCQlwb2xsaW5nLWRlbGF5ID0gPDEwMDA+Owo+ICsJCQlwb2xsaW5nLWRlbGF5LXBhc3Np
dmUgPSA8MTAwPjsKPiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZoZXZjX3RzZW5zb3I+Owo+ICsK
PiArCQkJdHJpcHMgewo+ICsJCQkJaGV2Y19wYXNzaXZlOiBoZXZjLXBhc3NpdmUgewo+ICsJCQkJ
CXRlbXBlcmF0dXJlID0gPDk1MDAwPjsKPiArCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+Owo+ICsJ
CQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gKwkJCQl9Owo+ICsKPiArCQkJCWhldmNfaG90OiBoZXZj
LWhvdCB7Cj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTA1MDAwPjsKPiArCQkJCQloeXN0ZXJlc2lz
ID0gPDUwMDA+Owo+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CgpbU2V2ZXJpdHk6IE1lZGl1bV0K
U2ltaWxhcmx5LCBzaG91bGQgdGhlIHR5cGUgZm9yIGhldmMtaG90IGJlICJob3QiIHJhdGhlciB0
aGFuICJwYXNzaXZlIj8KCj4gKwkJCQl9OwoKWyAuLi4gXQoKPiArCQlubmFfdGhlcm1hbDogbm5h
LXRoZXJtYWwgewo+ICsJCQlwb2xsaW5nLWRlbGF5ID0gPDEwMDA+Owo+ICsJCQlwb2xsaW5nLWRl
bGF5LXBhc3NpdmUgPSA8MTAwPjsKPiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZubmFfdHNlbnNv
cj47Cj4gKwo+ICsJCQl0cmlwcyB7Cj4gKwkJCQlubmFfcGFzc2l2ZTogbm5hLXBhc3NpdmUgewo+
ICsJCQkJCXRlbXBlcmF0dXJlID0gPDk1MDAwPjsKPiArCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+
Owo+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gKwkJCQl9Owo+ICsKPiArCQkJCW5uYV9ob3Q6
IG5uYS1ob3Qgewo+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEwNTAwMD47Cj4gKwkJCQkJaHlzdGVy
ZXNpcyA9IDw1MDAwPjsKPiArCQkJCQl0eXBlID0gInBhc3NpdmUiOwoKW1NldmVyaXR5OiBNZWRp
dW1dCkRvZXMgdGhpcyBubmEtaG90IHRyaXAgcG9pbnQgYWxzbyBuZWVkIGl0cyB0eXBlIHVwZGF0
ZWQgdG8gImhvdCIgc28gdGhhdAppdCBiZWhhdmVzIGRpc3RpbmN0bHkgZnJvbSB0aGUgcGFzc2l2
ZSB0cmlwIHBvaW50PwoKPiArCQkJCX07CgpbIC4uLiBdCgo+ICsJCXZwdV90aGVybWFsOiB2cHUt
dGhlcm1hbCB7Cj4gKwkJCXBvbGxpbmctZGVsYXkgPSA8MTAwMD47Cj4gKwkJCXBvbGxpbmctZGVs
YXktcGFzc2l2ZSA9IDwxMDA+Owo+ICsJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnZwdV90c2Vuc29y
PjsKPiArCj4gKwkJCXRyaXBzIHsKPiArCQkJCXZwdV9wYXNzaXZlOiB2cHUtcGFzc2l2ZSB7Cj4g
KwkJCQkJdGVtcGVyYXR1cmUgPSA8OTUwMDA+Owo+ICsJCQkJCWh5c3RlcmVzaXMgPSA8NTAwMD47
Cj4gKwkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKPiArCQkJCX07Cj4gKwo+ICsJCQkJdnB1X2hvdDog
dnB1LWhvdCB7Cj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTA1MDAwPjsKPiArCQkJCQloeXN0ZXJl
c2lzID0gPDUwMDA+Owo+ICsJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CgpbU2V2ZXJpdHk6IE1lZGl1
bV0KSXMgdGhpcyBhbm90aGVyIGluc3RhbmNlIHdoZXJlIHRoZSB2cHUtaG90IHR5cGUgd2FzIGlu
dGVuZGVkIHRvIGJlCiJob3QiIHJhdGhlciB0aGFuICJwYXNzaXZlIj8KCj4gKwkJCQl9OwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTAxNS1hZGQtdGhlcm1hbC10Ny12aW00LXY2LTAtMzdkMWM5NTQzOTBjQGFsaWVsLmZyP3BhcnQ9
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
