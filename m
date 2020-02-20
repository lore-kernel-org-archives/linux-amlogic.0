Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79680C11D05
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 14:48:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DDB1207FD
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 14:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GmxuI++Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqqtgYfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DDB1207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1YBX29c/m3Iv6sm8g30VjLB8mbL8o5y+IILXJnALJU=; b=GmxuI++Y94rySO
	T1AeWXosQsnipfxuLM31z8awAqRGifDUmkyKs1sF8NWo4TiE3pBP7szUzPjYIyliv4TXX0UCma3Hl
	u3lqqVlNXcJeA8DtPmEH8OLUAeo/eciA8PUbEqtaRtJNHmA6SJAgdFuyYM4c7NPUB/jkKiInhycSI
	o4pEcaKMnM1n7Up0gF61tXKhKG71byrgOEZnNS6HlVc4/1PYqUUX1f4h6+wxKRiLXybU+udkw7Enn
	Mc/LCpAxhiOOJBBvvNRQeuJ1/gNA8ijvQR6HNYujzYjjHZjORsm+LNUodPmO6mAPbZi7rs18sKZSq
	sTKewtq5FYuDukNLRB7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4n8B-0006iZ-Dt; Thu, 20 Feb 2020 14:48:47 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4n88-0006gf-7n
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 14:48:46 +0000
Received: by mail-lj1-x244.google.com with SMTP id x14so4471851ljd.13
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 06:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VFsELfj9kJG75Pqbvz1ocn9qZImBer1nJRUwC4Q7bZY=;
 b=MqqtgYfSSn3FHYbEg13WQb6BWeq4sbtryqg6cZPsn20u3rxkq6YEFBDAKvqJIFORbm
 M1po1MNlQg90SORMlvuRTXHTALEgnixnZsrP1s5lpXbugJqoEfSx8o58UyRkAkmMVOJp
 x+L3zNQohho2+EaJBd3pH+v8U8eiBJ1NTeZ6h9zMcQVEmoCiIdBjGjNBO8Pz95ppvPQ6
 2tvTxNVaFFK5eyU6Onxv+Ad+n9MLSmCgPJ0u1C4VA1ZLT5alsQXwfPHcF+esY0xcjqP0
 eTgvVT9GXk3/30zrL57T+5kp/4Np5rJTR2vAbph1f77RDtWaR3Oncv7yRHXuVt2MPSVY
 oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFsELfj9kJG75Pqbvz1ocn9qZImBer1nJRUwC4Q7bZY=;
 b=QMTIWAU0U0HKIiOEXUxk0T42+/cYnHAaVPGnU8UHinXX0x18FjPGdLpkR3N4X4JAtq
 U5ttJ5XA4m1dw0IBvJ5ui+S4myS2JYFPtJ6k7t+9XSa96di2nCsW6xDsLuibAxUwlAhS
 x5Gngd5DXsz1MBDb2TqlawWXk8GicrZOJ5Aa7OQJ0nXVOofAI6Uk5ebCcqdLQvG+qn8k
 FaBqaZ4x7CJm5QzhlGMiO7SatLdeUaNnAWcPaZQ+XGMmu+PnKC3q0WFfSii/Q6Qxtiv/
 lgMcif8aN42oI6NUkXU2j0O0KyQ9Mcrq7ucRsw8lMyoFSVzIWQ25B3vZeEKE120fipDW
 XnLw==
X-Gm-Message-State: APjAAAV/BvvAXywEHrb1l+OEFOKXSoNShYka9mqJQMNXcukuy+C69wpO
 pubrMVYcrLwFtp35oDN4Zpl8GGkmbco30uEI/HsSnw==
X-Google-Smtp-Source: APXvYqzC9uvcXVQUMEqfFBmLgRYjVN2yaUx+FWOP5lrFQgxOH/VrI5JSlJHy+5NkZQj0tvezfPvYss2NMoiD7aj8evk=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr18661030ljg.168.1582210121456; 
 Thu, 20 Feb 2020 06:48:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <109d17402bc75ed186a2e151dfda1edf05463b5a.1581478324.git.afzal.mohd.ma@gmail.com>
In-Reply-To: <109d17402bc75ed186a2e151dfda1edf05463b5a.1581478324.git.afzal.mohd.ma@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Feb 2020 15:48:30 +0100
Message-ID: <CACRpkda-k26bWR9EJMMPDz0S4xy3QW_+uABdmPRbaKPD0b4qfA@mail.gmail.com>
Subject: Re: [PATCH 16/18] clocksource: Replace setup_irq() by request_irq()
To: afzal mohammed <afzal.mohd.ma@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_064844_329839_F275588D 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Allison Randal <allison@lohutok.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Enrico Weigelt <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2020 at 9:05 AM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:

> request_irq() is preferred over setup_irq(). Existing callers of
> setup_irq() reached mostly via 'init_IRQ()' & 'time_init()', while
> memory allocators are ready by 'mm_init()'.
>
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
>
> Hence replace setup_irq() by request_irq().
>
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().
>
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

This makes the kernel a better place.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
