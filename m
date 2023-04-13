Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90469C77B6E
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R5mHLE/wHAMkKmT/dUmy1gXybTXMZDbp62FZvcqVrQ=; b=Em4uc/xKNooasg
	7Qo49SZw5lN8Jd1ZIIuxeQyLmQUhIGvi+hxGPUe8vl9bhNVLJ8dJHuY9xjHsL72jHaSO5NNT6NR8J
	ZcuZAcGte4FhtuSGgOOItgXLVpf50OjBvl+I80mASR8hXOEHb+xLpuwDfkcmSNtqS8oY2iotiAyCe
	QMBlWF8zP0ed7wrgbksSJSQKXRoK3h2StCU6QBiCK13JkLRKJ1MBydOtgFIp6J3AB+AcvgeFh5Ugd
	Fn+jZZYjjv7RHL/C51K2UpB0iPzaOGXfuVJEwKZ0drZkRV3/o0/JFnMc/qGcQ+Gcojt6jyQijmhqx
	Cq7aToxR68myI5WtmSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4KW-007AzZ-2R;
	Thu, 13 Apr 2023 21:18:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4KR-007AyY-2U;
	Thu, 13 Apr 2023 21:18:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso19811995wms.5;
        Thu, 13 Apr 2023 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681420681; x=1684012681;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvgvENO7OsEfYlpi3gro7VWSzf69fgGUrOZS9U5Yybg=;
        b=bywSUA59UtCpqINbFrwRKWQFGwdz582hwMpd7vmBWBhXvHaPuePnAvx2oOd+evSK2I
         y/0Sss9v77EeEGp3lwV6wJu1IWiEW+vcqFKiG7GcpI43YffN1h/4XJqzFaBnXivEqcP0
         oAe9UV/PSCdK8AbWcnAR3rer+ifFZw4ZxnKkIBOEpyQjrA72a9tkzYIikMgHZKyCV6Hb
         FxtxePLtZuvvf7mbkG9egGVIqasvzUD37aXJZoz03Mh/xtElda59S+6XitMM+w8l9fhQ
         C3iMctBlSLz6raKKoVbCI4Aibm5UcYEARt39zIhrTSpxj4bhK+zR6s3mRpvDtgH+mogy
         hcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681420681; x=1684012681;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvgvENO7OsEfYlpi3gro7VWSzf69fgGUrOZS9U5Yybg=;
        b=aiHDNptsjrw3NHeONrERxD/eAajgl+hHFC8K1ONu6uQ/x9hyZyd/lYyzY7hXlKh/ig
         XwhUBezBkMxNHtaq0YtqrZrGLfTtD4Q9lH1R6Ld5CFksz7HW8kIVWOk6Q9SqXtfn9+8+
         xw6l13AbCg85k/Of931XtxYt+j5f2CYnFuu+yxzoSNsDZomFTnAsC4TRYEwihgg2e/MX
         DV4mXFraCJmmws4v8DAJxdqwW8QofQWrXUNZi0rKYRUTB745cPj8PTW4KRvWJQYJz4g2
         jm6ALNPfLV+W7YTA9PwpO25v/WdbNyd37Ygw5M01iEn9O8XlH6gm+6cQoxdJWnuPXaCN
         QtZQ==
X-Gm-Message-State: AAQBX9fFSCR/I0xCaK1LYXrFboFYQnK0d/NuHhjs4EoBP9AvKURny4Le
	GDdiW9U9BgOyeumD2QEXaGU=
X-Google-Smtp-Source: AKy350YZ2DOjKsCluMWuSo39HVU0l8eCuZ/vjttpc3RrNgfx8YujWylw5m4NYGCPIzZSFPo32lg4wA==
X-Received: by 2002:a7b:cd9a:0:b0:3ee:526f:b15e with SMTP id y26-20020a7bcd9a000000b003ee526fb15emr2598277wmj.23.1681420680413;
        Thu, 13 Apr 2023 14:18:00 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:f580:be04:1a64:fc5e? (dynamic-2a01-0c22-738e-4400-f580-be04-1a64-fc5e.c22.pool.telefonica.de. [2a01:c22:738e:4400:f580:be04:1a64:fc5e])
        by smtp.googlemail.com with ESMTPSA id f10-20020a7bc8ca000000b003f09f44c7bcsm2719313wml.33.2023.04.13.14.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 14:18:00 -0700 (PDT)
Message-ID: <61c1266c-407f-6d26-d9aa-1f9a0fc02e12@gmail.com>
Date: Thu, 13 Apr 2023 23:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
 <f7291bab-eb51-3f2d-4eb4-78f6330242ef@gmail.com>
 <CAFBinCDs=EQo8-HSSbaprfJB+93sz+Ng1H=MX3hBG_00PTko3g@mail.gmail.com>
 <ZDfGJM24xZbfSur5@orome>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 3/4] pwm: meson: change clk/pwm gate from mask to bit
In-Reply-To: <ZDfGJM24xZbfSur5@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_141804_683136_3C2C999E 
X-CRM114-Status: GOOD (  14.76  )
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

