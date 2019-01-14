Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D7C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 11:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB68920659
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 11:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FF0nEOaw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="KefybJFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB68920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9bqPcTnyDiNZKBYJqoFosrlDC4XO0dO8zMM8dIyo5Y=; b=FF0nEOaw5fwq86
	4pOYScj8yuZrrVIQFCqOk5xktwfgMZnP3MfuyacMDolLxLgcTwep8QBXYeQSnORVlkOijKntKGIE9
	RisX2dV+Vm2R8lY+YJ+oTmSiMCnhCkCdKgyJgmGVXn5qe+SIdyx5ipR87vaNfvgxcxdFeA23Gejty
	PMi64YmgdsDBXOjD+Wl2DBXIB576DlJ7aJCWX41EQ0wbI8LNdEROC3DM0QKu3R+ehlHacMZUhaGOV
	d/U/VeNKjSq7wRC5WmMkdsafnIHrL78Y5VTDNYZfvr4wSv3Cciz1OqLhCzXxQjpsnnZbP0w7zD4eV
	ZwizNRThXuhKiKSSMqtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj0gu-0005vP-Pd; Mon, 14 Jan 2019 11:46:04 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj0gb-0005Do-BQ
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 11:46:02 +0000
Received: by mail-vk1-xa43.google.com with SMTP id y14so4770699vky.9
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5GvtAoNZhHeEA8ikbHXVTVTkT55HDIL3P0c9+r9xsI=;
 b=KefybJFjQ5uTsZA+RPmXnykbQPKiSXuF4LGHDS/hMoWeJMOmoe3DJe3pFiGJg8T5g0
 No+u54vx9Vzq8d2qBPZZ03Nw5wd3zKnC6KLVN3FlAtxocK9qSH8ujnTyZU49t42YWKPU
 PVW69dcND6nwDPotgLqQFdp6sa17B2sMP6Pbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5GvtAoNZhHeEA8ikbHXVTVTkT55HDIL3P0c9+r9xsI=;
 b=ih6rrKES+UCLAzc5K/OfSs1N0lF9mERc34bWduC+maslYP6DWUVvvk6jQfKoODC2Vk
 oFKG6d+ID8jN+E+qYurytdZd4PaevaDjX9nutu6j8Nm1sJFFemkkBwHfFqP2d7djECAM
 +5ISmHnOdc47KgWhLEQPBw3sHZbEgeAwJ9PGmVAfONsYv4TOCeoPojAWbpTCyIcM3DUK
 Th3TttHQXnXhSrx0pUEkctXDUMh/DZAI4mcsYOYSCY3UjA55vL0QCKopubBigWc2mI+X
 VRo9p5WAd7w2X/1RK198n45AzHHktoYMtJ21WPS3dc25tlZAW/2MosVToCEyhamtZMU4
 dNbg==
X-Gm-Message-State: AJcUukf1unodilh0ZfBye8eAQN+0NzRB8Zxi3yHj+FFm32PYwHCsMzXC
 V6e9r+93tqbLzcKMopqP7T27nXvKgnTvhFRs+XOLQw==
X-Google-Smtp-Source: ALg8bN4M+PHLL0qnibx8utyIYR5n2V3lpvI85XR+uHbiXtdLTpy3OgCROE3SeMg6zkFtZCyhHxSNizadGyq8yx8+qho=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr9453367vkp.40.1547466343611; 
 Mon, 14 Jan 2019 03:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20190110230135.19555-1-repk@triplefau.lt>
In-Reply-To: <20190110230135.19555-1-repk@triplefau.lt>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Jan 2019 12:45:07 +0100
Message-ID: <CAPDyKFokQOr1wyeJqe9=CLmw47jNXaQEmK0ZJYHwPkReSHcRXg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-gx: Free irq in release() callback
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_034546_106517_14BEF6A8 
X-CRM114-Status: GOOD (  19.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Elie Roudninski <xademax@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 10 Jan 2019 at 23:52, Remi Pommarel <repk@triplefau.lt> wrote:
>
> Because the irq was requested through device managed resources API
> (devm_request_threaded_irq()) it was freed after meson_mmc_remove()
> completion, thus after mmc_free_host() has reclaimed meson_host memory.
> As this irq is IRQF_SHARED, while using CONFIG_DEBUG_SHIRQ, its handler
> get called by free_irq(). So meson_mmc_irq() was called after the
> meson_host memory reclamation and was using invalid memory.
>
> We ended up with the following scenario:
> device_release_driver()
>         meson_mmc_remove()
>                 mmc_free_host() /* Freeing host memory */
>         ...
>         devres_release_all()
>                 devm_irq_release()
>                         __free_irq()
>                                 meson_mmc_irq() /* Uses freed memory */
>
> To avoid this, the irq is released in meson_mmc_remove() and in
> mseon_mmc_probe() error path before mmc_free_host() gets called.
>
> This fixes https://marc.info/?l=linux-mmc&m=154707415208716.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>

Applied for fixes! I also added a stable tag and a reported-by tag
from Elie, thanks!

Kind regards
Uffe


> ---
> Changes since v1:
> - Fix it also in the error handling of probe callback
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c2690c1a50ff..f115d7c63ffe 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -179,6 +179,8 @@ struct meson_host {
>         struct sd_emmc_desc *descs;
>         dma_addr_t descs_dma_addr;
>
> +       int irq;
> +
>         bool vqmmc_enabled;
>  };
>
> @@ -1231,7 +1233,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         struct resource *res;
>         struct meson_host *host;
>         struct mmc_host *mmc;
> -       int ret, irq;
> +       int ret;
>
>         mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
>         if (!mmc)
> @@ -1276,8 +1278,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 goto free_host;
>         }
>
> -       irq = platform_get_irq(pdev, 0);
> -       if (irq <= 0) {
> +       host->irq = platform_get_irq(pdev, 0);
> +       if (host->irq <= 0) {
>                 dev_err(&pdev->dev, "failed to get interrupt resource.\n");
>                 ret = -EINVAL;
>                 goto free_host;
> @@ -1331,9 +1333,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
>                host->regs + SD_EMMC_IRQ_EN);
>
> -       ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
> -                                       meson_mmc_irq_thread, IRQF_SHARED,
> -                                       NULL, host);
> +       ret = request_threaded_irq(host->irq, meson_mmc_irq,
> +                       meson_mmc_irq_thread, IRQF_SHARED, NULL, host);
>         if (ret)
>                 goto err_init_clk;
>
> @@ -1351,7 +1352,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         if (host->bounce_buf == NULL) {
>                 dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
>                 ret = -ENOMEM;
> -               goto err_init_clk;
> +               goto err_free_irq;
>         }
>
>         host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> @@ -1370,6 +1371,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  err_bounce_buf:
>         dma_free_coherent(host->dev, host->bounce_buf_size,
>                           host->bounce_buf, host->bounce_dma_addr);
> +err_free_irq:
> +       free_irq(host->irq, host);
>  err_init_clk:
>         clk_disable_unprepare(host->mmc_clk);
>  err_core_clk:
> @@ -1387,6 +1390,7 @@ static int meson_mmc_remove(struct platform_device *pdev)
>
>         /* disable interrupts */
>         writel(0, host->regs + SD_EMMC_IRQ_EN);
> +       free_irq(host->irq, host);
>
>         dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
>                           host->descs, host->descs_dma_addr);
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
