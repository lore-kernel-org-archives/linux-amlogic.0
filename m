Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08AFC3F2D2
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C239024695
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 09:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWIvNJQa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UKehywIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C239024695
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWaVBikBUJMHp2ogKmjI+4Amej+GRiher/g7VhH7UMg=; b=BWIvNJQavwl+lU
	m4mBmRqygSsjbPn/bjqREuvm9i6X9sHvZ6m/3zcNHSOK/4+36uDd9miIXO6I2IhFtmcnZgzfzzKrx
	gZ532XQnpXCUt9gZG8OkT3XzjD9imZdjROxaBRlGU9HIvW+8zqJC4pUpuQQkG82EJMLP8u3Ejv7HP
	ZWxroDgcVfmv4aajxdz/0AVBW7iuvPZneMF5Jlx2/z6rHFuBmSZ+1P6NiM+aBTNjRkkazb+drx7hE
	Z0QU2A1LZmVHkt8xHFJQI3x0ta2jr1Kj2dybBOdBvGpLFi6YgB52g3x3dp/dRSFAxzIHu34D50OYi
	NM7z7+ASb5bFuJjX5+CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8h1c-0005A4-Cx; Mon, 02 Mar 2020 09:06:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8h1Z-00058j-Bh
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 09:06:06 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1287954A;
 Mon,  2 Mar 2020 10:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583139951;
 bh=VDWAsNeO8Ac3vEXOshs+XlaeJk2oAZMeE+lRCTwjq3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKehywIxMxHb/CCQajH3sguIvjMVZxuTpfxCoiWpcAl17aU8YfSaLfF+U8+h3TENy
 E6EoN2ZT7TPVULNqBPQR5IqLp2vIgwQDMw1X6qqy6LeKRUnf78T24zknkPZJBfgVBT
 Ijz2XzdMkjKEbPcr0tnUmXvYAOy75kpICjkE2ojw=
Date: Mon, 2 Mar 2020 11:05:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep
 color
Message-ID: <20200302090527.GB11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206191834.6125-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_010605_548571_EE7474AA 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Neil and Jonas,

Thank you for the patch.

On Thu, Feb 06, 2020 at 08:18:24PM +0100, Neil Armstrong wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Configure the correct mtmdsclock for deep colors to prepare support
> for 10, 12 & 16bit output.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 67fca439bbfb..9e0927d22db6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  
>  	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);

Nitpicking a bit, I would change

-	vmode->mtmdsclock = vmode->mpixelclock = mode->clock * 1000;
+	vmode->mpixelclock = mode->clock * 1000;

above, and here add

	vmode->mtmdsclock = vmode->mpixelclock;

to keep all mtmdsclock calculation in a single place.

> +	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
> +		switch (hdmi_bus_fmt_color_depth(
> +				hdmi->hdmi_data.enc_out_bus_format)) {
> +		case 16:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;

Both mpixelclock and mtmdsclock are unsigned int. Is the cast to u64
needed ?

On a separate but related note, what does the 'm' in tmdsclock stand for
? It seems to originate from the 'm' prefix for mpixelclock, which has
been there from the start. Unless there's a good reason for the prefix,
renaming mtmdsclock to tmds_clock (and handling the other fields in the
hdmi_vmode structure similarly) would increase clarity I think.

> +			break;
> +		case 12:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
> +			break;
> +		case 10:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
> +			break;
> +		}
> +	}
> +
>  	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
>  		vmode->mtmdsclock /= 2;
>  
> +	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);

s/tmdsclk/tmdsclock/ to match the field name ?

> +
>  	/* Set up HDMI_FC_INVIDCONF */
>  	inv_val = (hdmi->hdmi_data.hdcp_enable ||
>  		   (dw_hdmi_support_scdc(hdmi) &&

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
