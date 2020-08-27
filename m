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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287D7C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:55:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE71E2074A
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzFeh37a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJNPerv+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE71E2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u0bszl9yERMXO73TiVwwqt0lDO6HyG5Xa7yWDQWLlto=; b=QzFeh37a5e4JeJIc4NwlEvAkc
	Zlmn0tEABfel/6m6KLfyMPah4ZtRsiRBVWdnJyT4uXgKPOOpQ0M3dmT+ydyKJ3p+BHqdFb4+VwVXv
	8BR4rtAfAJWClyq4c0pTeESzK3xjsR1OAqK8DtreWrtItyVewrZNIQXURJU2wHcnqWpOpKpwA1FVO
	I0Tgg6jzXupusaXZ5GAgZkHfL4sYlTU9tEIr5ozsMGL5nkyRGMjdNtOIaayRP0HkgK71olFi6HbEC
	48f1npnCa5P3vGLzZ2R4rBAH7cAn2L8K9NtZmKTNj/xpoQU+L4CV/jQdnZtflHTO1jjOAayWHkE5z
	gh5fzjE9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNzw-00010j-05; Thu, 27 Aug 2020 19:55:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNzZ-0000rl-4Q; Thu, 27 Aug 2020 19:55:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id k15so4311527pfc.12;
 Thu, 27 Aug 2020 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a447o0TIIe56Effe0RiDEzq1r8VXzso23Bql8Sh47SQ=;
 b=iJNPerv+D6Wlv6jntU6RuRXEHqUp0FtUPafG+q6O82bxjmsX3wu7vAqvlxhZaghmSH
 dUNPoFLCxeQT9RuzUpIQ2d+NiOiS0UACXwcF5I17AfP+xEbYRmaqzxZEDbKx4KekJt0/
 o/zQVjSyDNFrTQRZRXUONJ8yRxCiBNZgwZTwnCzUgJdnJtYXkG/g70yPUVIjLa0w+/JA
 Tx3TDT9Z0upM8vHEOacF2i6Ow8CajOZIWnlL8NU0rd+QN2ctK8aTkUHNxM4wv4oiSONl
 3nS6f94NDBc2sfh5IC73mwfWYinCyfMaWBDtva/HV69+ec5NQT+QJzccwa6HzQx67i4R
 /f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a447o0TIIe56Effe0RiDEzq1r8VXzso23Bql8Sh47SQ=;
 b=d2NCMayFBzCgf3IjdRsZUT+fjH/j/8zzoHyxI7bNqulN1q0kvLW0fssQQgDLiRCUpE
 QfEl9bN6z+FL5BbqbjvOg7POdQj7OAWVrrMQxrQk62NbNyWJFbheNghmqN3SjJGZiPcC
 JJ9wyYg8ufeOUX6bMxmOjuT8KDPJ6JrJkXXOBe2R+0XAv+Y4UlrIOoCDg0znEkgaqbox
 c4oDApVReNy89a5i6ceXpvUcN+AQ98GMVp5q+aI8iRr3SxF+2t4+EKKcwuxC9n8dmed2
 rpLG728oOTLQyROsJND6hYsVeRG6QeujtZE2OxxiGgZ96UslOCJaKsxvqD6GGdrqy+zR
 RB9w==
X-Gm-Message-State: AOAM532UI/LEBgvkcvxcUV+weM2EBGU2LWgpkqF5SrVWGvo01wN1D5c3
 6KcLSSeE4mhimnZwYS9jtVQVxTTAY1uH5scBb48=
X-Google-Smtp-Source: ABdhPJw67IkikO0xwQzWrqUZ4T363Hvhj2FtfLCQk/A2GvTmAUns7Z2+M8nm+bLCgXnjK3iq2pIei3aEvQrODJB24bM=
X-Received: by 2002:a63:c543:: with SMTP id g3mr8405213pgd.203.1598558122833; 
 Thu, 27 Aug 2020 12:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-10-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-10-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:05 +0300
Message-ID: <CAHp75VcNQzZCWMg-jyOYuVfcJ-C9+=3Z2hn1-7yQ6yXNfOz-yQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] iio: amplifiers: hmc425a: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_155525_219125_63DE0FD1 
X-CRM114-Status: GOOD (  20.34  )
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
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/amplifiers/hmc425a.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
> index 582708924e4f..bde11df4bb9e 100644
> --- a/drivers/iio/amplifiers/hmc425a.c
> +++ b/drivers/iio/amplifiers/hmc425a.c
> @@ -201,12 +201,8 @@ static int hmc425a_probe(struct platform_device *pdev)
>         st->gain = st->chip_info->default_gain;
>
>         st->gpios = devm_gpiod_get_array(&pdev->dev, "ctrl", GPIOD_OUT_LOW);
> -       if (IS_ERR(st->gpios)) {
> -               ret = PTR_ERR(st->gpios);
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "failed to get gpios\n");
> -               return ret;
> -       }
> +       if (IS_ERR(st->gpios))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(st->gpios), "failed to get gpios\n");
>
>         if (st->gpios->ndescs != st->chip_info->num_gpios) {
>                 dev_err(&pdev->dev, "%d GPIOs needed to operate\n",
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
