Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5EC5DF7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkwnMZidHWDgFlVSCVHx1nOYTc3sFV/xx2yEa1P1IO4=; b=3RUq9MhloHFZZ2
	9F9sOWYpLhverl//88IMHIyrUTo7n8uL1nn5Esj+Bo9zH7isHj7o8m9fhWpMiaY5LwS9iVDRQxyml
	qTfxPacdRuyZDkhZlKocsqZgCNaOSWKsHs+B2PBLihaDohgWV9SRkS2Ou85AUChE7zIVgzChlC4+v
	GC5fWymzNmurRMw10EtE9lL7U73FOTdAQtprvre1xC8Cqy0zRfda9/AtPeZpIYkVmdpWaJafwbFz2
	fcfzDF5NfySfWwb/U0xj/A1dra5kZ7M8pkhpf7uWHm0U9Q1KmkX/n72t1XF9a2Y9139IHFBb0PtOa
	Rw/0FMBfv5RBaIcYO1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMHE-0000000D4ZO-0jb5;
	Fri, 21 Aug 2026 10:15:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMHA-0000000D4Yf-0w0S
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 10:15:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9176F60DB6;
	Fri, 21 Aug 2026 10:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29471F000E9;
	Fri, 21 Aug 2026 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307303;
	bh=qC59Yc1xbdYmOehKc5dawCJSVC2bdsfspeH6AOhNNQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JwRWFDcP1xt1/3t5+wZeVp8ZNlPD/MM0duA9tfCkKHurX5/kBcYopX/J/npRTQVPC
	 cA/IwlGW/ctcPKyj6OR9Jif3XLjr+rePwaIDEfVOSB30FqVE/zGpagCi/LEBBw5qZq
	 5Knaj97rL4WkrxZt87HAr5KJk663iLrPKipJCdQAXDQUq5+RmKSXQX9uWlyAkRtpIL
	 /vpZXvBkiLRYXGBIXYrNVuiTVzEeuuont7u16H8U8UXF29dpEWSGKp3MkxGf7B4EO1
	 /SUBNys+Czl6M1627CfdTaArUWqT1CsvT6gGT+1CU3uFPbGHqjDt0DwUFCi5JI854w
	 3SuXQMUpZEdnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] media: samsung: exynos4-is: Make sure clk_init_data
 is fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
References: <cover.1787240035.git.geert+renesas@glider.be>
 <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
