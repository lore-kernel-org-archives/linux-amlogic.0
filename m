Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001DC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSnIwJJEr8n/gr4DBmLkd1N8qPDqd0ki7VvTwyhijKc=; b=vTOpVUlQ6oH2OS
	e+lstQPla6O9QjZ0RzUoixVP35SFYAao4LJZUntNwNqLLfv/CQvlUb83P/TbijlbsJIzu8A3hJ2Pb
	Gxu62LoKByFNCufUzSdVFkl1RWFynpPPvIRm3YGyLQsDgKN25lo7KFkfsb8ey202JNMcEOF4QbJxA
	vwMN94kRDOwd05a1lYiPVxSZYqtmZOzILaD97HfmI0N19UU55xm/jYeNyTQNnycde6hQ6tUG5RCnt
	XwoKzAGO0IPtSuvziGthuhPq9XjCj46qKryZaD3l66WgUW9y9CkcD55dY4oS0CukjnrcNGILXDHY8
	2y0eP7bR+GIM6w7ecfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz8s-00000003CMy-2WRv;
	Fri, 14 Aug 2026 21:08:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuz8r-00000003CMs-0UWf
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 21:08:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6266740292;
	Fri, 14 Aug 2026 21:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6AF1F000E9;
	Fri, 14 Aug 2026 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786741720;
	bh=rMcM0lBlPoPh1FiorELQJDBDv6Kiof5qqVa1jsW625k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mtTGAkW50fZxxenfAzuyu0UFNDw/J7doURQ0Dhd69su0npvC2IZfOSmYnBXGgduBj
	 uIFl07kEDemyqgFsMBYLtsmyW5VWVxcWj7S7uNo99a7LIHSqsSxtoiTotSuscuYfRr
	 ETiTqR6xt2MGNSSod9Cyijd1FS6mIMY/kyHbgNxQIXDsJ4G7AqnVwGCT57fV96XrQf
	 /mdaz6NwfF/9/pYWV+BZYPVmbBQgUtFhfz02eSLoAyqm+pOniop5tNQ44ZU2PvwZ87
	 r0sieZCZBgD87zLv6yjNgKRjwon6SBH9rxwCKE/y0UFm+dVlRvNS+pOkitiqDclJPC
	 wQr5iu3OlO7FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] drm/vblank: Require all CRTCs implement vblank
 support in drm_vblank_init()
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-hyperv@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, intel-xe@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260814203542.1405135-6-lyude@redhat.com>
References: <20260814203542.1405135-1-lyude@redhat.com>
 <20260814203542.1405135-6-lyude@redhat.com>
