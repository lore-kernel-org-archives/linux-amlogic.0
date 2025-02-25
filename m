Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC6C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3qhDeFNGFVOiPG4WcXhMx1x1+qWn/HdGHRmwAYXhEU=; b=r6Fg/67nsQTBmB
	YhNSQI5Qhw+e49l/PtY+ZCi+kU2rLoSLh1bGni+NU515UqhCAGxezC7n6CERE5Q/3htH//JoMyv2o
	dVUeg0jAhh5qCpJDZaJWmFzSxHhvB68NJCKtoMjfVPimGONF+hmMDwA5z2kV5HaqSOI4OZIzwSO27
	BhR9Z1k0zRuW9wpnFVSxPA3fFyCMCVpVnP0NbWDqEshtQBa0URx0fR0R6hBqNeog0DtjbMwUT6Kve
	TRtLy8aKliXTdiTnNPkwyh/AT3OYey1XVyBwP+Y59qQPMsRfpSHtWvyfBROJuKzIhfCBN6oHD2PYc
	VYZJn5IknzueWrqOB4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3W-00000000PTB-0md3;
	Tue, 25 Feb 2025 16:45:14 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxQq-000000009XT-1ozI
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Feb 2025 16:05:17 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so45004731fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Feb 2025 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499512; x=1741104312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=RF+mWMvJAG0fJX++IeS/vbM0eBKib6BDlOgnfrje5wOWPQgVQW1YwYX6n86xjvWFty
         dQwYNdqYQRUyUwYy1mRd6pWYg9rAgSWiYTe6JXtC0vS2qW9wHKd0sB44wkrqhqM2yiQ4
         mleiD4ij2lDtZcxzBoQE1U4OtzPnfsIM0297I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499512; x=1741104312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=BcMZy1rAbLMDLi6kOIZA+HZ3rTWXlZIbm6dOEQUNHvK8LsOQqg+QvYnbN6x+aLVvo9
         JnPbqe3jjhls4x1zCkThF8o/KwPNyZdE8z6x/LwFW0AFZPifY2ctu0mhirqPRDoRoORF
         TMx0asNkeXJECoVxValU/p2FWV+eLMLu6JZoqU1lQdgwAqvo+DxWmeHENGj+I/txEDsi
         5jG7lEV3UKDxmJBLPmQUHp7XqugGBbR9QdpaET1HzBKIAx4aZdhaSR89rCCzp3tT1cyq
         c3e5YmnhiauSm4pXS3iUOR/wcPFF2EW/qQGsmYNbWuGY+rE0eso4RwlQB+rHBLorIgsM
         PWwA==
X-Forwarded-Encrypted: i=1; AJvYcCVPricS/ndxg9qJHR60N/04Ntlf5ZlJ/JO4S+GMO7j6a47XbhmdrlIgsM0eEsKUy4fyOg+38zydafmO84w8@lists.infradead.org
X-Gm-Message-State: AOJu0YwpCKu6NyLDRW2Fh6KLMyiZBFEnncnCzF71VcjouoPuxDwjO2JL
	KrB7Q0RiUeyXaiOTvsn+ULHWR/+j+Ak3I9yHmopoojBXIwtc4FnjX8l+XU5mYqpowKN5NgyHL6A
	LgdKm
X-Gm-Gg: ASbGncsR0DWIJPAFWg/4NLtuXhLhuiFk/KvjlC40l3sNn0LSB671GeOpCQzbNoFNRte
	64oyupXZNmfwOu/w1sz78cBkxz17CFxDDfaZC85d3xFs4rSG2Btcw/Br4j2smEg907932ImeOSI
	ndb0z7ZRkVFfkz82qmai9DpPtmsfT1opiVtw9oeqrTLlg0G5j3NPBvOEnXzGM5R81nUL8bLQvIc
	mMNptRsCDkEDrmfAykK79kB7d+gd6s3krgaz+0ob3+HwhY1beNwRcO2R75TfMrEIznm+Ivzr7wY
	c04MynTRJaR1F7fmCABrpiGeRVH0N/o79DEo8+DthSnGyOjrkwE/opkDL8EB3OLL5w==
X-Google-Smtp-Source: AGHT+IH0Q6Rdosn/25231kIIgEcIlAOtJ8X3As0ziIJ5EHeMjK3Gf5lFQr6Qv1kkrSe1r+2zSx1htg==
X-Received: by 2002:a05:6512:31d2:b0:545:6f1:9494 with SMTP id 2adb3069b0e04-548392685bemr7100046e87.35.1740499512240;
        Tue, 25 Feb 2025 08:05:12 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9e1csm216976e87.95.2025.02.25.08.05.10
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:05:11 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso6884921e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Feb 2025 08:05:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL+XUMLJHudbzdokGEPfYKNEk3H76OumHhC1ERXKAhquVUQxtlBNKZOvUSGiWOxb9wjZVSRK1We9AsQOah@lists.infradead.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_080516_499975_6DD227E3 
X-CRM114-Status: GOOD (  13.27  )
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

SGksCgpPbiBUdWUsIEZlYiAxOCwgMjAyNSBhdCAxMTozMOKAr0FNIEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0
aW9uIG9mIHRoaXMgZHJpdmVyIGlzIHNpbXBsZSBlbm91Z2ggdG8KPiB1c2UgdGhlIGF2YWlsYWJs
ZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIGhlbHBlci4KPgo+IFVzZSBpdCBhbmQgcmVtb3Zl
IHNvbWUgYm9pbGVycGxhdGUgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQg
PGpicnVuZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jIHwgNDkgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSSdsbCBzbm9v
emUgdGhpcyBmb3IgYSBidW5jaCBvZiB3ZWVrcyBhbmQgY2hlY2sgYmFjayB0byBzZWUgaWYgdGhp
cwpjYW4gYmUgbGFuZGVkIGluIGRybS1taXNjLW5leHQgZXZlcnkgb25jZSBpbiBhIHdoaWxlLiBJ
ZiB5b3Ugbm90aWNlCnRoYXQgZHJtLW1pc2MtbmV4dCBoYXMgdGhlIG5lY2Vzc2FyeSBwYXRjaGVz
IGJlZm9yZSBJIGRvIHRoZW4gZmVlbApmcmVlIHRvIHBva2UgbWUgYW5kIEknbGwgY29tbWl0IGl0
LgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
