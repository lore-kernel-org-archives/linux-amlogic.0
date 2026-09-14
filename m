Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB54C88E50
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sDbTCN/z4ZAMnJbeP9hVLMAIamzmv239JjHRQ3U5fk=; b=LWziERtWLbs0Vw
	klTJs5GS3yvCnSzH/M0fUehf7jkn1ut6uVupm+EeAevw1ff6XZg7ubIThKoqwKmYtxrJ+WI+hhNgD
	WJSRrwraJ9QNrU6BnTzCj7p8qaLcmq/Vlc6ukt4eGlVz6Tg6/aCa18k68BbwkyJYLyr6kpKBPtj7p
	gaRCwrXmKOsDgOG+gz2fF4wlHxJwr4oToi5tbOluLjrJFf0L/PGlO1jXLkYOEqZQTW0QchtL9Yt3T
	oa3u+Y4VZqDiuMjhp1BF03kaWST0oudPYYfpGDY9pQSzuVfpFRmf63B7Ps0i7bBXkO0E9IltDS0bK
	4n3wJoIFQ6JiBYB90wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62EB-00000002mFA-0dyO;
	Mon, 14 Sep 2026 08:39:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62E6-00000002mCy-37VO
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 08:39:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 531F14175C
	for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 08:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BD61F00899
	for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375186;
	bh=BUCr1hCoUskeeRd1t0HVarnyydWOErIB1Udlw4P/HQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JbTP3wcYks75Mjgv5GfkFxY4k1AJjcMpSMFg3kCfhpyE4EzTcZO0ftMWrxxbbuu2m
	 u1r+DcPPXzlBvpiUg+eLw0fy+Rf7votcjMMjziDvtnF69VUC/6RysdYev0VC1luuFZ
	 GtUL3kVNRee8rwX11kVCcZjL9qh9pajKXwBhJ1JVPbjVJ1snNSzoAinZ8fiNgGeLtk
	 LOOhmVztA1B2bs1pwxysJXWFxiZHiqlhugWARM/qcw8DF8aERknttF5BNE3tW/1i0f
	 RT1RnJaR3Ww83frfhNV6V/iT9TO357gEWMfpvXDUClFilxgTadKdAG829A5nvwOE6t
	 kIiERIlbTSebw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5e907853eso3104411e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 01:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvCsCTmCCmhUvYqOdxHwNg6q5qeRzK1wDupS9LtMRM3EtGZABpM87xbpKtdZ5Ktx7lChhZuzgwDRFOmrkn@lists.infradead.org
X-Gm-Message-State: AFuF++kuEgGmjV6jJ+MApeRspCGAd/WoUquh5Evse/DZzKLp3ACGKACh
	SFP/QDko0G6k9aNZkoNnK1wh1BpGiO1rOeZ0zN5LS/z2cGWu12Ck/mN8EB1Qf9zZjxkQy8omthC
	LqOmZmxHHb+8Blv65aCaAI2qqOtIxiG8=
X-Received: by 2002:a05:6512:128b:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5b8ae66d39cmr415473e87.27.1789375184969; Mon, 14 Sep 2026
 01:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817162212.1890616-1-sanderson@brivo.com>
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:39:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
X-Gm-Features: AcwNN1UCot4Htkr3dgs4fFXOL_85ODTx5oGWTY6F54hzJDKQ7exHT5L-odqwr7M
Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
	Qianggui Song <qianggui.song@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgNjoyMuKAr1BNIFNlYW4gQW5kZXJzb24gPHNhbmRlcnNv
bkBicml2by5jb20+IHdyb3RlOgoKPiBPbmUgb2YgdGhlIGkyYyBwaW4gZ3JvdXBzIGhhcyBzb21l
IGp1bmsgYXQgdGhlIGVuZC4gVGhlIG5hbWUgc2hvdWxkIGJlCj4gaTJjMl9zY2xfaDEsIGFuZCBp
bmRlZWQgdGhhdCdzIHRoZSBuYW1lIHVzZWQgYnkgaTJjMl9waW5zMyBpbgo+IG1lc29uLXM0LmR0
c2kuCj4KPiBGaXhlczogNzc1MjE0ZDM4OWMyNSAoInBpbmN0cmw6IG1lc29uOiBhZGQgcGluY3Ry
bCBkcml2ZXIgc3VwcG9ydCBmb3IgTWVzb24tUzQgU29jIikKPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IEFuZGVyc29uIDxzYW5kZXJzb25AYnJpdm8uY29tPgoKUGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMs
IHNvcnJ5IGZvciBzbG93IG1haWwgcmVhZGluZyA6LwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
