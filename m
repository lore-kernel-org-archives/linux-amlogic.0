Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265CCA0FE6
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Sep 2023 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f+Wx+X/ss7jTs5SasLfTJ3D2lo5PRPHvaRWz7r1rJ0=; b=VP3dmmUT0kPFXC
	4hQTzU86M78dI/inOrv/D7uQpFB3UGiTdNhTeuixi0SUbDANhB809khLKULyRJ/MiahBuUPDrF56i
	6aDf2FcLdy1NtKgLyYydroO+/x783C4YyV34gf+6pyvb3oCQRx5zCvlae61AdLiZ256WPAzENx7GV
	0G0/nAACbzOlaXzmPlk/Nf3k1y+wtKdVVi2aC5l/2eAQH/+EQieKHohf7GbtqgB8ZTOoL6q7/fPtC
	nvfftkCFfbnY9SRupSLWOnBzxzIiVgXv2ow3TT6NBYVtyn2BUOGdHhjSVSXtdKskf1RKrLs7pDu0v
	e+GNiE6n59pRB5t2XlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz6k-00Gdnu-1d;
	Fri, 01 Sep 2023 08:02:22 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz6h-00GdmU-0l;
	Fri, 01 Sep 2023 08:02:20 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 3A6A51007F5; Fri,  1 Sep 2023 09:02:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1693555332; bh=hAB9s4XrUu7LHVJzvkljFiphva5beXTT7msBZLZEBik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwFfL+hgCH8bfV7jFXSUAVurMFlcFyfbk54nZRRDFq6G0FEb81orDgMedlONbQT3r
	 z6V3rxGcBhL1RCO1hmvcqYOUOxwRaWcWYBN1XDaI2ZR6lMdo4T2ASNq3OsFSf2fHe8
	 h3qrZPkHn7eXZxwTkjmbpQdOliVId5EVQ8McECSfpwhYq1FxnUp3lrcf+oxh3cacWU
	 Y9yaiZ6ou77KDW9NuXhbTIrP1D1JQDhUu1pygY4L5tRp0AKtJYfuLplrCtv+/7dCbV
	 p4+ylaWdtqxusZ3x2cQJZ3n3u6vV1ognjHcvtAe/XKKScWwKkUsRT/kb24OR1ICM9f
	 xXzw45ejGUGWQ==
