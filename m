Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F0EECAAA1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Oct 2022 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAS7jV8D3KoGYcqjDtcanKyYUsi4mFopo0uvy9AyKJM=; b=UkQTR8sEDPEoo7gDe5IQe7aRB9
	DR8qI6o2LmtCYtBgx6PVgcr/g8t2eQM17fg2hPrYTOBAu/PfoKfRPHGQwjdTiqsVUu5bQ/g5PddHv
	fGW2PQiEptpSssICB93qUnuV4ceJPcG6xWxZcFtFbKNDOx3/UkNMV5dTzI70TWcEoVWR60/lhK2JX
	oHMVhyLo3ahSnCMGJvMzXq3brzUuDcB9DORNwD+KRYBLRdcc+RzGFXvEqVfKMOXTfJr/LRbSiLrfd
	Aw/CIQ6u8zTlnUvjNNIUCOnCs/goqjeuHCIbo2nJaZBW5Tnw3Kek6OyBRchjy8FslmClU2hHTzNFt
	Vh+hZXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2zN-00DXlB-Tg; Thu, 27 Oct 2022 13:32:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2k4-00DP2v-Kd
	for linux-amlogic@lists.infradead.org; Thu, 27 Oct 2022 13:16:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id w14so2099839wru.8
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Oct 2022 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ri47NCriRryQ3cMznl1OvuimF4hziCqwcvwHcUTsoiA=;
        b=NhGPPiCGFh6Ij+wqSXOVeVkLIEO1atPal8IuT+5I27EFkQdkQnBgp0H+fVT9XUxtEP
         vOb7Dx3fI0NRRFgHhFzanbU1nAIIQyL2/8ruBN6VP4kUb0g1TaWmIxqou9RHW51+BrUb
         Bgwv6YEHTEmQdstdmSSZV/9itaS/mqbC2gAixP9zWmNvX9AHOJ+s4Hpf9Ai39FnKGS+F
         WQld+yugTyeK4lUTtBBKibE1kxcFh4Dl+4+rulXlRFH9UWHp1F0M+8RY3x+liOmlbSch
         C6khLLgaSDvpGo0jhH6MfbtLENxQPEY0Y1XEkjeYVbyLwDmAYP0fp/dQzpwF3vMalc7+
         HOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri47NCriRryQ3cMznl1OvuimF4hziCqwcvwHcUTsoiA=;
        b=tYJL8lcmoOoCPBhEStbVYl8qxiVnJdGLgmR+qmnCX15YToqVCyvzQ6Q0sjM4DYxksf
         r7+++AQhgj1IAWstJ4k/rIC/xNhNuIRp40D+xMvjlYiqCBPg+bvpfYEsR7camOm5bT42
         b4nDepkk9XofSg4ajcwIKxd2dxvJrnzV8KaWmVLJO+Os5KLKPoYHqXyn9y8u6L1LiqPz
         rC0KHYvGc7LKJ+PgirnEI8TdaWHiBHUOq9aEMdRfYR/a5HSqt+Vxl2NSkgKiUmvSNODN
         AUZZK3wBVqM/1dveRJxihMYwk6ScL1ragCEr9SWN8aYPL2NPLArf0rApo8LcNMRZINxe
         nYug==
X-Gm-Message-State: ACrzQf0xAPDAkLMvpZ7HT3+gBSBlOjarSxRFrfqfiZbGotC+7qFi0f2f
	TCdi4s69EfK/je5uZ78bus+au6QTpTg=
X-Google-Smtp-Source: AMsMyM7S8NesYWFWJHDjoLMyleGCBMwePgm/iWtxM3/N8QGx1Ok+pUv8jRLXXycwrkRIz/v9lJcyVg==
X-Received: by 2002:a05:6000:1568:b0:22e:6691:57aa with SMTP id 8-20020a056000156800b0022e669157aamr31074058wrz.708.1666876574264;
        Thu, 27 Oct 2022 06:16:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:1cb7:f7ba:a36e:de10? ([2a01:e0a:898:f380:1cb7:f7ba:a36e:de10])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003c6edc05159sm4693635wms.1.2022.10.27.06.16.13
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:16:13 -0700 (PDT)
Message-ID: <259950fa-5b26-77f0-7c49-84ca06cd6a6f@gmail.com>
Date: Thu, 27 Oct 2022 15:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <20221022084737.1028-1-linux.amoon@gmail.com>
 <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
 <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
 <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
 <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org>
 <CANAwSgR1CN=Gho6NGMoM1bH92KyeGqoAphmT6NqtnL=+3Zg_jQ@mail.gmail.com>
 <18ae0876-2d37-cde9-183f-894dfcdf4be9@linaro.org>
