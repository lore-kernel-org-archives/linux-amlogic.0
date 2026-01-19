Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81BD2ECE6
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9HtoaSrwBv8mgsyvvkbIdEGwKoq8oh+B/x/N+aWsz4=; b=WRlDeV+DBKEgTl
	c7jrq1kVtgTaWC+rLN7cJa+5oudOERTai1xu2te5hiv36JocwwBEvFQmg2rkp0iqVpIg7KR3bjJZx
	mx5o9RdK0UWn2d+3nKCkH85JVStGKAe2fbcUTbjJpDkG6xp2GYlgEp/jbxLtL1z/3ATXaBOlqMicX
	Y6r8zqYHIBThkrqvYzjiSUXeSBQ9x6mrULUyqonHa3a7mWQWLKp+p9tdB9cMs4GBWH0FQ/AyJTuWg
	ktVaZ97L8zl6tkmcsRQaJoYyJ5BD9qp4OwsoaHc5LlDGggwClPDRUlzBw83bpByYvihXs6+Okq3e+
	q0AIIb0KqHuPJ4kg2jlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjj-00000002tVK-2EeR;
	Mon, 19 Jan 2026 21:24:35 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjf-00000002tTp-0Btx
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 21:24:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0c09bb78cso35897485ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=L1t007D19hxUW4TxVI9luVC8uV6EQek2bBWmVEgwm/jagE0qR0z2D28YXNW7nVUpDz
         Sgqdjv0uUkEDWpbPw0RoPOMkwmIz8iTGvYnwR7F1XpaRnJgXYirq34iAjI1uNOkhn1pm
         KU+0aljyv48hHjVqUcswrrQY3yrBi5VOPznjrN00D5xX+1ai6++ILcdkRVRlVNrTkW7T
         1MfsPFTfnz7Q6kBMkyHVKptxgM4Hh/GJcrBL4xjjI8+fIzx9V+JPuAiAIE+i+Dp0ZTli
         qTuwouB/eC/6NjXbNPibIEQEbfsroLjNF+lhqP1tJzZ7Wg14LFTMFjBjAIKvXX4rToto
         lSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=bUxwGzwOTanjfKqp7BsTpBV9cfehfGr2LtVedrk9RGM=;
        b=YxERIbUz02ow0NzH7mc/Sr9yPIqio9In9LBVoa54A2ecXxgTV7In3PRPLOAGTg5K+g
         UBgwRrtoD+M7tro6NzXUwn4V/Q1kCBOqZn5WnURIkmR8h94qBdlBsMGLUm78n8SIxsMT
         ZqzkGXxpn3gfU8rinVHWGg0bn1BItgYDHo3WMBaorzUaUWnH3LH1Qta6RNj2weOZ2viE
         2ctWByav/9+t/ebzlJKb9PqP09auh3ryCiYl9Am80N6UMAiQ5un96jyrUy3F90rjiJaY
         dpHauyWTCgL/4ZGSVNDWnOvkaGDfy0nBlllxAvtRQ/XHNoAUkkcbX1iuGYDSTqlBog3D
         HZyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=bJsohoTfefURwT4UVYR0lJQBNYYu1hVH+p8KqAlo1l/ChyobZoQzV0EI46XSh2y8cb
         OY780fP/He9iHngLaX/tNeg8fJCQvicEZnrgUIO8Q4HSn7RI+tElLY1AKfu8yRpkIx9b
         qM/xJIhbo55FUaghSfY8oyi5PGqbH5TxHpXuKwnQ45YNfybkewxw6vFLMeZnGiuOMqgs
         0ylmd8tueA4b8qSIJHPZRhgxAfyCRgRb8kJ/xkMf5brYOsdA9I50ZElprXWWa9RIFY17
         +1GvGKzfd3lU5lzpvdJUc/A2Xs5kkC57vSifgK7XAN6d7w9+8Am65FuTEvmaMpxRTlog
         xJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=uvCGIgrk9cWrSW7kTLdm8T9Cu9Z9Ssk6n3669Lw+kfQm//epIVBZH+ju8frjaQKZsT
         9DHaogS3mn3ohAr7FUf4L8r/b9HFBOxzcCCatSR59cKFtP5/ZL5mpG3ZJEgPkulseCi2
         FatuZ3vDlQ2N+p6/XqHpxwgrkTRcs3w4Q79zLgzQe12CSr5jk12SQuHrThWPmPwOTp2f
         xO09Lhr1z+2ZouzzlV4r/tgmEpizqKb68z9A3Ah864lnIOZgwzPFhRi7OPDSX5mQB08C
         zUiTv6kmd5K4hWJi8vldRft2QkAbPZly5uDgIOK99lNZcF/6vj+g4Z7HNQVERWRXHZlr
         YjFg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ywdN8rysLoEtPjTbiLgeyttTHDLFMSYEUxyEO2WJ3IDc2GZC37wxju0KJgW+E+dC0B+loODaszJ9mjgh@lists.infradead.org
X-Gm-Message-State: AOJu0YwLj/M8q0izz1LMzY3L1/IrJGPzxvvqqjWySOKAXOIjihY9o9oV
	2GhQrdLXMMtFB3PNDmn4gjAx/g6q6QeeiY16lwpBe0Vq/hWJ0o9MnTcdTG5V5szckImX+IpqTM6
	lhdOZiOqrb6tJ7fmpzBT3tNghfsqC3Uusut/V
