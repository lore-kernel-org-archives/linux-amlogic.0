Return-Path: <SRS0=c9//=B5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1429AC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2020 15:03:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64032076E
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2020 15:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jE1SbQwV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c9LdyZq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D64032076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MFs6yGhBcXAKrAxsHzWomCwx36sUKIcXnAZ2fAnizhw=; b=jE1SbQwVAG8R/UzNTZ6gKx+Md
	cuLhd7nbF+2MpRY3ucTtLgeQS/V6zb90PL0ACAdN/Q0uGJQTbsrTWB4dEmATg82y7sNkw32XIG3U0
	5ch5c/tiBR3oB0QdTrMNFpSEgu4t7OPcLsxMB86TUo+Dae7kewzscXEaQYRkAFAjxw9Fx8YFAPPtm
	2LkFurJrzkzt41O5S6ILRQ2gaLL0Npw4AVXy71+V0TZfi6BzbDczgI7dflGmf+ePpGhocwccQ6Spk
	wbD8Vu38/77AWpNjEH4jhwr7zAm3zi+hCZvj2pkLKF1m8D30pCniYSgC+Q/TBBG+JOlhBoC0+Ki2h
	OHy6K3KnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Pcq-0001wm-Fj; Wed, 19 Aug 2020 15:03:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Pcn-0001vj-6r
 for linux-amlogic@lists.infradead.org; Wed, 19 Aug 2020 15:03:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id 9so2391546wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Aug 2020 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=eu4v7h7KMBfOvFVp/MrsRWeah+PO2aIM6NFVUEyYhkE=;
 b=c9LdyZq4Qxd2LaobNpvW5gJk+D4RiNfx+DKY63RNIIdWvfaKV4e3xZAsJrKvPzdWHS
 +36QvaDKLZBBa8MlKOYCgSNdB56Fxm5yLHAhFDtajpuCHgXiNGh/AtOa5lEY2uu9FI/J
 TRbPklyA04wS+0eE+bxWqGTOydDIVxCZ5g9BUKREMoslQYwUKn0R71HZXc4VO+OvP39O
 Kk3rgQaR0hAP0e+9jT69jhvkjzNMUw/BuaA9W6y2MG6KW/uukFjpjiLlTREbAhSf4F2I
 VjS7/28FAjMF4k7FmM2yRoGG8YJd2XWPqtsucLV5oV/jjyH7jEaG6drqZTHeysIhFmo4
 3Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eu4v7h7KMBfOvFVp/MrsRWeah+PO2aIM6NFVUEyYhkE=;
 b=CmGv5+NB3l8L0Tgq23kNqlj4jR40Pg+sOcdu/Zbc8P266vBhn5SMYFDfQv/hA+o2dR
 iRjf0SAV/QxuxH10vo4i0cj92yQTAhMGI1NMYA7XW53VOkZounDrJ3wKQYZrKTFAmsSV
 WnPQPq/xXns7EeKW+BDS7CoVCX1DQMneSawTxc6t04JX/J6+IKSgayai5I958IR6VB7v
 cFkEQrRvpySonBG4xOTMVOG8UsIvoqmhB8fz/pbkMolOh4xx3y5ZCJsBOfAcgEZkpjKn
 qk+0BdF8mgTOtFz2kjEeCOTKUUt1kZN3bh2HBKcs9xreFdTpqTP0homedYftkJWdywT6
 WQsQ==
X-Gm-Message-State: AOAM530H89i2MmXYyrpWEbOSsxSPlotblyElx0BvqtEnU+NTCA9eqW8U
 kOOO4xOdviqA/sNX52u3uay6fQ==
X-Google-Smtp-Source: ABdhPJwDTbg93K1fdXxlEGzb/pYz/Mc9T5E6t719CnJRZRuY06stun/UbbDlmYSAm5talGq2zuADug==
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr5629808wmj.13.1597849414286; 
 Wed, 19 Aug 2020 08:03:34 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p3sm5719559wma.44.2020.08.19.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 08:03:33 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <20200713160522.19345-2-dan@dlrobertson.com>
