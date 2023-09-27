Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023AE810CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCgSRHuepE3VTfX8CP6HIsNw3VmJREuDuzBt2+8J+pQ=; b=VutRFjk4G2PXJf
	/4NXcW+jgkCL8hMBFDjrG/RTJaF3SNotOx839Y6teV6zyllBITglvaLjb3nSksN3E+G9BsIJz7AgH
	ebS33iUuC+KQ8Iy5xch5swTSw0Fxn4C7pqTH7HCD9p5Yq+Va8SCvuec1ED3BbvKaJ9p9+mKmT7mvv
	5fh5nO4yUA2ICMuw9tkj757G7XoTfg2FXIiAMDWm79jwS4c/O1L5r+249bsg4xwj217xpcc7moAIx
	2zPJlQ/AiSIxiGaElVsEL7HmzqNuMNrPbBEDFAdjDD9XPRDsvTh9G7VAuJ4+nFGhVUz8k4ZUHLmG1
	VSpMbKXE50ZMUXyaM8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSBg-000l7s-0B;
	Wed, 27 Sep 2023 10:54:36 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSBc-000l7L-2g;
	Wed, 27 Sep 2023 10:54:34 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59f4bc88f9fso102588077b3.2;
        Wed, 27 Sep 2023 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695812070; x=1696416870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3Muq474iQgcyKLGlerzfl9W5nE8h5TNCDY2DPjEIbk=;
        b=lrpeOnTWdTS2RtNx1nKuwwvglE4z+DdgvCfwejuJGjBxw8pL0qln1kX2t1lO9ctUO2
         zqojsaszxHiLs5wq8GQa6sjmzCmliNI3XCEoxvyaZeqOQ+oG1t74JrVmgyFpZ47E+4Nh
         Gexx4l7DKdoPIaQMPQcvbNtyTpytglMiJLtEcNndpHyHXu3EiV+aTHTtbWEttQKstvni
         pAY6jk1FCwvRV3/YylBKpO3Tf0LvgpUpA32/cW9iiEXcn/kyHwioVAxislaBwgKOy3NY
         75SQprtcuGJXP6/afTXYvKma/LwhJ9CFQOsah+RLz83n9HwWB2qjJooD1Hnq6ZPis9mF
         B5DA==
X-Gm-Message-State: AOJu0Yyv+AS/ozqdoKYau2S8t7JANxZVPh4I3o9RgdtW/zKGu81+3ylL
	F5lBELry/qU3SUXKLY4CHsyOesviV8rWjk3q
X-Google-Smtp-Source: AGHT+IGu+iMFSKqLecMKlzYDcQ6sRRjc///9B8TxYGoVljYbleZX1FCowgS7o8gu4mrebqDV0mF6Gg==
X-Received: by 2002:a81:6c09:0:b0:5a0:e86e:fd5c with SMTP id h9-20020a816c09000000b005a0e86efd5cmr2211627ywc.0.1695812069673;
        Wed, 27 Sep 2023 03:54:29 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id j72-20020a81924b000000b00594fff48796sm3630052ywg.75.2023.09.27.03.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 03:54:29 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d81dd7d76e0so12486765276.1;
        Wed, 27 Sep 2023 03:54:28 -0700 (PDT)
X-Received: by 2002:a25:3dc4:0:b0:d80:1bbf:fabf with SMTP id
 k187-20020a253dc4000000b00d801bbffabfmr1510285yba.2.1695812068696; Wed, 27
 Sep 2023 03:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
 <20230922094342.637251-2-huqiang.qin@amlogic.com> <ff2c6d41-7c9a-4633-8343-eb94404de6e8@linux.com>
 <2d7eac30-480c-49a4-903c-d4f2b3cdfc8d@linaro.org>
