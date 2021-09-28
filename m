Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6FFC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 10:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2606B6101E
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 10:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2606B6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pvCrinR5KVkVpaXD3POVWsCRaKknG3mmR5Fg5FxP3U=; b=FCDaAJSUaDfKQ/
	x66M+tbOWqlj38hR7jvdyw8hi+U7bNtZ8FfqXSvYX+qv8WgwKShzXspYt3N2pVgQeNHKJbnndASeI
	9+X/bWa6pyMSyzObHsx7pnOoXA9eh+FTaOZ88iHGx9QrIj5IFTt1dK/jNwNLDr4Q+kHkzyX9XcoE+
	0QXOetCHceiSjumFmZpYo358NPq5+JuskcBVNacUb+KLaN54PW7Qo46Mx4fxa9FxUWQSJf7SEQgES
	OYlqsX+qZM0FqE+4BieFDsdU3ONb/RtBmFLeaXXTraVaDp8H8ze1crx5CknuuEstjiA2uR0nKfX2f
	yoSeTTdF6PUMcVzFuBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAcm-006pbG-2T; Tue, 28 Sep 2021 10:46:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAcZ-006pZM-Cx
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 10:46:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 f78-20020a1c1f51000000b0030cdb3d6079so2373593wmf.3
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pMkBoBL/2u2hxj5OV4tpOntSstW0kYsraUoSIB/HZzM=;
 b=mbVshFaEww29h7aEmVf9HpLxzvNaZp8olijYpB6eBQhNUqD6W2WouWSzZkFvbHIhu8
 lOqvFHF93aQ7gVEwhMK66slUwrjFHvKlm84BBDg87CKbAfRowUVfSXMDoXAqUWi42i5q
 NU7awEQdq4PHqqQZkXtnektMYFh53uN0eWBbC/5hdGwp0w4L5bL0U+YCJbjQc1UlG1L6
 4CqrZuYDGlxUnNlCPhPB0E7/ur23XYgj42JSOGCpYRprfTUZIJwZ5n8OWRhdUhPsBtp2
 rj6haqHIYp2kNIZAvIrKk374JQIL4tpamA6wmKk7xq5NwNNbxUPCzr7aTavI4I+5P/GO
 vlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pMkBoBL/2u2hxj5OV4tpOntSstW0kYsraUoSIB/HZzM=;
 b=L94jIMbYAym5a4f28qu39GQBpDdP88V8NfR5NKnMGe6ZNHGJoizm0J36MPaAfDmUyg
 tIXGTww3yFC08HaiY2Y+qVB9N+3GSIZMnLk5P7Z5UWD28K/Z6R9g2UikJJN7mbv6WJsd
 IG6d64ImcY8/IVKPokpB21EZi06T5Y9yOVkY4x429wo6gdcgMKggNO1mNVK2NJCJJFMG
 6qh7R+HXYJS3C8pw2Xru+wM6ves22Jz0dDpWUtG8GGNqvEkXazd+BwJLXD9uzRMyegDN
 KK6QPXulussmqO/rhME5b7s3lLEFfXgPcDU+EyJPU1+8NYk7dRYPLI8VFhjErkqaZ/4C
 uCVw==
X-Gm-Message-State: AOAM531uVUWwK2lDRSirpmvUHTMGEnYuA3pt5l1ckamY68fiHTXEwGgO
 bNk3oTA+4/E9FPMpqlNl/9KhFiBHiFA8sQ==
X-Google-Smtp-Source: ABdhPJxCiCIrJ4P2i364s2mImazMHWq9MdtaswRYwBJ7Zsj9nHMmrkzH/a9pwLFblIWArlO2+gvOHA==
X-Received: by 2002:a05:600c:2206:: with SMTP id
 z6mr3911093wml.133.1632825957432; 
 Tue, 28 Sep 2021 03:45:57 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id z17sm19327249wrr.49.2021.09.28.03.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 03:45:56 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:45:55 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 tglx@linutronix.de, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
Message-ID: <YVLyY7ETBlhexv+9@google.com>
References: <20210902134914.176986-1-narmstrong@baylibre.com>
 <20210902134914.176986-2-narmstrong@baylibre.com>
 <CAGETcx9KYWmmSYjXGPW6awmVYcKr6sdmxhc_tP=hf149=8Pm6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx9KYWmmSYjXGPW6awmVYcKr6sdmxhc_tP=hf149=8Pm6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_034559_505423_84B33FAD 
X-CRM114-Status: GOOD (  22.16  )
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

