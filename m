Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B03C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 17:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0A061037
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 17:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A0A061037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf0PYOzotJGvJxyC3Z3GU58yzx391BqJCgizGY5YXN0=; b=o6v+MQIAH6oiTy
	WZtiZs+kIgmWfAJ+6dRIBHQ3dXojR/jr4+yLZTtTP28fbCraVIAtn/Kg0dtQ4HbAVEYreV0ai/Ivr
	VW8FsdIbHFcHC5E+V4z81MeTcbRL+S5tKRwCp1I1m7IJ+uyi63wN5aftydsRHebClN8inlE2vIAG0
	0ZpxZvzHg6neXzTDMDUWgkajZQrgf6ojucVgRE4XqfqQJJE8PZ/ctUG84gblXQfJz76Wg19w5p5kC
	1E3ekW6bIZVTIzc3kETvcYwAqn/MPqfKUhOsDlHITCKt46tU6ZhCSeC7dT4f4RanHpGyzS8nZ9tFv
	fBcmWowtRaNlfRPEhrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb4nN-003zUB-Hg; Thu, 14 Oct 2021 17:45:33 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb4nJ-003zRr-P7
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 17:45:31 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7eaae583-2d16-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 17:45:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CADFC194B77;
 Thu, 14 Oct 2021 19:45:24 +0200 (CEST)
Date: Thu, 14 Oct 2021 19:45:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/bridge: display-connector: implement bus fmts
 callbacks
Message-ID: <YWhsq6nxf88Uwnbx@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_104530_136758_BE16107A 
X-CRM114-Status: GOOD (  26.74  )
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

Hi Neil,

code looks fine. A few improvement proposals to the comments.
With the include order fixed and the comments considered:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Thu, Oct 14, 2021 at 05:26:00PM +0200, Neil Armstrong wrote:
> Since this bridge is tied to the connector, it acts like a passthrough,
> so concerning the output & input bus formats, either pass the bus formats from the
> previous bridge or return fallback data like done in the bridge function:
> drm_atomic_bridge_chain_select_bus_fmts() & select_bus_fmt_recursive.
> 
> This permits avoiding skipping the negociation if the remaining bridge chain has
> all the bits in place.
> 
> Without this bus fmt negociation breaks on drm/meson HDMI pipeline when attaching
> dw-hdmi with DRM_BRIDGE_ATTACH_NO_CONNECTOR, because the last bridge of the
> display-connector doesn't implement buf fmt callbacks and MEDIA_BUS_FMT_FIXED
> is used leading to select an unsupported default bus format from dw-hdmi.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 05eb759da6fc..9697ac173157 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
Alphabetic order.

>  
>  struct display_connector {
> @@ -87,10 +88,97 @@ static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
>  	return drm_get_edid(connector, conn->bridge.ddc);
>  }
>  
> +/*
> + * Since this bridge is tied to the connector, it acts like a passthrough,
> + * so concerning the output bus formats, either pass the bus formats from the
> + * previous bridge or return fallback data like done in the bridge function:
> + * drm_atomic_bridge_chain_select_bus_fmts().
> + * This permits avoiding skipping the negociation if the bridge chain has all
> + * bits in place.
negociation if => negotiation of

Consider the following wording:
This supports negotiation if the bridge chain has all bits in place.

> + */
> +static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
> +	struct drm_bridge_state *prev_bridge_state;
> +
> +	if (!prev_bridge || !prev_bridge->funcs->atomic_get_output_bus_fmts) {
> +		struct drm_connector *conn = conn_state->connector;
> +		u32 *out_bus_fmts;
> +
> +		*num_output_fmts = 1;
> +		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
> +		if (!out_bus_fmts)
> +			return NULL;
> +
> +		if (conn->display_info.num_bus_formats &&
> +		    conn->display_info.bus_formats)
> +			out_bus_fmts[0] = conn->display_info.bus_formats[0];
> +		else
> +			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +
> +		return out_bus_fmts;
> +	}
> +
> +	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +							    prev_bridge);
> +
> +	return prev_bridge->funcs->atomic_get_output_bus_fmts(prev_bridge, prev_bridge_state,
> +							      crtc_state, conn_state,
> +							      num_output_fmts);
> +}
> +
> +/*
> + * Since this bridge is tied to the connector, it acts like a passthrough,
> + * so concerning the input bus formats, either pass the bus formats from the
> + * previous bridge or return fallback data like done in the bridge function:
> + * select_bus_fmt_recursive() when atomic_get_input_bus_fmts is not supported.
Maybe use this this:
from the previous bridge or MEDIA_BUS_FMT_FIXED (like select_bus_fmt_recursive())


> + * This permits avoiding skipping the negociation if the bridge chain has all
> + * bits in place.
Like above
> + */
> +static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
> +	struct drm_bridge_state *prev_bridge_state;
> +
> +	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
> +		u32 *in_bus_fmts;
> +
> +		*num_input_fmts = 1;
> +		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
> +		if (!in_bus_fmts)
> +			return NULL;
> +
> +		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +
> +		return in_bus_fmts;
> +	}
> +
> +	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +							    prev_bridge);
> +
> +	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
> +							     crtc_state, conn_state, output_fmt,
> +							     num_input_fmts);
> +}
> +
>  static const struct drm_bridge_funcs display_connector_bridge_funcs = {
>  	.attach = display_connector_attach,
>  	.detect = display_connector_detect,
>  	.get_edid = display_connector_get_edid,
> +	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
