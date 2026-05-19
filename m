Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9ECD4F54
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 06:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JsUpkZucw/3V/K5qsxkIVjzC7O8Hf+TTRmBC7WKaGM=; b=t4Ccj68EcfKzKb
	RoeLmoBkXpxefpfe7RSyd0ZQotZPx44CtJmJtTxVFuIRvVXQkSGA5KyMuTA02v38Y/mq7B6haxqiR
	PVdsFSX+b6+LRne8M3vZhvHDj1L7zS2jtrIctqxoJPRPFG7q8A4aw7nltrZX3hb3WvfDYymDKVu7E
	fnuK5fiolwnPY17t5QgaEJRhsGsaaVjUiH9hKYo36th1Ccs50VsF7rIaeTTFgbr6upPfQ+0EdnuM2
	FaIB545uYfMilFGpbVNaf0Tr4Z5OtTBaKApMBxHs074RODwtWTgU2l4fwGcdRvDKzXYta8tQSXWf5
	vY/XH+kUjehB+6keohkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDw9-00000000Kwc-2ju1;
	Tue, 19 May 2026 06:28:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDw8-00000000Kw8-13oG;
	Tue, 19 May 2026 06:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B80260207;
	Tue, 19 May 2026 06:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEB4C2BCB3;
	Tue, 19 May 2026 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172095;
	bh=41Z1DJEfpN+VlduVVFn/3scUAnCvvTeqtOFh+uOYsg4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=m/J0clzpRsVypsb/Rfh/gS2eapAjDjjf1PljJ6ytcPf9J95UAW0JfZ1LlUyjuq7dV
	 1zqLvmIp8aismGbFz1epwjPiBnv9NqQD2XNZ1wFPQuMXxH6JSKtLksx/8agCil454f
	 0yq1I+AZCKyLkbf+99RQ3symRNel6LtSBJEczw38ooquSf27HYwCs0mHN9xDZ27nkE
	 JZzau2SCwXSiFo0sWqVHS2/mkafyb2KW06BbUn9WY08yYLQsyxZRs/P9P/Rd+CtLqk
	 wsoa6q4jaBvipUSEZ41sPKq/xxb+zDl/iZ1rHN7yNvX5gLLlkKqh8P0SC9F8bGzmjt
	 /EdmMDm+S4+nA==
Message-ID: <44a15912-b099-43aa-afe1-83f2025309cd@kernel.org>
Date: Tue, 19 May 2026 08:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 11/23] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
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
 <20260518180206.2480119-12-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-12-jonas@kwiboo.se>
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
> With CEC phys addr invalidation moved away from the irq handler there is
> no longer a need for cec_notifier_mutex, remove it.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Nice, I wondered why that mutex was there at all.

Regards,

	Hans

> ---
> v7: No change
> v6: Collect t-b tag
> v5: No change, cec_notifier_conn_unregister() call moved
> v4: No change
> v3: No change
> v2: Collect r-b tag
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index aae1b890167b..0dd4c823c60a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -189,7 +189,6 @@ struct dw_hdmi {
>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>  
> -	struct mutex cec_notifier_mutex;
>  	struct cec_notifier *cec_notifier;
>  
>  	hdmi_codec_plugged_cb plugged_cb;
> @@ -2476,11 +2475,8 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  
>  	status = dw_hdmi_detect(hdmi);
>  
> -	if (status == connector_status_disconnected) {
> -		mutex_lock(&hdmi->cec_notifier_mutex);
> +	if (status == connector_status_disconnected)
>  		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -		mutex_unlock(&hdmi->cec_notifier_mutex);
> -	}
>  
>  	return status;
>  }
> @@ -2542,10 +2538,8 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>  	cec_notifier_conn_unregister(hdmi->cec_notifier);
>  	hdmi->cec_notifier = NULL;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>  
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
> @@ -2612,9 +2606,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>  	if (!notifier)
>  		return -ENOMEM;
>  
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>  	hdmi->cec_notifier = notifier;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>  
>  	return 0;
>  }
> @@ -3323,7 +3315,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  
>  	mutex_init(&hdmi->mutex);
>  	mutex_init(&hdmi->audio_mutex);
> -	mutex_init(&hdmi->cec_notifier_mutex);
>  	spin_lock_init(&hdmi->audio_lock);
>  
>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
