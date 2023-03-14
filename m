Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9B6C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ya2VupFXJAvEQq3J5CirrkhBP98HIlTdo9tYNo6mw=; b=mfXRfDy5FgX+f7
	TO6jwj88f3RTE6npfp0LRzizXYNSMVpM2+dupEuLVm0EpquKMLvR3o8TZxGGtJuC+CtrhNjfaYaZ/
	UBTv3cKmtsTDQdddTPpf+a2oO9DsMUjKDl100asAVHSxrDbu81WeFFZ0U8BTk6F52wNnsAduoz+MV
	b33dndbkp6vU4ARnZ4e9AdhnaCX5mkKi1oDcupLCDnWji3GEnSzJSMixpWQuWLvCUi7dgnZq0wCei
	X/3OZcoRXeJOYQPAteahJwJV3EEzd8W7CS7CngWZfxU0uShjMWc2jgBTV8ngd+3ZulqjnRQlixfOi
	r9hi+KaH/ELr9jZ3CrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc2XK-009rD3-1J;
	Tue, 14 Mar 2023 11:09:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc2XD-009rBi-1u
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 11:09:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso14756730pjs.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678792172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQAiozzsgfoGxDlvyrCg9UpjYhNdzMFc50048gpfD9Y=;
        b=ANUC4vGZDGeomKUX9RdMwGHm9SlX9igqh9scv2CupwN4JAWrfLcY/+jqP/5/TjSa5B
         bKRF07o53l6Bqw+U5ADTeu5XopnqxR9c1/NeOqhGvwtmrhqqbUumpjIW93n6xAPZWwrI
         /P//0k7NoAyPy0sAYwO6rNTHOMU4TNG+ZEhxhYhTq7kRWEoKgplNFI2uZaaxv9SnhrtV
         YYoJWiH2HAwxicVlofMUuwhZ087g0/WabkvU0QFwpbxoeRlLh7rFMbOwgH+xv+hhv/OK
         xLfeKSLqBdODK8huo/wOMomMhQ6O036irhU+LGQKtVbEf7gOHSPudI8kUqr9PavPmQRF
         2WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678792172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQAiozzsgfoGxDlvyrCg9UpjYhNdzMFc50048gpfD9Y=;
        b=IgudSbyoagbSiRG7396d0gytC+dMmcpqQzzMEQ0Iosw8053x3G5XHQOdWLf8iTahf6
         ObTQ610wljdASYkxx2OsmEsmUFvM1na4zywIaOa0mN/QpTaswC5myYUPCymZKnXoqKFU
         lMUly3P6wpQuEuM4i0zBVOggbcwzlShRzkhtwoj14pYSgSvzS4YuVpCLjGG+mibYQet0
         wueSfJqt5oEsGgJAMh9QlELg1Kc3jaMNQ0oUzxdJvs2u75Pd+eO1LB0Q/yrHZyEw1BGt
         0uddycK5x6Vf53bxmDQaTdyR81SdsxHKbBr2zmAeNpnJwKX/PRV/PHbIv5gCb50OePTt
         s3qg==
X-Gm-Message-State: AO0yUKVAZB1Md/KXahpgIbjTWjntoShfa/XYd2PaJdD+UikOsPK/lBml
	5K9NnqKRJUGGpNRBnA8vdXM+m+qS1vyJGnwpSRJHxg==
X-Google-Smtp-Source: AK7set8SoG6+bZSlQ3lAG0t9/aOo3BMF7TfVI/qKa1YUYqwAfpb+sSg8EzKkriYHbUyFmsCPrb2ZqbrscDfcU7B55cA=
X-Received: by 2002:a17:902:ba94:b0:19f:2164:9b3b with SMTP id
 k20-20020a170902ba9400b0019f21649b3bmr4366905pls.13.1678792171819; Tue, 14
 Mar 2023 04:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr> <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr> <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr> <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
 <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr> <CAPDyKFrC3a5-VP2DvCYGYUzKtX4Jc7cvNQOKfutW0sha=szOyg@mail.gmail.com>
 <c7e48c6f-530b-7198-b8bb-fc927a2fdc66@free.fr>
