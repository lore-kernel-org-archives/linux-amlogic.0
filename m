Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01FFE7717F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2024 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=na7fupSsBfqlOqtehvZGDEblnm+84+b9t4yD4Mwgb6E=; b=SxeEv5P1r0GAB/
	c/2ax3eS3UZKpBX9dazsE33wvBKtxR+ICFRxYp+fHFwqd9MJpf6uNfPN4uLgTeG+aFgK6z9mkLY/X
	/guMj6eBqoqviHYrfl1179dFyK7mQRK1Tf70jdReBbngU3vjQ5uDqrcUnGC0jBVzO3whJ64ioO2SE
	WO63dLnVP5ks3i5mxUTVYdt2dOhvepF/2/ygcSDtkf3XKIqInCqpe1Kj6aJ3RtZhvJwxjWfAsdyaF
	fbWo4w2jpd4VYqgb41ddhzIPxnV2cqpF3DZs7Rl8XSa9fg5rP6LZh2BJ3RNn8M7TRG0Cy9uBh82O+
	/Wb0A3NL2hahfKolbNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLf4Y-0000000HPJe-0O9j;
	Thu, 12 Dec 2024 09:01:26 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLf4V-0000000HPHl-0Apc
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Dec 2024 09:01:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso1579341e87.0
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2024 01:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733994081; x=1734598881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V9TiYS4KmaBT6zbP9iM8l86SrBTAKM/ReGWqOBeJ8zc=;
        b=ItNe/MjPIUdTyRQWKVSIhmeyIk3ge5loUvsr6abQhc1mR62R4NuvExiT4Ps3iKOrQq
         CQHW92gF1Ho9ATDkFD2CSREFahUqDFdVOtRD7WNlj6d4jS7R2hh8d1ppt3A0kRH4p0MM
         ZcvQz40Z4SBxeeDa8W4QRHcJoaVnHZprg08ESSUnbe/6I5LavgJ1tQpbU0vYXLN3jQyg
         z9vnHz22RGCPAHLVbBw4drIMgfEiaEPdAVSz9xBB8JLhfF6Xk64IhVrNLmBEzRdl2yF1
         s/Qu0+/1qq3OiLp0MsbzMnuZSdH7Z4joS7DjDLefNojH+U1w0ap1C6s4tbxlfHlTlRQT
         crHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733994081; x=1734598881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9TiYS4KmaBT6zbP9iM8l86SrBTAKM/ReGWqOBeJ8zc=;
        b=k2TuKpwBo2W0/oVtz+jWHprqJJ/g/DqBzkX0zpn//DiWIiJaBFTmy11vbZGhIRV1j9
         ctCBM2RMaYSFw0iR/ctWVLcE8B6kal7bV9kJX5Mf02su8PwfNlflR2X5Z6vcUKlvk9xH
         LrMqxgzHFfIbGijnGimG6HbRPFZ+EUY3VaKywTvNJzMM7304JHf7X4y5iSIU1ZXY9l89
         js8U8inzDoIyjfi2T6Ppy4ed6q8CokSl0ET/PR+dzr58xJOuNdGismOadhCEcKbGH2ud
         B2H+LxtiFvvWItc47ti56DPmAjE3TKB0t81N2FbuLSY0leufV/o0LsGlMBRcre3m+tHs
         Ia1A==
X-Forwarded-Encrypted: i=1; AJvYcCV5lEm/JnV2ldc0JACeqGLZFMl9CxcJ83ZYUQMBX7ZQ8jigm3OCP/ghRy3DstW0e6fQF8vXfLTRS9DV3Iow@lists.infradead.org
X-Gm-Message-State: AOJu0YyjORnB/+wxVySjVhw3Ouhd4EaaYn14FfsNKwPqmae1eK7I4Gd9
	hrN/Y9Af/2odyXL52jSOgK03C+l1S6Jo1J5QXYf/cVJ0z75oKZisthaWNfYoBRk=
