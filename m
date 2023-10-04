Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E07E7B611
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Karnv/3NRVS1WcEZrRxutL2a2XVc8yDgVpe5hiMRgAQ=; b=CWXfTSNPtEAKE9
	IBdX/nuggh+UZDHERA9qYwn7BFD+R37N1gFCPzz1W/Ds+qPurBIu6hhPnwOgw21VZhH62AdpW9x0J
	FEmVjOexUSluGGLgfrNfNjiC8RML9pppvBSL0yrCRQiaDesudaHktP4cOxMwpVw9VpcJp7Q+KRy84
	YEanL+mRiqj6rceZ5/TZQeU1keiJqbJtBcBHSCdAD5lOvEdUS69vqaCWBmZSp0lWrrMY35vgVRZTG
	3O9qL2XpD+Td6dmlma3t/ZEs8H4hahWrMa4N+HcW+V0AOOWL2NpKu+2i+lQ9rNDB6sAQQV07GJiaA
	a/kZzO+UlvwaypD5Kyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo205-0008Ot-0m;
	Wed, 04 Oct 2023 13:33:17 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo202-0008OB-1j
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Oct 2023 13:33:16 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-57b8a0f320dso1210108eaf.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Oct 2023 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1696426392; x=1697031192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVU05/6eSA7iMjbJNdKOxOh7qlcL+m/U1QBiwV2qM/s=;
        b=jhxgx7hifgj+R18sofj8F/Xb2U7XRqlR0HkEvkJgtdudO4ek70+mEtHOPCEMBt8mN1
         uCdKHyaXxQij1Oi/CIru57gdWr8Ah64dSqfI2HhpotyjzNa54EWIBy+oQ3gxs7BdSNQn
         dr8j/e2CgvMPeeasY1UZ6aWBUDuk/sHNBcE1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696426392; x=1697031192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVU05/6eSA7iMjbJNdKOxOh7qlcL+m/U1QBiwV2qM/s=;
        b=m+8m5ss/tf/FrCS0kFm204UirZr8xUzii8hxdRX4lnvcu/PPV/t8UFTl+G2ad0yiB2
         OUWEk5D4KquKDuzxNc1JKb2dD/+apVK/gaylqP3AEhijSph560TMT+WBaJJwBrsDRXXJ
         Hh4zP+jA051vEY0GHiP7znYKYc/ItFdz1rB+fcyl05uJ+4RVDjmKmS+BnJ+PJttttquc
         Jx7i9vAjc6kC2xwjLLHlw4eX9i077CWTeDNpTt2GCKhTepaV4sGtZ0XtAk2OgaKH+vTq
         4AqbGRv0Jjr+wpY1utW62gA0+Q2kP1urOhIe9OsHd6656aI7Py3cZDsf2JpsyMcmDtsK
         lydw==
X-Gm-Message-State: AOJu0YzwESXYw6zYPbbecWv0755i6RzJ98n92DDPHHxAaPKIJzYfm701
	a4WxXwJj79pic3TrshNBnuwp0QFqtXzl0d/Vqj0hXw==
X-Google-Smtp-Source: AGHT+IFdWMGiRlhPQJNXuCSpwDBon00Wy1d2O8LTSVzc6jBknELc0g54aRIlIw2z5gDHlItTDtMI2FLmbFdayYYKXrw=
X-Received: by 2002:a05:6358:88f:b0:143:61d:ffd3 with SMTP id
 m15-20020a056358088f00b00143061dffd3mr2911004rwj.4.1696426392070; Wed, 04 Oct
 2023 06:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com> <2248b34e-d755-4142-986c-0ead80796e13@linaro.org>
 <1jleciyahv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jleciyahv.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Wed, 4 Oct 2023 21:33:00 +0800
