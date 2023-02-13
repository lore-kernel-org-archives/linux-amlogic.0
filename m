Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A69C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4uyWwHHDgo6EyPe4Y+LSgqMBkoSqeJ99MaHyvmqaEo=; b=HyTL/PXJqjQQrc
	OP6pzgPWbFR8lrTwhy3WGajVzF5fFaDtSC63X5uohVsKwkD86eWpqA9Qq89Cr6CIDLdrfKSdP0Ujk
	VAamMR0gnX/s5WMguyLGN2NW2O0T6vZnuwhsI4YWG/QOydI7KVCJLB0XLNqyn6TeAh0oxxosztNH9
	Q7u+dzzgZtnEJ7pHML/QxsHxJxqlBhbo7YRyKbBX+1voxXXKiUS16/lqAKvtNWMadagehfkXG/Ufa
	1WHSVwEGrWf0HzVfCiyP6KwFs6DgJtuyUAm4BIwhszSR6CHlBLYvgyxS1j2Gw961feQVyJIG/pmfb
	lWXSADykQuZkdVE62dCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhbI-00Gg5g-68; Mon, 13 Feb 2023 22:47:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhb7-00Gg3h-M1
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 22:46:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id m2so15141885plg.4
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 14:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdXRfHEDGntt40H+VdxuizcsjhlHh6IS8DIu7IMqkPQ=;
        b=teM0pzFNXuxZL7/IIDdcrpJN2zHDcNg0CyyEYj09tYD0oXnooQPE9BtUoclB235Uev
         E8iYi/QFIu9yh//coMovktbA2mQdKtAWr8Wv4Xp6T7sdDCSo945CK7esGV7au0pyEJ4V
         H+VIif6k9FsxtS/W4e+RxwcxVEiSQKNuevda5K5ymmiBawvybMXzRPP2VyHtOj+INJ39
         1n1txqSqgbwWo7hTht8Dw8Xwn1TlC40YVfbU5/rF0JQGimtlBUHJpbwvlSpZag08vlX9
         gCH4eq7z6Vs7q9gHF3VaktZA5VaMJrsdK0UkRGmc6L51MozC2zE6WH3deugGx92qZiuF
         z2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdXRfHEDGntt40H+VdxuizcsjhlHh6IS8DIu7IMqkPQ=;
        b=M8rzywIXpJ1NSf0ZIxLzfJYCWdSPx25Ux2nJ9MtuqsLDUW2cesL3h0KW9RXTdehfF5
         qNUmlrN9DXmQlfSbjFIIQ/XQ+p54MQMhOPBuOjTqL3Po/qHcN+pHKw6Ik/rgozyK1lCB
         tZYlhNPi2Bu7xw2cFoGOo9QLSwxYNuPE1uSSj3BG3uLUFbdMTgT/lMho/ml+8dCSSeIp
         lP0VxmjAylDsEQmGMm9OEjOJEr7hW060Q5ik1LfyhshLyozfIbbGF7HLcFj13G+191sx
         05g5twiibrZnrEJ4qdnMx10ISa/k7akn1g7ZwPoQsfl3MthrBjy51jaf/S1RfInBT0to
         MDOA==
X-Gm-Message-State: AO0yUKWvKKx+CdPrWV5EC3xQbZkvIaLQLRaB8h8trvbiPi2sRzN9AUNH
	VabxVQbNOfN9YwETPmwkXDn36SFNfsxBBvOMLEZJQw==
X-Google-Smtp-Source: AK7set+ectIf3t2eHRbZ0c2BZGDirXyixYrhn/GRyG79rlWwYnxZJQPHori5JNfGyK5LJHJvmLTyoXJ8SsofeLjKH+A=
X-Received: by 2002:a17:903:2341:b0:19a:9ba6:6526 with SMTP id
 c1-20020a170903234100b0019a9ba66526mr165001plh.2.1676328414898; Mon, 13 Feb
 2023 14:46:54 -0800 (PST)
MIME-Version: 1.0
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com> <a0f895b3-f895-f256-1274-a61571264617@gmail.com>
In-Reply-To: <a0f895b3-f895-f256-1274-a61571264617@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Feb 2023 23:46:18 +0100
Message-ID: <CAPDyKFoeeof8G=AY4Z_CE4di4xUu8L9JT3UDYtPW6UVyTg1L=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: core: support platform interrupt as card detect interrupt
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_144657_725168_FAC27029 
X-CRM114-Status: GOOD (  22.38  )
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

On Mon, 30 Jan 2023 at 00:10, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
> due to the design of gpio / interrupt controller. Therefore provide an
> option to specify the cd interrupt e.g. by device tree. The host
> controller can store the interrupt in cd_irq for use by
> mmc_gpiod_request_cd_irq().
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mmc/core/slot-gpio.c | 2 +-
>  include/linux/mmc/host.h     | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
> index dd2a4b6ab..69c22a997 100644
> --- a/drivers/mmc/core/slot-gpio.c
> +++ b/drivers/mmc/core/slot-gpio.c
> @@ -99,7 +99,7 @@ void mmc_gpiod_request_cd_irq(struct mmc_host *host)
>          * IRQ number is already used by another unit and cannot be shared.
>          */
>         if (!(host->caps & MMC_CAP_NEEDS_POLL))
> -               irq = gpiod_to_irq(ctx->cd_gpio);
> +               irq = host->cd_irq > 0 ? host->cd_irq : gpiod_to_irq(ctx->cd_gpio);
>
>         if (irq >= 0) {
>                 if (!ctx->cd_gpio_isr)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 8fdd3cf97..e998e919e 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -470,6 +470,7 @@ struct mmc_host {
>
>         struct delayed_work     detect;
>         int                     detect_change;  /* card detect flag */
> +       int                     cd_irq;         /* for use by mmc_gpiod_request_cd_irq */

Rather than putting this in the struct mmc_host, I would prefer to
keep it more internal to the mmc core/slot code.

That said, what do you think of moving this into the struct mmc_gpio
instead? Of course, that also means that we need to add new slot gpio
helper that users can call to set the corresponding value for the
cd_irq.

Would that be okay to you?

>         struct mmc_slot         slot;
>
>         const struct mmc_bus_ops *bus_ops;      /* current bus driver */

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
