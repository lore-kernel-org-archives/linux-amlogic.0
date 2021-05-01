Return-Path: <SRS0=WE2E=J4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E63C433B4
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 May 2021 20:19:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDC2613B1
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 May 2021 20:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDC2613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2gvpGwLjCD428hAWaJ3IjR8oUSczDWON2Dsb8t/Z8Xo=; b=c87hPQI28GINasXW9qVne/VxT
	rrVuSJA03C6LW/4A/WhaveWutVx6KRGJAqA4PlDe8M2kcXjxWzWAoHqvqNipTOvuxsDVbMA7nF1Me
	t5AEvsZC/01/1GcrsTMj3tVuSrhN/OTlRI6LIQ/7CWdYwhvbMTHSvbNbaUVQvaYhzAHiWChahtXUF
	8lmDxFm7i+bBnbpQ1OQvjZnPUaiY5CV7yZLW4bvtfgCrFxT9vyUh7R1YYp4X9OR6WKQg9XApOooAi
	KyeHdm/4iw1SkPD0xJ9XOZ2UF+Tx7r8UYA3j91nBJ7/Cz2c0vntGFlRHdd/B6QVn7mvxdFbXS51Q9
	m7kE+Lrdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcw5N-00AdcA-CF; Sat, 01 May 2021 20:19:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcw5J-00Adbv-7V; Sat, 01 May 2021 20:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iwRbqfsuZgS63ZFgVOdcZE7Z3XT4rd2RRq4WcdnJBfk=; b=4FGwCGVxchOduIvvic/XNBQYYo
 7CHnVA79G0g/6/x0PqfWV6wOlsydgvw8HuyDGk6yTDNBwtP9GDW1mAaLAOyAln9Yi5cvjHd052w4N
 /4Z2n0mFMlfGNDc0Q53IyI6oEHqdniLQOf2BKiD+a1R6EdFp2Cuw4Zwsxk6MDeCeWzpe8A8/hwmGM
 Z0rYo42dIEq82r48GH0RWO1XQ0/9d83Nbz59jZy5mJmegm+0eOMhKFMALMGTHB327svrjm9IqipIx
 6YXBkEOLhTqUKlRhrNOSzUABgP554ZvWvlgJEaQ83KJfUiOERsupS7mPzYi8c428DlFBYuW1R9V5P
 XbrLgrdQ==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcw5G-0028n0-4Z; Sat, 01 May 2021 20:19:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id u21so2081870ejo.13;
 Sat, 01 May 2021 13:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwRbqfsuZgS63ZFgVOdcZE7Z3XT4rd2RRq4WcdnJBfk=;
 b=flJtQEkoMweFE7j9AjOHs1k4tMN+7xl51HhELMKL7JRf99bM8XMZrzdWTIqNWj1V2B
 8wiXVD/xDO6KObfcEVGZQ1jIm1vA099b9Ad2130hw1sAwZITrEcB+NV3vdlc+LzSiSB0
 eiV9XPuY7Q/h4HpvzOmgX1RpBPWe6IaguM4vT8tWuZcr74Kx5bn0FgdxexLH30BbsVIF
 UwKByRe7qv+DXlxhqBzihlxWPdw+F/ny1CMW0F0HSwrF7apqgp3HGzmuujxSgu3dI4jd
 y4fuMCJf6rtgNr73s/wzPKvA12ZaLLzm9uQ4nx9AioeXXOeVLA4nDuB+yY3uzfhWUEzH
 9dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwRbqfsuZgS63ZFgVOdcZE7Z3XT4rd2RRq4WcdnJBfk=;
 b=dGUEApkDaMHmJGg7aIZKUs684L8ybyHWdIEkojBNQfHToK/BTpm4Dk4zz3imCj2igB
 JB1m/mDcOY3MOYx+Gs+b/AvlQpLfb6UUyxboj0+yLtSj0bKinpz4gFP0K5K9BZX8iQw1
 9l2zneqhvot1up5DL1uK7hwhnvUPy4XiMaEJP8G7CwViwWWxmq4PkbTaHzbe8sFTA9zd
 vbof9rkyqDnOcpOwFMnDXZbdqdSLtpcL4H0HgxgnQib6yiMWAGwj8einDbFxyr0Z+EY0
 UUh0xm7emav3FTqZfKi7qrxqFx2lpOv59DpSZwzk6J+obDHzwoyzmld+cc9909nOTE9B
 3x/g==
X-Gm-Message-State: AOAM531KWOdSQCvUVW599TC9MTIA6aIBrOoyOLUKW88t8eMXCi8TlN/m
 DWE57qpuCTLZlcTE3S39EyxZosqFzOE1LX/Wrkb53JGCPCc=
X-Google-Smtp-Source: ABdhPJw99VTLlaig2Q/0aFVgbswqt0kl75wjBBz/BJrxURBhkf3WEw96m3uc+tH0AgtJptSfzVjXVqTeHERqmWP8Qzk=
X-Received: by 2002:a17:906:85c1:: with SMTP id
 i1mr10240242ejy.216.1619900364422; 
 Sat, 01 May 2021 13:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210429203723.1177082-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20210429203723.1177082-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 May 2021 22:19:13 +0200
