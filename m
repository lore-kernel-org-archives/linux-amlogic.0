Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8476F3092A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wy5RgwQe3YO0SZRaPZNdAdZpHWM8ukRTTXSI2L3u/M=; b=0/J999CmdB8n8e
	Bls/aDTiTO0oP+cFaksEAqY2cO9osvVcc8T9IrX9FHCoNDMlz4VRDPUG3yyEfqV6LANRsnsh3AFrE
	+z2yl3+yC0tzCpCPntT/uiEsyNFFvzoh+XsYScW1Tm0Fu3OXitpf2o4zXoMGu+kn2SS2w+syxgWgP
	spNPBEfGRXPB1JZtPxVbH7UZ8RwX7h+LDb5pMyTZe7naTPTM2P1CmEVf1C19IfgR7dwgc0954CXmY
	KewU9zYRJMm3g0CFnk4vr7c6DiY7TpB+UzRRcozN78IUqzBn1mG0f2bFztyuA40qo4Wk9i5EU+/lN
	EWxbg8b/NFb1dWdi/1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy60K-00000001aED-0y0v;
	Thu, 05 Mar 2026 10:32:28 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy60H-00000001aDr-2hUS
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 10:32:26 +0000
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a7bbe9d0so57060861cf.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 02:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706744; x=1773311544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=;
        b=NmGYNUcN0KMzPXANGkOnveTWkmAyB9p415l+UyqE+ATpqzYUMaK+E3TRFSxZNyyjQ2
         WWkkifIw1VOqRrQ3xdTpWg3mBA3ihXfxnCQT95zm/+MMV7h+x6gX4qO7t3FPSGqzui4R
         0UD9u5Q51qrkTUF1FtgjnMzgD5GmN/EnkaE5fPRvXjf1HImkGRVxP3ipVVpfMx+xR1ip
         zy/DhAfsgkAPqMM7dZ0BwAmTis4WOVb4CwS9iHUn/aTMKJyEM3fNQIoQuwbDna0YUi8t
         m9x1isuOeAlKG6ExdX1aqgW22tmc+qZjSozWLMKRugdR7bYPWo4M1jLiINwKcaqPdAbn
         cVog==
X-Forwarded-Encrypted: i=1; AJvYcCWN/y9l49WLJ95onkDJWJCXuCSKezRaYqZGmv0bLMwacFMjf0wMltNBXl3VIDuL/UlvLKSV+WIRv9EJo70r@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn9bKaOP/TY5pWl3Og9nhfgsB67Ot3sfClSpko74n0zkqPo1UB
	LFj5variD3GHTPyOHPiTEjy3JFYcsFQ2hWsjL+pRxgu2+S4Z2YBsY1AWGdvNVJVr
X-Gm-Gg: ATEYQzy9FnE7bII28DzmgiPCeei9IlLmTOrBW+yZtMKxscrKwatHJpPEMPYM4QLsCS8
	Ou3iHoPpalzh6FQYgH37nrASw1+Sy2nz/bzqvvmcHASl5zMlagYJr/7IuLlTZRwAch2cma8SACE
	QeZdGbxdYWQkX9H88Nziuf+RHANV9IvIr1oS4DFRKqr9/dPjbX9SQUCY08d3Weo0uAfMyBgrolC
	zEqdHfas8UxYp0Unj2ey3Xv8j4dRRKs2Dw1dEq+lvsMfBfsqd5fwpxwfUlylFeQnXtT9ZoNxx/Y
	82XIBdwuFfJ5ITxqeX5Yj/c6IzJQzeLu1zQcpH74UoVYr6wrQ8XEKKivCYLro9zNvR6EZl/XwbU
	nH/H2Tbt90jXCiyjGTcQZs+P7isaJPI/m/URXrCU5/A6VHyff8upGRM6jsw9hGv1qwljgKwEEMv
	2Qt6pyeTTgrDAStsmWd/qUTvVd7ZIPCMFN9gSqCWeqKwvLB1/KCQVcprAOXRiy8IZCdJ7YU46W/
	po=
X-Received: by 2002:a05:622a:178a:b0:4f1:e8ee:a56d with SMTP id d75a77b69052e-508db34a37dmr69564141cf.38.1772706744186;
        Thu, 05 Mar 2026 02:32:24 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d88sm185399681cf.21.2026.03.05.02.32.23
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:32:23 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5069df1d711so68115711cf.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 02:32:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULxAqtw3GViDMsp2hmYcVIMsjGFVZ2XrHWgDfn7WQNkI+jaU11ZZeycf9w659lYEE70gt2l8nDqPca6vkp@lists.infradead.org
X-Received: by 2002:a05:6102:3ed5:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffab240223mr2483807137.40.1772706274492; Thu, 05 Mar 2026
 02:24:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772644406.git.geert+renesas@glider.be> <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
 <86v7fa7fdq.wl-maz@kernel.org>
In-Reply-To: <86v7fa7fdq.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 11:24:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
X-Gm-Features: AaiRm50s5nNMGcrhF9lpYz1D5nEmYHga723M3h1qHVdFckZiw7-IBT_v4J6wsk0
Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_023225_703550_BD161847 
X-CRM114-Status: GOOD (  30.04  )
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

Hi Marc,

On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 17:21:58 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Replace magic numbers by symbolic DT binding definitions.  This improves
> > readability, and makes it easier to find where the various GIC
> > interrupts types are handled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -35,6 +35,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/virt.h>
> >
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> >  #include "irq-gic-common.h"
> >
> >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >                       return -EINVAL;
> >
> >               switch (fwspec->param[0]) {
> > -             case 0:                 /* SPI */
> > +             case GIC_SPI:
>
> I'd rather not do that. I use *numeric* values on purpose, because
> that's what the DT *binding* describes, and I have no control over
> what lives in that include file (it gets changed without me being even
> Cc'd).
>
> So I want to stick to the binding, and not to the interpretation of
> it. If you want symbolic values to be used, describe them in the
> binding, have a tool to generate the values from the binding, and use
> that everywhere.

This sounds more like a philosophical debate, so I'd like to defer
to the DT maintainers...

About you not being notified: that can be fixed easily ;-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
 F:     drivers/irqchip/irq-gic*.[ch]
 F:     include/linux/irqchip/arm-gic*.h
 F:     include/linux/irqchip/arm-vgic-info.h
+F:     include/dt-bindings/interrupt-controller/arm-gic.h

 ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
 M:     Lorenzo Pieralisi <lpieralisi@kernel.org>

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
