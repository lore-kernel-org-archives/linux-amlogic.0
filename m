Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A850C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Nov 2021 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azZSpNgNqQAl9lkG2LwiPalQ9+sUfyhKA9VqRuenQAY=; b=WtZw0wicosX+sq
	rUWpzifnMvz4J3lkxyCe4yTukP21hWJr7Y+LCOVcH43y8/0HkhaVjz3lIfJ3+Fnbvfxw2hKMefXnb
	uF6VOtkj8lELfXgYqOrJMkjTRtRjZ91GwQyj01sqbxiY4Xvv863z2H5YTjh3ado8J1RqESOZqGgz5
	oxfVX4ZP4ic0mPNmC6OXI8c+7FBFgUdDWs5dxsilTX7EEgCuRrqMtuCR8y7yB6Bjuz4wcsPjYXUIn
	9zM3b+O4kYDVAEDQOvJtl+oHC0bnVBe/T8m42uQlSegGbEYWscs30PJHSywvFaEKumK3K2hg2YvJW
	ulZldvC4vDQkZ11R/0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp5G2-00FTQn-IY; Mon, 22 Nov 2021 09:05:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5EP-00FSxH-BC
 for linux-amlogic@lists.infradead.org; Mon, 22 Nov 2021 09:03:22 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mp5EK-0003l5-Mh; Mon, 22 Nov 2021 10:03:16 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mp5EK-000584-31; Mon, 22 Nov 2021 10:03:16 +0100
Message-ID: <44f6cc1f52e75cbbb8aebb0d4648c94ae479ef43.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared
 reset controller use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, khilman@baylibre.com
Cc: balbi@kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Date: Mon, 22 Nov 2021 10:03:16 +0100
In-Reply-To: <20211112162827.128319-2-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-2-aouledameur@baylibre.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_010321_428381_03132DA6 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW1qYWQsCgpPbiBGcmksIDIwMjEtMTEtMTIgYXQgMTc6MjggKzAxMDAsIEFtamFkIE91bGVk
LUFtZXVyIHdyb3RlOgo+IFVzZSByZXNldF9jb250cm9sX3JlYXJtKCkgY2FsbCBpZiBhbiBlcnJv
ciBvY2N1cnMgaW4gY2FzZQo+IHBoeV9tZXNvbl9neGxfdXNiMl9pbml0KCkgZmFpbHMgYWZ0ZXIg
cmVzZXQoKSBoYXMgYmVlbiBjYWxsZWQgOyBvciBpbiBjYXNlCj4gcGh5X21lc29uX2d4bF91c2Iy
X2V4aXQoKSBpcyBjYWxsZWQgaS5lIHRoZSByZXNvdXJjZSBpcyBubyBsb25nZXIgdXNlZAo+IGFu
ZCB0aGUgcmVzZXQgbGluZSBtYXkgYmUgdHJpZ2dlcmVkIGFnYWluIGJ5IG90aGVyIGRldmljZXMu
Cj4gCj4gcmVzZXRfY29udHJvbF9yZWFybSgpIGtlZXBzIHVzZSBvZiB0cmlnZ2VyZWRfY291bnQg
c2FuZSBpbiB0aGUgcmVzZXQKPiBmcmFtZXdvcmsuIFRoZXJlZm9yZSwgdXNlIG9mIHJlc2V0X2Nv
bnRyb2xfcmVzZXQoKSBvbiBzaGFyZWQgcmVzZXQgbGluZQo+IHNob3VsZCBiZSBiYWxhbmNlZCB3
aXRoIHJlc2V0X2NvbnRyb2xfcmVhcm0oKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbWphZCBPdWxl
ZC1BbWV1ciA8YW91bGVkYW1ldXJAYmF5bGlicmUuY29tPgo+IFJlcG9ydGVkLWJ5OiBKZXJvbWUg
QnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvcGh5L2FtbG9n
aWMvcGh5LW1lc29uLWd4bC11c2IyLmMgfCA1ICsrKystCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5
L2FtbG9naWMvcGh5LW1lc29uLWd4bC11c2IyLmMgYi9kcml2ZXJzL3BoeS9hbWxvZ2ljL3BoeS1t
ZXNvbi1neGwtdXNiMi5jCj4gaW5kZXggMmIzYzBkNzMwZjIwLi45YTljNzY5ZWNhYmMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9waHkvYW1sb2dpYy9waHktbWVzb24tZ3hsLXVzYjIuYwo+ICsrKyBi
L2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWd4bC11c2IyLmMKPiBAQCAtMTEwLDggKzEx
MCwxMCBAQCBzdGF0aWMgaW50IHBoeV9tZXNvbl9neGxfdXNiMl9pbml0KHN0cnVjdCBwaHkgKnBo
eSkKPiDCoAlpbnQgcmV0Owo+Cj4gwqAJcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldChwcml2LT5y
ZXNldCk7Cj4gLQlpZiAocmV0KQo+ICsJaWYgKHJldCkgewo+ICsJCXJlc2V0X2NvbnRyb2xfcmVh
cm0ocHJpdi0+cmVzZXQpOwoKSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuIElmIHJlc2V0X2NvbnRy
b2xfcmVzZXQoKSByZXR1cm5zIGFuIGVycm9yIGZvciBhCnNoYXJlZCByZXNldCwgaXQgc2hvdWxk
IGhhdmUgZWl0aGVyCi0gcmV0dXJuZWQgYmVmb3JlIGluY3JlbWVudGluZyB0cmlnZ2VyZWRfY291
bnQsIG9yCi0gaW5jcmVtZW50ZWQgdHJpZ2dlcmVkX2NvdW50LCBnb3QgYSBmYWlsZWQgcmVzZXQg
b3AsIGRlY3JlbWVudGVkCiAgdHJpZ2dlcmVkX2NvdW50IGFnYWluCgpJbiBib3RoIGNhc2VzIHRo
ZXJlIHNob3VsZCBiZSBubyBuZWVkIHRvIHJlYXJtLgoKCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
