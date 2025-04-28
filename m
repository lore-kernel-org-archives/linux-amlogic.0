Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F90C3ABA3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueRiLI4vUshlg0cU7aDLVO3eJnzkOzHrWdkIbybK/pc=; b=3QODjWS4ELpo9L
	NOEyFaEbiAXlFHmbVsVN8b2tu0bn6xZ47aQCXgOVONA/FOLn2RxIvR2RMFpoprUK2KaWrYYp6ZQ8Q
	tDbBCmDxYNLvMB07HDqdKa6ED/J8epBMAcoH7scerbc35TxxinkWpO4U7msCXiM+eyMMmI0s9nlLC
	K0Wl62B1SZ1XZ/Y4ZR2NhstVb8BvxGeEqPvMSidf4hOQCDzkFfjKpJDXf6jw+37IQBrwDcytGlOAj
	CfynRouZ3nCvHYM0FYIRx+qSx2OC2l4z+1KyAMKlgXQxfbWtWmk2fRSh3MgnOvBfJyCKrIg/6A8VA
	qp8XVvh1G7p17VWRKhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VXz-00000007Wwm-13KR;
	Mon, 28 Apr 2025 20:57:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VUS-00000007W5w-103a
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 20:54:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22438c356c8so58858525ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 13:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873647; x=1746478447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=G0PJrpQu1erIt2Km8GxJXO8RRCYHawsMpXlMLr+u9RhTf2JSTmYdDsIm30V9A2Dkjq
         Gq2u9zmo9nkqy5S4MEWyggSGBFCltkUA7UuL3tNHsSUCZzz0zjZ21mtzev8wiJ/fNK6Z
         U9GarKhWlS1yNhF8VLNGev6mhejUT7bAJSrug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873647; x=1746478447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=BCce5rhEmR+cYjmUe6q34LJNG5v5iP53/VwcqL+YdsGkiiEXCdwueQZLzpx3zBLCQJ
         ppC6VeOIl8fDiqohVkp+4m/P3BpxZ1klprQ4s+qBs6lMHkFvCY82LbE8MwWgjBwFSj4c
         FJ6rIt8f4XRoS1n3zDzGrzDuP482wgwMZAW+JjXb4doGMtePKoZADmjVsQL2aMmM3Xem
         9DqFc3sIHb8qxJdHYWVLjU+ncA3MS6ZNW/HUydOksFDrl3i/OYlTUk3BW6tw6cIzCKQC
         MiQdCgAKB5YbASyvxnqNe1j6ZpWoVyBhhD2XEEPtMFhs8QNGqHJQ+Z8ZOD05qoz7QMia
         dmeA==
X-Forwarded-Encrypted: i=1; AJvYcCWlbBSvFml6jq1dH0Qr/WyhARzz4QNrxaBDAZPDPYxGih17hz+O2oYgezF25MijJLqGQ6UXempfnERKLoSu@lists.infradead.org
X-Gm-Message-State: AOJu0YzkInQQfI1Ly5dZbW6WIUgVvFiFuryonIhaC4A6L93UHYOo5zMG
	3FyN6DlDhLMvx8oXBaLa6RIzq1TT9LlUE6soLZq5waOoqa3+JROE5eheW+e0Q2aIaJ5RGZYjFmM
	=
X-Gm-Gg: ASbGncuIPwpZE4/4dtTQByGAFmYR18YrTWYEmY+HI1VavBLvAAcOBJwTc8ewOHbKbMy
	H6EEOHV0rams+Ru9uRkb5p0MzL/2RoML842xTDdIkheny60oau+ZCwHK7UcmomzWi3kPENfnNX4
	fvVbk/I+4sscpsGWohMVG64MSLT2SIvlaGkncwKj9K9KAWNgcHUUgtQMHl6bVKPI1ZRShum6dyp
	fCBfSTLN0PmLllP3oBky+AIJZuYhmCQBBUl9bu6JeDx2ss7IlVMU2yNBfBtc+6ys/btxxltBpfW
	lQzRP71aGrxpQRT+ftUTdSOauoWEn3a/A4oQC3Fl+f3KqfN2hU7js42F7f9tXbj7lZvHWOOvrcJ
	e+zUq
X-Google-Smtp-Source: AGHT+IF731gjTXrOiNQy6VvGF5CcCDJsfEtoVrOrpwpbD+315s2xUxN3BvVkjks2u16Qsp309QOsRw==
X-Received: by 2002:a17:902:e804:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22de5fd249dmr13422725ad.18.1745873646742;
        Mon, 28 Apr 2025 13:54:06 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102d31sm88040215ad.198.2025.04.28.13.54.04
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso4697621a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTLWfKbT7Ueg4NB7yvJsOyHzFG05Vzaej9W5ced6dVgIQPccsJmduZSf19M0k0Tv+sckl2a5HvRUnVC0nC@lists.infradead.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135412_270357_AFF4861C 
X-CRM114-Status: GOOD (  12.30  )
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

SGksCgpPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAxMjowMOKAr1BNIEx1Y2EgQ2VyZXNvbGkKPGx1
Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyB0aGUgbmV3IEFQSSBm
b3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KPgo+IFJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEg
PGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xp
IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSSBjYW4gY29uZmlybSB0aGF0IEkgY2FuIHN0aWxsIGJ1
aWxkL2Jvb3Qgb24gYSBib2FyZCB3aXRoIHRpLXNuNjVkc2k4NgphZnRlciB0aGlzIHBhdGNoLiBU
aHVzLCBoYXBweSB3aXRoOgoKVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+CgpIYXBweSB0byBoYXZlIHNvbWVvbmUgZWxzZSBsYW5kIHRoaXMgdGhyb3Vn
aCBkcm0tbWlzYy1uZXh0IG9yIEkgY2FuCmxhbmQgaXQgdGhlcmUgbXlzZWxmLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