In-Reply-To: <c7e48c6f-530b-7198-b8bb-fc927a2fdc66@free.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Mar 2023 12:08:55 +0100
Message-ID: <CAPDyKFpJR9rgadXEBn+73FKgmLM8sZgzNbKV_x_udwOSRGH44Q@mail.gmail.com>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Kalle Valo <kvalo@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov <alep@cypress.com>, 
	Joseph chuang <jiac@cypress.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>, 
	linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_040940_377580_E99C6581 
X-CRM114-Status: GOOD (  24.49  )
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

T24gVHVlLCAxNCBNYXIgMjAyMyBhdCAwOTozMywgTWFyYyBHb256YWxleiA8bWFyYy53Lmdvbnph
bGV6QGZyZWUuZnI+IHdyb3RlOgo+Cj4gT24gMTQvMDMvMjAyMyAwODoyNywgVWxmIEhhbnNzb24g
d3JvdGU6Cj4KPiA+IE9uIE1vbiwgMTMgTWFyIDIwMjMgYXQgMjI6NDIsIE1hcmMgR29uemFsZXog
d3JvdGU6Cj4gPj4KPiA+PiBPbiAxMy8wMy8yMDIzIDIxOjA0LCBNYXJ0aW4gQmx1bWVuc3Rpbmds
IHdyb3RlOgo+ID4+Cj4gPj4+IE9uIE1vbiwgTWFyIDEzLCAyMDIzIGF0IDY6MDnigK9QTSBNYXJj
IEdvbnphbGV6IHdyb3RlOgo+ID4+PiBbLi4uXQo+ID4+Pj4gUVVFU1RJT046Cj4gPj4+PiBJdCdz
IG5vdCBjbGVhciB0byBtZSB3aHkgd2Ugc2xlZXAgdHdpY2UgZm9yIGhvc3QtPmlvcy5wb3dlcl9k
ZWxheV9tcz8KPiA+Pj4KPiA+Pj4gSSdtIG5vdCBzdXJlIGJ1dCBJIHRoaW5rIGhvc3QtPmlvcy5w
b3dlcl9kZWxheV9tcyBpcyBpbmRlcGVuZGVudCBmcm9tCj4gPj4+IHRoZSBwb3N0LXBvd2VyLW9u
LWRlbGF5LW1zIHByb3BlcnR5IG9mICJtbWMtcHdyc2VxLXNpbXBsZSIuCj4gPj4KPiA+PiBUaGV5
IGFyZSBkaXN0aW5jdCBpbmRlZWQgKHRoZSBwcm9wcyBoYXZlIHRoZSBzYW1lIG5hbWUgJiBzaW1p
bGFyIHB1cnBvc2UgdGhvdWdoKS4KPiA+Cj4gPiBDb3JyZWN0Lgo+ID4KPiA+Pgo+ID4+IGhvc3Qt
Pmlvcy5wb3dlcl9kZWxheV9tcyBpcyBzZXQgdmlhOgo+ID4+Cj4gPj4gZHJpdmVycy9tbWMvY29y
ZS9ob3N0LmM6ICAgICAgICBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAicG9zdC1wb3dl
ci1vbi1kZWxheS1tcyIsCj4gPgo+ID4gVGhpcyBpcyBhIHByb3BlcnR5IHRoYXQgbWF5IGJlIHNw
ZWNpZmllZCBpbiB0aGUgaG9zdCdzIE9GIG5vZGUuIFNlZQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtY29udHJvbGxlci55YW1sLgo+ID4KPiA+PiBkcml2ZXJz
L21tYy9jb3JlL2hvc3QuYy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmaG9zdC0+
aW9zLnBvd2VyX2RlbGF5X21zKTsKPiA+Cj4gPiBOb3RlIHRoYXQgdGhlIGRlZmF1bHQgdmFsdWUg
aXMgc2V0IHRvIDEwIG1zLCBpbiBtbWNfYWxsb2NfaG9zdCgpLiBTbywKPiA+IGlmIHlvdSBuZWVk
IGEgZGlmZmVyZW50IHZhbHVlLCB0aGF0IGNhbiBiZSBzcGVjaWZpZWQgaW4gRFQuCj4gPgo+ID4+
Cj4gPj4KPiA+PiBwd3JzZXEtPnBvc3RfcG93ZXJfb25fZGVsYXlfbXMgaXMgc2V0IHZpYToKPiA+
Pgo+ID4+IGRyaXZlcnMvbW1jL2NvcmUvcHdyc2VxX3NpbXBsZS5jOiAgICAgICBkZXZpY2VfcHJv
cGVydHlfcmVhZF91MzIoZGV2LCAicG9zdC1wb3dlci1vbi1kZWxheS1tcyIsCj4gPgo+ID4gVGhp
cyBpcyBhIHByb3BlcnR5IHRoYXQgbWF5IGJlIHNwZWNpZmllZCBpbiB0aGUgcHdyc2VxIE9GIG5v
ZGUuIFNlZQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtcHdy
c2VxLXNpbXBsZS55YW1sLgo+ID4KPiA+PiBkcml2ZXJzL21tYy9jb3JlL3B3cnNlcV9zaW1wbGUu
Yy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwd3JzZXEtPnBvc3RfcG93ZXJfb25f
ZGVsYXlfbXMpOwo+ID4+Cj4gPj4KPiA+PiBIb3dldmVyLCB0aGV5IGFyZSBib3RoIHVzZWQgdG8g
ZGVsYXkgbW1jX3Bvd2VyX3VwKCksCj4gPj4gYW5kIHRoZSBob3N0IGRlbGF5IGlzIHVzZWQgdG8g
c2xlZXAgdHdpY2UsIHdoaWNoIEkKPiA+PiBmb3VuZCBjb25mdXNpbmcgOykKPiA+Cj4gPiBJdCdz
IGNlcnRhaW5seSBhIGJpdCBoYWlyeSB0byBmb2xsb3csIGJ1dCBJIHRoaW5rIHlvdSBoYXZlIHVu
ZGVyc3Rvb2QKPiA+IHRoaW5ncyBjb3JyZWN0bHkuCj4gPgo+ID4+Cj4gPj4gUmVnYXJkcwo+ID4+
Cj4gPgo+ID4gTG9va3MgbGlrZSB5b3UgYXJlIGdldHRpbmcgY2xvc2VyIHRvIHRoZSBzb2x1dGlv
biwgYXQgbGVhc3QgZm9yIHRoZQo+ID4gZmlyc3Qgc3RlcCB0byBtYWtlIHN1cmUgdGhlIFNESU8g
Y2FyZCBpcyBnZXR0aW5nIGRldGVjdGVkIHByb3Blcmx5Lgo+ID4gTmljZSEKPgo+IFdoYXQgSSdt
IGNvbmZ1c2VkIGFib3V0IGlzOgo+Cj4gV2h5IHdvdWxkIEkgc3BlY2lmeSB0aGUgZGVsYXkgaW4g
dGhlIGhvc3QgcmF0aGVyIHRoYW4gaW4gdGhlIHB3cnNlcT8KCklmIHRoZSBkZWxheSBpcyB0byBt
YW5hZ2Ugdm1tYyBhbmQgdnFtbWMsIHdoaWNoIGlzIHNvbWV3aGF0IHBhcnQgb2YKdGhlIGdlbmVy
aWMgc3BlY2lmaWNhdGlvbnMgKFNEL01NQyksIHRoZW4gaXQgc2hvdWxkIGJlIGRlc2NyaWJlZCBp
bgp0aGUgaG9zdCdzIG5vZGUuCgpBIHB3cnNlcSBpcyBzb21ldGhpbmcgc3BlY2lhbCwgd2hpY2gg
aXMgYWxzbyBwbGF0Zm9ybSBhbmQgZGV2aWNlCnNwZWNpZmljICh0aGUgU0RJTyBkZXZpY2UpLiBJ
ZiB0aGUgZGVsYXlzIGNvcnJlc3BvbmQgdG8gdGhpcywgaXQKc2hvdWxkIGJlIHBhcnQgb2YgdGhl
IHB3cnNlcSBub2RlLgoKPgo+IEknbGwgaGF2ZSB0byBzdHVkeSBtbWNfcG93ZXJfdXAoKSBhIGJp
dCBtb3JlIDspCgo6LSkKCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
