Return-Path: <SRS0=kM9X=GQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EC8C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Jan 2021 11:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D1F5233A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Jan 2021 11:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D1F5233A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y8nmrLTicOPuBFb8MY2wJ5U4Y9FZU5RYpN7g0se5548=; b=KUa3N7yF6Yh+V4d+HdGGfDsYe
	AoQB+GFP8iStz2jZtofy6KbNLw2ZDUJWtu6JsX5KjzPH1VOqbXd71AE5yfOlRgl3bsahwLmu7tXG6
	obBJ/hS90ytUyv9g8TGyx4kpIhNCllJ9m5cnUn5eicDwC0HT/7lDx1aNiHOgESGrvYEbbXCGHDuhe
	l4vomq/83GFj0oE3AUaZjUfelKCqCV+r0ElafhIUQHOttCk+kh2coYyspMQmVNcAo0rv9W+No3OoE
	ZUvyKPZUI9Q7Uu7920lctAsVCHMRAL+AMeuL872vVwrbNLmpGq8/c5arqslGoA0pJbKA0Gfv5wC7S
	0HPOflweA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeHY-0001Ln-D0; Wed, 13 Jan 2021 11:25:44 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeHT-0001KO-Lt
 for linux-amlogic@lists.infradead.org; Wed, 13 Jan 2021 11:25:43 +0000
Received: by mail-vs1-xe35.google.com with SMTP id e20so890890vsr.12
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Jan 2021 03:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvx4Rm0JVaEBLeH4g/sZ+OV4otU1DpUJjISnok3Lub4=;
 b=fZ/f8jvURhta2ZKt6eWO0sA195Ej1y1EgflYyXr+/2V3gTama/jP93zQ5uNq/kl3lr
 aijqqb8SxWJVl84URx3J4SPb6Ow7hCp4ZMJcLGkQuLM2DrCm9UG21uoFB+IICsZw4EPb
 dpo+zaFOq6l376bvvUEwbWF5/RwMbKnoaoSuDsmJbzrhQgR7s4LWuPlxeouDZn6A9xj7
 xxwr+rFWE2XMA21SNaz5nZIaW6yDIIjeT2AIBHtEksb/7XQbAmPajtdIBaRuwt+sswGy
 XxWrnuBb0KFIVCjxuXFdudaVjeSB2Iw0yYMX/PGftUpletczCPmEm8fZEioDIEuH9l3V
 Tvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvx4Rm0JVaEBLeH4g/sZ+OV4otU1DpUJjISnok3Lub4=;
 b=XmPtLjDKmTRmynQjFZ2+0N08WAUqVWaK54/pzHVelYaDiYxKx9OS1mixBJWDG6LtpV
 4f0sHlm623i8QmhJXugTlSRoES/rEVmxA2zVmgqh0biDCxlyGNAnOXfI0K1LXZfRIWMI
 1yOAutwKSmA9CtyjxgwmJRSSZdoVumaENH3Pl3QU/6fKwyCS/dEyzyHPl49GXNNmig3H
 NP0iLe9wN81Ma37oI6koi92LsJwjVNSBc8097hr+fx4LAtK7S+r/6lb2M3q0uds+pfeY
 h1I4n4d2XazV9SJvOzT7G+XDfRwNTL43njDms/ILKD9kp/TAHzANlkGqwdijdNzjwRfF
 NArQ==
X-Gm-Message-State: AOAM533u/MGCPV13l2ny7+wTClkLxwzi7s6mDUInarCDYlFjkGrshzjw
 DTEJtTNLnKO0nReWYw2Ds+HJ8CqOCq/t+c9FdwXrCQ==
X-Google-Smtp-Source: ABdhPJxZ9n2zAVtmqUz0lOujvmZtP4s4E9RPWoQ1Bn9DvMLU+rD6Q8RJU5GcDSMrudFwKiblbn1f1xrIZGk45ZpvT+k=
X-Received: by 2002:a67:fe85:: with SMTP id b5mr1188727vsr.19.1610537138051;
 Wed, 13 Jan 2021 03:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20201218075312.67338-1-lebed.dmitry@gmail.com>
In-Reply-To: <20201218075312.67338-1-lebed.dmitry@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Jan 2021 12:25:00 +0100
Message-ID: <CAPDyKFp+qvVUycmssdm0wjRfL7HxEAYkT3edCicXzJ5HUwzfSg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: check for scatterlist size alignment in
 block mode
To: Dmitry Lebed <lebed.dmitry@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_062539_873731_F289B437 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 18 Dec 2020 at 08:54, Dmitry Lebed <lebed.dmitry@gmail.com> wrote:
>
> Enable SGDMA support for SD_IO_RW_EXTENDED and add proper check
> for scatterlist size alignment in block mode.
>
> According to documentation, in SDIO block mode meson-gx DMA could
> only handle buffers with sizes that are multiples of SDIO block size.
>
> Some SDIO drivers like brcmfmac use scatterlist API, but do not enforce
> proper scatterlist buffer size alignemnt, this looks like a root cause
> of non-working CMD53.
>
> Some minor style fixes.
>
> Signed-off-by: Dmitry Lebed <lebed.dmitry@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 37 ++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 13f6a2c0ed04..eb6c02bc4a02 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -227,7 +227,6 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>         struct mmc_data *data = mrq->data;
>         struct scatterlist *sg;
>         int i;
> -       bool use_desc_chain_mode = true;
>
>         /*
>          * When Controller DMA cannot directly access DDR memory, disable
> @@ -237,25 +236,33 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>         if (host->dram_access_quirk)
>                 return;
>
> -       /*
> -        * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
> -        * reported. For some strange reason this occurs in descriptor
> -        * chain mode only. So let's fall back to bounce buffer mode
> -        * for command SD_IO_RW_EXTENDED.
> -        */
> -       if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
> -               return;
> +       if (data->blocks > 1) {
> +               /*
> +                * In block mode DMA descriptor format, "length" field indicates
> +                * number of blocks and there is no way to pass DMA size that
> +                * is not multiple of SDIO block size, making it impossible to
> +                * tie more than one memory buffer with single SDIO block.
> +                * Block mode sg buffer size should be aligned with SDIO block
> +                * size, otherwise chain mode could not be used.
> +                */
> +               for_each_sg(data->sg, sg, data->sg_len, i) {
> +                       if (sg->length % data->blksz) {
> +                               WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
> +                                         sg->length, data->blksz);
> +                               return;
> +                       }
> +               }
> +       }
>
> -       for_each_sg(data->sg, sg, data->sg_len, i)
> +       for_each_sg(data->sg, sg, data->sg_len, i) {
>                 /* check for 8 byte alignment */
> -               if (sg->offset & 7) {
> +               if (sg->offset % 8) {
>                         WARN_ONCE(1, "unaligned scatterlist buffer\n");
> -                       use_desc_chain_mode = false;
> -                       break;
> +                       return;
>                 }
> +       }
>
> -       if (use_desc_chain_mode)
> -               data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
> +       data->host_cookie |= SD_EMMC_DESC_CHAIN_MODE;
>  }
>
>  static inline bool meson_mmc_desc_chain_mode(const struct mmc_data *data)
> --
> 2.24.3 (Apple Git-128)
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
