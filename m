Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904ABC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Apr 2022 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hK5VIPUEwMcXm7VeeopO1QJy32fruj7f8iiPKWwiY4o=; b=1Ub3m8y/0AdYoj
	l8Rb2dEKBCIlkg17DJh7f8+Z14Mvqdn1fUietuLORICMxwWCtqmUgKPRfn27nVG18vDnvFhil+TWl
	VYv0v5A3cPJ/Mz4SIMsO74+EdhMEYNw3ukS1rCLnJMTkRk+yQ5dYMbZcU/HvXBIYep7cXG/jOp6hZ
	F5zcQAn2O3tBpRwgK9s/1lPxseihQ557oSZ2I8ihEDtXpXJXt0FcKFdP/IIsEPqczWwV0+Abalom4
	tuQ3vzlHTEE7j+IUqQYHXiMCV4aP9v2rF1/FTMEUUFZz0Du5lOHMztTCcTQrGglc5m7OvTjZvfhfU
	/B92Vo7EQ+416L+kf0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj3pK-00AyhO-T4; Mon, 25 Apr 2022 18:52:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj3pI-00Ayg9-Dt
 for linux-amlogic@lists.infradead.org; Mon, 25 Apr 2022 18:52:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z19so6311014edx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Apr 2022 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rK5Am2eyJZrP+TjI3mcdQmDmAbLxDAY93LxF4pkcc04=;
 b=wyIvNVCmjicmGVHNvEJ4sioRquKVXwPojktRypTwVjhsr5BzpZOC5ZTWMOte7j8NPt
 WqSCBs7AJuVeB0dA9oW3R5fECmYMDFYnqUdF5P7jm9OQBdMcgw5REROXS5cXf5qsUTB9
 dBRLLYur+w8P33MBKbLh/TDtqyvxYt1ZXYtf1vLaz5XUZIGNtjphodcWsrC8vk3jsNaC
 BFRCFQDme4/e/i4Lvef0eEkVVROZ9pGSC6y+qly37NWE1fV6ZGyRsSmcw1RR5z9X8ScW
 MAQi1kZc4VhVWbfmsgp8reqAy3FhenP/ZiAh8Ef+2DLlib6P7vj1t9xCmNJ9tg39sG5c
 WwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rK5Am2eyJZrP+TjI3mcdQmDmAbLxDAY93LxF4pkcc04=;
 b=T38868px7RTpEcjRQJtDbY/JoeMNI5FwZh6DxMjAxJoIl7Jeu+HJNqD6JJC5gAOeP1
 zYplthTnB7wNbaI2eWBEwihFnfiL5c7xKJ5JhG9ywlYwoDXZ51LhmAiBImyrX88Rm1K4
 1dmkYiFbieaMwu/26TD7K91ZfTph57mVfRDdrEt3KvzqyE73/Ke7ogmRzomaU+H+PHxc
 zaZhj5My1Q8HIdXVhZC0o/en97fy8qXvV2gJpc90jfvSRy4IzXZQPU6dCF/Bg/ctx1Va
 6zuRki6o5RoTasFC2/QIKBxBB/lpmwq9R5SPPOCPhy/wWJnDJD6L863JZk8EZXqTgf/e
 7WIA==
X-Gm-Message-State: AOAM532cHe9IYHiO8+RT/KOdFUBPMAWYKUHRVHUQzn8y5yHqBI22c7ef
 Q3n8ekpOpy25W//vLGvol/sbX0PvSvJn+7U53qVScA==
X-Google-Smtp-Source: ABdhPJxc2e2Bg6/ErXa64ThnSjhabj49f/QSVMoWjqtgIyxc9MS1i/xehN1lPRQK2TXMBTtowv/7qeghfDfrfQtJ30g=
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id
 ee50-20020a056402293200b00425d7b3e0d1mr11534459edb.141.1650912766933; Mon, 25
 Apr 2022 11:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
 <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Apr 2022 20:52:36 +0200
Message-ID: <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_115248_500364_356E4A5A 
X-CRM114-Status: GOOD (  17.61  )
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

On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Introduce a helper to get first GPIO controller node which drivers
> may want to use.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/gpio/driver.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 12de0b22b4ef..83e2d72e51bb 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -766,4 +766,14 @@ static inline unsigned int gpiochip_node_count(struct device *dev)
>         return count;
>  }
>
> +static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
> +{
> +       struct fwnode_handle *fwnode;
> +
> +       for_each_gpiochip_node(dev, fwnode)
> +               return fwnode;
> +
> +       return NULL;
> +}
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.35.1
>

Any chance you could name it get_first_gpiochip_node()? It's static so
we don't have to worry about the prefix and it would make the purpose
more clear.

Bart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
