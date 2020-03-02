Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94CEC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD45821556
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flxQhzzO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lsg+52eW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD45821556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPF6dEaLO+K/jInUpZkJcnI+eiFf65Y3/vrvTN8zkv0=; b=flxQhzzOPdzdEL
	m0IcR+tBiybwqLS4fDHfMI/uDtqbONjZL5XR90rxubm8l30tnTen0kwKL9Pq3Ky+hw5HmzfgYj64R
	GY2XJiyMrHj9D/3U1mQ5vEYVhNZEi4m0cxTvjbRoZpLFwPICTPsnsc/3SKsM3/xnciexJbUhWT69J
	labj65VRz83JQp8wL7wlt0+sxyjC+zsWsnHl/SNMI8ys97gikt9671nKoY1N9sDX9IpAAYuGd6UJj
	Zt7weeLFAwId2rzMaMpbunCqJ3B7s1TGX1F58VT9Fb/Jw/IdZs9R71dULr/btN1qTThYjgYsYpQqY
	3RnGTy21b9goL3Z2LP0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nwB-0004Em-2q; Mon, 02 Mar 2020 16:28:59 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nw3-00046j-Db
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 16:28:54 +0000
Received: by mail-wm1-x342.google.com with SMTP id m3so11275613wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUd/Div/Te/3bRQgmH3YEsXKnQcbUcpguyRKLSpxNRQ=;
 b=Lsg+52eWcC89f3lIuRvPAF3AR8KUI89Rwy0zf4GFj4oJo2V2+P2MJRrvstxx+bZIpe
 v6QeEYN+OX6zN9iI4NcBGTUUfYlwK0JuGRjO8elK8eW7RuSyQvhHtgEVe27wYKbCOKDx
 ureNAk+pyJmNGVZWrdOK7HbJEAxk5K3e+Fb5EtbeyjSPC4MZeKNObnBW9MzAL+qMzEPd
 A/fkoQn1G8PfALnJLdF9YWpSkvs+pr07A6p2DtMo0Guqd8TmrnerkBTqjfhaRc+f8BK3
 RUKSVmaBQN7Pp5En76rnSKCsDcQwawIaLIqIMiClnEbDwJK68mlfC0kI3gfSqrhUoJo/
 LhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUd/Div/Te/3bRQgmH3YEsXKnQcbUcpguyRKLSpxNRQ=;
 b=nsRRzR1b8WgyAqHS2dlC+FY/L7LwAdktqOElDVBQHGXREyaH7DsQCEowRf+HelKmlV
 jjmWFhR5ZOBTlbavzoYFmD40PDqX9K0H/OuLmi0tibGkCf/f/nfsXtAn+WV9IQ917phU
 UiBhnZei5XtyFBxIB/QDdA99oNIcelCIarHZnw/3UeUtzXlYUB1YlMoW/i1+WN16KKUl
 EqygQaHvwnO45RN+pSdvIOpAUxWFTy/ZNQyroHKT2I+flKKSAcbI2BsvbLnnTDnJvHkn
 3TXDuXhk2AbtUkbPS49NOy8/qz9ep4E6UjIKLipcCPMBgSLrEWqteZuL7TBz3xRi8yj1
 xG8Q==
X-Gm-Message-State: ANhLgQ3CNbV11WlvXFID+QJaMGHwBMbyhCGX8i9alusCLDTG6zpE23dC
 WgzgP7NYtOKUqa+LYGXkcMcV7UaynF7jsowPqS7jeQ==
X-Google-Smtp-Source: ADFU+vtgykJMdwMoKZl8rgU+WTQDv1XCjvm8XxyPIKNq2gxNvI3sJHV0y+M8KB4Tps+/2PYqPRz/EHCEvF0HkKHUiTs=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr213294wmk.83.1583166528840;
 Mon, 02 Mar 2020 08:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
In-Reply-To: <20200221090845.7397-2-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 2 Mar 2020 17:28:38 +0100
Message-ID: <CAMO6nayj8NK1Ete+XcSsiN5R7NNDjG+opxhxTM9pArbRRwcjgw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_082851_459781_243C9662 
X-CRM114-Status: GOOD (  22.16  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Feb 21, 2020 at 10:09 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
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
> At least two options are supported :
> - Scatter mode: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in terms
>   of memory allocation but frames are not dumpable and only valid during until
>   the buffer is freed and back in control of the encoder
> - Memory saving: when the pixel bpp is 8b, the size of the superblock can
>   be reduced, thus saving memory.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..8a6e87bacadb 100644
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
> @@ -804,6 +805,61 @@ extern "C" {
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
> + * Implementation details may be platform and SoC specific, and shared
> + * between the producer and the decoder on the same platform.
> + *
> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
> + * per component YCbCr 420, single plane :
> + * - DRM_FORMAT_YUV420_8BIT
> + * - DRM_FORMAT_YUV420_10BIT
> + *
> + * The classic memory storage is composed of:
> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> + *   superblock in default mode.
> + * - a 32 bytes per 128x64 header block
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT fourcc_mod_code(AMLOGIC, 0)
> +
> +/*
> + * Amlogic Video Framebuffer Compression Options
> + *
> + * Two optional features are available which may not supported/used on every
> + * SoCs and Compressed Framebuffer producers.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
> +
> +/*
> + * Amlogic FBC Scatter Memory layout
> + *
> + * Indicates the header contains IOMMU references to the compressed
> + * frames content to optimize memory access and layout.
> + * In this mode, only the header memory address is needed, thus the
> + * content memory organization is tied to the current producer
> + * execution and cannot be saved/dumped.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER     (1ULL << 0)
> +
> +/*
> + * Amlogic FBC Memory Saving mode
> + *
> + * Indicates the storage is packed when pixel size is multiple of word
> + * boudaries, i.e. 8bit should be stored in this mode to save allocation
> + * memory.
> + *
> + * This mode reduces body layout to 3072 bytes per 64x32 superblock and
> + * 3200 bytes per 64x32 superblock combined with scatter mode.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING  (1ULL << 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.22.0
>
>

I'm the main developer of the V4L2 video decoder (H264, VP9..) on
amlogic platforms, which is a producer of such compressed frames.

Those modifiers suit well the combinations of options that can be
applied to the frames when created. I also helped testing the
following scenarios of decode+display on various SoCs:

- SM1: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER (10-bit & 8-bit video)
- SM1: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER +
DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)
- G12A: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER (10-bit & 8-bit video)
- G12A: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER +
DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)
- GXL: DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT (10-bit & 8-bit video)
- GXL: DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
