Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5189BC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8n/nN2GQQvm2LB4MU5BQ4Qt04v3h1WAeCL4N5Db4UgI=; b=c2VutJdSdPY03R
	5ertBmxEQuA0NGzGJlU01snszCSRNKhJuKov6w3UHiEstAqat8JWV/ZGd3GXdm4T/zTcIjn4ceA4C
	3OzTh9xZg3BcwyqsjRI7OAopnwQfvpuircFNkb0omslw4lZbWqu93nS7iroZWsmh1X7/L8tKbOkoH
	sOf6ummnAQpBNdjjVAV/SH/5sc2sBWALX4GzQb/GaaeoWxkNkA+POIjTSUwRftEgUeVNY3QY+OVc5
	BuBDDF3eayMtgpyOOw5+vtSu6e24htX+7QQogp9klWRZl55btOlx6r7l988nLNYUUQvqBq4d2gADz
	h/TBe1RT6yUnrQ5jhvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMyFR-00G0zU-MD; Wed, 23 Feb 2022 20:28:29 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMyFG-00G0y0-BP; Wed, 23 Feb 2022 20:28:19 +0000
Received: by mail-io1-xd36.google.com with SMTP id 195so316045iou.0;
 Wed, 23 Feb 2022 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j3u+xo/IEURdRuin0oiVWN0xAJWJDqfhSkcI9D3SfbI=;
 b=HbEIXELccuOf0hWVOgXBf/snUQeXov/yYyjP2y/iHQ1N8apQnriYHgb1QiDBCRjucB
 GFA1t85Aer1wIUGOFXAPvtAmhlxBWB0xgpkk21J9b2dz+QAFk2e2BgDDyz8va5phPiuX
 wVAgGAEIrYi9HkLGRNr/Ttsc4nCSrxZWRZY9Dijt94m59kJFy1xrgFriprUcxnAQG3Cb
 DrMoIRMeriV+iic5UYI/Z2rf248LdxDKF+kZ2S4oBD80JEOMH4bP7vZZjJ4jLtvzyCFP
 f2OBsAsTCoSwAZNuJsxC0cpSLu1A0hCqprC2++26DQ1GD+LHcUx5Z/KvePQwLIdVMnB8
 PlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j3u+xo/IEURdRuin0oiVWN0xAJWJDqfhSkcI9D3SfbI=;
 b=dvKoIhP9zMn6YI8jNbEWhcVdeXgD/pwy8C0DYv231usKAmixvepFF+pdwQURCBPHWT
 jLyGcG8uoPYX/tb9o95ik3Yyj3H9S5Jlgip/m/cuiOSAAZWfMFW+Da0Ir/RTgGH+lfve
 NjOlZzC4pFQMDNxmsYPr+7JHUZ8tOMgIWfoDng5EHw3JHfZ9qxnStD057UeKs14tRyXN
 MKVwlGNDKd5rLZH7543PYfhk8v5XWOcQST+Nz7W8BVZqBWalbHXbrASNc+V9v84oZNg3
 ECoLt54zpP4ocM62DJ3AfU8H7izLWihz/Q+vich4W58eRzflplhbFUxIKKgwkdc/SNg3
 GpUg==
X-Gm-Message-State: AOAM533rBb5XRa9M1kaummOqqkl2Q/bGDhrESmV09cmopeeJ6D8Phsy3
 JLmcoS6OFQYNRmGb79jO9Z5+qwTNAaSU4B2CXuq2xq3p
X-Google-Smtp-Source: ABdhPJxDbCKBFfm9B/Fyen9WfJDQ4/pWumus5ny8gK7Ns5ZEcNWZuqum9MH+JjV6MrvcXvPBGWuuoR+i6zvcIt8dD0c=
X-Received: by 2002:a05:6638:204d:b0:314:a290:48c with SMTP id
 t13-20020a056638204d00b00314a290048cmr1124167jaj.264.1645648095765; Wed, 23
 Feb 2022 12:28:15 -0800 (PST)
MIME-Version: 1.0
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
 <944317db-b659-cb36-addf-c33623a4ff60@gmail.com>
In-Reply-To: <944317db-b659-cb36-addf-c33623a4ff60@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Feb 2022 21:28:04 +0100
Message-ID: <CANiq72kdeuJhaEUOBAB3uYm9SA4Wm0U5=DNgxFMxiGDacUgaBA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_122818_404469_17949BC1 
X-CRM114-Status: GOOD (  22.09  )
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

