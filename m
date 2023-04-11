Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74848C7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF6J6iF0mP/FTio8n9z8tEUC2wOHE2Q4EZmeh9mt5/4=; b=YKIh9MsJcbflCV
	9HazW5O6SqXsm+6svX6GMsFs+WSTkvKyzvCPlXe8VS7zxVZjbtWS0ZE4oMHMEd77XcaQ6iVTaUofE
	Kai1/J7aVRbujTPaP/J3ct0QtFKAx8rfWNngAG8hvoqGhbAx0I0wl/atL5dTQTBqqtiE1QF3VSvqe
	TL+y2wDsvmnVx3l+/sIUH8ypNymV1RSlnua+Y/wsvJ4c1SF8/LC8+utEoLoJrrJGtMVLUmhtujpIB
	cUbIcgH6JV7jhjB9sUisVPnqzriO7s5Y4QYl27vDvw/dhk3EqA6C8tYR6+ar9YAcdKZgAewzZSYZc
	j0fZVAIOP5B/ZeTS8N4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7i7-00GbPl-1E;
	Tue, 11 Apr 2023 06:42:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7i2-00GbOc-34;
	Tue, 11 Apr 2023 06:42:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso5371650wmb.1;
        Mon, 10 Apr 2023 23:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681195349; x=1683787349;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxmfQMLH/VjVS7JXLAMnXjMrD/h4yCDYVknbKOh9dN0=;
        b=iEeYwEz3fLD126bhL2JiW6VMqV3H0dr0SoouEtjFq6ot/PH8Vdp/xL8l3cQXdXt/bu
         hqxDmcsAwyBXatVtTo1gDVaz5dHleIlQO2fIgvMYebCmpFYDHkbucSvU23CcAjiE4nfQ
         CVb6MqgWOVYaTIKouqNiT6Q+uAXc7t8H0Aa/xbXEND5Y7ESAypqI5X9USe2zfiP6cY4P
         kxWLnfq/aGJ64LksP1g/2nBAyHQ71nCBqh2ePQI5ggQtaI/bgBKnkfA0UxHG0dnHlapE
         a8l6Kt0PYzAPJiadLmJGiLjStzWxwHNqeMylaU/rwlU+N/WOwvffjRmbpVppfqtLRnOA
         CBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681195349; x=1683787349;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxmfQMLH/VjVS7JXLAMnXjMrD/h4yCDYVknbKOh9dN0=;
        b=GS4iUleYB8upLVxwtFMIw/nS32IiUmjAdlIKWv7+2k+M1dRbK8Xgx+YLli7Qwg+d5v
         zBPQVre3MzSgNeA+pdzVr0gVtd1TTHUNWJShpCFms0SKIuE4WTTGiy7Ku82/8jAReGra
         b9DVu7oJ14iCUg3lcO+0q9rYUX6QQNOH2zOhqEvNVT0tdkAXIlLjS2t1TU/IDmTFxjsZ
         bY61A3J4G8Q6l30csTPJ7Z9w9glgGh5GoftXaYK0bDXZfnOxSmpnCN1nBl6uVctHLD3v
         DvyVx3BFhrjP3q78PNWSgV1PQ9tZWwI9bBqY92MfQWVGYG9fRmjwGBgRv0RVPwRy3yZY
         JF2Q==
X-Gm-Message-State: AAQBX9ekzZ/AhDt8n9bjo1e7QLmBGeUPMRJRWl8qczffBlDvxxrv1ga7
	XnTPqtnLitXADX9stBaRnJc=
X-Google-Smtp-Source: AKy350aAHjFCe4GtWM9ORCXt8mYnVNH4rtJNyu7LM1UIzi0cd8r47yKbrJO0gVkAasiYXJhDXoqvGA==
X-Received: by 2002:a1c:770c:0:b0:3ee:3df6:e411 with SMTP id t12-20020a1c770c000000b003ee3df6e411mr8630366wmi.28.1681195348345;
        Mon, 10 Apr 2023 23:42:28 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:491f:994c:df34:b485? (dynamic-2a01-0c23-c4bb-c200-491f-994c-df34-b485.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:491f:994c:df34:b485])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b003f0548d00f1sm1289818wmo.1.2023.04.10.23.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 23:42:27 -0700 (PDT)
