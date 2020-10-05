Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FE0C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 08:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 748322075A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 08:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTMtsp5e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gyoWLoyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 748322075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e0jk6re1xAvnc9MdkXXqCX/sTJIkam8YBNBsHoSSaWA=; b=tTMtsp5etULcl0Ciec42wHtpm
	I7ZAgx0Q5Za0BliN2mxqSrPyj4Igo44vw9mgb7FRRo0lDWitG8xETuugiXd+j6hdbRLVI4pVTfcya
	sQ+V+p/YAqL8kaaMnHrEsQK/MraBCg1HUGLqcEJhE2tCBTPuDm8n9ZwWgwHhu4MV/L0Lbi7F1uACu
	TFZr/dPXn2Z7sj8QtpK07YTOzB9v7xv71nPi6elSxUiYBl6gbjr3WKnLufZ9Sjf+DEZxt66wB+xMJ
	sCp6nqzxt9BjN7CLHqGUPXrWdOIDn4gb0Tp+nVV8dpryXV18WPNQ5cdHhShU3ut7yleEtTh15tgzc
	r3PnoLuZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPLmD-0006Ez-FU; Mon, 05 Oct 2020 08:23:21 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPLmB-0006E0-OC
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 08:23:20 +0000
Received: by mail-vk1-xa44.google.com with SMTP id a16so1562820vke.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Oct 2020 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAtojNlzxsPSd/oxSbWU6AgTlxaiRO+YzHrraKa81XU=;
 b=gyoWLoyN2VqKSQUGjaeXiikTJWtx72t3wYzZbXZx182qcx3MgphEc/i7bNxdWUt4JR
 p6iHceJFvUI4O16eyMMM3reWwuwyMYAufz523LgXdBtppTniJ495/oCKjHGComZeh8LW
 +uJT3KfVpno2D13HeTPcBG+PQQfVJ3q4YdJBwRQNc+FW706nYXyWMK396mRP1z1mgCJ5
 /oe6sjNivB8jf+syiAa2H1rtnkE0D1VmKX4rJwzgZuct8DiXn96wHWXUoMAgP7nuz/cd
 HHmrmQHXkDKXZEgkhdFCqJ4ZlaMdpbVlQINusmhpAkU+BQBH5hrjus6bU9QzdnJVA2Bk
 ZyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAtojNlzxsPSd/oxSbWU6AgTlxaiRO+YzHrraKa81XU=;
 b=AG0oyDbpzWI5L5jbyyXNXTPfQkAUJJSZF3TTkz30vGf/XY0fV5iPPc7ozazzENF27b
 8uBRNvQwLLcsjwudso4pnSqqLSfRoGRWGGMqX2W/432dnSHtPKGutrhgaBjwj315cE14
 DuH7VUbUgeaxfTXS2kr5ntJKy9KMeVc9wuO/fUEpI6uhY9zQCb53Bbi1rY07zu/YUze+
 J1e2qXXFeu4tpXkRopH2faC4hEw0lrmECmEhjtJC0QnLhGkA9Y/EerXzurNN+qIJbcQx
 idGmtx81PCWou2ooFkmlrHCYR7l/S9rg4UNgXsahksXBbMehlF/fNx5pimpmuf2JF4Xf
 Y61Q==
X-Gm-Message-State: AOAM532usT132qGR6mP2EnxUwz7JhXsXUksrzhtIX8UtPpAGD9jqyNGW
 iAMb/Sld1uqgsNSRH2lW+EF/UC0kMA3e2ndKTybRkQ==
X-Google-Smtp-Source: ABdhPJwGZ6eccEIM+OsJP2XgVXqZ+kYGEJi5PQ/SV4uGTlX8apsmqUeuDGFG8ICx3DEANTyofZmeyrlumVW4clNVEGE=
X-Received: by 2002:a1f:1f46:: with SMTP id f67mr2216453vkf.6.1601886196064;
 Mon, 05 Oct 2020 01:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201002164915.938217-1-jbrunet@baylibre.com>
