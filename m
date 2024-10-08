Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE7CEF172
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Er2aneBmB9paD39ok0ASNX4SMBaRG1QMAeUTuvjLKk=; b=htmKuIfpcAHHVY
	BzM6nQom00Fpn91hIGez7bRQvbOV/RZ2oBZn8RekKG1n/hlhBN4gKLaG74+JvTTgWB4icqu/N8hGe
	7lq83iSCIG4pLiYeXVTOMvWk2xAw2p9Vt82NmU/XtdunnMdnS/cxX6aAjyUFECPONGNCrWGhbao5i
	6r3h6zZX05O54/3f2FmRpwS5qy6KYaVrsBe7HZZ7iCIO8eZr3gC06sgnXSZwFO422DZEmmW5WFQoo
	r3qhXzg1x76Z9UfwXyYk3JKOc431tmTF5sG83UgvzgkC1xjhrc9dryYjZ+EtpbLRS+GVUYVBf8Ho/
	FH8Lduvzz81p4HdqgF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syBMH-00000006CUN-0IpN;
	Tue, 08 Oct 2024 14:38:41 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syBKE-00000006BmF-3eCN
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 14:36:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e026a2238d8so5094408276.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398193; x=1729002993; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvdDxu0uUFcfRftNtzBrq68CTjswU4MR/lPRKPBVJUA=;
        b=NEjPyAjzCUt3sBlMk7yn6ZiPuRWnhwDOnPZpFbm33Bflu67IqtcCWbvwE5Tcer0H2Y
         bVJLzFOnoxSB/D1mii1As7eSlXsNZRLwNJ31bpk9NKm70z/SEK+ps2rqxaG6exJnRdad
         ABmHQlJwEKpsk5+bjcHVwnLwj2T2YIQfo3moBMKM1pE4kKsAjoT1mIM5hW5sBXcad3zg
         jsZZaPbCaK0MR5sSBSUSWhi+dlj0IwViYoW0qfMEHDbGswRNyM1twJtSSuWYGdrNb8ul
         Vxi3Sz9HQvYIWVPYbnbwRMyCJwQsGIkal5n4K40VBa+zglikwQ8pi7hxTkTzOvuJhcDw
         sc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398193; x=1729002993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvdDxu0uUFcfRftNtzBrq68CTjswU4MR/lPRKPBVJUA=;
        b=l/YcwA/wz9hhFzgbDSgwQuAICdcdJT7z/ws2HaC7JF0nW/PUzUDantM54GCB45jnF3
         A15bTQxOYy+iIzo3b31pKUfvsyF1+q+EF6AtFpgNMFBoiokzZfmIYBY/1rkpTZrcdfab
         hitQuwFSKJ/Y1FBP9iRVyfXX9JhuwUboAFQC0DNSRK0u8p5hHyQ+/cvlqD+0DT9lEOMn
         yE/HD+r5RMEY17p4XugPIrLUpRVLVhw/tKjRWu7uNVBF7RoLHgptJ814l/dkmV4qjjRT
         orwMn9B+gmw19DknYWws0bLsa1ebPnfrWZFE7d1kiP/EgYiRmxFn06AXyyl2bFLUzC7O
         bDKg==
X-Forwarded-Encrypted: i=1; AJvYcCWJr/R0Cg+kIbX5+ovSNPJwh6hjt943q6WqTVabPT7FncTBhAqka4c/PKffOv2Uic6NCwwuifT/VlVvfK6W@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0MaMdvnmWalRLvDGX4NR8YYDarJYIhvXrYVKqIpiUUnKc84/l
	/BPmya2gcKn2el5C5gvkxxKAV7fHysi7TjKNgY0tWjHltE3/xVMv1u/hYVmZQu8SIdlXHycq+6T
	XjRNptGmYNmsD6bkn+BRZJHviHeL4K70IH7NuhnDy2COnRzND
X-Google-Smtp-Source: AGHT+IH7JBySBe+ugLiwdV9z9D3yRskW3fQHkZaPcUF8iKpr4058P83ZY+ritDjNryL38gb8s14NXcVeCTMnJZxK7bU=
X-Received: by 2002:a05:6902:2e0b:b0:e28:f668:b41d with SMTP id
 3f1490d57ef6-e28f668cd1bmr765146276.48.1728398192886; Tue, 08 Oct 2024
 07:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240929093418.526901-1-yujiaoliang@vivo.com>
In-Reply-To: <20240929093418.526901-1-yujiaoliang@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:35:54 +0200
Message-ID: <CAPDyKFohKSPqhuPVYijtvhY2DmG20ar+MY9OqWWLu5_MnB4ReQ@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Fix typos in comments across various files
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-msm@vger.kernel.org, 
	opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_073634_943659_5EC8DD7A 
X-CRM114-Status: GOOD (  30.66  )
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

