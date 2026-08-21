Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659FFC5DF7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNBqvj7/tTk4ug0rDbE24vfAi//OAbioIZjam9Fg/J0=; b=ZRJ3CZyctTRUwE
	tAPEKHVRCCGF7JFDBCP/YGw9vl4mozBNz54ZjqHo9act0tly7IA3vYar7I0dFnSrd16Y7yHkKlk4O
	nV6w9ZhWylgH4TuFluRULeImDiF1+g2ayJO9OH3YbnpBc6yhuOOaITWlWECRIqzVW3pivHbwATfaX
	qtvoFx1tWv1cfiEhasKWGD5kE7tuOu2EMtolbogiWbpFHNUR8ntCE4OKV8VK6zI9HVeQ/1ou2pGtF
	75a0UHU44n6IEjJYQkulR8yBTxqv3a3/yBqv/3yDyF+2n6/4XXJ8ECgiVPxXWscV+BFo376jWWydS
	9u9L2hwIybN1cxFidCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMKM-0000000D57U-2f7E;
	Fri, 21 Aug 2026 10:18:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMKL-0000000D57M-3M1o
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 10:18:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 384CF41B06;
	Fri, 21 Aug 2026 10:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D012A1F000E9;
	Fri, 21 Aug 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307501;
	bh=whinKhOnbBpFaLiJHM5JFGDjF73h4ClZ7n5vppHJv8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XogmDiCDZCbN29RyE+PEREi0zxt3OlYeYf3yJGtNU/mNla/0qeQeqoLvO5Y3tGWK+
	 BtBG6dv27MM//JfJLrYeTD76+K8hl3P6nCGgUjYyHGAapkviNRBiFt0mTt21Jw0I/f
	 z5SAOC3IhuK595CAvZN+5M7hNLd1jM0F7NR2bj2bK87f+iy0LDicTDz/FFH1xE8vWQ
	 zT4ntlyswSHh9OFvtEVU3AtkZ64AJTEBn4jQMl1114xe2mh7g1ReqaoO+shNCCG7Dp
	 hGyutxET2Xb3CDZSKsi3C1sB2ayg6jJNbioJV6uBNKkenI9J/pIDEyxTu71Q39JZP/
	 za76CqE4hTG3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mmc: meson-gx: FIXME: Make sure clk_init_data is
 fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <4b9a377a810b69a4eb885fc00cb34ef63e7fc1f1.1787240090.git.geert+renesas@glider.be>