From: Neil Armstrong <narmstrong.kernel@gmail.com>
In-Reply-To: <18ae0876-2d37-cde9-183f-894dfcdf4be9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061616_698571_B2A6B757 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjcvMTAvMjAyMiAxNDo0OSwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBI
aSwKPiAKPiBPbiAyNi8xMC8yMDIyIDE4OjAyLCBBbmFuZCBNb29uIHdyb3RlOgo+PiBIaSBOZWls
LAo+IAo+IDxzbmlwPgo+IAo+Pgo+PiBXaGVuIEkgdHJ5IHRvIHVzZSBwd21fQU9fY2QsLAo+PiBF
aXRoZXIgb25lIG9mIHRoZSBQV00gYmluZHMgd2lsbCBmYWlsIHRvIGdldCB0aGUgZm9sbG93aW5n
IGVycm9yLgo+Pgo+PiDCoCAmcHdtX0FPX2NkIHsKPj4gLcKgwqDCoMKgwqDCoCBwaW5jdHJsLTAg
PSA8JnB3bV9hb19kX2VfcGlucz47Cj4+ICvCoMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZwd21f
YW9fZF9lX3BpbnM+LCA8JnB3bV9hb19kXzEwX3BpbnM+Owo+PiDCoMKgwqDCoMKgwqDCoMKgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZ4
dGFsPjsKPj4gwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjbGtpbjEiOwo+Pgo+PiBb
wqDCoMKgIDMuOTQxNzAwXSBwd20tcmVndWxhdG9yIHJlZ3VsYXRvci12ZGRjcHUtYjogZXJyb3Ig
LUVCVVNZOiBGYWlsZWQgdG8gZ2V0IFBXTQo+PiBbwqDCoMKgIDMuOTQzMTk4XSBwd20tcmVndWxh
dG9yOiBwcm9iZSBvZiByZWd1bGF0b3ItdmRkY3B1LWIgZmFpbGVkIHdpdGggZXJyb3IgLTE2Cj4+
Cj4+IFvCoMKgwqAgMy45NTYzNTZdIHB3bS1mYW4gcHdtLWZhbjogZXJyb3IgLUVCVVNZOiBDb3Vs
ZCBub3QgZ2V0IFBXTQo+PiBbwqDCoMKgIDMuOTU2Mzk2XSBwd20tZmFuOiBwcm9iZSBvZiBwd20t
ZmFuIGZhaWxlZCB3aXRoIGVycm9yIC0xNgo+IAo+IFllYWggYmVjYXVzZSBQV00gIkQiIGlzIGFs
cmVhZHkgdXNlZCBieSB0aGUgInB3bV9BT19hYiIgY29udHJvbGxlciwgc28geW91IGNhbid0IHVz
ZSBpdCBmb3IgdGhlIEZBTi4KCkkgd2FzIG1lYW5pbmcgcmVndWxhdG9yLXZkZGNwdS1iLgoKPiAK
Pj4KPj4gQmVsb3cgYXJlIG15IGNoYW5nZXMgd2l0aMKgIHB3bV9BT19hYgo+PiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gYWxhcm1Ab2Ryb2lkLW4yOn4vbGludXgtYW1s
b2dpYy01LnktZGV2ZWwkIGdpdCBkaWZmCj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaQo+PiBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCj4+IGluZGV4IGZkM2ZhODJl
NGMzMy4uZDAzOGJhMWUyNDUzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaQo+PiBAQCAtMzksNiArMzksMTQg
QEAgZW1tY19wd3JzZXE6IGVtbWMtcHdyc2VxIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gQk9PVF8xMiBHUElPX0FDVElWRV9MT1c+Owo+
PiDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Cj4+ICvCoMKgwqDCoMKgwqAgZmFuOiBwd20tZmFuIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJwd20tZmFuIjsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHdtcyA9IDwmcHdtX0FPX2FiIDEgMTI1
MCAwPjsKPiAKPiBIZXJlIHlvdSB1c2UgdGhlICJCIiBQV00gc2lnbmFsLCBub3QgdGhlIEQuCj4g
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhbi1zdXBwbHkgPSA8JnZjY181dj47
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNjb29saW5nLWNlbGxzID0gPDI+Owo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb29saW5nLWxldmVscyA9IDwwIDEwMCAx
NzAgMjMwPjsKPj4gK8KgwqDCoMKgwqDCoCB9Owo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqAgbGVk
cyB7Cj4gCj4gPHNuaXA+Cj4gCj4+Cj4+ICsmcHdtX0FPX2FiIHsKPj4gK8KgwqDCoMKgwqDCoCBw
aW5jdHJsLTAgPSA8JnB3bV9hb19kXzEwX3BpbnM+Owo+IAo+IFRoZSAicHdtX0FPX2FiIiBjb250
cm9sbGVyIG9ubHkgY29udHJvbHMgdGhlIFBXTSAiQSIgJiAiQiBzaWduYWxzLCBub3QgdGhlICJE
IiAhCj4gCj4gVGhpcyBiYXNpY2FsbHkgZW5hYmxlcyB0aGUgUFdNICJEIiBwaW4gZnVuY3Rpb24g
dG8gR1BJT0FPXzEwLCBpdCBkb2Vzbid0IGFzc2lnbiBpdCB0byB0aGUgInB3bV9BT19hYiIgY29u
dHJvbGxlci4KPiAKPiBTbyBieSBlbmFibGluZyB0aGlzIHBpbmN0cmwsIGl0IHdpbGwgZHVwbGlj
YXRlIHRoZSBwd21fYW9fZF9lX3BpbnMgc2lnbmFsIHRvIHB3bV9hb19kXzEwX3BpbnMsIHRoaXMg
aXMgd2h5IHRoZSBGQU4gc3BpbnMgbm9uLXN0b3AuCj4gCj4+ICvCoMKgwqDCoMKgwqAgcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gK8KgwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jnh0YWw+Owo+
PiArwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImNsa2luMSI7Cj4+ICvCoMKgwqDCoMKgwqAg
c3RhdHVzID0gIm9rYXkiOwo+PiArfTsKPj4gKwo+PiDCoCAmcHdtX0FPX2NkIHsKPj4gwqDCoMKg
wqDCoMKgwqDCoCBwaW5jdHJsLTAgPSA8JnB3bV9hb19kX2VfcGlucz47Cj4+IMKgwqDCoMKgwqDC
oMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+PiAtQW5hbmQKPj4+Cj4+PiBO
ZWlsCj4gCj4gTmVpbAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
