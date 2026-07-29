Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09029C53219
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gI0dZ702RfxVfmqI7lOZ/olBW+gS7a+yvfJ+p8d7TY=; b=tIc6Pe49ViFQN6
	/z0Tg2yDODuTb4wCDBu5HxdXV0O1JrsC0i5scNhQN9JlcP4AJquwPOXv2wWamUGyz/uAl3Q0PW1XE
	KMNK4SDilAsR/FsqwjJsIe5i2zz6LhHXGv+9zSZ3CySdgNUjAnY1PFaajuUOlOX/l1QvIchqvYsrV
	DoOvhtUKN3rO0awLgtHtLN79NwImH51nxxqHAhKmEOSHJhycPJCvZVAMkarmj0iOC7NowS0D2dUVg
	T5RZcWuTxwLYW8gnsz1lo3eKtqF4bPoz207GOQ/ATc36Zqs4ffz3XW6vGZmeLSNEPiU4TYEbFzjRI
	EkZpsJSKywvIUyhDz5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6KD-00000008Qk6-3xoL;
	Wed, 29 Jul 2026 15:36:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6KD-00000008Qjc-1bvY
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 15:36:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B1A26001D;
	Wed, 29 Jul 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34521F000E9;
	Wed, 29 Jul 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785339364;
	bh=FwSV2//29NDzEKOpMLAG4UFiCJY5x7hfxfKALs2kUFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ien1YajQEz5i6Dg7g8ubmh7UsB/b+sM42JTIIvCN52GHOVR2SDnAjFQzafPPIXFgZ
	 ocRi2vCXvlzK4DdAnhJs54s4DiCwiiPzPAEw9awTz/gMoMy2+9KT6rjwUqjUm6DM50
	 ZFbycWaETMEZqPa2jBtEJO6VabLoFWjP9+qBuy6YHoLsdVGor66bXLR7rngnaU+Fs1
	 GGL1UVwbNCRaaHE5U0SMMGcXOealsWQ2dXRXTPLctSnMvJmRk3IjdHVLhUM+sY2GLm
	 /g6MOAOlpoKrHzX2fJHXr/0ZCMt029iRjHKryHcOKFYclxobg8ApAWWik5Q08FXWkK
	 9KH3Hjio+/FyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/15] media: meson-ir-tx: Ensure clock is disabled
 on unbind
To: "Sean Young" <sean@mess.org>
Cc: linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <0a0066a531aedbcb18620cac5897cb91c78a5188.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
 <0a0066a531aedbcb18620cac5897cb91c78a5188.1785338381.git.sean@mess.org>
