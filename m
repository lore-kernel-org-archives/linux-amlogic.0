Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CD0C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vrgar9d6H0ngssQNXQCJgWVlTpnHch22jrE3VQL7RV8=; b=Lr931p+4bJE/st
	M9ud89/ZDsTg9yAUz/L9e5viz8dFkWNsPEWrw2fRU3dfxYHXfbZmsuPn7zixRn/yZ0YypM6IUohVS
	wvXMgxfdcPQwXzuUSQbuZ+UBxhd4GvxSXgq1HHqtyyvbl4ncz+X90tev+rgSK+L9qbgpQkPbOBbf6
	prM1fctW//6tpQhrKovL5IYx/ZWUZ/OMs7earX5lgVHdecc9RHxadZYZqsIjZEcGUqZZKrBue9L/t
	hnJDtiSa+r5x7K1imuZSilu/GTxP+nCURPhP8/oFovsDojJsfqD6hO0aEBJvaANSUmlmtxrYm+MDA
	3hur4Fmv7Q9PHw3fLVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0pFT-00EPlK-A7; Fri, 24 Dec 2021 18:24:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0pFR-00EPl0-23
 for linux-amlogic@lists.infradead.org; Fri, 24 Dec 2021 18:24:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id f5so35955963edq.6
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Dec 2021 10:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jT2ebSS/FYm3IYLCwLJHCGczAtJCu2K0/kP7nyId9n0=;
 b=kzdwlxTpT0yipxuhXA3uox6jcHngR5WHOEjF9xylP10bcZMWqDBUDtYzpP+o4LV25W
 ihoa6/FbXHi6dFL+38uQSm4f3GS499ZVgrkLubspcpiFfHMYjuVRRep9ZDHjsu+mVDE9
 npil8qrY7zKEy8alkWACdTfsqx38jp0Ie5zXphkxXTHZA0p1MbVEKcHLZ2Lw+iP+5afl
 /59TF5pu5R8Yy7bSQxcxHDz/HW9oxeM53J/xy63a9SVbn3q5ESEMD1fP0SrcWMdp5+FA
 HubXU6y50hR7bN2NxMpd0OAvz3MCtf0hTm3uFvTOADb1+mYObp10KNPuuOCroOvW8Pmd
 iqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jT2ebSS/FYm3IYLCwLJHCGczAtJCu2K0/kP7nyId9n0=;
 b=id3B5SRoKBVOy70QMt4uTEndQTi227MGXm5KIqw+tnhHOy1DLpOEsIDIDcJPn9O6bL
 aybvBlbSvL5eXYctzdhSxw34AQ9Y0c4TUIw+xoTGKrgUwxvsDYhCAh8R5pqr283V911X
 B5+bD7aAN/o2+mVaslfDuqh+B8d37lGCtVFKuVINXh4HhaSpoiEZZxM6h6ry+oQJ8PeL
 qSPO1FMazY0QCrpNAqidP6oRmkkWJgvWf40ALCLX1SnwpBI+11b/nwpBYev5gaLpQ6P3
 2YjSzDPGDGCVpYrzfpxw6zkhQW1ykf5ezRDFR2D7/Q8M1EDx/DEkZB/BglAjBFkgigRF
 z/qg==
X-Gm-Message-State: AOAM531YGYrBzGiUzYOub7wUbzfQ04q91twMs3N896rrE0FLdOB0xUAA
 dAslD95LFdD8zOH8s3BEBnLsNXd7G993p82bNgM=
X-Google-Smtp-Source: ABdhPJy1cELIweokRx2d2bHnhUyOmL3duo0pd6hCCl+1XjyfQtuhpw6JH0w8dDxkaQP+gXwafEnVHhaqQd2w8pg92gc=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr4683246edd.29.1640370295578; 
 Fri, 24 Dec 2021 10:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20211223055833.23466-1-Jiayi.Zhou@amlogic.com>
