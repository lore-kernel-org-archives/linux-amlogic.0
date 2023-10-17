Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141ADCDB474
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Oct 2023 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdSzK7QhmnB6vbs4eybkWnsGy8ak20hmZODW1yRtYHQ=; b=Nw/jVIoGb6RVCX
	WfsWPJ8mLO9aPldabWulvJyFqgzvTe0mnWLmu/k91NoMUDBkGZ/G+6LTTjk3CI3lbPwdWYWATm3Vq
	PV6ITq2Sl+WDQNvB+yk7tXLsq1z0ZxPI9ER7Ru7lwKX/xMMmJWU+6no/pvDDL5aDBregFoUIgKeGN
	63o/ymTBcCiVAMOKbysyP8mvNV9f3dcjbUhJN0/T6HVPdPzN1c6heNU/Q3jqiK0yO1pK+/i3n77Os
	l750qu80jMQGE7uiaoN/IXX1D3JBhT73/o3birTv3ZCAIiaxxUx6+WvLuvdQMOq8rrcm8073UvhQD
	nTOuwey1N53ajLnXkmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslFz-00CXyB-2Y;
	Tue, 17 Oct 2023 14:41:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslFt-00CXwW-1U
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Oct 2023 14:41:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4065f29e933so60702575e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Oct 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697553667; x=1698158467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeSuhOAfe8uX1nxMYhxXrKrbGF4+PCa5XD6SY0VOMwo=;
        b=B/RaHjI94V9UNmlb23Vdb/fo0XvYTVYbR2wdL5P1w1J6xagMC2Zaeyzk+4j0DpGu7y
         X3d3R9J4x8u9VppDMP6XOHp8lw+xP8ft8knlFWoRSTaRWvtRThGtbOl50f9v1PyrsCGd
         JTBEkX1Iqo7KF9erDZKlVYAFWxHjYp1cjHfTrTl+wCWdjTDrwkmn1W75/30XUKpQ3gxM
         OJ1/OqXQHbjIIvnjjykSG6jZFucpn9Md73Q/E6SjSOsX5Wa7fWTgVS1SMDJYHg8AwFZZ
         18pd7JXwPAxRAEAY/JiayrBZgcAWhpbHDQJIDqysQjEqSh6+aZUO4wl5rbPzUH47sjWs
         cMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697553667; x=1698158467;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeSuhOAfe8uX1nxMYhxXrKrbGF4+PCa5XD6SY0VOMwo=;
        b=XO2DUQ/e8GHCKioaV85we+o+caFtt0NQEXgtzy6Mnena26m3AKwdvRkEmyeymlnLVz
         e9JQCRNBCsXPcgZfyntDS0HTyUfL2HZyzeOBVU/kRIF7lP3+++Z3sNS8Y56QZdwg5Xen
         vMW6r5MmxZnDouolfWvtkLbQrXtxGBRaZs47Vc/1vv509s+lxVCkuWEWQynK5MLempwb
         TqmDkZA7OfgCmj+7jmxwW2ox7thPMwQXAgl2YrwJdBidzMt13161ojCzfj7giu6fSenA
         Ck1zOKzyJgg5A4iNXEMm1TnXYvnSlryurQlw62zkgS2niMygY/ZxlyB2nTOYWRNMEXeM
         YXNg==
X-Gm-Message-State: AOJu0Yy0XsifkIyK+arqJ5aGaTLhyW11r0Xeg/lLYJ0gYrR9SxZ+daJN
	qm73m0c/nXkr6z0uM4I9ieZ8Ow==
X-Google-Smtp-Source: AGHT+IHhrchh4iIbdk+aSFRRGdmVqCLZoJcJXWRoGMfMw5EbnIjIa1N2pkVKS00Q7mYarILCif/Z/w==
X-Received: by 2002:a5d:4e90:0:b0:32d:a4c4:f700 with SMTP id e16-20020a5d4e90000000b0032da4c4f700mr2208044wru.38.1697553666986;
        Tue, 17 Oct 2023 07:41:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:93d3:2aab:95bb:3a09])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d6586000000b00317a04131c5sm1825996wru.57.2023.10.17.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:41:06 -0700 (PDT)
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
 <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Liam
 Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 5/7] ASoC: meson: Make meson_card_remove() return void
Date: Tue, 17 Oct 2023 16:40:41 +0200
In-reply-to: <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
Message-ID: <1j7cnluxa6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074109_718943_48D1D615 
X-CRM114-Status: GOOD (  19.86  )
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

