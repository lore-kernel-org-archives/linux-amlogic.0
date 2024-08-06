Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF920C52D70
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xN+CFOzrLAU02hrTk8ITZnz6HNrJyzDiQ6ES983S7iI=; b=X8NGGAizyT7kkZ
	6U4cz1IalMCQReJs4AsvvEwokw2932z0GveQURoDR4QLU/LMUWbEqi3+8hk38Q6ehQ1SmZNpz32bx
	wGDu2jLNaxjnI/mLM7eelonMAoc7fuDEWfbJJuuoV9RK74jcEBRmml47ohCNCR6Gmjt0oEuJQZTNc
	MkvmYZJynIfYmStcG95sPceVBJI9GAE6cXXuX9rRy7w5nKZ/4idADGpK5lU10OhyjMJEVdFGGH8We
	PJjNKyioM3VzLhHsOZ4cE6UssnYNVdXPPZTgsDPKJpO4w7+hBArQogilx0sCpO3bsFej6Qaq43PNZ
	3Mv4DhN8Afgk5VP0z/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbRLJ-00000002uPT-1fQZ;
	Tue, 06 Aug 2024 21:03:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbRLG-00000002uOk-1icV
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 21:03:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fd69e44596so1976735ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1722978217; x=1723583017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2q6pHf2d+29PL7ARSSmco2Uda2QTne6ymuc4cRUvxc=;
        b=hQUD4b8DOgf6kqf/PyaeDpQ7fJpsZ0oqEGarGbCUcWTN5tHxTNvgjUuh+rcud1jUmr
         bNeT3uQwqKMuy0XFFLhEdO6Kx9ifIQt42q3uzCzm2GxshLVoGAY7hPfHN7YtssT7RJgG
         C4gCwkQhMZbVzEonxhMVmSSLkMCzKuKk9OkTUcKwjiYhbACxT+FX60D14mJP9WTutGQC
         fe+2c13neExAOJpkVFfun8ILJisT/YFNJIwYgC70VCF2vV27W8FweveixIKL1SfqA5P5
         en5FFMSTLD1lBXlvUcePemCc6TJvHHH3wB9DqGm+uuC/orDuOn51Tol2z9zwY1aICanh
         /43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722978217; x=1723583017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2q6pHf2d+29PL7ARSSmco2Uda2QTne6ymuc4cRUvxc=;
        b=ilXAcBII6fPN9P57i43ikn15qCJxLRyNRs/yt8mJuJK7yEsgXkStqOwNHp063Rdmic
         g+vLYz6RjubRWZwWO8JSe5jAz1JMdj1WRwcKVoaugTC4dbMR0xISbTz+0z4/P/wAn34E
         Q0z7YlIJzd6L8yJ9bLLFnTGW9iMxY7HhB0+KIl59z2vtqpp2B9zHq7gyjQvFHd59FrS5
         gIqOOgRTufTx7st/FHtjOIr0PLN7teDp2DJIZbiQTYJ/sZVC44qg6trq6GS6Rk3C4Ylc
         CfKWGEk3VvBIp8FoHuRb/OGctCMOdBGkkRqRwgvUuI8F+GxvuDf00cHKno1qjbVP6PVx
         ug1g==
X-Forwarded-Encrypted: i=1; AJvYcCXuXa2JdTvcZ2lst5QRqxrGqdhEbQ2hrQnYBZQIbehMRMTrKpDiIg0oFsxxwZ5D6sllK8Py/OTK+OqqOKf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8AdJGSDj/B6T0VIFyb3fE58MaZh9JCzgooG/4JHvSAT748Suv
	L9z26CNtq7RAC/wovhcH9hHW8RQJRkb07bIpMRYv6Gr3t6tc81eT2/wMWnqL8vOEsigY6wvdRZ2
	sE8t1jUmCB8A5rsVRV3B8WeWkWoQ=