In-Reply-To: <20211223055833.23466-1-Jiayi.Zhou@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 19:24:44 +0100
Message-ID: <CAFBinCCscyxiTq3-9n8Eq-m+avo19+14DiRke+wGKcRmSmyi4g@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: external clock configuration for s4
To: Jiayi Zhou <Jiayi.Zhou@amlogic.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_102457_173601_2A62867B 
X-CRM114-Status: GOOD (  27.96  )
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

Hello,

I am adding my thoughts in this email which are in addition to Uwe's comments.

Please always Cc the linux-amlogic mailing list when you are sending patches.
Currently this patch cannot be found in the mailing list archives,
patchwork, ...

On Thu, Dec 23, 2021 at 6:58 AM Jiayi Zhou <Jiayi.Zhou@amlogic.com> wrote:
>
> From: "jiayi.zhou" <jiayi.zhou@amlogic.com>
>
> For PWM controller in the Meson-S4 SoC,
> PWM needs to obtain an external clock source.
> This patch tries to describe them in the DT compatible data.
I think this patch does more than what is described here.
It adds support for the constant high/low output, which is a feature
which I think has been introduced on the G12A SoC. I suggest having a
separate patch for this and also enabling it on supported SoCs (not
just the S4).

[...]
> +#define PWM_DISABLE            0
I don't see this being used anywhere so I think it can be dropped

[...]
> +       /*
> +        * duty_cycle equal 0% and 100%,constant should be enabled,
> +        * high and low count will not incease one;
typo: incease -> increase

[...]
> +       if (meson->data->extern_clk) {
> +               set_clk = clk_get_rate(channel->clk);
> +               if (set_clk == 0)
> +                       dev_err(meson->chip.dev, "invalid source clock frequency\n");
> +               set_clk /= (channel->pre_div + 1);
> +               err = clk_set_rate(channel->clk, set_clk);
> +               if (err)
> +                       dev_err(meson->chip.dev, "%s: error in setting pwm rate!\n", __func__);
> +       }
> +
>         value = readl(meson->base + REG_MISC_AB);
>         value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
>         value |= channel->pre_div << channel_data->clk_div_shift;
Why does this new controller version require clk_set_rate with a rate
that's calculated based on the pre-divider and then also configuring
the pre-divider in the MISC_AB register?
This seems odd, can't we use only one of them (either clk_set_rate or
setting MISC_AB)?

Also if clk_set_rate is the way to go here I suggest refactoring the
existing code so the pre-divider is a clock as well so we can use
clk_set_rate for both, the "old" and "new" IP version.

[...]
> +static const struct meson_pwm_data pwm_meson_data = {
> +       .extern_clk = true,
>  };

[...]
> +static int meson_pwm_v2_init_channels(struct meson_pwm *meson)
> +{
> +       struct meson_pwm_channel *channels = meson->channels;
> +       struct device *dev = meson->chip.dev;
> +       unsigned int i;
> +       char name[255];
> +
> +       for (i = 0; i < (meson->chip.npwm / 2); i++) {
> +               snprintf(name, sizeof(name), "clkin%u", i);
> +               (channels + i)->clk = devm_clk_get(dev, name);
> +               if (IS_ERR((channels + i)->clk)) {
> +                       dev_err(meson->chip.dev, "can't get device clock\n");
> +                       return PTR_ERR((channels + i)->clk);
> +               }
> +               (channels + i + 2)->clk = (channels + i)->clk;
> +       }
I think this is whole function is broken.
The vendor driver uses four channels per PWM controller on newer SoCs.
In the mainline driver we only support two PWM channels per controller.

Now the whole loop starts with npwm / 2 which is always 1 in the
mainline driver.
This is the first problem: this would never initialize the second PWM.
The second problem is that "channels + i + 2" would access channels[0
+ 2] which is out of bounds for this array (that array only holds two
values so only index 0 and 1 are valid).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
