Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47052C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Feb 2022 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIH1ja8+9k1BA3uv2rlAggzF4XCQ2/Et//UNT5VTvcw=; b=4u4EIZGwrfoEoM
	RALvqPMwzJ8JPDUGW2XDETjk4Iv/va1r7fnoR8OfmRkNnrGyGJYOTDR+9s9BqcMc5A6PFFNmbIA3i
	4qwCpLj//17u5d7zms0xImbOclJzbb23InM0L5x1ivpUs+oXI/mGIU/Edu58bLPI8AQgJHulhZzxR
	lB7G3gRF5zOXTVVTacu+Mz7OVJIZBYdqFsntkSOO/56z8C2qpT5wyAwbYeDUa8O4wgDD8fQANPakx
	L9Fhm3dFb8SCrqgbRfXwpn5KhqP40NndlQpVd/E57sFeskpQ/5hYKI1jjgrt8GVf4VwTMW2drvQuI
	tcCjb+LDjwvE6Z+rNpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEzCp-00DZwd-VR; Tue, 01 Feb 2022 19:52:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEzCm-00DZvf-1k
 for linux-amlogic@lists.infradead.org; Tue, 01 Feb 2022 19:52:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id d5so18117035pjk.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Feb 2022 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=K0G1SY2wwrY+W9SNB4oFMtfetHq3vq9RQ2FLNyl/UiI=;
 b=AmoyYeqbKB/J8fBT7GwIIJ7MSBxGiJfI2bIvKcMrbC+8uTYNUByMbB8cYdjalZvuts
 bP6OB7nUJPZui4YHm54PBmVv7wrUBYuw0pn5eCsGBooT/y1iZuq2Nq4kJMFX23Af5xLs
 ZgW8DJqQhPejR+1y+MZ/pJnNZW7sov/QVgx+fYolLnuvq9xgAFwQM2Nd8NySe2e85265
 RrX41sx6lcvoEaYfIsJKTukQVAQFLtmEL4p29xx9uAzi+tp8SbEkvsaQTQJXLCKnMx60
 uXYbxXaVHaMeSiJkSrY4eiD3j6k1Ug94P86epF/+FQkxVKs6B1Pm6E1IgxDdlcapSKVo
 4uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=K0G1SY2wwrY+W9SNB4oFMtfetHq3vq9RQ2FLNyl/UiI=;
 b=Lxn8RHxs7PuxNBTQrWMhCie8qqjt/bh3Qk/hc35cvIhcHEWzcNaUmEBxHQJK/08a1H
 2reYN/2O6Y5ITrP8EOgQ9kzoKD1rxmYyGeD/6Mj5kt0K5p64UiBVpdIS/5KnyCkYsKWj
 Gr0FXbsznLcaJWU13xhKos8VsteGHoymjJXrqBxaS0IkNarsAEViLEWtIppMLRIaFFCM
 d11BcLY0EHTPzIYPKSRROZcfAEXd/4MT6kJ6DaXPx9Bwlrp5UwNKD07WgMUgQzJsRRK1
 /iAQ/pd1SHUK4AwbxLaRYkXcznXRXo9eGL4DbHeJjcmVjdUF3ANOzUYeO4Qf7jwBLfBe
 qf+w==
X-Gm-Message-State: AOAM531oEyjis0fYw4eHkE9nkU7u4oB5I/qLxA32yAqvAwicYktNcmYe
 yvF/hBSCOcHI8Jga0qVo+I+Dzw==
X-Google-Smtp-Source: ABdhPJwtPqHYQaAKewNFNpgmL8T0HaZwSGxAAwv38AZO435BSJ6NiP/4SeR7D33i2armAziRPFCdFg==
X-Received: by 2002:a17:902:db01:: with SMTP id
 m1mr27538672plx.126.1643745163074; 
 Tue, 01 Feb 2022 11:52:43 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b6sm23620829pfl.126.2022.02.01.11.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:52:42 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jianxin.pan@amlogic.com,
 shunzhou.jiang@amlogic.com
Subject: Re: [PATCH 2/2] soc: s4: Add support for power domains controller
In-Reply-To: <20220126061018.705338-3-shunzhou.jiang@amlogic.com>
References: <20220126061018.705338-1-shunzhou.jiang@amlogic.com>
 <20220126061018.705338-3-shunzhou.jiang@amlogic.com>
Date: Tue, 01 Feb 2022 11:52:41 -0800
Message-ID: <7hzgnal5yu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_115244_103653_86DCD0CC 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Shunzhou,

Shunzhou Jiang <shunzhou.jiang@amlogic.com> writes:

> Add support s4 Power controller. In s4, power control
> registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>

Thank you for adding support for S4 power domains.

> ---
>  drivers/soc/amlogic/meson-secure-pwrc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 59bd195fa9c9..8fee01aabab6 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <dt-bindings/power/meson-a1-power.h>
> +#include <dt-bindings/power/meson-s4-power.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/firmware/meson/meson_sm.h>
>  #include <linux/module.h>
> @@ -119,6 +120,17 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>  	SEC_PD(RSA,	0),
>  };
>  
> +static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
> +	SEC_PD(S4_DOS_HEVC,	0),
> +	SEC_PD(S4_DOS_VDEC,	0),
> +	SEC_PD(S4_VPU_HDMI,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(S4_USB_COMB,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(S4_GE2D,		0),
> +	SEC_PD(S4_ETH,		GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(S4_DEMOD,	0),
> +	SEC_PD(S4_AUDIO,	0),
> +};

We should avoid the GENPD_FLAG_ALWAYS_ON unless strictly necessary.  If
you look at a1_pwrc_domains[] in this same driver, any use of this flag
has a comment for why it's needed, and it's usually because the domain
is used by low-level SoC/PM code not controlled by linux.

All of these appear to be domains that linux should have driver control,
so should not be set to always on.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