T24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgNzowMiBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPiB3cm90ZToKPgo+IENvLURldmVsb3BlZC1ieTogSGVpbmVyIEthbGx3ZWl0
IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KCklmIHlvdSAoSGVpbmVyKSBhcmUgZ29pbmcgdG8gYmUg
dGhlICJGcm9tIiBhdXRob3IsIHRoZW4gdGhpcyBsaW5lCnNob3VsZCBub3QgYmUgaGVyZS4KCj4g
KyAgICAgICAgIFNheSBZIHRvIGVuYWJsZSBzdXBwb3J0IGZvciBUaXRhbiBNaWNybyBFbGVjdHJv
bmljcyBUTTE2MjgKPiArICAgICAgICAgTEVEIGNvbnRyb2xsZXIuCj4gKyAgICAgICAgIEl0J3Mg
YSAzLXdpcmUgU1BJIGRldmljZSBjb250cm9sbGluZyBhIHR3by1kaW1lbnNpb25hbCBncmlkIG9m
Cj4gKyAgICAgICAgIExFRHMuIERpbW1pbmcgaXMgYXBwbGllZCB0byBhbGwgb3V0cHV0cyB0aHJv
dWdoIGFuIGludGVybmFsIFBXTS4KCk1heWJlIGEgbmV3bGluZSBiZXR3ZWVuIHBhcmFncmFwaHM/
Cgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgQW5kcmVhcyBGw6RyYmVyCgouLi5oZXJlOiBzaG91
bGQgdGhlcmUgYmUgZW50cmllcyBmb3IgeW91IChIZWluZXIpIHRvbz8gSWYgbm90LCBzaG91bGQK
QW5kcmVhcyBiZSB0aGUgIkZyb20iIGF1dGhvcj8KClRoaXMgYWxzbyBhcHBsaWVzIHRvIHRoZSBg
TU9EVUxFX0FVVEhPUmAuCgpBbHNvIGl0IG1heSBiZSBhIGdvb2QgaWRlYSB0byBhZGQgdGhlIGVt
YWlsczoKCiAgICBNT0RVTEVfQVVUSE9SKCJBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2Uu
ZGU+Iik7CiAgICBNT0RVTEVfQVVUSE9SKCJIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPiIpOwoKKFlvdSBtYXkgYWxzbyB3YW50IHRvIGNvbnNpZGVyIGFkZGluZyBhbiBlbnRy
eSBvbiBgTUFJTlRBSU5FUlNgKS4KCj4gKyAgICAgICB1OCBjbWQgPSBUTTE2MjhfQ01EX0RJU1BM
QVlfTU9ERSB8IGdyaWRfbW9kZTsKCkNvbnNpZGVyIHVzaW5nIGBjb25zdGAgZm9yIHNvbWUgb2Yg
dGhlIHZhcmlhYmxlcy4KCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgcy0+Z3JpZF9zaXplOyBp
KyspIHsKPiArICAgICAgICAgICAgICAgaW50IHBvcyA9IHMtPmdyaWRbaV0gLSAxOwo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKGkgPCBtc2dfbGVuKSB7CgpDb25zaWRlciBpbnZlcnRpbmcgdGhl
IGNvbmRpdGlvbiwgZG9pbmcgdGhlIHNldCB0byBgMGAgKyBgY29udGludWU7YAp0byBhdm9pZCB0
aGUgaW5kZW50YXRpb24uCgo+ICsgICAgICAgc3RydWN0IHRtMTYyOF9sZWQgKmxlZCA9IGNvbnRh
aW5lcl9vZihsZWRfY2Rldiwgc3RydWN0IHRtMTYyOF9sZWQsIGxlZGRldik7Cj4gKyAgICAgICBz
dHJ1Y3QgdG0xNjI4ICpzID0gbGVkLT5jdHJsOwo+ICsgICAgICAgaW50IG9mZnNldDsKPiArICAg
ICAgIF9fbGUxNiBiaXQ7CgpTdHlsZTogc29tZXRpbWVzIHRoZSB2YXJpYWJsZXMgYXJlIGluaXRp
YWxpemVkIHJpZ2h0IGF3YXkgdXNpbmcgYQp2YWx1ZSBmcm9tIGFib3ZlLCBidXQgb3RoZXIgdGlt
ZXMgdGhleSBhcmUgZG9uZSBiZWxvdy4KCj4gKyAgICAgICBpZiAoY291bnQgPiBzLT5ncmlkX3Np
emUgKyAxKSAvKiBjb25zaWRlciB0cmFpbGluZyBuZXdsaW5lICovCgpTdHlsZTogc29tZXRpbWVz
IGNvbW1lbnRzIGFyZSB0cmFpbGluZyB0aGUgbGluZSwgb3RoZXJzIGFyZSBhYm92ZS4KQWxzbywg
c29tZXRpbWVzIHRoZXkgc3RhcnQgd2l0aCB1cHBlcmNhc2UsIGJ1dCBpbiBvdGhlciBjYXNlcyB0
aGV5IGRvCm5vdC4KCkFsc28sIGFib3V0IHRoZSBgKyAxYDogaXMgaXQgcG9zc2libGUgdGhhdCBz
eXNmcyBnaXZlcyB1cyBhIGJ1ZmZlcgpmdWxsIG9mIGBpc3ByaW50KClgPyBpLmUuIGlzIGl0IHBv
c3NpYmxlIHRoYXQgYGdyaWRfc2l6ZSA9PQpNQVhfR1JJRF9TSVpFYCBhbmQgYGNvdW50ID09IE1B
WF9HUklEX1NJWkUgKyAxYCBhbmQgdGhlbiB3ZSBwZXJmb3JtIGFuCm91dC1vZi1ib3VuZHMgc3Rv
cmUgdG8gYE1BWF9HUklEX1NJWkUgKyAyYCBpbiBgdGV4dGA/Cgo+ICsgICAgICAgcmV0ID0gdG0x
NjI4X3dyaXRlX2RhdGEoc3BpLCAwLCBNQVhfR1JJRF9TSVpFKTsKPiArICAgICAgIGlmIChyZXQp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICAvKiBBc3N1bWUgdGhhdCBz
dWJzZXF1ZW50IFNQSSB0cmFuc2ZlcnMgd2lsbCBiZSBvayBpZiBmaXJzdCB3YXMgb2sgKi8KCklm
IG5vdCwgaXMgdGhlcmUgYSBjb25zZXF1ZW5jZT8gaS5lLiB3aHkgd291bGRuJ3Qgb25lIGNoZWNr
IGFuZCBmYWlsCnNpbWlsYXJseSBpbiB0aGUgYHRtMTYyOF9zZXRfKmAgY2FsbHMgYmVsb3c/Cgo+
ICsgICAgICAgaWYgKCFJU19SRUFDSEFCTEUoQ09ORklHX0xFRFNfQ0xBU1MpKQo+ICsgICAgICAg
ICAgICAgICBnb3RvIG5vX2xlZHM7CgpXaGF0IGFib3V0IHB1dHRpbmcgdGhlIGNvZGUgaW4gdGhl
IGBpZmAgYm9keSAobmVnYXRpbmcgdGhlIGNvbmRpdGlvbik/Cgo+ICsgICAgICAgbnVtX2xlZHMg
PSAwOwoKVGhpcyBpcyByZXVzaW5nIHRoZSB2YXJpYWJsZSBmb3IgYSBkaWZmZXJlbnQgcHVycG9z
ZSwgbm8/IGkuZS4gaWYgd2UKZGlkIG5vdCBnZXQgaGVyZSwgd2Ugd291bGQgaGF2ZSBubyBsZWRz
LCB5ZXQgd2Ugd291bGQgcmVwb3J0IHRoZQpudW1iZXIgYWJvdmUuCgo+ICsgICAgICAgZGV2aWNl
X2Zvcl9lYWNoX2NoaWxkX25vZGUoJnNwaS0+ZGV2LCBjaGlsZCkgewo+ICsgICAgICAgICAgICAg
ICB1MzIgcmVnWzJdOwo+ICsKPiArICAgICAgICAgICAgICAgcmV0ID0gZndub2RlX3Byb3BlcnR5
X3JlYWRfdTMyX2FycmF5KGNoaWxkLCAicmVnIiwgcmVnLCAyKTsKPiArICAgICAgICAgICAgICAg
aWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoJnNwaS0+ZGV2LCAi
UmVhZGluZyAlcyByZWcgcHJvcGVydHkgZmFpbGVkICglZClcbiIsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmd25vZGVfZ2V0X25hbWUoY2hpbGQpLCByZXQpOwoKSXMgYSBmYWls
dXJlIGV4cGVjdGVkPyBpLmUuIHRoaXMgYGNvbnRpbnVlO2BzLCBidXQgc2hvdWxkIGl0IGZhaWwg
b3IKaXMgaXQgT0sgdG8gcHJvY2VlZD8KCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgNzsgaSsr
KSB7CgpNYXliZSBhIGAjZGVmaW5lYCBmb3Igc2V2ZXJhbCBvZiB0aGUgYDdgcyBhcm91bmQ/Cgo+
ICtzdGF0aWMgdm9pZCB0bTE2Mjhfc3BpX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQoK
RG9lc24ndCBgLnJlbW92ZWAgcmV0dXJuIGBpbnRgPwoKVGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
