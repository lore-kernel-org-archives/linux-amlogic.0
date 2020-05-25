Return-Path: <SRS0=ry3l=7H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3986C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 06:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EAB2071A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 06:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6PWwkQ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oH0jGp/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EAB2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiMKhKUjnCz1oiLoEEGkKxgnSvg0Zcr6MMgHqFqGXf8=; b=h6PWwkQ2i+ye72
	9Cs5PbFXJioZaGPWOkBCJ/+o62vdHUbOC6Ee2EfLnlRyfo0Ccgo6l7BXowwSKlhRA6C82mZYVX9cS
	3bgd2M15pN2n+rZO44GAs0j0QhXLovJyZ730I4WKro1JY/MRofQrxgjR7rk9DyTQtHuseRlbefYUF
	zr6/g0dlUx3fA1PCKz/nG9sQpgsJqCZk0tCq5toTmCCskqTyijwaDn+nY98znf+Oj2YZsqJdO9VBQ
	EvCH4dRK765seIQAdGQjpvYGeAHu4M7dEMOVbLHTZwW8jT0xUkx1UxPIhXm0tmL69DUpu0qWdPp3/
	O//6KK2FFnfHeO79XRtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd6Nn-0001zC-0J; Mon, 25 May 2020 06:14:43 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd6Nk-0001y9-2h; Mon, 25 May 2020 06:14:41 +0000
Received: by mail-lj1-x242.google.com with SMTP id v16so19484402ljc.8;
 Sun, 24 May 2020 23:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxPp1YhKBxMDmxPDlgA3r6L4BPVtYqrACCbiDdkf2HU=;
 b=oH0jGp/2CUEdGLq6EDmu5s+PiAb/IDEiXKtMl/yTpb3Y3fg51+Iq4kgQCw95Q9cV6e
 DTYwCy/OywCcfPMYn5cyMejV3EqYTyRuZhqXotrPwKh3AWq/xRhhzrrRgwdJBeITWTHp
 spvmnFufI/vuLUzULK9+q3fPphWeh6BPVRV0qBbZaUn1BZxFRO+aUi/Za0m/FqFKkQma
 v379pALdXZRKuwU3JFSw2RZVsKj0VyGXKElz5a+wMKXOfo1gARzxdVps067fQh/WdOhG
 WXSshs0r4TkX8K7MBUeYGLKpvju5PvJJmcIFKpd8DKvuZLs6dAsjuINXeFIyMnVM0Mfa
 5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxPp1YhKBxMDmxPDlgA3r6L4BPVtYqrACCbiDdkf2HU=;
 b=o4hZhfjx0c3bEv3XMyHti2JolLDP4josoIj9LZqN5lr7QK0o7a48fAN0Mu3QUxU11y
 tP1gMuoClrDffDhDUQ3SmABWyOm8WXC3l1wwJLpBJRQREYaQ2iK6C7qtyNOra9wguRd0
 pdxQbM9cAbZE+qJmxPCOYmbDFGVmF4gCx7MP5YfHJub2ox9D+jL2opFlkJG8R+bVqY/i
 dxMDy6BA1BjYPwdYXy9wRUgTAC/xPUbS+nRFeNKKi/xBzkOBpSQn3fwsWyOUoZh7DJWD
 6t2qX+eezEE95VyVqw5II2e4Us4QXtufWRJR/fSW5vOutmoL0g3C/GhuWXjg4cjdNLM9
 1tMw==
X-Gm-Message-State: AOAM5324zCsgZEJbACcOHDeyAl+zpdO6GScDbTTvOK/4ycYPovLEG1EX
 MudyO64rq5YHKeb6NlppWJeHhcXjvfIhkE20GmE=
X-Google-Smtp-Source: ABdhPJzaVD3W8XB8LNxW925jXvFBvaW8onNuO96IUdcvivMzSYciGrsBcQqGjF7n+6WXCtsIuyKlXvmMkqyksGWw2uM=
X-Received: by 2002:a2e:d1a:: with SMTP id 26mr13109692ljn.160.1590387275853; 
 Sun, 24 May 2020 23:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200517222907.1277787-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200517222907.1277787-1-martin.blumenstingl@googlemail.com>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Mon, 25 May 2020 08:14:24 +0200
Message-ID: <CAOUEw11pirqhOHTjO_xHnZpnSgKNuJk5ysh43B7jWJokuGPB2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: host: meson-mx-sdhc: fix manual RX FIFO flushing
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_231440_124475_75A0266C 
X-CRM114-Status: GOOD (  21.56  )
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
Cc: linux-amlogic@lists.infradead.org, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 12:29 AM Martin Blumenstingl
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

Tested-by: thomas graichen <thomas.graichen@gmail.com>

BEFORE: on my meson8 based mxiii i got the above error and the sd card
was not useable

AFTER: no more error and sd cards works fine

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
