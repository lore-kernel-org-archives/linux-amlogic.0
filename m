Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48D0C79F82
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jymJd2KiF4Ibt8V6YEcOHHbpcfaM5N86Lx+qCI9YrZU=; b=l1Ftm74ClvmF6F
	vAa/p7r4ozYPF5GZqs9hAEFtKZbsOWAWBkwQxKNGfSNYlxDgtYXrIb4i5JJcAPLOa4aB5+2EbP8AT
	L45apBomPbGsPA5qyiTlJKozOwt2uyFVAqswYRnJlQYjzCNHzy/T/VPr/zf4C/FnKbh621IoRkPCh
	hsiraweRVXXscdmD37o2sYVxd8ZZGMdnFuB0pI7CMQuMb2oXTLF6dcuUAMGHnp7CrAAu7fOba2PDI
	7K4Cw3CF7yAk8/ycZAn+/P6OXMxle94TqF4xdxKIEvDNTG1aESmLV4Ip0rJ89xgZpLBycHIIBjVIz
	iCTNACmefETD7aNsR5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yey-00000009fNO-2Usl;
	Tue, 08 Sep 2026 16:27:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yex-00000009fMl-0A6q
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 16:26:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FC40601DE;
	Tue,  8 Sep 2026 16:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1391F00A3A;
	Tue,  8 Sep 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884818;
	bh=RVKaiXf+fcK4AQ3JKB1PY0C2pLxkHeKPiFSnIWeESqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0d7Ac4lWapQVEC3dHsS5/P4Je0e5ujtKkKTiEGEOfOtfXwXbR1ULOBPnWgRXPej6
	 61a6cMyCTGt+8G1cdlyIX1L5O/CmItnuia0ood8pFAByGXuCblxUTX1ISnS1AV9vzC
	 CiqGmjxs03PZHEhWG6dEj97vQwDhm5fMmQQRBHoY6arrhfyYHQac0G/xUxXl24mbDM
	 5msLaFBKCtWfA8MWwJENO9nPje9y2fzwELqI/adr9qO2RtHgbRhqnVQF+qnz7Vridb
	 4NdOy4EROy8/jsi2wN1HlQHQNHst3tfSAeq+iXZaQJ9/2SJcuHYMGc/y2h1kHCHHjz
	 H425kjH7ZnvWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 19/19] media: meson-ir-tx: Validate carrier and
 duty_cycle
To: "Sean Young" <sean@mess.org>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <528055c59611d6711e15b05c5ab150d4d3d338af.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
 <528055c59611d6711e15b05c5ab150d4d3d338af.1788882189.git.sean@mess.org>
