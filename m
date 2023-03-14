Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EE2C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTOUYSHPMHlDLeqorcH+bpHCW8rcjPGb588iOEzuzgM=; b=Ysg/hGWDXYdY4Y
	12h2+jsdURuJlhNz1GfR3/FbfDp5h1g4S+aCBBEC2Zc16hvjEn49qYMo16XZCnU/LEh0WGFEy0jYZ
	Y2yX2Pjot1+HdgalKe5IjitChcFKDPNjwEDH97szmN+z8POHSjqBTO4Qu3GPs+iZBnxVvDLz8F4pp
	254ykjW1MxkI7Ln3KWf67d5UX5ppn3zEbstVbdXur5iw7B6wu6kPhwUANMMv4pTLuV/XQf9409bJS
	Lgkdzam64Fh82jfsVVVONUJ/l6tQPtY/s97FwPxPmJm0e1jlFFW3J7gft/qCC9eH99Ym49SEhjdFC
	emQ0JpTBc9IQima+gItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz5A-009MYg-P9; Tue, 14 Mar 2023 07:28:28 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz57-009MWh-BL
	for linux-amlogic@lists.infradead.org; Tue, 14 Mar 2023 07:28:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id y189so4168734pgb.10
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678778902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zrI9sVCqqmiSpcdBkCHHv05oCLBJ25Dqqg/e/HY1PE=;
        b=C9Ey32sJTJaASu+z/1FyslqsbfnyNdmJUNUB6+oB2OmmFLHW3TXdFt4/QmkDEnPkXd
         J+oc1JqjQ8+RGLMBczqsDWq8yStl1QMxo29VJMhOqitTFiKyguQUDPIIasYjKO17wHtT
         ng8Vb3hQv4v493VlrtpS5Bl24vFIuA7GnsgJts+pUOY/YGNteg6pBDhmx6ob8nHqvrTc
         aTsaVCGKF4NRp1KsEXNOuw+ii/VCp08zCDb5Qzz7Cx1Tea++NbjUycXOEphG27a5Hx4u
         K6rD7s+ZuEbs4YHjEVgPqBSYxTWJ6abqoQQ5oeQktZjIjVT6HK9Iqwt6DgFmDgHWCydb
         pk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678778902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zrI9sVCqqmiSpcdBkCHHv05oCLBJ25Dqqg/e/HY1PE=;
        b=YZeO+fBR/JgvM//GHYFLVSL2CoLdxabxpO6wjdErMb9BhioCfU43SyD3DFRXKOfSkH
         5T9ApEY3WrGji20DKanCIMnmWsU5reO5bD6eNtmCZqPHoiGaJndqyGIgKb0RGnk341A7
         CM7+by+lPtrdc7S3u9unoRc1Noew7lg8pUkDGsUfM/145hIczI5BoZQAnwj7bFGtFF0w
         QOCj3kn2g0mjWKt7WdJLmqB+mZtpa4IQB9QaQa1blwWcwSisd6b0r9VLD0YIhePajGKd
         ApDz+3H4EQRCZY0CY0TfAo4gkz56nPmSrp+nnm3j9+elvQmt4c1YNsOcjqYdp8Oj38wi
         /NIQ==
X-Gm-Message-State: AO0yUKU+d2crp7vfe1mmEWQyFtnH0hcEcwVGAM1kGYtQq7ZP0wvyxWi9
	A6mEGn/9f2hAJW3+yrGeL1o1Oxq9H17tlG9rTfdCPA==
X-Google-Smtp-Source: AK7set/ymRCuQVVjd2YSJZ2ksOxjN0aMC8SJdN2Byssx3rCYzgon3Q33ArJQyLMI7amWxCU0riaxj2d7lDIOIcFTf1A=
X-Received: by 2002:a63:7d03:0:b0:503:a268:b81e with SMTP id
 y3-20020a637d03000000b00503a268b81emr12895598pgc.5.1678778901900; Tue, 14 Mar
 2023 00:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr> <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr> <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr> <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
 <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr>
In-Reply-To: <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Mar 2023 08:27:45 +0100
Message-ID: <CAPDyKFrC3a5-VP2DvCYGYUzKtX4Jc7cvNQOKfutW0sha=szOyg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230314_002825_440971_F192A065 
X-CRM114-Status: GOOD (  18.52  )
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