X-Google-Smtp-Source: AGHT+IHnTsomZEJTNgTr0RHgWmTYrb/mu0Mk5eZcXXey+C/tHk5gZ8CXDzozzaLkZe8gUGsqKmfnGvzIxRoRWUKUOxg=
X-Received: by 2002:a17:902:f64f:b0:1fb:7654:4a40 with SMTP id
 d9443c01a7336-20085492a0cmr824815ad.14.1722978217049; Tue, 06 Aug 2024
 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com> <20240730125023.710237-8-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-8-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 23:03:25 +0200
Message-ID: <CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
Subject: Re: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_140338_504434_0D6A1AE4 
X-CRM114-Status: GOOD (  10.90  )
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

SGkgSmVyb21lLAoKT24gVHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVu
ZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKWy4uLl0KPiArICAgICAgIH0sIHsKPiAr
ICAgICAgICAgICAgICAgLmxpbWl0ID0gMjk3MDAwLAo+ICsgICAgICAgICAgICAgICAucmVncyA9
IGd4YmJfM2dfcmVncywKPiArICAgICAgICAgICAgICAgLnJlZ19udW0gPSBBUlJBWV9TSVpFKGd4
YmJfM2dfcmVncykKSnVzdCBhcyBhIHNpZGUtbm90ZTogdGhpcyBsb29rZWQgb2RkIHdoZW4gcmVh
ZGluZyBmb3IgdGhlIGZpcnN0IHRpbWUKYXMgSSB0aG91Z2h0IHRoYXQgaXQncyBhIHR5cG8gKGFu
ZCBpdCBzaG91bGQgYmUgZ3hiYl8yZzk3X3JlZ3MgLSBidXQKdGhhdCBuYW1lIGlzIG5vdCB1c2Vk
KS4KClsuLi5dCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fZHdfaGRtaV9zcGVlZCBneGxf
c3BlZWRzW10gPSB7Cj4gKyAgICAgICB7Cj4gKyAgICAgICAgICAgICAgIC5saW1pdCA9IDM3MTI1
MCwKPiArICAgICAgICAgICAgICAgLnJlZ3MgPSBneGxfM2c3X3JlZ3MsCj4gKyAgICAgICAgICAg
ICAgIC5yZWdfbnVtID0gQVJSQVlfU0laRShneGxfM2c3X3JlZ3MpCj4gKyAgICAgICB9LCB7Cj4g
KyAgICAgICAgICAgICAgIC5saW1pdCA9IDI5NzAwMCwKPiArICAgICAgICAgICAgICAgLnJlZ3Mg
PSBneGxfM2dfcmVncywKPiArICAgICAgICAgICAgICAgLnJlZ19udW0gPSBBUlJBWV9TSVpFKGd4
bF8zZ19yZWdzKQo+ICsgICAgICAgfSwgewo+ICsgICAgICAgICAgICAgICAubGltaXQgPSAxNDg1
MDAsCj4gKyAgICAgICAgICAgICAgIC5yZWdzID0gZ3hsX2RlZl9yZWdzLAo+ICsgICAgICAgICAg
ICAgICAucmVnX251bSA9IEFSUkFZX1NJWkUoZ3hsX2RlZl9yZWdzKQp0aGlzIGlzIG5vdCBjb25z
aXN0ZW50IHdpdGggd2hhdCB3ZSBoYXZlIGFib3ZlIG9yIGJlbG93IHNvIGl0IGVpdGhlcgpuZWVk
cyB0byBiZSB1cGRhdGVkIG9yIGEgY29tbWVudC4KSSB0aGluayB0aGlzIHNob3VsZCBiZSBjYWxs
ZWQgZ3hsXzFnNDhfcmVncwoKPiArICAgICAgIH0sIHsKPiArICAgICAgICAgICAgICAgLnJlZ3Mg
PSBneGxfMjcwbV9yZWdzLAo+ICsgICAgICAgICAgICAgICAucmVnX251bSA9IEFSUkFZX1NJWkUo
Z3hsXzI3MG1fcmVncykKYW5kIHRoaXMgc2hvdWxkIGJlIGNhbGxlZCBneGxfZGVmX3JlZ3MKCgoK
QmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
