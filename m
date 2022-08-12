Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B79C25B0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVGj0822T5aTXQXVIR2i74s/QbarElWx4LWU+/3r5Eg=; b=nfqavOoWfZYUCT
	ANlDMbfvUv8BMlF03NK3wPNdhXI/4PMVu8NUBF4egiG2ATFbKMbEvwZv+xPen401ZEHc2+z27JuM5
	ViRrgi3t3a+ym5O0UuOS5zBqYMmJA8EwHEPyG+BUjMKEVPMCNI5i6zNLLjovDtpbH+tX8T5c/2iHn
	bXvPfqwzA+yxdslYTBvrkPYRgabcFEL4HUJC3ZID0AS92QkPdJ8ozXg4k1U7Dn8QHPxatFVZbEulh
	PQzkoU5Qvaz4g51Yy8z27eP82bjMKvPA4PRdbouEfZ2F1ap2QYrzxQ1iDWChBh7BDVO0QB2ZGCLhG
	twJsOfawFlgIHZkJpa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUlu-00853q-ER; Fri, 12 Aug 2022 13:32:18 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUkh-0084BI-V9; Fri, 12 Aug 2022 13:31:05 +0000
Received: by mail-oo1-f53.google.com with SMTP id e2-20020a4ab982000000b004354ba9a591so177896oop.0;
        Fri, 12 Aug 2022 06:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OXdSHuVG78f8K6rpNcMaWPwy/pvmJ+nqUgx8dG2xzfs=;
        b=bgwAm6LPAKdvsQ4azmbDL0yay/OmkRECI/F/murQqZL6cm3l6niyeoq6Q1U/EdIXrt
         KIH8bkLKVuWPx0r8e7YiF7A1AbTHFvWlO+QLpuyRcUTUxBNpom/OSgXdeUnTlCDL3D7E
         fUENqU8zX9xi7uZJYj+pSsz/nMmmtp0mJMWlkNSO8VMKZL2XPx09PmKnUT0gbP/NJ7MR
         n5sB8VYASFH9TBq1lAyH2vKJtS1OTwPJysWuqXxs3IqPdMPDFq7KXwgzN45yCN2ekyTk
         oYHTNEKLtwTJlFJmjDnOL79OER+kxXc/YpIRdUWmcYXdDyuVA5lzKqllmlffAgIbbAFp
         0Rfg==
X-Gm-Message-State: ACgBeo1/7yhBu8I4sUT9DZ+eabyAxsM19VHcEbhCX9Ms43ofwxVNpr0J
	rdMR/rWIepEW853+OGvbT8I1Asds4b870Q==
X-Google-Smtp-Source: AA6agR6nPYmEjlpKVV9F4kOObm97i4tSNp5GK/wVqGv8i8NXSmkI1AerKSjn1lUoHKeSGSnWgF9g8A==
X-Received: by 2002:a4a:974a:0:b0:436:682:ba00 with SMTP id v10-20020a4a974a000000b004360682ba00mr1189246ooi.68.1660311061772;
        Fri, 12 Aug 2022 06:31:01 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id y96-20020a9d22e9000000b006371639573bsm366400ota.7.2022.08.12.06.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:31:01 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id f3-20020a9d0383000000b00636d99775a2so571254otf.2;
        Fri, 12 Aug 2022 06:31:01 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr3307653ybq.543.1660310750947; Fri, 12
 Aug 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:25:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Subject: Re: [PATCH v1 07/35] drm/modes: Only consider bpp and refresh before options
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_063104_031050_B3360672 
X-CRM114-Status: GOOD (  28.67  )
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

Hi Maxime,

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Some video= options might have a value that contains a dash. However, the
> command line parsing mode considers all dashes as the separator between the
> mode and the bpp count.
>
> Let's rework the parsing code a bit to only consider a dash as the bpp
> separator if it before a comma, the options separator.
>
> A follow-up patch will add a unit-test for this once such an option is
> introduced.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1819,20 +1819,22 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>
>         name = mode_option;
>
> +       /* Locate the start of named options */
> +       options_ptr = strchr(name, ',');
> +       if (options_ptr)
> +               options_off = options_ptr - name;
> +       else
> +               options_off = strlen(name);
> +
>         /* Try to locate the bpp and refresh specifiers, if any */
> -       bpp_ptr = strchr(name, '-');
> +       bpp_ptr = strnchr(name, options_off, '-');

Probably you still want to add a check that the next character
is actually a digit, cfr. my "[PATCH v2 5/5] drm/modes:
parse_cmdline: Add support for named modes containing dashes"
(https://lore.kernel.org/dri-devel/2eb205da88c3cb19ddf04d167ece4e16a330948b.1657788997.git.geert@linux-m68k.org)?

>         if (bpp_ptr)
>                 bpp_off = bpp_ptr - name;
>
> -       refresh_ptr = strchr(name, '@');
> +       refresh_ptr = strnchr(name, options_off, '@');
>         if (refresh_ptr)
>                 refresh_off = refresh_ptr - name;
>
> -       /* Locate the start of named options */
> -       options_ptr = strchr(name, ',');
> -       if (options_ptr)
> -               options_off = options_ptr - name;
> -
>         /* Locate the end of the name / resolution, and parse it */
>         if (bpp_ptr) {
>                 mode_end = bpp_off;

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
