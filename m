Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3300C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fd3CnviGzsI51OLM8zbGB3/JURYDYCs9Pqz9DQ/2+HU=; b=I8/xG0V5VfEYlQ
	Dj27HAk9E8aO0/2XFagTNbvUhig3K19DhbnAHkmhUhoxYoW9KhkzYG0s0saa0kyAUXRftdjS8gD78
	LN5h/AKOP3QFcDOBHlojud/me66P05o3paMgoOCWWsVCqlX9+vSOPAY1jPVokhlETDiy6xypS4gjn
	naI8M+wrojrt4IHJbGqkkQYFSdbzAnyaeoc+ubVjkTvZs1qxyUX5WBpX4HuHDWji2dZOACMs+dXop
	hTt8gLZucNLSqqZzqASgOWQOWBhYrWzO8Q/McgACKNANQw1S6nAO2CI5xK66esjNIPPxtC3fYq8Ty
	pAjVKevUXiLqLBVYIAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpmy-00000007AD1-1wrS;
	Mon, 20 Jul 2026 15:20:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpmx-00000007ACs-0rtB
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:20:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9377C60103;
	Mon, 20 Jul 2026 15:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56B41F000E9;
	Mon, 20 Jul 2026 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560814;
	bh=SwfpXQPoaTcvlBYIYTlkGGyq666sRXZI2K4qaGD2QME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V1IxprBiKXixwIXV5CEchwkIUFEWibywh+d4ePFGmlpUGuUC6CWYymRQz6aLdwY21
	 NZdVXj3uE4b3jbHesxXKwg2hq4q/aEsPxFInCtTB3+1OGYC13SHUu8biilKnhVYDrb
	 TyLJtRg553RG/mD+Z9YazdWtbcmGjrMn3snqDVGKzKWUeN6h6hm9NlS6JnqXYVYJ7U
	 hJlTma59UzoWSOX+8v4a8T9LfED07Apb/Kh+sIkQ1ThzVRNFCifIBs8GLTPdJ0ncYW
	 rtG7PFdtdp0WQhGiHQ8Gbg4zRGJWEALJBf3Cwfwy24nE+SP89KJBaC0PulkUsPka0c
	 bda9pY+to0FUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/16] PCI: dwc: sophgo: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-pci@vger.kernel.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260720150619.24733-13-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-13-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:20:13 +0000
