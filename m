Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CBEFF885C
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2026 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGXu2SRT7OUpoIbZ12VKaLgJJ24dNCXnZnZWYzW0wyc=; b=xPKM2RdXBJZ95F
	tyJxrgtPWaZfP7BVSwbWoYCeMqFeaTeXcLVRFKBeu4YqlHahAsUqayDjpTnLTUFAhNeLPAdvOxAly
	gvVxSQqTrTbq8vHKa98fcylM6RS/o1Q50w0PSEjrINnT9xnvqO4V4G3ohVHURa3VKVSna1l3/6HdQ
	i66JQkWDrFsplz8j+V5zIQ+nOnUfOEI8KmlHLcDUR6j1t61RnhoSXDJJYa8eWHyGN0vPHhptuLBFy
	bJ/XpkqEZKvUQLGU2Obh4TgxJwYsDXpnEqQSA8vpvyqEJdj/KiobR4ADyoOD6MFkhky8FL2YNRKk0
	H4vuDdYeageZOcb4HHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwuQ-0000000FSMx-1dBv;
	Sun, 26 Apr 2026 10:40:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwuO-0000000FSMQ-29jd;
	Sun, 26 Apr 2026 10:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1407240E90;
	Sun, 26 Apr 2026 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A8C2BCAF;
	Sun, 26 Apr 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777200014;
	bh=Hpm/RHjdQVWHP69xS9eePzzNeO07/UiUtBrVtlV/V5g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LfMTQ6VjKOLIduL9F9kUqMzrEhMqpJrqNy21O/BU8cJbFXiP0KJl3Tq057NxPRxba
	 jFYy7x3IRQk5sWfBrmtD0jfO1wkZdUF9ig83iR8pE49NhPF98GSxqCjbILsea1rEX7
	 PEU+VdL0euAY2xQjCeGOGUyOQKwF8v2tZTChNMOM7aR3t6Ndita8cZ1fBbtCz/ttZH
	 OwydDmDJZcGMMXPId0T+WtdUBnRAD7P9Sy1Vzd+4xihzIpyOmOfBUoPEoYMDkKortz
	 etxi6Qe7gW1DktXjDp9KsPgK9pv8h2G8d5NhZqTNb8QPGN4J+X8DeUAo2GPK0fmf6B
	 digQyHqCw1Lww==
Date: Sun, 26 Apr 2026 11:40:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260426114005.72fdbc49@jic23-huawei>
In-Reply-To: <CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
	<20260425194412.1872eff8@jic23-huawei>
	<754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
	<CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_034016_575971_D5BA83FC 
X-CRM114-Status: GOOD (  14.08  )
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

T24gU3VuLCAyNiBBcHIgMjAyNiAxMTo1NDo0NyArMDgwMApGZWxpeCBHdSA8dXN0Yy5ndUBnbWFp
bC5jb20+IHdyb3RlOgoKPiBPbiBTdW4sIEFwciAyNiwgMjAyNiBhdCA3OjE24oCvQU0gRGF2aWQg
TGVjaG5lciA8ZGxlY2huZXJAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+IEkganVzdCB1cGRhdGVk
IGlpby90ZXN0aW5nIHRvZGF5IGFuZCBJIHNlZSByZXR1cm4gd2l0aG91dCBrZnJlZSgpLgo+ID4K
PiA+ICAgICAgICAgcHJpdi0+dHNjX3JlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3Bo
YW5kbGUoZGV2LT5vZl9ub2RlLCAiYW1sb2dpYyxoaGktc3lzY3RybCIpOwo+ID4gICAgICAgICBp
ZiAoSVNfRVJSKHByaXYtPnRzY19yZWdtYXApKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwcml2LT50c2NfcmVnbWFwKSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCBhbWxvZ2ljLGhoaS1z
eXNjdHJsIHJlZ21hcFxuIik7ICAKPiA+ID4+IFNob3VsZCBgI2luY2x1ZGUgPGxpbnV4L2NsZWFu
dXAuaD5gIHRob3VnaCByYXRoZXIgdGhhdCByZWx5aW5nIG9uIGl0IGJlaW5nCj4gPiA+PiBpbmNs
dWRlZCB0aHJvdWdoIGFub3RoZXIgaGVhZGVyLgo+ID4gPj4KPiA+ID4+IFdpdGggdGhhdCBmaXhl
ZC4uLgo+ID4gPj4KPiA+ID4+IFJldmlld2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxkbGVjaG5lckBi
YXlsaWJyZS5jb20+Cj4gPiA+PiAgCj4gPiA+ICAKPiA+ICAKPiBIaSBKb25hdGhhbiwKPiBUaGlz
IGNvZGUgd2FzIG1lcmdlZCBpbnRvIGxpbnV4L21hc3RlciB5ZXN0ZXJkYXksIHBlcmhhcHMgeW91
IGhhdmVuJ3QKPiB1cGRhdGVkIHRoZSBjb2RlIGJhc2UuCkFoLiAgTXkgYmFkLiAgSSB0ZW5kIHRv
IGJlIGxhenkgYW5kIHVzZSBlbGl4aXIgdG8gY2hlY2sgc3R1ZmYgbGlrZSB0aGlzCmFuZCBoYWQg
Y29tcGxldGVseSBmb3Jnb3R0ZW4gSSBtZXJnZWQgdGhlIHBhdGNoIHRoYXQgYnJva2UgdGhpcyA6
KAoKSgo+IAo+IEJlc3QgcmVnYXJkcywKPiBGZWxpeAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
