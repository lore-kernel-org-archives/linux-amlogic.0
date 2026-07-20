Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3397BC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4peK9HG9N71oMYmDwvGNF876cEDSUORgFhUWmHQ8nBg=; b=aJ7QhpIXVPDSek
	XKutcKjJHuhxG4GirCzwXJAXskIoIYHnkaBObVxDPtzhGFkl8HK7ENLTEnHhNGwIsDvr9AUVgaFum
	AsaRoe2JNwjvsrCN73JsJlbfloOk56xSFdDNynPXX21RjxjlbLgbidgk9NnW5ZiOsTjv4qSu6ZMgK
	g/f/MLnwVUMahRbKdG8+HHg4SEwNHt2SaS8gVrOovQqjbWG9yf3zKfqtrDQbYb2Wp0ey3ceFdIqbi
	I2qfEMcbkGayWSKEmAVZwXn9Z5PVSupsgSq1C5Rn3OmEJOf66Hh+kPFWUCiOv2fBHKOhrp1jNvqaD
	B2P5+y9sQnTEHGdg1elA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiQ-000000079PE-1jy5;
	Mon, 20 Jul 2026 15:15:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiP-000000079OK-17BL
	for linux-amlogic@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=; b=WkNeSe6QeouM8s9N2yT/yWsriA
	RRsR7k6bIEysahTMMxjtMMm64xTwJkRYsujH5TYjZ9MvjNDl1IQ/RQinLE7+rdTWQ3HxL1TgMxe34
	xOfvOH5mUZ0iDYixRxlwO88rfZe3HNXSA+u5ihwo1BR0DQr+TDkUECaMackXlms6toJODdD1kvSXy
	GHTAIy6AO4rWNQ+2oQPfiIIwAKv6yg6vcWEbJCZ7WKI7h3WlVLsrbkHQ6tvwmZy4H4NwgJLTgjKOF
	qtFqz8tC4aIh5sbVbQkMru0NOm8f6bD3VeceQAvTm34h/5+fxHCFF2o/SVTo9dOox4zEBy7DcXMUr
	VsXFZhxQ==;
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlpiM-0000000GikN-19oj
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:15:32 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-456f7012050so803005fac.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 08:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=iFhVut3PT63wHJQsdY7SQUncu7+5NNuS95OQR/HwneV+Op8eSroeicaa8t8hbH5kk0
         3SdZsjPv5N37coZmKyfZ3+GqQ5B0mf3uymjw35e4xOP1lc7la8viIgzUtKf4E2cMjhl2
         Mja4bC6kXFjVPcFhneskXraxOiDVouC3dQVEX0tMALI8ZM++snArna0Ij3i7G4XEbov7
         BxOhYiShoP5vuyRpSaM8UKLaMKXcNFcJ9kinOtXOlTGk4td9kwyx5qmGzvfo9EzcVW/C
         G2JDWGAqMEJ0IXbkGslZZCsxDwhdh4I1vvv9dBkxqk6GZFgWk1JeFTYcxlKZz8zwaSXE
         ketA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=dl5uXmWXqOXSDSaL/hPhgxHcPAleTEWjhuM+DuguPws=;
        b=ZitWj7pYx5dXDVtj8VWStYHwz1ubNEtLZoTueks2tpqfRByTX74XFZLvxM7U11lISv
         e0gKP968JKOzIlGiDyAPwLWF61X4WGm2TCt8mmDtGO4NZ5Ekt9lUqLQNqcXdHJKvB/ZL
         2w/yqGI95opDXEgEjf/HzRDRgh9+qrOvpyBHyjz5SimSH4qpoykNiNYKxlpy2h5pknC0
         wfkjaQ0GbwP3FusIGUkJ3JyiZGglfVys6bxlP4SvgI7AeF75qe9TLT92KLgoMtnH8Qcd
         KmOkaNvDS6PyHxGhIlSXEHyF5ZVZbvRiHOgUtOJppsuD/TCA7L3kdPsgkhg+xRPlDWy/
         snBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=FDVRoRhElDjZGTmk6+JEiCLaB1ZsDxxG116imVPRkUHrUK1v0LySFfgn5Es4iVRdgQ
         HR3Dq9BIOprG+LXlf6qpEpStUIzffXUDA4eujjLfnldGZEkch3lYDdraCM4n0Nh1lhx6
         sfVlvLHg2gi3sP6Jz8oQeEs/6qpnqe8KLVxZTCWva9up2PWO0M+hfszOVtb6Ek8IAeVS
         DiAI0h8S/Kxwzm9P1YIil4CxS6K0E2XNc8qvitIOBLZqrUeL8pVSS037vwsoBbakFqei
         4yAdOD3eQ2FonmcAXAD88oKxZs4R8CQL/VgaQVT7vPM2mipvo+4QXsDrrYFNPxMjFHz5
         Y0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=F1Sf0HoiCtwbXNjIL6FUp1/Jwz8LtaI1PWM3zvHCOvhhH0MKwIM6vsbKUjqQkN3Pz+
         M5FizXhfpZ4A/vXsutZLYS5qRLQG2xMSHwOAewGo9VJB9zQA3QNSJHfX6XmW9l59gc8r
         EMAQ+u/jlSkOz9kS8WGaAdT73k7LnUN3wU5aOkUfvHiyGH2O90iz8g//39stbkOiEORW
         CFrVzOGT63p7kANwvUxJ1GMrnEj1QhveABdkGD/w+sulkZYVpEsxzbJXeMnHBm/v1ioI
         VjUyt6fCO50vSVFZVnMorRVV9Okvxk6n5TWhfHYD9oJSOufXzyXkAVqw8NH9R71da464
         XOyA==
X-Forwarded-Encrypted: i=1; AHgh+RpxFlcd87LRcpGoJ5vVzAoya5rYFBzhO2lyrobJzdFmj6ozXqMkaLjFLfWgARD9+qSu2cT1qUvRfWQgPJIp@lists.infradead.org
X-Gm-Message-State: AOJu0YytLf757+36F7EJhNilymf6ibQp6W6s1xH4todldRmNopvYs6mg
	olImO7mylKqLCespFAWqkDjw/JqvBDejobFtA3ij54+xz/H1rCHyczweQ+4PV64kPdL15vMoB14
	tjY9iwO2Yi+ykwUnTKUIuyo9RT+LhuMw=
X-Gm-Gg: AfdE7clmrM8NlUynbJyevOE5WFLa97DipsFBs/JUQT66RzasMm4/Hfw84lpI4n9L5de
	cDz6wzVLPYG1UqH6KoES4fqpoqZOVnJIfHNTEruWN8uttiNeWSlw+lD7Fasbvb6mXbrBDpW5Edn
	lZeD/Ppv2Hk5HNWyauxiVIC+Nh1ab80/CCmMmcD7thZ1fNq3KEGgnNngYivshNYhL704taId6vS
	LY3spkGuwKJ2jvYHwHEG9bYjIBESnM6YONR+VRk9J8o4ZMeC+5KOmAz0FIKK0U9o130lpx1MyNP
	tEbgNbLMs8juoUu/LEv18unRiYQ=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_161530_537069_8D4B6BCA 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
