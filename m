Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C0C982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBQkg2nxncLXE6ZaqWiptSJ+UebLFtXYxannwuxdQdE=; b=HhUcP111E62x3o
	EK6FOapvGGgoGvi4gFXen/zjYPy7EuUs1ynAcOMU8U/gAQnr1OLocmQllC+C7qhDnB7hL6pX4J0Wi
	B2DHoQWpH+/XG/PLK70ycUTckmpUkWrAzZ+2r3NpGkb6JWFD4Hl7wlHMozPpGzxVJptUR6TKrUaFl
	QgguuPkhr1JIBZWyXEvH+lhxu6bU+5haJjnv6ij0d30Jb86D1vu13mBIMQi5gwXFIxekudFFXUh54
	10L7o8GFedLQo8rU4oq8ICpKf5sB4ueOsS78BwcifDEjoOQNwCEutjgJOv6nH2HxPYu9RxJhNWDSj
	OxAaDQNAQSZ60cdDK8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77F1-0000000Arf7-2K8H;
	Thu, 17 Sep 2026 08:13:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77F0-0000000Arf1-1bxV
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:13:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C2240D98;
	Thu, 17 Sep 2026 08:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBD21F000FF;
	Thu, 17 Sep 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632790;
	bh=Sdk+GwiMg6X2HAGf1p+c0hsGXa8yOHTezJWVgAivQS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wv0HWmbH0opbo+DqUFX8R6YQ/lV8lz5Tb4ZhORfjjSZePou5rOhgCU7r9xUsUdBxN
	 xl/af5HZn26DFub7cRgTWV8PtKtrORY6ezYDmU6sg9brmD0iRGJP7/T/l0jq593sJz
	 osBrdRXx38AxgexbJ99eNoZNnkM4aghMNmRi89uvqfpURS/0C8ex3rksufkDUUed8d
	 AWE0bspw9Lf9YFNAeMvCWNmoiM76bgSGvacaAeV6jYRT6lj4wlpWEY71ovVxvlvT/c
	 DmFBkDrUZVCz7jcos8zatObBlPSeew5qlL+mRm3MYjYpt3FeomAQeICY0oub3qkF5Z
	 hyxc8SMexLbMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:13:09 +0000
Message-Id: <20260917081309.8FBD21F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gdGhlcm1hbDoga2hh
ZGFzLW1jdS1mYW46IE9GIG5vZGUgcmVmZXJlbmNlIGxlYWsgaW4gcHJvYmUKLS0KCmNvbW1pdCBj
M2EwNjQ0YmU0NjUxOGY0NzEyNDY0NGE5MDIzNWQyNjk3OWM0Mjk5CkF1dGhvcjogUm9uYWxkIENs
YXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cgp0aGVybWFsOiBraGFkYXMtbWN1LWZh
bjogQWRkIGZhbiBjb25maWcgZnJvbSBwbGF0Zm9ybSBkYXRhIEFkZCByZWd1bGF0b3Igc3VwcG9y
dAoKVGhpcyBjb21taXQgaW50cm9kdWNlcyB2YXJpYW50LXNwZWNpZmljIHBsYXRmb3JtIGRhdGEg
aW5jbHVkaW5nIGNvbnRyb2wKcmVnaXN0ZXJzIGFuZCBkdXR5LWN5Y2xlIGxldmVscywgd2hpbGUg
YWxzbyBidW1waW5nIHRoZSBtYXhpbXVtIGxldmVsLgpJdCBvcHRpb25hbGx5IGFjcXVpcmVzIGFu
ZCBlbmFibGVzIGEgZmFuIHJlZ3VsYXRvciBzdXBwbHkgYXQgcHJvYmUgdGltZQp0byBoYW5kbGUg
Ym9hcmRzIHRoYXQgZ2F0ZSBmYW4gcG93ZXIuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJt
YWwva2hhZGFzX21jdV9mYW4uYyBiL2RyaXZlcnMvdGhlcm1hbC9raGFkYXNfbWN1X2Zhbi5jCj4g
aW5kZXggMjFiM2QwYTcxYmQwZC4uMWRhNjM5ZDA1NDk3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3RoZXJtYWwva2hhZGFzX21jdV9mYW4uYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9raGFkYXNf
bWN1X2Zhbi5jClsgLi4uIF0KPiBAQCAtNzYsMjIgKzgyLDcxIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZV9vcHMga2hhZGFzX21jdV9mYW5fY29vbGluZ19vcHMg
PSB7Cj4gIHN0YXRpYyBpbnQga2hhZGFzX21jdV9mYW5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgewo+ICsJY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCAqaWQg
PSBwbGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpOwo+ICAJc3RydWN0IGtoYWRhc19tY3UgKm1j
dSA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsKPiAgCXN0cnVjdCB0aGVybWFs
X2Nvb2xpbmdfZGV2aWNlICpjZGV2Owo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKPiAgCXN0cnVjdCBraGFkYXNfbWN1X2Zhbl9jdHggKmN0eDsKPiAgCWludCByZXQ7Cj4gIAo+
ICsKPiArCWlmICghZGV2LT5vZl9ub2RlKQo+ICsJCWRldi0+b2Zfbm9kZSA9IG9mX25vZGVfZ2V0
KGRldi0+cGFyZW50LT5vZl9ub2RlKTsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgbGVh
ayB0aGUgT0Ygbm9kZSByZWZlcmVuY2U/IFRoZSBwcm9iZSBmdW5jdGlvbiBleHBsaWNpdGx5CmFj
cXVpcmVzIHRoZSBub2RlIHdpdGggb2Zfbm9kZV9nZXQoKSBhbmQgYXNzaWducyBpdCB0byBkZXYt
Pm9mX25vZGUsCmJ1dCB0aGVyZSBpcyBubyBjb3JyZXNwb25kaW5nIGNsZWFudXAgbWVjaGFuaXNt
LgoKU2luY2UgdGhlcmUgaXMgbm8gLnJlbW92ZSBjYWxsYmFjayBvciBkZXZtIGFjdGlvbiByZWdp
c3RlcmVkIHRvIGNhbGwKb2Zfbm9kZV9wdXQoKSwgYW5kIHRoZSBkcml2ZXIgY29yZSBkb2VzIG5v
dCBhdXRvbWF0aWNhbGx5IGRyb3AKcmVmZXJlbmNlcyBhc3NpZ25lZCBkaXJlY3RseSB0byBkZXYt
Pm9mX25vZGUgaW4gdGhpcyBtYW5uZXIsIHRoZQpyZWZlcmVuY2UgY291bnQgYXBwZWFycyB0byBs
ZWFrIGV2ZXJ5IHRpbWUgdGhlIGRyaXZlciBpcyB1bmJvdW5kLgoKPiArCj4gKwlpZiAoIWlkKQo+
ICsJCXJldHVybiAtRUlOVkFMOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNy1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12MTIt
MC00OTdjZDU0M2ExNDhAYWxpZWwuZnI/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
