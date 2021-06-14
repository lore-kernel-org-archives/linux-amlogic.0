Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E4DC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 12:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB5261076
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 12:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB5261076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dUJw3fJ2XJ4ZGc52fSR4Y2VoAbvezAXfZ/k9T9qc24=; b=rEIg+Xxdg7f49u
	fmJ3zGVK1s6ki+ba7brmHEn2Vc4/a62RqEwbmkwPS2vm0SRjasP2GSL8l+hUflzc9FZw2i39mgakx
	hRy8gjIuQaspTFVKQJX7xarrIOhU2jG1XXkAH56yPB+nwcWsLesCYVL+xcu00tooH2nXxlpoB9wz5
	xHP1AKHiVCYXwXwrq7i0yc1zGA4ZjiJH2ktflr+PD7gcepDHtOh6MY1DLsDE8Ob929o7vR+Dc96uU
	lmSK0rOi1uoqcfw2f3IeOH0M53CGN3YuPWsVUDZ8kocuCtEkumpkfrMzNEwdM4RUY5G8YEXLggmKd
	X3GFCJbxF4jejzEgR2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lslMX-00DzAz-HQ; Mon, 14 Jun 2021 12:06:41 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lslMU-00Dz9q-8t
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 12:06:40 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id j8so2755689vsd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNFrwknP/IvmdiYbxnPdakNn1lYk7LNQWog91LXNo7Q=;
 b=bkOlRcuUaxZHRKE5Ob/q8HPJ/Uxgg6tBZ1/p/y9i3DSMI0lkRwBSsKQSahwQw0TCze
 srD62FvqpXbiECHAhVhf6F5PaaG3pv5EH3pgw+P6vKJJgcRLApb23H3Y8qeRx+TevmSI
 vggUQFQ1wkXLoe/QqZPP6QNjQaWnt9S9tGlND99XR4G/Jn8Zl656r5d7aaG1W9g3Sa/l
 DEuGooPcK5lfUq3J4QofTxeICnES3axLNmLRZ2QowxfOAZHfCJ3i+TDTD+14hxxwP/aC
 zvwvrdidrtPuigAwhl6oxt9zEDsgJeII8HtyAbYec7bU9pjrTt+Rqs+rhXQOeiPO9umf
 2jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNFrwknP/IvmdiYbxnPdakNn1lYk7LNQWog91LXNo7Q=;
 b=NQPLH3/aZQ1aM6/kZBsf5XrO664EEbQFdndWKt9rXTNRUwGYkiJxuiWUMhYkyjz8oo
 RdKFpADGIa6qSDrOjdxAp3rsBowieQV1RCD8x97XIo6/a7eWq+xgyFWMxPujKTh2DaTk
 rVdFO5lZoBJhpIFFsFfZ6OdsL8r1AgfAF3lrI613pp/5d+VkJMrgrtyRGgh+8jJW1uRz
 0GVOw4CdS6yOHFepZBRS+6NSolA7FmkFQmzVGdfKChhSnlVlGy/TSKajTE0J5NlZIBAV
 JFitjzny7QYDefd52rHY8nXF9c2tMVmYzvBA3S/p/xsjh/9DGRO+0DX0dany86m/as4i
 iYYw==
X-Gm-Message-State: AOAM531upXRXxI/1uvhIeo7Oq7nZcG+FPOJht/1F3dvi/kHI7L14rP3W
 /3SSqIDGO9dDUaFSQbgKTs9ptX3qQTDFRMgZP5P88w==
X-Google-Smtp-Source: ABdhPJxLCHU0MQYVgc/uBXpq+K6HD33HgyiCFz2GIJd2VMmVokwPgYtlhEF5G0gY2l4CgowoEB3IVV4/5rAmM8IINuc=
X-Received: by 2002:a67:e359:: with SMTP id s25mr16473866vsm.55.1623672395365; 
 Mon, 14 Jun 2021 05:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210609150230.9291-1-narmstrong@baylibre.com>