Date: Wed, 29 Jul 2026 15:36:03 +0000
Message-Id: <20260729153603.F34521F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtNZWRpdW1d
IFRoZSBjbG9jayBpcyBhdXRvbWF0aWNhbGx5IGRpc2FibGVkIG9uIHVuYmluZCB2aWEgZGV2cmVz
LCBidXQgdGhlIGhhcmR3YXJlIGlzIG5vdCBncmFjZWZ1bGx5IHNodXQgZG93biBmaXJzdCwgdmlv
bGF0aW5nIHRoZSBoYXJkd2FyZSBzdGF0ZSBtYWNoaW5lLgoKUHJlLWV4aXN0aW5nIGlzc3VlczoK
LSBbSGlnaF0gVGhlIGRyaXZlciBvdmVyd3JpdGVzIGdlbnVpbmUgZXJyb3IgY29kZXMgKGluY2x1
ZGluZyAtRVBST0JFX0RFRkVSKSB3aXRoIGEgaGFyZGNvZGVkIC1FTk9ERVYsIGJyZWFraW5nIGRl
ZmVycmVkIHByb2JpbmcuCi0tCgotLS0gUGF0Y2ggWzddOiBbUEFUQ0ggdjUgMDcvMTVdIG1lZGlh
OiBtZXNvbi1pci10eDogRW5zdXJlIGNsb2NrIGlzIGRpc2FibGVkIG9uIHVuYmluZCAtLS0KY29t
bWl0IGVkMzcwNDAwNjFmMjI1NzM3NmZkOTU1YmEyY2QwMGQwNGE0NjcxOWMKQXV0aG9yOiBTZWFu
IFlvdW5nIDxzZWFuQG1lc3Mub3JnPgoKICAgIG1lZGlhOiBtZXNvbi1pci10eDogRW5zdXJlIGNs
b2NrIGlzIGRpc2FibGVkIG9uIHVuYmluZAogICAgClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIG1l
c29uLWlyLXR4IGRyaXZlciB0byB1c2UgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBzbwp0aGF0IHRo
ZSBjbG9jayBpcyBhdXRvbWF0aWNhbGx5IGRpc2FibGVkIGR1cmluZyBkcml2ZXIgdW5iaW5kLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jIGIvZHJpdmVycy9t
ZWRpYS9yYy9tZXNvbi1pci10eC5jCj4gaW5kZXggZmRlZDJjMjU2ZjJhNi4uZTdiYjEwN2U2YTg0
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLXR4LmMKPiArKysgYi9k
cml2ZXJzL21lZGlhL3JjL21lc29uLWlyLXR4LmMKPiBAQCAtMjg4LDggKzI4OCw4IEBAIHN0YXRp
YyBpbnQgbWVzb25faXJ0eF9tb2RfY2xvY2tfcHJvYmUoc3RydWN0IG1lc29uX2lydHggKmlyLAo+
ICAJaWYgKCFucCkKPiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAgCj4gLQljbG9jayA9IGRldm1fY2xr
X2dldChpci0+ZGV2LCAieHRhbCIpOwo+IC0JaWYgKElTX0VSUihjbG9jaykgfHwgY2xrX3ByZXBh
cmVfZW5hYmxlKGNsb2NrKSkKPiArCWNsb2NrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoaXItPmRl
diwgInh0YWwiKTsKPiArCWlmIChJU19FUlIoY2xvY2spKQo+ICAJCXJldHVybiAtRU5PREVWOwoK
W1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyBy
ZXR1cm5pbmcgLUVOT0RFViBoZXJlIGluCm1lc29uX2lydHhfbW9kX2Nsb2NrX3Byb2JlKCkgb3Zl
cndyaXRlIHRoZSBhY3R1YWwgZXJyb3IgY29kZSByZXR1cm5lZCBieQpkZXZtX2Nsa19nZXRfZW5h
YmxlZCgpLCBzdWNoIGFzIC1FUFJPQkVfREVGRVI/CgpJZiB0aGUgY2xvY2sgcHJvdmlkZXIgaXMg
bm90IHlldCByZWFkeSwgcmV0dXJuaW5nIC1FTk9ERVYgaW5zdGVhZCBvZgpwcm9wYWdhdGluZyB0
aGUgZXJyb3IgY29kZSBjb3VsZCBwZXJtYW5lbnRseSBmYWlsIHRvIHByb2JlIGluc3RlYWQgb2YK
ZGVmZXJyaW5nLiBBIHNpbWlsYXIgb3ZlcnJpZGUgaGFwcGVucyBpbiBtZXNvbl9pcnR4X3Byb2Jl
KCkgd2l0aApwbGF0Zm9ybV9nZXRfaXJxKCkuCgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2l0aCBkZXZt
X2Nsa19nZXRfZW5hYmxlZCgpLCB0aGUgY2xvY2sgaXMgYXV0b21hdGljYWxseSBkaXNhYmxlZCBv
biB1bmJpbmQgdmlhCmRldnJlcy4KCklzIGl0IHNhZmUgdG8gZGlzYWJsZSB0aGUgY2xvY2sgd2l0
aG91dCBmaXJzdCBzaHV0dGluZyBkb3duIHRoZSBoYXJkd2FyZSBibG9jaz8KClRoZSBkcml2ZXIg
Y29uZmlndXJlcyB0aGUgaGFyZHdhcmUgaW4gbWVzb25faXJ0eF9wcm9iZSgpLCBidXQgc2luY2Ug
dGhlcmUgaXMKbm8gLnJlbW92ZSBjYWxsYmFjayBpbiBtZXNvbl9pcnR4X3BkIChvciBhIGNvcnJl
c3BvbmRpbmcgZGV2bSBhY3Rpb24pIHRvCmdyYWNlZnVsbHkgc2h1dCBkb3duIHRoZSBoYXJkd2Fy
ZSwgaXQgaXMgbGVmdCBydW5uaW5nLiBEaXNhYmxpbmcgdGhlIGNsb2NrCndoaWxlIHRoZSBoYXJk
d2FyZSBpcyBzdGlsbCBhY3RpdmUgbWlnaHQgZnJlZXplIHRoZSBoYXJkd2FyZSBibG9jayBvciBj
YXVzZQpidXMgbG9ja3VwcyB3aGVuIHRoZSBkcml2ZXIgaXMgdW5ib3VuZC4KCj4gIAo+ICAJKmNs
a19uciA9IElSQl9NT0RfWFRBTDNfQ0xLOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzg1MzM4MzgxLmdpdC5zZWFuQG1lc3Mu
b3JnP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
