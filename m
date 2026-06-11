Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED01CD98C6
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 03:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tooXlIZ1yPDs+6e0TOtw/dkaMvdBXY5GPj2dTwFj3M=; b=gl4BiSLxqwKbZo
	npAOfO07U5gGQZEJz2y8ksy0gBnUgDRx0VXnWVActPZbyfxZqnOu+HuRQZMiiVlH5R7jMQqsxVkGu
	OwPMdUGisqIEpgurEMOLKE5RhUICdX7/rgzVwBq986mJ+42yjSxHzfj0SJhcqgUgNC+s1u22bLsOc
	bUNGcEU6XlYHpRUUeffAXNWaW5vi9+UOKBLS+8Gyie5kEyydwanrmz7x0lKNv/09KIeQBWLL7IQjO
	2nWxLol2C3Slbydo/ixzxpWGllR07m6tKnik3b3rcLQEAiMMsPNrO0XHF7wzi2ilGF/APx9gmjCbD
	uwFEU1iFCQmzhZc2ZqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWOc-00000008dfe-2eI0;
	Thu, 11 Jun 2026 03:47:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWOb-00000008dfR-0Iu7
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 03:47:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15DDC60208;
	Thu, 11 Jun 2026 03:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3074B1F00893;
	Thu, 11 Jun 2026 03:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781149675;
	bh=T+BKZm0au+9DkZdBEkzfAx46pzq/KJAnMS+UI/nfHcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EviLFBvoLCxDjIHeQXYXoF+hHQ3GI2eq9KU4ELWHjZ4/2oHD+GGGqXOAbLoIuPVMl
	 6sjCUO7BVGdmI3yPTCD2GdXKZTY5G+f/prunPF9L2m0m9Z5XNLhS5iUohQNC4wT30I
	 s7U20muw5kyfeQ1roBtqC2r1ar/Y8WV8ta/ab3WYBVpxIfLaS1f8Pcy7qq8U5zx2os
	 J7U60l/r/MBmhg6QIgxma2G8nBOJJiJrJBs4DEqGOhbYTm9T/5be9okWtokHTvp2JL
	 zuO0gvg8bC7COx+ltpmnBZeFY8o8x1z0qz5kBlQXUlJXptq1+3VU0SqgR6RjJUpEUj
	 286o7eFlpvwJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: meson: fix refcount leak in meson_rtc_get_bus
