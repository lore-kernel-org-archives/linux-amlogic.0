Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D008CA5FCD
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8qNiCbk9Db+0M67dj4Flc6tziVC0rnzSRNHLWLOnJg=; b=XY/jQyJU7dC/FP
	opm8AUFRAqRieHZUwWkGh/Arg3dGVery4jbpPA4HPkUC95Sk3rcG8NW3UVdg9j3HwL9WUf8mXIJO8
	6NASTJKX90cy9Ci6nZO/P39aGQDZdOlQQz+9zjDNDGt7OqVa2Y3wpKNazAQIu9c7y3ZddnLBNeLSL
	qMw4rLRkLXHasMCQcDOTrcwFte0bg00BuYS74JxhzIRyg0yW1oagzRjz29AUV75ZMDOPhIu3ognGb
	yQmKloX2Kl+Va9vcDfi14yIPe7A1t76IdmzXC/PYr+gB0a1KZds2hrMleSvYNNlMdzh4Tz1bOds0T
	0Sp6I8a05nQi50njD9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvkp-00000006OtF-32vk;
	Wed, 30 Sep 2026 14:57:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvko-00000006Osk-07KV
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 14:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B12A60008;
	Wed, 30 Sep 2026 14:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D4D1F00893;
	Wed, 30 Sep 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780272;
	bh=AMccqmfckUraKLHnYGS/RLNQnla8bsKTWtfBzhpZ0K4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPepsKKMz5INVLk/tzGktRplYa5gVYXWkKLAWzkSMAxjdMry6bYflgJg+cqec7rh7
	 9p+Lb5XwDPeCNG9VtRNWlurGvv5PhIe8Z0r7ZjYDkjnG05F3q0v5+XZ3dh+KVgTeC1
	 5PigJdoRwPWiJC6Ufx4GxQTj8Gkr+3TOPUd3QOJ26nH243EyuhuZHQJnNn+AXXkiju
	 Un/objUfO3LHQIye+8wy8cFe/nRnHfvgUybTT4L2uVRdd8PdWFigVmJfO+GmLzRY38
	 QNvw75TVGpJkOxKoGiGNFlSIITsRXLiMN0NTAY74Mf1s8lpoV7ucgeMtn4RR+vIRQj
	 0D96KGWGktj9g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/4] PCI: meson: Remove redundant MPS configuration
To: "Niklas Cassel" <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260930145017.1356088-10-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
 <20260930145017.1356088-10-cassel@kernel.org>