T24gTW9uLCAxMyBNYXIgMjAyMyBhdCAyMjo0MiwgTWFyYyBHb256YWxleiA8bWFyYy53Lmdvbnph
bGV6QGZyZWUuZnI+IHdyb3RlOgo+Cj4gT24gMTMvMDMvMjAyMyAyMTowNCwgTWFydGluIEJsdW1l
bnN0aW5nbCB3cm90ZToKPgo+ID4gT24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNjowOeKAr1BNIE1h
cmMgR29uemFsZXogd3JvdGU6Cj4gPiBbLi4uXQo+ID4+IFFVRVNUSU9OOgo+ID4+IEl0J3Mgbm90
IGNsZWFyIHRvIG1lIHdoeSB3ZSBzbGVlcCB0d2ljZSBmb3IgaG9zdC0+aW9zLnBvd2VyX2RlbGF5
X21zPwo+ID4KPiA+IEknbSBub3Qgc3VyZSBidXQgSSB0aGluayBob3N0LT5pb3MucG93ZXJfZGVs
YXlfbXMgaXMgaW5kZXBlbmRlbnQgZnJvbQo+ID4gdGhlIHBvc3QtcG93ZXItb24tZGVsYXktbXMg
cHJvcGVydHkgb2YgIm1tYy1wd3JzZXEtc2ltcGxlIi4KPgo+IFRoZXkgYXJlIGRpc3RpbmN0IGlu
ZGVlZCAodGhlIHByb3BzIGhhdmUgdGhlIHNhbWUgbmFtZSAmIHNpbWlsYXIgcHVycG9zZSB0aG91
Z2gpLgoKQ29ycmVjdC4KCj4KPiBob3N0LT5pb3MucG93ZXJfZGVsYXlfbXMgaXMgc2V0IHZpYToK
Pgo+IGRyaXZlcnMvbW1jL2NvcmUvaG9zdC5jOiAgICAgICAgZGV2aWNlX3Byb3BlcnR5X3JlYWRf
dTMyKGRldiwgInBvc3QtcG93ZXItb24tZGVsYXktbXMiLAoKVGhpcyBpcyBhIHByb3BlcnR5IHRo
YXQgbWF5IGJlIHNwZWNpZmllZCBpbiB0aGUgaG9zdCdzIE9GIG5vZGUuIFNlZQpEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1jb250cm9sbGVyLnlhbWwuCgo+IGRyaXZl
cnMvbW1jL2NvcmUvaG9zdC5jLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZob3N0
LT5pb3MucG93ZXJfZGVsYXlfbXMpOwoKTm90ZSB0aGF0IHRoZSBkZWZhdWx0IHZhbHVlIGlzIHNl
dCB0byAxMCBtcywgaW4gbW1jX2FsbG9jX2hvc3QoKS4gU28sCmlmIHlvdSBuZWVkIGEgZGlmZmVy
ZW50IHZhbHVlLCB0aGF0IGNhbiBiZSBzcGVjaWZpZWQgaW4gRFQuCgo+Cj4KPiBwd3JzZXEtPnBv
c3RfcG93ZXJfb25fZGVsYXlfbXMgaXMgc2V0IHZpYToKPgo+IGRyaXZlcnMvbW1jL2NvcmUvcHdy
c2VxX3NpbXBsZS5jOiAgICAgICBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAicG9zdC1w
b3dlci1vbi1kZWxheS1tcyIsCgpUaGlzIGlzIGEgcHJvcGVydHkgdGhhdCBtYXkgYmUgc3BlY2lm
aWVkIGluIHRoZSBwd3JzZXEgT0Ygbm9kZS4gU2VlCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tbWMvbW1jLXB3cnNlcS1zaW1wbGUueWFtbC4KCj4gZHJpdmVycy9tbWMvY29yZS9w
d3JzZXFfc2ltcGxlLmMtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHdyc2VxLT5w
b3N0X3Bvd2VyX29uX2RlbGF5X21zKTsKPgo+Cj4gSG93ZXZlciwgdGhleSBhcmUgYm90aCB1c2Vk
IHRvIGRlbGF5IG1tY19wb3dlcl91cCgpLAo+IGFuZCB0aGUgaG9zdCBkZWxheSBpcyB1c2VkIHRv
IHNsZWVwIHR3aWNlLCB3aGljaCBJCj4gZm91bmQgY29uZnVzaW5nIDspCgpJdCdzIGNlcnRhaW5s
eSBhIGJpdCBoYWlyeSB0byBmb2xsb3csIGJ1dCBJIHRoaW5rIHlvdSBoYXZlIHVuZGVyc3Rvb2QK
dGhpbmdzIGNvcnJlY3RseS4KCj4KPiBSZWdhcmRzCj4KCkxvb2tzIGxpa2UgeW91IGFyZSBnZXR0
aW5nIGNsb3NlciB0byB0aGUgc29sdXRpb24sIGF0IGxlYXN0IGZvciB0aGUKZmlyc3Qgc3RlcCB0
byBtYWtlIHN1cmUgdGhlIFNESU8gY2FyZCBpcyBnZXR0aW5nIGRldGVjdGVkIHByb3Blcmx5LgpO
aWNlIQoKS2luZCByZWdhcmRzClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