Date: Fri, 21 Aug 2026 10:18:20 +0000
Message-Id: <20260821101820.D012A1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBVbmluaXRpYWxpemVkIHNwaW5sb2NrIGFjY2VzcyBpbiBpbnRlcnJ1cHQgaGFuZGxl
cgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIDEvMl0gbW1jOiBtZXNvbi1neDogRklYTUU6IE1h
a2Ugc3VyZSBjbGtfaW5pdF9kYXRhIGlzIGZ1bGx5IGluaXRpYWxpemVkIC0tLQpjb21taXQgMjAz
Njg4MjE0NDRmNjU0ZjExNjVjNThjMDgxNjI4M2EzNzc0ZDM3NgpBdXRob3I6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgptbWM6IG1lc29uLWd4OiBGSVhNRTog
TWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQKClRoaXMgY29tbWl0
IGZ1bGx5IGluaXRpYWxpemVzIHRoZSBjbGtfaW5pdF9kYXRhIHN0cnVjdHVyZSB0byBhdm9pZCBz
dWJ0bGUKaW5pdGlhbGl6YXRpb24gaXNzdWVzLiBCeSBlbnN1cmluZyBhbGwgbWVtYmVycyBhcmUg
emVyb2VkLCBpdCBwcmV2ZW50cyBidWdzCndoZW4gc3BlY2lmaWMgc3RhY2sgaW5pdGlhbGl6YXRp
b24gY29uZmlncyBhcmUgZW5hYmxlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qv
bWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gaW5kZXgg
Njk0YmI0NDNkNWYzZi4uNjk4ZmViZGNkNDk4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21tYy9o
b3N0L21lc29uLWd4LW1tYy5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMu
Ywo+IEBAIC00MTgsNyArNDE4LDcgQEAgc3RhdGljIGludCBtZXNvbl9tbWNfY2xrX3NldChzdHJ1
Y3QgbWVzb25faG9zdCAqaG9zdCwgdW5zaWduZWQgbG9uZyByYXRlLAo+ICAgKi8KPiAgc3RhdGlj
IGludCBtZXNvbl9tbWNfY2xrX2luaXQoc3RydWN0IG1lc29uX2hvc3QgKmhvc3QpCj4gIHsKPiAt
CXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7Cj4gKwlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0
ID0ge307Cj4gIAlzdHJ1Y3QgY2xrX211eCAqbXV4Owo+ICAJc3RydWN0IGNsa19kaXZpZGVyICpk
aXY7Cj4gIAljaGFyIGNsa19uYW1lWzMyXTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHBy
ZS1leGlzdGluZyBpc3N1ZSwgYnV0IEkgbm90aWNlZCBhIHBvdGVudGlhbCBwcm9ibGVtIGluIGhv
dyB0aGUKaW50ZXJydXB0IGhhbmRsZXIgaXMgcmVnaXN0ZXJlZCByZWxhdGl2ZSB0byBsb2NrIGlu
aXRpYWxpemF0aW9uIGluIHRoaXMgZHJpdmVyLgoKSW4gZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1n
eC1tbWMuYzptZXNvbl9tbWNfcHJvYmUoKSwgdGhlIGludGVycnVwdCBpcwpyZXF1ZXN0ZWQgYmVm
b3JlIHRoZSBzcGlubG9jayBpcyBpbml0aWFsaXplZDoKCglyZXQgPSByZXF1ZXN0X3RocmVhZGVk
X2lycShob3N0LT5pcnEsIG1lc29uX21tY19pcnEsCgkJCQkgICBtZXNvbl9tbWNfaXJxX3RocmVh
ZCwgSVJRRl9PTkVTSE9ULAoJCQkJICAgZGV2X25hbWUoJnBkZXYtPmRldiksIGhvc3QpOwoJaWYg
KHJldCkKCQlnb3RvIGVycl9pbml0X2NsazsKCglzcGluX2xvY2tfaW5pdCgmaG9zdC0+bG9jayk7
CgpJZiBhbiBpbnRlcnJ1cHQgZmlyZXMgaW1tZWRpYXRlbHkgdXBvbiByZWdpc3RyYXRpb24sIHRo
ZSBpbnRlcnJ1cHQgaGFuZGxlcgpjYW4gYmVnaW4gZXhlY3V0aW9uIGFuZCBhdHRlbXB0IHRvIGFj
cXVpcmUgdGhlIHVuaW5pdGlhbGl6ZWQgbG9jazoKCmRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gt
bW1jLmM6bWVzb25fbW1jX2lycSgpIHsKCS4uLgoJaWYgKHN0YXR1cyAmIElSUV9TRElPKSB7CgkJ
c3Bpbl9sb2NrKCZob3N0LT5sb2NrKTsKCQlfX21lc29uX21tY19lbmFibGVfc2Rpb19pcnEoaG9z
dC0+bW1jLCAwKTsKCQlzZGlvX3NpZ25hbF9pcnEoaG9zdC0+bW1jKTsKCQlzcGluX3VubG9jaygm
aG9zdC0+bG9jayk7CgkuLi4KfQoKQ291bGQgdGhpcyByZXN1bHQgaW4gYSBsb2NrZGVwIHdhcm5p
bmcgb3Iga2VybmVsIG9vcHMgaWYgYSBzcHVyaW91cyBpbnRlcnJ1cHQKb3IgcGVuZGluZyBoYXJk
d2FyZSBldmVudCB0cmlnZ2VycyBiZWZvcmUgc3Bpbl9sb2NrX2luaXQoKSBjb21wbGV0ZXM/Cgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2Nv
dmVyLjE3ODcyNDAwOTAuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlP3BhcnQ9MQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
