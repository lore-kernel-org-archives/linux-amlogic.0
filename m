Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586D1C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:00:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275D620825
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3bUlXTf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjsVfQcb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 275D620825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rZVzKlA1VpokjPfdfPL0VXmeq+VrL4+A3J81F4+lG8w=; b=o3bUlXTf3dMsUmdAvUtHYzAxD
	0V3KdsNHWzMuY83Tisc4IpIjR+BdSuUHEFQ1nl9b6eSowzg2iriiVbDFl5B4vPYQbgnmeOMxFJaxI
	IooO2/NG5LjEHRChb+mzi7IC5zr5WnCBwPQyFPG1uJ9dT9pnhzVVpPDw0BoQt7oMoXciae4Hn8BRF
	52NcsBrnOJDzxFpNTkOih7fHxFVgEwX9LqiZXTQKTeqbHgkbRroAp7KRZmLKgXxkNnODh9jC1fT5M
	ycSi9cibNMRoZ7Z1rsO2Hv96WMkbH9Dcbxvzq+q0qdGzz7eCHHosY+O8lA73VdbTBD/FqDwdZFfbD
	klwn84HKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO3x-00029p-P9; Thu, 27 Aug 2020 19:59:57 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO3s-00027e-NB; Thu, 27 Aug 2020 19:59:53 +0000
Received: by mail-pj1-x1041.google.com with SMTP id z18so3210227pjr.2;
 Thu, 27 Aug 2020 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtW/ozpx4qaFKtR4WdRiyJH+a5pa+/rdp0E0zYCBtiw=;
 b=AjsVfQcbbs8m2CmFrHV0gwxOPDDFel6Dtuz0EVsMe9pOvePSe2KyCjg5R54J213aA0
 dYs7dOdAsqUXhUKoWNElRVtmUGHCALn0WOiQUKE3W6V6pIo5TVmtY5wvgoJScOJBWpF2
 ZwroeOfqHbSXgH9NOC4gFVc4jTWoND5bcI6V09T8yOcf2ohLyiHpQVEaPEZNqdAIqkPI
 UeZlWWC0M/SJWy9F5wyNplXtqhJHSmtWHVsSFfV7wIy865aw2DytyMKKrm30aAaK0iG0
 tmW4yhgyhYPR7janwCUFLJmWVHIfAqhea6q549D12zbhnsK/fJvsZeTjhzSky3l/gGR3
 9QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtW/ozpx4qaFKtR4WdRiyJH+a5pa+/rdp0E0zYCBtiw=;
 b=aBI5V3Yx42atuQuzND9Vlj/fx4zvfgDgnMJH5M6IGQFkGGdk8fteiaH8LLtjGraZJ3
 I3Cok2BT4Okzk2vqJnasQfLG8PNWhm2UBnz8cAWDxHcwJ6evVWdKi2qDEkXziBs0XmKN
 Lo+lTX0hP1PT7BRRTLc3XCs7lxa8Sd+ntuONIYUHY8X1BcjDGNKhDA8nNCnnyPeQ1KfQ
 sZfHYjvaq3R2IaQNOOwcno7fWw+K/S1bhaD1peyZl6vaUg+mInndvsoVuJM0Zneuksct
 nQ+fE9FywYL0cR/Xre1W0OYjZ7pvIrrsOHMQ3EQdK7MrNSKtfH94CARJxuy7QCSeXiXJ
 9LNg==
X-Gm-Message-State: AOAM532eYhzfBRZILvN0QA9stk5NL//hG6m4TCTQvr6Z4fXNu+lDom11
 Pfv0f63eYzW4jTq9KZxVU96qdecc206sGgC4P6Q=
X-Google-Smtp-Source: ABdhPJztdvx7l/Bma3wdHdw/Knt4y7nn4/yOSwjk8CneJT6blQkPrpb2KiIZIrG26U/H2iMIqzfbq2Fkdjt5j2df1p0=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr433859pjd.129.1598558390619; 
 Thu, 27 Aug 2020 12:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-13-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-13-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:59:34 +0300
Message-ID: <CAHp75VfByooMDK0bMGG-EiYg=x5NtYaweAyeJ3CXH38j_xPw9A@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] iio: imu: inv_mpu6050: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_155952_812491_048D137A 
X-CRM114-Status: GOOD (  19.45  )
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

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> index 3fee3947f772..18a1898e3e34 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> @@ -1475,22 +1475,14 @@ int inv_mpu_core_probe(struct regmap *regmap, int irq, const char *name,
>         }
>
>         st->vdd_supply = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(st->vdd_supply)) {
> -               if (PTR_ERR(st->vdd_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vdd regulator %d\n",
> -                               (int)PTR_ERR(st->vdd_supply));
> -
> -               return PTR_ERR(st->vdd_supply);
> -       }
> +       if (IS_ERR(st->vdd_supply))
> +               return dev_err_probe(dev, PTR_ERR(st->vdd_supply),
> +                                    "Failed to get vdd regulator\n");
>
>         st->vddio_supply = devm_regulator_get(dev, "vddio");
> -       if (IS_ERR(st->vddio_supply)) {
> -               if (PTR_ERR(st->vddio_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vddio regulator %d\n",
> -                               (int)PTR_ERR(st->vddio_supply));
> -
> -               return PTR_ERR(st->vddio_supply);
> -       }
> +       if (IS_ERR(st->vddio_supply))
> +               return dev_err_probe(dev, PTR_ERR(st->vddio_supply),
> +                                    "Failed to get vddio regulator\n");
>
>         result = regulator_enable(st->vdd_supply);
>         if (result) {
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
