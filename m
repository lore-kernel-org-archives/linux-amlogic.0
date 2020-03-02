Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A951C3F2D2
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0EEE21D56
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+0gCO7N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mxrD3pbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0EEE21D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpU6FPDycDD2HhldtOw48FsVsUy3CHm8Y31m8DXxCbM=; b=u+0gCO7NXIlpJN
	gOEtKNEZmkZuSWjMmkyWKlZsMkyK5Lwb2z10Pb+krputhQ9for0ut5ROSpRNhdkUPEgkT0Ym096EN
	auuBM11aUlufklsIyU1ln/uKyUy0nMTzvdXAp2JUcrq3g2ajgUoJeWL/N1lFV6KDOT/Wxc8NNMv69
	bysvgSxFPaQ4EVX3Ch2Z7bTqW1r8J+JEPHfI/u/MXfVd/lD/nqupF8txBi1t7iYOqD+cHLFhaSvrj
	jGDabNY7f8za/QRKUKYvIlwacHf/lXux4J+IMeVmMHfZ3Iva4XpZh1AbJ7z7+V4I+ygPJDTV49g5R
	co5LkdDsI1ijIiKPAZaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hrH-0004FD-1I; Mon, 02 Mar 2020 09:59:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hrE-0004ES-J8
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 09:59:30 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71BF454A;
 Mon,  2 Mar 2020 10:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583143166;
 bh=5i4HpQvtX4R1slyHT+952QHgBdgl3htQsX3B0F6Xj3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxrD3pbc3SRTjb14W8QJAbbVj9qN5FxqkZyS8CiumvpluJv2iFvSkaxTRyZ5vW9ZZ
 8TQMjaLKgs1gdZJ3P99IYfZSnkXezeOC4NjklKpumGr8Kl82afPcRBDFwa82isRnNh
 C4DcfimCx1B2bep+2jvjye2CSNiqYN5FGn+aeraU=
Date: Mon, 2 Mar 2020 11:59:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 06/11] drm/meson: venc: make drm_display_mode const
Message-ID: <20200302095902.GA16626@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-7-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206191834.6125-7-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_015928_778627_1420F4CE 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thank you for the patch.

On Thu, Feb 06, 2020 at 08:18:29PM +0100, Neil Armstrong wrote:
> Before switching to bridge funcs, make sure drm_display_mode is passed
> as const to the venc functions.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/meson/meson_venc.c | 2 +-
>  drivers/gpu/drm/meson/meson_venc.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 4efd7864d5bf..a9ab78970bfe 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -946,7 +946,7 @@ bool meson_venc_hdmi_venc_repeat(int vic)
>  EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
>  
>  void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
> -			      struct drm_display_mode *mode)
> +			      const struct drm_display_mode *mode)
>  {
>  	union meson_hdmi_venc_mode *vmode = NULL;
>  	union meson_hdmi_venc_mode vmode_dmt;
> diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
> index 576768bdd08d..1abdcbdf51c0 100644
> --- a/drivers/gpu/drm/meson/meson_venc.h
> +++ b/drivers/gpu/drm/meson/meson_venc.h
> @@ -60,7 +60,7 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
>  void meson_venci_cvbs_mode_set(struct meson_drm *priv,
>  			       struct meson_cvbs_enci_mode *mode);
>  void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
> -			      struct drm_display_mode *mode);
> +			      const struct drm_display_mode *mode);
>  unsigned int meson_venci_get_field(struct meson_drm *priv);
>  
>  void meson_venc_enable_vsync(struct meson_drm *priv);

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
