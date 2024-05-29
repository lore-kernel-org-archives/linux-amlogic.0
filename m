Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC0C25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyYMB7co5iYZQsRZkSTs5oZutVwJbEEnnIeTEjXfLM0=; b=p7RtazcA7kUU5A
	MDN7qMVpCGkaC603/MaY+UJCka/VK/bK/aYBTD7bAw19b8dP3XnJuwabLK5TbG5G566aBvezXuoGo
	ag+f57XslFF3DHeg+Isy0h9xtKnsC9CUjWGsTpsOMNGnCytH4xfEXKDg+cQ0d4OZHCuQsEJnjchZ5
	yP4hYAV8EjY/J81Y1YkUcM42klaJSYrl4N0ZTYywIzTiURaL+7s+wnAmmQLYjGNqMncTiQAg2hpgf
	B0+gq7VGzNkeFdPEQ7dOp+CKEPYW2EnGjvVVIi/9t5PmYOsaBY3uFB/FIshB5JZm4y07CBhIcbOWy
	eS+6lC1RvUYAIX19E6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENr-00000003Iaz-1D7y;
	Wed, 29 May 2024 08:10:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENk-00000003IUJ-0L78
	for linux-amlogic@lists.infradead.org;
	Wed, 29 May 2024 08:10:05 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-529682e013dso2086976e87.3
        for <linux-amlogic@lists.infradead.org>; Wed, 29 May 2024 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716970195; x=1717574995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=OO07Fuvf61OoDPVRqYGj7bgtRiJzgNdxdYegvrqz5eau/vreEA5cJNJh0X6i44JBaW
         eHvmNjnYW+2Z8TH/iiig4kBZyLEYC1BZJ7xE0dn2c2x6fjjoxhd4dde0e5qKJRNEwdbQ
         K5N8KFZNuulmtBwGPsjXojzxkWqBLpif6Pixt7nvOy/kTpDUA/hmyqwL8wtye5ASLIP7
         KaJC6HYy8nDqG/Zdl9uZ1lCg+DKH59oIxQPUATunvdSnsA8LLbf4o1pQYByZRPtoc5IR
         fzcb6K1x/wk20DfzdetukeHgXhMrL1DB4f9mnB8uRNI199Bw2UDpOeDFO6mgT74SD7IB
         X68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970195; x=1717574995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=WIhM01ju8AhxL0fiJz5tspFn8P+Ea3fs52gxiPghfloBDfoJWsWZxvk1XFXL/wZAhF
         6JPqc3+hAJv5j76E34Vqnk1iXlQ1OLO3H1vy6JMDpJcyTXvPwzfjRFxomypmcmdugOaO
         bXKJa/bYUx6dau8C50V17ISkmnZ5Qr4wyn8S+D/yFBMfemZ6I0K6XLRWGtDMikbjovfI
         2BQbJIApFVaWxvZpdDOUXRKC1yVHGR5C58W8KTd3WP0OE90of9s+xL0OvboEcLlLtzLt
         uZk4UK3mq7mUAfEayCH0aR4+ZFynK3GQ/rg7KtsQzjeLJP40S5asZ/yoJCINfRdTdInQ
         S0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWg+5pxtueIq6REcDJ2iXXqvntm8FDQmXDA/IUObR9+IjTIzKXdUFjzcb4uH0wNE/11NcQxwoJDKsfEZ5sNqmq32l75wyzvF5EZQxdpSbS9jGU=
X-Gm-Message-State: AOJu0Yy7vUWxM9OgiqO7HDh1C2PyzWtQqul0kYY6d3NoMwWbwk9W6xxY
	sa+I1HZz8j4721wr5p5pJ8T7zblyUaQse5/KHZ4imqNplzHPKchBqa2XPXnMKbY=
X-Google-Smtp-Source: AGHT+IHAAOSe1YF9ohma3qLilcNBhTgUrp5XW+R17Dfxhf/XQBKuTb9CXtbrrq9LBMBwT336LwrXXQ==
X-Received: by 2002:a05:6512:3128:b0:522:33cd:64bd with SMTP id 2adb3069b0e04-52964aba466mr8988769e87.27.1716970195416;
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529aa049e3csm859093e87.167.2024.05.29.01.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Date: Wed, 29 May 2024 11:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
Message-ID: <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011000_188638_96307E9A 
X-CRM114-Status: GOOD (  17.81  )
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

On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets. This is fixed in igt-gpu-tools. So uprev
> IGT to include the commit which fixes this issue. Also
> disable building xe driver tests for non-intel platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 
> v3:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>  drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index b7d2a49a6db3..eddb5f782a5e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>                 -Dlibunwind=enabled                   \
>                 -Dprefix=/igt"
>  
> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
> +fi
> +
>  mkdir -p /igt
>  meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>  ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8f32de63d92e..1b29c3b6406b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56

Let's land this, then I'll ask to uprev to
dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
writeback tests on MSM devices.

>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
