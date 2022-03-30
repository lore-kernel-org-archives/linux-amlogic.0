Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA43C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFqzma3m08aB7XRIT4sc1ybm9vKu3wrqPIaA8Cxyr+o=; b=lZ7A1dwcNSgNwo
	hUXeX3pnOALEW4cZH4G3nNuvhjIMwxu0ftndwvhgmsaUI1U/C8inBf1J/P8yqdDQ4sdGCMNDze3OB
	C1ul2270fCC84F7eGhPBr83mMsOpHPef8WxLsQteJBjP6gUXc4ke0XELbfTCEqlRmlj1srpughHs9
	Yqfg8iR995NeobMTxrQQJglkjQfKkFxPObo6f7C6roXjL8R8WBOjoiDIk2BPA+sn+NltOddNDR185
	boZtYyElKVvq5tOhYKU7NSRVf2lp/anKRpt+eWhawXN5A7KghD77fR7vE+ECsmAaINSoG47TsQHQx
	Nx7KBajiiYRxZaYQ5jXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZU6n-00Et9M-Vt; Wed, 30 Mar 2022 08:55:17 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZU6b-00Et7U-Hp; Wed, 30 Mar 2022 08:55:06 +0000
Received: by mail-qt1-f170.google.com with SMTP id b18so17470302qtk.13;
 Wed, 30 Mar 2022 01:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TjfE/nqlbc8hvQ5iunfZ0y6JZjtbfEsmjFPKu69VzU=;
 b=aqGrn/yJrMrvQixSFQo/Y6HLila/WPPRMg6C14gAj6z9Jk0XMkIgqXFrl41QkKvvAl
 zSQ+jCjPUBY0hzu3fEHfOunb45b5upolPAy1POPCWSBh3T4eZaU1Kw/ace4jHJ//FLZc
 3rCDFOrPvvZ5mZsGF63kl3B86alQq7CxOiUJ8LFMgocVlg1CSllE3EAbXnrcE8mawRLX
 QNRxfnCgTl8iJmFJYO4qN5X8lmLZhPes3K3JnEkRIuZY1whmOD83SMIQvWaz2bWiArgg
 0xZ4L++XGYxRByomqR7tLZDjcncHAyi3jD1lftaPi1IBu+cENknZF5yfQDDH2okSWQuB
 d4Vw==
X-Gm-Message-State: AOAM530KvzbHHuqr0avh6Z+dAw3oLYorXh66q48jH1P2zs7ijko6zFdr
 bfa3UFTuQu2wgnmOUaD+aeRl5njX5EqjNw==
X-Google-Smtp-Source: ABdhPJyPoLPXG4FgLpv9JTFUBHkf4R5e6d0WQseoPBHEZR2I4dcukCTkTALH/xsktYwEqqtrA+3O6A==
X-Received: by 2002:ac8:7c54:0:b0:2e1:d4b6:b991 with SMTP id
 o20-20020ac87c54000000b002e1d4b6b991mr31947219qtv.134.1648630503108; 
 Wed, 30 Mar 2022 01:55:03 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 e7-20020ac85987000000b002e1b7fa2201sm16677832qte.56.2022.03.30.01.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:55:01 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2e5827a76f4so210294437b3.6; 
 Wed, 30 Mar 2022 01:55:01 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr34737611ywi.449.1648630500868; Wed, 30
 Mar 2022 01:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
In-Reply-To: <YkM22GwhxV+YKl8l@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 10:54:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
Message-ID: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Qianggui Song <qianggui.song@amlogic.com>, 
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
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
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
X-CRM114-CacheID: sfid-20220330_015505_618126_93EB0386 
X-CRM114-Status: GOOD (  19.98  )
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

On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
> > On 29/03/2022 17:29, Andy Shevchenko wrote:
> > > Rename REG_* to * as a prerequisite for enabling COMPILE_TEST.
> >
> > What error do you hit ?
>
> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
> 9 | #define REG_OUT "a"
>   |                 ^~~

Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
renamed instead, as this is a generic header file that can be included
anywhere, while the REG_{OUT,IN} definitions are only used locally,
in the header file?

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
