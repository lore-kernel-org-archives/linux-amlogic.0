Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B851C369DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXDMacPuQSxb77/xkrTa9a2WyUuTcNDj3W5JgeR+YTc=; b=MdgNQIK/Mu9QTr
	/Lv2jL7JLEwNw28BP2gFSdqgzrWTwiHsQ3Gm59S6s1FNapIhHNe25jfUaeciuxt75KlZIHA8a5v/6
	gnqyotZl5utv+1XjWykWuOLHWNq7/b2ypbXTvKnf/bT24YyQnHHhlkYJ0JfjTHAh0Y9pFm3L6D9RA
	GECZOtmk1wqkOQBaVXzWMnB7ynDTmE32htlg1cDEzrrn7NhtdEI9TtaSj/EixSQueNDYs0ksIDcdF
	p2pvNtgfkfdrGuF2VaBBiYjog4pP+QJmrWaizAzbBPw9ClGeo9UsSJJpUFa223etEnvCDbRW2zzWW
	PIXt81kxm6gBiPmrKBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gat-00000008zCx-3KGL;
	Tue, 29 Apr 2025 08:45:35 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gWL-00000008yXQ-3XYc
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 08:40:55 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30f30200b51so64896281fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=AKfDRRjgvVLEd8BjDO8BEft0/sbUc+IYaqPUP1cMuuXzKXB0dFRYFWKbDicFXjlJz1
         LBU96/EExesDIHuhjZN2s+Ksk9mhBno0rILWjs2TkvzbR45Tc5ujnWTd04+sbVbTqTlp
         CizMEU0/72KTvShFHYi1EjrW3cvgLsv7ZN3QPFdAUvUu00Gdv8mUvnvmAQ8k8BPJFFDm
         9gCOwlUf9CyE4wtBrNepGr3gECOKQUgbNOVinIuCfMfT8f+/ZocrfSvljFEt2czU5agH
         DVtlgZmdyIxEo0jjq+4RjhiksyjmecoShrM7H/UI4C9lQ5BBZmO5qL7eGMV/sCB2+yvB
         CTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=Mf9XGFt5QmBR0oASjH0SxfPlabVP5vZlR+erKdvIfnvAeAVfNu5QAb7A0iEdwczgQG
         2H7wt0ym0ePsGqpjNjHE2aDsxWegcCawDliT8HHfTB2881UzZd6j0IUymmofMo/x3iZm
         yyff8U9uwgDloPWppe0RqDbpEy4Ttbq06Q7zf9TIRMaAx7QojlGQiCVg0rdjqj4Z7wqN
         IXX8nSndCxOyilgKKPCTb89poZwTCBtdKzjRY0N4ge1J11wZ+c4uUqUPyObsF4VDoFxt
         lnuElKjZqGPnitbg1xZVLd92WdRtYYj4J7GmuaQ7w2Kb79MLR/G9gwr1UcrMZW3dcbN9
         jteQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ILZK9hS6E7DRNLc4Vidb3TTQYJHypJEye31C3wrpYKtoSzrohNOIQuPXJmZgbC0HBZDfCwkC8B7wrnO1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm64oE65tPJwqn4ACkhZz4t1dlIXqkwDNLW7BhGSQJJmS/mv8n
	g2MSuCbEP2ZLjGRuCGwY2DY27yM/KeXcefTkJJKnZPnVRihmVVd7b7txASeYo45IZ3J3pGkZwDZ
	u7qTKcHacEJKQ0Y0HrFN/9o603CTF1hy5LHsW6A==
X-Gm-Gg: ASbGnctPhou2DdrehP8OyJcn6WqebgY787nksHLgRKRkp9N2X+/gKpI5M1QUizI/z3E
	0HRWEjA23XpJ97v/0KsM+151GdaBK+6HjsQezx3v8GXBCAKMj3zL2fcgpsR9WJhDaf/FGF8B5NA
	ay2iBAXH8TKTDQPqqneoDAbA==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_014053_883982_1BD63EF8 
X-CRM114-Status: UNSURE (   7.80  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgOTowMOKAr1BNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGlzIGlzIHRoZSBuZXcgQVBJIGZvciBhbGxv
Y2F0aW5nIERSTSBicmlkZ2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
