Return-Path: <SRS0=xxvR=P6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B6DC282C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 07:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4AC20854
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 07:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eIdjAJYF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWurdJWc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E4AC20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffRDR/oiZUp0KFHtQQy/1OF2MuWwvaNhg8PtMsViK8E=; b=eIdjAJYFciAvnJ
	Po6JeuAG3ETl2Nc9WRitB3HEi/AZh2MZdBHl4Ob7K8Eu7m5s48pXf/k7FGG8gAOspxjXn+SakK5XG
	r2SNqh/OogjuTDBpUHnuYoEdGhdta6iIu5T3rin1ERm9A+xTMjpuJ3iZGWRcixqXijDsMENY5Q1Zr
	Twcf6bN7NoGx3k/kiUr4OTAztnr1AmxW/JzlLW/qMPSThxEkVTemLjWXxIxd7yx0XKgagEGynz9DO
	zDxf475RnqyGt8M/e/R4s0gMBn5sjfDQ86LUeJRZPiPoiB/51ziSAQ2tz8AZWsqevimEmRnxJOWiG
	N2BsxFmd9jpoWk3C+znA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glqnn-000582-Vc; Tue, 22 Jan 2019 07:48:55 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glqni-00055K-Dj
 for linux-amlogic@lists.infradead.org; Tue, 22 Jan 2019 07:48:54 +0000
Received: by mail-vs1-xe44.google.com with SMTP id z3so14140665vsf.7
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 23:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQxwMpGwGCBN9AgJNblQECFeo7tB3XtwcuR6mF48now=;
 b=jWurdJWcY/Z/eUbeEPzEC5Zyr8x7dZ5Fvwmg+PX+1rnqgZzHrZhUulJOm72N8TB/k2
 /X9INd2WkGi6oq2pxukKa/mp7+egkF+KfLfjW/gMKMnJohSNzEGXcVCyFShZEwhAlmY7
 loHOlDqlxjqw+J2hLrGsbZcKehYb9IotSV/1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQxwMpGwGCBN9AgJNblQECFeo7tB3XtwcuR6mF48now=;
 b=Ng+IHVCieVaPETZujpwzblDc526YyzKXj16ZkDiCfIGaKWi0HFXZrHIozQJz5oZYfJ
 eF7w4rRUTjwoTnOoPqNxVfbV26l/Deqgpd8+q+49iMnQEfbf82IzDINjTE88x8THUsev
 wRc6fQaOr+DNH3pF28d9yZZvXjvi24N5c6tZzqkPuYUxdiA5/0o2MS3J+bFCJo0bG4ce
 BHKB6ZD8uY/8GwFqtlqBs71tHmimbhOCmUbOWkJu+hsAgzvb40/PPeHuJqZMucbZYP4N
 2lOmmnAsc00EF1QBGrupjpin2pxJ78GnSP0dkzpYqXA++pFzzuzxfJvvU8b+RK+xIXkY
 QmSA==
X-Gm-Message-State: AJcUukfywlVOr2wDcu9yebAxT9c3lmw64aLOytx1UozxCRLI1zO55sAm
 KitTW5jVAxIzTbHpgwc6Vxfmdo0v8c9TybcFwXkRTEHE
X-Google-Smtp-Source: ALg8bN6shBCSWHBOa1ueZGgI3pFAKSuWPTKZFLGZPZBelx2dUJGC3HJwKg7XHCyeDTwihOmwAUQigFuM3BfcuG0sy/Y=
X-Received: by 2002:a67:7685:: with SMTP id r127mr13564048vsc.35.1548143329510; 
 Mon, 21 Jan 2019 23:48:49 -0800 (PST)
MIME-Version: 1.0
References: <3d03d45f18e8b3e10edc7dd7dd03c5b7167abcbc.camel@baylibre.com>
 <20190118133223.16650-1-afenkart@gmail.com>
In-Reply-To: <20190118133223.16650-1-afenkart@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Jan 2019 08:48:13 +0100
Message-ID: <CAPDyKFpajFQZ2Mmqto3xaWD56Oizdv+ge_HDeT6v1JAk9-N5Nw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-gx: enable signal re-sampling together with
 tuning
To: Andreas Fenkart <afenkart@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_234850_522234_FF4FBDF1 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: "open list : ARM/Amlogic Meson . . ." <linux-amlogic@lists.infradead.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, krzysztof.michonski@digitalstrom.com,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 at 14:32, Andreas Fenkart <afenkart@gmail.com> wrote:
>
> card detection fails on "BeeLink Mini M8 SII" if enabled too early
> mmc1: error -110 whilst initialising MMC card
>
> Fixes: 71645e65729f ("mmc: meson-gx: add signal resampling")
> Signed-off-by: Andreas Fenkart <afenkart@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c2690c1a50ff..dba499009d0c 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -738,6 +738,11 @@ static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
>  static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> +       int adj = 0;
> +
> +       /* enable signal resampling w/o delay */
> +       adj = ADJUST_ADJ_EN;
> +       writel(adj, host->regs + host->data->adjust);
>
>         return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
>  }
> @@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                 if (!IS_ERR(mmc->supply.vmmc))
>                         mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
>
> +               /* disable signal resampling */
> +               writel(0, host->regs + host->data->adjust);
> +
>                 /* Reset rx phase */
>                 clk_set_phase(host->rx_clk, 0);
>
> @@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
>
>  static void meson_mmc_cfg_init(struct meson_host *host)
>  {
> -       u32 cfg = 0, adj = 0;
> +       u32 cfg = 0;
>
>         cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
>                           ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
> @@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host *host)
>         cfg |= CFG_ERR_ABORT;
>
>         writel(cfg, host->regs + SD_EMMC_CFG);
> -
> -       /* enable signal resampling w/o delay */
> -       adj = ADJUST_ADJ_EN;
> -       writel(adj, host->regs + host->data->adjust);
>  }
>
>  static int meson_mmc_card_busy(struct mmc_host *mmc)
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