Date: Fri, 14 Aug 2026 21:08:39 +0000
Message-Id: <20260814210839.AC6AF1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybV92YmxhbmtfaW5p
dCgpIGNhdXNlcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvciBkcml2ZXIgcHJvYmUgZmFp
bHVyZSBkdWUgdG8gYWNjZXNzaW5nIHVuaW5pdGlhbGl6ZWQgb3IgZW1wdHkgY3J0Y19saXN0Ci0t
CgotLS0gUGF0Y2ggWzVdOiBbUEFUQ0ggNS81XSBkcm0vdmJsYW5rOiBSZXF1aXJlIGFsbCBDUlRD
cyBpbXBsZW1lbnQgdmJsYW5rIHN1cHBvcnQgaW4gZHJtX3ZibGFua19pbml0KCkgLS0tCmNvbW1p
dCAxNzhiYmI0NDhhMTY2NjNlYWFkNjA0MjVjNjJiNDQ2ODAxZTBmMzg3CkF1dGhvcjogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCmRybS92Ymxhbms6IFJlcXVpcmUgYWxsIENSVENzIGlt
cGxlbWVudCB2Ymxhbmsgc3VwcG9ydCBpbiBkcm1fdmJsYW5rX2luaXQoKQoKVGhpcyBjb21taXQg
bW9kaWZpZXMgZHJtX3ZibGFua19pbml0KCkgdG8gdmVyaWZ5IHRoYXQgYWxsIENSVENzIGltcGxl
bWVudAp2Ymxhbmsgc3VwcG9ydCwgZW5zdXJpbmcgYW4gYWxsLW9yLW5vdGhpbmcgY29uZmlndXJh
dGlvbi4gSXQgcmV0dXJucyAtRUlOVkFMCmlmIHN1cHBvcnQgaXMgbWl4ZWQsIGFuZCAtRU5PREVW
IGlmIG5vIENSVENzIHN1cHBvcnQgdmJsYW5rLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCBk
NTc0MDUwNTA1NTRmLi4xN2FmZmFlMjNlN2E2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gQEAg
LTU0MiwxMiArNTQyLDMxIEBAIHN0YXRpYyB2b2lkIGRybV92YmxhbmtfaW5pdF9yZWxlYXNlKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnB0cikKPiAgICogZHJtbV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCkuCj4gICAqCj4gICAqIFJldHVybnM6Cj4gLSAqIFplcm8gb24gc3VjY2VzcyBvciBh
IG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiArICogWmVybyBvbiBzdWNjZXNzIG9y
IGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLiBJZiBubyBDUlRDcyB3aXRoIHZibGFu
awo+ICsgKiBzdXBwb3J0IGltcGxlbWVudGVkIHdlcmUgZm91bmQsIC1FTk9ERVYgd2lsbCBiZSBy
ZXR1cm5lZC4KPiAgICovCj4gIGludCBkcm1fdmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKPiAgewo+ICAJaW50IHJldDsKPiAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiArCWJv
b2wgZm91bmRfdmJsX2NydGMgPSBmYWxzZSwgZm91bmRfbm9uX3ZibF9jcnRjID0gZmFsc2U7Cj4g
Kwo+ICsJLyogVmJsYW5rIGhvb2tzIGFyZSBwZXItQ1JUQywgbm90IHBlci1kZXZpY2UgLSB3aGlj
aCBpcyBjb250cmFyeSB0byBob3cKPiArCSAqIHRoZSB2YmxhbmsgY29yZSB3YXMgd3JpdHRlbi4g
U2luY2UgaGFyZHdhcmUgdGhhdCBvbmx5IGhhcyB2YmxhbmsKPiArCSAqIHN1cHBvcnQgb24gc29t
ZSBDUlRDcyBidXQgbm90IGFsbCBpcyBub24tZXhpc3RlbnQgYW5kIHdvdWxkIGxpa2VseQo+ICsJ
ICogbGVhZCB0byBVQiwgZW5zdXJlIHRoYXQgdmJsYW5rIHN1cHBvcnQgaXMgYWxsIG9yIG5vdGhp
bmcuCj4gKwkgKi8KPiArCWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRldikgewoKW1NldmVyaXR5
OiBIaWdoXQpDYW4gaXRlcmF0aW5nIG92ZXIgZGV2LT5tb2RlX2NvbmZpZy5jcnRjX2xpc3QgaGVy
ZSBjYXVzZSBhIE5VTEwgcG9pbnRlcgpkZXJlZmVyZW5jZSBvciBhIGZhbHNlIC1FTk9ERVYgcmV0
dXJuIGR1cmluZyBkcml2ZXIgcHJvYmU/CgpTZXZlcmFsIERSTSBkcml2ZXJzIGNhbGwgZHJtX3Zi
bGFua19pbml0KCkgYmVmb3JlIGluaXRpYWxpemluZyBtb2RlX2NvbmZpZwpvciBjcmVhdGluZyBD
UlRDcy4gRm9yIGV4YW1wbGU6CgpJbiBpOTE1LCBpbnRlbF9kaXNwbGF5X2RyaXZlcl9wcm9iZV9u
b2lycSgpIGNhbGxzIGRybV92YmxhbmtfaW5pdCgpIGJlZm9yZQppbnRlbF9tb2RlX2NvbmZpZ19p
bml0KCkgc2V0cyB1cCB0aGUgY3J0Y19saXN0LCBtZWFuaW5nIHRoZSBsaXN0IGhlYWQgaXMKdW5p
bml0aWFsaXplZC4KCkluIHZrbXMsIHZrbXNfY3JlYXRlKCkgY2FsbHMgZHJtX3ZibGFua19pbml0
KCkgYmVmb3JlIHZrbXNfbW9kZXNldF9pbml0KCkKaW5pdGlhbGl6ZXMgdGhlIGNydGNfbGlzdC4K
CkluIHp5bnFtcF9rbXMsIHp5bnFtcF9kcHN1Yl9kcm1faW5pdCgpIGluaXRpYWxpemVzIHRoZSBs
aXN0IGJ1dCBjYWxscwpkcm1fdmJsYW5rX2luaXQoKSBiZWZvcmUgYW55IENSVENzIGFyZSBjcmVh
dGVkLCBtZWFuaW5nIHRoZSBsaXN0IGlzIGVtcHR5CmFuZCB0aGlzIGZ1bmN0aW9uIHdpbGwgdW5j
b25kaXRpb25hbGx5IHJldHVybiAtRU5PREVWLgoKRG9lcyBkcm1fdmJsYW5rX2luaXQoKSBuZWVk
IHRvIHN1cHBvcnQgYmVpbmcgY2FsbGVkIGJlZm9yZSBDUlRDcyBhcmUKcmVnaXN0ZXJlZD8KCj4g
KwkJaWYgKGNydGMtPmZ1bmNzLT5lbmFibGVfdmJsYW5rKQo+ICsJCQlmb3VuZF92YmxfY3J0YyA9
IHRydWU7Cj4gKwkJZWxzZQo+ICsJCQlmb3VuZF9ub25fdmJsX2NydGMgPSB0cnVlOwo+ICsKPiAr
CQlpZiAoZHJtX1dBUk5fT04oZGV2LCBmb3VuZF92YmxfY3J0YyAmJiBmb3VuZF9ub25fdmJsX2Ny
dGMpKQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCWlmICghZm91bmRfdmJsX2NydGMp
Cj4gKwkJcmV0dXJuIC1FTk9ERVY7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODE0MjAzNTQyLjE0MDUxMzUtMS1seXVkZUByZWRo
YXQuY29tP3BhcnQ9NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
