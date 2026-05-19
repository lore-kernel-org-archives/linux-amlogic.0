Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE704CD4F54
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HprTN0t3LB2CtCZy4tnitMxQ/hd5fYp0o1wffM1Xnw=; b=IoH118AkDK47ya
	icA8t6DWBY1K0K0+NFhs/xByOFw4IkrlmTjJB67o5CORJofQ2ybptyqNlAYY7eaWAPwf35P0MUkcz
	w3NK1K3V4QjpHtXusy1QloVc73KhbsxSJUwYQg8WAiFixMRNgOUxcuY0w67S40obxfCbzQC330sLn
	3Ps6BOoMvGPaBXaclqXm0GXCtfi9NTAhrdLU7f7Hs7TYHfezVjWyyeqDVGjNhNMAkIDqVQ/YaMAof
	fCqxXj3GpXQKyP57tyQd6EZw81zPJ3Md82K3o4zfDuLUBU+L4+PFrkpVYm4KzeE4fS5tdDV5UQcg/
	Mdv2l22sKdhc7f6pDKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE3A-00000000MKL-1Sxx;
	Tue, 19 May 2026 06:35:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE39-00000000MK7-02yo;
	Tue, 19 May 2026 06:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7D3860052;
	Tue, 19 May 2026 06:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A48AC2BCB3;
	Tue, 19 May 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172529;
	bh=PRsYzknanFyATavLtM7cL+hf9VvsO0oo90C5CxicR8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=PSNqpumrg6dYiiQYEmynbnixtWYpoeBtue8tnZKdS6qB5He5qHUutjvNLBuZJScPT
	 K1YQ6nDd+8DbQDcjZkfN4hcr0VnYElD8W+jpwAAXcG0RwxKfNeQvvMnaIPSnUVhSwM
	 5/bk/7/DgiM4Jd3kWs15hlvvWuqabW69r7hRymqbQADCeyh7gL7iR/AZMyAY3VTX/D
	 +N71z7FTLu2IomD1junPsiCBeG3ZPXQPRquV9lBmerq7Hu9oDE8jvPnZpGKo8clMuI
	 lFzu529xv3zIDVyPSljZHahvq+sjcZTRc3jX4vwXpu1Y7U36tNXlNbJxRVSp1es5ZN
	 R31nkIMZqs4Ow==
Message-ID: <3672b556-e66d-471d-90f9-ef1078527929@kernel.org>
Date: Tue, 19 May 2026 08:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 17/23] drm: bridge: dw_hdmi: Declare bridge CEC
 notifier support
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-18-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-18-jonas@kwiboo.se>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/05/2026 20:01, Jonas Karlman wrote:
> EDID and CEC phys addr is now being updated in bridge detect() func,
> making it possible to have CEC notifier support using the bridge
> connector.
> 
> Add the CEC notifier bridge op to instruct the bridge connector to make
> use of the generic CEC notifier helpers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: Only declare CEC notifier support when CEC device register succeeds
> v6: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0c4388e7aa5e..5dacb8a99715 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3515,6 +3515,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  		pdevinfo.dma_mask = 0;
>  
>  		hdmi->cec = platform_device_register_full(&pdevinfo);
> +		if (!IS_ERR(hdmi->cec)) {
> +			hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +			hdmi->bridge.hdmi_cec_dev = hdmi->dev;
> +		}
>  	}
>  
>  	drm_bridge_add(&hdmi->bridge);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
