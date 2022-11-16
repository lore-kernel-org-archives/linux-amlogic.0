Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5BC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJAczS/1mzpikrM6GB77N4X5vbdHkgrXptiVo/ijfe0=; b=Q1NraTQK2LvLu6
	cLJpKcSTYh8VPYaB/a9cd3xr7DRGni98sVHEq3i0kiVHiuzsm6JVKkOBv4fIO8H8HJm/2U3ZVm2Jm
	ftoRex6/yd6ioYgEkjqrK2VfftUfquvg/AFHJRoKw96+iBCx1rgF69dsSbjiB5q1qw3RdAlpHGf0w
	pZacu7KzhrxVtltBz1MA7XuNz0Rkc6cAlniQwcEu6bER7B5e/o0gMjG8Nn19KI494J0hFoHTejB/o
	2su6wL5757g72UygQGHr9fhwiKNrlDiylJVo4HPqyrm0Ifk7LgoWCxa2/1j7MZuz4QN/vmv3tnAdy
	cxzaUFyGl0KxNWSlk0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovL35-005l07-Ec; Wed, 16 Nov 2022 16:14:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovL2s-005kuC-L7
	for linux-amlogic@lists.infradead.org; Wed, 16 Nov 2022 16:13:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 6so17085028pgm.6
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Nov 2022 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1rUWutKviuABCXhXY06evbTP8Qb/JN/vOssJGqNTh0=;
        b=LoCqcxBb/0A4en6YJPudBTBwAugncPJfF4IIlmuptJxlJ3fqpW6s+jVYF7QTFC/tpz
         MgbIKcER8u/5z0q3veC4zk5Ucxe4fY0jOdf3ukThvDpy7ZrNkn1y0zk6CxNLh/h8NWQw
         cb5fhTthKZP5VLvgSjrnkYYCmMQM15HBDbfi+PqXrpr5E+kBIph24rd+iZ8AmHHR0c2p
         Ir31S94fzoErmJVIr794nJtoXRNSTG0rLvKNPL9mOb3qiaF/LPoEPDKezCt5myXTS0bm
         BmDC9yr6HbGAt1JLqg++DlYgGuepc4iGIbbHiA1t29PN8a+DvALjHVeLclVByZBAN/4S
         WmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1rUWutKviuABCXhXY06evbTP8Qb/JN/vOssJGqNTh0=;
        b=o0Ga3KfWtfs9nH+1Gzy+Rf3p8H21iOfWaVMcPiPsF7XRp0xbVpNfPQ6kEzOnf+A/xO
         Z0Y3rmfxfJajPuovz1G1eI7601yNdj/h1hxCAHN2RDoyr4SOh1FCM10ppzAYGup2UnaV
         iAWDkKH4sUbWW9OjNEMeqZogGgjz9qTQ6c9DbR9HL/jBYSr4NWrRzy9c3ews3pauPQd/
         vfbf2zTHqAxAzcpaifLQxE9XY/4SuCtu7SYYY4ZesZENhihZDkuJgoYdJJxPk1qJIJcE
         Zmn2itWMYqhw0L/pnwUG37u3RtbnREvfhur13ccsi41Z73UrO6w+imTp2qCP4oliOxT4
         kYKQ==
X-Gm-Message-State: ANoB5pmycFgZMsfjHzWysMLmAzhMMyrf/dLYlpj0BH26wbjXLLX/hsCn
	s8bi6HKVCaairszidJ9HYPe4WhKMzUxG5J5cvscqZw==
X-Google-Smtp-Source: AA0mqf4KePcqF8TL0F8T8aM/T0G+4+eIDf4h7ns0C0M7LyQfmaH5u4OKNFGZsyldv/vno2rUNzTGP/NdiKCTjKDJDZw=
X-Received: by 2002:a63:121f:0:b0:442:ee11:4894 with SMTP id
 h31-20020a63121f000000b00442ee114894mr21639035pgl.595.1668615228512; Wed, 16
 Nov 2022 08:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20221114093857.491695-1-peter.suti@streamunlimited.com>
In-Reply-To: <20221114093857.491695-1-peter.suti@streamunlimited.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Nov 2022 17:13:11 +0100
Message-ID: <CAPDyKFqrCCtY_A072WswEFa3Bnz7EfMp40MRYtr3G7Jbq_hbTw@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: fix SDIO interrupt handling
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_081350_704490_051A4960 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, 14 Nov 2022 at 10:40, Peter Suti <peter.suti@streamunlimited.com> wrote:
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
>  drivers/mmc/host/meson-gx-mmc.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213b47..972024d57d1c 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -950,6 +950,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         struct mmc_command *cmd;
>         u32 status, raw_status;
>         irqreturn_t ret = IRQ_NONE;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       __meson_mmc_enable_sdio_irq(host->mmc, 0);
>
>         raw_status = readl(host->regs + SD_EMMC_STATUS);
>         status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
> @@ -958,11 +962,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>                 dev_dbg(host->dev,
>                         "Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
>                          IRQ_EN_MASK | IRQ_SDIO, raw_status);
> -               return IRQ_NONE;
> +               goto out_unlock;

This may end up re-enabling the sdio irqs, even if it was not enabled
to start with. This is probably not what we want.

>         }
>
>         if (WARN_ON(!host))
> -               return IRQ_NONE;
> +               goto out_unlock;
>
>         /* ack all raised interrupts */
>         writel(status, host->regs + SD_EMMC_STATUS);
> @@ -970,17 +974,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
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
> +                       spin_unlock_irqrestore(&host->lock, flags);
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
> @@ -1023,6 +1026,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>         if (ret == IRQ_HANDLED)
>                 meson_mmc_request_done(host->mmc, cmd->mrq);
>
> +out_unlock:
> +       __meson_mmc_enable_sdio_irq(host->mmc, 1);
> +       spin_unlock_irqrestore(&host->lock, flags);
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