Message-ID: <fc1c841f-d93b-6510-0edd-1c96b1ce4f31@gmail.com>
Date: Tue, 11 Apr 2023 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
 <08085ec6-0450-2477-e35f-5af19c1de857@gmail.com>
 <CAFBinCCaca-VKmxv_SaPxOzBrix98Nj+VDaD1bfqSwvDBg+eKQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/2] pwm: meson: make full use of common clock framework
In-Reply-To: <CAFBinCCaca-VKmxv_SaPxOzBrix98Nj+VDaD1bfqSwvDBg+eKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_234231_009031_CA8D8228 
X-CRM114-Status: GOOD (  20.89  )
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

T24gMTEuMDQuMjAyMyAwMToyNywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBIZWlu
ZXIsCj4gCj4gT24gU2F0LCBBcHIgOCwgMjAyMyBhdCAxMDo0M+KAr1BNIEhlaW5lciBLYWxsd2Vp
dCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+IFsuLi5dCj4+ICsgICAgICAgICAgICAg
ICBpbml0Lm5hbWUgPSBuYW1lOwo+PiArICAgICAgICAgICAgICAgaW5pdC5vcHMgPSAmY2xrX2Rp
dmlkZXJfb3BzOwo+PiArICAgICAgICAgICAgICAgaW5pdC5mbGFncyA9IENMS19TRVRfUkFURV9Q
QVJFTlQ7Cj4+ICsgICAgICAgICAgICAgICBwYXJlbnRfaHdzWzBdID0gJmNoYW5uZWwtPm11eC5o
dzsKPj4gKyAgICAgICAgICAgICAgIGluaXQucGFyZW50X2h3cyA9IHBhcmVudF9od3M7Cj4+ICsg
ICAgICAgICAgICAgICBpbml0Lm51bV9wYXJlbnRzID0gMTsKPiBUaGVyZSdzIGEgdmVyeSBzdWJ0
bGUgYnVnIGluIHRoaXMgY29kZToKPiBZb3UncmUgcmUtdXNpbmcgdGhlIHNhbWUgc3RydWN0IGNs
a19pbml0X2RhdGEgZm9yIGFsbCBjbG9ja3MuCj4gVGhlIG11eCBhYm92ZSBzZXRzCj4gLSBpbml0
LnBhcmVudF9uYW1lcwo+IC0gaW5pdC5udW1fcGFyZW50cwo+IC0gKGFtb25nc3Qgb3RoZXJzKQo+
IApJIHRoaW5rIHdlIHNob3VsZCBpbml0aWFsaXplIGNsa19pbml0X2RhdGEgdG8gYWxsIE5VTEwg
YmVmb3JlIGVhY2ggdXNlLgoKCgo+IGJ1dCBmb3IgdGhlIGRpdmlkZXIgYW5kIGdhdGUgeW91J3Jl
IG9ubHkgb3ZlcndyaXRpbmcgaW5pdC5udW1fcGFyZW50cywKPiB3aGljaCBpcyB3aHkgSSBlbmQg
dXAgd2l0aDoKPiAgeHRhbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDggICAgICAg
IDggICAgICAgIDEgICAgMjQwMDAwMDAKPiAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAg
WQo+ICAgIFsuLi5dCj4gICAgYzExMDg2NTAucHdtI2dhdGUxICAgICAgICAgICAgICAgIDEgICAg
ICAgIDEgICAgICAgIDAgICAgMjQwMDAwMDAKPiAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAg
ICBZCj4gICAgYzExMDg2NTAucHdtI2RpdjEgICAgICAgICAgICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAgICAgMjQwMDAwMDAKPiAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCj4gICAg
YzExMDg2NTAucHdtI211eDEgICAgICAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
MjQwMDAwMDAKPiAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCj4gICAgYzExMDg2NTAu
cHdtI2dhdGUwICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgMjQwMDAwMDAK
PiAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCj4gICAgYzExMDg2NTAucHdtI2RpdjAg
ICAgICAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKPiAgICAgICAg
MCAgICAgMCAgNTAwMDAgICAgICAgICBZCj4gICAgYzExMDg2NTAucHdtI211eDAgICAgICAgICAg
ICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKPiAgICAgICAgMCAgICAgMCAg
NTAwMDAgICAgICAgICBZCj4gClRoYW5rcyBhIGxvdCBmb3IgdGVzdGluZyBhbmQgZm9yIHRoZSBj
b21wcmVoZW5zaXZlIGZlZWRiYWNrLgoKPiBNeSBzdWdnZXN0aW9uIGlzIHRvIHN3aXRjaCB0byBz
dHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGVudGlyZWx5IChmb3IgdGhlCj4gbXV4IHRoaXMgY291bGQg
YmUgZG9uZSB3aXRoIGEgc2VwYXJhdGUgY29tbWl0IGJlZm9yZSB0aGlzIG9uZSkuCj4gVGhlbiBr
ZWVwIGl0IGNvbnNpc3RlbnQgYW5kIGRvbid0IG1peCBwYXJlbnRfbmFtZXMvcGFyZW50X2h3cyBh
bmQKPiBwYXJlbnRfZGF0YSAoanVzdCBzdGljayB0byBwYXJlbnRfZGF0YSwgd2hpY2ggY2FuIG1h
bmFnZSB0aGUgcHJldmlvdXMKPiB0d28gYW5kIG1vcmUpLgo+IEkgKnRoaW5rKiBzdHJ1Y3QgY2xr
X3BhcmVudF9kYXRhIGNhbiBldmVuIGJlIHVzZWQgdG8gc2ltcGxpZnkgdGhlCj4gc2Vjb25kIHBh
dGNoIChieSBqdXN0IGhhdmluZyBhbiAiZW1wdHkiIGVudHJ5IC0gd2l0aCBpbmRleCA9IC0xIC0g
aW4KPiB0aGUgYXJyYXkpLgo+IApBZnRlciBoYXZpbmcgbG9va2VkIGF0IGNsa19mZXRjaF9wYXJl
bnRfaW5kZXgoKSBJIHRoaW5rIHNvIHRvby4KCmNsayBjb3JlIHNlZW1zIHRvIGJlIGEgbGl0dGxl
IGluY29uc2lzdGVudCB3cnQgaGFuZGxpbmcgcGFyZW50X25hbWVzCnZzLiBwYXJlbnRfZGF0YS5u
YW1lIGluIGNsa19jb3JlX3BvcHVsYXRlX3BhcmVudF9tYXAoKS4gSXQgY29tcGxhaW5zCmFib3V0
IE5VTEwgZW50cmllcyBpbiBwYXJlbnRfbmFtZXMgYnV0IGFjY2VwdHMgcGFyZW50X2RhdGEgZW50
cmllcwp3aXRoIGluZGV4ID09IC0xIGFuZCBldmVyeXRoaW5nIGVsc2UgYmVpbmcgTlVMTCAoaW5j
bC4gbmFtZSkuCkl0IG1pZ2h0IGJlIHdvcnRoIGEgY2xrIGNvcmUgcGF0Y2ggdG8gYWxsb3cgTlVM
TCBwYXJlbnRfbmFtZXMuCgpCZW5lZml0IGZvciB1cyB3b3VsZCBiZSB0aGF0IHdlIGNhbiBzaW1w
bHkgcmVwbGFjZSB0aGUgaGRtaS92aWRlbwpjbG9jayBlbnRyaWVzIHdpdGggTlVMTCwgYW5kIGF2
b2lkIHRoZSBlZmZvcnQgb2YgY29weWluZyB0aGUgY2xvY2sKbmFtZXMgdG8gcGFyZW50X2RhdGEg
ZW50cmllcy4KCj4gWy4uLl0KPj4gKyAgICAgICAgICAgICAgIGNoYW5uZWwtPmdhdGUuYml0X2lk
eCA9IF9fZmZzKG1lc29uX3B3bV9wZXJfY2hhbm5lbF9kYXRhW2ldLmNsa19lbl9tYXNrKTsKPiBJ
J3MgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgY2xrX2VuX21hc2sgaXMgbm93IHVzZWQuIFNvIEkgdGhp
bmsgaXQncwo+IHZhbGlkIHRvIGp1c3QgcmVuYW1lIGNsa19lbl9tYXNrIHRvIGNsa19lbl9pZHgg
YW5kIHBhc3MgdGhlIHZhbHVlCj4gd2l0aG91dCB0aGUgQklUIG1hY3JvIGR1cmluZyBpbml0aWFs
aXphdGlvbi4KPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
