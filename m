Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E01C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IbMBoOiqhIZ/Juo9tCIsgN2ybAziBer3faqyO77vuE=; b=j1jAXoReaoJMD2
	5kTpiMI2cB6g3DT/FVybEzNwKiAS6yGpi0lK1nGSIexadKVuB8ja38EIR2n/a6WB8atdmv7Lm/UrY
	AuGaXcIIma8mdF1olnA8WjWwkEfljTE1//Gp37g8RPQASNTpAKyttH4jCcS4uFFbfBGTbCYNNUL3a
	VFY4nwtRkVFZJGl3j1kOr5PTnBfrbqIl2WNcXexdErNpaeoPdLUewvm8zfITP9eOn3S4HvZmKUu6s
	TXoup5jJhMbkiNlYjUbXbxi34ghQ7egkIM8e3Xferae6XADelEAGzH6HLoxhYmxuwN+qXH84pN49H
	CAwsGbVZy0fOHfgdmRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxV4G-00AI5t-KN; Tue, 22 Nov 2022 15:20:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxV46-00AI1v-Ab
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 15:20:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id v3so14346693pgh.4
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ihQ+iS0RBGD1JBUCK6RAkhfc3i8nOqqJ3wZ/VmOOPK0=;
        b=RZgU0335Ff49cLtch8+5SB61cNynkwCEhpdArRioEe0jI4o0JeHBFQIYgJ/kjPffU0
         V3mNjEsJlY5PsvvXqflVtl5N2rAyXbwgJKmrdUcRaEiJ2ryUitiw86t9dQS9LKuqr2CE
         1+WtoYz6ctMsdZJEXBDV6xBJoBm1a7LY3GLMaKdc+BJzfjKpAZ53FYgEv/cGT6QZtQ5v
         abVR+D5bnXwruD6n7vpnUkxZDq6LYy0m2S4LPY06bNmkPGwary0Z6Dhgr+6qvMtU0Js0
         LoNyOT6zs+U1tlynnpnUzpPkC1BAGM6bFD36tUZwJ8pnaQiVpcqiGFHWyvtVcr77r3oY
         WlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihQ+iS0RBGD1JBUCK6RAkhfc3i8nOqqJ3wZ/VmOOPK0=;
        b=p0OjrUf7Nx+WViBbNJDx1SEvdvzHzG3OVz2oEUt0mvjsUqEyxsprNRn/NeIn1Bvxyc
         VqJ+KM+5SkG9AiLbFNHQw41/pxmK8oa5vl4Ghr5tjFtgDJuPuvkI2DZxnG6JmPDMtDEa
         zZ2mGmeQbpladbi2q4lWpzOJueOs6s0MUaewcxCtS2OP/zOPVddPyzZqga48snV5aX52
         xtsBRHnpdP4evNKFJOW34Ir89aEa6wHm55WDOPD3WK3DOmSsnBN9gbNb7JGCOOYWZwbD
         blOOASLSlk+NqQIdKdjD44/AwLnl1vJwLW7ux1+ixUBIEq2uG1smc/iiQCrxmUP9mkoH
         D/jg==
X-Gm-Message-State: ANoB5pnDjrQgLU7ODFmT7uGiYFvKWuLeC8zJB6DUJTh3V5jv+5gUFGUv
	oFpArlQeGsyzIAxwoGOR4tkcvPAH5Q/Tm7O93ZKEHw==
X-Google-Smtp-Source: AA0mqf69hoH1h+nPtuNykOTMlZLAbDqRt3Mhuo0ns+tZ7Qdf7yNASqiJ/OO6XVrjzcuXOvkqI7Yz8qYqfgxrA1K08e8=
X-Received: by 2002:a65:4688:0:b0:477:7aee:a464 with SMTP id
 h8-20020a654688000000b004777aeea464mr7069697pgr.595.1669130398433; Tue, 22
 Nov 2022 07:19:58 -0800 (PST)
MIME-Version: 1.0
References: <CAPDyKFqrCCtY_A072WswEFa3Bnz7EfMp40MRYtr3G7Jbq_hbTw@mail.gmail.com>
 <20221122132304.1482508-1-peter.suti@streamunlimited.com>
