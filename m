Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9877CC76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnVuy74vo4hXFAsyeYKkI20xUxiB5McJ8553/09O+s=; b=uBjdFzRslwIOqW
	twGS+IJj655cTh0k+Bx09GJ9KvmBLJQyvFgm2fW6apib3hMkl+ebhs6uMwMvU5prZvQl4qljfkyWv
	5cKo9+XagRWkB1NRG4nEm54v8kFla0KNljld3P/H5AvWgLXhfM5iCHUMhGJJsmjo3g4mPTQgzRbTk
	YF8T+WNZHztS010h8AFwio1Xe/3Cb0Ae0/FsbLO3GwafP3UEbszf/wvpUxu2OoxIWLjC5E6uke8NQ
	DokUQfcl2EnQQkRsQEHU3mh7o7utvnU/RjIrleI597FNlrBO41p7lnMwOBHwzaQD9PLxAdddc8ayS
	vR2ib8ZMR/J/bvkRHAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyH-00Gggj-1s;
	Mon, 03 Apr 2023 20:40:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyF-00Ggc5-0w;
	Mon, 03 Apr 2023 20:40:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w9so122355705edc.3;
        Mon, 03 Apr 2023 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=KNd/boOKN6y2/PjCeVSU+vPcnQDoudhrGK0UpOmstKZonIbjoJzZS04aRj0j+mOZvK
         qgAyo97MIqwMwrM8H/UbXggTC2XfwOQZMVPsoNvnyIdTQiGHCUkF/20T+wZJ5rc+Ybuz
         2tui8GG9it6Qj5JxWUxzmAhPLlJgmxez7I05/TBVd3Y/KNcHdvmUk+jCfGGMcrLDvQEs
         HehtOTvpmtXFkgyq1ZxUuo3Rv32Z5AfdBR2WKja9oU5HJdQk+3dp7A0JbboHMqEBdXBF
         PLDxGF6TvSJLzi04fxak3Pfyqo2rObKBCbjqkvWsmVOlAX/z6vIQEtcYvTaxUsavxKfi
         seWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=4Bk3mm6ovV5N7PJ6ZZ+vA5T7JWvQYSZjo9JvvKTtA5JJWwWOmh1CSb6vGYLhzbCusY
         Ba52yEVLEXqL6uDZogyPM5Uxy3+340zB1NV9bZOApnXRaZ8umb1IqL+2ZjOMr5RcSq4b
         DdDUogYoPJCcQLlKgUat/ln3gJbpWUal6lRvTXBcrTpytdpfIay2Ddcg9kJKdErZHBsV
         +fNiYb7FUIbTmQmG0BomMt2CLJxB+oV2EJ71oKl4hb041JDyg1ZaQMnfMkdEXwLz08oi
         wADKtZApFPlCHSyWhPAN0fW4YGQurUjmL3m4hcgvP3bfnbfJBFhitw4GOuRuPncUIDrI
         HmVg==
X-Gm-Message-State: AAQBX9fVYCTIaNtKz2RKJfKFvLpUATLqPMFuAD7LBMLINBo7RKlUr93C
	svzE53m1zZ4k3mENaGV4bygRpv4AJfr0+eanX4Q=
X-Google-Smtp-Source: AKy350aH9R6cBFgVsiy0JqLI7fVfIZFzryyfFLxVuvDgg1GsqbpxdaHQ2NTwI3X5cLKiWPBFLPLXff/v+f2giwpeCRw=
X-Received: by 2002:a17:907:6b8f:b0:932:4577:6705 with SMTP id
 rg15-20020a1709076b8f00b0093245776705mr599ejc.6.1680554401878; Mon, 03 Apr
 2023 13:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-7-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:39:51 +0200
Message-ID: <CAFBinCC1div=aEyEt6BBO_kQvf-R2hqpP8t6KTGtjyxOy2RVrQ@mail.gmail.com>
Subject: Re: [PATCH 004/117] media: ao-cec-g12a: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_134007_341484_37AE75AA 
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
