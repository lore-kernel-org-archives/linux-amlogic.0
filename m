Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72460A2602
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KC4HL2lY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=Nj6zi7Fo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZUvrFn2A1kwqfiUiIXNtR+jqMDR529Zc493Hlsl4iHA=; b=KC4HL2lY0bu5q1jdSKwlK4O5Cj
	Fm962OWsLAAaRSpNCrVSFrczvEKHEMbzFg+3So4ZKNBJsEChb8V3k2jl4UFlVe7tNxSpH2uC1Kbv/
	YChv6Ok8Gtha/QBR2AcMuwBZRz3hLuXpxsjWeNim78o3w6L+a+0E1zlXgM6opurBLXGQ5qe67W7bS
	Tl9OumGh+V30XVLWDZTMLpWhZCVHWq+IHVWSat8DH7y77/aYRs6QMZofQmjhqJKofE75CsCf7sONS
	dCz+sHtKc2GkoYNjz8CthjO6mIxtBEZqPnRtNoUHdk0X7FkW7Utdpb5E7Oe2zL0GL2lxbrrkWrCDy
	lWTA/9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU460-0000000CSof-0sB4;
	Thu, 19 Nov 2026 15:30:44 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45u-0000000CSjM-3AnJ;
	Thu, 19 Nov 2026 15:30:43 +0000
Message-ID: <ec9c8460-a8de-460e-92bb-dc03240152bb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795102234;
	bh=3cxvdL4KfFwcHXkWK7rQriyomVokMs5MeD2OaggeClQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Nj6zi7Fo0ca5Ps9aUATozF/jxT6gCv+7SS7P/dwLIZlh4hIVjAk7MXSsgA7JbBLy7
	 lf+mFz55owqBoYAWIJldfRz0SSqxgdM6lEpUk0rQzL+74rNH31mts30Mc31SPIGjA+
	 FTOPuTK24MLzcb6ip2CCC7ddL/fChzsbgAjliXNI=
Date: Thu, 19 Nov 2026 16:30:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 06/10] drm/meson: dw-hdmi: Drop manual HHI clock and
 memory PD setup
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-6-9e0ac931381c@aliel.fr>
 <sashiko-outbox-219570@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219570@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073039_262413_4A12CE00 
X-CRM114-Status: GOOD (  21.00  )
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

On 11/17/26 21:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/meson: dw-hdmi: skipped HDMITX mem PD power-up in
>   meson_dw_hdmi_init()
> --
> 
> commit c8e782099f758bf635402705a20f57d7df9682a7
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
> 
> This commit removes the direct HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0
> register writes in meson_dw_hdmi_init() and takes a runtime PM reference
> in meson_dw_hdmi_probe() to power on the VPU power domain.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index eb33c70f29c31..20a821936b3af 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> [ ... ]
>> @@ -599,12 +598,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>  {
>>  	struct meson_drm *priv = meson_dw_hdmi->priv;
>>  
>> -	/* Enable clocks */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
>> -
>> -	/* Bring HDMITX MEM output of power down */
>> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
>> -
>>  	/* Reset HDMITX APB & TX & PHY */
>>  	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
>>  	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
>> @@ -829,9 +822,29 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +static void meson_dw_hdmi_pm_put(void *dev)
>> +{
>> +	pm_runtime_put_sync(dev);
>> +}
>> +
>>  static int meson_dw_hdmi_probe(struct platform_device *pdev)
>>  {
>> -	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to power on HDMI TX\n");
> 
> [Severity: High]
> Can dropping the HHI_MEM_PD_REG0 write leave the HDMITX memory powered
> down when the bootloader turns on the top-level VPU domain without
> enabling HDMI?
> 
> In the VPU power domain driver, pwrc_ee_is_powered_off() only checks the
> top-level AO sleep bit and does not check HHI_MEM_PD_REG0[15:8].  When
> the top-level VPU domain is already powered on at boot,
> meson_ee_pwrc_init_domain() registers the genpd as already on without
> calling meson_ee_pwrc_on():
> 
> drivers/pmdomain/amlogic/meson-ee-pwrc.c:meson_ee_pwrc_init_domain() {
> 	...
> 	if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_powered_off(dom)) {
> 		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
> 		if (ret)
> 			return ret;
> 
> 		dom->base.flags = GENPD_FLAG_ALWAYS_ON;
> 		ret = pm_genpd_init(&dom->base, NULL, false);
> 		if (ret)
> 			return ret;
> 	}
> 	...
> }
> 
> Because the genpd is initialized in the ON state with
> GENPD_FLAG_ALWAYS_ON, pm_runtime_resume_and_get() is a no-op and
> meson_ee_pwrc_on() never runs to clear HHI_MEM_PD_REG0[15:8], leaving
> HDMITX memory powered down when meson_dw_hdmi_init() and dw_hdmi_probe()
> access the controller.
> 

I will add a new patch with a function to release the memories power off
bits in v2.

> In addition, power-domains and assigned-clocks are optional in the
> amlogic,meson-dw-hdmi binding and were only added to in-tree DTs in
> v6.11, so dropping the HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 writes also
> regresses older DTBs (where meson_vclk_set() only configures
> HHI_HDMI_CLK_CNTL later at atomic_enable time) and builds with CONFIG_PM
> disabled.
> 

I will add a depends on PM in v2.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