In-Reply-To: <20201002164915.938217-1-jbrunet@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Oct 2020 10:22:40 +0200
Message-ID: <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_042319_876856_A9417A8A 
X-CRM114-Status: GOOD (  32.32  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Brad Harper <bjharper@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

+ Tglx

On Fri, 2 Oct 2020 at 18:49, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> IRQF_ONESHOT was added to this driver to make sure the irq was not enabled
> again until the thread part of the irq had finished doing its job.
>
> Doing so upsets RT because, under RT, the hardirq part of the irq handler
> is not migrated to a thread if the irq is claimed with IRQF_ONESHOT.
> In this case, it has been reported to eventually trigger a deadlock with
> the led subsystem.
>
> Preventing RT from doing this migration was certainly not the intent, the
> description of IRQF_ONESHOT does not really reflect this constraint:
>
>  > IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
>  >              Used by threaded interrupts which need to keep the
>  >              irq line disabled until the threaded handler has been run.
>
> This is exactly what this driver was trying to acheive so I'm still a bit
> confused whether this is a driver or an RT issue.
>
> Anyway, this can be solved driver side by manually disabling the IRQs
> instead of the relying on the IRQF_ONESHOT. IRQF_ONESHOT may then be removed
> while still making sure the irq won't trigger until the threaded part of
> the handler is done.

Thomas, may I have your opinion on this one.

I have no problem to apply $subject patch, but as Jerome also
highlights above - this kind of makes me wonder if this is an RT
issue, that perhaps deserves to be solved in a generic way.

What do you think?

Kind regards
Uffe

>
> Fixes: eb4d81127746 ("mmc: meson-gx: correct irq flag")
> Reported-by: Brad Harper <bjharper@gmail.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 47 ++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 08a3b1c05acb..effc356db904 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -101,8 +101,7 @@
>  #define   IRQ_RESP_STATUS BIT(14)
>  #define   IRQ_SDIO BIT(15)
>  #define   IRQ_EN_MASK \
> -       (IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN | IRQ_RESP_STATUS |\
> -        IRQ_SDIO)
> +       (IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN)
>
>  #define SD_EMMC_CMD_CFG 0x50
>  #define SD_EMMC_CMD_ARG 0x54
> @@ -170,6 +169,7 @@ struct meson_host {
>         dma_addr_t descs_dma_addr;
>
>         int irq;
> +       u32 irq_en;
>
>         bool vqmmc_enabled;
>  };
> @@ -842,22 +842,24 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         struct meson_host *host = dev_id;
>         struct mmc_command *cmd;
>         struct mmc_data *data;
> -       u32 irq_en, status, raw_status;
> +       u32  status, raw_status;
>         irqreturn_t ret = IRQ_NONE;
>
> -       irq_en = readl(host->regs + SD_EMMC_IRQ_EN);
> +       /* Disable irqs */
> +       writel(0, host->regs + SD_EMMC_IRQ_EN);
> +
>         raw_status = readl(host->regs + SD_EMMC_STATUS);
> -       status = raw_status & irq_en;
> +       status = raw_status & host->irq_en;
>
>         if (!status) {
>                 dev_dbg(host->dev,
>                         "Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
> -                        irq_en, raw_status);
> -               return IRQ_NONE;
> +                        host->irq_en, raw_status);
> +               goto none;
>         }
>
>         if (WARN_ON(!host) || WARN_ON(!host->cmd))
> -               return IRQ_NONE;
> +               goto none;
>
>         /* ack all raised interrupts */
>         writel(status, host->regs + SD_EMMC_STATUS);
> @@ -908,6 +910,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         if (ret == IRQ_HANDLED)
>                 meson_mmc_request_done(host->mmc, cmd->mrq);
>
> +none:
> +       /* Enable the irq again if the thread will not run */
> +       if (ret != IRQ_WAKE_THREAD)
> +               writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
> +
>         return ret;
>  }
>
> @@ -934,15 +941,17 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>         struct mmc_command *next_cmd, *cmd = host->cmd;
>         struct mmc_data *data;
>         unsigned int xfer_bytes;
> +       int ret = IRQ_HANDLED;
>
> -       if (WARN_ON(!cmd))
> -               return IRQ_NONE;
> +       if (WARN_ON(!cmd)) {
> +               ret = IRQ_NONE;
> +               goto out;
> +       }
>
>         if (cmd->error) {
>                 meson_mmc_wait_desc_stop(host);
>                 meson_mmc_request_done(host->mmc, cmd->mrq);
> -
> -               return IRQ_HANDLED;
> +               goto out;
>         }
>
>         data = cmd->data;
> @@ -959,7 +968,10 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>         else
>                 meson_mmc_request_done(host->mmc, cmd->mrq);
>
> -       return IRQ_HANDLED;
> +out:
> +       /* Re-enable the irqs */
> +       writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
> +       return ret;
>  }
>
>  /*
> @@ -1133,13 +1145,12 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>         /* clear, ack and enable interrupts */
>         writel(0, host->regs + SD_EMMC_IRQ_EN);
> -       writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
> -              host->regs + SD_EMMC_STATUS);
> -       writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
> -              host->regs + SD_EMMC_IRQ_EN);
> +       host->irq_en = IRQ_EN_MASK;
> +       writel(host->irq_en, host->regs + SD_EMMC_STATUS);
> +       writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
>
>         ret = request_threaded_irq(host->irq, meson_mmc_irq,
> -                                  meson_mmc_irq_thread, IRQF_ONESHOT,
> +                                  meson_mmc_irq_thread, 0,
>                                    dev_name(&pdev->dev), host);
>         if (ret)
>                 goto err_init_clk;
> --
> 2.25.4
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