On Sun, 29 Sept 2024 at 11:34, Yu Jiaoliang <yujiaoliang@vivo.com> wrote:
>
> This patch corrects several typos in comments within the mmc/host
> directory. No functional changes are introduced, only comment
> improvements for better readability.
>
> Detected using codespell.
>
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c       | 2 +-
>  drivers/mmc/host/au1xmmc.c         | 2 +-
>  drivers/mmc/host/cavium-octeon.c   | 2 +-
>  drivers/mmc/host/dw_mmc.c          | 2 +-
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
>  drivers/mmc/host/mmci.h            | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
>  drivers/mmc/host/sdhci-msm.c       | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 6490df54a6f5..f444ca5dd154 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -860,7 +860,7 @@ static void atmci_send_stop_cmd(struct atmel_mci *host, struct mmc_data *data)
>  }
>
>  /*
> - * Configure given PDC buffer taking care of alignement issues.
> + * Configure given PDC buffer taking care of alignment issues.
>   * Update host->data_size and host->sg.
>   */
>  static void atmci_pdc_set_single_buf(struct atmel_mci *host,
> diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
> index 6e80bcb668ec..7393d2ea5e57 100644
> --- a/drivers/mmc/host/au1xmmc.c
> +++ b/drivers/mmc/host/au1xmmc.c
> @@ -543,7 +543,7 @@ static void au1xmmc_cmd_complete(struct au1xmmc_host *host, u32 status)
>                                         cmd->resp[i] |= (r[i + 1] & 0xFF000000) >> 24;
>                         }
>                 } else {
> -                       /* Techincally, we should be getting all 48 bits of
> +                       /* Technically, we should be getting all 48 bits of
>                          * the response (SD_RESP1 + SD_RESP2), but because
>                          * our response omits the CRC, our data ends up
>                          * being shifted 8 bits to the right.  In this case,
> diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
> index 060ec4f4800f..d150d83b41ed 100644
> --- a/drivers/mmc/host/cavium-octeon.c
> +++ b/drivers/mmc/host/cavium-octeon.c
> @@ -217,7 +217,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
>                 return PTR_ERR(base);
>         host->dma_base = base;
>         /*
> -        * To keep the register addresses shared we intentionaly use
> +        * To keep the register addresses shared we intentionally use
>          * a negative offset here, first register used on Octeon therefore
>          * starts at 0x20 (MIO_EMM_DMA_CFG).
>          */
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 41e451235f63..aab1a8df6414 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -1182,7 +1182,7 @@ static void dw_mci_submit_data(struct dw_mci *host, struct mmc_data *data)
>                 /*
>                  * Use the initial fifoth_val for PIO mode. If wm_algined
>                  * is set, we set watermark same as data size.
> -                * If next issued data may be transfered by DMA mode,
> +                * If next issued data may be transferred by DMA mode,
>                  * prev_blksz should be invalidated.
>                  */
>                 if (host->wm_aligned)
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c7c067b9415a..e87d1c4b9dc1 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -879,7 +879,7 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         /*
>          * The memory at the end of the controller used as bounce buffer for
>          * the dram_access_quirk only accepts 32bit read/write access,
> -        * check the aligment and length of the data before starting the request.
> +        * check the alignment and length of the data before starting the request.
>          */
>         if (host->dram_access_quirk && mrq->data) {
>                 mrq->cmd->error = meson_mmc_validate_dram_access(mmc, mrq->data);
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index a5eb4ced4d5d..4d3647f9ec06 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -77,7 +77,7 @@
>  #define MCI_CPSM_INTERRUPT     BIT(8)
>  #define MCI_CPSM_PENDING       BIT(9)
>  #define MCI_CPSM_ENABLE                BIT(10)
> -/* Command register flag extenstions in the ST Micro versions */
> +/* Command register flag extensions in the ST Micro versions */
>  #define MCI_CPSM_ST_SDIO_SUSP          BIT(11)
>  #define MCI_CPSM_ST_ENCMD_COMPL                BIT(12)
>  #define MCI_CPSM_ST_NIEN               BIT(13)
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 8f0bc6dca2b0..2bfb86364441 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1524,7 +1524,7 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>                         writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
>                         /*
> -                        * ESDHC_STD_TUNING_EN may be configed in bootloader
> +                        * ESDHC_STD_TUNING_EN may be configured in bootloader
>                          * or ROM code, so clear this bit here to make sure
>                          * the manual tuning can work.
>                          */
> @@ -1626,7 +1626,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         /*
>          * If we have this property, then activate WP check.
> -        * Retrieveing and requesting the actual WP GPIO will happen
> +        * Retrieving and requesting the actual WP GPIO will happen
>          * in the call to mmc_of_parse().
>          */
>         if (of_property_read_bool(np, "wp-gpios"))
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e113b99a3eab..d6b3b343b031 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2601,7 +2601,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         sdhci_msm_handle_pwr_irq(host, 0);
>
>         /*
> -        * Ensure that above writes are propogated before interrupt enablement
> +        * Ensure that above writes are propagated before interrupt enablement
>          * in GIC.
>          */
>         mb();
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
