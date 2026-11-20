Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03459606A335
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4V3t8FXO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZGVmGiIs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=vYBXbJye
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zmVvSnblrsyLkwuy+Z+jgRUAl8VNmPlTSUvA7ABWhEI=; b=4V3t8FXO6RJoQ5WSHobXOqldSq
	QbYTdvxCoYEhTmMIZtQ22kT6OfWw3/S4HdocEQ55HduGw+K3tQSBpeSCUX8CYcaPPw9vplhRxuV9t
	ciVZWHv6hkxkzCrBRthoGVrvJyemtKAz71EDyL+rMkDIKDv1WkDs33DMkj5GCSspOfpn6c8XlUDFL
	IKlTj9szdhpFNA1oC3bd3C0OgRUhT2F02NubTprhF7329QbgTgxiNl81TBP2nf8SDOX2/alAkfMYI
	He78NkNtSZqP0pV0DQKWZQlfHwE+kKiw/OLC0kPBEfbn9d1VJzgI0GH3YgZ4fgMgiOsut2A7AsuoL
	FWdXY+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSpC-0000000Fon7-1yOi;
	Fri, 20 Nov 2026 17:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSnp-0000000Fniy-2Zp6;
	Fri, 20 Nov 2026 17:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kjTn6xldicO6RCtt89/zeFZNDZh8oCX8apMB4+cXgjk=; b=ZGVmGiIsi1MOUQsWUJe/MAqCCX
	Riit6LEgycvyRqDZEK0DoBiYPJa8ZPx1zyVqhIiTcEH/doRg3/YcsDyYomD+Y1ftgJMN5RX/aQrPv
	ROGmA/hAVXbismUIRYy76C6Lq90G3nBjuYA9ffwhs7917eBzjqL3Ta/1FiVHwWel92bSyxNcmgiE/
	kLpPul+A4HY4TGGPzFLVXe5WmY0K1vSLsmAxREx8XtWPv+EzCRdlYxecAwS5o6qlQk1QjMCMgV2Oh
	YPPbgiK8kBHk099Riq6fTrmjYpH4pjwE3cPH1bb0C5R4ds4PQ3zgx/wYKaI4AoS/7gS60xsfHRtqH
	P5yEZxhw==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSnm-000000012DX-2ye8;
	Fri, 20 Nov 2026 17:53:36 +0000
Message-ID: <ef1b7465-9639-4d11-9b10-4b0c9da21bd5@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795197201;
	bh=V8tpS6gdtCA8ZbK1QEzTWT9dOlqALvACzeGN4IBIn60=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=vYBXbJyeFCDtVKTZkks5hS0kKXgmajx0a9aGeWOoL6LRhNYO0O1MO2QARIZQDEbki
	 ezb0rth3CwzPZpsK6kXyuX92iK0FDNFUbi2O3bjhrJgqn4rOtuRJaiEuf4sQG3B6Sm
	 eZmcENqezW7RZGDTK3ggXRmbK6y/wimX1gYVvpM8=
Date: Fri, 20 Nov 2026 18:52:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 07/10] drm/meson: dw-hdmi: Use the generic PHY framework
 for the HDMI TX PHY
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-7-9e0ac931381c@aliel.fr>
 <sashiko-outbox-219549@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219549@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_175334_739093_3F26ABC0 
X-CRM114-Status: GOOD (  19.39  )
X-Spam-Score: -0.2 (/)
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