X-Gm-Gg: ASbGnctL77a+zOvYUakT4s2rutP0SKoJtWkOfwo7qErWtw16htUDFlh9C/vC7Frzixp
	h/DqAyv+CHmWuAjf4Q54OktO0w4hQ+UTKCG75jF5WS1VGyThtFel+9A1qtWJZVQOAhXWOeGACob
	RKhu3k9mn2uZwAbw72wXowl/SYqdWQ/ymN42a80UaI5ymtw0SN7+kmLTguSZNXMdSqKQ4iz3pHY
	84CqhE1jwWy6mevOb2JLDuenrApMayVhqsVx58wrtbDDj5dpRHeqDfcDMl5/xi4ePChlxQv+SnD
	/auSrSHUTg/Ezx9Wy6YgVM54d50NpuukKG/E
X-Google-Smtp-Source: AGHT+IHhrzxQingAH1/ImMh2/INtXiKEWN+68GziFuYfWDP98tpJWX78ikqP9dctbaH1rrrlMK66Bg==
X-Received: by 2002:a05:6512:3056:b0:540:20c5:f847 with SMTP id 2adb3069b0e04-54032dd7f6fmr166941e87.22.1733994079461;
        Thu, 12 Dec 2024 01:01:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f39c826a2sm1608722e87.214.2024.12.12.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:01:18 -0800 (PST)
Date: Thu, 12 Dec 2024 11:01:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <auyavxigqqk3eq3ke775pv5cf4pwu3mdxmr5bfx2dybjnszseg@5rla5d7icwxk>
References: <20241211142806.1824961-1-vignesh.raman@collabora.com>
 <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
 <3e719a95-5b84-4530-9afe-c742e5c6eff7@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e719a95-5b84-4530-9afe-c742e5c6eff7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_010123_076373_57D52C7C 
X-CRM114-Status: GOOD (  23.35  )
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

