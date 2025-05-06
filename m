Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AEFC3ABBC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 May 2025 06:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaOHC1s220MZkxQOQRM79LHyPm/UkwlRUUSrt9G/XeQ=; b=a9sc7VgL5Vyx+A
	t6voy61THL3YccVRsh/uiYpHpPIlgbznS6kiqtjOYkXSrvi1qzSwj69hMTnjK7p9aSeSt786m+nJR
	OO9pbDlRvf2Pa26q/JmRmK2EWODO583AZ6NrByE2QlOptX27t2dFQMG4gL9KRfiIuSSYR2aXyHBkq
	k3PuUFB6hF9SSp+vFZt5dNL6Dm7CJSxKTvDA9bFqTVifiL6ovzuU2uoVXJyC5jJN1lEItuDz3hQjx
	QMEqqsxPYarskOuX5/toPPazw1FAUIH2vNUifccVWtp4aP4tub7ZCuVzA6f0WKWgKmNkeSbEXKjAb
	TJQ7mL2tStPHJqqQsFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBoN-0000000Agcx-2bbI;
	Tue, 06 May 2025 06:29:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB71-0000000AVmr-2lop;
	Tue, 06 May 2025 05:45:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22438c356c8so50925255ad.1;
        Mon, 05 May 2025 22:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510303; x=1747115103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=Ma/PMjLEAdIW571z2iDqemdeWJEJEtJEqf/lO03eIXuTcJJxGg78nmv8KScexBYwIX
         UzN782RUukSGI6bwyKKeSVtdnGW9ugZZszQujHbqPYi1EjmcXeTq2yazHTeWHQH4BU7/
         XG40Hda8Sy0NJWDuWDT4teDNSsRnF+YVHAW2e+8o7xS3HZQSP+z54l7eRzkiEejun4i8
         dBQj1xdUWZwSNP/58Y951YE5N98eIRzQOj8DrwAZR/CUTXv5IpMptNUCdQOTFh64+kUN
         IxzcYNou99FScYAypi+1hZQymbgcPh3SVnia091pnOhtrvSvyOA1PlEwYxBQRcQ5BltD
         NUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510303; x=1747115103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=pLO/lu6Zl6hNG25tcunKl5M7u5GHwHWgs/L9oQlWmA//BjeOJ3NO2tBKcMtdUre4dP
         B+/RB3+EWCQM7zsuaefn8gf66b+yN5JEShokhcZ2NLtpNSbfEMy0BHrEl9vpdel3hpwP
         Uc6EbaTXPDY8FJlcNzPIDy37nXOfclIdddUwgI4oBE07MtF//4OZZAvwP/2+KRunDhyo
         lJGg5eT/EGvszUMALlXxSloz4KDJbOQ8a61PerxLVC4IJuRzJgLw6Kx4mClwfAaMmTdC
         eMgPC6F2NXFI8NEzOQINr4196th+A/OtAQ0NVPyVnNf+KzWge+TqZRdNaocjLdjzWaC7
         ge9A==
X-Forwarded-Encrypted: i=1; AJvYcCUbAiDEaLnDztWjR86eWOUdEFVNEztZLMlYwX394JwtGF93oomySlzKH1i0REnUVG+EAD/ol6Z1EO0KsBFunpy8rg==@lists.infradead.org, AJvYcCXcLbdIb4dNM0UFdeR2QLcRk0XQig+lyjPn2fDgjFbT4RBjaOD730ZgaBWOe6oFPpNC9FZ4F0DJdjo9Bux5@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIcOtdaBk8KWu/mJhps0aN9nxZPBd7mQZ9aByqfQB8gwul7f0
	qQEgz24jY16Xy1rSgLz9elFXr2wYn0QjykvaB4aHaSQfkuGOwz2t/PZ83TgIXz8azKkLm5Frk+2
	HAZURIR43GXWusuRoaVZPYdzPfiQ=
X-Gm-Gg: ASbGnctt7DsC/uhz1mZNJxfBIdN5/AVfAPbP10V8RO1Q73VYwhhlRrHMw2+bVDmExXb
	Awh+L2pmkkagg3X8p2kjKke/nVIsTZ+Fh5g0LybYgdxciLkHAQvqAiuktxJzqhniOv/zaT1imDK
	Gp/HAX6HJg/kVN4lC6VVlFc4ZBTiyuHAgTXyMlf78kIVBC4+Q=
X-Google-Smtp-Source: AGHT+IEAtjZAiVW9FmeIPs+b2L0Cy/C7fmszykHtPtzqcf1LWGqQ9MrO3WWZWQisFX6hdN6dX2Pwfb6vvI+jq0mf724=
X-Received: by 2002:a17:903:1ac3:b0:216:7926:8d69 with SMTP id
 d9443c01a7336-22e1ea95042mr127743175ad.47.1746510302790; Mon, 05 May 2025
 22:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:44:51 +0200
X-Gm-Features: ATxdqUE0-lwrubrO18uAn6fPR3DZquMt1RXTKqplWpMfrQ3jLYv5ONhvDdTbeEQ
Message-ID: <CAFBinCBVZeGk1QXMhwqQR9k9vJqDR3Hew2gxMxGZh4+SdbARFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224503_699375_8E3D38CE 
X-CRM114-Status: GOOD (  10.33  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTI6NDTigK9QTSBKLiBOZXVzY2jDpGZlciB2aWEgQjQg
UmVsYXkKPGRldm51bGwrai5uZS5wb3N0ZW8ubmV0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJv
bTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0Pgo+Cj4gRmVybnNlaGZlZVsxXSAo
IlRWIGZhaXJ5IikgMy4wIGlzIGEgc2V0LXRvcCBib3ggd2l0aCBIRE1JIGlucHV0IGFuZAo+IG91
dHB1dCBwb3J0cy4gSXQgb3JpZ2luYWxseSByYW4gQW5kcm9pZCA0LjQgYW5kIGEgTGludXggMy4x
MCBrZXJuZWwuCj4KPiBUaGUgZm9sbG93aW5nIGZlYXR1cmVzIGFyZSB0ZXN0ZWQgYW5kIGtub3du
IHRvIHdvcms6Cj4KPiAtIEV0aGVybmV0Cj4gLSBQb3dlciBMRUQgKHN3aXRjaGluZyBiZXR3ZWVu
IGdyZWVuIGFuZCByZWQpCj4gLSBQb3dlciBidXR0b24KPiAtIGVNTUMKPiAtIFNEIENhcmQKPiAt
IFVTQgo+IC0gV2lmaQo+Cj4gVGhlIGZvbGxvd2luZyBmZWF0dXJlcyBhcmUgdW50ZXN0ZWQgb3Ig
bm90IHdvcmtpbmc6Cj4KPiAtIEhETUkgaW5wdXQgYW5kIG91dHB1dAo+IC0gSW5mcmFyZWQgcmVt
b3RlIGNvbnRyb2wgaW5wdXQgYW5kIG91dHB1dAo+Cj4gWzFdOiBodHRwczovL2Zlcm5zZWhmZWUu
ZGUvIChHZXJtYW4pLCBodHRwczovL3RlbGVmYWlyeS5jb20vIChFbmdsaXNoKQo+Cj4gUmV2aWV3
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+ClJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