To: "WenTao Liang" <vulab@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260611034040.59682-1-vulab@iscas.ac.cn>
References: <20260611034040.59682-1-vulab@iscas.ac.cn>
Date: Thu, 11 Jun 2026 03:47:54 +0000
Message-Id: <20260611034755.3074B1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gQm9ndXMgZml4IGF0
dGVtcHRpbmcgdG8gZml4IGEgbm9uLWV4aXN0ZW50IHJlZmNvdW50IGxlYWssIHdoaWNoIHZpb2xh
dGVzIHRoZSByZXNldCBBUEkgY29udHJhY3QgYW5kIGludHJvZHVjZXMgYSBwb3RlbnRpYWwgY291
bnRlciB1bmRlcmZsb3cuCi0tCgpjb21taXQgZGVjN2ExYzcwOGE1YjI4ZDEzNDRiZjZmYjAzOGRm
NTRkNjAwMWRmMwpBdXRob3I6IFdlblRhbyBMaWFuZyA8dnVsYWJAaXNjYXMuYWMuY24+CnJ0Yzog
bWVzb246IGZpeCByZWZjb3VudCBsZWFrIGluIG1lc29uX3J0Y19nZXRfYnVzCgpUaGlzIGNvbW1p
dCBhZGRzIGNhbGxzIHRvIHJlc2V0X2NvbnRyb2xfcmVhcm0oKSBpbiBib3RoIHRoZSBlcnJvciBh
bmQgc3VjY2VzcwpwYXRocyBvZiBtZXNvbl9ydGNfZ2V0X2J1cygpIGFmdGVyIHRyaWdnZXJpbmcg
YSByZXNldC4gVGhlIGludGVudGlvbiBpcyB0bwpwcmV2ZW50IGEgdHJpZ2dlcmVkX2NvdW50IGxl
YWsgb24gc2hhcmVkIHJlc2V0IGNvbnRyb2xzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMv
cnRjLW1lc29uLmMgYi9kcml2ZXJzL3J0Yy9ydGMtbWVzb24uYwo+IGluZGV4IDIxZWNlYjllMmUx
MzQuLjNjNDVjZDc2MWExNWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLW1lc29uLmMK
PiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtbWVzb24uYwo+IEBAIC0xNDYsOCArMTQ2LDEyIEBAIHN0
YXRpYyBpbnQgbWVzb25fcnRjX2dldF9idXMoc3RydWN0IG1lc29uX3J0YyAqcnRjKQo+ICAJCWRl
dl93YXJuKHJ0Yy0+ZGV2LCAiZmFpbGVkIHRvIGdldCBidXMsIHJlc2V0dGluZyBSVENcbiIpOwo+
ICAKPiAgCQlyZXQgPSByZXNldF9jb250cm9sX3Jlc2V0KHJ0Yy0+cmVzZXQpOwo+IC0JCWlmIChy
ZXQpCj4gKwkJaWYgKHJldCkgewo+ICsJCQlyZXNldF9jb250cm9sX3JlYXJtKHJ0Yy0+cmVzZXQp
OwoKW1NldmVyaXR5OiBNZWRpdW1dCklzIHRoaXMgZml4IGFwcGxpY2FibGUgdG8gdGhpcyBkcml2
ZXIncyByZXNldCBjb250cm9sPwoKVGhlIHJlc2V0IGNvbnRyb2wgcnRjLT5yZXNldCBpcyBhY3F1
aXJlZCBhcyBhbiBleGNsdXNpdmUgY29udHJvbCB1c2luZwpkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0
KCkuIEV4Y2x1c2l2ZSBjb250cm9scyBkbyBub3QgdHJhY2sgdHJpZ2dlcmVkX2NvdW50LApzbyBj
YWxsaW5nIHJlc2V0X2NvbnRyb2xfcmVhcm0oKSBpcyBhIG5vLW9wIGluIHRoaXMgY29udGV4dCwg
bWVhbmluZyB0aGVyZQp3YXMgbm8gbGVhayB0byBmaXguCgpBZGRpdGlvbmFsbHksIGlmIHRoaXMg
d2VyZSBhIHNoYXJlZCByZXNldCBjb250cm9sLCB3b3VsZCBjYWxsaW5nCnJlc2V0X2NvbnRyb2xf
cmVhcm0oKSBvbiB0aGUgZXJyb3IgcGF0aCBjYXVzZSBhIGNvdW50ZXIgdW5kZXJmbG93PwoKVGhl
IHJlc2V0IGNvcmUgYWxyZWFkeSBoYW5kbGVzIHRoZSByb2xsYmFjayBpbnRlcm5hbGx5IGJ5IGRl
Y3JlbWVudGluZwp0cmlnZ2VyZWRfY291bnQgaWYgdGhlIHVuZGVybHlpbmcgcmVzZXQgZmFpbHMu
IEFkZGluZyBhIG1hbnVhbApyZXNldF9jb250cm9sX3JlYXJtKCkgaGVyZSBvbiBmYWlsdXJlIHdv
dWxkIGRlY3JlbWVudCBpdCBhIHNlY29uZCB0aW1lLAp3aGljaCBjb3VsZCB0cmlnZ2VyIGEgV0FS
Tl9PTigpIGZvciBkcm9wcGluZyBiZWxvdyB6ZXJvLgoKPiArCQkJcmV0dXJuIHJldDsKPiArCQl9
Cj4gKwo+ICsJCXJlc2V0X2NvbnRyb2xfcmVhcm0ocnRjLT5yZXNldCk7Cj4gIAl9Cj4gIAo+ICAJ
ZGV2X2VycihydGMtPmRldiwgImJ1cyBpcyBub3QgcmVhZHlcbiIpOwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxMTAzNDA0MC41
OTY4Mi0xLXZ1bGFiQGlzY2FzLmFjLmNuP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
