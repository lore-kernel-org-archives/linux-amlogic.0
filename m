Return-Path: <SRS0=gyfY=5M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710B3C43331
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 10:25:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4377F20714
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 10:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCFwmz+i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5D4YyM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4377F20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97axBbkJ9ri9fsBj0bF+yPdoQ0eOmzSkxWdskJ9820o=; b=cCFwmz+i2XfvfB
	XikZmz7KzmGSHi3poxLDjdJ7jY3yox6NeVDmjxrIZHl1R2JgE/7kyHvOY0HSaBoaaF1fNAzHsoNoj
	n7xHt/yUi7mjukwdFY+s7wB8id5d2lAiG6Sc4oRmxc9COhEpj4BkDZn0c0HnnzDzyOWXS6n5rKXrv
	FM3fUOXJmCrOtIv01zCGQo1FMFMy+/X3s73RHqqUq2TFyraEbBHngRzRoYApmjnmRYwHybmgVlWmw
	CdFvIjUDdtwM+Kb1fQYNpzOS6QaksiufLcQSgOcs+xtARgfngoZKCHJuBDtzBmPBGhi/MqUqAmk7Z
	Z21IGKY3Tlb0sty19mEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHmAx-0002YJ-Bi; Fri, 27 Mar 2020 10:25:19 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHmAi-0001Ke-82
 for linux-amlogic@lists.infradead.org; Fri, 27 Mar 2020 10:25:07 +0000
Received: by mail-lj1-x242.google.com with SMTP id g12so9656281ljj.3
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2020 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7m4lWvk4//cGrxQhI0ltBzlijc7RgGiBhxq+4JikvIo=;
 b=g5D4YyM74lsERyxVWEtSBIzcaGgdj91X+gvlZ19U9ZMi+fX9jzIbSx241hKH+2N10n
 ziWkkfCA99BNAYxuSyr8N2yRDOb+CrAs3hUW9nWyYL+T1Zbdpimu14dpwEQ8u0ZgWorn
 jSCE336+YRKMQoWrUu2H935e/YYhgLXs9uYqKbli4hJwXxKwIoSHMeuymqJgQkpQfZRQ
 2Yv0Je3RpW5WlNLbgou34/CGii2qNfxtnKZVPdAwGRM8dmO0AwU6kRISyRfEoQQtliQ0
 PzSk/y9Z5dGPWAExpyKivHo6EP0AGCQljfldCXbcC+z3SspoLHj5TtF3Ff10dRFHFfY5
 IkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7m4lWvk4//cGrxQhI0ltBzlijc7RgGiBhxq+4JikvIo=;
 b=ZCkZU48wd+8nIIksQTrVzoxcfrym1Xw4UsZ9o2IZYXzFlzOGOsOeADBh58LZDqhv/i
 pK+1v7q5dF6sV5MMxzH6ZhV3w9pzglU/G8P6qNadG/jUluBe/HdjxqX8ZWoFmSXnELd7
 q9IsGPUvR02oHqiYjCHisojP28NozqXTjPZJ2/n2I/alec1bZoMSnC6qncPLV3LFGOjX
 dxhX5dAX4cZifIDwpbHqw88kWXtsTEX8K+nNCzuoqI7uSDELogiCCl5LlXxGyiT5yR8m
 EN36A5SDqV+gTPwa3A2zgGDT6uiqAKBP7ylywP6/woakcdjo0mRUXC95SNyuB/fVp41h
 SzuQ==
X-Gm-Message-State: AGi0PubOLjSz3EdXy68TGbTCFMrX1g/cTVPneyIZV8+rK0QgHAwHPfEO
 C8UgC55hxYUjCyGUIYO5+/j9Fe1+OxHN0hBaVFMCDw==
X-Google-Smtp-Source: APiQypLGNjy+bso8fEQU1Rr+N9WpSOr49XJcW20+rl9/F0WHi6kN5XEtnL5MgahJRdxrpJS/UNceeTWkSa9YNVg/vb8=
X-Received: by 2002:a2e:9c48:: with SMTP id t8mr2097823ljj.168.1585304702362; 
 Fri, 27 Mar 2020 03:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <e6cd8adf-60df-437a-003f-58e3403e4697@linaro.org>
 <20200318174131.20582-1-daniel.lezcano@linaro.org>
 <20200318174131.20582-10-daniel.lezcano@linaro.org>
In-Reply-To: <20200318174131.20582-10-daniel.lezcano@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Mar 2020 11:24:51 +0100
Message-ID: <CACRpkdbt2yJ4-_82ZGrkgCat+Qywyy7HFLaqremzhc1rKTp+3w@mail.gmail.com>
Subject: Re: [PATCH 10/21] clocksource: Replace setup_irq() by request_irq()
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_032504_312684_24C99273 
X-CRM114-Status: GOOD (  12.89  )
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
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..."
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Barry Song <baohua@kernel.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Enrico Weigelt <info@metux.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 6:42 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:

> From: afzal mohammed <afzal.mohd.ma@gmail.com>
>
> request_irq() is preferred over setup_irq(). The early boot setup_irq()
> invocations happen either via 'init_IRQ()' or 'time_init()', while
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
> A build error that was reported by kbuild test robot <lkp@intel.com>
> in the previous version of the patch also has been fixed.
>
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Link: https://lore.kernel.org/r/91961c77c1cf93d41523f5e1ac52043f32f97077.1582799709.git.afzal.mohd.ma@gmail.com

Acked-by: Linus Walleij <linus.walleij@linaro.org>

It is definitely the right thing to do, I cannot test it right now
but if desired I can test it on my targets later in the following
weeks.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