In-Reply-To: <20210609150230.9291-1-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Jun 2021 14:05:59 +0200
Message-ID: <CAPDyKFqRZJ=OvxKJu_0O+JLM0fYf2NQSsQvSXvVojWsaeMpDUA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_050638_350723_9A9E8257 
X-CRM114-Status: GOOD (  26.48  )
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

On Wed, 9 Jun 2021 at 17:02, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> It has been reported that usage of memcpy() to/from an iomem mapping is invalid,
> and a recent arm64 memcpy update [1] triggers a memory abort when dram-access-quirk
> is used on the G12A/G12B platforms.
>
> This adds a local sg_copy_to_buffer which makes usage of io versions of memcpy
> when dram-access-quirk is enabled.
>
> Fixes: acdc8e71d9bb ("mmc: meson-gx: add dram-access-quirk")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> [1] 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 50 +++++++++++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 5 deletions(-)
>
>
> Changes since RFC:
> - moved iomem address to bounce_iomem_buf otherwise sparse screamed when feeding memcpy_to/fromio with non iomem pointer
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index b8b771b643cc..3e9b28f18c70 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -165,6 +165,7 @@ struct meson_host {
>
>         unsigned int bounce_buf_size;
>         void *bounce_buf;
> +       void __iomem *bounce_iomem_buf;
>         dma_addr_t bounce_dma_addr;
>         struct sd_emmc_desc *descs;
>         dma_addr_t descs_dma_addr;
> @@ -742,6 +743,47 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
>         writel(start, host->regs + SD_EMMC_START);
>  }
>
> +/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
> +static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
> +                                 size_t buflen, bool to_buffer)
> +{
> +       unsigned int sg_flags = SG_MITER_ATOMIC;
> +       struct scatterlist *sgl = data->sg;
> +       unsigned int nents = data->sg_len;
> +       struct sg_mapping_iter miter;
> +       unsigned int offset = 0;
> +
> +       if (to_buffer)
> +               sg_flags |= SG_MITER_FROM_SG;
> +       else
> +               sg_flags |= SG_MITER_TO_SG;
> +
> +       sg_miter_start(&miter, sgl, nents, sg_flags);
> +
> +       while ((offset < buflen) && sg_miter_next(&miter)) {
> +               unsigned int len;
> +
> +               len = min(miter.length, buflen - offset);
> +
> +               /* When dram_access_quirk, the bounce buffer is a iomem mapping */
> +               if (host->dram_access_quirk) {
> +                       if (to_buffer)
> +                               memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
> +                       else
> +                               memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
> +               } else {
> +                       if (to_buffer)
> +                               memcpy(host->bounce_buf + offset, miter.addr, len);
> +                       else
> +                               memcpy(miter.addr, host->bounce_buf + offset, len);
> +               }
> +
> +               offset += len;
> +       }
> +
> +       sg_miter_stop(&miter);
> +}
> +
>  static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> @@ -785,8 +827,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>                 if (data->flags & MMC_DATA_WRITE) {
>                         cmd_cfg |= CMD_CFG_DATA_WR;
>                         WARN_ON(xfer_bytes > host->bounce_buf_size);
> -                       sg_copy_to_buffer(data->sg, data->sg_len,
> -                                         host->bounce_buf, xfer_bytes);
> +                       meson_mmc_copy_buffer(host, data, xfer_bytes, true);
>                         dma_wmb();
>                 }
>
> @@ -955,8 +996,7 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>         if (meson_mmc_bounce_buf_read(data)) {
>                 xfer_bytes = data->blksz * data->blocks;
>                 WARN_ON(xfer_bytes > host->bounce_buf_size);
> -               sg_copy_from_buffer(data->sg, data->sg_len,
> -                                   host->bounce_buf, xfer_bytes);
> +               meson_mmc_copy_buffer(host, data, xfer_bytes, false);
>         }
>
>         next_cmd = meson_mmc_get_next_command(cmd);
> @@ -1176,7 +1216,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                  * instead of the DDR memory
>                  */
>                 host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
> -               host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
> +               host->bounce_iomem_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
>                 host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
>         } else {
>                 /* data bounce buffer */
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
