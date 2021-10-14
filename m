Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA915C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59BF60EBB
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A59BF60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BkRyKUGIRw2UEt9Jn6H6f8HarsiY/6Lq3l9p2a0eVI=; b=gnn8ezLVJ1dk8R
	YjUNzDpV6odLc76kqLGFWWfarhgujIF8GG59oRzg3iMsGFCWlnwIddr0H7xAol6fHGq6RSP2YuluE
	mVA0RAjvDrerfYOGTezW8eYAaOl9IujAt01B8Oke+neQ5Ujz0uipk8U4s+SGCjGKmLHBxvDDdGzNi
	GBR8jp3C52VdboYPJprd4wIVMf/DUQSGpLjiZUkZ9ULDPapiu7I2lRE3co1C3YjxsI9Htjr77zrE+
	P6Q3oycTN4NqrSTJeQl8Xv7tudyfXhRa1UpcfAJTSC6LGz+2VkcJEdBa2wyCHlifWZRAF68veIEmF
	t2Ab7kDmxaVPPNzk5chA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb59a-00431f-9J; Thu, 14 Oct 2021 18:08:30 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb59Y-00430Q-4h
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 18:08:29 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ba8a6343-2d19-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:08:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3561A194B57;
 Thu, 14 Oct 2021 20:08:34 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:08:24 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/bridge: synopsys: dw-hdmi: also allow interlace
 on bridge
Message-ID: <YWhyGBlz7JW8NciX@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-5-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-5-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_110828_349778_C68F1F82 
X-CRM114-Status: GOOD (  15.06  )
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

On Thu, Oct 14, 2021 at 05:26:03PM +0200, Neil Armstrong wrote:
> Since we allow interlace on the encoder, also allow it on the bridge
> so we can allow interlaced modes when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index f08d0fded61f..62ae63565d3a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3413,6 +3413,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
>  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>  			 | DRM_BRIDGE_OP_HPD;
> +	hdmi->bridge.interlace_allowed = true;
>  #ifdef CONFIG_OF
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
