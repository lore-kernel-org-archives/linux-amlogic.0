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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FF5C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:45:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6277B20707
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QN27s8T2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDtkvONh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6277B20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K/EyCpMnVz4rswz5oMulpaxtrHn9Z3bTVrQ4lt4rLbc=; b=QN27s8T2gxdHv1qJsxz3cQ5aZ
	nf+BKSxmttEt7hwXu6QFWTbgvHxw42PYPNtVaUZy3VJ59BOYlXAmSc9QmRfmE7GybH5fa0wQDuX9s
	TARznsbIUElen4afKKWMEZVgNGZBXaSrAiBwDRXsLLNb95QAUvWE8w2tE2HlT5BFvAOHHHJtEpOOf
	gP4FOmHxxkfRxWBwx5fh6eAiSguY/bjZXpm6db5VCr2tsz+cA9SvPJzHwdYdQtn94zWz6n6Dyh+GE
	u01v2WLPUSS0hqZFjflHEc1JPpx6+FCNa+hO6xQZ7Yc2KYQZHVfWtij0/+GRgb5ZUbG5LWyNprqLg
	D6CghjzyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNpw-0004Yi-U5; Thu, 27 Aug 2020 19:45:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNpt-0004XT-BA; Thu, 27 Aug 2020 19:45:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id o13so4114932pgf.0;
 Thu, 27 Aug 2020 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DsY79qVdnz/yUX82ew80473wZLT4P/n0zA6vYZgLAJM=;
 b=DDtkvONhdCDz2E15P3lgm4SUPfbidvJwyzD/KGMvJl5Uaj+BvEDrkhmpYeNcRP3WfK
 oeCzjEsz923anj2td9TkmoUrH3RirNTL6NWuMWq0c46s2akRNJn8ZAPOEqpgoqjBJkPm
 y6hj7W4fibWg/xEPwbt3AhH35mjnu/xsZjuu1f6kDcSjEjXYiDfNO18/BweXqDuXxcKJ
 2Hb6RvXZRgyxit2KC8hOo/3C7HM0GmVNmCuoWM8SaWTggcxr0ZBg0vKXKKitWR3u7NwR
 BJnPeBZ3LIlM/+ygoHaKIGQVEDH/Qzy8Bj5vp/TzfG5iuAwRLoq7r93AR679Eirr4Svh
 fzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DsY79qVdnz/yUX82ew80473wZLT4P/n0zA6vYZgLAJM=;
 b=AO9SCJ5919yX8XXosscL0vk+m5mj+c9C8rOdiDGc/Jen65WMdP8J/jd62BYcaH+W/A
 G7yNwmJMmvRYvb/u9o3GLuiUwGbED0CpsiVgvZZWnqJkdWkg0Q7J36mk0aJfnKz4igLD
 GmS31E9LX93EHYjHuTDFmrwd7jeQTcahGK/sdpe9DuKQM8Pvd9rRApds4+PZMRwHcoaD
 KF0POWrctYCJpqfcPRRoNClfDKPKQYdDjYAED5KdHA6wjSLqx/quy4EU/CVL/yAho6F1
 gdvHr1abZ6TlIopb25Y7oKwI1nxBXrnkE3xfQAinrt50BnZ6vhlDynhcugUG5phBlAuJ
 2VTg==
X-Gm-Message-State: AOAM530EDvpT/gXnfVvQPwa/D6GpJbbPFr5ka3HvK9TYtd6CFdo5gSRt
 Pi8s1lCDZ2Jqxw/aQvG7PPslSe8Vbj+zncvLysc=
X-Google-Smtp-Source: ABdhPJxTPsEZ0NvbCTeS5S2AtrwEnzIQfqw3CXuZCY6zFOfEvr+qWnk8Liv0uWUJ1MAF/BZU0DBK6bdXUJnm0FufMsk=
X-Received: by 2002:a62:9215:: with SMTP id o21mr6773830pfd.268.1598557522910; 
 Thu, 27 Aug 2020 12:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-2-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-2-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:45:06 +0300
Message-ID: <CAHp75Vc5iPhe+kRRiqcLfkos0x3VnWH8E-43VsAzbYpNsDg0mw@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] iio: accel: mma8452: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154525_415478_36689B14 
X-CRM114-Status: GOOD (  19.73  )
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
> ---
>  drivers/iio/accel/mma8452.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 4e6e70250048..104b87b98455 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1538,22 +1538,14 @@ static int mma8452_probe(struct i2c_client *client,
>         data->chip_info = match->data;
>
>         data->vdd_reg = devm_regulator_get(&client->dev, "vdd");
> -       if (IS_ERR(data->vdd_reg)) {
> -               if (PTR_ERR(data->vdd_reg) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(&client->dev, "failed to get VDD regulator!\n");
> -               return PTR_ERR(data->vdd_reg);
> -       }
> +       if (IS_ERR(data->vdd_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(data->vdd_reg),
> +                                    "failed to get VDD regulator!\n");
>
>         data->vddio_reg = devm_regulator_get(&client->dev, "vddio");
> -       if (IS_ERR(data->vddio_reg)) {
> -               if (PTR_ERR(data->vddio_reg) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(&client->dev, "failed to get VDDIO regulator!\n");
> -               return PTR_ERR(data->vddio_reg);
> -       }
> +       if (IS_ERR(data->vddio_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(data->vddio_reg),
> +                                    "failed to get VDDIO regulator!\n");
>
>         ret = regulator_enable(data->vdd_reg);
>         if (ret) {
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