Message-ID: <CACdvmAhVODCikHMVpX91kBRxZi=7hgrR2Q-_71mFf9OVdptTWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_063314_584109_DBE7373F 
X-CRM114-Status: GOOD (  25.51  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA1OjU54oCvUE0gSmVyb21lIEJydW5ldCA8amJydW5ldEBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4KPiBPbiBXZWQgMDQgT2N0IDIwMjMgYXQgMTE6MjAsIE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+ID4gT24g
MDIvMTAvMjAyMyAxNjoxMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPiA+PiBBZGQgc3VwcG9ydCBm
b3IgdGhlIExpYnJldGVjaCBjb3R0b253b29kIGJvYXJkIGZhbWlseS4KPiA+PiBUaGVzZSAyIGJv
YXJkcyBhcmUgYmFzZWQgb24gdGhlIHNhbWUgUENCLCB3aXRoIGFuIFJQaSBCIGZvcm0gZmFjdG9y
Lgo+ID4+IFRoZSAiQWx0YSIgYm9hcmQgdXNlcyBhbiBhMzExZCB3aGlsZSB0aGUgIlNvbGl0dWRl
IiB2YXJpYW50IHVzZXMgYW4KPiA+PiBzOTA1ZDMuCj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYSBY
dWUgPGRhLnh1ZUBsaWJyZXRlY2guY28+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRGEgWHVlIDxkYS54
dWVAbGlicmV0ZWNoLmNvPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVu
ZXRAYmF5bGlicmUuY29tPgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL01ha2VmaWxlICAgICAgICAgIHwgICAyICsKPiA+PiAgIC4uLi9hbWxvZ2ljL21lc29uLWcx
MmItYTMxMWQtbGlicmV0ZWNoLWNjLmR0cyB8IDEzMyArKysrCj4gPj4gICAuLi4vYW1sb2dpYy9t
ZXNvbi1saWJyZXRlY2gtY290dG9ud29vZC5kdHNpICAgfCA2MTAgKysrKysrKysrKysrKysrKysr
Cj4gPj4gICAuLi4vYW1sb2dpYy9tZXNvbi1zbTEtczkwNWQzLWxpYnJldGVjaC1jYy5kdHMgfCAg
ODkgKysrCj4gPj4gICA0IGZpbGVzIGNoYW5nZWQsIDgzNCBpbnNlcnRpb25zKCspCj4gPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIt
YTMxMWQtbGlicmV0ZWNoLWNjLmR0cwo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1saWJyZXRlY2gtY290dG9ud29vZC5kdHNpCj4gPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNt
MS1zOTA1ZDMtbGlicmV0ZWNoLWNjLmR0cwo+ID4+Cj4gPgo+ID4gPHNuaXA+Cj4gPgo+ID4+ICsK
PiA+PiArICAgIGxlZHMtcHdtIHsKPiA+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJwd20t
bGVkcyI7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBsZWQtZ3JlZW4gewo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fU1RBVFVTOwo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgIGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJkZWZhdWx0LW9uIjsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICBwYW5pYy1pbmRpY2F0b3I7Cj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+PiArICAgICAgICAgICAgICAgICAgICBw
d21zID0gPCZwd21fY2QgMSAxMjUwIDA+Owo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGFjdGl2
ZS1sb3c7Cj4gPj4gKyAgICAgICAgICAgIH07Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBsZWQt
Ymx1ZSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0JM
VUU+Owo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0FD
VElWSVRZOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9
ICJhY3Rpdml0eSI7Cj4gPgo+ID4gImFjdGl2aXR5IiBpc24ndCBkb2N1bWVudGVkLCBwZXJoYXBz
IGhlYXJ0YmVhdCBpbnN0ZWFkID8KPiA+Cj4KPiBUaGUgdHJpZ2dlciBkb2VzIGV4aXN0IHRob3Vn
aC4gVGhlIG90aGVyIHdheSBpcyB0byBleHRlbmQgdGhlIERUIGRvYy4KPiBJIGRvbid0IHJlYWxs
eSBjYXJlIG9uZSB3YXkgb3IgdGhlIG90aGVyCgpXZSBjYW4gYW5kIHNob3VsZCB1c2UgaGVhcnRi
ZWF0IHRvIGJvdGggYmUgY29uc2lzdGVudCBhbmQgYWxzbyBzaG93CkxpbnV4IGhhcyBzdGFydGVk
IGZvciBkZXZlbG9wZXJzLgoKPgo+IEknbGwgZGVmZXIgdG8gRGEgb24gdGhpcyBvbmUKPgo+ID4+
ICsgICAgICAgICAgICAgICAgICAgIG1heC1icmlnaHRuZXNzID0gPDI1NT47Cj4gPj4gKyAgICAg
ICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtX2FiIDEgMTI1MCAwPjsKPiA+PiArICAgICAgICAg
ICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4+ICsgICAgICAgICAgICB9Owo+ID4KPiA+IGxlZHMg
c3Vibm9kZXMgc2hvdWxkIGJlIG5hbWVkIGFzIGxlZCgtWzAtOWEtZl0rKQo+ID4KPiA+IHNlZSBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3bS55YW1sCj4KPiBU
aGF0IEkgZG8gY2FyZS4gVGhlIHNjaGVtYXRpY3MgcmVmZXIgdG8gdGhlIGxlZHMgYnkgbmFtZS4g
VGhlcmUgaXMgbm8KPiBudW1iZXIgYXNzaWduZWQsIG11Y2ggbGVzcyBoZXguIE1ha2luZyBvbmUg
dXAgbWFrZXMgbm8gc2Vuc2UuCj4KPiBVc2VyIHNob3VsZCBiZSBhYmxlIHRvIHF1aWNrbHkgKGFu
ZCBlYXNpbHkpIGxpbmsgIHdoYXQgdGhleSBzZWUgaW4gdGhlCj4gc2NoZW1hdGljcyB3aXRoIERU
Lgo+Cj4gU28gSSdkIHByZWZlciB0byBzdWJtaXQgYSBjaGFuZ2UgZm9yIHRoZSByZWdleCByYXRo
ZXIgdGhhbiBjaGFuZ2luZyB0aGlzCgpJIGRvbid0IGdldCB3aHkgdGhlIExFRHMgc2hvdWxkIGJl
IGhleCBlaXRoZXIuIEl0J3MgY29udHJhZGljdG9yeSB0bwpodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL2xhdGVzdC9sZWRzL2xlZHMtY2xhc3MuaHRtbAoKSSBkaWQgYSBzaW1wbGUgZ3Jl
cCBhbmQgZGlkbid0IGZpbmQgYW55IHJlZmVyZW5jZXMgdG8KTEVEX0NPTE9SX0lEX09SQU5HRS4g
V2UgY2FuIGRlYnVnIHRoaXMgbGF0ZXIuCgo+Cj4gPgo+ID4+ICsgICAgfTsKPiA+PiArCj4gPj4g
KyAgICBsZWRzLWdwaW8gewo+ID4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbGVk
cyI7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBsZWQtb3JhbmdlIHsKPiA+PiArICAgICAgICAg
ICAgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1JfSURfQU1CRVI+Owo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX1NUQU5EQlk7Cj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfNiBHUElPX0FDVElWRV9MT1c+Owo+ID4+
ICsgICAgICAgICAgICB9Owo+ID4KPiA+IERpdHRvLCBidXQgeW91IGNhbiBzaW1wbHkgdXNlICJs
ZWQiIHNpbmNlIGl0J3MgdGhlIG9ubHkgb25lLgo+ID4KPiA+IFNlZSBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLWdwaW8ueWFtbAo+ID4KPiA+IE5laWwKPiA+Cj4g
Pgo+ID4gPHNuaXA+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
