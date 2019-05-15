Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67224C04E84
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 11:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393A82053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 11:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRdxYT3j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8I82c78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393A82053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9f9RLikEEh55Y/A1lBy7/zsW2iYrdlEf0yy1zysrTlQ=; b=WRdxYT3jvu/cY8
	D10DrOL3S2TDSoZ6XihJDeUqAiHtUCop4DUfQGdIUQYuab+LFVAg4MwhnqZ/5OWJZydsStSqi+oX/
	RybJJl5pmuykdTZujHrekTTqU2plg/JLfFDnnkKPBJjuYrghcrNzhRzfhh1FRDuTd2FebhMTQXEIm
	RFnt45XVrd7gm/E/qBfnefkHb00oDQWZVZ8i5s0P4xoQ5gq2fMNNFzQTlwFX9Mfh0Y7ZoiIy82vWd
	UeeSNJoYrr4YkIAwzS8U5ZAKxGMKxAKQNwotSDqcFRlaaQZO6suTzM6h1UBinSiP/iPPUXk5XLaAy
	Du788sDJfEAmWZ5lyuiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQsBx-0002aN-IG; Wed, 15 May 2019 11:35:25 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQsBm-0002Oa-Nf
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 11:35:16 +0000
Received: by mail-vs1-xe42.google.com with SMTP id z11so1444131vsq.9
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZWqAGCI5yMJx23kt3Mfd3kN55xmuwLQAWVG8F0xyeaE=;
 b=H8I82c784m0jGWAdSgfv70xt5W/e2W1AydqnX4HmVv/TyjugE8NKbcb1hozMQxpxXA
 2DMvnzUlpl5Z1ddBvv2j5+QHYXWqvRQEFmf36SjeHZ6L+5iZOIw1vd3+5EkGfiyLlQ9i
 15zeYIjV3z+qqaNh0MOrCDWQbxw713gfubMr5pupFHsP8XOl4YSYRWbcAC8N06GjUEU/
 Lr96fSdftzVvoCVyjH52mglkTzdVXx8RxOwGFH0TnFCIwyZWT+XGaNw5B6DHuoZzAiUW
 BKddH9aLOjw/edqV2fNVOwoMJ1m+Nq21PbvSIoFwQbfjNBmlfngrPtntXUGB2/yrjQI+
 r0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZWqAGCI5yMJx23kt3Mfd3kN55xmuwLQAWVG8F0xyeaE=;
 b=iaAHydI0of2ctG5KcmVb+IjwXrF0tiw9p5cGe0/NMGcUbJUkxx0ePeAs4gwjhZj9Kl
 4OYPJzQVG9hR/kG92KZwN4Es5Txr4TKNWx5eKzstah0a0ZacXeX+/IbxYEPQ0VGOZD0Y
 HNbnK3aT36XMs2zMWwZb+T8WrTvP6TRG6ChH5xK+HQ5I/xluYroNxegB3GkenrW/JqG9
 mN1EfunS0di2ypGLtpRs2+Vr98+IdaPJr+Nnfx7q3ObuPDIm7fHJdiGLBoHJ+qk+HnxM
 oZwMlqSFN99l/Ed6VUMKNIQLhEOYreRFa8TXgVDrvsyorb7gVlI6ErfR/gsoAQ6SAPci
 pRDw==
X-Gm-Message-State: APjAAAWzO5jq132vE4YAq7IhaaOwQixV2t0WBtnxd34xOkA/Ffkfwwsd
 GzVR2bhYl4qtrhvtZo1AP+IbtHTPRjs1uSOYQxRdMw==
X-Google-Smtp-Source: APXvYqxP1+Bj5N0OGQvJ0bEb5lturNgpY8085Ucz8PC4rk0LP/xJeG6jujlA3rtCO12XfPL7fW5CNb2hO4LJ6tng7NA=
X-Received: by 2002:a67:c987:: with SMTP id y7mr20082008vsk.35.1557920111662; 
 Wed, 15 May 2019 04:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-3-narmstrong@baylibre.com>
In-Reply-To: <20190513091548.16674-3-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 May 2019 13:34:35 +0200
Message-ID: <CAPDyKFp-mU-pCcwGUkL8B5YfhXamHtTcRHe8eX9SNupMxr-kgg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: meson-gx: add ddr-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_043514_782661_AFE70E01 
X-CRM114-Status: GOOD (  29.85  )
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
Cc: baylibre-upstreaming@groups.io, Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 13 May 2019 at 11:16, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
> the data from DDR, leading to a broken controller.

Could you possibly make it more clear that this is about the internal
DMA support in the controller that is broken?

Did you consider to use the controller without using the DMA mode? Is
that possible?

>
> But each MMC controller has 1,5KiB of SRAM after the registers, that can
> be used as bounce buffer to avoid direct DDR access from the integrated
> DMAs (this SRAM may be used by the boot ROM when DDR is not yet initialized).

I think "DDR" is a confusing terminology, that goes for the DT binding
as well. What about using "DRAM" instead?

In any case, using the SRAM seems like it could work. However, just so
I get this right, it solely dedicated to the SDIO controller or may
someone else also try to use it?

>
> The quirk is to disable the chained descriptor for this controller, and
> use this SRAM memory zone as buffer for the bounce buffer fallback mode.
>
> The performance hit hasn't been evaluated, but the fix has been tested
> using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
> 55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
> at 50MHz clock. It gave 170 Mbits/sec as SDR104 and 200MHz clock.

If possible to not use DMA, it would be interesting to compare numbers. :-)

>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 65 ++++++++++++++++++++++++++-------
>  1 file changed, 52 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c5a8af4ca76b..6ef465304052 100644
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
> +       bool ddr_access_quirk;
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
> +       if (host->ddr_access_quirk)
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
> +       host->ddr_access_quirk = device_property_read_bool(&pdev->dev,
> +                                       "amlogic,ddr-access-quirk");
> +
>         /* Get regulators and the supported OCR mask */
>         host->vqmmc_enabled = false;
>         ret = mmc_regulator_get_supply(mmc);
> @@ -1146,9 +1164,16 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 goto err_init_clk;
>
>         mmc->caps |= MMC_CAP_CMD23;
> -       mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
> +       if (host->ddr_access_quirk) {
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
> +       if (host->ddr_access_quirk) {
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
> @@ -1208,8 +1245,10 @@ static int meson_mmc_remove(struct platform_device *pdev)
>
>         dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
>                           host->descs, host->descs_dma_addr);
> -       dma_free_coherent(host->dev, host->bounce_buf_size,
> -                         host->bounce_buf, host->bounce_dma_addr);
> +
> +       if (!host->ddr_access_quirk)
> +               dma_free_coherent(host->dev, host->bounce_buf_size,
> +                                 host->bounce_buf, host->bounce_dma_addr);
>
>         clk_disable_unprepare(host->mmc_clk);
>         clk_disable_unprepare(host->core_clk);
> --
> 2.21.0
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
