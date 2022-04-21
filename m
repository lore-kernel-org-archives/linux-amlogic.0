Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E1C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAVMySALsOrj5QXoHso8Mb8hFkNOwO/MVLY2n1+TWhU=; b=vB0z6YoXFZDG5j
	BfVxFfnfoMICxxO/KZ4HvjeeqJC/kS4zD0xuk5ilrWlSEFwJo/9fGiPgLc6vWop0oqpa8qa7PHyqp
	hzIcIgfx+GNInTbiJC1MjJAqn2ct0CTj7FEUu9t4JxvqdTCJeB31+p6uTRAMFF6xkKrfx3rHJ+p5b
	7nPcVR/jFC2FZgOE16H9sv0KR6ec73z1etc9X77n/2GRsQ76xLUPhLEKk1zGobrqdr4v6qCe4jVFG
	HL5c1hMPFEWHk0w9xrbOm5gfxoMh/kA2Jt8O6N9N626Y02Y7P45DvfoOdM7SxXqEyOsB0nnSfGdYr
	jZ1E7GHklvjlaKFvA6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXHG-00DdGN-My; Thu, 21 Apr 2022 13:55:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXHB-00DdDH-JI
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 13:55:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id g19so8868215lfv.2
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1m4AunmkAyYhQRZKtO3MCeckkXGo7/NFOomuxmIZ6A=;
 b=NVmtpNbCAgcU4SAhBqvakdaIXemPxcZFwtW3Qhbc8JoUcLt9FPdViNgk+2srrxDCzI
 4ADj7w/uL94/xdK5X9XHHN8ROeXVEOiiT1Det4GzxGpUy8FGZz6rAkENZzCQDFiyXey9
 Uhk1Qwi/5s6lfP9t5YIHYwk/AkPsnuiXLg94gFwmhLL36qbwxDHgxNWPc6SHstxxVoxL
 r2PGSadZxcgopPoWesIbtr+ld615brFPNd5pUZIIp6a4AJTBD8BJ71FwVvbx5qVGGHm0
 MhL3iEnWfCjtpsSujnP41Vst/s0eDeWBt4gWeb5dTCGKQE2GkarZl5ZxN5RzJy8vyi9H
 fQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1m4AunmkAyYhQRZKtO3MCeckkXGo7/NFOomuxmIZ6A=;
 b=zBMuzmTR8uMAuH8heC3I9DR7A3GICHPuiPUkclofbHRyFtfcJhNXbE/aA8YLvRT49h
 raJCBU8ZaIykBzo6XUnPzQxffUK3Q1rFMbvJoUEAAusgU7yVzcxRJvDbC/9frmAmSPj+
 iujX8mdqYF8OgHQ7zBr8vDCHZedS6Qi9gtqgQYZQEVRjszeL852I7swhV4T9h1pUjPSX
 CVrtJPHRjGwnI/Jagfh1pcqVX6+WB+/4effulVdsbV86vgSASS6ntZU5DDSXu6bhRP/N
 hRAtNReDiEKDZUzm0B4h7ntKBagdtdzDkf5Jdz8pRiqSmBsCf8jtJ7tb2dQpeAoYTHeQ
 kRRw==
X-Gm-Message-State: AOAM533ZgLODrgRLGObNP3eax58X4X3x5WlbNDj7PVdOw9KEO+IJ9Cbx
 v5VfH/36/DkSQilYJjyw3E4R6f1ukGkXaCiuGgMm3A==
X-Google-Smtp-Source: ABdhPJxJZwSkyFQ2LUAnHhiegRCncBeXq+peJMNyNpoOU7X7k97B4t1fIdaGDEvibP3Su+8xqgyAJGPkEUeZxSCg2YE=
X-Received: by 2002:ac2:5f0b:0:b0:448:1e32:4531 with SMTP id
 11-20020ac25f0b000000b004481e324531mr19086997lfq.167.1650549312018; Thu, 21
 Apr 2022 06:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <268b3cd5-2388-2553-bdba-c72853f91aa3@gmail.com>
In-Reply-To: <268b3cd5-2388-2553-bdba-c72853f91aa3@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 21 Apr 2022 15:54:35 +0200
Message-ID: <CAPDyKFoG0zHrEUUSHPVQcLu0E9qzp7GjpTmLb19J8+Zf6TJtEA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: switch to device-managed
 dmam_alloc_coherent()
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_065517_671526_02ED2220 
X-CRM114-Status: GOOD (  16.53  )
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

On Sat, 16 Apr 2022 at 01:12, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Using the device-managed version allows to simplify clean-up in probe()
> error path and remove().
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 9f815cfbd..d4134b18d 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1301,8 +1301,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 /* data bounce buffer */
>                 host->bounce_buf_size = mmc->max_req_size;
>                 host->bounce_buf =
> -                       dma_alloc_coherent(host->dev, host->bounce_buf_size,
> -                                          &host->bounce_dma_addr, GFP_KERNEL);
> +                       dmam_alloc_coherent(host->dev, host->bounce_buf_size,
> +                                           &host->bounce_dma_addr, GFP_KERNEL);
>                 if (host->bounce_buf == NULL) {
>                         dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
>                         ret = -ENOMEM;
> @@ -1310,12 +1310,12 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> -                     &host->descs_dma_addr, GFP_KERNEL);
> +       host->descs = dmam_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> +                                         &host->descs_dma_addr, GFP_KERNEL);
>         if (!host->descs) {
>                 dev_err(host->dev, "Allocating descriptor DMA buffer failed\n");
>                 ret = -ENOMEM;
> -               goto err_bounce_buf;
> +               goto err_free_irq;
>         }
>
>         mmc->ops = &meson_mmc_ops;
> @@ -1323,10 +1323,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>         return 0;
>
> -err_bounce_buf:
> -       if (!host->dram_access_quirk)
> -               dma_free_coherent(host->dev, host->bounce_buf_size,
> -                                 host->bounce_buf, host->bounce_dma_addr);
>  err_free_irq:
>         free_irq(host->irq, host);
>  err_init_clk:
> @@ -1348,13 +1344,6 @@ static int meson_mmc_remove(struct platform_device *pdev)
>         writel(0, host->regs + SD_EMMC_IRQ_EN);
>         free_irq(host->irq, host);
>
> -       dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> -                         host->descs, host->descs_dma_addr);
> -
> -       if (!host->dram_access_quirk)
> -               dma_free_coherent(host->dev, host->bounce_buf_size,
> -                                 host->bounce_buf, host->bounce_dma_addr);
> -
>         clk_disable_unprepare(host->mmc_clk);
>         clk_disable_unprepare(host->core_clk);
>
> --
> 2.35.3
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
