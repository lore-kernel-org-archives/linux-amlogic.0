Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83178C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 14:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE1F20639
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 14:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpxtUJ7N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIEIT1BC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE1F20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3dgp9Xsev0pd68w7zcLcs5BD+IAfn2hoUx8rwCJeIHY=; b=rpxtUJ7NOKkc1T4rt/X/sWnF/
	fZD2RtpdN/pA+oyZPsbVsdEV5Aa7VANVf7qK13kGwIpa9f4Mmj8nNdVJPM0k51w8MruOPf1QBu0oK
	D+qF+qWsj6RTbyzRwiDXgKKbdYQj6fwmtkKt0C+XzUOqad6EvvOXEk8uEh+nF1GHQkLinfEVGv9r4
	MmamU7urbFVWOaey/q+4Xh6P4Kq4Ny7rOFQ0VwPoMbqgcIreJo+pXdYohB6UViPaz0ZqZHPxlFLMI
	sZ9FpW7+IBha9g+H5qCydmKp1VD/jJWixwx3LBQFDQkQLZBFGqEakqNayJNxnqbg7Ke8VH1tfAfJ4
	Ke7QrHMrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBfOT-0001pI-Ln; Fri, 28 Aug 2020 14:30:17 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBfOQ-0001oU-QY; Fri, 28 Aug 2020 14:30:15 +0000
Received: by mail-io1-xd43.google.com with SMTP id l8so1425942ios.2;
 Fri, 28 Aug 2020 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIurT9NnRMICNXs1unTV39g8GKqfYQZhBJKD6PuXkBQ=;
 b=kIEIT1BCstEYEHMwMC4RZZV+EDytYneUK+PJfUj0poGcIHIZHweoj7tdraNnwSvNj6
 Z04fw9gM8wo5UmjdBdCgBKDj6CpGZNLsanoklyg4Db3aT657yfHgvxDteFIkjoHiEvCl
 NjAfv2TDab+Frw3dly6dr43QItQdgjyzdFESNfhJ3zwMVHQ3RVFjidUrheYZt9TGArfR
 wRByYHtiOJlD0UHr6rgfbukN7AlIJpb2Dsr+JCfjTGCYOh//2xicddGxeL+ryANiL/dd
 YU7FM0Eew8M0aI7z/Aa5ARMAMez0Iun4t/KH37lDvcf0upO004UUhQsOAnxtYpq9b+CG
 HUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIurT9NnRMICNXs1unTV39g8GKqfYQZhBJKD6PuXkBQ=;
 b=hPNRspcU8ibzhgaO75/XcB9hKrQ1TVfd/76Tie/RfFIsXB6htR6eYeHKm6mhrE5D+E
 9gXQ93FG45cEIPkuvjDayDfruA/IG7jUqkYE2jvwSCSMYua4lndHiCQhchvnkCmmkADM
 qPZiiHpMQiORmOGDmoPBA8xgyXO6G0WRSkS49+R0eDFMK4UJYrU1xRbfNXlqIpXFN2+Y
 M2UWFtudQE5os6lj8rOmvjKh4b4k0t/+UVy/GXZOt88UL7O98CH1KN0Dvbke3TWHbIEZ
 MPfoaR01cwYymTrcbzhy30mKAeubzxZplPpJXpsxmNDThqhWA2jG5GGwnWD7EYK8hDZs
 Kx1Q==
X-Gm-Message-State: AOAM532PqicuV9r4Iet3m1zypuuT1PDs1pdUpmKYX8otpr8LpW/oZtJr
 nGsKIJfcrn34IQ7VFmDwVklerWZ7dEGxq3Y4zFlx9EsZpEY=
X-Google-Smtp-Source: ABdhPJzuT2eph4LucKaa7svK138E8jC2IC4brqlxG2Y/KFo0tvGHyV/Ij30PdVjqFx3uU4yjILA80JrJf9IdXdC/FEU=
X-Received: by 2002:a02:730b:: with SMTP id y11mr1441273jab.126.1598625011513; 
 Fri, 28 Aug 2020 07:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
In-Reply-To: <c33df0ebe8be16b56741ce7f873221ab9087a0a6.1598564619.git.stefan@agner.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 28 Aug 2020 20:00:00 +0530
Message-ID: <CANAwSgT1bQh+vhzYxygTkN7NP5zq-2jaspvvTfjx3rWxZ07hGw@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: g12a: mark fclk_div2 as critical
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_103014_907639_999632BC 
X-CRM114-Status: GOOD (  23.31  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stefan,

On Fri, 28 Aug 2020 at 03:14, Stefan Agner <stefan@agner.ch> wrote:
>
> On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
> seems to be necessary for the system to operate correctly as well.
>
> Typically, the clock also gets chosen by the eMMC peripheral. This
> probably masked the problem so far. However, when booting from a SD
> card the clock seems to get disabled which leads to a system freeze.
>
> Let's mark this clock as critical, fixing boot from SD card on G12b
> platforms.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Thank you for this patch. I reported this a long time ago but could
not solve it.
Please add my
Tested-by: Anand Moon <linux.amoon@gmail.com>



>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index fad616cac01e..2214b974f748 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>                         &g12a_fclk_div2_div.hw
>                 },
>                 .num_parents = 1,
> +               .flags = CLK_IS_CRITICAL,
>         },
>  };
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
