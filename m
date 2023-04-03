Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D9C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnVuy74vo4hXFAsyeYKkI20xUxiB5McJ8553/09O+s=; b=yf7KhsOn2gd28m
	GFao9wOaSy4UlwjKbY4kY24VNHoeQWMvSwZboXunSIb8d25WeT0FAIH4pkDX0Zfeb4CM2561ekZN3
	itCA0zD/v3ACi5bMS7wXFld4xzhCzrz2TGI98SB2uyYmrKh3DODZyxlVLe0feOyneuJlnZ2CnEZgk
	In1HJ+MdkD5plJB9tfOheq/pMTdjap+zlNWfNh9Ry1rRybpXxS+bBmYWuueATw6MCbqa4llLsn059
	6Aa6IKq55FqU3lkweVHa2+OFoVeFjBwkKxbnPwwVWeF3NSlvvYB70aZ/cbLL3gotQICue5swZVoWw
	HgA6/I4T00bXf3vfxdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyW-00Ggq4-1f;
	Mon, 03 Apr 2023 20:40:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyT-00GgmV-1l;
	Mon, 03 Apr 2023 20:40:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id y4so122401006edo.2;
        Mon, 03 Apr 2023 13:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=BMZvPQArT6h6XAkPe0OPKQrQ55fdDpO/cH35li3iHsHBaTSnwYmx1aFRxaHK3KDHUL
         o7yD07+StCRHQn0A0Cww0DhLYho5DhzMB4kSkCE9qjS1ODIQsGB5t/AA8GEs6Qw/QqRk
         ZOulcEdAtTTB2qoZFw9PoJOviXQJ9f+5V7k5DoHoPXyS5rux2EAHa+Zng7t3NTWPqSDX
         Z3euIwde/GKvVd4HnCnmF8z99zQA3s7ZIxKdM7C3bNAohCh3G7SeNCS+HWkkKOICClgs
         02jvCKhaFLXIwWDzhoRKn/+FFYmZ1GEz2YOAa+d9U9Xxh7r2Yji2n2VeWi8GKUxUcd45
         w60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=PxUF0oCzntEyJ/wAFP2BLnrbQG/PAplNBj5vp0FK0ubQPJr3C9UPPKGB6zM8Ajr+D1
         6QmQokaMbakOH6PcpS6YhtSQOdJPr1iX+suZfXwmz/kuLpWuNORudlyU9UlRQvREk2Bb
         /J3bH0dC1L41n5xu9Byv+p89wbvucQDw0MVgMBMEd/NiH0s3MCjNY2VIG7ir050/9D7S
         pquZRg8VeMyUlKqYVz70gtYhT/N9tjWEW7D7Oc7py9OvR4PGLGvrjvk61J59JJBukpGC
         uNSay+mbEh0VSzwCWRt5w1nyFhP6BFFcD+UcyQvBVoYKDz+qavb4bZXZBEDpPFTGagqx
         zSCg==
X-Gm-Message-State: AAQBX9dzBKl0WC9UyY6uf1/e+SCJU5VAyf94QLx5B6N4AVyIxLTuNVZJ
	faSfhofy5dSbDyMxjI8OFQrR/154Aas7yBUZ8yU=
X-Google-Smtp-Source: AKy350byv7mgJhm8ZtaUlXtjWxuFXmilHBYn3b+1HsF9CF5BT0PhB4h6mOSxbN3cLf7k3KyBR1bX2lw22Yrpb/PcA+s=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr19738927ejt.6.1680554417483; Mon, 03 Apr
 2023 13:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:40:06 +0200
Message-ID: <CAFBinCDwrqd5zGWZVfrn3bebpMSrDwaY7dpR_Y+i-oEXiv088A@mail.gmail.com>
Subject: Re: [PATCH 014/117] media: ge2d: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_134021_596423_6F757235 
X-CRM114-Status: GOOD (  11.94  )
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

T24gU3VuLCBNYXIgMjYsIDIwMjMgYXQgNDozMuKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
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