X-Gm-Gg: AZuq6aJDzcaOFJsgxsjLcKFCKZNtoMGZpOMbWlhrwtwQfxWNj9TRBDrYsZOTcWgVSrV
	b1w9+jCg0sKL1N6eI9hGGKzCVAGbXGBBA71YXMEl8zw9coB6vXVVAQk24epVmPfHemDRl3Yw0hi
	PldBqi6LHEwhYh0AlVlh2V7C52I0Vl4PauLLhhW0yG7nkJAhdL5Nt4bff4o/Rx4IFTFkgWH3ttF
	V6Yd/auWOAD9sfoC9pDGVWEwRJqbXXEy+2wj5kzUeOaABlfGYspxFn4+t05VNA7X2eVkHoOqxOC
	8q+dJZeRCu33fdZhSo6yOiDZLufAzhEVtnUaVR4=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132431_138768_3BDF479F 
X-CRM114-Status: GOOD (  23.38  )
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

SGkgTHVjYSwKCk9uIFR1ZSwgSmFuIDEzLCAyMDI2IGF0IDY6MzHigK9QTSBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3cm90ZToKWy4uLl0KPiA+PiBAQCAtNzg5LDgg
Kzc4OSwxMiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9kd19oZG1pX3VuYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gPj4gIHsKPiA+PiAgICAgICAgIHN0cnVjdCBtZXNv
bl9kd19oZG1pICptZXNvbl9kd19oZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPj4gKyAg
ICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRl
dik7Cj4gPj4gKyAgICAgICBpbnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiA+
Pgo+ID4+ICsgICAgICAgZGV2bV9mcmVlX2lycShkZXYsIGlycSwgbWVzb25fZHdfaGRtaSk7Cj4g
PiBJIGhhdmUgb25lIHF1ZXN0aW9uIChzbyBJIGNhbiB1bmRlcnN0YW5kIHRoaW5ncyBiZXR0ZXIp
Ogo+ID4gaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgeW91IHdlbnQgd2l0aCBmcmVl
J2luZyB0aGUgSVJRCj4gPiBpbnN0ZWFkIG9mICJqdXN0IiBtYXNraW5nIGl0IChzbyB0aGUgaGFy
ZHdhcmUgd29uJ3QgZmlyZSBhbnltb3JlIG9mCj4gPiB0aG9zZSBJUlFzKT8KPgo+IE9uZSByZWFz
b24gaXMgc3ltbWV0cnk6IF9iaW5kIHJlcXVlc3RzIHRoZSBpcnEsIHNvIF91bmJpbmQgZG9lcyB0
aGUKPiByZXZlcnNlLgo+Cj4gQW5vdGhlciBpcyBJIGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlLCBz
byBJIHdhbnRlZCBteSBjaGFuZ2VzIHRvIGJlIGFzIHNtYWxsCj4gYW5kIGNsZWFyIGFzIHBvc3Np
YmxlLgpVbmRlcnN0b29kLCB0aGFua3MhCgo+IEluIHByaW5jaXBsZSBvbmUgY291bGQgcmVxdWVz
dC9mcmVlIHRoZSBpcnEgaW4gcHJvYmUvcmVtb3ZlIGFuZCB0aGVuCj4gZW5hYmxlL2Rpc2FibGUg
aXQgaW4gYmluZC91bmJpbmQuIFdoZXRoZXIgaXQgd291bGQgYmUgYSBnb29kIG9yIGJhZCBpZGVh
IEkKPiBkb24ndCBrbm93LCBidXQgc3VyZWx5IGl0IHdvdWxkIGJlIG1vcmUgY29tcGxleCBhbmQg
SSB3b3VsZG4ndCB3YW50IHRvIGRvCj4gaXQgd2l0aG91dCBhbnkgY2hhbmNlIHRvIHRlc3QgaXQg
b24gaGFyZHdhcmUuCj4KPiBBbHNvLCB0aGF0IHdvdWxkIG9ubHkgb3B0aW1pemUgdGhlIGNhc2Ug
b2YgbXVsdGlwbGUgYmluZC91bmJpbmQgY3ljbGVzLAo+IHdoaWNoIGFyZSBub3QgcXVpdGUgcmVh
bGlzdGljIHdpdGhvdXQgYnJpZGdlIGhvdHBsdWcuIEFuZCBicmlnZGUgaG90cGx1Zwo+IGRvZXMg
bm90IGV4aXN0IHlldCBpbiBtYWlubGluZSwgYW5kIHdoZW4gaXQgd2lsbCBhcnJpdmUgaXQgd2ls
bCBiZSB1c2VkCj4gb25seSBmb3IgYSBmZXcgdXNlIGNhc2VzLgo+Cj4gSSBob3BlIHRoaXMgYW5z
d2VycyB5b3VyIHF1ZXN0aW9uLgpZZXMsIEkgd2FzIGN1cmlvdXMgd2hldGhlciB5b3UgY29uc2lk
ZXJlZCBkZXZtX2ZyZWVfaXJxKCkgYXMgdGhlIG9ubHkKImNvcnJlY3QiIGFwcHJvYWNoIChpbiB0
aGlzIGNhc2UgSSB3b3VsZCBoYXZlIHJlY29tbWVuZGVkIGEgY29tbWVudCkKb3Igd2hldGhlciBv
dGhlciBhcHByb2FjaGVzIGFyZSBmaW5lIHRvby4KVGhpcyBpcyB1c2VmdWwga25vd2xlZGdlIGZv
ciBtZSBpbiBjYXNlIHdlIGV2ZXIgbmVlZCB0byByZXN0cnVjdHVyZSB0aGUgZHJpdmVyLgoKCkJl
c3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
