Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510EACD128A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 02:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKSRbivm8cK6N1gev5XLJRYT2iB2N0fGl1kck0gTY3s=; b=oJvihppSawTvyh
	Vn+nmF0UY2IICzw5AjtnOSYh/BZy2pbMwTP7k5zfa1FYziqpg9yBgBjmZ76s9WMBplmTHmkUeRkI8
	hcJRXDgoAcaqOwym8bsccgP4G8nIIGWbChpi5BxDmI2/4/TUw+wc2u75RIGM2bfbp4p3IIkp7jpeF
	o68T/fc/nGzqeMdGpZR2gF/5oHJJOppSjOLp5ZtLHRWoec81wg5+ErJt78cVyuU9h1zCfg5Q34LUc
	QBRH6HWtNC63uvvnlBylILP3NCh+3o8lp5vl9M3FJEFwZXkrbq9isJ8qKchwaeX9/HaKd4QRrT3C4
	DdwCnN8WfYsKR8XeP4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruNgf-00000004kKW-0Vpw;
	Wed, 10 Apr 2024 02:27:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruNgb-00000004kJZ-2O6L;
	Wed, 10 Apr 2024 02:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56E34CE255F;
	Wed, 10 Apr 2024 02:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7921FC433C7;
	Wed, 10 Apr 2024 02:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712716058;
	bh=KCZk5Jghp9ioOCljK8ePjGa/GSS059iFLxQINPpp1zg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cIVXz2yVe7ImcNYM7wBUtIVH3Cy2FfbisfRQ6w1VZOtS98YSFvZBVemDOxX2wRjlh
	 qp9KtrdBV4GqnI4PQE3m42UGIqt2xiOrQI7AadLeMSEKX8h+SDl6ae7vSnSWaE+7il
	 1xPhVhzCMwkZbrffA4beBS9yVbxTWNX8sjxYNRd7NzlmRB4Sk96MkOpblZSZmFMRmY
	 fdY5cy3BCh0lC516EQNQxKmmq8FHiV6gBJ7pyQop6ShhDd+VaZ0qxlDxxEKvpBzJU/
	 YJQZu0B0Yfg8lKTvD5B55HrdrBE7sLIQkKM5KqpKdGA5M9ucZ0x+yWOXu9pO6qbkzX
	 5uUSILmGfGBtQ==
Message-ID: <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240409-shallow-voice-c84ed791bc7d@spud>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com> <20240328010831.884487-2-jan.dakinevich@salutedevices.com> <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com> <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org> <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de> <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org> <20240408-numerator-escargot-a642507a598e@spud> <20240409-shallow-voice-c84ed791bc7d@spud>
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code to separate module
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Conor Dooley <conor@kernel.org>
Date: Tue, 09 Apr 2024 19:27:36 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_192742_002354_333F2D89 
X-CRM114-Status: GOOD (  32.84  )
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

Quoting Conor Dooley (2024-04-09 05:05:37)
> On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:
> 
> > > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
> > > > starfive-jh7110 drivers are examples of this.
> > > > 
> > > > > The auxiliary device creation function can also be in the
> > > > > drivers/reset/ directory so that the clk driver calls some function
> > > > > to create and register the device.
> > > > 
> > > > I'm undecided about this, do you think mpfs_reset_controller_register()
> > > > and jh7110_reset_controller_register() should rather live with the
> > > > reset aux drivers in drivers/reset/ ?
> > > 
> > > Yes, and also mpfs_reset_read() and friends. We should pass the base
> > > iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
> > > then move all that code into drivers/reset with some header file
> > > exported function to call. That way the clk driver hands over the data
> > > without having to implement half the implementation.
> > 
> > I'll todo list that :)
> 
> Something like the below?
> 
> -- >8 --
> From a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Tue, 9 Apr 2024 11:54:34 +0100
> Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to the
>  reset subsystem
> 
> <insert something here>
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks pretty good.

>  static const struct of_device_id mpfs_clk_of_match_table[] = {
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 7f3fb2d472f4..27cd68b4ee81 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -137,9 +139,67 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>         return devm_reset_controller_register(dev, rcdev);
>  }
>  
> +static void mpfs_reset_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +static void mpfs_reset_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       kfree(adev);
> +}
> +
> +static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       adev->name = "reset-mpfs";
> +       adev->dev.parent = clk_dev;
> +       adev->dev.release = mpfs_reset_adev_release;
> +       adev->id = 666u;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return adev;
> +}
> +
> +int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       mpfs_reset_addr = base;

Instead of a global this can be stashed in adev->dev.platform_data and
grabbed in the driver probe?

> +
> +       adev = mpfs_reset_adev_alloc(clk_dev);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
> +}
> +
>  static const struct auxiliary_device_id mpfs_reset_ids[] = {
>         {
> -               .name = "clk_mpfs.reset-mpfs",
> +               .name = "reset_mpfs.reset-mpfs",
>         },
>         { }
>  };
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 09722f83b0ca..0b756bf5e9bd 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -43,11 +43,11 @@ struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_
>  #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
>  
>  #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
> -
> -u32 mpfs_reset_read(struct device *dev);
> -
> -void mpfs_reset_write(struct device *dev, u32 val);
> -
> +#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
> +int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base);
> +#else
> +int mpfs_reset_controller_register(struct device *clk_dev, void* __iomem base) { return 0;}

static inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
