Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69945C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319DC20825
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqFxHLTR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR0DcGiR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319DC20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bry1ZBueO9kr7t0BGRXkk0yyfbI+pDJiK6fB4g+W5LA=; b=RqFxHLTR1pVip+sfliNX5k1C5
	HXMzbRDRyqsytOCdUhVdhrnck251y6dww2sz9O01GEftBh78z2Ryh1kXGODDnpYsclfEqXvDLA5Hr
	D1hbosC6X3CfY42YdDCuMtynFuISVq5qbVeUDD+0nOWfzzq4MlRCWhEtNaAgsoPDssUG1UUi7QUmL
	StiFqegFVOWhylNmJR9v589g7X7sjfsoLcfruszGRbu0JjlL7r6lB4rSJP5uK7dOxzdxoBvQFRBjv
	sFURPzN3AIJuAyr6qbXpCVZYeKpxKfibsH4aMX1pLtAK23X50dZ+B5qpvocNWzMtWoPbG9L5dYiq3
	wo6IMXNyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO0V-0001Ej-Op; Thu, 27 Aug 2020 19:56:23 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO0H-00019T-Cx; Thu, 27 Aug 2020 19:56:11 +0000
Received: by mail-pf1-x444.google.com with SMTP id k18so4319626pfp.7;
 Thu, 27 Aug 2020 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLa56i743GyYyvzZsbp7wDSdWi+EGIOQBt69Q105LwQ=;
 b=SR0DcGiRNSloexRgT5hNz4a+LfcqsIQj20wgCxHugcf+XgWQvmGFw0bnb0I7KbH+/c
 ogmXVcx8dsIt5IUDS/nGPWPBDatpaPAfM4P20TV5kzuntmfkhHwjvY9r9zW/CV8eKDUc
 oyYKZqYPt8LQaH829LamjzKyYe8CKpA8OZQMHcTyINmYvBZQ4Df4AnE1g6asyOOpkfCD
 TLQ5THGMgBFl8C5iKS2IuJ5aKQKMbHXw2v1y9jSF9m0qwPaLjYSjfuAZwAOemI2Rj0bw
 NMvemTfF1vk0wlIrV2GWv254XcKVuSD1++6tqd8PyFVcEvx3nMHuigVsvGKhuYalkxEc
 wSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLa56i743GyYyvzZsbp7wDSdWi+EGIOQBt69Q105LwQ=;
 b=ikGim+xJNtVu8aIrUyBcYMjLptnjKrhbQoaS2cnzuFUBlcZz2gQg0t+dBnvQmv4feZ
 baMpZfEWH6NnLzM1bIY6xRHZVY+W9cz4x8fW22/0xke/xkAugeAogCLxB0EI16CSvqPM
 qz/uJtvArLGwIp6afvYwaWxmskxWQ+dvzpXl+tzy6qCfRZwGzTh+xWZUgGS/zvcMfxo7
 CyPCDKpGdFgvDztXWJL8SZEAvhp/TKV71bFrHBiVKKIqCA+o5oq/8SuPfkJq/jtV2CH0
 iC8KdxZMBGxRtxVSv+NBHxX0fewKwWDWHKZSOf7PDlBxZfpy34H9zw0N492k2cteXeLn
 I6NA==
X-Gm-Message-State: AOAM533lQlDm1CiDVVRwcxWjTQfUPmjpc0ZRWLitZOCp+psKVlshf5T+
 tWoS16n15IDcyohEFwgaKOOBtg4U9bheSpwgY60=
X-Google-Smtp-Source: ABdhPJzz9OgKhOSf0QaPl+XE+7282MSmPn4HpuGGEVGW9DN6uF+vFghnleghHOCVxElQYmTrlTqoeuz0+DPlkRO0bPw=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr15250227pgh.74.1598558167388; 
 Thu, 27 Aug 2020 12:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-12-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-12-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:51 +0300
Message-ID: <CAHp75VezGhnwphb4JAkVeQtGQhDoH-AtkA2b-GvSwGFta6y+Jg@mail.gmail.com>
Subject: Re: [PATCH v2 12/18] iio: dac: dpot-dac: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_155609_490981_3AA859D2 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/dac/dpot-dac.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/iio/dac/dpot-dac.c b/drivers/iio/dac/dpot-dac.c
> index be61c3b01e8b..2258535b8a42 100644
> --- a/drivers/iio/dac/dpot-dac.c
> +++ b/drivers/iio/dac/dpot-dac.c
> @@ -183,18 +183,14 @@ static int dpot_dac_probe(struct platform_device *pdev)
>         indio_dev->num_channels = 1;
>
>         dac->vref = devm_regulator_get(dev, "vref");
> -       if (IS_ERR(dac->vref)) {
> -               if (PTR_ERR(dac->vref) != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "failed to get vref regulator\n");
> -               return PTR_ERR(dac->vref);
> -       }
> +       if (IS_ERR(dac->vref))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dac->vref),
> +                                    "failed to get vref regulator\n");
>
>         dac->dpot = devm_iio_channel_get(dev, "dpot");
> -       if (IS_ERR(dac->dpot)) {
> -               if (PTR_ERR(dac->dpot) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get dpot input channel\n");
> -               return PTR_ERR(dac->dpot);
> -       }
> +       if (IS_ERR(dac->dpot))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dac->dpot),
> +                                    "failed to get dpot input channel\n");
>
>         ret = iio_get_channel_type(dac->dpot, &type);
>         if (ret < 0)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
