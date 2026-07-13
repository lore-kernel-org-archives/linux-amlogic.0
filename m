Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C16C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TgqfMeMjmhakYXxCWn9HWl8koXmnea3js2bEtZEHSE=; b=L9zUyerlkrLDuj
	ekiMoYTkMQuYLfRO6pO9jc8tdaxFsRQK9EZ9BzlW3NXIDLHzIStgz2r7w82IW0WnrZJZYgOVsD5qq
	aFdkbdIL7lLxkQnz2ecxgKgwK4rSO1xB3CEymnoZXHJLc01mnoC0YdduCsmpLeu1WTrlMX8vxkkmX
	31YW05y1wjZmLpw8l7fG3moR3F2HnmJ2fw8I7bc9frCPhYulJ8a4Jh7wFRM3BPmmXy2Yq2hVNvdgG
	G9h0bRTRy5bSftICR/ECeHotGx2b2IuNComua9r0WPmM4tx4H0qxL3I6dyoJ2gUs5a0qsTzHiHq7w
	5/vzkCDAnBi0S1wcCsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGEI-00000009GW2-1uXm;
	Mon, 13 Jul 2026 12:57:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGEG-00000009GVd-1WR9
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:57:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B79586004E;
	Mon, 13 Jul 2026 12:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D37E1F000E9;
	Mon, 13 Jul 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783947467;
	bh=LXkjJI9vh5y8xghzOW/1LY+U/IXCxqWQ+8+1mMwySWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=borrz59bJzOaq9vHbkVopd7u7H2Z6UBHkas+me3Tm+BuPyVDWtcuxMxpjIar+5fo3
	 NJA1TGBMrJug5Tas+7PujMNjdgVkz3eg4HTdNTQw1WE1cXQ8MIqfoi6D7YOcvFq2y6
	 TY49a62eyTholRCGW1K6Nt3T/wBd6v+1tbtpUbxT5p3fStFR8Wi50jOOfm7rkLNW4D
	 ukE+konvNb4swrQEQ1NHPMKIn2y28wkDhiQ1w24vKZZZYlfsYBhbe7aCpn4RUwaIIp
	 nUrrULI91j/+mjnPVLS64hpmyu6UOj/uPuFEviMaxmi85yWdBSViK43NeNWxMSgJ7g
	 vchYCvh0pTwpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits
 and maximize allocation boundaries
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260713120840.17427-20-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <20260713120840.17427-20-linux.amoon@gmail.com>
Date: Mon, 13 Jul 2026 12:57:46 +0000
Message-Id: <20260713125747.2D37E1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bmluaXRpYWxpemVkIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBh
dGggb2YgYG1lc29uX2Rydl9iaW5kX21hc3RlcmAuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtI
aWdoXSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiBgZGV2bV9remFsbG9jYCBmYWlscyB0
byBhbGxvY2F0ZSB0aGUgYHByaXZgIHN0cnVjdHVyZS4KLS0KCi0tLSBQYXRjaCBbMTldOiBbUEFU
Q0ggdjcgMTkvMTldIGdwdTogZHJtOiBtZXNvbjogRml4IERNQSBzZWdtZW50IHNpemUgbGltaXRz
IGFuZCBtYXhpbWl6ZSBhbGxvY2F0aW9uIGJvdW5kYXJpZXMgLS0tCmNvbW1pdCA1NTA5ZjM3Zjc0
MmJmOTcxNjY0ZjJmMGU3MjNjNjE4N2RlZGZmOGQ0CkF1dGhvcjogQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPgoKZ3B1OiBkcm06IG1lc29uOiBGaXggRE1BIHNlZ21lbnQgc2l6ZSBs
aW1pdHMgYW5kIG1heGltaXplIGFsbG9jYXRpb24gYm91bmRhcmllcwoKVGhpcyBjb21taXQgYWRk
cmVzc2VzIERNQSBsYXlvdXQgY29uZmlndXJhdGlvbiBjb25zdHJhaW50cyBieSBzZXR0aW5nIGEg
MzItYml0CmNvaGVyZW50IERNQSBhbGxvY2F0aW9uIHdpbmRvdyBhbmQgbWF4aW1pemluZyB0aGUg
c2NhdHRlci1nYXRoZXIgYWxsb2NhdGlvbgpzZWdtZW50IGJvdW5kYXJ5IGNoZWNrIGNvbnN0cmFp
bnQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiBpbmRleCA0OWZmOWYxZjE2ZDMyLi44
OTllNzBiY2E0Y2UyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IEBAIC0yMDIs
NiArMjAyLDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZp
Y2UgKmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykKPiAgCWlmIChJU19FUlIoZHJtKSkKPiAgCQly
ZXR1cm4gUFRSX0VSUihkcm0pOwo+ICAKPiArCXJldCA9IGRtYV9zZXRfbWFza19hbmRfY29oZXJl
bnQoZGV2LCBETUFfQklUX01BU0soMzIpKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBmcmVlX2Ry
bTsKCltTZXZlcml0eTogSGlnaF0KSWYgZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCgpIGZhaWxz
IGluIG1lc29uX2Rydl9iaW5kX21hc3RlcigpLCB0aGUgY29kZSBqdW1wcwp0byB0aGUgZnJlZV9k
cm0gZXJyb3IgcGF0aCBiZWZvcmUgdGhlIHByaXYgcG9pbnRlciBpcyBhbGxvY2F0ZWQgYW5kIGlu
aXRpYWxpemVkLgoKQmVjYXVzZSB0aGUgZnJlZV9kcm0gbGFiZWwgdW5jb25kaXRpb25hbGx5IHBh
c3NlcyBwcml2IHRvIGVuY29kZXIgcmVtb3ZhbApmdW5jdGlvbnM6Cgpkcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHJ2LmM6bWVzb25fZHJ2X2JpbmRfbWFzdGVyKCkgewouLi4KZnJlZV9kcm06
Cglkcm1fZGV2X3B1dChkcm0pOwoKCW1lc29uX2VuY29kZXJfZHNpX3JlbW92ZShwcml2KTsKLi4u
Cn0KCkFuZCBtZXNvbl9lbmNvZGVyX2RzaV9yZW1vdmUoKSBkZXJlZmVyZW5jZXMgcHJpdiBpbW1l
ZGlhdGVseToKCmRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2RzaS5jOm1lc29u
X2VuY29kZXJfZHNpX3JlbW92ZSgpIHsKLi4uCglpZiAocHJpdi0+ZW5jb2RlcnNbTUVTT05fRU5D
X0RTSV0pIHsKLi4uCn0KCldpbGwgdGhpcyByZXN1bHQgaW4gZGVyZWZlcmVuY2luZyBhbiB1bmlu
aXRpYWxpemVkIHN0YWNrIHBvaW50ZXI/Cgo+ICsKPiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKGRl
diwgVUlOVF9NQVgpOwo+ICsKPiAgCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBy
aXYpLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghcHJpdikgewo+ICAJCXJldCA9IC1FTk9NRU07Cj4g
IAkJZ290byBmcmVlX2RybTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGlu
ZyBpc3N1ZSwgYnV0IGlmIGRldm1fa3phbGxvYygpIGluIG1lc29uX2Rydl9iaW5kX21hc3Rlcigp
CmZhaWxzIHRvIGFsbG9jYXRlIHByaXYsIGl0IHdpbGwgYmUgc2V0IHRvIE5VTEwgYW5kIHRoZSBj
b2RlIGp1bXBzIHRvIGZyZWVfZHJtLgoKU2ltaWxhciB0byB0aGUgYWJvdmUgaXNzdWUsIHRoaXMg
d2lsbCBwYXNzIGEgTlVMTCBwcml2IHBvaW50ZXIgdG8KbWVzb25fZW5jb2Rlcl9kc2lfcmVtb3Zl
KCksIHdoaWNoIGRvZXMgbm90IGNoZWNrIGZvciBOVUxMIGJlZm9yZSBkZXJlZmVyZW5jaW5nCml0
OgoKZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfZHNpLmM6bWVzb25fZW5jb2Rl
cl9kc2lfcmVtb3ZlKCkgewouLi4KCWlmIChwcml2LT5lbmNvZGVyc1tNRVNPTl9FTkNfRFNJXSkg
ewouLi4KfQoKV2lsbCB0aGlzIGNhdXNlIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGR1cmlu
ZyBhbiBvdXQtb2YtbWVtb3J5IGNvbmRpdGlvbj8KCj4gIAl9CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEzMTIwODQwLjE3NDI3
LTEtbGludXguYW1vb25AZ21haWwuY29tP3BhcnQ9MTkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
