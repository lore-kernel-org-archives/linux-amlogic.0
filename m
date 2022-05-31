Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A8EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s9FOVgcMH8KbMIleupdG4TZhslmfSp47rbZRO/eIF0=; b=LFjgBHIOQk6e6V
	8IkrC939Q4KuqNaXa+Tv6eAOVR2+aHJQu9x/GtFicmMeFvv9E3f8Owp9u9ev4oAcCtVzNbbimcT/+
	Q/CQLguc2jOA+J2NIP+9vGnqdH333+syOyRe1FuOB/jjnJazgJoHr5KzlUEYzNAQQxx3IO1EqAb2L
	rkC+gtw+jtU+neLOYIyqeWQ4EzcmyfSxXyPOOnBCWOvaTN90VGilraLm7Uzb4cDR03owoZq5x/WnT
	Im227Xg1jG4+wvsajWPkhRVZ1mchBO0Y08Csukjz3EP11nY6DD/8b1lqrVH8Q3xMczwuSHrpuWi6f
	B+xHvVyEwH32qDyf2Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9oJ-00Cm5N-Kj; Tue, 31 May 2022 21:53:55 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9o7-00Cm0t-40; Tue, 31 May 2022 21:53:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id w27so12615641edl.7;
        Tue, 31 May 2022 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jKLy2+1wJ6FvjsseDYfkSRIwq6bSkGwUcxVnEaBaHo=;
        b=k9+rj8JVq7JLtvRHCT0gkLzsoLUqcwgI87tvWqPsUh3pgL8DstthzlcI6SWzSXXn9E
         NoyAF1rZaD7uQPf/fFidt8v6Q0tz1zQZHVpGhsTzAcoyzu2QCTBQuJCN6ghcHA7MHG/c
         NyBud0an2JLkmdzTZpxRg/SbQciP9LNFZ+5k0HcsB8L2/Oh02JKB0JFihba6zAqqKzLs
         xlTqiIZQi+G61Apnx2aPPc8u2hLXtRbbi5vJtxNd0flO9/LkA3AWxmjXx3Ehoptb2WuV
         N92wj3PeCZ7HaOagNsAi1c7e3ZdHhlqXTUhRrXQpNImp9pGf2/vIyGYaJQwLj72MoGek
         A3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jKLy2+1wJ6FvjsseDYfkSRIwq6bSkGwUcxVnEaBaHo=;
        b=JA8gZqA3YeH4okD+RYQTvzKEt+rmtc3mOdmg48hSMhlgrk6uIqrpAQkqTxCOENS0/d
         WB8bTTLv+110Mw1DPazULNVHwVkrFK0cnzgAPuKwlRPObGwAfBqsoDjqEaGLvAiC68rn
         BCCvvk4bc4ebFooho63nfyNimvEaQNL3mmI5Kl2K9jzXTYNLRmlt5liVB2lLbCOTBCFW
         3DABBF6pSSRv45JxGZ+fzkiKnh6uYfSn4//gUClLJG8M3Nee0YI7T6cbvU+5qW64gdHM
         BCvzfZkLsQ2UdYCYJ7nGZwZFRvMLxd9dUps/fjAkr5N21/Y/eRhN4hKdtyqRL5U4K1AA
         m/yg==
X-Gm-Message-State: AOAM532J6KjpJmsyUdjZdgR788/kXOkYVsv7todxJRD4l0pQyY8gN+92
	OicP+zCMcBU59l194fKTjVTiZIKjifUnCnDlNKg=
X-Google-Smtp-Source: ABdhPJw7V2LqbZ6gntsjtVD/ZVuc1e6nKKIT+I2uXvIrAVuxJVfdZuF08H/Htj7WTo432yGeoXe+1LvBNyhatPFpxxE=
X-Received: by 2002:a05:6402:254a:b0:42b:6c9a:c06c with SMTP id
 l10-20020a056402254a00b0042b6c9ac06cmr47865254edb.199.1654034017881; Tue, 31
 May 2022 14:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220531211842.71998-1-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 May 2022 23:53:27 +0200
Message-ID: <CAFBinCAXPGXmuChU9XrqbH4Di6L6rSihM3VSqfFzMrK0D4bLuw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] iio: adc: meson_saradc: Convert to use dev_err_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145343_203537_CB3B2034 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andy,

overall this is looking great - thank you for this patch!

On Tue, May 31, 2022 at 11:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
[...]
> +       if (IS_ERR(priv->tsc_regmap))
> +               return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap), "failed to get amlogic,hhi-sysctrl regmap\n");
checkpatch complains:
  WARNING: line length of 115 exceeds 100 columns
  #44: FILE: drivers/iio/adc/meson_saradc.c:728:

Adding a line-break right before the error message will solve this problem


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
