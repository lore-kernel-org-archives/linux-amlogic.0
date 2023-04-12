Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73CAC77B6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 20:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIJItsA+5+oUgqevG2r/art4Pt//V09y/QKczqFZ/E0=; b=UAk/sKsB5SJ3ym
	+WLcuPNSD3sg+7kJ7A91dm5m8qtIyuOj3nE3zeqTYnTB636bKuGLdh41T3stPgG+OqreNS/PDlUd6
	e4QTamZrli5wknNkGvpBmeNTmR26reKLFfZlNbrF2jeeJSvLaIp5ZAU9anVxxAwRxBnQ7HzSo4qG4
	kvs/+gUTu6tcGIj7GAkp33YNZ70a4AYZr6amrmbl3iTp63Q+nFUUjwosTPz8ht9LHszIAu3wpaIA9
	BWvGnd/YMvcl3mRE6KxAc0E6Q9CE8DbRzMyGayrGX0mhisYbf/bdElSm8mNhw38HjtuQzXCWqJZ51
	taY5zHpErS4TMxKXXfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhIi-004I0Q-16;
	Wed, 12 Apr 2023 20:42:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhIe-004HyO-10;
	Wed, 12 Apr 2023 20:42:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id jg21so31732495ejc.2;
        Wed, 12 Apr 2023 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681332153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1NzP44NJ7Zn3Q3csjGxZmv7aNxzXOUtIWmezQUNt6E=;
        b=nVpR91sBcS+KRq1o4GWnYRP56PPkTUMykZd7SYQKXAnRLpGCDIi9XrqOTT2uUFnDV5
         /LnSEl2PBVTcu9Ide2+m73pjDhP4LGoo3dnx7T7CbNohxN0Rh76DRka0cCSBTchrWbV8
         U8yvnzy/So7PLyNcOH2F/4fIsoRrSUIgfmy8zZebiFBhEcHZcMfGDnqdxGu+aFU84olk
         MTedAOn0MrUsxrCVvyyqfyHb1fBP4fWKAKqPz25UenxM8GjBrS9sTLehd/wFLJ7JoPCB
         HmlgoPOhqnMjqleD4WJi78wgxw4aKSrl2YPf6eNbjo8Gliexo7poGyJD/2kexrNszh0s
         LgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681332153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1NzP44NJ7Zn3Q3csjGxZmv7aNxzXOUtIWmezQUNt6E=;
        b=dttH+kVTB6ufrTq4OMH5AQcNqrvoNCahDWTNiPihhOycXHm4w175h+Gt3lsQRJk3gp
         H4Lgp/++jMrqRFWrU8cdg1MUjMI7pSrExgacBM4RS+A05Brjw2AkHMEh67A5i3Bm1mje
         XLDd+8lZNiER2891WHyJBQEBONv7Rbw1UMW61EovuvK838t+ZxCDMFQFVQ2n3w7UYzT9
         G64gQcgEXF1pfA5lMxWx/LjxPSt782W2849cH1gczhLm2MgqJWD0mZ0uJOt3jZMQ3EkH
         DYxhVEFQBGLxDxrK2VZk7vNFezliIstr/w4ncY2Brd8V+036HT70EcZGTBrwqxcoQhCD
         3giA==
X-Gm-Message-State: AAQBX9d1yAZx2+ZEvhIGinlJ9Z3bo8JDv/IhJ8BtAcrTbCEtlimqPui3
	kDvUCGH5h0GT5H6TcR01M4CK9mx1leqyXOIhhgA=
X-Google-Smtp-Source: AKy350aA3TVqCUEdmigMYtd8tjauavWkkGNE5hxWY9vTVePvJvvL8i1e/EM8+pVrx1lgnPq/1ySeGA5/op6xhuQtOaE=
X-Received: by 2002:a17:907:1c02:b0:932:4577:6705 with SMTP id
 nc2-20020a1709071c0200b0093245776705mr127456ejc.6.1681332153223; Wed, 12 Apr
 2023 13:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com> <8c6ac288-a59d-7c51-aced-3dbcfa828cdd@gmail.com>
In-Reply-To: <8c6ac288-a59d-7c51-aced-3dbcfa828cdd@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 12 Apr 2023 22:42:22 +0200
Message-ID: <CAFBinCCbQhj0X5mNHF77PQWTmdvHrd=s09N-a6OxyxQxwW7Gdw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pwm: meson: don't use hdmi/video clock as mux parent
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_134240_348382_043C937A 
X-CRM114-Status: GOOD (  12.73  )
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgOToyM+KAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gbWVzb25fdmNsayBtYXkgY2hhbmdlIHRoZSByYXRl
IG9mIHRoZSB2aWRlbyBjbG9jay4gVGhlcmVmb3JlIGJldHRlcgppZiB5b3UgaGF2ZSB0byByZS1z
ZW5kIGZvciBzb21lIHJlYXNvbiB0aGVuIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoaXMKZmlyc3Qg
c2VudGVuY2UgY291bGQgYmUgZXh0ZW5kZWQgYSBsaXR0bGUgbW9yZSwgZm9yIGV4YW1wbGUgd2l0
aDogInRoZQptZXNvbl92Y2xrIGNvZGUgZnJvbSB0aGUgZGlzcGxheSBkcml2ZXIgbWF5IGNoYW5n
ZSAuLi4iIHRvIG1ha2UgaXQKY2xlYXIgd2hhdCBtZXNvbl92Y2xrIGlzLgoKPiBkb24ndCB1c2Ug
aXQgYXMgcHdtIG11eCBwYXJlbnQuIEFmdGVyIHJlbW92aW5nIHRoaXMgY2xvY2sgZnJvbSB0aGUK
PiBwYXJlbnQgbGlzdCBwd21fZ3hiYl9kYXRhIGFuZCBwd21fZzEyYV9lZV9kYXRhIGFyZSB0aGUg
c2FtZSBhcwo+IHB3bV9tZXNvbjhiX2RhdGEuIFNvIHdlIGNhbiByZW1vdmUgdGhlbS4KPgo+IFJl
cG9ydGVkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBn
bWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
