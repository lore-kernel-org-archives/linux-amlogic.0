Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD34C5B572
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0+QZU0UYIjacpTr1Pk+naYwjGjb0rl8kMHKQJQWX6Q=; b=JsVC4C8RllnL0M
	rDCCbv3cxDHI467DYglKBC+EEzzhXTanM9iyuujJmnKwBiJdn0WvehSZZ/GUbSHlTqV7b5F1ITvSM
	pKRAwW61/+OU3A/yvO+cS2HpS+UWmujBgFwQ7W9+UgqdMMhRzeA4ebAWyEuaB3VLxR6S99SzPXeVZ
	Y2Rnn5aIn1F1srBahzZ8tP3bB5jKphGjfYHEtH+RmoiDKzrz6ZYowpwjJklznZV5nyWIwQTvy5tWU
	ZgC8u0dFBmS+IiVIl8oR6C4wJ3s8TCODxBDYyVcoEpV+QmUN9cQELixFh9nesq8sq4+TZWi1emyhw
	EnDJ2XrAV7qKrs9aw6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuysY-00000003B89-30i5;
	Fri, 14 Aug 2026 20:51:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuysX-00000003B7h-13OA
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 20:51:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D450600AF;
	Fri, 14 Aug 2026 20:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560FA1F000E9;
	Fri, 14 Aug 2026 20:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786740706;
	bh=0IYOYwNbA/BZ+ifKph8wX7c9viUdBpinxV81JfV7DrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kutsmjbdJj//waNJ/u3uWkelQcLhVYJqTjCMBkH/ia5KfE6A0TogkSU5frpfOAaFJ
	 n0YEsTDwkj/GqZ5xeVuH4gwDFA2SE6/t9KZBUhQxDsr1uAnCSjLCFml8X3A4i87iR5
	 cegpEf+BcQYBuIxfzNj0Yvr3AGoDN1tcdNQNzo2KozfvRJUKqRlmMOC6GYvilCJIBw
	 uSs8o2df0YNNh/tViXOY06lHy1VzxJU6Ih9ngO9OyYzOeg5mTlMKo1gle2oIsKXkAH
	 mPbHu1FXJQd5LCGwZoat4Kkf/9oY7psZyF1nhOTuGWdNNhTxgSoMxC/86yz5Kx7qn0
	 f7XsIIT4TRQCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] drm/vblank: Remove num_crtcs argument from
 drm_vblank_init()
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-hyperv@vger.kernel.org, intel-xe@lists.freedesktop.org, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260814203542.1405135-4-lyude@redhat.com>
References: <20260814203542.1405135-1-lyude@redhat.com>
 <20260814203542.1405135-4-lyude@redhat.com>
