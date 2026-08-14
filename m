Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602F6C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKZkZW1TYreI/fzFY8SL/W9AW0GvHl9hPGZ4IoVWqpw=; b=P3+i7tuMvZr/4P
	G9zJoFnTflM8upL/blT/qnMsJKLKAalwWjJeIQoOqJqDku+9i0pnUKUiikzWu53FVJDqRN2cUKwwe
	//NWbsfHdrXRyZ7O+WDRQd65BmO8iEdkbYJV9BHNeyYb/bc666/m3yiIKSIWMP9XOZNfwANDdRM56
	xksABCiDk1w8t3ghZhais2WPRPMxqBZ9hltyrJwi9vc/X4C0CL0q/q4bJ+PLyPifnfOlQ7XOEGXxc
	4CkGzAqI+SbUwdA/V0wHdqS7+e1XHB9rsHkmXZfY4ZaaAwXbGeMWCkPce5KTjzAEo4VTIDsdCYTDZ
	/ePWg8aqWyYzN6phqOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuywf-00000003BHH-0y31;
	Fri, 14 Aug 2026 20:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuywe-00000003BHA-1Oob
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 20:56:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0229E40A25;
	Fri, 14 Aug 2026 20:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497061F00A3A;
	Fri, 14 Aug 2026 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786740963;
	bh=fTfUDQrgJ3Y+t0RXMYFXkxKPnYej7d4+iN1qSmhzYRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faVlqrLBEhwneawuv22KUSZLYCX7unkodfOtf3Hcy0hRJXpLl3IrOplgOC9ywccXK
	 /vk5qU0qILftzpV2Z7wUjZLsodfwUxICqs6/i8/CUNzSkAv9eMhVbmhJYDgyIO1sFz
	 /vw2D90gMNhpA5V7nvcO2ezHZLgrc+4Pexmc4Rx48OQcgcqOgowpqtXddb6/IaOYEq
	 8PhWN/CHhCzvr6WLO+6UFekETFGShIvJYIG1le4FZ+XixW3npDsdzUeZOMRgLiMApa
	 QmNJghPBd6iqva7/1NKcD+XRgPOmQteFxxCjrDZO0mxUkdbG6sX+inC02wD0bucfHX
	 T9S1jtidwcOhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] drm/vblank: Use drm_for_each_crtc() in
 drm_vblank_init()
To: "Lyude Paul" <lyude@redhat.com>
Cc: imx@lists.linux.dev, intel-xe@lists.freedesktop.org, neil.armstrong@linaro.org, intel-gfx@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260814203542.1405135-5-lyude@redhat.com>
References: <20260814203542.1405135-1-lyude@redhat.com>
 <20260814203542.1405135-5-lyude@redhat.com>