T24gVGh1LCAwMiBTZXAgMjAyMSwgU2FyYXZhbmEgS2FubmFuIHdyb3RlOgoKPiBPbiBUaHUsIFNl
cCAyLCAyMDIxIGF0IDY6NDkgQU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPiB3cm90ZToKPiA+Cj4gPiBJbiBvcmRlciB0byByZWR1Y2UgdGhlIGtlcm5lbCBJbWFnZSBz
aXplIG9uIG11bHRpLXBsYXRmb3JtIGRpc3RyaWJ1dGlvbnMsCj4gPiBtYWtlIGl0IHBvc3NpYmxl
IHRvIGJ1aWxkIHRoZSBBbWxvZ2ljIEdQSU8gSVJRIGNvbnRyb2xsZXIgYXMgYSBtb2R1bGUKPiA+
IGJ5IHN3aXRjaGluZyBpdCB0byBhIHBsYXRmb3JtIGRyaXZlci4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2lycWNoaXAvS2NvbmZpZyAgICAgICAgICB8ICA1ICsrKy0tCj4gPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMgfCAxNSArKysrKysrKystLS0tLS0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnIGIvZHJpdmVycy9pcnFjaGlwL0tjb25m
aWcKPiA+IGluZGV4IDRkNTkyNGU5Zjc2Ni4uMmFiYTQ4NTAyNWZkIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9LY29uZmln
Cj4gPiBAQCAtNDAwLDggKzQwMCw5IEBAIGNvbmZpZyBJUlFfVU5JUEhJRVJfQUlERVQKPiA+ICAg
ICAgICAgICBTdXBwb3J0IGZvciB0aGUgVW5pUGhpZXIgQUlERVQgKEFSTSBJbnRlcnJ1cHQgRGV0
ZWN0b3IpLgo+ID4KPiA+ICBjb25maWcgTUVTT05fSVJRX0dQSU8KPiA+IC0gICAgICAgYm9vbCAi
TWVzb24gR1BJTyBJbnRlcnJ1cHQgTXVsdGlwbGV4ZXIiCj4gPiAtICAgICAgIGRlcGVuZHMgb24g
QVJDSF9NRVNPTgo+ID4gKyAgICAgICB0cmlzdGF0ZSAiTWVzb24gR1BJTyBJbnRlcnJ1cHQgTXVs
dGlwbGV4ZXIiCj4gPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RF
U1QKPiA+ICsgICAgICAgZGVmYXVsdCBBUkNIX01FU09OCj4gPiAgICAgICAgIHNlbGVjdCBJUlFf
RE9NQUlOX0hJRVJBUkNIWQo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgU3VwcG9ydCBN
ZXNvbiBTb0MgRmFtaWx5IEdQSU8gSW50ZXJydXB0IE11bHRpcGxleGVyCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LW1lc29uLWdwaW8uYwo+ID4gaW5kZXggZTUwNjc2Y2UyZWM4Li5kOTBmZjBiOTI0ODAgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYwo+ID4gKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKPiA+IEBAIC00MzYsOCArNDM2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpcnFfZG9tYWluX29wcyBtZXNvbl9ncGlvX2lycV9kb21haW5fb3Bz
ID0gewo+ID4gICAgICAgICAudHJhbnNsYXRlICAgICAgPSBtZXNvbl9ncGlvX2lycV9kb21haW5f
dHJhbnNsYXRlLAo+ID4gIH07Cj4gPgo+ID4gLXN0YXRpYyBpbnQgX19pbml0IG1lc29uX2dwaW9f
aXJxX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtZXNvbl9ncGlvX2lycV9jb250cm9s
bGVyICpjdGwpCj4gPiArc3RhdGljIGludCBtZXNvbl9ncGlvX2lycV9wYXJzZV9kdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBtZXNvbl9ncGlvX2lycV9jb250cm9sbGVyICpjdGwp
Cj4gPiAgewo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsKPiA+
ICAgICAgICAgaW50IHJldDsKPiA+IEBAIC00NjMsOCArNDYyLDcgQEAgc3RhdGljIGludCBfX2lu
aXQgbWVzb25fZ3Bpb19pcnFfcGFyc2VfZHQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ID4g
ICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyBpbnQgX19pbml0IG1lc29u
X2dwaW9faXJxX29mX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVu
dCkKPiA+ICtzdGF0aWMgaW50IG1lc29uX2dwaW9faXJxX29mX2luaXQoc3RydWN0IGRldmljZV9u
b2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKPiA+ICB7Cj4gPiAgICAgICAg
IHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sICpwYXJlbnRfZG9tYWluOwo+ID4gICAgICAgICBz
dHJ1Y3QgbWVzb25fZ3Bpb19pcnFfY29udHJvbGxlciAqY3RsOwo+ID4gQEAgLTUyMSw1ICs1MTks
MTAgQEAgc3RhdGljIGludCBfX2luaXQgbWVzb25fZ3Bpb19pcnFfb2ZfaW5pdChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUsCj4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4KPiA+IC1J
UlFDSElQX0RFQ0xBUkUobWVzb25fZ3Bpb19pbnRjLCAiYW1sb2dpYyxtZXNvbi1ncGlvLWludGMi
LAo+ID4gLSAgICAgICAgICAgICAgIG1lc29uX2dwaW9faXJxX29mX2luaXQpOwo+ID4gK0lSUUNI
SVBfUExBVEZPUk1fRFJJVkVSX0JFR0lOKG1lc29uX2dwaW9faW50YykKPiA+ICtJUlFDSElQX01B
VENIKCJhbWxvZ2ljLG1lc29uLWdwaW8taW50YyIsIG1lc29uX2dwaW9faXJxX29mX2luaXQpCj4g
PiArSVJRQ0hJUF9QTEFURk9STV9EUklWRVJfRU5EKG1lc29uX2dwaW9faW50YykKPiA+ICsKPiA+
ICtNT0RVTEVfQVVUSE9SKCJKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4iKTsK
PiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4gPiArTU9EVUxFX0FMSUFTKCJwbGF0Zm9y
bTptZXNvbi1ncGlvLWludGMiKTsKPiA+IC0tCj4gCj4gQWNrZWQtYnk6IFNhcmF2YW5hIEthbm5h
biA8c2FyYXZhbmFrQGdvb2dsZS5jb20+Cj4gCj4gTWFyYywgbXkgbWRpby1tdXggcGF0Y2hlcyBo
YXZlIGxhbmRlZC4KClJldmlld2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
