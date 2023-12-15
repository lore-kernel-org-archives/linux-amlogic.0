Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72BFC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iB6pyeTtyvZEcQVsk4NCgEWKulduO15jAEE4kmsPzAc=; b=CVZCMNw+7GWvXm
	Y8JUx0s7sFdDMUPHS/ME/r0GnJ/yh2kR04Wq4gbalz2ct7K4DdBJb0Rek9TdbRlVRX9L6hMBh5h7p
	BpmB+H5MnsLiytgdDtURt30anRfvAPiQmu+wf7d4nAJ+qDbX7/4V0nKpFAxunVocHRqPVqbM68tuo
	JK92vyZietbka1RLljGT/Nn/DlatLdTsk7XONUb3rY641S6SpvuIzWBEjoywQD75NRdC/mDVOMO8R
	IK2PVxE5yBFk9Y5w2eCVcRyAzsfnigRAH9iiQzmjkxFLZVZiSizChcj/w/vMTmn9Nm2+9W+TOaU9x
	LDYqb4udBfeeqLDqeYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE42P-002YBt-0e;
	Fri, 15 Dec 2023 08:59:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE42L-002YBB-26
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 08:59:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so4305155e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Dec 2023 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702630751; x=1703235551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=HKRhQTm1VAfT9zr1Sh+85H40XMPamunC22Wfzz7BzDB4YJ+KnbfC5Xo4jMvNoMwW5E
         whhXCBZylnoWrtByIiRSPaGpLZUoFJvxbKm69Em/L4+yx1O83xf1TnusTIOcYitH0aKH
         NuIUewGTGjxPnrWNBwUvtmZKHGJLI9NoGg4oqTYU5xLZ0Uj+6kexeFLP+DutOXs8fL80
         b86Jphr7gUZu1ypmuQxg4OJwWnXW59rMVQGfNSG4rBJLhjGYp3tX2i+Y7KMIRXHRkILn
         EVOy6bh9JJkCtgLT0KPtZwH+bkb91Wx4hrHBJ5+749lFGFD6Lcvhsmrx6a1wJuXvx8E8
         Mj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702630751; x=1703235551;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=gTEMMHG165kQyL3VYo6/ZFudWmvBDkpCTuefe7wR/h2IttTTL4pfK0o9HBkIRBMMFW
         0xgSVXGE+qFAFpi5D/tacB4OlOFup+UbI201Zy27KkUNYLbkIsCNsK4qxVUMfHzMeSte
         +ZrQrSeJy2eOSMLRKZsPeu3M4Ni44EIMDju4/Oa4eXiuhpZ/Vj9Lz+SscbtO6AQGslkl
         2/Pde77XDPffuWaUAWge9cVUmT/woHvDbyj8Y1xOcJIPf0JYc1RCfLxxkysZoZsliRP/
         F9BKjF/rQ6IIXKu4amqPNiSTl1XGBfUSmM5C4FJhAd+0JE/YMhSd1qK8e26FmzDvPyHY
         2ejw==
X-Gm-Message-State: AOJu0YyYwzi1ps1A6T2TufcAgxpmNnbxsk+e5WmR4H8ZBpHT5vV/Wrun
	jiCLhQ5ZdrHOnTdou0AaOzcnmQ==
X-Google-Smtp-Source: AGHT+IEboGQxDSRvg+eZ0u566TMxgE1PRMgtXrg9o17xozQrBEwE5qf8IjdFQqOGaJQkmuVK10ixdQ==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr5769544wml.176.1702630751467;
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:95b3:332a:9768:b3f2])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040c58e410a3sm10914972wmq.14.2023.12.15.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Johan Hovold
 <johan+linaro@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Fri, 15 Dec 2023 09:41:59 +0100
In-reply-to: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
Message-ID: <1jedfnq1sx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_005913_691766_3E111F6A 
X-CRM114-Status: GOOD (  26.74  )
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

