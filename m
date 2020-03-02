Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA7DC3F2D2
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 10:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8542086A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 10:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+a+hjRL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XvfDJypR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8542086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMnt5XNtCefcgUbkj7uR/T5Y21kENSOaZlqESmq6wq0=; b=P+a+hjRL3X2T02
	cpafvAjtXLbO8lay8dGFCF8eoyDPp0hgEahkgOweoeWWVc4flKQlAGheTCBg2wl2pVjBG/LYcjWWz
	h1bxjb28hAMfM5R3WPiRLsp/72zwE/0TXExCBEdpb1WVPfKpzzXXJPuIDdX8Yqot98RH1Mx91hP30
	vKHH/YeMErwPZCrd5jrGs3u5qhctmAEj+Ult/2U+Cnyr0elmEXTV8BA49T1LRm8m94+nWAMCQXPl+
	J6xrOGJXXLojnkr3VRqhnDIMO/cyctL0AMirfC0VGa2fjrw6X4fQBCVNGsvW97zZG+jwo+5nKCWUP
	tcrb0ErGra6TidOtU27g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hvA-0005zB-Et; Mon, 02 Mar 2020 10:03:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hv8-0005yi-Eq
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 10:03:31 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABEA354A;
 Mon,  2 Mar 2020 11:03:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583143408;
 bh=Lc7Yy28cE9d+CVfXGMhAB4DWD8ECf5jY5VejWhcg/q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XvfDJypRfkoFhsmusgeTbIqW+/Y922eaLqRsN5OtHZksIqOw1UOpcctZ6GITU1asZ
 NcSDRqkeW1PJ/4k5Lela6uavruWSm9HiorhpZgrNsCp5IbmKzDMXwiqNeowz8laqgm
 dEfllyMcK81dOu2C8oFhN6qckrShCL+RVNf8aFDM=
Date: Mon, 2 Mar 2020 12:03:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 05/11] drm/bridge: synopsys: dw-hdmi: allow ycbcr420
 modes for >= 0x200a
Message-ID: <20200302100303.GI11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-6-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206191834.6125-6-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_020330_643331_50DD68D5 
X-CRM114-Status: GOOD (  14.41  )
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

On Thu, Feb 06, 2020 at 08:18:28PM +0100, Neil Armstrong wrote:
> Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
> for these modes in the connector if the platform supports them.
> We limit these modes to DW-HDMI IP version >= 0x200a which
> are designed to support HDMI2.0 display modes.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>  include/drm/bridge/dw_hdmi.h              | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 15048ad694bc..4b35ea1427df 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3231,6 +3231,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
>  
> +	if (hdmi->version >= 0x200a)
> +		hdmi->connector.ycbcr_420_allowed =
> +			hdmi->plat_data->ycbcr_420_allowed;
> +	else
> +		hdmi->connector.ycbcr_420_allowed = false;
> +

The hdmi structure being allocated with kzalloc, you don't need the
second branch of the if, but I'm fine if you prefer keeping it. Any
either case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	pdevinfo.parent = dev;
>  	pdevinfo.id = PLATFORM_DEVID_AUTO;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 9d4d5cc47969..0b34a12c4a1c 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -129,6 +129,7 @@ struct dw_hdmi_plat_data {
>  	unsigned long input_bus_format;
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
> +	bool ycbcr_420_allowed;
>  
>  	/* Vendor PHY support */
>  	const struct dw_hdmi_phy_ops *phy_ops;

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
