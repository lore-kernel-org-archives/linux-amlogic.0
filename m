Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1E1C04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 08:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A00E2075C
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 08:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QjrPGUE7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGECAGiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A00E2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=br4M1pBRJH8M6N8iFHjMsdq3e31jPoz56O4W79K4SGk=; b=QjrPGUE7ubb5E2
	mKB9YSDOODMR9OT8sc1RtgkUyOGZXge+xjd2BstlNqp4bdECYgWkepc6vhpCTSnZAFgzWPnOohGKz
	2xMWXt5k9v2y9trYAH2+lay6P7Kl0oCmuSZ8oMlG99Sl1C+CSDaaGG3TwokbrNUgbvwZrERmyuH/a
	JVaa8xgEHezIf2EPbXYsTD22ICHq88Cd0ctsEghUTapdvrSLzJ12MAR2XvhQs4wTVXubUAg5LqirH
	8j9bxCX0JhO1+Z44jrCcyPJJ12I6w/ehJXY+sKLa5NXtE51Q/eMs6+3aoCLexBba1AqpG8Neqa9Fv
	Q4omUGnRVmSeGUf3Fp6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVXsF-0001RT-M2; Tue, 28 May 2019 08:54:23 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVXrj-0000sa-8M
 for linux-amlogic@lists.infradead.org; Tue, 28 May 2019 08:54:03 +0000
Received: by mail-vs1-xe43.google.com with SMTP id k187so12276937vsk.12
 for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2019 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4G+l4mcQrcJ5qtZW6jc8KFsMyVDywMQYRArpXTfxYg=;
 b=tGECAGiPY1UuVhhFiwLy6P8iG6nVZk12EpEIcRNzG6CiaE3ifWSH6hn9CvJ/yPbuRH
 prjlRm3EK4unEciaob+gcP0fWjzUoN2f3+iZ0mo+Qr7o/w0mjtYaWibqnX2djvdAGzQv
 SNwf0Qks57cLHDlHc1Dc9qvLhKzCeC7/YSQ+6jlak7oSA/z/bn64DHZuvEefiz2eZHB3
 Ki9BwVPb2Ak/nHL07CYzGWC3Lg7W9tSELSDgruRfA5vMt2GdVxKnZMNpkPZa9kQ12IdA
 15MVVR5nxU/gGW2dyeH1QiRffO/hUXlsf8oJJGlo6pE2PlKjiKr8TI22h9ZvPqrqgFwt
 Soig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4G+l4mcQrcJ5qtZW6jc8KFsMyVDywMQYRArpXTfxYg=;
 b=L6ZhBznk1RU17KFGuTNCIkyJL3zaBXKKcYIf/3kz8t5SQTdWq6truDEZ5auRqhPyVP
 IoW1HdzOZpx8UDX5J/KfNJKZUiaQtmnKWLsR9/jN/Z9mQxCOKcTQNxg05oew0OASDLgY
 17CfeFR3IEURDBBZ4eoc/sAUEwK05XDBUV877HgCXM8R755Z9wWTeIcQxM3ASlhNyhge
 Fz9ia1lfSAeXJf/8oGybWOHmZUDS1oINOhTjoueXgicqLg52JogdJuFCZIuiqcEuWtME
 torCCFd3FwjjyVkqFKS2x+trUbmOSIvuxRdgX+IKrf7j3bI348UFYGN1kZJIbcVXtWlz
 wUFg==
X-Gm-Message-State: APjAAAUsLZCgvPgOVjxBAyu4P1ZvWTatVqKyhR/5LRKKN5RdVhJVSn5j
 4tEr5xUqLIA30diLJFqg8d381P3EU0OmvbJiwgWgXQ==
X-Google-Smtp-Source: APXvYqxCX1kq8IMvJ2XL6aA1Xt7bJkiRLIqoaVEpeh5q5WYZWsTZObdSaGb4POyhb1VFmyJ/LSM95o9nZoIKDfpxd70=
X-Received: by 2002:a67:ebc5:: with SMTP id y5mr71328310vso.34.1559033630071; 
 Tue, 28 May 2019 01:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124307.32075-1-narmstrong@baylibre.com>
 <20190527124307.32075-3-narmstrong@baylibre.com>
