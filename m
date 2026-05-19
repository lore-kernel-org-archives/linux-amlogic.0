Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A1CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 06:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWiKu6CJ9p3WQnZuuiUpGE88HvYqTlAdulOG6nXo43A=; b=or6bqoQdcBwpfD
	nXLmZeHIv+91wa/Ich58NJAcR350LPBiLHUwHuwC/H5FPOGYBNSXFxMVQ7onNsvGxGUtQGOL+bdiF
	7uRe1aBrq8rettcIQ5Uy/HU43EZPZ//N/+vmU5+tkAcOcMnBNAPWl+vya2BjproKqWWnVMnAnisgx
	lZvQoZpvHYprd9sqdAunOvgTmKxsyBYfXKPIQpYVJUAWJ9VDVp1cvqfi6T62SNnqLbx9tvYc2+Xsb
	pmZOlL6L9lszuRjSk+IVCoQWKjUTY2K3tCAG187st3kC5ERUDzoAFbaDJ6MY9OKmy9DbmPunTG2EZ
	wjd5CMBMOjHCSNN0Amkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDpj-00000000JMj-43Of;
	Tue, 19 May 2026 06:21:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDpi-00000000JMM-2wmv;
	Tue, 19 May 2026 06:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF74060052;
	Tue, 19 May 2026 06:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91448C2BCB3;
	Tue, 19 May 2026 06:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171697;
	bh=bI1+JJlEbofJwf56QKg8oCf2syw9NjpmEZehTGAplJQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WWVuvCg3lq9kj/W9OHODE0FAt4VK9CPQwu6zrFMcsNHdAqHhuzXGUZGwy47s+6CJa
	 72YU4jF38E/VoKdeqoOIf5/QWpSv8RvP81fnP/amdv5Atnb8XbyxcH68VxhFGCx3ps
	 WslsvsyfQ2rbuY7x6SBVCsHXrAwRQvdmM7k8Yq0Hg+Pylth9J7eDPnvJGfCMhsGgGK
	 neW3YY0ok1Q6kxW+5X/1OzpeDgTPpOBbYkjnqhb6PDYNe5BWbfv8/IIAH583IJVKgb
	 OSCoe7lNCaR78GmefFw7YcG3rj6IFuKpUu6uf9VY2+GBWUMQYIa+Tni5LvSrU8pACF
	 UWv2Xe4Ihmgtw==
Message-ID: <a34f5914-80b7-4d95-a220-79001309214a@kernel.org>
Date: Tue, 19 May 2026 08:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC
 adapter is unregistered
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Russell King <rmk+kernel@armlinux.org.uk>, Hans Verkuil
 <hverkuil@kernel.org>, Archit Taneja <architt@codeaurora.org>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-4-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-4-jonas@kwiboo.se>
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
> The interrupt allocated with devm_request_threaded_irq() can be
> use-after-free when the devres release action try to free_irq().
> 
> KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq during unbind:
> 
> Call trace:
>   [...]
>   dw_hdmi_cec_hardirq+0x4cc/0x560
>   free_irq+0x48c/0x7e4
>   devm_irq_release+0x54/0x90
>   dr_node_release+0x38/0x5c
>   release_nodes+0xac/0x130
>   devres_release_all+0xf4/0x1b0
>   device_unbind_cleanup+0x28/0x1f8
>   device_release_driver_internal+0x358/0x470
>   device_release_driver+0x18/0x24
>   bus_remove_device+0x33c/0x4f0
>   device_del+0x2d8/0x790
>   platform_device_del+0x34/0x1e0
>   platform_device_unregister+0x14/0x3c
>   dw_hdmi_remove+0x74/0x180
>   [...]
> 
> Freed by:
>   [...]
>   kfree+0x1dc/0x5dc
>   cec_delete_adapter+0xd4/0x118
>   cec_devnode_release+0xa4/0xe0
>   device_release+0xa0/0x200
>   kobject_put+0x14c/0x26c
>   put_device+0x14/0x30
>   cec_unregister_adapter+0x20c/0x280
>   dw_hdmi_cec_remove+0x8c/0xd0
>   [...]
> 
> Explicitly devm_free_irq() before the CEC adapter is unregistered to
> fix this possible use-after-free issue.
> 
> Fixes: a616e63c56ef ("drm/bridge: dw-hdmi: add cec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: New patch
> 
> KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq when,
>   echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
> on a Rockchip RK3566 device prior to this fix.
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 9549dabde941..67a2a242d3ca 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -309,6 +309,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
>  	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
>  
>  	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
> +	devm_free_irq(&pdev->dev, cec->irq, cec->adap);
>  	cec_unregister_adapter(cec->adap);
>  }
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