In-Reply-To: <20221122132304.1482508-1-peter.suti@streamunlimited.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Nov 2022 16:19:22 +0100
Message-ID: <CAPDyKFpiSjQyZxYBwcs4qA7KmX5dRj4chmQ0s8pCmcCNzYFjeQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix SDIO interrupt handling
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_072002_398550_8985D3E3 
X-CRM114-Status: GOOD (  25.28  )
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

On Tue, 22 Nov 2022 at 14:23, Peter Suti <peter.suti@streamunlimited.com> wrote:
>
> With the interrupt support introduced in commit 066ecde sometimes the
> Marvell-8987 wifi chip entered a deadlock using the marvell-sd-uapsta-8987
> vendor driver. The cause seems to be that sometimes the interrupt handler
> handles 2 IRQs and one of them disables the interrupts which are not reenabled
> when all interrupts are finished. To work around this, disable all interrupts
> when we are in the IRQ context and reenable them when the current IRQ is handled.
>
> Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")
>
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
> Changes in v2:
>         - use spin_lock instead of spin_lock_irqsave
>         - only reenable interrupts if they were enabled already
>
>  drivers/mmc/host/meson-gx-mmc.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213b47..0c95f8640b34 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -934,6 +934,13 @@ static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
>         }
>  }
>
> +static bool __meson_mmc_sdio_irq_is_enabled(struct mmc_host *mmc)

Looks like it's better to pass a struct meson_host *host, rather than
a struct mmc_host *mmc.

> +{
> +       struct meson_host *host = mmc_priv(mmc);
> +
> +       return readl(host->regs + SD_EMMC_IRQ_EN) & IRQ_SDIO;
> +}
> +
>  static void __meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> @@ -950,6 +957,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         struct mmc_command *cmd;
>         u32 status, raw_status;
>         irqreturn_t ret = IRQ_NONE;
> +       bool irq_enabled;

Nitpick: (since I have a few comments anyway). May I suggest rename
this to sdio_irq_enabled instead?

> +
> +       spin_lock(&host->lock);
> +       irq_enabled = __meson_mmc_sdio_irq_is_enabled(host->mmc);
> +       __meson_mmc_enable_sdio_irq(host->mmc, 0);
>
>         raw_status = readl(host->regs + SD_EMMC_STATUS);
>         status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
> @@ -958,11 +970,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>                 dev_dbg(host->dev,
>                         "Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
>                          IRQ_EN_MASK | IRQ_SDIO, raw_status);
> -               return IRQ_NONE;
> +               goto out_unlock;
>         }
>
>         if (WARN_ON(!host))
> -               return IRQ_NONE;
> +               goto out_unlock;

This part looks like it now becomes incorrectly redundant, since we
are now using "host->mmc" a few lines above while calling
__meson_mmc_sdio_irq_is_enabled().

Maybe move the new code below this part instead?

>
>         /* ack all raised interrupts */
>         writel(status, host->regs + SD_EMMC_STATUS);
> @@ -970,17 +982,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         cmd = host->cmd;
>
>         if (status & IRQ_SDIO) {
> -               spin_lock(&host->lock);
> -               __meson_mmc_enable_sdio_irq(host->mmc, 0);
>                 sdio_signal_irq(host->mmc);
> -               spin_unlock(&host->lock);
>                 status &= ~IRQ_SDIO;
> -               if (!status)
> +               if (!status) {
> +                       spin_unlock(&host->lock);
>                         return IRQ_HANDLED;
> +               }
>         }
>
>         if (WARN_ON(!cmd))
> -               return IRQ_NONE;
> +               goto out_unlock;
>
>         cmd->error = 0;
>         if (status & IRQ_CRC_ERR) {
> @@ -1023,6 +1034,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         if (ret == IRQ_HANDLED)
>                 meson_mmc_request_done(host->mmc, cmd->mrq);
>
> +out_unlock:
> +       if (irq_enabled)
> +               __meson_mmc_enable_sdio_irq(host->mmc, 1);
> +       spin_unlock(&host->lock);
> +
>         return ret;
>  }
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
