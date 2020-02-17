Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A84CC7619B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573E120726
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6dY2UsE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dqjt/y5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573E120726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=phkgmm9E8tYOAMiPFk2+UH/qG28KkPjpDASbiync9II=; b=S6dY2UsEifC9Nqvzmbiu6QO7f9
	FcLh6vpwxUytaROMR78WAhIxPdnYgLPHT1qJYvwR9cSJPeOu4HKbdxdHXilvC/GtUElfZZ4d8jM4O
	Z8mOEWrpJbb64jg85iihX/gG6ro+vZsKUr4PRixWNbHLXPQljg52Nu1yT09/CGG8VfCwShqpNqrZe
	Xbvkc6S9/qcsrYVV6nHpycGXvTJuB6Kz9zFAVz17WXgEya/8gnEEVmrgZZceLbFZA4tGwmHxD7EQo
	wNm6NgsnckjEMutv0KAy8kQKd+Bp4m0VV83FFsWzksh/XID9oe+5Ry4NIPRUY6mY+3vtLmSrcllu9
	1ZzzhTuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bMK-0004yG-9j; Mon, 17 Feb 2020 08:02:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bMG-0004x0-Uk
 for linux-amlogic@lists.infradead.org; Mon, 17 Feb 2020 08:02:26 +0000
Received: by mail-wm1-x341.google.com with SMTP id t23so16094431wmi.1
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Feb 2020 00:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=l3DKox+qqztb4asvNOVtIBlg1suTqH8KA57WcRUyDeo=;
 b=Dqjt/y5qO0gWAFA+/BwiQiNhQnAs5jTW/fatxUCIn40u9KvZm+xZrPas0dS2viq7bb
 jgSlXwD9Suu+XUxmUNuKB+d41jrMD77xnjTrLbSIqa4rpt4hTuG1Vg6Z4PZf7vfR1y6M
 PZ7Bpfk3t0Ys/yTJcz2WswnxPbn+B1ZTgALvyA457dZ3sb0WFxc3i2SkN30NVfhEsrKn
 yjwGuobhZJuIsBjIXOX9C/RFy5ppYs4HMjiUY1y0tl983Am6BGddtiyrE5ozmCY/CSRh
 f8d7UZvXyRjgawetaECG7ERoPthoDmHd7MBqGqypHgUVhTfvROhg73+BQ+lZcKll+QrN
 JRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=l3DKox+qqztb4asvNOVtIBlg1suTqH8KA57WcRUyDeo=;
 b=rYcJPFAleF8oahLRgoJK+L0cJ/aZ6LU22z90k9dn9WnWcAhgmkWsGJ87KqevxTUQCQ
 iBUGkAc63p6VxLdoOlqdahGi+9v70WSm5ahVqnGEzNDIZXKYtM+bkBZ8cyNmNU5lBeHd
 D7V8VJuPJ+pG4qHE8Jo7jFo0ee2cV+XUWy3MLwUYpUVnA75d/bhiRz+VLPRHHcDeBmM3
 Hjj3znuXJaqAfu0x5pXgkW2QXgENLyh1FwBRRqCbYNc+VWAGiGaMsKOO7eLCzTXnTGtg
 z2jqFS0yhS0GDpyAhjK3JkTPPAxjTOuDqDVXbCoC5koG2Gsa3UMUQ5sQELkznhYSlmwS
 fobA==
X-Gm-Message-State: APjAAAWDAK0cTdF4P4e3+P28p8KuI9/uvK95AlTD2NTqEt8WmA5kMAtM
 OES8L9/ofwRlI1ZVFfUjcX19qg==
X-Google-Smtp-Source: APXvYqx9LI03PNOr2Q02TPi4B2aVKc1GmmsYFLd4WBERnUA2AA8pCg4ZZaiDAl6iYjkK/uI2Jjh6JA==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr21757452wmf.189.1581926543185; 
 Mon, 17 Feb 2020 00:02:23 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f11sm18834522wml.3.2020.02.17.00.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 00:02:22 -0800 (PST)
References: <20200216173446.1823-1-linux.amoon@gmail.com>
 <20200216173446.1823-4-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv1 3/3] clk: meson: g12a: set cpu clock divider flags too
 CLK_IS_CRITICAL
In-reply-to: <20200216173446.1823-4-linux.amoon@gmail.com>
Date: Mon, 17 Feb 2020 09:02:21 +0100
Message-ID: <1jmu9hzlo2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_000224_989599_9F4F4C13 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 16 Feb 2020 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:

> Odroid N2 would fail to boot using microSD unless we set
> cpu freq clk divider flags to CLK_IS_CRITICAL to avoid stalling of
> cpu when booting, most likely because of PWM module linked to

Where did you see a PWM ?

> the CPU for DVFS is getting disabled in between the late_init call,

between the late_init call and what ?

> so gaiting the clock source shuts down the power to the codes.

what code ?

> Setting clk divider flags to CLK_IS_CRITICAL help resolve the issue.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>
> Following Neil's suggestion, I have prepared this patch.
> https://patchwork.kernel.org/patch/11177441/#22964889
> ---
>  drivers/clk/meson/g12a.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d2760a021301..accae3695fe5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -283,6 +283,7 @@ static struct clk_fixed_factor g12a_fclk_div2_div = {
>  		.ops = &clk_fixed_factor_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
>  		.num_parents = 1,
> +		.flags = CLK_IS_CRITICAL,

This makes no sense for because:
* This clock cannot gate and none of its parents can either. IOW, the
output of this clock is never disabled.
* I cannot guess the relation between fdiv2 and the commit description

>  	},
>  };
>  
> @@ -681,7 +682,7 @@ static struct clk_regmap g12b_cpub_clk = {
>  			&g12a_sys_pll.hw
>  		},
>  		.num_parents = 2,
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Why not. Neil what do you think of this ?
If nothing is claiming this clock and enabling it then I suppose it
could make sense.


>  	},
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
