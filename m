Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE975C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kX+hlq/s//UknFPDPt78uqXADM2uvpRrk9UTaHrj4Xg=; b=jnuvfMkOp8E+X1
	x7Uv84IVnCb/HWVK/5WU9NF1stoh3krYaH2tTVSurSniHVeP9/XE/o4lp0wZH44iOPK6i7BC40q1K
	aM99lvDBpBbNLBp9WKWnl7nsQloCvjnLpWIuN2GbA9VvvLxLWE8OL5h5f1oZ/2NTPFCnuGQiReIL8
	M4w/41eqlxYDEMCijss37+Zp99/HO7rZj01Gnkp6qJHp/YnSWSJe2IEYQ1yO1dBgctkf4c2y3VKW0
	vvS5ZPdUZSHhBn1B5Pv9SbKrDBI38QQcG5IoiTZMl3w4c6IwhcPh0qWgJWE2rs/AMquHYtqndke7x
	eiXJk/5x8oSxnkzIfEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZV6v-00F5mS-Fv; Wed, 30 Mar 2022 09:59:29 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZV6i-00F5jf-UF; Wed, 30 Mar 2022 09:59:18 +0000
Received: by mail-oi1-f175.google.com with SMTP id k10so21597353oia.0;
 Wed, 30 Mar 2022 02:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6Qd1JdMt3NwzWK7NAVAPGEjLMWhB8qclJNlYrQ8idw=;
 b=fEFha08VuYE5YxSJqEqvr1xC3nitXDYSM+b3bfW9m86d2bw1XS9bpaSvU7FTiSIThr
 e16C1JZ6TL8yuQMsRlhoMk/Yt6jk/IMvPIxnNTRb14Sov/GR2y+m7yvgN02jggf0HO4B
 X7ixYzndZB1vTm/BjQqiKXSpnCoxJSQGAjDTTG9Tlc01PJlJh6B1/af/OaTsaYi5CMmP
 jvIJtULRb9xYVKl+8SFsMLaKNVEhklvL/W3mbyHYH4/+Q3bpP1parO0OtnvAAP8L0Grs
 EX/P3NTZ/kKeJocUFGnWYfQA+H+zT7ztg2k0RHym65xy+dm4QJpuj+5k8exbBBPw/pbM
 zvHg==
X-Gm-Message-State: AOAM533ik6d1IxNV17sxA4Zz9eJ2jMBTF+v2uiylTLGP8v5uDBTSO19i
 +n9MYnB+d35f6OJsw8IiZP8nuJViUc/GHw==
X-Google-Smtp-Source: ABdhPJygdjlIpNZUKYf+EFd2YrmTP+u5/vZub/R49rsfjui3kvxvzQateboSVgRV0qbcIghIYj1oEg==
X-Received: by 2002:a05:6808:2ce:b0:2f7:2327:5205 with SMTP id
 a14-20020a05680802ce00b002f723275205mr1472577oid.289.1648634355246; 
 Wed, 30 Mar 2022 02:59:15 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com.
 [209.85.161.47]) by smtp.gmail.com with ESMTPSA id
 g25-20020a9d6b19000000b005cdb017ddcfsm10008221otp.41.2022.03.30.02.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:59:15 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so3516719oof.12; 
 Wed, 30 Mar 2022 02:59:15 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr34863152ywi.449.1648633890723; Wed, 30
 Mar 2022 02:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 11:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSBh7Tnf5pnCfzf7=h5sttX2qH5j4kOkvvcuCMydmeYw@mail.gmail.com>
Message-ID: <CAMuHMdVSBh7Tnf5pnCfzf7=h5sttX2qH5j4kOkvvcuCMydmeYw@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: renesas: rza1: Replace custom code by
 gpiochip_node_count() call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_025916_986728_D11A8E82 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since we have generic function to count GPIO controller nodes
> under a given device, there is no need to open code it. Replace
> custom code by gpiochip_node_count() call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
