Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEC1C64EC7
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Feb 2023 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlMl/Sy97p9Mlw4h/MuMDQevW/l96RMUoCbyw1S+Cvc=; b=iEy0+ADfKU0YxU
	cbgERZBBpQhSflaC3xgh0BtX8EWjHddlQ4ScbQSvhITQTvzNgu9WcEi3xuaURQSIjUODaRR3YsTMv
	q2vcxasK1Dq5W5+WwDvhEoZwvjnZ6yY7+uQndHLH//EbcqfVXAD5WkiBh+0Ou5Y/1xUwVg229RoMD
	MMefnf+KnalTebRoh6RO7Sv4NDNXqyE/UHdHy9EdMbdUQONpAAo9eKBa4QpyfOyPzuTxZtEDrg1bi
	oQ6AzqV1UuR59EPYKcQJXW/FD/jyBD99Lipx893ffsU8CixqwB+lMlKkXgBZryH0YCv1Q0HUjtrJt
	RZMh3eyjDEdDhB1TRwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxJV-00603C-1y; Sat, 25 Feb 2023 16:22:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxJS-00602f-8a; Sat, 25 Feb 2023 16:22:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B556B80185;
	Sat, 25 Feb 2023 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A840C433EF;
	Sat, 25 Feb 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677342129;
	bh=1so1HSVz0ETNHTl8zcCrxEfHypT4MW9Jll5ddDNa2XM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pPyX+1/vrCNryiHnMvBMYvsmLZaQUfpXAI+eG8GafqUiPkk6Yvn6K0oIgAN/Q+fGr
	 mkqgu9p9VtPR2sIiX01kcxmm+KDLPf35uv032WCBUOe90lhFshZnQiCWMMAmiIFQxb
	 1TRmzidCC2SwaJcPKsV2fB8+H95l7kIm0k2CNfeKvT1izMY1r1yvWBc9uYqRdid2nO
	 rX4xCQOEgY/fO+LuZ7FYmzI6r3v5n6JGk3eMVuPYRq+RpmNxa8FxJwrtbRGTEEf6Gu
	 fWoPTdHtA27PuBK7lNUbjX5kRupP5ZNuKwj83atcrO0gpVFTJ0+ZsVjsSjTyWRTXkd
	 TXCD8My4KJU0Q==
Date: Sat, 25 Feb 2023 16:36:32 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Lars-Peter Clausen <lars@metafoo.de>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH v2] iio: adc: meson_saradc: Better handle BL30 not
 releaseing the hardware
Message-ID: <20230225163632.4891019e@jic23-huawei>
In-Reply-To: <CAFBinCCF_wSt6qd125f=7wzCPm21iz6ZbJ2oHGnPNBJy30y_DA@mail.gmail.com>
References: <20230219204439.1641640-1-u.kleine-koenig@pengutronix.de>
	<CAFBinCCF_wSt6qd125f=7wzCPm21iz6ZbJ2oHGnPNBJy30y_DA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_082218_491536_0AE1C9A1 
X-CRM114-Status: GOOD (  16.89  )
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

T24gU3VuLCAxOSBGZWIgMjAyMyAyMjowNToxNiArMDEwMApNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGVsbG8gVXdlLAo+
IAo+IEkgdGhpbmsgdGhlcmUncyBhIHR5cG8gaW4gdGhlIHN1YmplY3QgbGluZToKPiBzL3JlbGVh
c2VpbmcvcmVsZWFzaW5nLwo+IAo+IE9uIFN1biwgRmViIDE5LCAyMDIzIGF0IDk6NDQgUE0gVXdl
IEtsZWluZS1Lw7ZuaWcKPiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToK
PiA+Cj4gPiBtZXNvbl9zYXJfYWRjX2xvY2soKSBtaWdodCByZXR1cm4gYW4gZXJyb3IgaWYgQkwz
MCBkb2Vzbid0IHJlbGVhc2UgaXRzCj4gPiBsb2NrIG9uIHRoZSBoYXJkd2FyZS4gSnVzdCByZXR1
cm5pbmcgZWFybHkgZnJvbSAucmVtb3ZlKCkgaXMgd3JvbmcKPiA+IGhvd2V2ZXIgYXMgdGhpcyBr
ZWVwcyB0aGUgY2xvY2tzIGFuZCByZWd1bGF0b3JzIG9uIHdoaWNoIGlzIG5ldmVyCj4gPiBjbGVh
bmVkIHVwIGxhdGVyLgo+ID4KPiA+IEdpdmVuIHRoZSBCTDMwIG5vdCBnaXZpbmcgdXAgaXRzIGxv
Y2sgaXMgYSBzdHJvbmcgaGludCBmb3IgYnJva2VuCj4gPiBiZWhhdmlvdXIsIGFuZCB0aGVyZSBp
cyBub3RoaW5nIHdlIGNhbiBkbyBhYm91dCB0aGF0OiBKdXN0IGNsZWFuIHVwCj4gPiBpZ25vcmlu
ZyB0aGUgZmFjdCB0aGF0IHdlJ3JlIG5vdCBob2xkaW5nIHRoZSBsb2NrLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+ICAKPiBPdGhlciB0aGFuIHRoZSB0eXBvICh3aGljaCBtYXliZSBKb25hdGhhbiBjYW4gZml4
IHVwIHdoaWxlIGFwcGx5aW5nKToKPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KRml4ZWQgdXAgdHlwbyBhbmQgYXBw
bGllZCB0byB0aGUgdG9ncmVnIGJyYW5jaCBvZiBpaW8uZ2l0LgoKTm90ZSBJJ2xsIG5vdCBwdXNo
IHRoYXQgb3V0IG90aGVyIHRoYW4gYXMgdGVzdGluZyB1bnRpbCBJIGNhbiByZWJhc2Ugb24gcmMx
LgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gCj4gCj4gVGhhbmsgeW91IQo+IE1hcnRpbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
