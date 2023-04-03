Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198CFC76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnVuy74vo4hXFAsyeYKkI20xUxiB5McJ8553/09O+s=; b=vuUU9LoaerkCqt
	TG5knJN+xw5hbsbb8zMAjZb1kBSX7ZUSsXDRz7w91B7zm3jiXsUrYjuY7MaJ0x+0Hi2KD5hPkvUpt
	0Z0Whu8jhpU+gukmvZv/iUQrvEx41NzLiJhXd3zF8Fg8j0U0zHHox22zN94RuPybHB9ONzHw2axRG
	/Rs5sUJtC5amrzlxz83/IJhSC9Uyz4snOewVfHPUqYtCTddiaVJ8ynpklDeUtkc5exspldnTqgMz/
	T1mA0hAfVS2zemcua5FahzeilSTjAyPWEd0G9wOpmhFcsVhoP8hTeXFRQzYWdQUdrZm9HoOPRxQgE
	0tRVdk1HCMD5ypFIA4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQy3-00GgXT-0Z;
	Mon, 03 Apr 2023 20:39:55 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQy0-00GgUf-3D;
	Mon, 03 Apr 2023 20:39:54 +0000
Received: by mail-ed1-f44.google.com with SMTP id x3so122252806edb.10;
        Mon, 03 Apr 2023 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=APtFxy4GTyHDQSIKi5euiBvb5x0VfNGvdHHhUdMx+apyPDeZdKal7pBTKib+2K2Tbm
         QOfG1Rfb8q6T++lm3k+Fark9O3KIsnwlY2wO83HH46yKQdqYx3Y8sYMMWK93RyNmiK9Q
         wHNXbR+HE+Gg5fwdaFLxYmF656lf9RSauJLtvDQD33i2shInpTijiSiQMWydvGRRjI5L
         KfjNcAzbX5KuuHhyDDciRSP2jEHe/T066DQ5d+h+7cm2wZhhVNEknTeIbgh6v6E53XaU
         ViEg/hlzvSQpP2AYKzl5i5+YZrK6dWgGl4Z2VdPPqoGmPFLc5j3y6iYPnIGxlyptjRI5
         gPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=ZuYLknr9fu4nnQihfmrEKq6txOaK/vS8jYKl71N8+Y0vPREqVDeMQf6A8iMY+p9Io1
         i0qJ4OfRZrkCFqXI5hNXyOsQYwEr/WGk/UBwcGb3zb29vkehUYd3YLJ6+bl/DTeyy+9z
         uUkQzeiTvfNgdZeQISPM5CmIE7W14XPpIVW0R4D9SGxY1+yO5rZ5yCEf1UimUFPzGgIt
         FoJr9KrHheWb6yEChEtbGW/gPZN55+WhMzoxKP+I1B9OVIHTUG3+FXB1D9vhe2xYlPua
         7VqLiHTg9alhUHLkmiiJcrT5KDp5NIwUMEnP3PC8c+zWHtpZwoEUZrpe3KL0pKoA+Xoo
         7Cbw==
X-Gm-Message-State: AAQBX9ehDnu7KE+NK7mdDD3oXvMfKVwQsnG9rV66vPAL1kVD1WK+sYQP
	0cZ6RXDjcMZq1vNpdNsFza9Qw5diEyVc21fSoFk=
X-Google-Smtp-Source: AKy350arklalHmhLPunHYsPFrEV9ZdjEA+cbNyUT6obGNnZ+tQa5Mc/stomB2qevvziuiR6999336ZdBgJ2Y3SwVjyQ=
X-Received: by 2002:a17:906:948:b0:878:4a24:1a5c with SMTP id
 j8-20020a170906094800b008784a241a5cmr207ejd.6.1680554389226; Mon, 03 Apr 2023
 13:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:39:38 +0200
Message-ID: <CAFBinCBNtkvd6xv0uU=Wy_OXVkyHd5XEwnbJwFf0N+RneuKBJw@mail.gmail.com>
Subject: Re: [PATCH 005/117] media: ao-cec: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_133953_034072_3D18ED8F 
X-CRM114-Status: GOOD (  12.05  )
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