Date: Fri, 14 Aug 2026 20:56:02 +0000
Message-Id: <20260814205603.497061F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBDYWxsaW5nIGBk
cm1fdmJsYW5rX2luaXRgIGJlZm9yZSBjcmVhdGluZyBDUlRDcyByZXN1bHRzIGluIGEgemVyby1z
aXplIGFsbG9jYXRpb24sIGxlYWRpbmcgdG8gYSBrZXJuZWwgY3Jhc2ggd2hlbiB2YmxhbmsgZmVh
dHVyZXMgYXJlIGxhdGVyIHVzZWQuCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggNC81XSBkcm0v
dmJsYW5rOiBVc2UgZHJtX2Zvcl9lYWNoX2NydGMoKSBpbiBkcm1fdmJsYW5rX2luaXQoKSAtLS0K
Y29tbWl0IDRhZWM5ODAyMzFmNTU2YzhhMzZiNTI5NGQ2N2IzZDU4MmQ0OWQ2MjMKQXV0aG9yOiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKZHJtL3ZibGFuazogVXNlIGRybV9mb3JfZWFj
aF9jcnRjKCkgaW4gZHJtX3ZibGFua19pbml0KCkKClRoaXMgcGF0Y2ggdXBkYXRlcyBkcm1fdmJs
YW5rX2luaXQoKSB0byB1c2UgdGhlIGRybV9mb3JfZWFjaF9jcnRjKCkgaXRlcmF0b3IKaW5zdGVh
ZCBvZiBtYW51YWxseSBjb3VudGluZyB0aGUgbnVtYmVyIG9mIENSVENzLgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJs
YW5rLmMKPiBpbmRleCAxNzI4M2U4OTIwMzc4Li5kNTc0MDUwNTA1NTRmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ZibGFuay5jCj4gQEAgLTU0NywxOSArNTQ3LDIwIEBAIHN0YXRpYyB2b2lkIGRybV92Ymxhbmtf
aW5pdF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnB0cikKPiAgaW50IGRy
bV92YmxhbmtfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICB7Cj4gIAlpbnQgcmV0Owo+
IC0JdW5zaWduZWQgaW50IG51bV9jcnRjcyA9IGRldi0+bW9kZV9jb25maWcubnVtX2NydGM7Cj4g
LQl1bnNpZ25lZCBpbnQgaTsKPiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiAgCj4gIAlzcGlu
X2xvY2tfaW5pdCgmZGV2LT52YmxfbG9jayk7Cj4gIAlzcGluX2xvY2tfaW5pdCgmZGV2LT52Ymxh
bmtfdGltZV9sb2NrKTsKPiAgCj4gLQlkZXYtPnZibGFuayA9IGRybW1fa2NhbGxvYyhkZXYsIG51
bV9jcnRjcywgc2l6ZW9mKCpkZXYtPnZibGFuayksIEdGUF9LRVJORUwpOwo+ICsJZGV2LT52Ymxh
bmsgPSBkcm1tX2tjYWxsb2MoZGV2LCBkZXYtPm1vZGVfY29uZmlnLm51bV9jcnRjLAo+ICsJCQkJ
ICAgc2l6ZW9mKCpkZXYtPnZibGFuayksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFkZXYtPnZibGFu
aykKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAlkZXYtPmhhc19od192YmxhbmsgPSB0cnVl
Owo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBudW1fY3J0Y3M7IGkrKykgewo+ICsJZHJtX2Zvcl9l
YWNoX2NydGMoY3J0YywgZGV2KSB7CgpbU2V2ZXJpdHk6IENyaXRpY2FsXQpDb3VsZCB0aGlzIGNo
YW5nZSBsZWFkIHRvIGFuIHVuaW5pdGlhbGl6ZWQgdmJsYW5rIGFycmF5IGFuZCBzdWJzZXF1ZW50
IHBhZ2UKZmF1bHQgZm9yIGRyaXZlcnMgdGhhdCBpbml0aWFsaXplIHZibGFuayBiZWZvcmUgY3Jl
YXRpbmcgQ1JUQ3M/CgpGb3IgZXhhbXBsZSwgaW4gdmttc19kcnYuYzp2a21zX2NyZWF0ZSgpLCBk
cm1fdmJsYW5rX2luaXQoKSBpcyBjYWxsZWQgYmVmb3JlCnZrbXNfbW9kZXNldF9pbml0KCkgY3Jl
YXRlcyB0aGUgQ1JUQ3M6CgoJcmV0ID0gZHJtX3ZibGFua19pbml0KCZ2a21zX2RldmljZS0+ZHJt
KTsKCWlmIChyZXQpIHsKCQlEUk1fRVJST1IoIkZhaWxlZCB0byB2YmxhbmtcbiIpOwoJCWdvdG8g
b3V0X2RldnJlczsKCX0KCglyZXQgPSB2a21zX21vZGVzZXRfaW5pdCh2a21zX2RldmljZSk7CgpC
ZWNhdXNlIHRoZSBDUlRDcyBhcmUgbm90IHlldCBjcmVhdGVkIGF0IHRoaXMgcG9pbnQsIGRldi0+
bW9kZV9jb25maWcubnVtX2NydGMKaXMgMC4gVGhlIGFsbG9jYXRpb24gZm9yIHRoZSB2Ymxhbmsg
YXJyYXkgYmVjb21lcyBhIDAtYnl0ZSBhbGxvY2F0aW9uLApyZXR1cm5pbmcgWkVST19TSVpFX1BU
UiAoMHgxMCkuIFRoZSBkcm1fZm9yX2VhY2hfY3J0YygpIGxvb3AgdGhlbiBleGVjdXRlcyAwCnRp
bWVzLCBhbmQgZHJtX3ZibGFua19pbml0KCkgc3VjY2Vzc2Z1bGx5IHJldHVybnMgMC4KCldoZW4g
dXNlcnNwYWNlIGxhdGVyIGNhbGxzIERSTV9JT0NUTF9XQUlUX1ZCTEFOSywgdGhlIGtlcm5lbCBs
b29rcyB1cCB0aGUKQ1JUQyB1c2luZyBkcm1fdmJsYW5rX2NydGMoZGV2LCBwaXBlKS4gVGhpcyBy
ZXR1cm5zIGEgcG9pbnRlciBpbnRvIHRoZSBhcnJheSwKd2hpY2ggZXZhbHVhdGVzIHRvIFpFUk9f
U0laRV9QVFIgKyBwaXBlICogc2l6ZW9mKC4uLikuCgpXaWxsIGRlcmVmZXJlbmNpbmcgdGhpcyBw
b2ludGVyIGNhdXNlIGFuIGltbWVkaWF0ZSBrZXJuZWwgT09QUz8KCj4gKwkJdW5zaWduZWQgaW50
IGkgPSBjcnRjLT5pbmRleDsKPiAgCQlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSBk
cm1fdmJsYW5rX2NydGMoZGV2LCBpKTsKPiAgCj4gIAkJdmJsYW5rLT5kZXYgPSBkZXY7CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
ODE0MjAzNTQyLjE0MDUxMzUtMS1seXVkZUByZWRoYXQuY29tP3BhcnQ9NAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