On Thu, Dec 12, 2024 at 11:36:29AM +0530, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 12/12/24 03:09, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 07:58:05PM +0530, Vignesh Raman wrote:
> > > Uprev IGT to the latest version and update expectation files.
> > > 
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > > 
> > > v1:
> > >    - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
> > >      Will update the flake bug report link after v1 is reviewed.
> > > 
> > > ---
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > > index 066d24ee3e08..7752adff05c1 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > > @@ -1,4 +1,7 @@
> > >   kms_3d,Fail
> > > +kms_cursor_legacy@forked-bo,Fail
> > > +kms_cursor_legacy@forked-move,Fail
> > > +kms_cursor_legacy@single-bo,Fail
> > >   kms_cursor_legacy@torture-bo,Fail
> > 
> > Interesting, DRM_MODE_CURSOR_BO tests fail
> > 
> > >   kms_force_connector_basic@force-edid,Fail
> > >   kms_hdmi_inject@inject-4k,Fail
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> > > index 6dbc2080347d..581d0aa33b4f 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> > > @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
> > >   kms_color@ctm-signed,Fail
> > >   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> > >   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> > > +kms_display_modes@extended-mode-basic,Fail
> > > +kms_display_modes@mst-extended-mode-negative,Fail
> > 
> > This is a bug in 5f7cde6a9878 ("tests/kms_display_modes: Skip test if
> > joiner display is connected"), the driver unconditionally calls
> > is_joiner_mode(), or in 88abc2d2c646 ("lib/igt_kms: Add is_joiner_mode
> > function"), the is_joiner_mode() should return false for non-Intel
> > hardware. Please fix it in the IGT instead.
> 
> Can we add this in skips mentioning the IGT gitab issue link?

It's fine with me.

> > >   kms_flip@flip-vs-modeset-vs-hang,Fail
> > >   kms_flip@flip-vs-panning-vs-hang,Fail
> > >   kms_lease@lease-uevent,Fail
> > > @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> > >   kms_plane_alpha_blend@alpha-7efc,Fail
> > >   kms_plane_alpha_blend@coverage-7efc,Fail
> > >   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> > > -kms_rmfb@close-fd,Fail
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> > > index d74e04405e65..5122233b9941 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> > > @@ -18,3 +18,10 @@ msm/msm_shrink@copy-gpu-oom-32
> > >   # IGT Version: 1.28-g0df7b9b97
> > >   # Linux Version: 6.9.0-rc7
> > >   msm/msm_shrink@copy-gpu-oom-8
> > > +
> > > +# Board Name: sc7180-trogdor-kingoftown
> > > +# Bug Report:
> > > +# Failure Rate: 50
> > > +# IGT Version: 1.29-g33adea9eb
> > > +# Linux Version: 6.13.0-rc2
> > > +kms_lease@page-flip-implicit-plane
> > 
> > Do you have a failure log?
> 
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68026461#L3262
> 
> Let me know if I can create a gitlab issue for this.

Somebody will have to look for more details, this one isn't that
obvious.

> 
> Regards,
> Vginesh
> 
> > 
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> > > index 6dbc2080347d..581d0aa33b4f 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> > > @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
> > >   kms_color@ctm-signed,Fail
> > >   kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> > >   kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> > > +kms_display_modes@extended-mode-basic,Fail
> > > +kms_display_modes@mst-extended-mode-negative,Fail
> > 
> > Again, the same IGT issue.
> > 
> > >   kms_flip@flip-vs-modeset-vs-hang,Fail
> > >   kms_flip@flip-vs-panning-vs-hang,Fail
> > >   kms_lease@lease-uevent,Fail
> > > @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> > >   kms_plane_alpha_blend@alpha-7efc,Fail
> > >   kms_plane_alpha_blend@coverage-7efc,Fail
> > >   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> > > -kms_rmfb@close-fd,Fail
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> > > index fa8c7e663858..69076751af24 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> > > @@ -1,4 +1,3 @@
> > > -drm_read@invalid-buffer,Fail
> > >   kms_color@ctm-0-25,Fail
> > >   kms_color@ctm-0-50,Fail
> > >   kms_color@ctm-0-75,Fail
> > > @@ -19,6 +18,8 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> > >   kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> > >   kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> > >   kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> > > +kms_display_modes@extended-mode-basic,Fail
> > > +kms_display_modes@mst-extended-mode-negative,Fail
> > 
> > The same IGT error
> > 
> > >   kms_flip@flip-vs-modeset-vs-hang,Fail
> > >   kms_flip@flip-vs-panning-vs-hang,Fail
> > >   kms_lease@lease-uevent,Fail
> > > @@ -28,4 +29,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
> > >   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> > >   kms_plane_cursor@overlay,Fail
> > >   kms_plane_cursor@viewport,Fail
> > > -kms_rmfb@close-fd,Fail
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> > > index 4892c0c70a6d..8d26b23133aa 100644
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> > > +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> > > @@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
> > >   kms_cursor_legacy@torture-move,Fail
> > >   kms_hdmi_inject@inject-4k,Fail
> > >   kms_lease@lease-uevent,Fail
> > > -kms_plane_alpha_blend@alpha-7efc,Fail
> > > -kms_plane_alpha_blend@alpha-basic,Fail
> > > -kms_plane_alpha_blend@alpha-opaque-fb,Fail
> > > -kms_plane_alpha_blend@alpha-transparent-fb,Fail
> > > -kms_plane_alpha_blend@constant-alpha-max,Fail
> > >   msm/msm_recovery@gpu-fault-parallel,Fail
> > > diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> > > deleted file mode 100644
> > > index c1859d9b165f..000000000000
> > > --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> > > +++ /dev/null
> > > @@ -1,6 +0,0 @@
> > > -# Board Name: sm8350-hdk
> > > -# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
> > > -# Failure Rate: 100
> > > -# IGT Version: 1.28-ga73311079
> > > -# Linux Version: 6.12.0-rc1
> > > -msm/msm_recovery@gpu-fault
> > 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
