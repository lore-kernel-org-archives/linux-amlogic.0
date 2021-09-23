Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B269DC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 10:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653B3611B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 10:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 653B3611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMnxvvt0LQFPO3040ZuG8vrQZIsLhDmsvBuJEnbMVSE=; b=wQIBs3sQ8DyWA1
	ZEw2Fr8u+sm7FK13I3pd7CXCtyq6fXP9x+Fuz/CK/kvrHLwsvbbgkMs3+t4C32JJk+g5xyR/X4VYb
	6ryQCBqQ8Kkvfxek61ZwnVRoVFFV01d5x6N60DE5ZPyaIV7Dcgo0EM2Xbru7xoi+UBNZXFc9KeiJg
	oigAQMPK37FV2T/uekE7d1se6yv7ulHmGGrul92kiolnp8IHowkrLo7v7+MohJEWxe8yrTAdRxrtI
	+lcIkv6kAfP1/4u/6sbSqFJS9wva3Em7YResHbG526fZ+xheWKX+LMY7UR7ssF82CtnGSZCchALIZ
	SwcA9v21FZ/6xk51TqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTMKY-00B1TD-RD; Thu, 23 Sep 2021 10:51:54 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTMKV-00B1RN-UF
 for linux-amlogic@lists.infradead.org; Thu, 23 Sep 2021 10:51:53 +0000
Received: by mail-lf1-x133.google.com with SMTP id z24so25348697lfu.13
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Sep 2021 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZAOZKDlswTrDBuirwUgec+0wirM62qGZzElgpQmHWc=;
 b=c+uc7dBvi0o8VbzJj/9l72hYiJGZlLposYxLzcXp04J15VNUZglANSoNSTDDY85VzH
 9vcFA6NuhDzSRoRriGM2MYxe/FAvpzq7X/o0hRTXU+qgvdYtk7qjkCTO+lmokQPVA7Ls
 icxidEkDd5X+hRAWmWFWd09TXCzDoI36pJp9V4gkqRGQQJVVkj/BuAyWzf4443bnTbVG
 /qHD9LXObzKDT2bZKHkljt6nCAU6th1mLXX3YeTygPVJ23jy142kItEgR6zrzlULEtcX
 3kfJEY/v4XlmrkiAj4BseE976o2W388hKlH7aVSTJsHmZAhpgrYnEdKzpxiPolFZvLF/
 gakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZAOZKDlswTrDBuirwUgec+0wirM62qGZzElgpQmHWc=;
 b=3AdTE2qjmFGRZ3gBo72WCxR8V1URigie8PR0rWWQuYY/vHKWREuJdw36Gem6n708a+
 Syqt9FLefz3D3x4XW613vYoolzWXeP3YS51Dlmcb4yanL2fKQqlEaIbNUROx82tfmPMd
 yzyar3FlvvA4ePGwh/7DJneejjqwP3Off0gLx8DkAac+oj4T0Gea6vSPBZCJS0/kFmrC
 fCUZa0V7fpsmO5qdG0mygTCnJGRbBQacT9Ka8187r0fsseocRus+KtYAfhirYPvlM8o8
 AcTzKiNl8Bj9H/wboDimd6bXeo77zpR1xbqsVowKULU/F6MCU8pkYxC50g+J7VDZRGwL
 AhFQ==
X-Gm-Message-State: AOAM531uO7ptRZiRrrTooaDIqyzAqtEASxloxGIBSrPld9fURlkIYuq2
 3kyz5ZVv9JU8jdwVzx/unJUJRlom3HQQriKP1UVnEw==
X-Google-Smtp-Source: ABdhPJzDqiDdo7fH13X6725lmGDL0pLCjz5Voj6/qRJne0PS12YyRUk8hp3c10PW5rrZoHYv6HTq9mLQec1PhG0Xb6k=
X-Received: by 2002:a2e:85c2:: with SMTP id h2mr4412758ljj.367.1632394309094; 
 Thu, 23 Sep 2021 03:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210913080504.832521-1-narmstrong@baylibre.com>
In-Reply-To: <20210913080504.832521-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Sep 2021 12:51:12 +0200
Message-ID: <CAPDyKFqLvnAOAmk3PeNiBzwXTgwvG+zEO1b_pJNzSuUZ3Zamxg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: do not use memcpy_to/fromio for
 dram-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_035152_060861_19FFE234 
X-CRM114-Status: GOOD (  29.15  )
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

