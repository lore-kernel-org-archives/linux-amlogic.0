Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E6E7717D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2024 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+DbrqRQBmJN/ulXBApWS8hsRAXBkpIo/Uhrc3hLCUI=; b=i2ei9yOYio3K38
	nm8p4FeiYHFOE8qhL8r3voGsbt68x98EE8yzz/6EO2TQYVXHzbZnPAxOqmpvHAB9gy/GK9AGf6hkO
	WIXOBhfL1l6kCzrdGTQGs2EgthgWZZt1Ts4JhhUC3l2N2545I4gl42Bo5JAKW/5qOvCgveZlaX4b1
	vvTOioTgTSUGFWdJXbSx+VbqD0ZvxkRGH8Ozv+6iR4pu935KpAaOKPqRjz3L466zD+7kq2Qe/6cWo
	jh5zDk5r0ZxzF2r8ZA4DP9LYbmLbNdM8PMX7hbM144W57rV3vdanbjF0S48YNIYrjU4EfE1j+eGaU
	Am9PFB3IuV/RNsKhUuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUQa-0000000GCp9-0A88;
	Wed, 11 Dec 2024 21:39:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUQW-0000000GCnb-1JBN
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Dec 2024 21:39:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30219437e63so11971381fa.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Dec 2024 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733953162; x=1734557962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDpO8QRKSrhxInawg6iB7aAV8UI5ptwurUWyv3YKDbc=;
        b=BS7Fdg7QN5vNHn8lPOhcGRJMYKFc8ugvj9nTqEc06Lkt0/7+dh2n4wG/Bhe/qCRUOy
         jZD7Em6ky0cF0Vhw7w4vL1aws/eghGQa3WQUfUPKjchzff8YeIo6gv6HiOZbsNSqtfcN
         IuidP/9rfE95dpQr31QWVNw+oYmi/WftPECiYGy78p2gPpv+Nctiq6W584k4rHolrV8i
         X+rv81tbzNDUINHBqt6wm4gVvMCuujm89sXSN8C1Ph7re5xgCwxJVrpSn1LWmyIH6uqB
         Sa0toVnh3owKh3L4/w9h+gvzMBSMcMT0fjNboL7szUsngtxUhUeqtdeOTqh0YvHKLBeU
         AkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733953162; x=1734557962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDpO8QRKSrhxInawg6iB7aAV8UI5ptwurUWyv3YKDbc=;
        b=r5ZXqnzHigNvSa+TkIs+Qa6Rz5fX+N0VtUFZPYhQ/DrtH9z0QGCeEhSkxVfLBORbAQ
         cL5bcl8IN62p0BQrvE5WJL+8jseHLjnITqcoVFtwhhIWBwVsIE/CUnkGRF4zTfNQ0A59
         rsDPSd2bYq+asSOS0Nt2R4eIeBjLCmoT8jjaQhwqM5X6pBLtK0vcNArm9duVTTo3Vcla
         Y0gWp92t75eSUi0e9tXKbyFuQtv1ncz/SyIIELuwLlf2ShAFM9zL+HI9vp8BZXajKygC
         hWeo8uj7JSZHWl+WkfmiZ4iwB8jZEuZ2wVilHcuwWM5lc1lh1rPzUuwkreN0TONAWymN
         sRbA==
X-Forwarded-Encrypted: i=1; AJvYcCUTI+pMZTRky5g2gfotXp0kwL147QWJGFY+IBEigC+NUZpM820Lg30kX5eDbBkpkUGr35IPL5CZYZySvdrE@lists.infradead.org
X-Gm-Message-State: AOJu0YzWVj1qZ1ZAMBm8CCNVDe57gsRxmj9anCZlVEJWJ/pK/njIIAgx
	JgzlgQKkV5j0mgwJ9v9DcWXIwd14BNiV3FaLBY1Uy6TZuQwLwuuKRiFIb00znNw=