Date: Wed, 30 Sep 2026 14:57:52 +0000
Message-Id: <20260930145752.C0D4D1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gcGNpOiBvdXRkYXRlZCBj
b21tZW50IHJlZmVycyB0byBwYXlsb2FkIHNpemUgaW5zdGVhZCBvZiBNUlJTCi0tCgpjb21taXQg
ZmQ4MTQ0NjYxYmJkOGJlYjNiZDA5ZjQ5MGIxMGVlMzVkZTUwNzNlNgpBdXRob3I6IEhhbnMgWmhh
bmcgPDE4MjU1MTE3MTU5QDE2My5jb20+CgpQQ0k6IG1lc29uOiBSZW1vdmUgcmVkdW5kYW50IE1Q
UyBjb25maWd1cmF0aW9uCgpUaGUgTWVzb24gUENJZSBjb250cm9sbGVyIGRyaXZlciBtYW51YWxs
eSBjb25maWd1cmVzIG1heGltdW0gcGF5bG9hZApzaXplIChNUFMpIHRocm91Z2ggbWVzb25fc2V0
X21heF9wYXlsb2FkLCBkdXBsaWNhdGluZyBmdW5jdGlvbmFsaXR5IG5vdwpjZW50cmFsaXplZCBp
biB0aGUgUENJIGNvcmUuIERlcHJlY2F0aW5nIHJlZHVuZGFudCBjb2RlIHNpbXBsaWZpZXMgdGhl
CmRyaXZlciBhbmQgYWxpZ25zIGl0IHdpdGggdGhlIGNvbnNvbGlkYXRlZCBNUFMgbWFuYWdlbWVu
dCBzdHJhdGVneSwKaW1wcm92aW5nIGxvbmctdGVybSBtYWludGFpbmFiaWxpdHkuCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyBiL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gaW5kZXggODU1OWQxMzJkY2RlOC4uMWQz
Njg3NTY2ZGRhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bWVzb24uYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCgpb
IC4uLiBdCgo+IEBAIC0yNTYsNyArMjU0LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fcGNpZV9sdHNz
bV9lbmFibGUoc3RydWN0IG1lc29uX3BjaWUgKm1wKQo+ICAJbWVzb25fY2ZnX3dyaXRlbChtcCwg
dmFsLCBQQ0lFX0NGRzApOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IG1lc29uX3NpemVfdG9fcGF5
bG9hZChzdHJ1Y3QgbWVzb25fcGNpZSAqbXAsIGludCBzaXplKQo+ICtzdGF0aWMgaW50IG1lc29u
X3NpemVfdG9fbXJycyhzdHJ1Y3QgbWVzb25fcGNpZSAqbXAsIGludCBzaXplKQo+ICB7Cj4gIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBtcC0+cGNpLmRldjsKPiAgCj4gQEAgLTI2NiwzNSArMjY0LDE5
IEBAIHN0YXRpYyBpbnQgbWVzb25fc2l6ZV90b19wYXlsb2FkKHN0cnVjdCBtZXNvbl9wY2llICpt
cCwgaW50IHNpemUpCj4gIAkgKiBkd2Mgc3VwcG9ydHMgMl4odmFsKzcpIHBheWxvYWQgc2l6ZSwg
d2hpY2ggdmFsIGlzIDB+NSBkZWZhdWx0IHRvIDEuCiAgICAgICAgICAgICAgICAgXl5eXl5eXl5e
Xl5eXl4KCltTZXZlcml0eTogTG93XQpTaW5jZSB0aGUgZnVuY3Rpb24gaGFzIGJlZW4gcmVwdXJw
b3NlZCBhbmQgcmVuYW1lZCB0byBjYWxjdWxhdGUgTVJSUyAoTWF4ClJlYWQgUmVxdWVzdCBTaXpl
KSwgY291bGQgdGhpcyBjb21tZW50IGJlIHVwZGF0ZWQgdG8gcmVmZXIgdG8gTVJSUyByYXRoZXIK
dGhhbiAicGF5bG9hZCBzaXplIiB0byBhdm9pZCBjb25mdXNpb24/Cgo+ICAJICogU28gaWYgaW5w
dXQgc2l6ZSBpcyBub3QgMl5vcmRlciBhbGlnbm1lbnQgb3IgbGVzcyB0aGFuIDJeNyBvciBiaWdn
ZXIKPiAgCSAqIHRoYW4gMl4xMiwganVzdCBzZXQgdG8gZGVmYXVsdCBzaXplIDJeKDErNykuCj4g
IAkgKi8KPiAgCWlmICghaXNfcG93ZXJfb2ZfMihzaXplKSB8fCBzaXplIDwgMTI4IHx8IHNpemUg
PiA0MDk2KSB7Cj4gLQkJZGV2X3dhcm4oZGV2LCAicGF5bG9hZCBzaXplICVkLCBzZXQgdG8gZGVm
YXVsdCAyNTZcbiIsIHNpemUpOwo+ICsJCWRldl93YXJuKGRldiwgIk1SUlMgJWQsIHNldCB0byBk
ZWZhdWx0IDI1NlxuIiwgc2l6ZSk7Cj4gIAkJcmV0dXJuIDE7Cj4gIAl9CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTMwMTQ1MDE3
LjEzNTYwODgtNi1jYXNzZWxAa2VybmVsLm9yZz9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