Date: Fri, 21 Aug 2026 10:15:02 +0000
Message-Id: <20260821101502.F29471F000E9@smtp.kernel.org>
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
IFtIaWdoXSBEb3VibGUgZnJlZSBhbmQgdXNlLWFmdGVyLWZyZWUgb2YgZGV2aWNlIG5vZGUgcmVm
ZXJlbmNlcyBpbiBPRiBpdGVyYXRvciBsb29wLgotLQoKLS0tIFBhdGNoIFszXTogW1BBVENIIDMv
M10gbWVkaWE6IHNhbXN1bmc6IGV4eW5vczQtaXM6IE1ha2Ugc3VyZSBjbGtfaW5pdF9kYXRhIGlz
IGZ1bGx5IGluaXRpYWxpemVkIC0tLQpjb21taXQgZjNhMTBhZDg5MTI0M2Q5Yjg5N2FlZDE3NTM3
MDc3YThiYjg3MjViYwpBdXRob3I6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+CgogICAgbWVkaWE6IHNhbXN1bmc6IGV4eW5vczQtaXM6IE1ha2Ugc3VyZSBjbGtf
aW5pdF9kYXRhIGlzIGZ1bGx5IGluaXRpYWxpemVkCiAgICAKICAgIFRoZSBjbGtfaW5pdF9kYXRh
IHN0cnVjdHVyZSBjb250YWlucyBtdXR1YWxseS1leGNsdXNpdmUgbWVtYmVycyBmb3IKICAgIHNw
ZWNpZnlpbmcgY2xvY2sgcGFyZW50cy4gVGhpcyBjb21taXQgZW5zdXJlcyBhbGwgbWVtYmVycyBh
cmUgZnVsbHkKICAgIGluaXRpYWxpemVkIHRvIHplcm8sIHByZXZlbnRpbmcgc3VidGxlIGJ1Z3Mg
d2l0aCB1bmluaXRpYWxpemVkIGRhdGEuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3NhbXN1bmcvZXh5bm9zNC1pcy9tZWRpYS1kZXYuYyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vc2Ftc3VuZy9leHlub3M0LWlzL21lZGlhLWRldi5jCj4gaW5kZXggMmUwOGM0NDM1ODU5
ZS4uNjM4YmFiZjUyODIyMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Nh
bXN1bmcvZXh5bm9zNC1pcy9tZWRpYS1kZXYuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vc2Ftc3VuZy9leHlub3M0LWlzL21lZGlhLWRldi5jCj4gQEAgLTEzMTMsNyArMTMxMyw3IEBA
IHN0YXRpYyBpbnQgZmltY19tZF9yZWdpc3Rlcl9jbGtfcHJvdmlkZXIoc3RydWN0IGZpbWNfbWQg
KmZtZCkKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgRklNQ19NQVhfQ0FNQ0xLUzsgaSsrKSB7Cj4g
IAkJc3RydWN0IGNhbV9jbGsgKmNhbWNsayA9ICZjcC0+Y2FtY2xrW2ldOwo+IC0JCXN0cnVjdCBj
bGtfaW5pdF9kYXRhIGluaXQ7Cj4gKwkJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Owo+
ICAJCWNvbnN0IGNoYXIgKnBfbmFtZTsKPiAgCj4gIAkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF9z
dHJpbmdfaW5kZXgoZGV2LT5vZl9ub2RlLAoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJl
LWV4aXN0aW5nIGlzc3VlLCBidXQgSSBub3RpY2VkIGEgcG90ZW50aWFsIGRvdWJsZS1mcmVlIG9m
IGRldmljZQpub2RlIHJlZmVyZW5jZXMgZWxzZXdoZXJlIGluIHRoaXMgZmlsZS4KCkxvb2tpbmcg
YXQgZmltY19tZF9wYXJzZV9wb3J0X25vZGUoKSwgaXQgaXRlcmF0ZXMgb3ZlciBjaGlsZCBub2Rl
cyB1c2luZyB0aGUKc2NvcGVkIGl0ZXJhdG9yIG1hY3JvOgoKZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9zYW1zdW5nL2V4eW5vczQtaXMvbWVkaWEtZGV2LmM6ZmltY19tZF9wYXJzZV9wb3J0X25vZGUo
KSB7CiAgICAuLi4KCWZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKHBvcnQsIGVwKSB7CgkJ
cmV0ID0gZmltY19tZF9wYXJzZV9vbmVfZW5kcG9pbnQoZm1kLCBlcCk7CgkJaWYgKHJldCA8IDAp
CgkJCXJldHVybiByZXQ7Cgl9CiAgICAuLi4KfQoKVGhpcyBtYWNybyBhdXRvbWF0aWNhbGx5IG1h
bmFnZXMgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBmb3IgZXAsIGRyb3BwaW5nIGl0CmltcGxpY2l0
bHkgd2hlbiB0aGUgbG9vcCBhZHZhbmNlcyBvciBleGl0cy4KCkhvd2V2ZXIsIGluc2lkZSBmaW1j
X21kX3BhcnNlX29uZV9lbmRwb2ludCgpLCB0aGUgY29kZSBleHBsaWNpdGx5IGNhbGxzCm9mX25v
ZGVfcHV0KGVwKSBvbiBhbGwgcGF0aHM6Cgpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3NhbXN1bmcv
ZXh5bm9zNC1pcy9tZWRpYS1kZXYuYzpmaW1jX21kX3BhcnNlX29uZV9lbmRwb2ludCgpIHsKICAg
IC4uLgoJYXNkID0gdjRsMl9hc3luY19uZl9hZGRfZndub2RlX3JlbW90ZSgmZm1kLT5zdWJkZXZf
bm90aWZpZXIsCgkJCQkJICAgICAgb2ZfZndub2RlX2hhbmRsZShlcCksCgkJCQkJICAgICAgc3Ry
dWN0IHY0bDJfYXN5bmNfY29ubmVjdGlvbik7CgoJb2Zfbm9kZV9wdXQoZXApOwogICAgLi4uCn0K
CkJlY2F1c2UgdGhlIHJlZmVyZW5jZSBpcyBhbHJlYWR5IGRyb3BwZWQgaW4gdGhlIGhlbHBlciBm
dW5jdGlvbiwgd291bGRuJ3QgdGhlCnN1YnNlcXVlbnQgcHV0IGJ5IHRoZSBpdGVyYXRvcidzIGxv
b3AgYWR2YW5jZSBvciBzY29wZSBleGl0IHJlc3VsdCBpbiBhCmRvdWJsZS1mcmVlIGFuZCBhIHVz
ZS1hZnRlci1mcmVlIG9mIHRoZSBkZXZpY2Ugbm9kZT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4NzI0MDAzNS5naXQuZ2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
