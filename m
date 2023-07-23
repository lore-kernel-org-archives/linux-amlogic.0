Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400E1C001DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jul 2023 19:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uu3rjSyhff39DI9U1mYOpqoZ5e9BQxx/9QMOfUhm9s=; b=gD5iV5cge2J0Hs
	fZ3Ja/zYXD1F1B98xYwCueo7xx28e1RLOfVf4gF+vy8ehAzaYkRlOQ1JGU989wbyEhPGlsISIPDzM
	m3yG4ZypsLLKfSnnie5/ZdU8NkrmH5/oLIIfGYrYjbpH4U+M1wyoTItrShzn/7v8dtIZs7tco3I+W
	6oNkS+BWMN1UKe0ytgnkwIYrlbe0DDtFfK4n83gPh0+UH1XOU0BsbrK+Uac4v9rn/vlhJwm+NbD8n
	cCGFu0Ug6HbnDQqidNw62jCdLAdFeXGOiY4IJzv/ZkoO45JcVGzT1uZrKhSjyIRg1kJvBWmKKcvc5
	xlFBoi4qxo1oFJBXuoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNeed-001gkz-0N;
	Sun, 23 Jul 2023 19:22:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNeea-001gjs-1H
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Jul 2023 19:22:05 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-57688a146ecso43858977b3.2
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Jul 2023 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140122; x=1690744922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fquRMBRj9ZKqtHZyYUupyMW1B32z8De1kiiyymiS6II=;
        b=elN31IJY1iHFOuFJlXhVERTNIognMnWyaoIqk4XbLYrR/dqY4+4zCyHHAfj/GvTodg
         u5Qsr5toLHA4xAoeSMji+9UA6ErZp66b7H6vF/Nql1H41cABdt/j/ayUpyDNj/hhbBaj
         V8Vb1T0/A9UFx3glSYHxplAckjNNlgYVRixk/zzhupIqx6S2zfbj1e58/2wYSafgiRBE
         //EhHzuGoJFosu8DnMGGKbCRbtRznqaLg4/fOzRtyFvyDXcQ+SrfSpbKNELIa0wklH03
         sLxvKuD9MuqJqc3I3FmjZ70VsYmumNfYTIgJKubsBSDhCqkdJXVKG3vbBkjtX2hvxCEP
         fdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140122; x=1690744922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fquRMBRj9ZKqtHZyYUupyMW1B32z8De1kiiyymiS6II=;
        b=iIa6HiK3CZ0nxOVXl4SuivvdD9txEEl93CeqQpl8S2g1v1j3rO6W1tGqIq0cK5edH2
         fjWxreLb4PzZl/0GSBs1uiYZ2nIwethUzClhc55pvY0RGdGwz+oR/+K/tP2zi54UyTcF
         nOfXLTyb3s7YrfXYNSLocGCP7zVDcSU2pf+CXFOBzdtbF1mb3SHJgbMyGjru/T0umQ1G
         7lUOmJkBvFM24auvFAVE7J+3NB3nSXfKTB0VpAsTJaAV46jVNzDqROTybFANgYOcYlq4
         7zbuKuxgNaVuB50TedbP550HDt+0XGWt3SO/NJc+8hvvipoSEE1jCAxewo76LlQ69/BN
         nxaw==
X-Gm-Message-State: ABy/qLYKdD+gypHSpOfb6yC6rGO4qaApwaYYfQg229Ti3ijGgsPIxFBp
	t87eOSUzrlOxQSRLf8bIrCdT4GOjEivd8sLxJ42sFQ==
X-Google-Smtp-Source: APBJJlFQTsRtV2Lfbo2xvto2SS5L44j+argU3fk97wrQhIMB6JGqzRsGIo/hPeDhFQB6VbWRPFTB0A/lm1tvJPnqI0A=
X-Received: by 2002:a81:6f55:0:b0:577:3b66:441 with SMTP id
 k82-20020a816f55000000b005773b660441mr4296179ywc.50.1690140122199; Sun, 23
 Jul 2023 12:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com>
 <20230714122441.3098337-3-huqiang.qin@amlogic.com> <CACRpkdbbUga0biH=1tkCgRzUqNiDGdVf2woda5X2s43ct-na7Q@mail.gmail.com>
 <3e71a3cd-dc40-c3c3-8fe7-5c95096cc462@amlogic.com>
In-Reply-To: <3e71a3cd-dc40-c3c3-8fe7-5c95096cc462@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 21:21:50 +0200
Message-ID: <CACRpkdaEnfG5=zqBNG0gpHfva1dDf=YBUPd8yhkKLSi_-Fvb=A@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_122204_485565_50C1769F 
X-CRM114-Status: GOOD (  12.57  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgOToyNeKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+ID4gQW5keSBoYWQgbW9yZSBjb21tZW50cyBhYm91dCB0
aGUgaGVhZGVyIGluY2x1c2lvbi4gUGxlYXNlCj4gPiBpbmNsdWRlIGFsbCB1c2VkIGhlYWRlcnMg
ZGlyZWN0bHkgYXMgcmVxdWVzdGVkLCBJIHRoaW5rIGl0J3MgYSBnb29kCj4gPiBpZGVhIGFuZCBh
dm9pZHMgY29uZnVzaW5nIGNvbXBpbGUgcHJvYmxlbXMuCj4KPiBZZXMsIHRoaXMgaXMgYSBnb29k
IGlkZWEsIGJ1dCB3aGVuIG1hbnkgZmlsZXMgbXVzdCBpbmNsdWRlIHRoZSBzYW1lIGJhdGNoCj4g
b2YgaGVhZGVyIGZpbGVzIChzZWVtcyB0byBoYXZlIGJlY29tZSBhIGtpbmQgb2YgdGVtcGxhdGUp
LCBpdCBzZWVtcyBsaWtlCj4gYSBnb29kIGNob2ljZSBmb3IgdXMgdG8gcHV0IHRoZW0gYWxsIGlu
IHBpbmN0cmwtbWVzb24uaCAoYWN0dWFsbHkgYmVlbiBkb2luZwo+IHRoaXMgYSBsb25nIHRpbWUg
YWdvKS4KCk9LIEknZCBzYXkgdGhhdCBpcyB1cCB0byB0aGUgdGFzdGUgb2YgdGhlIGRyaXZlciBt
YWludGFpbmVyIHNvIGl0J3MgT0suCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
