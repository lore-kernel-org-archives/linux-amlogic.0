Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE7EC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 17:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50689610D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 17:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50689610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9LguUOvlhUj0vAJtCjUreT/6pqvNN2f9ATa17+kj6I=; b=2d6roymCIOwFs9
	sHWT77X3uzArxZ1r2AQN/+cmYBibBxAEr9owDIRGLkNyS9nCfNLlr/U3KW5gnZnQ78rzMvfp8zTld
	e1Q36phNQ0eipeWPmmcPvKDl4VvRf737AelE/9xKXZJNw0a3F5xyOZExkcbPnURrc7Ar5NYuw0RNi
	+6uNkyMBBCaEWz51JBFanTX8GGyxE8V5EEiRiNw+mOmf7UnhP+PP1gtodj4el6jt/5Z/VjPeoNU/H
	eKTJBTlCO4wpjZuEBovxo4hyJapedZwW1hat+EzbRtbdy54G0fqkmQlhRFz/LnEARxYAs4hwrrDja
	w+JYD0gky3QXgN6EzgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb4rZ-0040VI-U6; Thu, 14 Oct 2021 17:49:53 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb4rW-0040U4-Cv
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 17:49:51 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 20384c3c-2d17-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 17:49:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 698C9194B76;
 Thu, 14 Oct 2021 19:49:56 +0200 (CEST)
Date: Thu, 14 Oct 2021 19:49:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/meson: remove useless recursive components
 matching
Message-ID: <YWhtuscoVWCdQAkY@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_104950_623499_7590CD3A 
X-CRM114-Status: GOOD (  25.07  )
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

one comment below. Other than that
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Thu, Oct 14, 2021 at 05:26:01PM +0200, Neil Armstrong wrote:
> The initial design was recursive to cover all port/endpoints, but only the first layer
> of endpoints should be covered by the components list.
> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
> first endpoints instead of recursing.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
>  1 file changed, 21 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index bc0d60df04ae..b53606d8825f 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
>  	return dev->of_node == data;
>  }
>  
> -/* Possible connectors nodes to ignore */
> -static const struct of_device_id connectors_match[] = {
> -	{ .compatible = "composite-video-connector" },
> -	{ .compatible = "svideo-connector" },
> -	{ .compatible = "hdmi-connector" },
> -	{ .compatible = "dvi-connector" },
> -	{}
> -};
> -
> -static int meson_probe_remote(struct platform_device *pdev,
> -			      struct component_match **match,
> -			      struct device_node *parent,
> -			      struct device_node *remote)
> -{
> -	struct device_node *ep, *remote_node;
> -	int count = 1;
> -
> -	/* If node is a connector, return and do not add to match table */
> -	if (of_match_node(connectors_match, remote))
> -		return 1;
> -
> -	component_match_add(&pdev->dev, match, compare_of, remote);
> -
> -	for_each_endpoint_of_node(remote, ep) {
> -		remote_node = of_graph_get_remote_port_parent(ep);
> -		if (!remote_node ||
> -		    remote_node == parent || /* Ignore parent endpoint */
> -		    !of_device_is_available(remote_node)) {
> -			of_node_put(remote_node);
> -			continue;
> -		}
> -
> -		count += meson_probe_remote(pdev, match, remote, remote_node);
> -
> -		of_node_put(remote_node);
> -	}
> -
> -	return count;
> -}
> -
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> @@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>  	drm_atomic_helper_shutdown(priv->drm);
>  }
>  
> +/* Possible connectors nodes to ignore */
> +static const struct of_device_id connectors_match[] = {
> +	{ .compatible = "composite-video-connector" },
> +	{ .compatible = "svideo-connector" },
> +	{}
> +};
> +
>  static int meson_drv_probe(struct platform_device *pdev)
>  {
>  	struct component_match *match = NULL;
> @@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
>  			continue;
>  		}
>  
> -		count += meson_probe_remote(pdev, &match, np, remote);
> +		/* If an analog connector is detected, count it as an output */
> +		if (of_match_node(connectors_match, remote)) {
> +			++count;
> +			of_node_put(remote);
> +			continue;
> +		}
> +
> +		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
> +				  np, remote, dev_name(&pdev->dev));
Avoid the deprecated logging functions.
Use drm_dbg() or if there is no drm_device just dev_dbg().

I assume the driver uses DRM_xxx all over, so I understand if you keep
it as-is.

> +
> +		component_match_add(&pdev->dev, &match, compare_of, remote);
> +
>  		of_node_put(remote);
> +
> +		++count;
>  	}
>  
>  	if (count && !match)
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