Date: Wed, 19 Aug 2020 17:03:32 +0200
Message-ID: <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_110337_373820_D0AF46BD 
X-CRM114-Status: GOOD (  25.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 aouledameur@baylibre.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:

> The reset is a shared reset line, but reset_control_reset is still used
> and reset_control_deassert is not guaranteed to have been called before
> the first reset_control_assert call. When suspending the following
> warning may be seen:

And now the same type of warning maybe seen on boot. This is
happening for me on the libretech-cc (s905x - gxl).

[    1.863469] ------------[ cut here ]------------
[    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
[    1.876525] Modules linked in:
[    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-00167-ga2e4e3a34775 #64
[    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
[    1.893525] Workqueue: events deferred_probe_work_func
[    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
[    1.904126] pc : reset_control_reset+0x130/0x150
[    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
[    1.913439] sp : ffff8000123ebad0
[    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000 
[    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0 
[    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0 
[    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000 
[    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80 
[    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff 
[    1.948284] x17: 0000000000000000 x16: 000000000000000e 
[    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff 
[    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff 
[    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f 
[    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000 
[    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000 
[    1.979851] x5 : 0000000000000000 x4 : 0000000000000000 
[    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370 
[    1.990374] x1 : 0000000000000001 x0 : 0000000000000001 
[    1.995636] Call trace:
[    1.998054]  reset_control_reset+0x130/0x150
[    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
[    2.006677]  phy_init+0x78/0xd0
[    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
[    2.014182]  platform_drv_probe+0x58/0xa8
[    2.018149]  really_probe+0x114/0x3d8
[    2.021770]  driver_probe_device+0x5c/0xb8
[    2.025824]  __device_attach_driver+0x98/0xb8
[    2.030138]  bus_for_each_drv+0x74/0xd8
[    2.033933]  __device_attach+0xec/0x148
[    2.037726]  device_initial_probe+0x24/0x30
[    2.041868]  bus_probe_device+0x9c/0xa8
[    2.045663]  deferred_probe_work_func+0x7c/0xb8
[    2.050150]  process_one_work+0x1f0/0x4b0
[    2.054115]  worker_thread+0x210/0x480
[    2.057824]  kthread+0x158/0x160
[    2.061017]  ret_from_fork+0x10/0x18
[    2.064550] ---[ end trace 94d737efe593c6f6 ]---
[    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
[    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -22

This breaks USB on this device. reverting the change brings it back.

Looking at the reset framework code, I don't think drivers sharing the
same reset line should mix using reset_control_reset() VS
reset_control_assert()/reset_control_deassert()

>
> WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> Hardware name: Hardkernel ODROID-N2 (DT)
> [..]
> pc : reset_control_assert+0x184/0x19c
> lr : dwc3_meson_g12a_suspend+0x68/0x7c
> [..]
> Call trace:
>  reset_control_assert+0x184/0x19c
>  dwc3_meson_g12a_suspend+0x68/0x7c
>  platform_pm_suspend+0x28/0x54
>  __device_suspend+0x590/0xabc
>  dpm_suspend+0x104/0x404
>  dpm_suspend_start+0x84/0x1bc
>  suspend_devices_and_enter+0xc4/0x4fc
>  pm_suspend+0x198/0x2d4
>
> Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 1f7f4d88ed9d..88b75b5a039c 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		goto err_disable_clks;
>  	}
>  
> -	ret = reset_control_reset(priv->reset);
> +	ret = reset_control_deassert(priv->reset);

The change introduced here is significant. If the reset is not initially
asserted, it never will be before the life of the device.

This means that Linux will have to deal which whatever state is left by the
bootloader. This looks sketchy ...

I think the safer way solve the problem here would be to keep using
reset_control_reset() and introduce a new API in the reset
framework to decrement the reset line "triggered_count"
(reset_control_clear() ??)

That way, if all device using the reset line go to suspend, the line will
be "reset-able" again by the first device coming out of suspend ?

Philip, would you be ok with such new API ?

In the meantime, I think this change should be reverted. A warning on
suspend seems less critical than a regression breaking USB completly.

>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	ret = dwc3_meson_g12a_get_phys(priv);
>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	ret = priv->drvdata->setup_regmaps(priv, base);
>  	if (ret)
> @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (priv->vbus) {
>  		ret = regulator_enable(priv->vbus);
>  		if (ret)
> -			goto err_disable_clks;
> +			goto err_assert_reset;
>  	}
>  
>  	/* Get dr_mode */
> @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  
>  	ret = priv->drvdata->usb_init(priv);
>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	/* Init PHYs */
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		ret = phy_init(priv->phys[i]);
>  		if (ret)
> -			goto err_disable_clks;
> +			goto err_assert_reset;
>  	}
>  
>  	/* Set PHY Power */
> @@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>  		phy_exit(priv->phys[i]);
>  
> +err_assert_reset:
> +	reset_control_assert(priv->reset);
> +
>  err_disable_clks:
>  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
>  				   priv->drvdata->clks);
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
