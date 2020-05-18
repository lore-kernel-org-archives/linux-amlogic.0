Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8A3C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 11:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596EF206D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 11:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsZh2pGO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eh9JoMBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596EF206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY5DN8gL+Gj0+J5zXQZLtOIN/m5dshX4J8IRy3xjmDs=; b=dsZh2pGOj8gF2h
	ydA2MPLORv+aIeneo0AOucBw0Kbd5AbeoMXdZODBtJW5YYupouhSXfvX7aENybyefteOOD0ptv3LK
	zZ/Ieo9m18BKlISUQ+TaL4eUDALLej0faBJYryi559g1A+5hLjT+qX+xMCN+umh79ZLY8C4ehUXmt
	YzOWOnauYk5vq0RQQ0Nb+wP6N9hYukJNqkJh8UWc3rsreMnzoxHKDKfxK9yT6W49Fo4twf8VWyebA
	QAJYUpoIMspG5hUeavfmSTsiL9QpfN9FLy3aWkxH+1kuxTIrsUtowy5jEr4U6v/BbBrZzH2G+E3G/
	CKats+D/wplgixSsedhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jadss-0002WY-EI; Mon, 18 May 2020 11:24:38 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jadsM-0001js-5M
 for linux-amlogic@lists.infradead.org; Mon, 18 May 2020 11:24:08 +0000
Received: by mail-ua1-x943.google.com with SMTP id f9so1151691uaq.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2020 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihMF09VKlBBB7iEtXLgDNsN0VO2GK4psKZHbEHcxX9g=;
 b=Eh9JoMBpJXKyoYlldxMoq+oa5N0QUU44CzjatEv5ykrL04Hx5F3KLswZvR+mwI6tGn
 sqW0qwPrUIjW/XDQALITZaezfbEaf5jzx+IPgpbaresFLqcZqLa2/ppIs7evyGAbpAbS
 +4f8/kZY0fOaZcqMeuxtkxaiJ/GSDTzAhRdcWQlAXsRf7JPWWGZVDn02l+hgdc+eLYwS
 +y1p5y+Lkn5J4RSvu1fx+o4dhhehOOU8fDFZdriugaS3b7IPihJ+PRdYw9P2xACcj/a3
 JcUQN7TfaPAs3sD6rvI9bRopSXsMIBYEnV9fC9CBDXK6mSNKZDeyqc9+8wbYMhGjALfT
 wi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihMF09VKlBBB7iEtXLgDNsN0VO2GK4psKZHbEHcxX9g=;
 b=Bc184Pj21OR49JlVk96k7omjggsXa3hqYz4oLH9vSlYyL/Dv3XR9qZYiek8gDtNiEI
 9UD2nmqCNCVreoJGahchltMKNNVEe5gTDhJxh4lPXL36qASSQoElUYd+pLj27AGVkoRO
 qwaM3FHdnuISWGg0qgLNdaoRmNqheVIyhobwXUVXTRZ4ee0HZm2nl7q56JYHG6pXreTl
 AMVAMLaO2ez5UsoDDDo0Ly0g1tyqarUNmlerBCuK1P3+WKutXh9MS40uIp5Sqclbzhtq
 K977xyHKXfZR+e07RfUJ5PHqff8+pNYN/HNFYWGmruoFmb2MXRucVPl8X9fYmUl6g4e6
 p0AQ==
X-Gm-Message-State: AOAM533r3kzAncngq5v+32qu/Wiw6uGehyuv9ySW4TTbXMRPyg5O47WL
 b/EtgpJBjoMiEdrTbvU+B/4Zk0+R/djR313wWx4vnQ==
X-Google-Smtp-Source: ABdhPJwfQemLZ5bSu1/RpXBNHLL2sZZwNovu7aJRq0AKFUvPo6qhbafYRw9Ww3WxjuGOapLj5C0yWDsAsoMK4LMdr7Q=
X-Received: by 2002:ab0:7293:: with SMTP id w19mr10613493uao.129.1589801044397; 
 Mon, 18 May 2020 04:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200517222907.1277787-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200517222907.1277787-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 May 2020 13:23:27 +0200
Message-ID: <CAPDyKFqmc53WLdsy2Wi4WYvVSNn6u=WXfN+guW8nrynqQa8PVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: host: meson-mx-sdhc: fix manual RX FIFO flushing
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_042406_245386_60D4D41B 
X-CRM114-Status: GOOD (  20.31  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Graichen <thomas.graichen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2020 at 00:29, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> For Meson8 and Meson8b SoCs the vendor driver follows the following
> pattern:
> - for eMMC and SD cards in .set_pdma it sets:
>   pdma->rxfifo_manual_flush = 1;
> - for SDIO cards in .set_pdma it sets:
>   pdma->rxfifo_manual_flush = 0;
> - before syncing the DMA read buffer is sets:
>   pdma->rxfifo_manual_flush |= 0x02;
>
> Set the second bit of MESON_SDHC_PDMA_RXFIFO_MANUAL_FLUSH without
> clearing the first bit before syncing the DMA read buffer. This fixes a
> problem where Meson8 and Meson8b SoCs would read random garbage from SD
> cards. It is not clear why it worked for eMMC cards. This manifested in
> the following errors when plugging in an SD card:
>   unrecognised SCR structure version <random number>
>
> Fixes: 53ded1b676d199 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Cc: Thomas Graichen <thomas.graichen@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc.c b/drivers/mmc/host/meson-mx-sdhc.c
> index 5c00958d7754..53e3f6a4245a 100644
> --- a/drivers/mmc/host/meson-mx-sdhc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc.c
> @@ -586,10 +586,17 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
>                     cmd->data->flags & MMC_DATA_READ) {
>                         meson_mx_sdhc_wait_cmd_ready(host->mmc);
>
> +                       /*
> +                        * If MESON_SDHC_PDMA_RXFIFO_MANUAL_FLUSH was
> +                        * previously 0x1 then it has to be set to 0x3. If it
> +                        * was 0x0 before then it has to be set to 0x2. Without
> +                        * this reading SD cards sometimes transfers garbage,
> +                        * which results in cards not being detected due to:
> +                        *   unrecognised SCR structure version <random number>
> +                        */
>                         val = FIELD_PREP(MESON_SDHC_PDMA_RXFIFO_MANUAL_FLUSH,
>                                          2);
> -                       regmap_update_bits(host->regmap, MESON_SDHC_PDMA,
> -                                          MESON_SDHC_PDMA_RXFIFO_MANUAL_FLUSH,
> +                       regmap_update_bits(host->regmap, MESON_SDHC_PDMA, val,
>                                            val);
>                 }
>
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
