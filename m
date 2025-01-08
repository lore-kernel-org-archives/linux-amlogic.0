Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A272E77199
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXE90cWNb1xNL2IPoaon9JPt99Hmo7boQfMfB+41f3g=; b=MOqRqr+JIBsnPg
	DLF1mbQiOw74beG/+huAfKfCRLiFijBRAhWPfHpEYv+3Jys6VpV7dbuGmA06C8Iz+j4+Dh+JwQHtl
	tmm0PNQnykexFBUe0N8Og+ACtgOmFYiNhPbhUPj/9/HV6L9rMhIfSPsBt2D7knaCqEOnfplh7iLK6
	uZqugXSmgpTTThdUIV4euDlc5MegYQQxPp3YUmhFzzmLUUmgJFqSsLvlbXt5oBg8N+kdSfpHKPUTe
	xPkqhCh1NPAuDQ57SENekVekXmGdN2iMemFBGJOH4VT5maus+8XYjwWVp4EsTOn7tmvIoLxi5WZb7
	as40GUhDKlCBIto9oZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVvY-00000008ZdG-1Z2W;
	Wed, 08 Jan 2025 13:16:52 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVZ5-00000008VdE-3k0v;
	Wed, 08 Jan 2025 12:53:41 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c559ed230so3043064241.0;
        Wed, 08 Jan 2025 04:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340815; x=1736945615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DPVgWRoBgp5UUwkNErzWNpDubic5Irpv9/KSUHnOLo=;
        b=kS+s8nPSMJWkL+4P33fuVZGWS1NIg7fGYd7YHxS0lKjNmhsupXd4xkaX0NJYppWFKj
         r9fpaPciGUiC8J5M7zS1O0letGRid6OwNBr3AEodf30U9GavVaPcjDfE/om2bBQzX+ZW
         haWYhogE0S/bfcW5t9IjE+SlSu6NrLW9W7+cWhGHG2FPg0LBxCFpIGBaszYAMaghVn/H
         IPyQi5l8tnO8vYVuy7mQPX1FHhPVzjSXLOcF/XE1DUX595VHnQLyqVKSE4fX5SO9z2s/
         /OZ8izJlxZrnD1D9+Joj5Qj7+fA3NyZKZ4jsT9gT22maw6JklMHapK9jRlnzLZARuCu+
         i2ag==
X-Forwarded-Encrypted: i=1; AJvYcCUakdb9GuwDOtpHJTlTFVlrrJAQKNoiXwo3HrwfzcS9FSOV3S90h3vvmIA8cG1+7zqofrHktMYiLpzkmRsA3DI=@lists.infradead.org, AJvYcCWmNmu5HZN+y8Vjo1LGEvZyD/u1l6oipcdTJuL9+6oAt4fCVhOn4k4ChJMxSWgXhaw/TUruSR2j1R6P81cJVQID9w==@lists.infradead.org, AJvYcCXTUQ7rwRMBQllWlpHM42b1Xoj2JQouNn3zfLJ2eyPzECaQL4wrtce4nVhVNA2U2xuGTDNgibvM/0G04ddd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4LSw1jU4kBRAweyiHTLJo2guKiR872KjhCtDGpLhBvjaN3TIl
	C8Ab6eCCYPkDohgUQzQ7nGYqH+UVGbAI+SRUId1NHoAlSoC7APnvRVYDD7yN
X-Gm-Gg: ASbGncun7UIpdPlLAkQsXEe2ft1eBFmnT6Ylf4CMtI6GwXQ92peC6CPfluLNlMs8C0l
	dPglA924L3gr/MwzDKXb+C4PVQn/pJukJB3zU1/7CFprV7nftyaCIX25UuELEshSTO/hpg1fa5b
	uwJmoAD1T82YKyKe1uvYFsGUgXLv7nrtf/qmvUswtvNw17akLZ1AKW6PeFGHpe3xhN7cbH6LLHc
	a94wuN4k16BbBq4NH0zrb+JkOZtzMwKZJUQ4TQJpP35jf2lq6joM9+Xj5OKzFgwtIFlhhAAYUuG
	SUfuqnda9D1Dc8V9nto=
