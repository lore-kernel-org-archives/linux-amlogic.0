Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C4C27C77
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsxLa79FwqTmiAi0kMUGYFjjSoqudSroexYFP9lyI/k=; b=CpROyyiT0XM8sg
	uHtyImVUPdNoFHY/Pl4ST3gi7rK6qUMmix2zK3IXUVH4aW5vVaAmUvLCnU0dqQEvQv6EvmdDdm+tV
	T0asdJk4Ek3g3r3Pu/J5TtTGU1OiMEUqGN4gVlA138YN6IfTOvoXorSAPSyBvra65kt5hcW3md4v6
	tThMRwmd04eiZI+Bp1KqpaIJh7du/PIIo8bPdmV9NwPCZKMnmXSg4IiQbr1FzFPyK9ppmLkWFni+v
	j2r8/rBGvucqMVVzbDHMir97wIUxZWSAgqfzkmLYNemcxOZER3F6SwWBxVyBTP2D3nbKNX0MCvT7C
	3lceuzqhfiuk+TyyfILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Dn-00000009vvN-05bc;
	Mon, 17 Jun 2024 09:00:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Dj-00000009vsd-0db6
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 09:00:13 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5295eb47b48so5015398e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718614809; x=1719219609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=pLixaTe5GHzMSh7EGCIeIdHER9D0Qey/pAGddyTiG4YdbFgrMRLLBWLjUUE9caseRi
         v2Te1y6CXJOUkghE3oXqN3GSGMcfKY+xAAyb6czH1zxlPr+2/iELYLfjJJHYchysINoz
         T7yiYSnGO8BeiwPm4TqzcFwikgFkRDjbIZ2ntbxEutpT4gYDbIl90m2wRWGYaUkGq/sS
         4Q3r88pGmF3x6GXmfxH25feDQZrof4VvsPEfzCsmho1IaOUVRCGSgOWM6/psyA3apo8i
         A6mo/AR7f2w4aR8bG5DirFk36ZD/3OJ8NWyJlV4wr4kkFXM1BmnHF1krWVZNm3YPaunH
         3UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718614809; x=1719219609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=FNjI5GlucFLJ7r3b64pPa87LKBzeG1HjX2WwPqIFOQ815l9qkFv/kZduv40OltVoI6
         3vvgI4Tbp5HMGBF75g2kNp28UyFPD0BFP1TUO3I3AB7VJmbqEg1SrqSDbTMbnm4uo2od
         D9layQ0rAXm/OdG/p/OoI4PdJKK8bgGIo6NgrLltvm2x08ZEkk79xsdpr+nduURzAJSm
         3ppEDAxWD7yO8ENU+PfMqavam/utoBa6r6JchPcciXl3S11Rb1B5ZxFQEa+f3Og+VcCb
         p956Fbn8Ven5reGRfPfNXkEO1YhDHgYqi4+Vo9+3a0E8ozbRxTrvQcxsJyl0f1jR+gfp
         Sh5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkJgmqCd1EZXOwmXMTO2MzaRMeeheQB3CCp19UvrXwehXAxZ9h8/aECwvM+tBBAamMSVJruCZtvWkOZneyancvXuig3Vu81ZVj5dMHNjduDxg=
X-Gm-Message-State: AOJu0Yw2yPXlPaYaPvoyGATT5t2GWjXuVuCShuOvQxVtFIwku0isNSJ5
	5vDjySZXqdqr+24cRXTknBuWBqE13txZI/erOR+q8FBj3TsfndYgXGWjVQtSe0Mr1pIPokNJ6sv
	bZkJqKtjFPanH0XKb2bzorJrJ5kGHYxgRzDsvxQ==
X-Google-Smtp-Source: AGHT+IG9zighTs6xvh63BukgGULZA+rm8EHxMlcrHikHKdNririru1xtsssJ0ZWvnvp2q2oJd7kXO4xZ0dX+3hN0oTY=
X-Received: by 2002:ac2:5a4b:0:b0:52c:884f:5a31 with SMTP id
 2adb3069b0e04-52ca6e6dc0fmr6141428e87.30.1718614809351; Mon, 17 Jun 2024
 02:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
In-Reply-To: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:59:58 +0200
Message-ID: <CACRpkdY9aRr+OisO3Bs5-p7gtF_PbGh9MbWnyuURXSuMBW34Nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_020011_218940_EB7D0B6F 
X-CRM114-Status: GOOD (  10.30  )
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

T24gVHVlLCBKdW4gMTEsIDIwMjQgYXQgNjoyMeKAr0FNIEplZmYgSm9obnNvbiA8cXVpY19qam9o
bnNvbkBxdWljaW5jLmNvbT4gd3JvdGU6Cgo+IFdoZW4gQVJDSD14ODYsIG1ha2UgYWxsbW9kY29u
ZmlnICYmIG1ha2UgVz0xIEM9MSByZXBvcnRzOgo+IFdBUk5JTkc6IG1vZHBvc3Q6IG1pc3Npbmcg
TU9EVUxFX0RFU0NSSVBUSU9OKCkgaW4gZHJpdmVycy9waW5jdHJsL2JjbS9waW5jdHJsLWJjbTQ5
MDgubwo+IFdBUk5JTkc6IG1vZHBvc3Q6IG1pc3NpbmcgTU9EVUxFX0RFU0NSSVBUSU9OKCkgaW4g
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtbWNwMjNzMDhfaTJjLm8KPiBXQVJOSU5HOiBtb2Rwb3N0
OiBtaXNzaW5nIE1PRFVMRV9ERVNDUklQVElPTigpIGluIGRyaXZlcnMvcGluY3RybC9waW5jdHJs
LW1jcDIzczA4X3NwaS5vCj4gV0FSTklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJ
UFRJT04oKSBpbiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1tY3AyM3MwOC5vCj4gV0FSTklORzog
bW9kcG9zdDogbWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3BpbmN0cmwv
bWVzb24vcGluY3RybC1tZXNvbi5vCj4KPiBBZGQgdGhlIG1pc3NpbmcgaW52b2NhdGlvbiBvZiB0
aGUgTU9EVUxFX0RFU0NSSVBUSU9OKCkgbWFjcm8gdG8gYWxsCj4gZmlsZXMgd2hpY2ggaGF2ZSBh
IE1PRFVMRV9MSUNFTlNFKCkuCj4KPiBUaGlzIGluY2x1ZGVzIG1hbnkgbWVzb24gZHJpdmVycyB3
aGljaCwgYWx0aG91Z2ggdGhleSBkaWQgbm90IHByb2R1Y2UKPiBhIHdhcm5pbmcgd2l0aCB0aGUg
eDg2IGFsbG1vZGNvbmZpZyBjb25maWd1cmF0aW9uLCBtYXkgY2F1c2UgdGhpcwo+IHdhcm5pbmcg
d2l0aCBBUk0gb3IgQVJNNjQgY29uZmlndXJhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZm
IEpvaG5zb24gPHF1aWNfampvaG5zb25AcXVpY2luYy5jb20+CgpQYXRjaCBhcHBsaWVkLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