Ck9uIFdlZCAxMyBEZWMgMjAyMyBhdCAwODoxNiwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gW1tQR1AgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0KPiBIaSwKPgo+
IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDA2OjI2OjM3UE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2
bmlnIHdyb3RlOgo+PiBIZWxsbywKPj4gCj4+IGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSByZXR1
cm5zIHplcm8gdW5jb25kaXRpb25hbGx5LiBNb3N0IHVzZXJzICJrbm93Igo+PiB0aGF0IGFuZCBk
b24ndCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlLiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZm91ciB1
c2Vycwo+PiB0aGF0IGRvIGVycm9yIGNoZWNraW5nIG9uIHRoZSByZXR1cm5lZCB2YWx1ZSBhbmQg
dGhlbiBtYWtlcyBmdW5jdGlvbgo+PiByZXR1cm4gdm9pZC4KPj4gCj4+IEdpdmVuIHRoYXQgdGhl
IGNoYW5nZXMgdG8gdGhlIGRyaXZlcnMgYXJlIHNpbXBsZSBhbmQgc28gbWVyZ2UgY29uZmxpY3Rz
Cj4+IChpZiBhbnkpIHNob3VsZCBiZSBlYXN5IHRvIGhhbmRsZSwgSSBzdWdnZXN0IHRvIG1lcmdl
IHRoaXMgY29tcGxldGUKPj4gc2VyaWVzIHZpYSB0aGUgY2xrIHRyZWUuCj4KPiBJIGRvbid0IHRo
aW5rIGl0J3MgdGhlIHJpZ2h0IHdheSB0byBnbyBhYm91dCBpdC4KPgo+IGNsa19yYXRlX2V4Y2x1
c2l2ZV9nZXQoKSBzaG91bGQgYmUgZXhwZWN0ZWQgdG8gZmFpbC4KClllcywgYXQgc29tZSBwb2lu
dCBpdCBtaWdodC4gVGhhdCBpcyB3aHkgdGhlIEFQSSByZXR1cm5zIGFuIGVycm9yIGNvZGUuCldo
YXQgQ0NGIChvciBhbnkgb3RoZXIgZnJhbWV3b3JrKSBzaG91bGQgYmUgbm8gY29uY2VybiB0byB0
aGUgY29uc3VtbWVyLgoKRHJpdmVyIG5vdCBjaGVja2luZyB0aGUgcmV0dXJuIGFyZSB0YWtpbmcg
dGhlcmUgY2hhbmNlcywgYW5kIHRoYXQgaXMgdXAKdG8gdGhlbS4gSXQgaXMgbGlrZSByZWdtYXAu
IE1vc3QgY2FsbHMgY2FuIHJldHVybiBhbiBlcnJvciBjb2RlIGJ1dCB0aGUKdmFzdCBtYWpvcml0
eSBvZiBkcml2ZXIgaGFwcGlseSBpZ25vcmUgdGhhdC4KCj4gRm9yIGV4YW1wbGUgaWYKPiB0aGVy
ZSdzIGFub3RoZXIgdXNlciBnZXR0aW5nIGFuIGV4Y2x1c2l2ZSByYXRlIG9uIHRoZSBzYW1lIGNs
b2NrLgo+Cj4gSWYgd2UncmUgbm90IGNoZWNraW5nIGZvciBpdCByaWdodCBub3csIHRoZW4gaXQg
c2hvdWxkIHByb2JhYmx5IGJlCj4gZml4ZWQsIGJ1dCB0aGUgY2FsbGVycyBjaGVja2luZyBmb3Ig
dGhlIGVycm9yIGFyZSByaWdodCB0byBkbyBzbyBpZiB0aGV5Cj4gcmVseSBvbiBhbiBleGNsdXNp
dmUgcmF0ZS4gSXQncyB0aGUgb25lcyB0aGF0IGRvbid0IHRoYXQgc2hvdWxkIGJlCj4gbW9kaWZp
ZWQuCj4KCkknbSBub3Qgc3VyZSB0aGF0IHdvdWxkIGJlIHJpZ2h0LiBGb3Igc3VyZSwgcmVzdHJp
Y3RpbmcgYSB0byBzaW5nbGUgdXNlcgp3YXMgbm90IG15IGludGVudCB3aGVuIEkgd3JvdGUgdGhl
IHRoaW5nLgoKVGhlIGludGVudCB3YXMgZm9yIGEgY29uc3VtZXIgdG8gc3RhdGUgdGhhdCBpdCBj
YW5ub3QgdG9sZXJhdGUgYSByYXRlCmNoYW5nZSBvZiB0aGUgY2xvY2sgaXQgaXMgdXNpbmcuIEl0
IGlzIGZpbmUgZm9yIHNldmVyYWwgY29uc3VtZXJzIHRvCnN0YXRlIHRoYXQgZm9yIGEgc2luZ2xl
IGNsb2NrLCBhcyBsb25nIGFzIHRoZXkgJ2FncmVlJyBvbiB0aGUgcmF0ZS4gVHdvCmluc3RhbmNl
cyBvZiB0aGUgc2FtZSBkZXZpY2UgY291bGQgYmUgYSBnb29kIGV4YW1wbGUgb2YgdGhhdC4KClRo
b3NlIGNvbnN1bWVycyBzaG91bGQgdXNlICdjbGtfc2V0X3JhdGVfZXhjbHVzaXZlKCknIHRvIHNl
dCB0aGUgcmF0ZQphbmQgcHJvdGVjdCBpdCBhdG9taWNhbGx5LiBDYWxsaW5nICdjbGtfZXhjbHVz
aXZlX2dldCgpJyB0aGVuCidjbGtfc2V0X3JhdGUoKScgaXMgcmFjeSBhcyBib3RoIGluc3RhbmNl
IGNvdWxkIGVmZmVjdGl2ZWx5IGxvY2sgdGhlCnJhdGUgd2l0aG91dCBhY3R1YWxseSBnZXR0aW5n
IHRoZSByYXRlIHRoZXkgd2FudCA6LwoKQWRtaXR0aW5nbHksIHRoZSBBUEkgbmFtaW5nIGlzIHRl
cnJpYmxlIHdoZW4gaXQgY29tZXMgdG8gdGhpcyAuLi4KCj4gTWF4aW1lCj4KPiBbW0VuZCBvZiBQ
R1AgU2lnbmVkIFBhcnRdXQoKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
