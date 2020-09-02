Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5630EC433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 09:04:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2311F20829
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 09:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GgxuGOsB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQ+kQwXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2311F20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uHZUGAGUP3yC2MeG4XtBR3yUkhmO/yXc9jgdR5/N+5w=; b=GgxuGOsBrEbXq83n9raCfhD40
	f3V06BMDRDDNDYgbexd/EtEg8ihbWggTTB+peidxbwPkU6wn8HQmCQvdEyEWYv+FyYy92zxmOna9e
	A/7T9vl6rKRx95SM2Dr2x52UQghVe53Vvn0+A/3X2HNRRDKazAouqTtxxorbq0omKNJuO8YOYDoGq
	rgums11fsSsLnMEXj/NGJrON7z3TX3ixN7lTVyNLINruj5eVrmurXZakDwY3OdXl9bcAvABfTl8YX
	Q4bkremkPcHIH8CG8OepAKpHDJ2/rrVxwpPPzKZ63TIleuJdZ5Z96jd5gAGzten/eh2WiT2L4SddI
	2qgTCHN6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDOgO-0005qI-H0; Wed, 02 Sep 2020 09:03:56 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDOgM-0005p3-Hq
 for linux-amlogic@lists.infradead.org; Wed, 02 Sep 2020 09:03:55 +0000
Received: by mail-ua1-x942.google.com with SMTP id u48so1343871uau.0
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Sep 2020 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJzUeSF+5rfhIEqW5Y3fudwXDrc2+BNzuQkwiBNzFL4=;
 b=WQ+kQwXpmiMbmM++3SGStKdu8DfotRMOpqrwA5q4bHtdJy9QMoEuJc5j/DKPN9esfh
 TQnNtWcPdvtjlOGXk6lMbGAWO97Q/B3oTIbShRS2KU7mN9bF8pwNxjqtEEOpNgKeeSoF
 5vPV4E1GH8dyf6dZN4nLeM4NYT2aVDd9zvoKiIUgsLohC+8JbQ22SJbx9wnjSbkj7xL8
 JsM/O3Q//97AjUOmNmXAzlIbuCSjbi/qQVWHYr3mood8wfSt8Zo60+0PYH3nWBUC9yct
 FTmh/ZE20RiJD40hlQlzblmlJbQWUdiyrAwwuV/0mkrVPnqhO7ph2zS10dQORe/iAwGQ
 yyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJzUeSF+5rfhIEqW5Y3fudwXDrc2+BNzuQkwiBNzFL4=;
 b=WOhkBo1bOv2i8xr5mJWr9OgGGJOliS3KAUJMpwDgrON8IkJzdcRAIs0Q6NS9ZxM7Xl
 /RvvJcoGey35kZzj+2m/kSv7hYAz0g1yubfzzqFemmnMxEmTg3ydhuzlXJ57S+AsEqMV
 NM8DwAq9WMaR2CdUF4JxKn56fYWlltN3qbV0ypDy2ow/V1686NUBr5ksCSj5ptC01AQw
 e5hMHOlEdYQAVyp8u6eM2npfueN11sMHDvmr1y8NeJJydGxrJY67Ev/wqxg1Gceps2yJ
 OunAtaG2K+xQxfXpA7uuhzWQiXaEqy6Vo4zi/S3s2AkNuYndGSG/fqY+PRcI5mb/xKsF
 Z+zw==
X-Gm-Message-State: AOAM533kHnojDAflSIEjqRAoy8AiINsY2PjqSwldkZVSWfyZ97II+Z5I
 7umIpILqJNZ08iz8EyzJ8w2rnNdx1MRbfCSmvUTHKA==
X-Google-Smtp-Source: ABdhPJyhJYTVm/R+GBYtGPEgC6V5+EOBdX93qBkeA616egxMMvQgh3s57gjKKHh0bsOtxZckjPPEU7gVSF32drfco5E=
X-Received: by 2002:ab0:2848:: with SMTP id c8mr4291207uaq.15.1599037433179;
 Wed, 02 Sep 2020 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200831102324.12566-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200831102324.12566-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Sep 2020 11:03:16 +0200
Message-ID: <CAPDyKFpmfjuGcLTxCDdCvp5j_yaJzySENBEcgC_w1tvkK1Gz4g@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: use wrapper to avoid accessing internal
 vars
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_050354_598380_91BD7A42 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 31 Aug 2020 at 12:23, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Only buildtested. Found while analyzing retune-handling in the core.
>
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 08a3b1c05acb..a1db8685e30e 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -521,7 +521,7 @@ static int meson_mmc_resampling_tuning(struct mmc_host *mmc, u32 opcode)
>         val |= ADJUST_ADJ_EN;
>         writel(val, host->regs + host->data->adjust);
>
> -       if (mmc->doing_retune)
> +       if (mmc_doing_retune(mmc))
>                 dly = FIELD_GET(ADJUST_ADJ_DELAY_MASK, val) + 1;
>         else
>                 dly = 0;
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