X-Gm-Gg: ASbGncsCut++TOxOKjDRRMQ7FwL7BTpjiYDf8wjFE9wHv9ILPVnRKkHn1pkBp1o1kdi
	aZY6kTcb9ZKVDXLU38BZi8wADLhjdLKk0SV7Ou9n0DLd19g+Fb+A/zvvufRJYT5vKMIck1J9Ygu
	eqiToGR6mPhMkrn9YbRLDytB/S7vI2pK6fqNOcaIPLofmB7R75novce+mn0b+wWG0aLzLxslGLw
	n7cc5Ff7IWfIpHlqOsrET79v+jf8ZyHSCtbJMHZetoDd8wNHtps6RGzsBGbn+5GuKWp8ZKWBxM3
	xpmSJyZIQmdg1QkmzjDgIDpszi61gkarJQ==
X-Google-Smtp-Source: AGHT+IEOt4HIvzifdLCP3vt6tvdn0+DmYG+k9uGFplaWP19t7GtD1er9r2IS8lIHB30alIfkyzyt9Q==
X-Received: by 2002:a05:651c:54b:b0:302:49f7:1d72 with SMTP id 38308e7fff4ca-3024a5fa7d4mr2138761fa.9.1733953162278;
        Wed, 11 Dec 2024 13:39:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-300419ae090sm14289721fa.8.2024.12.11.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:39:20 -0800 (PST)
Date: Wed, 11 Dec 2024 23:39:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
References: <20241211142806.1824961-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241211142806.1824961-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_133924_407747_A0E58713 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, Dec 11, 2024 at 07:58:05PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> ---
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 066d24ee3e08..7752adff05c1 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,4 +1,7 @@
>  kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
>  kms_cursor_legacy@torture-bo,Fail

Interesting, DRM_MODE_CURSOR_BO tests fail

>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index 6dbc2080347d..581d0aa33b4f 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

This is a bug in 5f7cde6a9878 ("tests/kms_display_modes: Skip test if
joiner display is connected"), the driver unconditionally calls
is_joiner_mode(), or in 88abc2d2c646 ("lib/igt_kms: Add is_joiner_mode
function"), the is_joiner_mode() should return false for non-Intel
hardware. Please fix it in the IGT instead.

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> index d74e04405e65..5122233b9941 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> @@ -18,3 +18,10 @@ msm/msm_shrink@copy-gpu-oom-32
>  # IGT Version: 1.28-g0df7b9b97
>  # Linux Version: 6.9.0-rc7
>  msm/msm_shrink@copy-gpu-oom-8
> +
> +# Board Name: sc7180-trogdor-kingoftown
> +# Bug Report:
> +# Failure Rate: 50
> +# IGT Version: 1.29-g33adea9eb
> +# Linux Version: 6.13.0-rc2
> +kms_lease@page-flip-implicit-plane

Do you have a failure log?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index 6dbc2080347d..581d0aa33b4f 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

Again, the same IGT issue.

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> index fa8c7e663858..69076751af24 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> @@ -1,4 +1,3 @@
> -drm_read@invalid-buffer,Fail
>  kms_color@ctm-0-25,Fail
>  kms_color@ctm-0-50,Fail
>  kms_color@ctm-0-75,Fail
> @@ -19,6 +18,8 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
>  kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
>  kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
>  kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

The same IGT error

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -28,4 +29,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>  kms_plane_cursor@overlay,Fail
>  kms_plane_cursor@viewport,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> index 4892c0c70a6d..8d26b23133aa 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> @@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
>  kms_cursor_legacy@torture-move,Fail
>  kms_hdmi_inject@inject-4k,Fail
>  kms_lease@lease-uevent,Fail
> -kms_plane_alpha_blend@alpha-7efc,Fail
> -kms_plane_alpha_blend@alpha-basic,Fail
> -kms_plane_alpha_blend@alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@constant-alpha-max,Fail
>  msm/msm_recovery@gpu-fault-parallel,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> deleted file mode 100644
> index c1859d9b165f..000000000000
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Board Name: sm8350-hdk
> -# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
> -# Failure Rate: 100
> -# IGT Version: 1.28-ga73311079
> -# Linux Version: 6.12.0-rc1
> -msm/msm_recovery@gpu-fault

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
