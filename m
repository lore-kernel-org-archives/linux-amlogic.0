Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFB8CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Aug 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziYTcDnQ6flm3EzwjmC+/VHFO23h0P00huktXrbU/w8=; b=FCrRBjIuTxgfPm
	5J5IVf8YpKMyutsIo4ywX3dVV0EBWP2hI8DLJSRRYcx2YGVSEcizd3TVwH3pE2gfNPhUHt7RbjOH+
	IaYtUt9COeQxisM98JI9k2jYhmRI/x7b9sJGrGFqGH482W/59oEhUC2Ax5Gi+Qm24HzmKi6AjWgxY
	AY7UOBJEndc5mo9bSWrTeHqN+QZ79kMiMfKotn/qWA24S6hoD0BEN+hODQmmmSmMUSx0LkcAp1P0e
	9gF95ar50SK5B1fURmEhiL23733yBRZ7ItGhnfwY/KaOJfpzti/Yiwvmw/JJNki+d7pMfcSqUIMqE
	SCud73NAqOq4iEYqxNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1oG-0000000GTuG-1tcS;
	Thu, 21 Aug 2025 09:42:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0QV-0000000GCXj-0uZ1;
	Thu, 21 Aug 2025 08:13:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7aea37cso92671266b.3;
        Thu, 21 Aug 2025 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755764017; x=1756368817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YQOUvbEt34uyiKkVZzozlI3idOMYzV0MqYkXRUemhU=;
        b=PfOw7eNyS9uTPJeDYXAKfsz3Cl8fnCEDWl/ZPtWqNPWlEp6P3JrT1ZTwqnz4Ern5a9
         jPJ2meUAIcqYCOdDcZfkilqln/6UA3aaxLwWvuIBeHRTFfV2OglaiCFvqfZwIXMWAsFb
         UMUOgUXiHj0O08R0j12plbytmjjHYzc/HZGhkvI4RjOBtVmpVU11fFxSgX3I97lD++I4
         JdlMJd7EgpM49WAQd2jiTlGSMU2goHdgswa0Pm+vEq3gZ4u+V3/01pXTWgUDzhG/S5KM
         7L0bhFpacNOl1jhOCOh2jp3HA8PjgZyxyYv5ptc8ITdX4+ykPKkr2mrYwW8UNeg3lhZb
         ViCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764017; x=1756368817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YQOUvbEt34uyiKkVZzozlI3idOMYzV0MqYkXRUemhU=;
        b=W60Va3cbxfWV05z5itD9CGyZYeXMfzHloQJPRni3jgqxQszkqILyQT5QAfNX+CkOxn
         9y+BKn8DAPbZAiQULChM13ORJ8Sn6xFbYTkVUpkTeK5j0wHsP2sy3g5FoOerH6Kl9TKc
         ZM1Eyd5j7gS2iy6IHveI+fZLnp3LSPb0nqB8GYyDhC+tDB02R6K41xCTxusmtGp+kJ75
         D7lI5gJr9Oe+3Uhv8VZIaFw7kTvd+q0lO8fndKF15ezsy8eFdsFuUOL3G+FYYyS13SE+
         nZPUjzwzwsXtesYeT6/WupVT5HZiI1u26YeSiCHcpra9omEZVG5m1N2x2r0MTikzvobe
         HD/g==
X-Forwarded-Encrypted: i=1; AJvYcCUdO6w8fs/fwivAwcWQaoU2+WRbN/NBkkGX23dQ14gHouN2eg8t6I5vRke0UMP5fHyqPmhEv09xSsr43Gnja2z1Cw==@lists.infradead.org, AJvYcCVd5OEasQ+dCVcmecVLj4XVznfdRA4nWolgNsjYGIuPDV2V1faNpJcYO5RLiLm37ETj8eJ3dogmSZgLbEAWL3s=@lists.infradead.org, AJvYcCX5VdhiIoYBeLqFfIAE0wZK5N0a9D1O4FHVTMe/a8Zutpe69agd0GZzQR8su6WEB1+L/UUyU4lPpVJ2TJL/@lists.infradead.org
X-Gm-Message-State: AOJu0YzwRFa4UComSC35ii5dlH/qlXfeZp+LPHmYJkT8XhQ6mgyHq2rv
	0oeCazyc1uTL/84TK+UAJBJ3oVU45uRLiIQZxud9Q4dwzsrSbcn2ER5yhcHsjGIJPtYsqInXE8X
	F4rkM0rDABF4GeN1A89aUJ9tl9HtPONY=
X-Gm-Gg: ASbGnct4afOm/lYT0Ed1oFJObQeDlg7yRM3B9JllteMe9i8bimLh7KbBfx2SeYymTXF
	mYuh3QuyvOI7oGENUhgOYJe3KzS34l97Si30mTMQykHZR5A0OoUSIirGNsofIDUg5ERuJATM8Gu
	ry7uGDsXNJ84RaWmvGY+rszsYZJEbgD3yfeGT/59F0uAJXgdNUSa0FYTuGyATYrxFksrmPnE82Z
	6Vvow1aqA==
X-Google-Smtp-Source: AGHT+IFBkMJTJYVwPqZUeM9AOOBtno84DfZL+tzYeh7BxO7r/uMPS8lWfXyVKwlrLDHM43Lcm3OKmlg0we9DQAH7T1k=
X-Received: by 2002:a17:907:d09:b0:af9:6bfb:58b7 with SMTP id
 a640c23a62f3a-afe0799eae2mr151798166b.5.1755764017455; Thu, 21 Aug 2025
 01:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com>
In-Reply-To: <20250821080723.525379-1-zhao.xichao@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 11:13:00 +0300
X-Gm-Features: Ac12FXxWcK6_xcvA9PkQqtCffXDbzCkBD6UYFwXVnTmPqIsWYmsRzpdWdDZcCe4
Message-ID: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Crt Mori <cmo@melexis.com>, Per-Daniel Olsson <perdaniel.olsson@axis.com>, 
	Waqar Hameed <waqar.hameed@axis.com>, Yasin Lee <yasin.lee.x@gmail.com>, 
	Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_011339_253560_9028734F 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgMTE6MDfigK9BTSBYaWNoYW8gWmhhbyA8emhhby54aWNo
YW9Adml2by5jb20+IHdyb3RlOgo+Cj4gVGhlIGRldl9lcnJfcHJvYmUoKSBkb2Vzbid0IGRvIGFu
eXRoaW5nIHdoZW4gZXJyb3IgaXMgJy1FTk9NRU0nLgoKd2hlbiB0aGUgZXJyb3IKCj4gVGhlcmVm
b3JlLCByZW1vdmUgdGhlIHVzZWxlc3MgY2FsbCB0byBkZXZfZXJyX3Byb2JlKCksIGFuZCBqdXN0
Cj4gcmV0dXJuIHRoZSB2YWx1ZSBpbnN0ZWFkLgoKSW4gZmF2b3VyIG9mIHRoaXMgc2VyaWVzLApS
ZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+Cih5ZXMsIEkgaW5k
ZWVkIGxvb2tlZCBhdCBhbGwgcGF0Y2hlcyBpbiB0aGlzIG9uZSA6LSkKCi0tIApXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
