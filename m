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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FFDC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:47:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0581E207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBIM7k8q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV1dA5Xo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0581E207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=90tXs1UWH45IKML5dcRFOU6CXa4YL4j3cH+XV8TY53c=; b=HBIM7k8qdGeuWyoRTsz51maGy
	54CL6A8OdUenWfY+HhVhYqdcxnP2xv5sNwuPH7ciYFsMiYjofY8hw1HXf66znd5sdfvR0xTOpKlH6
	WdXZ+gHUKuqUSwiVJiKV1wyKsaMG6sV2s7ryPlAJ68YhlicWrA4cR0L7Yz5bjyx5XEBRqyZLD1tO1
	sL0WfoRBcovN3gupA1jJUfLrmsD9ImLik3zA3TDBiaWHm4VVI1Enq5IC0rBmMTCr0x+Ks65VNCZ3J
	FRAQNVVbsz3ekyaYT66rybdzIl8Vb4zhDOCwT2GAAoIXkZVTI88T7FYXt94oxjIMGN/ab+nJ2C0TV
	sc7c/inow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNrZ-00053T-Ps; Thu, 27 Aug 2020 19:47:09 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNrM-0004wv-90; Thu, 27 Aug 2020 19:46:57 +0000
Received: by mail-pj1-x1044.google.com with SMTP id z18so3194000pjr.2;
 Thu, 27 Aug 2020 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rF/IVgk4h5+MJuABqXa02sDX7QSYWX1qauCg5n/+jTM=;
 b=TV1dA5Xov0ck9OozRII/ftao8/R/YHMTCO/1WHAIME1O4niFg+OgXtzAY2zjfXEpz3
 e0y6JKc4ubTRQp2/5w0foJUYIoIiuNW4CZ8lovjPOZqrdFroT5QwHYWrBp5yjg1/iO4K
 SVI5qRKlgZYwcEEDVM5YA0sI7csZKPJ2go+y1RjxW6Y47BgMpwAgSmA1F/niu3rX4LJI
 Luhg6tmGDAO8T0kxLUogjDa7/r9vrR6E9YDb+FNA7Bgv3VY5XQqe3DghJZnJPELSU4YQ
 Y2d132gTzXLclulfMER6/ZCCJ+q1KmVWZnuoZuPJmXNmjdAxfrHlY0Y88zQ4nI6ZZMT9
 9/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rF/IVgk4h5+MJuABqXa02sDX7QSYWX1qauCg5n/+jTM=;
 b=HVnK/K0zOu9UpA/xCtCzVCWnY7DCJLW3hXbeI/SnDsNkbS+hZqymFmMJpdSUPiHFPt
 riPMy0VAZ9k8QnXeY1rSduF+gB05b4iyTx6A8eaASK+XfoOFDwLxhzjMu8o+60WP6aC+
 nbIdJ55BZLTPbg6BStnmI7reYf9onFRAXdDjBnLvKFHM89HQJqTCgpCyXa1qQSDaS3w/
 jq6z9EqZA1vimsMSdWAG8jf57U4EBHwEwufbMpFvywP++MiZPwoBzp2OQ5FqEKzy/cX1
 FiZUG7YovVMiRCQoP17rEUeeSTYC5Ob1C7uKxW2JFjwr57wnIVe4xtd6HlcOme3SYApk
 gWNQ==
X-Gm-Message-State: AOAM532I+vOXn7n11tsVvHEkpsSTIKpaNh2Qhoggv8e/Pd1qBMats+gS
 8bluwFY9+9jjA1mBdA0cEk3lGvxl77v5XbIhICA=
X-Google-Smtp-Source: ABdhPJz+mPBt1w0ZVF5ot5qjiuaeOhaA9v5A1SLVkElmmTlR8IGArmMT4pz9gEJ+J7LbWY73M9EE9DJ74oGTNNcog7A=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr410422pjz.228.1598557614008; 
 Thu, 27 Aug 2020 12:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-4-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-4-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:46:37 +0300
Message-ID: <CAHp75VcKctq6pAw+D5fYMtASGP_NuYOf4GJ+8t=Otxf_RVjKyA@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] iio: adc: exynos_adc: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154656_440114_73C5C55D 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, Aug 27, 2020 at 10:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/adc/exynos_adc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 7d23b6c33284..40585a96c848 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -844,13 +844,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
>         }
>
>         info->vdd = devm_regulator_get(&pdev->dev, "vdd");
> -       if (IS_ERR(info->vdd)) {
> -               if (PTR_ERR(info->vdd) != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev,
> -                               "failed getting regulator, err = %ld\n",
> -                               PTR_ERR(info->vdd));
> -               return PTR_ERR(info->vdd);
> -       }
> +       if (IS_ERR(info->vdd))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(info->vdd), "failed getting regulator");
>
>         ret = regulator_enable(info->vdd);
>         if (ret)
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
