Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C2CC25B79
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjG0sJ0JiI096X5mjF7sCUD5rbSr9CvR31JafrLjOW8=; b=QpsJtcG3zezHQR
	0JnBx1+XK9vVQa2Dw9Y0AcVyoLCbrZFgEyeG78jj0bHJNqJPMmgsavRClDZ291ceCiaKgjRfUVDUL
	8/T+gX0muTEVIkz8Q8XSvCiQbWZPIT7kY0Po82TtttFMuqjnwkpB5L0u16PaGS2u4tz6xdP3Z9cwb
	XgVqr7xqlccJr+KaU0gVGGpaKKEZ9r0ob2uhkSVbFRTGFjn8EJkwEhY3dhMoh3a0YhYUwxv/JiUQi
	+PA+8i4oDMOGInpmM+qGJlCfifB/XjDZrk9bEqHEhMVJqON8SOrS7bIrvX6maxGQzsRoui9+aYiOY
	kJ+95I+HMCP7ztyJN61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5F5-00000005mlu-096B;
	Thu, 23 May 2024 10:00:11 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5F0-00000005mf8-2Tc8
	for linux-amlogic@lists.infradead.org;
	Thu, 23 May 2024 10:00:09 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dcc71031680so5786710276.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2024 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458387; x=1717063187; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4eLg5W63v6nyWYGdaPlQGL+64DpELLePyMxWT5qrNUU=;
        b=LHlbMoN2BMkR1zqM2oMj9WF2LORnlpSE6g9qflAr3L27IKc8eKpfyOAN5KdOvlrIY/
         7oTScg6zIU/QH8E/MJCH/vEGq9S8UUTPMSpcJV9qfy8tsLUczohxNsYGYqgwOVtzVy01
         Xfbumzsj57L26tMP8LVodh172Rosv5FoihT79+n9s77EAUKyJ237v+2bF11eXYQdA8kW
         08TmR+voAYDHl4KGtSyAAcVhaZmTxNEkTlma97wAjCAfw5xcwDXtdlQcnyT5b4h/oLp4
         hm+cyg4pvPXj1YK6ZHaLKt/3cf3Jv0xr6J+35EYpyASVBVbZuKJuReaw5nO18Xc7+gyx
         IOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458387; x=1717063187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eLg5W63v6nyWYGdaPlQGL+64DpELLePyMxWT5qrNUU=;
        b=IaxgCGrgTo2209zooVUGHZxz2LrQGkXRhQS8vUgsBCX0/qmAnQ6TKj5l9Fvel+9zJY
         ejcSKDDpP5VgauQDPw25g+rctRg5pZrOoNCJFi7w/rPUDOEqtIPH9xMgHFs2g+EDNqJL
         hxyLH7rkA6Mg6+LTjWdnuwItLPNqusTPhWpfVsKddEB21ti+Apjl2dTKPSamgSYRL5BJ
         WxogzcDdUI9AT3w1WMJm/3dvEVtnbeJ83vIbZ3ReM0M8q34/nSfQAw1R+oaXElIk26an
         yHtL8Ir5aq8XVmZSnmcLxofKqnl6plgrovi5xj+vrox6uzISO/7e9u2gqTNw4M4z6Z1K
         1Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCVjUoszvt7loeF+d+asPMPguK+dBwWc53UFjk79n5+H1vhGLJ5Xqac6SQOx/EaPBCbPboSN4g4d/lkO/8arkL+LDF6APER9RVvExrpoZq/tThA=
X-Gm-Message-State: AOJu0YzWGQqQb5kN5k7zoDF/dVISQp28S55jhtagOFgkeRZWBLdkwKS0
	xfH2CMQsMkt6uA+TB/XCsiDVgNg+Km8gjoc7tGXLOcPbP2tBuXgLb9YiVCz0fAjkWoetb4cQ08M
	HSVvtLBjeKKoVqrOSELDbLvmXuxRPpg5tipGCKw==
X-Google-Smtp-Source: AGHT+IEH2bet0vxbyQkGUI55R017CbgvtHVbrVup5m0zjkPeCkh3N7ZUjMndzd5BhJJAs4TMZp+oQ52G6r3Sss4urHM=
X-Received: by 2002:a25:b181:0:b0:dee:607c:3528 with SMTP id
 3f1490d57ef6-df4e0a9cfa9mr4821493276.3.1716458387642; Thu, 23 May 2024
 02:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com> <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
 <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
In-Reply-To: <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 May 2024 12:59:36 +0300
Message-ID: <CAA8EJprVVkQO7aPkehwL2zhYkGRkm4Foc13ErfuY6ikBA_4nLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, david.heidelberg@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_030006_668557_B7D5985C 
X-CRM114-Status: GOOD (  23.73  )
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

On Thu, 23 May 2024 at 09:07, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Hi Dmitry,
>
> On 20/05/24 16:13, Dmitry Baryshkov wrote:
> > On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
> >> zlib.net is not allowing tarball download anymore and results
> >> in below error in kernel+rootfs_arm32 container build,
> >> urllib.error.HTTPError: HTTP Error 403: Forbidden
> >> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
> >>
> >> Uprev mesa to latest version which includes a fix for this issue.
> >> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
> >>
> >> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
> >> mesa-rootfs, update the variables accordingly. Also copy helper scripts
> >> to install, so that the ci jobs can use these scripts for logging.
> >>
> >> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> >> ---
> >>
> >> v2:
> >>    - Uprev to recent version and use id_tokens for JWT authentication
> >>
> >> ---
> >>   drivers/gpu/drm/ci/build-igt.sh   |  2 +-
> >>   drivers/gpu/drm/ci/build.sh       |  6 +++--
> >>   drivers/gpu/drm/ci/container.yml  | 12 +++------
> >>   drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
> >>   drivers/gpu/drm/ci/image-tags.yml |  2 +-
> >>   drivers/gpu/drm/ci/lava-submit.sh |  4 +--
> >>   drivers/gpu/drm/ci/test.yml       |  2 ++
> >>   7 files changed, 44 insertions(+), 28 deletions(-)
> >>
> >
> > [skipped]
> >
> >> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> >> index 8bc63912fddb..612c9ede3507 100644
> >> --- a/drivers/gpu/drm/ci/test.yml
> >> +++ b/drivers/gpu/drm/ci/test.yml
> >> @@ -150,6 +150,8 @@ msm:sdm845:
> >>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> >>       GPU_VERSION: sdm845
> >>       RUNNER_TAG: google-freedreno-cheza
> >> +    DEVICE_TYPE: sdm845-cheza-r3
> >> +    FARM: google
> >
> > I see that this is the only user of the FARM: tag. Is it correct?
>
> No, we need to add FARM variable for other jobs as well.

Why? Even if we have to, we don't have them now and the change doesn't
seem to be related to the uprev'ing of mesa. So this probably should
go to a separate commit.

>
> > Also we miss DEVICE_TYPE for several other boards. Should we be adding
> > them?
>
> Yes, device type needs to be added for msm:apq8016, msm:apq8096, virtio_gpu.
>
> I will add this. Thanks.

I'd guess, separate commit too.

>
> Regards,
> Vignesh
>
> >
> >>     script:
> >>       - ./install/bare-metal/cros-servo.sh
> >>
> >> --
> >> 2.40.1
> >>
> >



-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
