Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBAEEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2cMhjw5ZJXJIokS2VE7BPKYS+xkipcSPG9SAFAQoKY=; b=UnrMuCwcS4xWHC
	rU1QHhFi5ER8hP/foVew2797HtVODZXVukQx16SGpnpvoi3JLfR6qaprmBuYYIIvGtY9+SiujlrX0
	6VSaPXIWTRs6yx3zLJzpLOPSXW1+gbxAofYc/YcV3g7n6zUu0VM+BFWZ/ro6hdJqiRCctNGb4P3mg
	BRaFSNOYnmifgBMgsIdGRyZM5s3/wIPiQzKtu+a7jG7BnubCKk2CiPebPrfmEn/35a6+53XwwPAjw
	Sk/JhtPyyp4cueE8N4yAkRDFViXPd+SslAx0xNCe2PL2ngW2E/yyt2/odihc860IsDSOiA3bE1hbd
	17hJHAz2vdhzsFoSOHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImpW-00AxTT-0y;
	Mon, 10 Jul 2023 09:05:14 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImpS-00AxS5-2a
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jul 2023 09:05:12 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7948540a736so1326869241.1
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jul 2023 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979908; x=1691571908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy2KuLcXZ4Ve1Tpog66+CQXXOfL/pwzTVK9wzp2h/kY=;
        b=YE+VfCqfJoJp0tmjB0RFKq39bKSXtnUO3Dm4zvB0Y0Fq9Vjm2fgh5t4/sBD1sxB2eY
         IQSYIsb66mJLgM/I2FVBkp22OLiB/dSjBeSZQ7f0cDu0fa5YnzGYIMYUZusZXggOMn+x
         vJPcdGuQ2FdFPpzbW/dLV/DQIEGuaX6LW9lx4CRUJszjEIYVko3x8hCVBEMKSW+yCl3/
         1BWpKfSYPIWd9bDbfFVlpRkLa7eQjlWvRMHXSxq3fNSn+ktUjj1iU4UjExdAvFY6PF4N
         zgC8Spd6dfIcv+JLcmds/2140n07lwvlcRbgPBkPM5suSuaF1bif33PklFo0lmQtFxme
         QUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979908; x=1691571908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy2KuLcXZ4Ve1Tpog66+CQXXOfL/pwzTVK9wzp2h/kY=;
        b=l+iEglY7jSfbOLV3wxGcBGb6iohQw5Szc/55pb9fkkLBnafmnL2lG3ICHShn/w3/Ut
         FZKNg5u2oARwratwk6O3MZgl2n1uIaLQpu+TvBJdGJ7NuFtk+k+j4UibS0Sw0I0D2lRE
         gqkacQx6hoTi25eTYUvqn3WGC/PKGlgF2csCsKtk9JTRnemNmiKQweBDJ0RxTbGQ5Tgl
         Q/QIAltL0thkJahczSQ6NBK2AsakMHOnSt9qqYmfAXXilEgVWjPeUbf1mO0QUyZ1TyWW
         JC7SgPjAFzTDbIUpWjhvb+ZPHpX8d6bTDq9DlrUiMoNwfc1pq6Kzggp8pq2dfSvVlrxE
         oalA==
X-Gm-Message-State: ABy/qLaXG6Phrwi+7XoDjhejSdctD51DtvRoOCVE8jnkSvtsARzE4y2m
	7KvtLH4npnGCwRniQiv2r2uJ67OWf6R/o4hIGrJH+g==
X-Google-Smtp-Source: APBJJlEdo1R2E090zn3ecweFkWTp3l4QNO79GBLaXhJtnB6M+dCng+dsfc05WHU9/mhxXwGhnSmIrycnWCooN6CvlxA=
X-Received: by 2002:a67:eb44:0:b0:43b:3cab:23a8 with SMTP id
 x4-20020a67eb44000000b0043b3cab23a8mr6227319vso.20.1688979908344; Mon, 10 Jul
 2023 02:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com> <20230710042812.2007928-2-huqiang.qin@amlogic.com>
In-Reply-To: <20230710042812.2007928-2-huqiang.qin@amlogic.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jul 2023 11:04:57 +0200
Message-ID: <CAMRc=McCKW6x_qrYFowfuxZ8O3at1NjudjyxabHTomzQz7R0yg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: Add a header file for Amlogic
 C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020510_864754_3E7A28BA 
