Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA93D167EE
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeMOUx0godUAS+/ZIQpihnyCxcgayXfQ5xabjqFue+g=; b=N9BRdNn40YRWVd
	Ks3bBLWzU2jEe+/eXY1LbLlcag/ioQkvZ2Ou4PLet9TQPrbEXbRkkRP1G9CbpsCH/Y/HBcGybtS3P
	+KwNqVunyipk9aLIgwhRXj0nw2a9AfzwKQvWqmuNbN3URVeOE5v5ygEWtUKcrz6nw9WmNJRk2v0HP
	zxFh7RNxdNxsOBDyalMadVVFD48obUS5JDeyx2PtLTEr3NOWS7iGtoGG6RgvpqCSNmVd1i9bJFa40
	WZxnSNPhtvaW6NCDRdTPU/3Ta9DJV6E3UcS9gi4Ltngya9Vn8twRY6a4SGcjKQNP+HFVAiI08GNi9
	4qPQHefeNwRJIUbsxakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8vb-000000022Hq-1Fpq;
	Fri, 09 Jan 2026 09:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8va-000000022Gz-0ZVx
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 09:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FC3160166
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FABC16AAE
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951425;
	bh=lvCUtx5/2N6twY/MV8/RmcXhUWl3SJF3OjQzxVTOGEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k1S3mpbtE5aWq83pkglx9bxMuO9rIIJA40veSBfR3Ih4DhKbrF09vPpCntWkkcKqJ
	 c3tJglconk7xfWKzG78I3NbeoRpn8SoXCrd3WP8z79QqESQkt2dmu7RexgMir5cDYT
	 XhJW3TlcDFbbSZ4DEYm1d/f5uXevc5v2hez0epEcVrHtASveXcbQ3TaCqkcG32MpaY
	 dYpFd80GxfdygOSXiZBHEDD4JE7BFQvYhYNGIGDAAKt6nbgTs9t18fnmPocMbJxe0D
	 aW0PuvpwhqdCYlOm9XyhlcgkNuAds1V+1Wm4d2jidvbXgdzMA6ujScLHfERK1i4NTf
	 QHw9UmQJqOutQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-383251c34e6so1067941fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 01:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrCs56UtgssI+Hez5fcpBM2xxvX1vjWAzcpvkYNNjCua9UWfIBtPNXAoxCJVivUBl3Ivkgzc3zIUBSSsc7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1iL3zdvveJLUTBkgPgAmLL68awQdUWdRTyA0xVu9HDK4p7exY
	552bxf4Ga1vQ1Urb5uZWmf0Z0sohE7VM4m5fqJia5iGlGRl2v2F1duTN2Ja5zai7kNFftAwUGrz
	rGvqjQ6jXGBTuAmood5gh0PzxffsQpsMHsKfnhgRhNg==
X-Google-Smtp-Source: AGHT+IFl7lnr3xeQRc2OvTUUx0HFKlM0skfhqeLO8tp3RwjpL9OqVuzKeQVVVivvxwSKJCafm3YmaKxp+HBxFH5PPf4=
X-Received: by 2002:a05:651c:2113:b0:383:f43:ed30 with SMTP id
 38308e7fff4ca-3830f43f012mr13768501fa.12.1767951423985; Fri, 09 Jan 2026
 01:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
In-Reply-To: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 10:36:52 +0100
X-Gmail-Original-Message-ID: <CAMRc=McuAJLXdJq+=-bjCsjrSiWrrXr=A9NT+odX+E0P16VWjA@mail.gmail.com>
X-Gm-Features: AQt7F2qWdpw_3OR4mrvwg0EsRFwrEYR_jU3XFkmlc84d4RNtw-j5Dmht-iVh7Zg
Message-ID: <CAMRc=McuAJLXdJq+=-bjCsjrSiWrrXr=A9NT+odX+E0P16VWjA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAxMDozNeKAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzd0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDYsIDIwMjYgYXQgOTo1M+KAr0FNIEJh
cnRvc3ogR29sYXN6ZXdza2kKPiA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToKPgo+ID4gVGhlIEdQSU8gY29udHJvbGxlciBpcyBjb25maWd1cmVkIGFzIG5vbi1z
bGVlcGluZyBidXQgaXQgdXNlcyBnZW5lcmljCj4gPiBwaW5jdHJsIGhlbHBlcnMgd2hpY2ggdXNl
IGEgbXV0ZXggZm9yIHN5bmNocm9uaXphdGlvbi4gVGhpcyB3aWxsIGNhdXNlCj4gPiBsb2NrZGVw
IHNwbGF0cyB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0aCBzaGFyZWQgR1BJT3MgZ29pbmcgdGhyb3Vn
aCB0aGUKPiA+IEdQSU8gc2hhcmVkIHByb3h5IGRyaXZlci4KPgo+IEJUVyBpdCBpcyBhIHZlcnkg
KndlbGNvbWUqIHNpZGUtZWZmZWN0IG9mIHRoZSBuZXcgc2hhcmVkIEdQSU8gcmV3b3JrCj4gdGhh
dCBpdCBqdXN0IGhhcHBlbnMgdG8gZmluZCB0aGVzZSBvbGQgYnVncywgSSdtIHZlcnkgcGxlYXNl
ZCB3aXRoIHRoaXMgOikKPgoKQWN0dWFsbHksIEkgd2FzIHN1cnByaXNlZCBJIHdhcyBnZXR0aW5n
IHNvIG1hbnkgYnVnIHJlcG9ydHMgYW5kIHRoZW4KaXQgdHVybmVkIG91dCwgdGhlcmUgd2FzIGEg
YnVnIHRoYXQgY2F1c2VkIGEgbG90IG9mIGZhbHNlLXBvc2l0aXZlcyB0bwp0dXJuIHVwIHdoZW4g
c2Nhbm5pbmcgdGhlIGRldmljZXRyZWUgZm9yIHNoYXJlZCBwaW5zLiBJIGp1c3QgcXVldWVkIGEK
Zml4IGZvciB0aGF0IHNvIGl0IHNob3VsZCBzbG93IGRvd24gbm93LgoKQmFydAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
