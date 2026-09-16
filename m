Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903DCC982C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck56R309r/RNv3OSv9mGNC82+c/d3h2jyFahkEyaDio=; b=Obyk/ylAtj1JLp
	b7KA6r7OKD8gqxo1kdyICgo3o/U34ks6IAxqdbW9jRrCuxaILNDevmei8szclcc1pDydcDgIvjaer
	1p0bqLl/09nYIllsFljNAyeXyL9+Yh8tk8M0GY0KFSx+khLjeUXFB0Gc9jbix0opOAWDcNMuYIJuF
	4tjbIwQZWphV487WJXI1t+gYa3fs1IlrA8XtmpzGMq4cQ2YN8CH1zW+wYYVifsCBvgNkGGjBmXHcT
	C1XesNmvv+wuJ8Pw/bKEFfR5qUp3VjM5PoQd/3mkkgMRQ9M+67gqTPuaDyQiOZn3fTxrmoXx63tCv
	aRk+HEFzoz75EW4heyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6roW-00000009d5d-3QLn;
	Wed, 16 Sep 2026 15:44:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6roV-00000009d5E-3NUr
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 15:44:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CA98602CB;
	Wed, 16 Sep 2026 15:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0F41F00893;
	Wed, 16 Sep 2026 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789573486;
	bh=BPzk9NwliEa9sfFgpXlFtEI0oR9PWk91X6hIlRRihWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nhQkwQJWCl7BDbtksWRDD3ugdXIkVIzh4q/yMnyCW8fVqtzANxjMneO9keERPveh7
	 2hYLp3fx8mxaD4P+u3yY3rU0iWbdPkJEeG7oyHU4WXFJvkujxUolOcik7r61OEZli/
	 IeiTUWrW1s4yiizAxQ3z4WGcMK+WK1zaggHpDw6gFSkrnPM/GGNMYxzcylcsmyBTGn
	 jXKN0MTlk9ahKtYHyOvS0Vbn4T93EcXK3R3H9xn/4f6jcF0yIoSWtJE6Ux6xHWhdO6
	 j9xJbOkD4gLF7wLdR7zmlZPty3c5McwLZGOeYIqYfJZAJJgZUx/VYBxffaDXi6pRJO
	 r3S25f00rQj/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] PCI: dwc: Remove redundant MPS configuration
To: "Hans Zhang" <18255117159@163.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260916153907.60344-4-18255117159@163.com>
References: <20260916153907.60344-1-18255117159@163.com>
 <20260916153907.60344-4-18255117159@163.com>
Date: Wed, 16 Sep 2026 15:44:46 +0000
Message-Id: <20260916154446.8F0F41F00893@smtp.kernel.org>
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

PiBUaGUgTWVzb24gUENJZSBjb250cm9sbGVyIGRyaXZlciBtYW51YWxseSBjb25maWd1cmVzIG1h
eGltdW0gcGF5bG9hZAo+IHNpemUgKE1QUykgdGhyb3VnaCBtZXNvbl9zZXRfbWF4X3BheWxvYWQs
IGR1cGxpY2F0aW5nIGZ1bmN0aW9uYWxpdHkgbm93Cj4gY2VudHJhbGl6ZWQgaW4gdGhlIFBDSSBj
b3JlLiAgRGVwcmVjYXRpbmcgcmVkdW5kYW50IGNvZGUgc2ltcGxpZmllcyB0aGUKPiBkcml2ZXIg
YW5kIGFsaWducyBpdCB3aXRoIHRoZSBjb25zb2xpZGF0ZWQgTVBTIG1hbmFnZW1lbnQgc3RyYXRl
Z3ksCj4gaW1wcm92aW5nIGxvbmctdGVybSBtYWludGFpbmFiaWxpdHkuCj4gCj4gV2l0aCBtZXNv
bl9zZXRfbWF4X3BheWxvYWQoKSBnb25lLCBtZXNvbl9zaXplX3RvX3BheWxvYWQoKSBpcyBvbmx5
IHVzZWQKPiBmb3IgTVJSUy4gIFJlbmFtZSBpdCB0byBtZXNvbl9zaXplX3RvX21ycnMoKSwgdXBk
YXRlIHRoZSB3YXJuaW5nIG1lc3NhZ2UsCj4gYW5kIGRyb3AgdGhlIG5vdy11bnVzZWQgUENJRV9D
QVBfTUFYX1BBWUxPQURfU0laRSBhbmQgTUFYX1BBWUxPQURfU0laRQo+IG1hY3Jvcy4KPiAKPiBS
ZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4KClNhc2hpa28gaGFz
IHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQh
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwOTE2MTUzOTA3LjYwMzQ0LTEtMTgyNTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTMKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
