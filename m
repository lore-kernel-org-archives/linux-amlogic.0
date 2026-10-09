Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD0BCA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 05:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+cStRVj7UpUCputFH3jOXjGmijh9PFeXHXcdaPuRDs=; b=12NmZmEEodKLxz
	AOd+UV2rdF+VyUlVdj3gG/mT4K5V9npc/DjVRm6CkZIm0FWCqVHmfT8Dt4fl2iqPBoOr7uNFn7cTh
	0AiW5xYmhKVHuOHBElWsuEqTqrYjAIpunV/iMmYQzDOD8O0tElTHXHW3zVoXBlZ6iEg1nWMYUnx7+
	2IF/xerrPtD2UjGnep8Ou0zvHP9hHV5tU2kR4zFaufi2DM2/0gdnH7x6YJ6EeUu+gz3ir9xfKkCxd
	58NwcmQwL0bONg2LhOzgFtu3mhwyLiSomFHltizHcj3cQnu4i3pnVsajkS+G3fXAP2olfPgaFbHWd
	SeDhkIBTSHBgt0zxZxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF35T-00000005XNX-16BK;
	Fri, 09 Oct 2026 05:24:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF35S-00000005XNB-252J
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 05:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA32F602C3;
	Fri,  9 Oct 2026 05:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355401F000FF;
	Fri,  9 Oct 2026 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523445;
	bh=ch475Gc8szlTCbAbKRm+WHgCz16LHkE4huEERl1K+bY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYfiP9qIGmTM7WCbGEM2xUyJXJMzx3AaUOeyhVvLEfQyGikLmVVb93D7Y8i316RVU
	 I52Bh8E/h3qU0XwyT78f27e3FA6mkbi4oPYiWBwCVf8lqg1B2/m72QMmPkwNTCV345
	 x3s8AsRIrNE3g27TUpO20ETXUYO/19aRuweh9Ug9BplY/HnsH98E3jy/rUMFdHC7ej
	 VnV+DnqhaRCPw+psY/t2JOgUaknswcGzUyo0TpxuWw0XGXfCRSlEcZ8EtQ+/LDOJ+W
	 PKCsJIlQYZ9yio13+AnHXtvhI4OdCl3r6oFcAHPAShReNIVwPF0sdmaCIqrylOY4nN
	 EDuZvg83BGG9w==
Message-ID: <sashiko-outbox-164882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-fifo: return a negative error code
 when no irq is found
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261009051724.3134644-1-vulab@iscas.ac.cn>
References: <20261009051724.3134644-1-vulab@iscas.ac.cn>
Date: Fri, 09 Oct 2026 05:24:04 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gc29jOiBtZXNvbjogZGV2
X2VycigpIGNhdXNlcyBsb2cgc3BhbSBvbiBFUFJPQkVfREVGRVIgaW4gYXhnX2ZpZm9fcHJvYmUo
KQotLQoKY29tbWl0IDI2NzAwNmM5NWIzZWQ4ZWQzYWMwZjExY2FiZjNhODEyNWQ3OWJjM2IKQXV0
aG9yOiBIYW90aWFuIFpoYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KCkFTb0M6IG1lc29uOiBheGct
ZmlmbzogcmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZSB3aGVuIG5vIGlycSBpcyBmb3VuZAoK
VGhpcyBjb21taXQgdXBkYXRlcyBheGdfZmlmb19wcm9iZSgpIHRvIHJldHVybiAtRUlOVkFMIHdo
ZW4gb2ZfaXJxX2dldCgpCnJldHVybnMgMC4gUHJldmlvdXNseSwgaXQgcmV0dXJuZWQgMCB3aGlj
aCBjYXVzZWQgdGhlIHByb2JlIHRvIHN1Y2NlZWQKZXJyb25lb3VzbHksIGxlYWRpbmcgdG8gZmFp
bHVyZXMgbGF0ZXIgZHVyaW5nIHJlcXVlc3RfdGhyZWFkZWRfaXJxKCkuCgo+IGRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvbWVzb24vYXhnLWZpZm8uYyBiL3NvdW5kL3NvYy9tZXNvbi9heGctZmlmby5j
Cj4gaW5kZXggNzU5MDkxOTZiNzY5OC4uZmRiZWU0NGY1MTAxYyAxMDA2NDQKPiAtLS0gYS9zb3Vu
ZC9zb2MvbWVzb24vYXhnLWZpZm8uYwo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9heGctZmlmby5j
Cj4gQEAgLTM2NSw3ICszNjUsNyBAQCBpbnQgYXhnX2ZpZm9fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgCWZpZm8tPmlycSA9IG9mX2lycV9nZXQoZGV2LT5vZl9ub2RlLCAw
KTsKPiAgCWlmIChmaWZvLT5pcnEgPD0gMCkgewo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IGdldCBpcnE6ICVkXG4iLCBmaWZvLT5pcnEpOwoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyB1
bmNvbmRpdGlvbmFsbHkgbG9nIGFuIGVycm9yIGV2ZW4gd2hlbiBvZl9pcnFfZ2V0KCkgcmV0dXJu
cwotRVBST0JFX0RFRkVSPwoKSWYgb2ZfaXJxX2dldCgpIHJldHVybnMgLUVQUk9CRV9ERUZFUiAo
LTUxNykgYmVjYXVzZSB0aGUgSVJRIGNvbnRyb2xsZXIgaXMKbm90IHlldCBhdmFpbGFibGUgZHVy
aW5nIGJvb3QsIHRoZSBjb25kaXRpb24gZmlmby0+aXJxIDw9IDAgaXMgdHJ1ZSBhbmQKZGV2X2Vy
cigpIHdpbGwgZ2VuZXJhdGUgbG9nIHNwYW0uCgpTaW5jZSB0aGlzIGVycm9yIGhhbmRsaW5nIGJs
b2NrIGlzIGJlaW5nIHVwZGF0ZWQsIGNvdWxkIHRoaXMgYmUgY2hhbmdlZCB0bwp1c2UgZGV2X2Vy
cl9wcm9iZSgpIGluc3RlYWQ/IFRoaXMgd291bGQgY29ycmVjdGx5IHN1cHByZXNzIGRlZmVycmFs
IGxvZwptZXNzYWdlcywgYXMgaXMgZG9uZSBmb3Igb3RoZXIgcmVzb3VyY2VzIGluIGF4Z19maWZv
X3Byb2JlKCkuCgo+IC0JCXJldHVybiBmaWZvLT5pcnE7Cj4gKwkJcmV0dXJuIGZpZm8tPmlycSA/
OiAtRUlOVkFMOwo+ICAJfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOTA1MTcyNC4zMTM0NjQ0LTEtdnVsYWJAaXNjYXMuYWMu
Y24/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