Message-ID: <CAFBinCArYQ_fHL0f4Vv3rGfSB=cHx-d=JPc4GuoZLopAVuxb8g@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: amlogic: meson-ee-pwrc: Drop the .shutdown
 callback from the driver
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, 
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_131926_225545_894B788C 
X-CRM114-Status: GOOD (  38.19  )
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

On Thu, Apr 29, 2021 at 10:37 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Stefan reports that rebooting his ODROID-N2+ (using a G12B SoC) results
> in the board hanging. His kernel config uses:
>   CONFIG_MESON_EE_PM_DOMAINS=y
>   CONFIG_DRM_MESON=m
>
> He reports that his kernel config results in the DRM driver's .shutdown
> callback to be executed after the power domain driver's .shutdown
> callback. That's problematic because meson_ee_pwrc_shutdown disables the
> clock which are used by the VPU IP. This causes the board to hang.
>
> Further he reports that changing from CONFIG_DRM_MESON=m to
> CONFIG_DRM_MESON=y reverses the order in which the DRM and power domain
> driver's shutdown functions are executed, making the reboot successful.
>
> The reason why we use meson_ee_pwrc_shutdown is because of the VPU power
> domain (which is causing the problem described above). It can be left
> enabled by u-boot. According to the original TOFIX comment in
> meson_ee_pwrc_init_domain we need to be careful because disabling the
> power domain could "cause system errors". As a workaround the clocks
> are manually enabled in meson_ee_pwrc_init_domain and the power domain
> is marked as GENPD_FLAG_ALWAYS_ON (so it can never be turned off).
>
> Experimenting has shown that the power domain itself can be disabled as
> long as we keep the clocks enabled if u-boot enabled the power domain
> but we don't have any driver enabled for the VPU (CONFIG_DRM_MESON=n).
>
> Keeping the clocks enabled is the responsibility of the CCF drivers, not
> the power domain driver. Even better: this is already covered as all
> gates in the VPU and VAPB tree on GX an G12 SoCs have the
> CLK_IGNORE_UNUSED flag set, meaning: if the bootloader has previously
> enabled the clock we're not touching it until a driver explicitly asks
> to enable (and then disable) it. In case of CONFIG_DRM_MESON=n we're
> never calling meson_ee_pwrc_on, meaning that we always keep the state of
> the clocks as set by u-boot.
>
> The original TOFIX comment also mentioned that we need to make sure not
> to mess up the clock's prepare/enable ref-counters. This is the only
> requirement that's left for the meson-ee-pwrc driver that needs to be
> managed for the VPU power domain.
>
> Three steps can improve this situation:
> - Don't prepare and enable the clocks (just to fix the ref-counting) in
>   meson_ee_pwrc_init_domain if u-boot left that power domain enabled.
>   Instead, remember if the clocks are enabled in meson_ee_pwrc_{on,off}
>   and only disable them if we have previously turned them on ourselves.
> - Drop GENPD_FLAG_ALWAYS_ON as we can always manage the state of the VPU
>   power domain if both the power domain controller and DRM driver are
>   enabled (=m or =y). If the power domain driver is enabled but the DRM
>   driver is disabled we can still use meson_ee_pwrc_off because it's not
>   trying to disable the clocks anymore
> - Drop meson_ee_pwrc_shutdown as it's the responsibility of the genpd
>   framework to call meson_ee_pwrc_off when needed (either when a power
>   domain is being disabled - regardless of whether it's was used by a
>   driver before or not). Now there's also no more shutdown callback
>   ordering dependency between the power domain driver and other drivers
>   anymore.
>
> Fixes: eef3c2ba0a42a6 ("soc: amlogic: Add support for Everything-Else power domains controller")
> Reported-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
unfortunately I need to add:
Nacked-by: myself

it turns out that the genpd framework does not call .power_on when the
power domain is already powered on during initialization
(pm_genpd_init)

I wonder if we need to extend the genpd to handle this use-case.
CCF (common clock framework) for example has CLK_IGNORE_UNUSED and a
.disable_unused callback which can be used to specifically manage the
"unused" use-case

my idea #1:
- add a GENPD_FLAG_IGNORE_UNUSED flag
- set it for the VPU power domain
- skip "unused" power domains which have the GENPD_FLAG_IGNORE_UNUSED flag set
- drop the GENPD_FLAG_ALWAYS_ON flag from the VPU power domain

my idea #2:
- a power_off_unused callback (with the same arguments as power_off)
could be introduced
- in pm_genpd_init we check if that callback is initialized, if not we
assign the power_off callback
- instead of using the power_off callback when disabling an unused
power domain the new power_off_unused callback is used
- for the meson-ee-pwrc we implement a special meson_ee_pwrc_power_off
function that is a no-op


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