T24gMTMuMDQuMjAyMyAxMTowNiwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gV2VkLCBBcHIg
MTIsIDIwMjMgYXQgMTA6NDc6MDVQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToK
Pj4gSGkgSGVpbmVyLAo+Pgo+PiBPbiBXZWQsIEFwciAxMiwgMjAyMyBhdCA5OjIz4oCvUE0gSGVp
bmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gQ2hhbmdl
IHNpbmdsZS1iaXQgdmFsdWVzIGZyb20gbWFzayB0byBiaXQuIFRoaXMgZmFjaWxpdGF0ZXMKPj4+
IENDRiBpbml0aWFsaXphdGlvbiBmb3IgdGhlIGNsb2NrIGdhdGUgaW4gYSBmb2xsb3ctdXAgcGF0
Y2guCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdt
YWlsLmNvbT4KPj4gVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPiAjCj4+IG1lc29uOGItb2Ryb2lkYzEsIHNtMS14OTYtYWly
Cj4+Cj4+IFsuLi5dCj4+PiAgI2RlZmluZSBSRUdfTUlTQ19BQiAgICAgICAgICAgIDB4OAo+Pj4g
LSNkZWZpbmUgTUlTQ19CX0NMS19FTiAgICAgICAgICBCSVQoMjMpCj4+PiAtI2RlZmluZSBNSVND
X0FfQ0xLX0VOICAgICAgICAgIEJJVCgxNSkKPj4+ICsjZGVmaW5lIE1JU0NfQl9DTEtfRU4gICAg
ICAgICAgMjMKPj4+ICsjZGVmaW5lIE1JU0NfQV9DTEtfRU4gICAgICAgICAgMTUKPj4+ICAjZGVm
aW5lIE1JU0NfQ0xLX0RJVl9NQVNLICAgICAgMHg3Zgo+Pj4gICNkZWZpbmUgTUlTQ19CX0NMS19E
SVZfU0hJRlQgICAxNgo+Pj4gICNkZWZpbmUgTUlTQ19BX0NMS19ESVZfU0hJRlQgICA4Cj4+PiAg
I2RlZmluZSBNSVNDX0JfQ0xLX1NFTF9TSElGVCAgIDYKPj4+ICAjZGVmaW5lIE1JU0NfQV9DTEtf
U0VMX1NISUZUICAgNAo+Pj4gICNkZWZpbmUgTUlTQ19DTEtfU0VMX01BU0sgICAgICAweDMKPj4+
IC0jZGVmaW5lIE1JU0NfQl9FTiAgICAgICAgICAgICAgQklUKDEpCj4+PiAtI2RlZmluZSBNSVND
X0FfRU4gICAgICAgICAgICAgIEJJVCgwKQo+Pj4gKyNkZWZpbmUgTUlTQ19CX0VOICAgICAgICAg
ICAgICAxCj4+PiArI2RlZmluZSBNSVNDX0FfRU4gICAgICAgICAgICAgIDAKPj4gUGVyc29uYWxs
eSBJJ20gZmluZSB3aXRoIHRoaXMgY2hhbmdlIGJ1dCBpdCdzIG5vdCBob3cgSSB3b3VsZCBoYXZl
IGRvbmUgaXQ6Cj4+IC0gSSB3b3VsZCBoYXZlIGtlcHQgdGhlIEJJVCgpIG1hY3JvIGZvciBNSVND
X3tBLEJ9X0VOCj4+IC0gdGhlbiBJIHdvdWxkIGhhdmUgcmVuYW1lZCBNSVNDX3tBLH1fQ0xLX0VO
IHRvCj4+IE1JU0Nfe0EsQn1fQ0xLX0VOX1NISUZUICh0byBiZSBjb25zaXN0ZW50IHdpdGggX1NI
SUZUIG9mIHRoZSBtdXggYW5kCj4+IGRpdmlkZXIpIGFuZCBkcm9wIHRoZSBCSVQoKSBtYWNybyB0
aGVyZSAobGlrZSB5b3UgZGlkKQo+Pgo+PiBUaGlzIGlzIHBvc3NpYmx5L2xpa2VseSBwZXJzb25h
bCBwcmVmZXJlbmNlLCBzbyBteSBzdWdnZXN0aW9uIGlzIHRvCj4+IHdhaXQgZm9yIHNvbWUgbW9y
ZSBmZWVkYmFjay4KPiAKPiBJdCBsb29rcyBsaWtlIHRoZXNlIGFyZW4ndCB1c2VkIG91dHNpZGUg
dGhlIG1lc29uX3B3bV9wZXJfY2hhbm5lbF9kYXRhCj4gYXJyYXksIHNvIHdoeSBib3RoZXIgd2l0
aCBhICNkZWZpbmUgKGFuZCBhbnkgcG90ZW50aWFsIGluY29uc2lzdGVuY2llcykKPiBpbiB0aGUg
Zmlyc3QgcGxhY2U/Cj4gCkkgdGhpbmsgd2UgZm9sbG93IGEgY29tbW9uIHBhdHRlcm4gaGVyZSBh
bmQgZmlyc3QgZGVmaW5lIGNvbnN0YW50cyBmb3IgYWxsCnJlZ2lzdGVycyBhbmQgYml0cy9maWVs
ZHMuIEhhdmluZyB0aGUgcmVnaXN0ZXIgbGF5b3V0IGRlZmluZWQgaW4gb25lIHBsYWNlCm1ha2Vz
IGl0IGVhc2llciB0byBjaGVjayBpdCBhZ2FpbnN0IHRoZSBjaGlwIGRhdGFzaGVldC4KSG93ZXZl
ciBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGlzIHdoYXQgeW91IHdlcmUgcmVmZXJyaW5nIHRv
LgoKPiBUaGllcnJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
