Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC5C61DB9
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2026 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOOgkjMiEpP3t8nmb0djHdOkVXXCLgFpqHKT4tWi65E=; b=cb0NlVu39QKL8S
	jFzCi1r7OpGd64l4CBAPJANYh/lphH8gFQt0S78QgkI/eUfNt+ybgZhaYZwTtyf5uk8yWI+VirUEH
	rA7kyUsaiFZipPcpH0mL8ytR5AiQHswK34lmQTY79FWJZXgquJTMiKnNUTet1is+PxmUqjaxGZPE0
	zEWlgK57Hw8kUpy2xp4Wn0Ctz6u1yyUOdv4PShLFY+i1RM+3SKicv2LlxXcS6z9DoLiOzi+m/+xMa
	b5QNOwwWif7i5n0OnVxMyiBRhO6H1OBe/4PelrMVKe/PK+sBRIrPgc0zFaV8YfN2d7PgOKR1apZVR
	PcmwNIQSWDQpkzHaT1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw44-00000001KV2-1hIP;
	Tue, 25 Aug 2026 18:40:04 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw41-00000001KT0-2nhM
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Aug 2026 18:40:02 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-45171f2f608so196532fac.1
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Aug 2026 11:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=VstysUvlqHDFzCgRFN4tT144ekYY4zYuHdnZvVAPy0Y1D4IMP172/Oyw8MRnRIydXt
         3AwEivzEgwetQpM0yL3STxh+qSfm2vNj83tnZUiH7PBnLjCmUgbh9jjl9WNMSlLyHoVl
         itSOUbj18Z1yLWJ/TegVhrTMRk+oBIPGnl8EMELEZZ9s/9Ry2ohpm2CGNkY4qElq/8Wl
         ik6liEd55PRb49dmiYysluDCIr+5KkyD2mXoRcFNXl7re1YAzElKxsvcf2tAsvU5/PAL
         pLVhg5O6htYmUxYcfDYnNfAG4QHpGc0CmjFhiuodjZIuF6YaHov+/fsMi1MjnhKadkYz
         v+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=TooWxCnq72kQuvigZU573KX4J/cBRFahDWwR90TR/XQ=;
        b=D/lGYRVOxNGGgsq5ysekb2hwhpzvrXtjsZgaM1IOmUuBwiDXKUBzwI8ZKpGBCQ8TVl
         6BIq8N4PfZuIgQz+Ts//R+TcpUZc6PIUKZkO9kxLM/cvkenTMTQ97NQP4iyS4Em04CgP
         xgJ+IdyWD2UiFHmVebP0epbtkfSzonoGXft9cWzq0dw2l7hvofnLe+4VEEXZivShngWY
         BSqK2XVFgKC7DLrCVrt+M3yT8+6QenOzGw9iLew7c4FnB4PDvwVHh5bmDZ/KjTQ8ZWY0
         CuBFgfA3oOc+7eGROeWx8LOSvERRRq6lqwQitGzzHQnGv7qf6p2moHd5+7XEcdxRxlhw
         x4Ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=Hgv3MCJroC3X2w0NerLyt75GDLMwGPPoAvDJl7fucXnddmyv3Xg878pPY9grsSIXwR
         IkZ59n+jVdsHgdX51mWiSRh6EkfsKkYetkR6iXSyjjv3czdR20kl100Nn2uhPovx1s1x
         j3+e8cIO4JsUYk6mkBrCsCFBsD6F7K3HjN/mlxGvkn2RRocc6EuBhgWqKVKDuoe6qePt
         3AP5uF+rQq3AfS6ots9t00vyXq9N003ca6bd6eYbWbrAxNDjspmJH+8j/4lDSNksMtDH
         CEaq/mfu530VQttFDkSl23yuGRJfiA8FyG/K2FKai9NwrCpoKYFHEbH03li9+zDLnGJO
         F/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=A8us4/VaRaE6fHOaEpOBgtlv6xS9auaiCO1aEaxOtfJuTOZayyPZfVdmnrNn0l/D68
         Lj4eCO9cEJi/M/0God88E2iQd2b+1yvQzfLZJehDg3Lb5FjKM7/Txz1G1kOdmVdBoAyC
         /wwvRctezv2jXqwK96gxzMG90iE33sCp2MD0v/22FYfOKiNp+PvXp3WhOl84Iz3sP7az
         b7vWLaZ8F7+UfMqsK1U7KMiMK0c4c81XqR8QqnroBjOIJGcho1MDVFf+TATmzMiX5Ynp
         cg3/X9nL7Vog5BRXuSc0iO1j/SoEeoKMiU4aiAta9hDW+wCVT1rfkcBM0KouO71kUqfg
         3X9w==
X-Forwarded-Encrypted: i=1; AHgh+RpWN99GukBJYkGxxHRO/GjYWrM1LdMmMCL49QkRPIyi0N6nJHBQGMZoJJU3BwBaOo/By4z/frnuGKcNQjGA@lists.infradead.org
X-Gm-Message-State: AFuF++lDxxLNfUo0yRF0Y+RTinPa15AQSQ1K0lLRrowtUlwM35TcMoN6
	CME5SSqNTHCu7afUxKX1itjOLtj2HeBaD+e7HQMiDPXujRQxz0SzQhGmJsn8EFabfX/rMhpKbOR
	wdYZ4dABggOG6oE3DVKIvD92L/jyDsP8=
X-Gm-Gg: AR+sD10Hg8s0I3aiopG8I658zDHVia7wl0j86ief+E1rD85HDNy2VSK/WpHd86SBSiG
	I+fY5ETBGXZwV7KD5YV+K/onU6wFdZMfeNE5jdUlPq6s3KzfN4R9hxzhuVYF82L9mwly7sNjtEw
	qu1aIeR27fQqLEfglYYjSvEg3zXeh9HvARcZM8YeWGtk69Jk36irWXuGERTvYJ2agM966BURwgF
	1k5Q6RIfaIIDnjSncJRgA/cNzQSbQm3r0A5abNrXRPK88A4mHmCEnGx14K2x0FC33NI1/ZxHCT9
	3sjweapYf8k+RT/fBohlN6n839FC6eHlWdr71pjR6D1SLA==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
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
X-CRM114-CacheID: sfid-20260825_114001_714551_41FF6715 
X-CRM114-Status: UNSURE (   7.64  )
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

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