On 11/17/26 21:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] drm/meson: dw-hdmi: suspend/resume order breaks PHY state and
>   HDMI output
> - [Medium] drm/meson: dw-hdmi: missing phy_exit() on dw_hdmi_probe()
>   failure
> - [Medium] drm/meson: dw-hdmi: premature PHY teardown in
>   meson_dw_hdmi_unbind()
> --
> 
> commit 91e31ad4e0b36171e791e7c0487c9a4c66b12b31
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
> 
> This commit converts meson_dw_hdmi from direct HHI_HDMI_PHY_CNTL0..5
> register writes to the generic PHY API, with a legacy fallback when the
> device tree lacks a "phys" property.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 20a821936b3af..f28cc1e6ee1df 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> 
> 
> [Severity: Medium]
> Does meson_dw_hdmi_bind() leak a phy_init() reference if dw_hdmi_probe()
> fails later in this function (for example with -EPROBE_DEFER when the DDC
> I2C bus is not ready)?
> 
> When the PHY comes from the external PHY provider, devres cleanup on a
> failed component bind only calls phy_put(), leaving phy->init_count at 1.
> On the next bind attempt, meson_dw_hdmi_init() resets hdmitx_phy and calls
> phy_init(), which sees init_count > 0 and skips phy->ops->init(), leaving
> HHI_HDMI_PHY_CNTL0 and HHI_HDMI_PHY_CNTL1 uninitialized after the hardware
> reset.
> 

I will move revert this change.

> [Severity: Medium]
> Can tearing down meson_dw_hdmi->phy before devm_free_irq() and
> dw_hdmi_unbind() cause a use-after-free in dw_hdmi_top_thread_irq()?
> 
> CPU0                                    CPU1
> meson_dw_hdmi_unbind()
>   phy_exit(meson_dw_hdmi->phy)
>   devm_phy_destroy(..., meson_dw_hdmi->phy)
>                                         dw_hdmi_top_thread_irq()
>                                           dw_hdmi_setup_rx_sense()
>                                             ...
>                                               dw_hdmi_phy_init()
>                                                 phy_configure(dw_hdmi->phy, ...)
>                                                   <-- use-after-free
>   devm_free_irq(...)
>   dw_hdmi_unbind(...)
> 
> In the legacy PHY path, devm_phy_destroy() immediately unregisters and
> frees meson_dw_hdmi->phy while the threaded HPD interrupt handler is still
> active and can invoke dw_hdmi_phy_init() or dw_hdmi_phy_disable().  Even
> with a DT PHY, HPD handling or dw_hdmi_unbind() can access the PHY after
> phy_exit().  Should phy_exit() and devm_phy_destroy() run after
> devm_free_irq() and dw_hdmi_unbind()?
> 

I will move the phy_destroy after unbind, phy_exit will be on
phy_disable only.

> [Severity: High]
> Does calling phy_exit() in meson_dw_hdmi_pm_suspend() and phy_init() in
> meson_dw_hdmi_pm_resume() break HDMI output across system suspend/resume?
> 
> Because the HDMI TX platform device sits after the VPU master device on
> dpm_list (both from DT node order and because devm_phy_optional_get() adds
> a stateless device link to the PHY that reorders the consumer to the tail
> of dpm_list), system suspend runs meson_dw_hdmi_pm_suspend() before
> meson_drv_pm_suspend(), and system resume runs meson_drv_pm_resume()
> before meson_dw_hdmi_pm_resume().
> 
> On suspend, meson_dw_hdmi_pm_suspend() calls phy_exit() while the PHY is
> still powered on, before meson_drv_pm_suspend() ->
> drm_mode_config_helper_suspend() -> dw_hdmi_phy_disable() calls
> phy_power_off().
> 
> On resume, meson_drv_pm_resume() -> drm_mode_config_helper_resume() ->
> dw_hdmi_phy_init() calls phy_configure() and phy_power_on() while
> phy->init_count is still 0.  Then meson_dw_hdmi_pm_resume() runs
> meson_dw_hdmi_init(), which resets hdmitx_phy and calls phy_init(); since
> phy->power_count > phy->init_count, phy_init() warns ("phy_power_on was
> called before phy_init") and runs meson_hdmi_phy_init(), overwriting
> HHI_HDMI_PHY_CNTL0 and HHI_HDMI_PHY_CNTL1 with cntl0_init and cntl1_init
> and clobbering the mode that meson_drv_pm_resume() just configured and
> powered on.
> 

I will put phy_init in dw_hdmi_phy_init and phy_exit in
dw_hdmi_phy_disable for v2.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