Message-Id: <20260720152013.E56B41F000E9@smtp.kernel.org>
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
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSBJTlR4IElSUSBkb21haW4gYW5kIGNoYWluZWQgaGFuZGxlciBhcmUgbGVha2VkIG9uIHBy
b2JlIGZhaWx1cmUsIHdoaWNoIGxlYXZlcyBhIGRhbmdsaW5nIHBvaW50ZXIgaW4gdGhlIGFjdGl2
ZSBJUlEgaGFuZGxlciBhbmQgbGVhZHMgdG8gYSB1c2UtYWZ0ZXItZnJlZSBpZiB0aGUgaW50ZXJy
dXB0IGZpcmVzLgotLQoKLS0tIFBhdGNoIFsxMl06IFtQQVRDSCB2MyAxMi8xNl0gUENJOiBkd2M6
IHNvcGhnbzogVXNlIGNhY2hlZCBQQ0llIGNhcGFiaWxpdHkgb2Zmc2V0IC0tLQpjb21taXQgMmU4
NmFiN2RiZDY5ZDNiY2ZhYTNkN2I0ZjYwMWRmMjdjNDgzMTdmMwpBdXRob3I6IEhhbnMgWmhhbmcg
PDE4MjU1MTE3MTU5QDE2My5jb20+ClBDSTogZHdjOiBzb3BoZ286IFVzZSBjYWNoZWQgUENJZSBj
YXBhYmlsaXR5IG9mZnNldAoKVGhpcyBjb21taXQgbW9kaWZpZXMgc29waGdvX3BjaWVfZGlzYWJs
ZV9sMHNfbDEoKSB0byB1c2UgdGhlIGNhY2hlZCBQQ0llCmNhcGFiaWxpdHkgb2Zmc2V0IHJhdGhl
ciB0aGFuIHNlYXJjaGluZyBmb3IgaXQgYWdhaW4uIFRoZSBvZmZzZXQgaXMgZmV0Y2hlZAp2aWEg
ZHdfcGNpZV9nZXRfcGNpZV9jYXAoKSBpbnNpZGUgdGhlIC5pbml0IGNhbGxiYWNrLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zb3BoZ28uYyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc29waGdvLmMKPiBpbmRleCAwNDQwODg4OTg4MTll
Li4zOTcwM2QyYjdiNWYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtc29waGdvLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNv
cGhnby5jCj4gQEAgLTE2NCw5ICsxNjQsMTAgQEAgc3RhdGljIHZvaWQgc29waGdvX3BjaWVfbXNp
X2VuYWJsZShzdHJ1Y3QgZHdfcGNpZV9ycCAqcHApCj4gIHN0YXRpYyB2b2lkIHNvcGhnb19wY2ll
X2Rpc2FibGVfbDBzX2wxKHN0cnVjdCBkd19wY2llX3JwICpwcCkKPiAgewo+ICAJc3RydWN0IGR3
X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9wcChwcCk7Cj4gLQl1MzIgb2Zmc2V0LCB2YWw7
Cj4gKwl1OCBvZmZzZXQ7Cj4gKwl1MzIgdmFsOwo+ICAKPiAtCW9mZnNldCA9IGR3X3BjaWVfZmlu
ZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9JRF9FWFApOwo+ICsJb2Zmc2V0ID0gZHdfcGNpZV9n
ZXRfcGNpZV9jYXAocGNpKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRy
b2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCB3aGlsZSBsb29raW5nIGF0IHRoZSBjYWxsCmNoYWlu
IGZyb20gc29waGdvX3BjaWVfaG9zdF9pbml0KCkgdG8gc29waGdvX3BjaWVfZGlzYWJsZV9sMHNf
bDEoKSwgSQpub3RpY2VkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGggaG93IHRoZSBJTlR4IElSUSBk
b21haW4gaXMgaGFuZGxlZCBkdXJpbmcKcHJvYmUgZmFpbHVyZXMuCgpJbiBzb3BoZ29fcGNpZV9o
b3N0X2luaXQoKSwgdGhlIElSUSBkb21haW4gYW5kIGNoYWluZWQgaGFuZGxlciBhcmUgc2V0IHVw
OgoKICAgICAgICBpcnEgPSBzb3BoZ29fcGNpZV9pbml0X2lycV9kb21haW4ocHApOwogICAgICAg
IGlmIChpcnEgPCAwKQogICAgICAgICAgICAgICAgcmV0dXJuIGlycTsKCiAgICAgICAgaXJxX3Nl
dF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEoaXJxLCBzb3BoZ29fcGNpZV9pbnR4X2hhbmRsZXIs
IHBwKTsKCklmIGR3X3BjaWVfaG9zdF9pbml0KCkgc3Vic2VxdWVudGx5IGZhaWxzIGR1cmluZyBz
b3BoZ29fcGNpZV9wcm9iZSgpLCBkZXZyZXMKd2lsbCBmcmVlIHRoZSBzdHJ1Y3Qgc29waGdvX3Bj
aWUgc3RydWN0dXJlLCBpbmNsdWRpbmcgdGhlIHBwIHBvaW50ZXIuCgpIb3dldmVyLCB0aGVyZSBp
cyBubyAuZGVpbml0IGNhbGxiYWNrIGluIHNvcGhnb19wY2llX2hvc3Rfb3BzIHRvIGNhbGwKaXJx
X2RvbWFpbl9yZW1vdmUoKSBhbmQgaXJxX3NldF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEoaXJx
LCBOVUxMLCBOVUxMKS4KCkNvdWxkIHRoaXMgbGVhdmUgYSBkYW5nbGluZyBwb2ludGVyIGluIHRo
ZSBhY3RpdmUgSVJRIGhhbmRsZXIsIGxlYWRpbmcgdG8KYSB1c2UtYWZ0ZXItZnJlZSBpZiB0aGUg
aW50ZXJydXB0IGZpcmVzPwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMDE1MDYxOS4yNDczMy0xLTE4MjU1MTE3
MTU5QDE2My5jb20/cGFydD0xMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
