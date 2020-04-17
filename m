Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D00FC2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 15:08:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D63521924
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 15:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzRG98Rp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="W8XbGSMa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D63521924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxrDlthOq22HOrsEbD3S2VKuHhGoYPUEqLKiZme61jg=; b=HzRG98RpwJhZET
	SPxy5VOX5pxZyIlXmmvZpWv21dPKAxwfCFbyCZj6W+cxgJBhxIpjJH9BYyYd2Jg/c1WCgX+EolnCF
	+GLlhNNF+kp7B2WwGl1NgNMt5P1Ech7MTp0rrkFdZp1P3lMUn21Sol4/JgpA1HDPGy9ux30t8z/j9
	KocY7FiOMbVeC7L1bjXXAn8mjJmMLwLC/PtWTkLgJEM3piicDajdTpJZZQMoFQ0PoyehQPotom3ji
	1SqbqN/LI3G+Ku+6E75mrzM4tCwUP+N5YOEgMnHJDVbj5Iko/wMs1WdrYeI2BM4i+OqZeJ0rqtMar
	oG9dq1t4zxWAZbTC50qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPSbm-0002N5-HU; Fri, 17 Apr 2020 15:08:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPSac-00017u-02
 for linux-amlogic@lists.infradead.org; Fri, 17 Apr 2020 15:07:36 +0000
Received: by mail-wm1-x342.google.com with SMTP id g12so3354774wmh.3
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Apr 2020 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rUsEOWcAvFI1LhmxsMY2a1aelPmLjYCMdOuX/AykuqQ=;
 b=W8XbGSMaun0zeoA8+/rTue3oyunGjJ8y8t1sqAjRYfl2ZjbJu7x1v8CbcoQ2PXclqN
 jHizuTlK37ShCu5D3pAd9a2PZ6tX7bUa7Sm/9v5VHQKGkMpfm/wFbGc0IUPQdVXgEus7
 6L0SjeWPa0EFheYB0mTYZ9OWzgz479sg+VgK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rUsEOWcAvFI1LhmxsMY2a1aelPmLjYCMdOuX/AykuqQ=;
 b=t4Shy8i5wPU2O+oy277IW2mFL6rqIEtncGhZi7var4ZTxbCs5o2TcIvOWuyv8EXSXJ
 Zs9gSCCCF3KdAXD+TFd7i/8nxr1+HnJ7PwojnwuSo+S8pwBPs83vFVtRiRyG+SEOSQNa
 graVJknuDqxHI+zKWuGiIfUWRBbh1r/umonkE83bstoQPopgAi6Zb6IrKBuK3++Nse5W
 BZzdrlPv3mTlZgdQqKDn2O+LX6N1V687J6lZ2uOEIbDD3bqPVBYxnWhAg56dXIvFP25U
 9+LsN5r7ZXrzAqfCXT/SMQzODrcPRkpJNjuJh7BcFeXC4gBGhSbCpt4lWH3thE+ooU3D
 DSOg==
X-Gm-Message-State: AGi0PubK3vIGu7AQlaqfvnR7h7AxZzJdh/yXJuxptHDugO3mczsFkeOg
 SEQ70nsnYPfof7ezSRlPqGiVpw==
X-Google-Smtp-Source: APiQypItQkdmBtoPoPH/+hxfLHTGNVt03vOKK3QD/jt5bfi7N0gV8HkoQH1eX+9YKTT2bj2qlCwvYg==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr3795237wml.20.1587136052084; 
 Fri, 17 Apr 2020 08:07:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y18sm8934564wmc.45.2020.04.17.08.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:07:31 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200417150729.GP3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416152500.29429-2-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_080734_492754_BB3EE241 
X-CRM114-Status: GOOD (  20.92  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 05:24:53PM +0200, Neil Armstrong wrote:
> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
> 
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
> 
> The underlying storage is considered to be 3 components, 8bit or 10-bit
> per component, YCbCr 420, single plane :
> - DRM_FORMAT_YUV420_8BIT
> - DRM_FORMAT_YUV420_10BIT
> 
> This modifier will be notably added to DMA-BUF frames imported from the V4L2
> Amlogic VDEC decoder.
> 
> This introduces the basic layout composed of:
> - a body content organized in 64x32 superblocks with 4096 bytes per
>   superblock in default mode.
> - a 32 bytes per 128x64 header block
> 
> This layout is tranferrable between Amlogic SoCs supporting this modifier.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..a1b163a5641f 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -309,6 +309,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>  
>  /* add more to the end as needed */
>  
> @@ -804,6 +805,44 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
>  
> +/*
> + * Amlogic Video Framebuffer Compression modifiers
> + *
> + * Amlogic uses a proprietary lossless image compression protocol and format
> + * for their hardware video codec accelerators, either video decoders or
> + * video input encoders.
> + *
> + * It considerably reduces memory bandwidth while writing and reading
> + * frames in memory.
> + *
> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
> + * per component YCbCr 420, single plane :
> + * - DRM_FORMAT_YUV420_8BIT
> + * - DRM_FORMAT_YUV420_10BIT
> + *
> + * The first 8 bits of the mode defines the layout, then the following 8 bits
> + * defines the options changing the layout.

None of the modifiers you're doing seem to have these other 8 bits
defined anywhere. And it's not encoded in your modifiers. Can't we just
enumerate the ones we have/need and done?

> + *
> + * Not all combinations are valid, and different SoCs may support different
> + * combinations of layout and options.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
> +
> +/* Amlogic FBC Layouts */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK		(0xf << 0)
> +
> +/*
> + * Amlogic FBC Basic Layout
> + *
> + * The basic layout is composed of:
> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> + *   superblock in default mode.
> + * - a 32 bytes per 128x64 header block
> + *
> + * This layout is transferrable between Amlogic SoCs supporting this modifier.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)

This is kinda confusing, since this isn't actually the modifier, but the
mode of the modifer. Generally what we do is only define the former, with
maybe some macros to extract stuff.

To make this more mistake-proof I'd only define the full modifier code.
Definitely don't add a #define with the DRM_FORMAT_MOD_ prefix which isn't
actually a full modifier code.
-Daniel

> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.22.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
