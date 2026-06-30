Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31894C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYPrW5MIftAaDafgdnm210OZNJerpw6XP5Ji+r8/koo=; b=b4QTSf/axK6oeI
	qNEBTyX0Y4b47QmFMpSuC/Yo3W7vOAIqXJpzV2F24adWjxILTT03w+1n+oJQUgOOsBb1O274BG7/0
	2NgNo1VrxeKaL1HGuH6tgmBXgCQjJJSdXLbBNdQeaDguppPTH8Y8tTQgIpCSS7cg6uVEFMMfxaZHT
	dfrnAdC0rGIxuUala7Ljt5mwaQLKFm6ndA+SZeC3bskTpHzj/yIQw5fsKwMtdYAbOhUeGbzx7K2CW
	9XnUYc6idDYT/SrH05cp/QZlianLgdZu85bjqiLPJ4IWOU3cK/LIeQ7Dz+DAFWq0JkIQIXLTB2i5T
	TmLgvOAY7PorAGQ8zFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegz6-00000000JPA-2Ydm;
	Tue, 30 Jun 2026 22:31:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegz5-00000000JOt-1WZv
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 22:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19BFA4400C
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 22:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F811F00ADF
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858675;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n0FIWZsT64s808ZN5DPQCSd38F9dqMBDTr122mpLWcKUL0U57cT8ZcAddOD67hQNU
	 fNZ/8wqFSf8V6QQ228spyMlKPuVWnIE1blXFXK731BSImUJTcPxQSskBwcSj7WMei9
	 bXTBGXSxdkxkA+p2/YC5Yr7EsI6B5AWT2ZPn98tudaS3IIKwJvjNlg81CSz6Xk/yaS
	 OtQKvHGIunLV/piayMiPOg7kYP8cq15wEvsVGwK78KB/Zeo6Q95TgTPU3926joVlqe
	 dV+nJsISLi8KftA6SfEI3tcM2ChKiKeuxCISq+bL9mXRqaL8UGhdyoLEuMNq7Kwwwy
	 6IrIeWkGYLfXw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1983178e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 15:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoPitzfhJ/LGgQOKq1W+CG1wGH7/4fcGXMTr4nC+ONM/twrGe9C6g2YmDD5LKwwvzmKDxCQm1Ht4mMBsjO/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0hp0yjOgAlcTbk209ik4OSmZSnw+OLHYtCLCheDSuU9GfWAbB
	4fEUyd+fGKZPJTh04x8qwVHR8vVBq8/YQLKKI3q+4iPDdx8oiqqxyOvs8Di0qAMUWC/v/ME/Y/N
	SJcJWff0THTg8sqzBmS6grd8X4piuRfk=
X-Received: by 2002:a05:6512:1389:b0:5ae:c286:c54e with SMTP id
 2adb3069b0e04-5aec286c65bmr321902e87.47.1782858673751; Tue, 30 Jun 2026
 15:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
X-Gm-Features: AVVi8CeD_JGR0lMhBhRY5S2FOUVA0y7Fr83_izAzoDl2Cf1SkECqUOqmnWip8_E
Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Viacheslav Bocharov <v@baodeep.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNTowMuKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoaXMgbG9va3MgZ29vZCB0byBtZS4gTGludXM6IGRv
IHlvdSB3YW50IG1lIHRvIHRha2UgcGF0Y2ggMi8yIGFzIHdlbGw/IEknbGwKPiBzZW5kIGl0IGZv
ciB2Ny4yLXJjMi4KClllcCB0aGF0J3MgdGhlIGJlc3QsIEknbGwgYWRkIG15IHRhZy4KCllvdXJz
LApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