In-Reply-To: <2d7eac30-480c-49a4-903c-d4f2b3cdfc8d@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 27 Sep 2023 11:54:17 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpMM78DA_Q1YLddwogW_vHLDLQbO_mnBk_zMNg7V8KA@mail.gmail.com>
Message-ID: <CAJX_Q+2vpMM78DA_Q1YLddwogW_vHLDLQbO_mnBk_zMNg7V8KA@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: pinctrl: Add support for Amlogic T7 SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_035432_868972_73C1B1F9 
X-CRM114-Status: GOOD (  14.67  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMjcsIDIwMjMgYXQgODo0OOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyNy8wOS8yMDIzIDA4
OjA4LCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBPbiAyMi0wOS0yMDIzIDEwOjQzLCBIdXFpYW5n
IFFpbiB3cm90ZToKPiA+PiBBZGQgYSBuZXcgY29tcGF0aWJsZSBuYW1lIGZvciBBbWxvZ2ljIFQ3
IHBpbiBjb250cm9sbGVyLCBhbmQgYWRkCj4gPj4gYSBuZXcgZHQtYmluZGluZyBoZWFkZXIgZmls
ZSB3aGljaCBkb2N1bWVudCB0aGUgZGV0YWlsIHBpbiBuYW1lcy4KPiA+Pgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEh1cWlhbmcgUWluIDxodXFpYW5nLnFpbkBhbWxvZ2ljLmNvbT4KPiA+PiBBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+PiAtLS0KPiA+
Pgo+ID4+IFYxIC0+IFYyOiBSZW5hbWUgYW1sb2dpYy10Ny1ncGlvLmggdG8gYW1sb2dpYyx0Ny1w
ZXJpcGhzLXBpbmN0cmwuaAo+ID4+ICAgICAgICAgICAgQ29ycmVjdGVkIGluZGVudGF0aW9uIGZv
cm1hdC4KPiA+PiBWMiAtPiBWMzogVXBkYXRlZCBzdWJqZWN0Lgo+ID4+Cj4gPj4gICAuLi4vcGlu
Y3RybC9hbWxvZ2ljLG1lc29uLXBpbmN0cmwtYTEueWFtbCAgICAgfCAgIDEgKwo+ID4+ICAgLi4u
L2dwaW8vYW1sb2dpYyx0Ny1wZXJpcGhzLXBpbmN0cmwuaCAgICAgICAgIHwgMTc5ICsrKysrKysr
KysrKysrKysrKwo+Cj4gLi4uCj4KPiA+PiArI2RlZmluZSBHUElPSF8wICAgICAgICAgICAgIDE0
OAo+ID4+ICsjZGVmaW5lIEdQSU9IXzEgICAgICAgICAgICAgMTQ5Cj4gPj4gKyNkZWZpbmUgR1BJ
T0hfMiAgICAgICAgICAgICAxNTAKPiA+PiArI2RlZmluZSBHUElPSF8zICAgICAgICAgICAgIDE1
MQo+ID4+ICsjZGVmaW5lIEdQSU9IXzQgICAgICAgICAgICAgMTUyCj4gPj4gKyNkZWZpbmUgR1BJ
T0hfNSAgICAgICAgICAgICAxNTMKPiA+PiArI2RlZmluZSBHUElPSF82ICAgICAgICAgICAgIDE1
NAo+ID4+ICsjZGVmaW5lIEdQSU9IXzcgICAgICAgICAgICAgMTU1Cj4gPj4gKwo+ID4+ICsjZGVm
aW5lIEdQSU9fVEVTVF9OIDE1Ngo+ID4+ICsKPiA+PiArI2VuZGlmIC8qIF9EVF9CSU5ESU5HU19B
TUxPR0lDX1Q3X0dQSU9fSCAqLwo+ID4gVGVzdGVkLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+Cj4KPiBIb3cgY2FuIHlvdSB0ZXN0IGJpbmRpbmdzPwo+Cj4gQmVzdCByZWdhcmRz
LAo+IEtyenlzenRvZgo+ClN1cmUhCm1ha2UgZHRfYmluZGluZ19jaGVjayAgZHRic19jaGVjayBk
b24ndCBmbGFnIGFueSBpc3N1ZXMgd2l0aCBUNyBiaW5kaW5ncy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
