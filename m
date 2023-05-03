Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F5C77B75
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 May 2023 22:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfCwHFPs1plUpQiHC0+f1aykBcyDgLxM8f6bsTWlfOk=; b=n5Kie8EwIhmVrV
	m5WnH2p6ZzNfYE48o/5ssidTjhhQ1/sF5l9uGRc8zIrfW3gRJ+ssnjTH93VHbd5syvGZXgvYQKDQw
	InOJXQSpkITXi7egRyQNdUrnkCxSmO4gtoGPBHXWW9lSnFNrC0BsGmIM/6pdrSM2lKNg+j6ZxKOQn
	HnER4tjBKEcqpdk9rNch3OIQlNPzMhxJNBWHILiErTCy+NQGUqiJLUhe6rgRrBk5UPhNGY5SDCncd
	+cE9NVoJvndLzmA1MSk2pP6HFlMid7AYdLa1oI44w7EaBgTB0C/EGG42juwVYDzQFHhL3ZfZtVg9h
	uwMRlSJKu11RbRu4Mo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puKs7-005yV6-2a;
	Wed, 03 May 2023 22:22:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puKs5-005yUB-1Y;
	Wed, 03 May 2023 22:22:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F73363061;
	Wed,  3 May 2023 22:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26305C433A7;
	Wed,  3 May 2023 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683152567;
	bh=3fU8zKQCl4Kz1eWXPpHONjdIQH2Taxo8c7rFXpP8al8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gyKS6MttCNtMBfY1UbH64Gxs+WPEh98Gt6OT01M40SteIWEK5rSEDwur1RaXFO+KB
	 k1tdcAAsc2c2rzXvd1weeyyawHuQ8Lq59qhupvTSHCEywGQVnNLirhUV5LFKBX8xed
	 l0/UGIQ3CmVjXekItREFnJAzg+8iaG+wi29nNBk6X2ZIHAF+OpORY7hcZEXw8ggyI7
	 lqhuUpVxEH1ffbseQZUFxUdR9etC+52u7eYE9GhWMkOLouRSZWF2P5Zy0o7/nRvHLU
	 sdqmfLYRY9trzvPKYYsZ5exHv0HiJ28pGmOXf1C9Ug/qGMH9We/64sSgv1jQPsw+Ts
	 HEEttqKJrWkpw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so6649605e87.0;
        Wed, 03 May 2023 15:22:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDyOwp9gnQ9SCZ2yQ/MneRfE5+JaHE42X3JjBk4QhbEIi1usLYY3
	mQll7pNtzBkJmpFNgaqTmXFnfl9RfHpfk/d1Fw==
X-Google-Smtp-Source: ACHHUZ7HeoGV7sGaLAr5Tc+TosYIxgwnkvp5ZEsh8Jj7wpXuo0FJb1Bm44GqyVTuGr9wlxbZQ+2RYfnrH8bg8TYUOtU=
X-Received: by 2002:a19:ee03:0:b0:4ea:fa26:2378 with SMTP id
 g3-20020a19ee03000000b004eafa262378mr1222041lfb.23.1683152565137; Wed, 03 May
 2023 15:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com> <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com> <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
 <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
In-Reply-To: <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 17:22:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLi+h3E8wEjuzjdh-VhWac8VJAfBeAKAHMny=gg=-OQgQ@mail.gmail.com>
Message-ID: <CAL_JsqLi+h3E8wEjuzjdh-VhWac8VJAfBeAKAHMny=gg=-OQgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Olof Johansson <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_152249_614864_DF208EFB 
X-CRM114-Status: GOOD (  12.09  )
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCAzOjM34oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAzLCAyMDIzLCBhdCAxNToxNiwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4KPiA+IFdlIGNvdWxkIGRvIGEgc2Vjb25kIGxldmVsIG9mIGRpcmVjdG9yaWVz
IGhlcmU6Cj4KPiBXb3JrcyBmb3IgbWUsIGJ1dCBhdCB0aGF0IHBvaW50LCBJJ2QgcmVhbGx5IGFs
c28gd2FudCB0byBkbyBpdAo+IGZvciBueHAgd2l0aCBpdHMgZml2ZSBvciBtb3JlIHByb2R1Y3Qg
bGluZXMgKG14cywgaW14LCBscGMsCj4gczMyLCBsYXllcnNjYXBlLCB2eWJyaWQpCgpBbmQgbWFy
dmVsbCwgbWljcm9jaGlwKGxhbjk2KSwgdGksIGFuZCBicm9hZGNvbSBwcm9iYWJseS4gSSB0aGlu
ayBJCndpdGhkcmF3IG15IHN1Z2dlc3Rpb24uLi4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
