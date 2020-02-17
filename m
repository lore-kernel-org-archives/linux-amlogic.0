Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF760C7619D
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:52:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E50620725
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFhXXdtC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FykBzbYJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E50620725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3POIjTqq8Z3JeunIYQHqNPuDr4/ODK5wh0sHMb2OnQ=; b=qFhXXdtCbVQCwd
	Ea9pjqxxHa5A9gQnWaFZXwy7zR/npLmTjW1XpUgpjkpPAi+NMvwWczH5oLWypI34APOSdJ/3Iiq8W
	r/JjY874SxBvcYVkamDEK1usuNJSkusPhigr7z9JO2I60tmkdQzHqvw2sLxOByE59M7d/9QruVmXF
	aWHXgyvkBpl2XOvUYCT3mXrxGze1sPjyG3fUvGI2b8LQcBYcT5BhBqujcoPvyBEos6uEWcrBkLPOC
	bVIJFMGu+8xXV4PD+EL4FzK3wso5fBbm6Ac4HEueuHrh/05xUVC9Ap3vxPaKg9sKpsPSS1RoGd6jm
	cba5gavSO9zQgWYlUg6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3c88-0005wg-Fb; Mon, 17 Feb 2020 08:51:52 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3c7y-0005Zq-5X; Mon, 17 Feb 2020 08:51:44 +0000
Received: by mail-io1-xd44.google.com with SMTP id z16so17558911iod.11;
 Mon, 17 Feb 2020 00:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHHGohWk9p+/nxk2GPpS7E9E1pqxMJMjyjsNhyVbaiU=;
 b=FykBzbYJMaN5c0YR2MF11eN63iW/0xfMqkMCO+S5HgLkR7Obiw/ot8yvZ0h49GIxZL
 S2+l6ayaFj2+5LRym2fXDwxpcqjaElQsUS/UwVeCnhxxXm8EUvPBt6YOb/PtxvOtG0Ny
 kD0XSHCBlYjcdIV+RbJcHbc6cEEgyGr/F4IZxKK1SNSk0PaWVCtgUP+EUXvPSgFYlTnC
 Zj30ph73zv2TbaGG1B2sygm90a1s0C5lJlJoNhibYSHoPJSkbE0Xi9OGa13S6xfzY87b
 HUOk4REAF/Nrz6QKXPhgktczj9FXPVYlo+bSXu/p3aohZPrYogUJznmim5SX21H6LjMm
 kn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHHGohWk9p+/nxk2GPpS7E9E1pqxMJMjyjsNhyVbaiU=;
 b=Kq4YbALh0YUHzzSCNFihpvHOcn+k74et+FTvXnNYqslIb1fC4ccO0ET7tM2j1RWqx7
 /yOoHNNMn955vWRW24StV3sy9Pm7Hre8x8RDNwqssGAKSwZ67lNHS5sd7YUuU6rPAFUR
 1ib7qMGEFYoSP2i6ep+8u2YamHV53B2MVhUJCdZJUOBYzOVSCkIMgZiuHm0IJ79dXKj6
 8mrGTgzWR0gSQNK3SjAyD2AxGGYXxZAEU6/SrSK2CWO2OX3KkSGIpendVidMONVgBY1G
 ey85rt9Ke+ckv8IarlOtqFiUdPo+aWqjhtja0AIvVK5OugyAUWXZa/O40wJsBiRgbfyV
 H1cQ==
X-Gm-Message-State: APjAAAVzBZG22Z+ZSL/39Q7RYZ8GHOsGAAjFhs/1nql611RabnmY2FYN
 X2NKPu4QbLlUBGf4N7Mw4Kv4ol2zHYL9in+VefI=
X-Google-Smtp-Source: APXvYqy5Ao2fzvMvprdx/tvfqqCXbZoPO8C3N/gOUkzZph4zPWsllY1/gyAqJmaFDd+k4b6XjT7ZZp9Nv1LrIGgjhzQ=
X-Received: by 2002:a5e:aa18:: with SMTP id s24mr10775126ioe.221.1581929499729; 
 Mon, 17 Feb 2020 00:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20200216173446.1823-1-linux.amoon@gmail.com>
 <20200216173446.1823-4-linux.amoon@gmail.com>
 <1jmu9hzlo2.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmu9hzlo2.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 17 Feb 2020 14:21:29 +0530
Message-ID: <CANAwSgRurj6Mfkqq6OfW_ZORCj_UhQN24kx-tj+sUWfuqn_uoQ@mail.gmail.com>
Subject: Re: [PATCHv1 3/3] clk: meson: g12a: set cpu clock divider flags too
 CLK_IS_CRITICAL
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_005142_211527_1AF1ACF5 
X-CRM114-Status: GOOD (  23.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

Thanks for your review comments.

On Mon, 17 Feb 2020 at 13:32, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 16 Feb 2020 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Odroid N2 would fail to boot using microSD unless we set
> > cpu freq clk divider flags to CLK_IS_CRITICAL to avoid stalling of
> > cpu when booting, most likely because of PWM module linked to
>
> Where did you see a PWM ?
>
> > the CPU for DVFS is getting disabled in between the late_init call,
>
> between the late_init call and what ?
>
> > so gaiting the clock source shuts down the power to the codes.
>
> what code ?
>
> > Setting clk divider flags to CLK_IS_CRITICAL help resolve the issue.
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >
> > Following Neil's suggestion, I have prepared this patch.
> > https://patchwork.kernel.org/patch/11177441/#22964889
> > ---
> >  drivers/clk/meson/g12a.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index d2760a021301..accae3695fe5 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -283,6 +283,7 @@ static struct clk_fixed_factor g12a_fclk_div2_div = {
> >               .ops = &clk_fixed_factor_ops,
> >               .parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
> >               .num_parents = 1,
> > +             .flags = CLK_IS_CRITICAL,
>
> This makes no sense for because:
> * This clock cannot gate and none of its parents can either. IOW, the
> output of this clock is never disabled.
> * I cannot guess the relation between fdiv2 and the commit description
>
> >       },
> >  };
> >
> > @@ -681,7 +682,7 @@ static struct clk_regmap g12b_cpub_clk = {
> >                       &g12a_sys_pll.hw
> >               },
> >               .num_parents = 2,
> > -             .flags = CLK_SET_RATE_PARENT,
> > +             .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>
> Why not. Neil what do you think of this ?
> If nothing is claiming this clock and enabling it then I suppose it
> could make sense.
>
>
> >       },
> >  };
>

Sorry for the noise, I should not have send this patch in first place.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