Ck9uIFNhdCAxNCBPY3QgMjAyMyBhdCAwMDoxOSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sg
Zm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5Cj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuICBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMg
aW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3QgdG8g
bWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBv
ZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25ldygp
IHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBtZXNvbl9jYXJkX3JlbW92ZSgpIHJl
dHVybmVkIHplcm8gdW5jb25kaXRpb25hbGx5LiBNYWtlIGl0IHJldHVybiB2b2lkCj4gaW5zdGVh
ZCBhbmQgY29udmVydCBhbGwgdXNlcnMgdG8gc3RydWN0IHBsYXRmb3JtX2RldmljZTo6cmVtb3Zl
X25ldygpLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0
QGJheWxpYnJlLmNvbT4KCj4gLS0tCj4gIHNvdW5kL3NvYy9tZXNvbi9heGctY2FyZC5jICAgICAg
ICAgfCAyICstCj4gIHNvdW5kL3NvYy9tZXNvbi9neC1jYXJkLmMgICAgICAgICAgfCAyICstCj4g
IHNvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmMgfCA0ICstLS0KPiAgc291bmQvc29j
L21lc29uL21lc29uLWNhcmQuaCAgICAgICB8IDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21l
c29uL2F4Zy1jYXJkLmMgYi9zb3VuZC9zb2MvbWVzb24vYXhnLWNhcmQuYwo+IGluZGV4IDE4YjE2
Mjc0NDQ5ZS4uMzE4MGFhNGQzYTE1IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9heGct
Y2FyZC5jCj4gKysrIGIvc291bmQvc29jL21lc29uL2F4Zy1jYXJkLmMKPiBAQCAtMzYwLDcgKzM2
MCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGF4Z19jYXJkX29mX21hdGNoKTsKPiAgCj4g
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF4Z19jYXJkX3BkcnYgPSB7Cj4gIAkucHJv
YmUgPSBtZXNvbl9jYXJkX3Byb2JlLAo+IC0JLnJlbW92ZSA9IG1lc29uX2NhcmRfcmVtb3ZlLAo+
ICsJLnJlbW92ZV9uZXcgPSBtZXNvbl9jYXJkX3JlbW92ZSwKPiAgCS5kcml2ZXIgPSB7Cj4gIAkJ
Lm5hbWUgPSAiYXhnLXNvdW5kLWNhcmQiLAo+ICAJCS5vZl9tYXRjaF90YWJsZSA9IGF4Z19jYXJk
X29mX21hdGNoLAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vZ3gtY2FyZC5jIGIvc291
bmQvc29jL21lc29uL2d4LWNhcmQuYwo+IGluZGV4IDAxYmVhYzFkOTI3Zi4uZjE1MzllNTQyNjM4
IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9neC1jYXJkLmMKPiArKysgYi9zb3VuZC9z
b2MvbWVzb24vZ3gtY2FyZC5jCj4gQEAgLTEzMCw3ICsxMzAsNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBneF9jYXJkX29mX21hdGNoKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIGd4X2NhcmRfcGRydiA9IHsKPiAgCS5wcm9iZSA9IG1lc29uX2NhcmRfcHJvYmUsCj4g
LQkucmVtb3ZlID0gbWVzb25fY2FyZF9yZW1vdmUsCj4gKwkucmVtb3ZlX25ldyA9IG1lc29uX2Nh
cmRfcmVtb3ZlLAo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJneC1zb3VuZC1jYXJkIiwK
PiAgCQkub2ZfbWF0Y2hfdGFibGUgPSBneF9jYXJkX29mX21hdGNoLAo+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC11dGlscy5jIGIvc291bmQvc29jL21lc29uL21lc29u
LWNhcmQtdXRpbHMuYwo+IGluZGV4IGM4MTA5OTIxODU5Ny4uZWQ2YzdlMmY2MDljIDEwMDY0NAo+
IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmMKPiArKysgYi9zb3VuZC9z
b2MvbWVzb24vbWVzb24tY2FyZC11dGlscy5jCj4gQEAgLTMyNywxMyArMzI3LDExIEBAIGludCBt
ZXNvbl9jYXJkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTF9HUEwobWVzb25fY2FyZF9wcm9iZSk7Cj4gIAo+IC1pbnQgbWVzb25fY2FyZF9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArdm9pZCBtZXNvbl9jYXJkX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgbWVzb25f
Y2FyZCAqcHJpdiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAKPiAgCW1lc29uX2Nh
cmRfY2xlYW5fcmVmZXJlbmNlcyhwcml2KTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+ICBFWFBP
UlRfU1lNQk9MX0dQTChtZXNvbl9jYXJkX3JlbW92ZSk7Cj4gIAo+IGRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvbWVzb24vbWVzb24tY2FyZC5oIGIvc291bmQvc29jL21lc29uL21lc29uLWNhcmQuaAo+
IGluZGV4IGE1Mzc0MzI0YTE4OS4uYTBkNjkzZTRmNDYwIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3Nv
Yy9tZXNvbi9tZXNvbi1jYXJkLmgKPiArKysgYi9zb3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC5o
Cj4gQEAgLTQ5LDYgKzQ5LDYgQEAgaW50IG1lc29uX2NhcmRfc2V0X2ZlX2xpbmsoc3RydWN0IHNu
ZF9zb2NfY2FyZCAqY2FyZCwKPiAgCQkJICAgYm9vbCBpc19wbGF5YmFjayk7Cj4gIAo+ICBpbnQg
bWVzb25fY2FyZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKPiAtaW50IG1l
c29uX2NhcmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpOwo+ICt2b2lkIG1l
c29uX2NhcmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpOwo+ICAKPiAgI2Vu
ZGlmIC8qIF9NRVNPTl9TTkRfQ0FSRF9IICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
