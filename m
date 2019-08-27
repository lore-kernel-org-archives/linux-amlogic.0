Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B86CC3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF9D2173E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="scpV9t/4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF9D2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0AGyaAo8UBDFPuniAZZINFNLroQ8nOYlKf5GKLLegw=; b=scpV9t/4CSweL8
	btmtXFWiQhsI0n0AZ+dQ4giEi0ifk/eTxD4eURp4g+oXm/dDXfHgbjxW4S9MyAIKMGE5peYVEeMji
	eys9JSQMvDtLpjYDIzsD39xFepFtla2Lkr/SFmx9FGAbPMizch+BpaIZT9FSUvFdNfgrmq6DcYESE
	+yVriUjDuGjgj3KJkr9GRtuL/b4QO+yzpD3YhAWSOY7pHhI0KLh4PJDAJxESiY0M6ZE6U0ObFCfxP
	PkM6aAWxa1lqdj7jB7RxPf/8DPDv1/xVcIv/JJvYIj4ys27Ky6IvFr1SMuztosqKUOg/+Hri9xBMy
	L/YB77ezW5tZlfMf5img==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2XEO-0003hZ-5A; Tue, 27 Aug 2019 08:53:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2XEK-0003hC-VE
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:53:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E3EF427FB86;
 Tue, 27 Aug 2019 09:53:30 +0100 (BST)
Date: Tue, 27 Aug 2019 10:53:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 2/8] drm/meson: meson_dw_hdmi: switch to
 drm_bridge_funcs
Message-ID: <20190827105327.3df8ec37@collabora.com>
In-Reply-To: <20190827081425.15011-3-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
 <20190827081425.15011-3-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_015333_273065_DB6EE586 
X-CRM114-Status: GOOD (  17.65  )
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
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 27 Aug 2019 10:14:19 +0200
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Switch the dw-hdmi driver to drm_bridge_funcs, and implement the
> atomic_get_input_bus_fmts/atomic_get_output_bus_fmts.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 67 +++++++++++++++++++++------
>  1 file changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index f893ebd0b799..333583ef3ab9 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -368,7 +368,7 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
>  }
>  
>  static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
> @@ -663,6 +663,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>  
>  /* Encoder */
>  
> +static const u32 meson_dw_hdmi_out_bus_fmts[] = {
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +};
> +
>  static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
>  {
>  	drm_encoder_cleanup(encoder);
> @@ -672,15 +676,50 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
>  	.destroy        = meson_venc_hdmi_encoder_destroy,
>  };
>  
> -static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +static void
> +meson_venc_hdmi_encoder_get_out_bus_fmts(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *bridge_state,
> +					 struct drm_crtc_state *crtc_state,
> +					 struct drm_connector_state *conn_state,
> +					 unsigned int *num_output_fmts,
> +					 u32 *output_fmts)
> +{
> +	*num_output_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
> +
> +	if (output_fmts)
> +		memcpy(output_fmts, meson_dw_hdmi_out_bus_fmts,
> +		       ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts));
> +}
> +
> +static void
> +meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts,
> +					u32 *input_fmts)
> +{
> +	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
> +		*num_input_fmts = 1;
> +		if (input_fmts)
> +			input_fmts[0] = output_fmt;
> +	}
> +	else
> +		*num_input_fmts = 0;

nitpick:

	} else {
		*num_input_fmts = 0;
	}

> +}
> +
> +static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
>  					struct drm_crtc_state *crtc_state,
>  					struct drm_connector_state *conn_state)
>  {
>  	return 0;
>  }

This hook is optional, you don't need this stub.

Looks good otherwise:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  
> -static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
> +static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder = bridge_to_encoder(bridge);
>  	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  
> @@ -693,8 +732,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
>  	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
>  }
>  
> -static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
> +static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder = bridge_to_encoder(bridge);
>  	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  
> @@ -706,10 +746,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
>  		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
>  }
>  
> -static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> -				   struct drm_display_mode *mode,
> -				   struct drm_display_mode *adjusted_mode)
> +static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
>  {
> +	struct drm_encoder *encoder = bridge_to_encoder(bridge);
>  	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
> @@ -726,11 +767,12 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>  	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
>  }
>  
> -static const struct drm_encoder_helper_funcs
> -				meson_venc_hdmi_encoder_helper_funcs = {
> -	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
> -	.disable	= meson_venc_hdmi_encoder_disable,
> +static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
>  	.enable		= meson_venc_hdmi_encoder_enable,
> +	.disable	= meson_venc_hdmi_encoder_disable,
> +	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
> +	.atomic_get_output_bus_fmts = meson_venc_hdmi_encoder_get_out_bus_fmts,
> +	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
>  	.mode_set	= meson_venc_hdmi_encoder_mode_set,
>  };
>  
> @@ -912,8 +954,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	/* Encoder */
>  
> -	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
> -
> +	encoder->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
>  	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
>  			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
>  	if (ret) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