X-CRM114-Status: GOOD (  16.19  )
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

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNjoyOOKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZHQtYmluZGluZyBhbmQgcmVsYXRlZCBoZWFk
ZXIgZmlsZSBmb3IgQW1sb2dpYyBDMyBHUElPLgo+CgpUaGUgc3ViamVjdCBvZiB0aGlzIHBhdGNo
IGlzIGRlc2NyaWJpbmcgdGhlIG5ldyBtb2RlbCwgbm90IG9ubHkgYWRkaW5nCnRoZSBoZWFkZXIs
IHNvIG1ha2UgdGhlIGNvbW1pdCBtZXNzYWdlIHNheSB0aGF0LCBlLmcuOiBkdC1iaW5kaW5nczoK
Li4uOiBkZXNjcmliZSB4eXoKCkJhcnQKCj4gU2lnbmVkLW9mZi1ieTogSHVxaWFuZyBRaW4gPGh1
cWlhbmcucWluQGFtbG9naWMuY29tPgo+IC0tLQo+ICAuLi4vcGluY3RybC9hbWxvZ2ljLG1lc29u
LXBpbmN0cmwtYTEueWFtbCAgICAgfCAgMSArCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvZ3Bpby9h
bWxvZ2ljLWMzLWdwaW8uaCAgICB8IDcyICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0
LWJpbmRpbmdzL2dwaW8vYW1sb2dpYy1jMy1ncGlvLmgKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9hbWxvZ2ljLG1lc29uLXBpbmN0cmwt
YTEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2FtbG9n
aWMsbWVzb24tcGluY3RybC1hMS55YW1sCj4gaW5kZXggOTkwODBjOWVhYWMzLi5lMDE5YjZhYTZj
YTMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLWExLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9hbWxvZ2ljLG1lc29uLXBpbmN0cmwtYTEueWFtbAo+
IEBAIC0xNyw2ICsxNyw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICBlbnVtOgo+ICAgICAgICAtIGFt
bG9naWMsbWVzb24tYTEtcGVyaXBocy1waW5jdHJsCj4gICAgICAgIC0gYW1sb2dpYyxtZXNvbi1z
NC1wZXJpcGhzLXBpbmN0cmwKPiArICAgICAgLSBhbWxvZ2ljLGMzLXBlcmlwaHMtcGluY3RybAo+
Cj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL2dwaW8vYW1sb2dpYy1jMy1ncGlvLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2dw
aW8vYW1sb2dpYy1jMy1ncGlvLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNzVjOGRhNmY1MDVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvZ3Bpby9hbWxvZ2ljLWMzLWdwaW8uaAo+IEBAIC0wLDAgKzEsNzIgQEAKPiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgTUlUKSAqLwo+ICsvKgo+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjEgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVk
Lgo+ICsgKiBBdXRob3I6IEh1cWlhbmcgUWluIDxodXFpYW5nLnFpbkBhbWxvZ2ljLmNvbT4KPiAr
ICovCj4gKwo+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19BTUxPR0lDX0MzX0dQSU9fSAo+ICsjZGVm
aW5lIF9EVF9CSU5ESU5HU19BTUxPR0lDX0MzX0dQSU9fSAo+ICsKPiArI2RlZmluZSAgICAgICAg
R1BJT0VfMCAgICAgICAgIDAKPiArI2RlZmluZSAgICAgICAgR1BJT0VfMSAgICAgICAgIDEKPiAr
I2RlZmluZSAgICAgICAgR1BJT0VfMiAgICAgICAgIDIKPiArI2RlZmluZSAgICAgICAgR1BJT0Vf
MyAgICAgICAgIDMKPiArI2RlZmluZSAgICAgICAgR1BJT0VfNCAgICAgICAgIDQKPiArCj4gKyNk
ZWZpbmUgICAgICAgIEdQSU9CXzAgICAgICAgICA1Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9CXzEg
ICAgICAgICA2Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9CXzIgICAgICAgICA3Cj4gKyNkZWZpbmUg
ICAgICAgIEdQSU9CXzMgICAgICAgICA4Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9CXzQgICAgICAg
ICA5Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9CXzUgICAgICAgICAxMAo+ICsjZGVmaW5lICAgICAg
ICBHUElPQl82ICAgICAgICAgMTEKPiArI2RlZmluZSAgICAgICAgR1BJT0JfNyAgICAgICAgIDEy
Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9CXzggICAgICAgICAxMwo+ICsjZGVmaW5lICAgICAgICBH
UElPQl85ICAgICAgICAgMTQKPiArI2RlZmluZSAgICAgICAgR1BJT0JfMTAgICAgICAgIDE1Cj4g
KyNkZWZpbmUgICAgICAgIEdQSU9CXzExICAgICAgICAxNgo+ICsjZGVmaW5lICAgICAgICBHUElP
Ql8xMiAgICAgICAgMTcKPiArI2RlZmluZSAgICAgICAgR1BJT0JfMTMgICAgICAgIDE4Cj4gKyNk
ZWZpbmUgICAgICAgIEdQSU9CXzE0ICAgICAgICAxOQo+ICsKPiArI2RlZmluZSAgICAgICAgR1BJ
T0NfMCAgICAgICAgIDIwCj4gKyNkZWZpbmUgICAgICAgIEdQSU9DXzEgICAgICAgICAyMQo+ICsj
ZGVmaW5lICAgICAgICBHUElPQ18yICAgICAgICAgMjIKPiArI2RlZmluZSAgICAgICAgR1BJT0Nf
MyAgICAgICAgIDIzCj4gKyNkZWZpbmUgICAgICAgIEdQSU9DXzQgICAgICAgICAyNAo+ICsjZGVm
aW5lICAgICAgICBHUElPQ181ICAgICAgICAgMjUKPiArI2RlZmluZSAgICAgICAgR1BJT0NfNiAg
ICAgICAgIDI2Cj4gKwo+ICsjZGVmaW5lICAgICAgICBHUElPWF8wICAgICAgICAgMjcKPiArI2Rl
ZmluZSAgICAgICAgR1BJT1hfMSAgICAgICAgIDI4Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9YXzIg
ICAgICAgICAyOQo+ICsjZGVmaW5lICAgICAgICBHUElPWF8zICAgICAgICAgMzAKPiArI2RlZmlu
ZSAgICAgICAgR1BJT1hfNCAgICAgICAgIDMxCj4gKyNkZWZpbmUgICAgICAgIEdQSU9YXzUgICAg
ICAgICAzMgo+ICsjZGVmaW5lICAgICAgICBHUElPWF82ICAgICAgICAgMzMKPiArI2RlZmluZSAg
ICAgICAgR1BJT1hfNyAgICAgICAgIDM0Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9YXzggICAgICAg
ICAzNQo+ICsjZGVmaW5lICAgICAgICBHUElPWF85ICAgICAgICAgMzYKPiArI2RlZmluZSAgICAg
ICAgR1BJT1hfMTAgICAgICAgIDM3Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9YXzExICAgICAgICAz
OAo+ICsjZGVmaW5lICAgICAgICBHUElPWF8xMiAgICAgICAgMzkKPiArI2RlZmluZSAgICAgICAg
R1BJT1hfMTMgICAgICAgIDQwCj4gKwo+ICsjZGVmaW5lICAgICAgICBHUElPRF8wICAgICAgICAg
NDEKPiArI2RlZmluZSAgICAgICAgR1BJT0RfMSAgICAgICAgIDQyCj4gKyNkZWZpbmUgICAgICAg
IEdQSU9EXzIgICAgICAgICA0Mwo+ICsjZGVmaW5lICAgICAgICBHUElPRF8zICAgICAgICAgNDQK
PiArI2RlZmluZSAgICAgICAgR1BJT0RfNCAgICAgICAgIDQ1Cj4gKyNkZWZpbmUgICAgICAgIEdQ
SU9EXzUgICAgICAgICA0Ngo+ICsjZGVmaW5lICAgICAgICBHUElPRF82ICAgICAgICAgNDcKPiAr
Cj4gKyNkZWZpbmUgICAgICAgIEdQSU9BXzAgICAgICAgICA0OAo+ICsjZGVmaW5lICAgICAgICBH
UElPQV8xICAgICAgICAgNDkKPiArI2RlZmluZSAgICAgICAgR1BJT0FfMiAgICAgICAgIDUwCj4g
KyNkZWZpbmUgICAgICAgIEdQSU9BXzMgICAgICAgICA1MQo+ICsjZGVmaW5lICAgICAgICBHUElP
QV80ICAgICAgICAgNTIKPiArI2RlZmluZSAgICAgICAgR1BJT0FfNSAgICAgICAgIDUzCj4gKwo+
ICsjZGVmaW5lICAgICAgICBHUElPX1RFU1RfTiAgICAgNTQKPiArCj4gKyNlbmRpZiAvKiBfRFRf
QklORElOR1NfQU1MT0dJQ19DM19HUElPX0ggKi8KPiAtLQo+IDIuMzcuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
