Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D881C636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 23:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzBp2AEW7R3t8JNJNN5qq68raEK4i18fUtZuI8CmGyk=; b=mYFsIwHPdsg7lH
	fVJQR6MfKW01Z+RVVMfEV4+8qrG9B4rXRBnbXMxhGjZUwoFtkq83wIuVyg8YqQPltndnDF8Li71kj
	ZM2HoA11v+CUhbFF5b1pkvUnJvtd0Zd0EVtELuCSKuOWMPZbhG4PvGgQ3ZKgT79RUdD2MG7bXN1de
	Y7OLoJWnUqGDD6F9xbu1jb1iSDLS1RZto+OezIHhK6NAnDA2bZ/Sp2t9QHW/jbeZ/wFUVD4NyDPZe
	gIxSyG8PQEv04XkIHh4NKLRtGddmaKwq3X3zSL/Z93F7N7HW4C95Xdsf9yRWQLLMY0E88deGGVzk3
	Hq0fQ7/Dx3ipIg28LkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRiZ9-00Go77-Ft; Mon, 13 Feb 2023 23:48:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRiYw-00Go1u-NK
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 23:48:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id k13so15336565plg.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 15:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkCNeSORsYc6WFEKacYRX0wbC50Zcx5IER4XSSJlizc=;
        b=zn9CuSmE+S0LORJdl4CiBNFT0k6mOJuY0zchBywp0mpgL8KUtyYteZVGNkTDPr95lg
         TYNa3zJXwPGJIANEUJNLFWdmNpKpEs/+K6N0yenRkD3p46VDJvt2FKAO5uZJi49XoBCV
         82w7VA6pqgX8EOFeGN9peWJw/7XuLDCpdZzY3vFMjWTLgnrf4GRWUSErw90hWa29VH7J
         +B3VFJvt6ZyYG3Wq8bClfuDqi1FiBPQwXSPuYO7nFCShhOkrejrxAk2/VIfro6yfAJUd
         TQhR4FTAe4A70U8TrNgnRQ/LwRycH4Fq0sAqzVjoy6HxqQ2hebPsA7DS0JTJapEUivrB
         RV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkCNeSORsYc6WFEKacYRX0wbC50Zcx5IER4XSSJlizc=;
        b=StVQRv0kIzwuqiirEgbnX/8CfjmV0I2NLHBeTncUYTjeziiK7mKcnNSczU0CN0CNUC
         I12vvBRIR1DpQD18p1I1Ej7uBEC9UGO0qJs8rgbQvb+A+Fs6yuqxjWhfnSF2tScdtgnK
         7bcIX9u8tJ704hiUVofK2nqRz1Rxb8HHnvVT8zkBHi+MgUti47nz3Cs9LwVTH3/WDhba
         qUeqUytc+Gw7z+XcKwHQdTAGWTZPxG6H/LnTYpJWFvkePjmb9K2WUgRfdaXR/7vOPBop
         uFO4iHoZwaZ98KI0trJ8n8H4O2IMU/S7KPnLlzKgY3OYf6Dd8dCY9QWpsrlFcvGvkTp7
         KG/g==
X-Gm-Message-State: AO0yUKUSypvgvRqyzSBf0trnyie7NeEjNP742hJ5YN9LYDih3pdLC5Y8
	eMYEKjtnPWo15vsXuqEAQAv3cFuhqChMrqXhhw9lNA==
X-Google-Smtp-Source: AK7set+ggBheB870d5LQZGZTGJQLon97bf4lGwg6a4C2/lc+oOwoASXu6j4Em8IAhVkXjl0iO379e4cbxDOxdh7fuGw=
X-Received: by 2002:a17:903:2341:b0:19a:9ba6:6526 with SMTP id
 c1-20020a170903234100b0019a9ba66526mr203311plh.2.1676332125406; Mon, 13 Feb
 2023 15:48:45 -0800 (PST)
MIME-Version: 1.0
References: <816cba9f-ff92-31a2-60f0-aca542d1d13e@gmail.com>
In-Reply-To: <816cba9f-ff92-31a2-60f0-aca542d1d13e@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Feb 2023 00:48:08 +0100
Message-ID: <CAPDyKFp_wK6Wyw5=hPEBf-Pgv=G2sK6uuD7ikVt0OBZLDWvSXg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] mmc: meson-gx: fix SDIO mode if cap_sdio_irq
 isn't set
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	Geraldo Nascimento <geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_154846_772136_C84D4801 
X-CRM114-Status: GOOD (  19.97  )
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

On Mon, 13 Feb 2023 at 21:55, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Some SDIO WiFi modules stopped working after SDIO interrupt mode
> was added if cap_sdio_irq isn't set in device tree. This patch was
> confirmed to fix the issue.
>
> Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
> Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> Tested-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
> - fix printf type issue
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213..5c94ad466 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -435,7 +435,8 @@ static int meson_mmc_clk_init(struct meson_host *host)
>         clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
>         clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
>         clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
> -       clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
> +       if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
> +               clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
>         writel(clk_reg, host->regs + SD_EMMC_CLOCK);
>
>         /* get the mux parents */
> @@ -948,16 +949,18 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  {
>         struct meson_host *host = dev_id;
>         struct mmc_command *cmd;
> -       u32 status, raw_status;
> +       u32 status, raw_status, irq_mask = IRQ_EN_MASK;
>         irqreturn_t ret = IRQ_NONE;
>
> +       if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
> +               irq_mask |= IRQ_SDIO;
>         raw_status = readl(host->regs + SD_EMMC_STATUS);
> -       status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
> +       status = raw_status & irq_mask;
>
>         if (!status) {
>                 dev_dbg(host->dev,
> -                       "Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
> -                        IRQ_EN_MASK | IRQ_SDIO, raw_status);
> +                       "Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
> +                        irq_mask, raw_status);
>                 return IRQ_NONE;
>         }
>
> @@ -1204,6 +1207,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 goto free_host;
>         }
>
> +       mmc->caps |= MMC_CAP_CMD23;
> +
> +       if (mmc->caps & MMC_CAP_SDIO_IRQ)
> +               mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
> +
>         host->data = (struct meson_mmc_data *)
>                 of_device_get_match_data(&pdev->dev);
>         if (!host->data) {
> @@ -1277,11 +1285,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>         spin_lock_init(&host->lock);
>
> -       mmc->caps |= MMC_CAP_CMD23;
> -
> -       if (mmc->caps & MMC_CAP_SDIO_IRQ)
> -               mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
> -
>         if (host->dram_access_quirk) {
>                 /* Limit segments to 1 due to low available sram memory */
>                 mmc->max_segs = 1;
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