Date: Fri, 1 Sep 2023 09:02:12 +0100
From: Sean Young <sean@mess.org>
To: Zelong Dong <Zelong.Dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
	kelvin.zhang@amlogic.com
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Message-ID: <ZPGahNKlq/31MXbh@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_010219_446918_A99EB4FA 
X-CRM114-Status: GOOD (  24.89  )
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

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMDg6MTM6MjJQTSArMDgwMCwgWmVsb25nIERvbmcgd3Jv
dGU6Cj4g5ZyoIDIwMjMvOC8yOSAxNTozOSwgU2VhbiBZb3VuZyDlhpnpgZM6Cj4gPiBPbiBGcmks
IEF1ZyAyNSwgMjAyMyBhdCAwNzo1MzowOFBNICswODAwLCB6ZWxvbmcgZG9uZyB3cm90ZToKPiA+
ID4gRnJvbTogWmVsb25nIERvbmc8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4gPiA+IAo+ID4g
PiBNZXNvbiBJUiBDb250cm9sbGVyIHN1cHBvcnRzIGhhcmR3YXJlIGRlY29kZXIgaW4gTWVzb24t
UzQgYW5kIGxhdGVyCj4gPiA+IFNvQy4gU28gZmFyLCBwcm90b2NvbCBORUMgY291bGQgYmUgZGVj
b2RlZCBieSBoYXJkd2FyZSBkZWNvZGVyLgo+ID4gT24gTWVzb24tUzQsIG9ubHkgdGhlIGhhcmR3
YXJlIGRlY29kZXIgZm9yIE5FQyBjYW4gYmUgdXNlZCB1c2luZyB0aGlzCj4gPiBkcml2ZXIuIERv
ZXMgdGhlIE1lc29uLVM0IGhhcmR3YXJlIHN1cHBvcnQgc29mdHdhcmUgZGVjb2Rpbmc/IElmCj4g
PiBzb2Z0d2FyZSBkZWNvZGluZyBjb3VsZCBiZSB1c2VkLCB0aGVuIGFueSBwcm90b2NvbCBjb3Vs
ZCBiZSBzdXBwb3J0ZWQsCj4gPiBub3QganVzdCBORUMuCj4gPiAKPiA+IEFsc28sIG91dCBvZiBp
bnRlcmVzdCwgaXMgdGhlcmUgYXJlIGRvY3VtZW50YXRpb24gYXZhaWxhYmxlIGZvciB0aGlzCj4g
PiBoYXJkd2FyZT8KPiA+IAo+ID4gVGhhbmtzLAo+ID4gCj4gPiBTZWFuCj4gPiAKPiBZZXMsIElS
IGRyaXZlciBzdGlsbCBzdXBwb3J0cyBTVyBkZWNvZGluZyBvbiBNZXNvbi1TNC4gVGhlIGRlY29k
ZSBtb2RlIGNvdWxkCj4gYmUgY2hhbmdlZCBieSAnc3VwcG9ydF9od19kZWNvZGVyJy4KClRoaXMg
cmVxdWlyZXMgY2hhbmdpbmcgdGhlIHNvdXJjZSBjb2RlLCBpdCBjYW5ub3QgYmUgZG9uZSBhdCBy
dW50aW1lLgoKPiBJZiBJUiBDb250cm9sbGVyIHdvcmtzIGluIFNXIGRlY29kaW5nLCBkcml2ZXIg
d2lsbCBiZSByZWdpc3RlcmVkIGJ5Cj4gUkNfRFJJVkVSX0lSX1JBVyBhbmQgYWxsb3dzIGFsbCBw
cm90b2NvbC4KPiBPdGhlcndpc2UsIGRyaXZlciB3aWxsIGJlIHJlZ2lzdGVyZWQgYnkgUkNfRFJJ
VkVSX1NDQU5DT0RFIGFuZCBvbmx5IGFsbG93cwo+IE5FQy4KPiAKPiA0ODkgICAgICAgICBpZiAo
aXItPnJjLT5kcml2ZXJfdHlwZSA9PSBSQ19EUklWRVJfSVJfUkFXKSB7Cj4gNDkwICAgICAgICAg
ICAgICAgICBpci0+cmMtPmFsbG93ZWRfcHJvdG9jb2xzID0gUkNfUFJPVE9fQklUX0FMTF9JUl9E
RUNPREVSOwo+IDQ5MSAgICAgICAgICAgICAgICAgaXItPnJjLT5yeF9yZXNvbHV0aW9uID0gTUVT
T05fUkFXX1RSQVRFOwo+IDQ5MiAgICAgICAgICAgICAgICAgaXItPnJjLT5taW5fdGltZW91dCA9
IDE7Cj4gNDkzICAgICAgICAgICAgICAgICBpci0+cmMtPnRpbWVvdXQgPSBJUl9ERUZBVUxUX1RJ
TUVPVVQ7Cj4gNDk0ICAgICAgICAgICAgICAgICBpci0+cmMtPm1heF90aW1lb3V0ID0gMTAgKiBJ
Ul9ERUZBVUxUX1RJTUVPVVQ7Cj4gNDk1ICAgICAgICAgfSBlbHNlIGlmIChpci0+cmMtPmRyaXZl
cl90eXBlID09IFJDX0RSSVZFUl9TQ0FOQ09ERSkgewo+IDQ5NiAgICAgICAgICAgICAgICAgaXIt
PnJjLT5hbGxvd2VkX3Byb3RvY29scyA9IFJDX1BST1RPX0JJVF9ORUM7Cj4gNDk3ICAgICAgICAg
ICAgICAgICBpci0+cmMtPmNoYW5nZV9wcm90b2NvbCA9IG1lc29uX2lyX2h3X2RlY29kZXJfaW5p
dDsKPiA0OTggICAgICAgICB9CgpUaGVyZSBhcmUgb3RoZXIgZHJpdmVycyB0b28gd2hpY2ggY2Fu
IGRvIGhhcmR3YXJlIGRlY29kaW5nIGFuZCBzb2Z0d2FyZQpkZWNvZGluZy4gSWRlYWxseSB3ZSBz
aG91bGQgaGF2ZSBhIG1lY2hhbmlzbSB0byBzd2l0Y2ggYmV0d2VlbiB0aGVtIGF0CnJ1bnRpbWUs
IGJ1dCBhcy1pcyByYy1jb3JlIGRvZXMgbm90IHByb3ZpZGUgZm9yIHRoaXMuCgo+IERvIHlvdSBn
ZXQgTWVzb24tUzQgZGF0YXNoZWV0PyBQbGVhc2UgcmVmZXIgdG8gY2hhcHRlciAxMy41IEluZnJh
cmVkIFJlbW90ZS4KCkkgZGlkIG5vdCBnZXQgaXQsIHVuZm9ydHVuYXRlbHkuIEFueSBoZWxwIHdv
dWxkIGJlIGFwcHJlY2lhdGVkLCB0aGFua3MuCgpPdGhlciB0aGFuIHRoYXQsIHRoZSBkcml2ZXIg
ZG9lcyBsb29rIGZpbmUuIE5vdGhpbmcgdG8gaG9sZCB1cCBtZXJnaW5nIGZvci4gCkknbGwgYXBw
bHkgaXQgd2hlbiBJIGNhbi4KClRoYW5rcywKClNlYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
