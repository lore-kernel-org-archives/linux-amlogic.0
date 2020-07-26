Return-Path: <SRS0=zrXo=BF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD0EC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2020 17:26:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D85220578
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2020 17:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vwZKXtrc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D85220578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PiYOnNw/TLutHRwuLLVBn5zSe9i3yE0YY73zLLySdI=; b=vwZKXtrcHcxlgKCAOtooUbUXG
	oQ0Eenf1sagRQtom0ANHixsENylUpImJa7ufDL+uJZJfs3OdBhD1gSs5WEzy//DDjSz+nWxETbjIU
	IctM7mwj+G39KsEvv7ekvoa974a4OfozZbBNUZlIEeo6RmV9ofIOti9mE2VeQgnV4UtU1UcIfldrb
	FRF87K//5JRbkVOqDAOBOHk7f83V/USHcQgwkBdAskybvh7xNGCU/qmSjWKXMxxn4zcXdGPh4Qbwe
	D3NUSYe7uEzX3sAN/Bn8jvDH/CZ78bCCbPxEaiPUu05kBjQ5ikUrEDPONFFpJF0s0q3A1Xha2y9H+
	vgbu2cIqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzkPM-0003jX-G6; Sun, 26 Jul 2020 17:25:56 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzkPJ-0003iu-KL
 for linux-amlogic@lists.infradead.org; Sun, 26 Jul 2020 17:25:54 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D2D0220023;
 Sun, 26 Jul 2020 19:25:50 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:25:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] drm/fourcc: fix Amlogic Video Framebuffer
 Compression macro
Message-ID: <20200726172549.GH3275923@ravnborg.org>
References: <20200723090551.27529-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723090551.27529-1-narmstrong@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=IpJZQVW2AAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=lB4rwjMMMp82C4b3nNAA:9 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_132553_818709_C6227164 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil.

On Thu, Jul 23, 2020 at 11:05:50AM +0200, Neil Armstrong wrote:
> Fix the Amlogic Video Framebuffer Compression modifier macro to
> correctly add the layout options, a pair of parenthesis was missing.
> 
> Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Looks correct just looking at the patch below.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply the patch.

	Sam

> ---
>  include/uapi/drm/drm_fourcc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 4bee7de5f306..82f327801267 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1004,7 +1004,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
>  	fourcc_mod_code(AMLOGIC, \
>  			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
> -			((__options) & __fourcc_mod_amlogic_options_mask \
> +			(((__options) & __fourcc_mod_amlogic_options_mask) \
>  			 << __fourcc_mod_amlogic_options_shift))
>  
>  /* Amlogic FBC Layouts */
> -- 
> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