Date: Fri, 14 Aug 2026 20:51:45 +0000
Message-Id: <20260814205146.560FA1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBkcm1fdmJsYW5r
X2luaXQoKSByZXR1cm5zIC1FTk9ERVYgY2F1c2luZyBwcm9iZSBmYWlsdXJlcyBpbiBtdWx0aXBs
ZSBkcml2ZXJzCi0tCgotLS0gUGF0Y2ggWzNdOiBbUEFUQ0ggMy81XSBkcm0vdmJsYW5rOiBSZW1v
dmUgbnVtX2NydGNzIGFyZ3VtZW50IGZyb20gZHJtX3ZibGFua19pbml0KCkgLS0tCmNvbW1pdCAw
NDllMWUxNDJmYWNmMmJiZGQ5MmNkOGE4ODQ3YTUzZjZiMThiM2FhCkF1dGhvcjogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCmRybS92Ymxhbms6IFJlbW92ZSBudW1fY3J0Y3MgYXJndW1l
bnQgZnJvbSBkcm1fdmJsYW5rX2luaXQoKQoKVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgbnVtX2Ny
dGNzIGFyZ3VtZW50IGZyb20gZHJtX3ZibGFua19pbml0KCkgYW5kCnVwZGF0ZXMgY2FsbGVycyBh
Y3Jvc3MgdGhlIHRyZWUgdG8gcmVseSBvbiB0aGUgaW50ZXJuYWwgRFJNIGNvdW50IG9mIENSVENz
Cmluc3RlYWQuIFRoZSBjaGFuZ2Ugd2FzIGFwcGxpZWQgbWVjaGFuaWNhbGx5IHVzaW5nIGEgQ29j
Y2luZWxsZSBwYXRjaC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNw
ZWVkX2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9kcnYuYwo+
IGluZGV4IGQ0NTc3NjYzYTFmMGUuLmJhNzg2OTVkMTAxNWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jCj4gQEAgLTIwNSw3ICsyMDUsNyBAQCBzdGF0aWMgaW50
IGFzcGVlZF9nZnhfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+ICAJaWYgKHJldCA8IDAp
Cj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlyZXQgPSBkcm1fdmJsYW5rX2luaXQoZHJtLCAxKTsK
PiArCXJldCA9IGRybV92YmxhbmtfaW5pdChkcm0pOwoKW1NldmVyaXR5OiBDcml0aWNhbF0KV2ls
bCB0aGlzIGNhdXNlIGEgcHJvYmUgcmVncmVzc2lvbiBmb3IgdGhpcyBkcml2ZXI/CgpCeSByZW1v
dmluZyB0aGUgZXhwbGljaXQgQ1JUQyBjb3VudCwgZHJtX3ZibGFua19pbml0KCkgbm93IHJlbGll
cyBvbiB0aGUKRFJNIGRldmljZSdzIGludGVybmFsIENSVEMgbGlzdCBiZWluZyBwb3B1bGF0ZWQu
IEhvd2V2ZXIsIGFzcGVlZF9nZnhfbG9hZCgpCmNhbGxzIGRybV92YmxhbmtfaW5pdCgpIGJlZm9y
ZSBjYWxsaW5nIGFzcGVlZF9nZnhfY3JlYXRlX3BpcGUoKSwgd2hpY2ggaXMKd2hlcmUgdGhlIENS
VEMgaXMgYWN0dWFsbHkgY3JlYXRlZC4KCkJlY2F1c2UgdGhlIENSVEMgbGlzdCBpcyBlbXB0eSBh
dCB0aGlzIHBvaW50LCBkcm1fdmJsYW5rX2luaXQoKSB3aWxsCnJldHVybiAtRU5PREVWIGFuZCBm
YWlsIHRoZSBwcm9iZS4KCj4gIAlpZiAocmV0IDwgMCkgewo+ICAJCWRldl9lcnIoZHJtLT5kZXYs
ICJGYWlsZWQgdG8gaW5pdGlhbGlzZSB2YmxhbmtcbiIpOwo+ICAJCXJldHVybiByZXQ7Cgo+IFsg
Li4uIF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNh
cl9kdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMu
Ywo+IGluZGV4IDkyMjhhN2FkMGRmYTQuLmM5ZTI5ZGE1M2QwNTYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gQEAgLTg4OCw3ICs4ODgs
NyBAQCBpbnQgcmNhcl9kdV9tb2Rlc2V0X2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNlICpyY2R1
KQo+ICAJICogSW5pdGlhbGl6ZSB2ZXJ0aWNhbCBibGFua2luZyBpbnRlcnJ1cHRzIGhhbmRsaW5n
LiBTdGFydCB3aXRoIHZibGFuawo+ICAJICogZGlzYWJsZWQgZm9yIGFsbCBDUlRDcy4KPiAgCSAq
Lwo+IC0JcmV0ID0gZHJtX3ZibGFua19pbml0KGRldiwgcmNkdS0+bnVtX2NydGNzKTsKPiArCXJl
dCA9IGRybV92YmxhbmtfaW5pdChkZXYpOwoKW1NldmVyaXR5OiBDcml0aWNhbF0KRG9lcyB0aGlz
IGludHJvZHVjZSBhIHNpbWlsYXIgcmVncmVzc2lvbiBmb3IgcmNhci1kdT8KClRoZSBkcml2ZXIg
Y2FsbHMgZHJtX3ZibGFua19pbml0KCkgaGVyZSwgYnV0IHRoZSBDUlRDcyBhcmUgbm90IGNyZWF0
ZWQKdW50aWwgdGhlIHJjYXJfZHVfY3J0Y19jcmVhdGUoKSBsb29wIGZ1cnRoZXIgZG93bi4gVGhp
cyBtZWFucwpkcm1fdmJsYW5rX2luaXQoKSB3aWxsIHNlZSBhbiBlbXB0eSBDUlRDIGxpc3QgYW5k
IGZhaWwgd2l0aCAtRU5PREVWLgoKPiAgCWlmIChyZXQgPCAwKQo+ICAJCXJldHVybiByZXQ7Cgo+
IFsgLi4uIF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCj4gaW5kZXggNWE2NDBiNTMxZDg4Zi4u
NWE4MzBjZWU3ZmU5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Ry
di5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwo+IEBAIC0xOTIsOCAr
MTkyLDcgQEAgaW50IHZrbXNfY3JlYXRlKHN0cnVjdCB2a21zX2NvbmZpZyAqY29uZmlnKQo+ICAJ
CWdvdG8gb3V0X2RldnJlczsKPiAgCX0KPiAgCj4gLQlyZXQgPSBkcm1fdmJsYW5rX2luaXQoJnZr
bXNfZGV2aWNlLT5kcm0sCj4gLQkJCSAgICAgIHZrbXNfY29uZmlnX2dldF9udW1fY3J0Y3MoY29u
ZmlnKSk7Cj4gKwlyZXQgPSBkcm1fdmJsYW5rX2luaXQoJnZrbXNfZGV2aWNlLT5kcm0pOwoKW1Nl
dmVyaXR5OiBDcml0aWNhbF0KQ2FuIHRoaXMgbGVhZCB0byBhIGNvbXBsZXRlIGluaXRpYWxpemF0
aW9uIGZhaWx1cmUgZm9yIHZrbXM/CgpUaGUgY2FsbCB0byBkcm1fdmJsYW5rX2luaXQoKSBvY2N1
cnMgYmVmb3JlIHZrbXNfbW9kZXNldF9pbml0KCksIG1lYW5pbmcKdGhlIHBpcGVsaW5lIGNvbXBv
bmVudHMgaGF2ZSBub3QgYmVlbiBjcmVhdGVkIHlldCBhbmQgdGhlIGludGVybmFsIENSVEMKY291
bnQgaXMgemVyby4KCj4gIAlpZiAocmV0KSB7Cj4gIAkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gdmJs
YW5rXG4iKTsKPiAgCQlnb3RvIG91dF9kZXZyZXM7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODE0MjAzNTQyLjE0MDUxMzUtMS1s
eXVkZUByZWRoYXQuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
