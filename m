Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D559C00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KV/h8gIrkcf8yZaFUxtXSiDA0oINkghE1bxRp9vOYrA=; b=4gEZ7r9Lkniatr
	ffRK0sfJas69/M7JqRENXrmOUrKBvBpiVUNGiMJUNyHkbioolb7RmhIlN20siAhtkbrwvhl2MB3Vm
	ilVU2OXGd+9ewMBWYeaT965qpXHO8xI4SUtOM+MGUkdUNqSnRtG8TXzWvPPlbf3FqpQzCKuXikbqO
	eE7RhmTMr6AUlxB6pL6S3aWTr0uWaGsSTeruQeTNl+nMbQd7DLfstEX86h4eW1OZnQnFk+ls7A/cG
	8QZFtGes2a0h3/DMDFGnb/IfBUDntBQEo2qM9ckFgDBD4+Z0klaEOGwb1NDGisPEDAPktWuTkNfss
	aBgWIsga5GTbyYx6+v0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUoj-0087O6-UT; Fri, 12 Aug 2022 13:35:13 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUoC-0086vs-LU; Fri, 12 Aug 2022 13:34:42 +0000
Received: by mail-vs1-f42.google.com with SMTP id o123so814491vsc.3;
        Fri, 12 Aug 2022 06:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aaWmraAyVdsxzOKXcrqOwgi0BA7kWyk0fbcE3gB04Gk=;
        b=oPQbSpOJ5jiYE6sTzxsYoc620kd1iIaD2ATLqw4WX/u6TmWEl0o+QMxxacghWxSj6V
         UBlxdyYRpsJWFzw7P4ivlERbpPO+5ZciaINSZXSx+UN1+b7GaqvB6x1/xxJs9hId5tHM
         gT7hlx61zX+rUCXgE+I76k3FgZFpJKCU/ZZ35VLUeBTWW8xcmAclvWv2s+6BQznySqrq
         DFQkp+LQAvllIIjWATraQfK/zvwFEPxtjxVFQtEZEHxqwnRYmIlgbEMXI8UZJO9Ox966
         Vy9bp9jcUpYRhORizowWDiE9PR7seQvMLJevelyqToIMznLsYfKvbqs0d4Gn3JQbEOf8
         vkvA==
X-Gm-Message-State: ACgBeo27eCWRLoA9yksXa3DW2Kv8/N7nin/uAH6YBGxvitYkgcZwhOG7
	iUjqPEaEXeKKgz7o/jOKeO+XqyB+jQ4HcA==
X-Google-Smtp-Source: AA6agR5EFrHcFoper3keglQdE+MoBeuU8AQDSXDxKlFOR49L77oINLmKX1jCAgLqKd0VwyAisiZqxw==
X-Received: by 2002:a05:6102:e07:b0:388:43ae:cb33 with SMTP id o7-20020a0561020e0700b0038843aecb33mr1818951vst.38.1660311278029;
        Fri, 12 Aug 2022 06:34:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id j26-20020a67e3ba000000b003884503a077sm1244196vsm.25.2022.08.12.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:34:37 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id z14so308487uaq.13;
        Fri, 12 Aug 2022 06:34:37 -0700 (PDT)
X-Received: by 2002:a25:da0b:0:b0:67a:7fb6:8ae with SMTP id
 n11-20020a25da0b000000b0067a7fb608aemr3414026ybf.89.1660310848820; Fri, 12
 Aug 2022 06:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:27:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
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
X-CRM114-CacheID: sfid-20220812_063440_724997_6E4110BB 
X-CRM114-Status: GOOD (  30.85  )
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

On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
(https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
;-)

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
>         "PAL",
>  };
>
> +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> +                                             unsigned int name_end,
> +                                             struct drm_cmdline_mode *cmdline_mode)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +               int ret;
> +
> +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> +               if (ret != name_end)
> +                       continue;
> +
> +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> +               cmdline_mode->specified = true;
> +
> +               return true;
> +       }
> +
> +       return false;

What's the point in returning a value, if it is never checked?
Just make this function return void?

> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -1848,18 +1870,14 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>                 parse_extras = true;
>         }
>
> -       /* First check for a named mode */
> -       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -               if (ret == mode_end) {
> -                       if (refresh_ptr)
> -                               return false; /* named + refresh is invalid */
> +       /*
> +        * Having a mode that starts by a letter (and thus is named) and
> +        * an at-sign (used to specify a refresh rate) is disallowed.
> +        */
> +       if (!isdigit(name[0]) && refresh_ptr)

This condition may have to be relaxed, if we want to support e.g.
"hd720p@50", cfr. my comments on "[PATCH v1 05/35] drm/connector:
Add TV standard property".

> +               return false;
>
> -                       strcpy(mode->name, drm_named_modes_whitelist[i]);
> -                       mode->specified = true;
> -                       break;
> -               }
> -       }
> +       drm_mode_parse_cmdline_named_mode(name, mode_end, mode);

This call needs to be conditional on mode_end being non-zero, cfr. my
patch "[PATCH v2 1/5] drm/modes: parse_cmdline: Handle empty mode name
part" (https://lore.kernel.org/dri-devel/302d0737539daa2053134e8f24fdf37e3d939e1e.1657788997.git.geert@linux-m68k.org).

>
>         /* No named mode? Check for a normal mode argument, e.g. 1024x768 */
>         if (!mode->specified && isdigit(name[0])) {


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
