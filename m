Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBFFC2BB41
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3zdo1CZ6ep8W8m8inl0Fv3RBRts4SeOF9Z5iu9F0Kg=; b=AcrP/OT6dZnJT/
	X5Dgqi5o9Ce7/iGb6I+atHQwi8pl4d+lQqFAnA+LFGTuWMuyR3aLyxGEgP5xEZsvQ8/twLJ7SkCda
	mPqZ+RRQg22BqypfdAH7WdKtg4Vijiwi8othKOS1mFu7OkNzpVPTrxBk/C0YJ6rkE0nfyhWawnApC
	6nKSx5s0auymvJSfbf4QveXswH7qy56hj8lZKF/zT4IsFkyf5Qm7FG4X97vTj/Lu0DMC4+P6a5+Tc
	2Q87fnA8Rhu4FIiiTUPLLyvn/Ne5JNoQ07AyLgtA9VhhORb5N4H9dI4obRIPjsMPHPJ5oDYXNuZv1
	ePE3v2vhO45tCAZtyIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsA9-00Gv9c-Jf; Tue, 16 Aug 2022 08:43:01 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsA6-00Gv7N-Ta; Tue, 16 Aug 2022 08:43:00 +0000
Received: by mail-qk1-x732.google.com with SMTP id h27so3200654qkk.9;
        Tue, 16 Aug 2022 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=M8+zN5n51GohpbStdjKXmJWXHgqhXr7wmE0QoYJl1Tg=;
        b=qLuGJVydbZapmuhh/ri/mPvYA5bm4nMtIaG76TKtA3Mvo/gBhkJK17beJcQl4lBkM0
         iPBdZSSrCNgcezsRIABTJwp7UtgOhSIzqLsuYw6uKZIdWj2+EzGX4Ynvo2pcygJ3ES0H
         rNv2bDiwY+8yFgEBX8y3Q+RZ0w+7z61uHWS67T1C+ZdmOf9xIz3+Ss494E0LnAKj62KJ
         uuV7tjhnSgJ133uq7dK9dc8YkqzpGgSLl11+J0G8NNyLbKRknzb7wyR2X4f7YRD/3396
         ChRcoJ8Z8tpfDVeQs7eHQAwLSDOEU4j8m9CRydpoEnGFQI0rjqmOED+9BOVCNq8moS5U
         UQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=M8+zN5n51GohpbStdjKXmJWXHgqhXr7wmE0QoYJl1Tg=;
        b=R7EUxqr+sYYb61+h+fxkanNNGY0Nen/MJpuCp3oaF0dKdC183BHT7It4eENCOc0vKc
         hUN2vBVRj3CNanX2cUhYyDzwlSPdScTDzqqf73JhS1Oo94rjtrL+AfgD8KQdCmy4pY0R
         FZYLvP88tXlVqYC3ON9AXePE4m6YRogRytmiOWLxX+Z7LKVjhrev3hipgU4J+P0u2F3o
         KaHlsmX+mDUa2z8cc34vg5V/qW5wWbps2389gL1y0sPPVnzeYOUvgmXJekfKvhDAL+Ag
         n62J/gEWG0MntPn5W/a7yCkiqM2znFt8a673JcxYxPhqYleMvHjGjXhYGY4djNI2Wq+2
         pQAw==
X-Gm-Message-State: ACgBeo0y66W7rruh5TUXPPGmkMzuOmaKyBS8ltvGmSS2Oe7tEmuBOVzT
	rhdFcazNSO887lllgDyiNQdUYK4lfXqonwBvWws=
X-Google-Smtp-Source: AA6agR4R4lk0CDBQHZmGfGnS3MaEvTJE6k0Sqbe/jCHB+ee624GaEK+KH/pS5yDyRz1iFyVysOe/Lnz9Oes4idkTrfs=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr11131735qkf.320.1660639377250; Tue, 16
 Aug 2022 01:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org> <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org> <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
In-Reply-To: <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Aug 2022 11:42:20 +0300
Message-ID: <CAHp75VefRphjAhSmrUVC8aaAhrwMD+9Jr=OROFU-0JuNhuFYDw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Documentation List <linux-doc@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miaoqian Lin <linmq006@gmail.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turq uette <mturquette@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jean Delvare <jdelvare@suse.com>, 
	Alexandru Ardelean <aardelean@deviqon.com>, linux-hwmon@vger.kernel.org, 
	linux-clk <linux-clk@vger.kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Robert Foss <robert.foss@linaro.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	David Airlie <airlied@linux.ie>, linux-iio <linux-iio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_014258_975268_70B019FF 
X-CRM114-Status: GOOD (  32.33  )
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

On Tue, Aug 16, 2022 at 8:37 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
> > Quoting Laurent Pinchart (2022-08-15 11:52:36)
> > > On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:

...

> > > we'll run into trouble. Supplying active high input signals
> > > to a device that is not powered can lead to latch-up, which tends to
> > > only manifest after a statistically significant number of occurrences of
> > > the condition, and can slowly damage the hardware over time. This is a
> > > real concern as it will typically not be caught during early
> > > development. I think we would still be better off with requiring drivers
> > > to manually handle powering off the device until we provide a mechanism
> > > that can do so safely in an automated way.
> >
> > Can you describe the error scenario further? I think it's driver author
> > error that would lead to getting and enabling the regulator after
> > getting and enabling a clk that drives out a clock signal on some pins
> > that aren't powered yet. I'm not sure that's all that much easier to do
> > with these sorts of devm APIs, but if it is then I'm concerned.
>
> You will very quickly see drivers doing this (either directly or
> indirectly):
>
> probe()
> {
>         devm_clk_get_enabled();
>         devm_regulator_get_enable();
> }

And how is it devm specific? If the author puts the same without devm
the ordering would be wrong, correct? devm allows us to focus on
ordering in a *single* place, which is a win. You seem to be proposing
to make a high burden on a driver's author to focus on ordering in the
*three* places. I disagree with that. Yet the driver author has to
understand many issues with any tool they use. So the root cause of
your whining is rather on the edge of documentation and education.
(Yes, I have heard about issues with object lifetime in v4l2
subdevices regarding to devm, but it seems irrelevant to devm
mechanism itself.)

> Without a devres-based get+enable API drivers can get the resources they
> need in any order, possibly moving some of those resource acquisition
> operations to different functions, and then have a clear block of code
> that enables the resources in the right order. These devres helpers give
> a false sense of security to driver authors and they will end up
> introducing problems, the same way that devm_kzalloc() makes it
> outrageously easy to crash the kernel by disconnecting a device that is
> in use.



-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
