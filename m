Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CA606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q43ddJ3g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RohhYpvv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8LDd4qpKPDTM7LBTSYrU93nGm4rNdqImnT2S5GOrSF4=; b=Q43ddJ3gkkqi9WINMWikxNx3jp
	Jj5ze+OKm/F78gSOKrWuoPmFgqmn3FJYbT8EC9siHb6c7YdfxsjklbXK8qxLKQ0SWQ92uXHuALVS9
	SzMVkaae3rRF2N0cJC6eXtvNMmsbTqj9dEsHeoxYkDO0oVIwbWd9aY5KNGjfh7d5ReVwz3FOYRgDG
	PZqzxcnjVR8zyQgZVtUCrga1iyadw11FCRWl5VaaOYgOjCtcscyRSbYS3gOMF/E3C3FzBa/nxvnPx
	u/B/bDHW/u9OGvmZqcVu7aaJpadz/28aDUVo6iOJJfbV68AC4iEFljmsrd0SgwHonoe74MpXM793D
	PF6Zv0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqTe-000000004gi-34EU;
	Sat, 21 Nov 2026 19:10:26 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqTb-000000004gH-1ytB;
	Sat, 21 Nov 2026 19:10:21 +0000
Message-ID: <a2a8fefd-b589-444d-96a4-f679ab5c9946@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795288214;
	bh=8y0heA0u3ZMdaEjr38+zX0yS05Hb8knX6np75X1lRvU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RohhYpvv9RadrymbNJo6Qxw+FczCEVwhco12YIXZkMV3lPg5fzO2zo8xhxGf+YPsD
	 OVUJwSqBXpMk+DJZTvezI3yDG+W4zcaQbOI0m6LaftP/AwT7sjS+HKkUWWsndd05W9
	 ZPViQuLSAYZQQ4+ajv7Y3Go0Rxh0X778e6B6n5so=
Date: Sat, 21 Nov 2026 20:10:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 08/11] drm/meson: dw-hdmi: Use the generic PHY
 framework for the HDMI TX PHY
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-8-93d622d9bb07@aliel.fr>
 <sashiko-outbox-225914@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-225914@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_111020_136834_B55EB479 
X-CRM114-Status: GOOD (  19.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 20:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] drm/meson: dw-hdmi: missing PHY init in meson_dw_hdmi_init()
>   breaks CEC/ARC
> - [Medium] drm/meson: dw-hdmi: phy_init() leak on error path in
>   dw_hdmi_phy_init()
> --
> 
> commit 9c4e52bbd305f6371ee6545c479c9a84e6845324
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
> 
> This commit converts the Meson DW-HDMI driver from direct HHI register
> programming to the generic PHY API, with a legacy fallback when the DT
> node lacks a "phys" property.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 20a821936b3af..1ca1ce6173563 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> [ ... ]
>> @@ -364,10 +276,18 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>>  	unsigned int wr_clk =
>>  		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
>>  	bool mode_is_420 = false;
>> +	unsigned int pixel_clock = mode->clock;
>> +	union phy_configure_opts opts = {};
>> +	int ret;
>>  
>>  	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
>>  			 mode->clock > 340000 ? 40 : 10);
>>  
>> +	/* Setup PHY */
>> +	ret = phy_init(dw_hdmi->phy);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (drm_mode_is_420_only(display, mode) ||
>>  	    (!is_hdmi2_sink && drm_mode_is_420_also(display, mode)) ||
>>  	    dw_hdmi_bus_fmt_is_420(hdmi))
>> @@ -392,19 +312,22 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>>  	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
>>  
>>  	/* Setup PHY parameters */
>> -	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>> -
>> -	/* Disable clock, fifo, fifo_wr */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
>> +	if (mode_is_420)
>> +		pixel_clock /= 2;
>> +	opts.hdmi.tmds_char_rate = (u64)pixel_clock * 1000;
>> +	opts.hdmi.bpc = 8;
>> +	ret = phy_configure(dw_hdmi->phy, &opts);
>> +	if (ret)
>> +		return ret;
>>  
>>  	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
>>  
>>  	msleep(100);
>>  
>>  	/* Reset PHY 3 times in a row */
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> +	ret = phy_power_on(dw_hdmi->phy);
>> +	if (ret)
>> +		return ret;
> 
> [Severity: Medium]
> Do the error returns from phy_configure() and phy_power_on() leak a
> dw_hdmi->phy->init_count reference?
> 
> When dw_hdmi_phy_init() fails, dw_hdmi_setup() leaves hdmi->phy.enabled
> false, so dw_hdmi_poweroff() never calls dw_hdmi_phy_disable() to balance
> phy_init() with phy_exit().  A non-VIC DMT mode with a pixel clock below
> 25.175 MHz passes meson_encoder_hdmi_mode_valid() but is rejected with
> -EINVAL by meson_hdmi_phy_configure() -> meson_hdmi_phy_find_rate(),
> permanently elevating init_count so subsequent phy_init() calls skip
> hardware initialization.
> 
> [ ... ]
> 
>> @@ -623,10 +542,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>  	/* Enable normal output to PHY */
>>  	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>>  
>> -	/* Setup PHY */
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
>> -
>>  	/* Enable HDMI-TX Interrupt */
>>  	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>>  				       HDMITX_TOP_INTR_CORE);
> 
> [Severity: High]
> Does removing the initial PHY setup from meson_dw_hdmi_init() leave the
> HDMI TX PHY uninitialized whenever no HDMI video mode is active?
> 
> meson_dw_hdmi_init() pulses reset_control_reset(meson_dw_hdmi->hdmitx_phy)
> at bind and system resume time, while meson_venc_init() zeroes
> HHI_HDMI_PHY_CNTL0.  Commits 04703bfd7f99 ("drm/meson: dw-hdmi: power up
> phy on device init") and 08001033121d ("drm/meson: dw-hdmi: add bandgap
> setting for g12") programmed HHI_HDMI_PHY_CNTL1 and HHI_HDMI_PHY_CNTL0
> here because CEC and the G12A ARC/eARC utility pin need the PHY
> initialized even before the first HDMI modeset or when another display
> interface is used.
> 
> With phy_init() deferred to dw_hdmi_phy_init(), which dw_hdmi_setup() only
> calls when enabling an active HDMI display mode (and which
> meson_dw_hdmi_pm_resume() -> dw_hdmi_resume() does not call), the PHY
> stays in its post-reset state at boot and after resume whenever HDMI
> video is inactive.
> 

I will use v1 code and add a device link to solve suspend/resume order.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