X-Google-Smtp-Source: AGHT+IE60Yma4sEnQucl4/yFdQxY4wyrudpefje7AyRSZ3QM/5zg3FVTGb81O9X/F7aUWfcENEi43Q==
X-Received: by 2002:a05:6102:50a3:b0:4b2:9e8b:54c with SMTP id ada2fe7eead31-4b3d106e36emr1672703137.24.1736340814997;
        Wed, 08 Jan 2025 04:53:34 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6dd23sm8361204241.19.2025.01.08.04.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:53:33 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afdd15db60so4601812137.1;
        Wed, 08 Jan 2025 04:53:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVf5ztbaf+aIdqSpuaIfSldn/IazuRvfEjgb4gtCw1jcakrwJ9kjn1dY5D1IYZqkm7zD6P9VCRa2tXUsGXm4zs=@lists.infradead.org, AJvYcCVfLUFR28poPTotII83Ovsp+P4M36jbgVDeThybflOZDB8wLTTIzAT0ikHD8mLy1gJkyLYLE3FwWaxpWZFFWpEI6A==@lists.infradead.org, AJvYcCWdEPdInmj6dFbbbsGBvWPNFIKoVolo0FxcZnZkU1CiSP1x5bM/JSV51Z5yYRbwCQxUtDowgnAHiyUaNyPZ@lists.infradead.org
X-Received: by 2002:a05:6102:f11:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b3d0f94834mr1605383137.7.1736340813382; Wed, 08 Jan 2025
 04:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
X-Gm-Features: AbW1kvb03s6-ioyEsxQhihv8HJWEPeM4AbdJ5u2RlFP_T025eauQBHNT5poBSNc
Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045339_944287_566E4270 
X-CRM114-Status: GOOD (  19.78  )
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

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjU44oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraQo8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiBEVFMg
ZXhhbXBsZSBpbiB0aGUgYmluZGluZ3Mgc2hvdWxkIGJlIGluZGVudGVkIHdpdGggMi0gb3IgNC1z
cGFjZXMgYW5kCj4gYWxpZ25lZCB3aXRoIG9wZW5pbmcgJy0gfCcsIHNvIGNvcnJlY3QgYW55IGRp
ZmZlcmVuY2VzIGxpa2UgMy1zcGFjZXMgb3IKPiBtaXh0dXJlcyAyLSBhbmQgNC1zcGFjZXMgaW4g
b25lIGJpbmRpbmcuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaGVyZSwgYnV0IHNhdmVzIHNv
bWUgY29tbWVudHMgZHVyaW5nIHJldmlld3Mgb2YKPiBuZXcgcGF0Y2hlcyBidWlsdCBvbiBleGlz
dGluZyBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55
YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVu
ZXNhcyxjbW0ueWFtbAo+IEBAIC01OCwxMCArNTgsMTAgQEAgZXhhbXBsZXM6Cj4gICAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvcjhhNzc5Ni1zeXNjLmg+Cj4KPiAgICAgIGNtbTA6IGNt
bUBmZWE0MDAwMCB7Cj4gLSAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNt
bSIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtY21tIjsKPiAt
ICAgICAgICAgcmVnID0gPDB4ZmVhNDAwMDAgMHgxMDAwPjsKPiAtICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47Cj4gLSAgICAgICAgIGNsb2NrcyA9
IDwmY3BnIENQR19NT0QgNzExPjsKPiAtICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzExPjsKPiAr
ICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1jbW0iLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtY21tIjsKCk5pdDogdGhlIGNvbXBhdGlibGUg
dmFsdWVzIGZpdCBvbiBhIHNpbmdsZSBsaW5lLgoKPiArICAgICAgICByZWcgPSA8MHhmZWE0MDAw
MCAweDEwMDA+Owo+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9B
TFdBWVNfT04+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzExPjsKPiArICAg
ICAgICByZXNldHMgPSA8JmNwZyA3MTE+Owo+ICAgICAgfTsKClJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiAjIHJlbmVzYXMKCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