In-Reply-To: <20190527124307.32075-3-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 May 2019 10:53:14 +0200
Message-ID: <CAPDyKFpWsScFY6oYqRmR=RUNnzeoCn1Vk7h-Nj3aisSOYh-a9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: meson-gx: add dram-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_015352_106430_B27F2DEB 
X-CRM114-Status: GOOD (  27.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 27 May 2019 at 14:43, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
> the data from DRAM, leading to a broken controller.
>
> But each MMC controller has 1,5KiB of SRAM after the registers, that can
> be used as bounce buffer to avoid direct DRAM access from the integrated
> DMAs (this SRAM may be used by the boot ROM when DRAM is not yet initialized).
>
> The quirk is to disable the chained descriptor for this controller, and
> use this SRAM memory zone as buffer for the bounce buffer fallback mode.
>
> The performance hit hasn't been evaluated, but the fix has been tested
> using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
> 55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
> at 50MHz clock. It gave 170 Mbits/sec as SDR104 and 200MHz clock.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 70 ++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c5a8af4ca76b..bcf1789d26b6 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -129,6 +129,9 @@
>  #define SD_EMMC_TXD 0x94
>  #define SD_EMMC_LAST_REG SD_EMMC_TXD
>
> +#define SD_EMMC_SRAM_DATA_BUF_LEN 1536
> +#define SD_EMMC_SRAM_DATA_BUF_OFF 0x200
> +
>  #define SD_EMMC_CFG_BLK_SIZE 512 /* internal buffer max: 512 bytes */
>  #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
>  #define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
> @@ -168,6 +171,8 @@ struct meson_host {
>         unsigned long req_rate;
>         bool ddr;
>
> +       bool dram_access_quirk;
> +
>         struct pinctrl *pinctrl;
>         struct pinctrl_state *pins_default;
>         struct pinctrl_state *pins_clk_gate;
> @@ -232,11 +237,20 @@ static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)
>  static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>                                         struct mmc_request *mrq)
>  {
> +       struct meson_host *host = mmc_priv(mmc);
>         struct mmc_data *data = mrq->data;
>         struct scatterlist *sg;
>         int i;
>         bool use_desc_chain_mode = true;
>
> +       /*
> +        * When Controller DMA cannot directly access DDR memory, disable
> +        * support for Chain Mode to directly use the internal SRAM using
> +        * the bounce buffer mode.
> +        */
> +       if (host->dram_access_quirk)
> +               return;
> +
>         /*
>          * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
>          * reported. For some strange reason this occurs in descriptor
> @@ -1049,6 +1063,10 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         host->dev = &pdev->dev;
>         dev_set_drvdata(&pdev->dev, host);
>
> +       /* The G12A SDIO Controller needs an SRAM bounce buffer */
> +       host->dram_access_quirk = device_property_read_bool(&pdev->dev,
> +                                       "amlogic,dram-access-quirk");
> +
>         /* Get regulators and the supported OCR mask */
>         host->vqmmc_enabled = false;
>         ret = mmc_regulator_get_supply(mmc);
> @@ -1146,9 +1164,16 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 goto err_init_clk;
>
>         mmc->caps |= MMC_CAP_CMD23;
> -       mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
> +       if (host->dram_access_quirk) {
> +               /* Limit to the available sram memory */
> +               mmc->max_segs = SD_EMMC_SRAM_DATA_BUF_LEN / mmc->max_blk_size;
> +               mmc->max_blk_count = mmc->max_segs;
> +       } else {
> +               mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
> +               mmc->max_segs = SD_EMMC_DESC_BUF_LEN /
> +                               sizeof(struct sd_emmc_desc);
> +       }
>         mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
> -       mmc->max_segs = SD_EMMC_DESC_BUF_LEN / sizeof(struct sd_emmc_desc);
>         mmc->max_seg_size = mmc->max_req_size;
>
>         /*
> @@ -1158,15 +1183,27 @@ static int meson_mmc_probe(struct platform_device *pdev)
>          */
>         mmc->caps2 &= ~MMC_CAP2_HS400;
>
> -       /* data bounce buffer */
> -       host->bounce_buf_size = mmc->max_req_size;
> -       host->bounce_buf =
> -               dma_alloc_coherent(host->dev, host->bounce_buf_size,
> -                                  &host->bounce_dma_addr, GFP_KERNEL);
> -       if (host->bounce_buf == NULL) {
> -               dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> -               ret = -ENOMEM;
> -               goto err_free_irq;
> +       if (host->dram_access_quirk) {
> +               /*
> +                * The MMC Controller embeds 1,5KiB of internal SRAM
> +                * that can be used to be used as bounce buffer.
> +                * In the case of the G12A SDIO controller, use these
> +                * instead of the DDR memory
> +                */
> +               host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
> +               host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
> +               host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
> +       } else {
> +               /* data bounce buffer */
> +               host->bounce_buf_size = mmc->max_req_size;
> +               host->bounce_buf =
> +                       dma_alloc_coherent(host->dev, host->bounce_buf_size,
> +                                          &host->bounce_dma_addr, GFP_KERNEL);
> +               if (host->bounce_buf == NULL) {
> +                       dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
> +                       ret = -ENOMEM;
> +                       goto err_free_irq;
> +               }
>         }
>
>         host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
> @@ -1183,8 +1220,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>         return 0;
>
>  err_bounce_buf:
> -       dma_free_coherent(host->dev, host->bounce_buf_size,
> -                         host->bounce_buf, host->bounce_dma_addr);
> +       if (!host->dram_access_quirk)
> +               dma_free_coherent(host->dev, host->bounce_buf_size,
> +                                 host->bounce_buf, host->bounce_dma_addr);
>  err_free_irq:
>         free_irq(host->irq, host);
>  err_init_clk:
> @@ -1208,8 +1246,10 @@ static int meson_mmc_remove(struct platform_device *pdev)
>
>         dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
>                           host->descs, host->descs_dma_addr);
> -       dma_free_coherent(host->dev, host->bounce_buf_size,
> -                         host->bounce_buf, host->bounce_dma_addr);
> +
> +       if (!host->dram_access_quirk)
> +               dma_free_coherent(host->dev, host->bounce_buf_size,
> +                                 host->bounce_buf, host->bounce_dma_addr);
>
>         clk_disable_unprepare(host->mmc_clk);
>         clk_disable_unprepare(host->core_clk);
> --
> 2.21.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