Date: Tue, 08 Sep 2026 16:26:57 +0000
Message-Id: <20260908162657.BC1391F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBhdGNoIGNs
YWltcyB0byBmaXggYSBkaXZpZGUtYnktemVybyBlcnJvciBmb3IgY2FycmllciBmcmVxdWVuY2ll
cyBsYXJnZXIgdGhhbiBVU0VDX1BFUl9TRUMsIGJ1dCB0aGUgaW1wbGVtZW50ZWQgYm91bmRzIGNo
ZWNrIG1hdGhlbWF0aWNhbGx5IGZhaWxzIHRvIHByZXZlbnQgaXQuCi0tCgpjb21taXQgZTNmMTFi
MDJhYWQ2MTA5ZDFkY2Y0MDNmZGZlMDFjNGNjMmRiNzBlMQpBdXRob3I6IFNlYW4gWW91bmcgPHNl
YW5AbWVzcy5vcmc+CgptZWRpYTogbWVzb24taXItdHg6IFZhbGlkYXRlIGNhcnJpZXIgYW5kIGR1
dHlfY3ljbGUKCkl0IGlzIHBvc3NpYmxlIHRvIHNldCBhIGNvbWJpbmF0aW9uIG9mIGNhcnJpZXIg
YW5kIGR1dHkgY3ljbGUgdGhhdCBkbwpub3QgcHJvZHVjZSBhIGNvcnJlY3Qgc2lnbmFsLiBJbiBh
ZGRpdGlvbiwgc2V0dGluZyBhIGNhcnJpZXIgbGFyZ2VyCnRoYW4gVVNFQ19QRVJfU0VDIHdpbGwg
cmVzdWx0IGluIGEgZGl2aWRlIGJ5IHplcm8gaW4KbWVzb25faXJ0eF9wcmVwYXJlX3B1bHNlKCkg
ZHVyaW5nIHRyYW5zbWl0LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1p
ci10eC5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCj4gaW5kZXggMWFiODk4MDY5
ZTY3Zi4uYTQxMDQ2NGVkZTIyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3JjL21lc29u
LWlyLXR4LmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLXR4LmMKClsgLi4uIF0K
Cj4gQEAgLTc2LDExICs3NiwyNCBAQCBzdHJ1Y3QgbWVzb25faXJ0eCB7Cj4gIAl1bnNpZ25lZCBs
b25nIGNsa19yYXRlOwo+ICB9Owo+ICAKPiAtc3RhdGljIHZvaWQgbWVzb25faXJ0eF9zZXRfbW9k
KHN0cnVjdCBtZXNvbl9pcnR4ICppcikKPiArc3RhdGljIGJvb2wgbWVzb25faXJ0eF9jYWxjX21v
ZCh1bnNpZ25lZCBsb25nIGNsa19yYXRlLCB1MzIgY2FycmllciwKPiArCQkJCXUzMiBkdXR5X2N5
Y2xlLCB1bnNpZ25lZCBpbnQgKnB1bHNlX2NudCwKPiArCQkJCXVuc2lnbmVkIGludCAqc3BhY2Vf
Y250KQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgY250ID0gRElWX1JPVU5EX0NMT1NFU1QoaXItPmNs
a19yYXRlLCBpci0+Y2Fycmllcik7Cj4gLQl1bnNpZ25lZCBpbnQgcHVsc2VfY250ID0gRElWX1JP
VU5EX0NMT1NFU1QoY250ICogaXItPmR1dHlfY3ljbGUsIDEwMCk7Cj4gLQl1bnNpZ25lZCBpbnQg
c3BhY2VfY250ID0gY250IC0gcHVsc2VfY250Owo+ICsJdW5zaWduZWQgaW50IGNudDsKPiArCj4g
KwljbnQgPSBESVZfUk9VTkRfQ0xPU0VTVChjbGtfcmF0ZSwgY2Fycmllcik7Cj4gKwkqcHVsc2Vf
Y250ID0gRElWX1JPVU5EX0NMT1NFU1QoY250ICogZHV0eV9jeWNsZSwgMTAwKTsKPiArCSpzcGFj
ZV9jbnQgPSBjbnQgLSAqcHVsc2VfY250Owo+ICsKPiArCXJldHVybiAqcHVsc2VfY250ID49IDEg
JiYgKnB1bHNlX2NudCA8PSA2NTUzNiAmJgo+ICsJICAgICAgICpzcGFjZV9jbnQgPj0gMSAmJiAq
c3BhY2VfY250IDw9IDY1NTM2Owo+ICt9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIHZh
bGlkYXRpb24gY2hlY2sgYWRlcXVhdGVseSBwcmV2ZW50IHRoZSBkaXZpZGUtYnktemVybyBjb25k
aXRpb24KbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZT8KCkZvciBleGFtcGxlLCBpZiB0
aGUgY2FycmllciBmcmVxdWVuY3kgaXMgc2V0IHRvIDMsMDAwLDAwMCBIeiBhbmQgdGhlIGNsb2Nr
CnJhdGUgaXMgOCwwMDAsMDAwIEh6LCBjbnQgZXZhbHVhdGVzIHRvIDMuIERlcGVuZGluZyBvbiB0
aGUgZHV0eSBjeWNsZSwKcHVsc2VfY250IGFuZCBzcGFjZV9jbnQgY291bGQgYmUgdmFsaWQgKGUu
Zy4sIDIgYW5kIDEpLCBhbGxvd2luZyB0aGlzCmZ1bmN0aW9uIHRvIHJldHVybiB0cnVlIGRlc3Bp
dGUgdGhlIGNhcnJpZXIgYmVpbmcgbGFyZ2VyIHRoYW4gVVNFQ19QRVJfU0VDLgoKQmVjYXVzZSBv
ZiB0aGlzLCBjYWxsZXJzIGxpa2UgbWVzb25faXJ0eF9zZXRfY2FycmllcigpIGNhbiBzdGlsbCBh
Y2NlcHQKdGhlc2UgZXhjZXNzaXZlbHkgaGlnaCBjYXJyaWVyIGZyZXF1ZW5jaWVzLCBhbGxvd2lu
ZyB0Yl91cyB0byBkcm9wIHRvIDAKaW4gbWVzb25faXJ0eF9wcmVwYXJlX3B1bHNlKCk6CgoJdW5z
aWduZWQgaW50IHRiX3VzID0gRElWX1JPVU5EX0NMT1NFU1QoVVNFQ19QRVJfU0VDLCBpci0+Y2Fy
cmllcik7CglkZWxheSA9IChESVZfUk9VTkRfQ0xPU0VTVCh0aW1lLCB0Yl91cykgLSAxKSAmIElS
Ql9ERUxBWV9NQVNLOwoKV2hpbGUgYSBwcmUtZXhpc3RpbmcgYm91bmRzIGNoZWNrIGluIG1lc29u
X2lydHhfY2hlY2tfYnVmKCkgc2VlbXMgdG8KY29pbmNpZGVudGFsbHkgcmVqZWN0IHRyYW5zbWlz
c2lvbnMgd2hlbiBjYXJyaWVyID4gVVNFQ19QRVJfU0VDIChzaW5jZSBpdHMKY2FsY3VsYXRlZCBt
YXhfdGJfdXMgYmVjb21lcyAwKSwgc2hvdWxkIHRoaXMgbmV3IGxvZ2ljIGFsc28gZXhwbGljaXRs
eQpjaGVjayBmb3IgY2FycmllciA8PSBVU0VDX1BFUl9TRUMgdG8gZnVsbHkgZW5mb3JjZSB0aGUg
Y29uc3RyYWludCBzdGF0ZWQKaW4gdGhlIGNvbW1pdCBtZXNzYWdlPwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzg4ODgyMTg5
LmdpdC5zZWFuQG1lc3Mub3JnP3BhcnQ9MTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
