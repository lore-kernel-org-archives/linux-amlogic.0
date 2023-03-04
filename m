Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C963EC678D5
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9rNGH4Lhio+FC18uI2+GaH/P02+UOs4ofBf5Q20Ank=; b=ymyA4/2v+yoPty
	xMUiv8I8gyqQQqxRtDzGFFCSLEDwjlvy7IYbDOGbP/UJJALLdliJKg5r2nPFp6Do8Avt0ELycBwuV
	v3AZZx0bVdc0mmx1RSPmXLOle/LhH7Vrdkap5gH0FhL2h0xgTZAJnKKMRS8pJAq4DdvvBH9G8U8Sp
	dHvnxVVkhoKZ9cufTezRkM4EfCGgBFK0055KzqYOFfdQ0dyrfhlbnaA2Qv9b3W1DqOOiejs/zIa0A
	6cOyA4q65xab8Cye1MU/tOCZbgj04CVMawtubxiJnlp3WemlNvaF9Fe3KZ2DBs6qn8Z1YRBUuM7zE
	JCDrw28LjiGAchybPtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZfL-009ZLw-GZ; Sat, 04 Mar 2023 21:43:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYZfB-009ZKz-7m; Sat, 04 Mar 2023 21:43:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id x3so23758318edb.10;
        Sat, 04 Mar 2023 13:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVdfTRzagZpxrbPS5j0VXfk6cXHcDvqw5oLXINe0eUM=;
        b=AdsIcWEfClxOK/eImiVP68J7ArzbxApR51jRAXUa6RPrDaVOdaaF+LcQ+Tbd+uni0J
         yws+bPF4VjlMvCpsH8q9ZoXr20HgrWwLuIZu6Id5DefOChd+L2d3pEDCss+GHTy/u1vy
         fcyfFbGcHWjvbhXXEWDt3JQiO84QavCMk4iLr0Y4f7oj01vNspYOlYtmjP+Xj70o9vYS
         CmpHo9sBnym6OKL2uqcG/gngSSjnMO8PhC/fMg0ow0GH4/HbEFwN4Oub4E1kx+/q4LoJ
         27fp2UcxizZOuWC/scsKiRMyCTwDCT/x7rhhUXb3oY0YvVlPvQRFhlAojL8WkixcTBdT
         DGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVdfTRzagZpxrbPS5j0VXfk6cXHcDvqw5oLXINe0eUM=;
        b=0I3HXjQuaHzQr9DrbEKt8s0RUNUEzqWmcBKkw/wX9cLN7aAXSlcpA2nbaI26Ds1pHH
         mk20h/EN38wdzBlVWzop0Da26FJr7iFjAXrpjzZUz/CJ95sgB5ox1dQMp2imRuwSf7cK
         lER5ot4rv3r3R3kGAtxHCfmobm0YTTLyDyf3cMIxLydQIBwsRjvfkaHsyC6LG4OoF6mV
         yTgkoRYolMN5f3uuLXfLY5OzSrMbNYEsP/FaqLBr6YMCOW623maHYjhmbnxT4IURzSA5
         f02t/zRrAy8JKJshsJjLBbZuFo+o8q9NB8QHRdDKKg6iHZdF6HiqclVukfJnqdNU01gQ
         1OwQ==
X-Gm-Message-State: AO0yUKUtOC/kpx0DJtXTkuN4SV/fAADNVz2VfDFJe8x7IhnTQGhslBjO
	LAttx9knanYP3nGZqsZZ1vNU73IGsdVDKGY3+9s=
X-Google-Smtp-Source: AK7set/Q/N204TLUp9rYTAplOSGGKTHM46UUEpnPCOuXBduR9v7W3yM5Y8gVcuFhnO9M0+konGtN0Icw095lXkYFuio=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3349823edi.6.1677966209891; Sat, 04 Mar
 2023 13:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de> <20230303172041.2103336-35-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303172041.2103336-35-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:43:18 +0100
Message-ID: <CAFBinCA0OQc2n6A18-ey0E11PArDQNX5eWTCSwWgVnZJa_EbPQ@mail.gmail.com>
Subject: Re: [PATCH 34/87] spi: meson-spicc: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_134333_341051_DF58BFA5 
X-CRM114-Status: GOOD (  11.48  )
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

T24gRnJpLCBNYXIgMywgMjAyMyBhdCA2OjIx4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCB0
aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2Fs
bGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpBY2tlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
