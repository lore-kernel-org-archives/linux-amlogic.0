Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BB5C25B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/KceTjaRy5JRfoufR2LfwezzYn6EKakJ2xSkBDvLiM=; b=RRZCTxNVlygBfs
	gKWh6NAFRrUqBcLk0qCsB5l+FyOESb3t5+YWTjbX7FsTr/wP8tqhk6MxWx5v/jxa0mQxvYVSubmie
	kYxyRhr2wCzJ4785yZJ9oCeG9D5PsZk8z5CspPzuQPfVdXLEeyn09jaNTXKaHsq6dc8IS+jhWN9QY
	9fr4irm9WM6BZ6dj9jaCOUICPuUkfomXgK6Am1A/nWiIWKK/fbhDOkNiJiMod+28QuJllIa4McqNg
	SWcbTiwPJNkQgtHFZ4LgkMaU9OBo9n9GX5LQkEFFiP3TwBwdcjfkZK9ZcVOKDxDjagEyZr1FNvl5F
	YSTWcRt0QQjv6c2cLXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90q2-0000000EFA9-4AS8;
	Mon, 20 May 2024 11:05:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90pz-0000000EF8Z-1NAk
	for linux-amlogic@lists.infradead.org;
	Mon, 20 May 2024 11:05:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso4449519e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2024 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716203149; x=1716807949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nsnKmHuBmN6J2mWJ2RFHNEE84aeXrDEHjd3h7k4ZwUU=;
        b=CFU7PCwmf9AGMigGjFLmW89mQgPs66iOruAR+jJYCcx0MAOjoQwIR2ro7ewAHB8Ahg
         cZkQjaF2N8kqSsnTz/Q0kPCATPsWrzKwRFhob2DWuGsDNjEVUfKO8VbzXKIvdaKpJwFT
         Tn56qCDmihSlBZ8dHGcw3iZrGY5fKdGONZZf1cSkdhBf+ZPTNDGcJAnt4AbyyIgfrq9E
         kvIhsWsc0xJ6vIGARTRHmPS5nBHXmkr+dgsztDix73Ceb1b7XZ894aT83oMwmRzQhMx2
         FKMEWFP4k8z8MzOrUGo/8SemQwVTegW3g/EwXj6uA/NrsGzg3ThgFzvLkjtd8zrA3S2r
         +2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716203149; x=1716807949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsnKmHuBmN6J2mWJ2RFHNEE84aeXrDEHjd3h7k4ZwUU=;
        b=Emn/rDSbMXhTXVpxLwDfb7HOdqyGbD2HTd+/+1hGeXu2yzPaD8T+NJdv4dhBK9ETcy
         QrhtxEeuImq7DeQS4RyWC/5pRfy4XZxfPgvlAmFdj+XOqF/QAEdp6bZ2nTdsPI4m3zvq
         19HxP8w4gZ8yG7LtucDWFgpGhxhInsKsZmq3t4YKEvoCq3L3q1r1nkK0TspFMLUOUMiG
         fqgEAEfO7q9DLbmaYEBNoeqg8m8hPgZ/sOgHEKXoop184159VrdUlsAgRRphClMuXDCR
         mKa0cR258t/UU5wOQzFCu7KU/zNNRcDEM6qy78Ffxz+3Z3jh0lKCqcdkDR9RGCvflFW0
         7NQw==
X-Forwarded-Encrypted: i=1; AJvYcCU1hfpOxdd+tc+HZzdBEVZfJasiFgejucZRWPv4/c0Gpl/rJfYycoOWeeEyrNy+c8elKX1uJlOBRo10MaAq0IawqQNa6FeJ+MRzlSk4xwvgD1M=
X-Gm-Message-State: AOJu0YxBq/O+uAzFhTDfZ6oS//9inLF3G8p0lMcwbChKyD90Qet04ndZ
	McySa/YspZJHBN++iyg+o+FF8ir8Oc96PH9kWBwRieyGROgpjWpk4RBmTWyNzBM=
X-Google-Smtp-Source: AGHT+IECc0/QGytciTsg1Ow4YOo2yweKq3yn/cTZEcTK3KUAdVVZMShgvpI1frMYPXAmC2Lq22cwUA==
X-Received: by 2002:a19:2d09:0:b0:523:919d:302e with SMTP id 2adb3069b0e04-523919d325dmr15436572e87.7.1716203149103;
        Mon, 20 May 2024 04:05:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba912sm4180788e87.75.2024.05.20.04.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:05:48 -0700 (PDT)
Date: Mon, 20 May 2024 14:05:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] drm/ci: update xfails for the new testlist
Message-ID: <fbfo4juetokyhe6xsvxbfr3fakdushntnhlrpgbfttc22kvrc3@p3qr6qh4w3rc>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-7-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-7-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040551_432026_E11BABCF 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, May 17, 2024 at 02:55:02PM +0530, Vignesh Raman wrote:
> Now the testlist is used from IGT build, so update
> xfails with the new testlist.
> 
> Set the timeout of all i915 jobs to 1h30m since some jobs
> takes more than 1 hour to complete.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Set the timeout of all i915 jobs to 1h30m and updated expectations file.
> 
> ---
>  drivers/gpu/drm/ci/test.yml                   |   6 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  41 ++--
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   6 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  18 ++
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  31 ++++
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   8 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  11 ++
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  46 +++--
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |  15 ++
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  38 ++++
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |  14 ++
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  41 +++-
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   6 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  15 ++
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |  42 ++---
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   6 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |  25 +++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  77 ++++----
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  16 ++
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  63 ++++---
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |  11 ++
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  30 ++-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  10 +
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   4 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +--
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   4 +
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  24 +--
>  .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   4 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  12 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   7 +
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   5 +
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |  12 ++
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 175 +++++++++++++++++-
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |   7 +
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   7 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 175 +++++++++++++++++-
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   5 +
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   4 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  38 +---
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |  26 ++-
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   7 +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm testlists

We'd need to triage why the tests are failing, but at least it looks
logical from my POV, no more full-test skips, etc.

>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  62 +------
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   4 +
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  83 +--------
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  12 +-
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   4 +
>  drivers/gpu/drm/ci/xfails/update-xfails.py    |   4 +-
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  94 +++++++---
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   4 +
>  53 files changed, 1010 insertions(+), 389 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