On Mon, 13 Sept 2021 at 10:05, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The memory at the end of the controller only accepts 32bit read/write
> accesses, but the arm64 memcpy_to/fromio implementation only uses 64bit
> (which will be split into two 32bit access) and 8bit leading to incomplete
> copies to/from this memory when the buffer is not multiple of 8bytes.
>
> Add a local copy using writel/readl accesses to make sure we use the right
> memory access width.
>
> The switch to memcpy_to/fromio was done because of 285133040e6c
> ("arm64: Import latest memcpy()/memmove() implementation"), but using memcpy
> worked before since it mainly used 32bit memory acceses.
>
> Fixes: 103a5348c22c ("mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 49 +++++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 3f28eb4d17fe..08c0ff0bfa8b 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -746,7 +746,7 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
>         writel(start, host->regs + SD_EMMC_START);
>  }
>
> -/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
> +/* local sg copy for dram_access_quirk */
>  static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
>                                   size_t buflen, bool to_buffer)
>  {
> @@ -764,21 +764,34 @@ static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data
>         sg_miter_start(&miter, sgl, nents, sg_flags);
>
>         while ((offset < buflen) && sg_miter_next(&miter)) {
> -               unsigned int len;
> +               unsigned int buf_offset = 0;
> +               unsigned int len, left;
> +               u32 *buf = miter.addr;
> +
> +               if (((unsigned long int)miter.addr % 4))
> +                       dev_err(host->dev, "non word aligned sg");

This looks weird. You print an error message, but continue to process
data? If this is a case you can't handle, perhaps you should propagate
an error code instead?

Additionally, you may want to use the IS_ALIGNED() macro.

>
>                 len = min(miter.length, buflen - offset);
>
> -               /* When dram_access_quirk, the bounce buffer is a iomem mapping */
> -               if (host->dram_access_quirk) {
> -                       if (to_buffer)
> -                               memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
> -                       else
> -                               memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
> +               if ((len % 4))
> +                       dev_err(host->dev, "non word multiple sg");

Again, a dev_err() doesn't seem like the right thing to do. If you
can't handle this, please return an error code instead.

Perhaps returning an error code isn't convenient at this point. An
option could then be to pre-validate the sglist at the time of
starting the request. We have other host drivers doing this, have a
look at drivers/mmc/host/mmci*, for example.

> +
> +               left = len;
> +
> +               if (to_buffer) {
> +                       do {
> +                               writel(*buf++, host->bounce_iomem_buf + offset + buf_offset);
> +
> +                               buf_offset += 4;
> +                               left -= 4;
> +                       } while (left);
>                 } else {
> -                       if (to_buffer)
> -                               memcpy(host->bounce_buf + offset, miter.addr, len);
> -                       else
> -                               memcpy(miter.addr, host->bounce_buf + offset, len);
> +                       do {
> +                               *buf++ = readl(host->bounce_iomem_buf + offset + buf_offset);
> +
> +                               buf_offset += 4;
> +                               left -= 4;
> +                       } while (left);
>                 }
>
>                 offset += len;
> @@ -830,7 +843,11 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>                 if (data->flags & MMC_DATA_WRITE) {
>                         cmd_cfg |= CMD_CFG_DATA_WR;
>                         WARN_ON(xfer_bytes > host->bounce_buf_size);
> -                       meson_mmc_copy_buffer(host, data, xfer_bytes, true);
> +                       if (host->dram_access_quirk)
> +                               meson_mmc_copy_buffer(host, data, xfer_bytes, true);
> +                       else
> +                               sg_copy_to_buffer(data->sg, data->sg_len,
> +                                                 host->bounce_buf, xfer_bytes);
>                         dma_wmb();
>                 }
>
> @@ -999,7 +1016,11 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>         if (meson_mmc_bounce_buf_read(data)) {
>                 xfer_bytes = data->blksz * data->blocks;
>                 WARN_ON(xfer_bytes > host->bounce_buf_size);
> -               meson_mmc_copy_buffer(host, data, xfer_bytes, false);
> +               if (host->dram_access_quirk)
> +                       meson_mmc_copy_buffer(host, data, xfer_bytes, false);
> +               else
> +                       sg_copy_from_buffer(data->sg, data->sg_len,
> +                                           host->bounce_buf, xfer_bytes);
>         }
>
>         next_cmd = meson_mmc_get_next_command(cmd);
> --
> 2.25.1
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
