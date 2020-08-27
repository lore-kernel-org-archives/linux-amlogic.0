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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBB4C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:01:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A64082087E
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yfws728+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7gOG6wg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64082087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Db6nhj+CYD3Bt5vG+8f40441Rdti6Q/zLvmjg2YBNZg=; b=Yfws728+oUkBQ58vgJEjXfwrW
	nsFNBzZgOpGm+f3wfGvDhhGttqa88oZUSsitJ9xJv1rbZ0eh8F/GLIP1DPIscIQ0d9KHvel335M+j
	uccXxAS3ZpYORORraIJbReetkll3Enp2BOmOSKUae62UclL0RFxRi9ehjH0U65UuGCUnI8GrnmwFX
	mXIw8Eavj91Bxa+JwlQZbKEfWSBvYaIXck2w+yn9jHZ7+MqN8s07FXv4AROAVCpQaJxk1chl9iFVT
	s4OgYtzDWAbEqBI86wFQZO4TGymJTw2ByQDbWRrTHJEosST+mA9H8wCw4vcWn0O5RvAO13XwUxgyA
	yesm2s+5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO56-0002YV-5M; Thu, 27 Aug 2020 20:01:08 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO4w-0002Tt-61; Thu, 27 Aug 2020 20:00:58 +0000
Received: by mail-pg1-x541.google.com with SMTP id g33so4124874pgb.4;
 Thu, 27 Aug 2020 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PibWI1WPUcSBuRxCpQduFOuzkYtMaBM/7TN/dC+YiE=;
 b=b7gOG6wgCzT8BP986bm1kkzzFNR5NMwx61bMRrJN7WECwQlCKbLJ0mj+ASuG3rLlY6
 sqRQr5z+Q5tmBHLiaNmXtpOJF/m8HhJKOC0N3BnLyEbvLECd9gi43KZGF2mLOy/Fx4eF
 agm1klSih22rh2dQo7IKSSeLNshpUwc1PCIvsvcCgIR4zda8EF+aBJ++duzL8wRoYBRC
 lV+0tCCiFNxVlpGSz7CUbjh0RX+LcmJ5edho3Lr1QZwtUFcqdZGWYHGcG5ZsUTsQWcFN
 mA0KZnlMJH3puC9gFYa7jPr92KVbp1OjVTWGkYZ+h+qUcWiPSjgBhwkVisWpkBweIh4Z
 T5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PibWI1WPUcSBuRxCpQduFOuzkYtMaBM/7TN/dC+YiE=;
 b=sDMGFQRj8uSSp2nJ/K6trW4rXgnUFitTpimLyovmlMTFjfr/bTsXd5rXOYEInMFsG6
 c0t3BaiKm79cMwDx4SwDCuNngbbDaNhL8F1+E4qXy180ahPfadOHyu3fApaXQINKnr2j
 +jk2dup5+Bg4FMsU/IlhEz127RdebPDGZtkxBJEclb1W0PqOk+LkA7DqAm771z2uG0nO
 qK0tAKFDMMKfFdhf52k0njdqk5tM8oGu7UWqHNz6YIfkSAyncLWSYf5dALgQ1OpQITQH
 X4asNh0LB7UJE5tgE8YOyp99jSyAa6QBNyOo11ARj/nUqtDz8fD/0xQRixw9FIva/+YK
 E4cw==
X-Gm-Message-State: AOAM5316ebH8Ptkq9JMbT4X1uGeGOw5NE9owGIJ6UzzsSxWG2DCCq6kq
 E6fiyPJ2TNyXZNXCnnA2o60uqZS2Mo9nBfOX3nc=
X-Google-Smtp-Source: ABdhPJyEG1MTF89o46Q1T9Rrytm05a/DG3yol0nSkedmBByh0DN6BD25pKcq0V/H+yCjPfC4PIEK9jFZo90rwd/rC5g=
X-Received: by 2002:a62:9215:: with SMTP id o21mr6817717pfd.268.1598558456196; 
 Thu, 27 Aug 2020 13:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-15-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-15-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:00:39 +0300
Message-ID: <CAHp75VeC248LYFUX2q-EU9c-d1pO2Fr0TCbS_U5+SaoQt3gn_A@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] iio: light: tsl2772: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_160058_246942_6CA73BED 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
>  drivers/iio/light/tsl2772.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> index 735399405417..d79205361dfa 100644
> --- a/drivers/iio/light/tsl2772.c
> +++ b/drivers/iio/light/tsl2772.c
> @@ -1776,14 +1776,8 @@ static int tsl2772_probe(struct i2c_client *clientp,
>         ret = devm_regulator_bulk_get(&clientp->dev,
>                                       ARRAY_SIZE(chip->supplies),
>                                       chip->supplies);
> -       if (ret < 0) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&clientp->dev,
> -                               "Failed to get regulators: %d\n",
> -                               ret);
> -
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(&clientp->dev, ret, "Failed to get regulators\n");
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(chip->supplies), chip->supplies);
>         if (ret < 0) {
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
