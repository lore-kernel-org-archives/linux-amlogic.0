Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E3C77B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oM87WYT1cywlTSGfn+YCo6FIcBMPTE0tN/yCRN609GA=; b=g9d+67IT5bQflh
	B6J1Kmjh8WylIDa5YGo8ur4rpAXJZDWKwq9A1ng46fw0az8EJwdtod6yfYeorq2DzSevDlZ6DCkLP
	bWClHGzWN8T6/HGPxMTwW+WWrcibyBybpt8wKYxQ/+NAAdzSn26/qO8PAGEiTiDE8K591mrluLOgQ
	mEZHw9s+6FhW789UqVlWSN9sejUr3dFifLyzWKo4BcDuD5sX3GZdqfDJZFxMGGp93zIUpgf2o8xua
	iJaZoHsSjYnzbCkeoZTK6ehHBDzW4S5dHDAQx5FVkUzFwgMXaQHdI4dUAXzu1bEry0OMhboUVMk1Y
	7R9+HLbbr64uz/77ZKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqcp-006xRQ-0S;
	Wed, 10 May 2023 20:41:27 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqcl-006xQB-22;
	Wed, 10 May 2023 20:41:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-959a3e2dd27so1368528766b.3;
        Wed, 10 May 2023 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683751280; x=1686343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLyFEVV1jGPC3iY0YIn9kdsHioTTS2gGvHxpATDXhkk=;
        b=YpOpHDpzp24vwhDBhE0jfhGgbGNkWSaCX+VkPGlXQoiKh9kr/iWWVZLaAkS/iYSp2i
         0hZIdmk9p8XneA20JGqtXN88Jk+d56rtJBRMZF4mImL0X6SnFFe9qRC5IcWlZUIODvMZ
         uerl9BOwdoTRgFSws6rfYIRlXIMCkgGTRlxixfDyR2/3rq5eFkWbfnNh7aQsG71YOEGX
         Kzptpkc0VRL/aA/ML36B5jaizIoAEKf/zWA1nTu5tI7loJCOV4UFW2sLHxo2J2nzyJWf
         OcXdMVN7AxbL3Dk5rH7N/EZUTCDKco2OEaL+GTI+O8yV1mmN3FKmq77WoZFxZO3+X0Sd
         ZVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683751280; x=1686343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLyFEVV1jGPC3iY0YIn9kdsHioTTS2gGvHxpATDXhkk=;
        b=A97DENoGyy7AircypAC55P3ZEjQ//dwNPUnkDyX10isVZ/xCeXdIZ7b9+iP0uGeN7A
         5K73/NxLW46EoN7TKouCLoC4HdT6yFdyzkQrrlbcNZinrdXJDr0PtVxvEPtaeWAdYpa9
         WXuKlqlc+oHbYx900O8x2VmkzEjaYpGvNPWn2vVCYNceTVy9sxbPPu6+HSxO8H9sbR7n
         /XV+ipUex+EetjLLIVv4XahsOetQzvxwp7lZ9gGw8pus36kktkpdX0/KihaL4Mqw85s3
         8TNSgQzE5MyoURXdDsgU//pEfzZjgvHgPSNxedVosuFrInyW6KTNm0w+DBrvjsGi6JtN
         CSdw==
X-Gm-Message-State: AC+VfDzkxdsoi8ZedQVSLsuHOECTNFBu6iYCg8sMpcZW+jgKLi794Dj1
	AlyV1VFxmY5WK1RkDNbN1UmiRo+RC4MdxiV8Ggo=
X-Google-Smtp-Source: ACHHUZ7v3GSnX/C7ZWC2qvI7W7PUdDYNaIEoaMgIEvO25DgY0uOdNHTyHCHKx8YPktTMr2JgvwpsTnDMOynGxZlP8x8=
X-Received: by 2002:a17:907:843:b0:94f:5847:8ac with SMTP id
 ww3-20020a170907084300b0094f584708acmr16386781ejb.51.1683751279630; Wed, 10
 May 2023 13:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 May 2023 22:41:08 +0200
Message-ID: <CAFBinCARygtyxpfOv9ELMoBkPPDS=C8nRHU-EqSBAgcBrJvdag@mail.gmail.com>
Subject: Re: [PATCH 36/89] i2c: meson: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Wolfram Sang <wsa@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134123_669997_96EA20E0 
X-CRM114-Status: GOOD (  12.07  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAxMDo1M+KAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFs
dWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1
bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0
IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0
ZXAgb2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9u
ZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
