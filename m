Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF6ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNc4PFgUANf+rahybi8HCW62AKb7uCxvtlBsAxX8tcE=; b=1anaISn4YV06X2
	eL85hI79M56D3C3aZRk29hTzaSjFYxL32qyVwUNG0RrZqytFkyTr2KxladVwOsvzhrtQfDXl7MbCE
	R35yrdwksQKekk4Tiu2NhQD/N678qlmcRNrRjA8GUmG6rEajFLAF9PQyCRfVtFsaIJVvW93zDr4d8
	PWgHo5vGnUHn3HFrEsA+YjFiuwi0Dr5KuyemvmiBMsUxuBHpYpCdgRDc9jJ3RDZcuhi8M74jPcteV
	ZX0HydsPFMv874JBOUcKspsZ8AQrjVqul+ZMG97Uw72G2kLZvohWCw4oobRB3V6KM+D50wuCoJPiE
	ghm07qpb3n+jyigrAbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfYH-00B1Pa-Up; Mon, 29 Aug 2022 14:15:45 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfXj-00B1CB-A3; Mon, 29 Aug 2022 14:15:13 +0000
Received: by mail-qt1-f170.google.com with SMTP id cb8so6220555qtb.0;
        Mon, 29 Aug 2022 07:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+LNH7GWYgSUzsjvph8IQNcroBifhiDios4fo6CTY2/U=;
        b=vIwJ1TBOF5/xzbY+Ze8lFpZ4Hll+lMa8+lCp9TsLbA2qs5bTIQw7bcSzc2ZF8t9GQ+
         5yFqwr2qWSlYqInHjp20u8Lm8jXAWAxygcLra4BaVU/1b4ne79SDADduuGhfMwsCnJj6
         pAnFlXjh/rmHyUW+V3KUrs8T5LaZ+FZh64JkVV+nvac9Lvr2Avo+6O7/Vaqa3DbDLCUe
         5XIgu66nrvaQIBqBrA5vtrgh2qE1kIlG7dMRZ3yFy7wU26jwfWNwW9vyINkLA//kvH3E
         R97jkknljZ5ektgXKX9eHxTMGruaF8AVMb/wgmufrJncy3QdYCD2MsejFOJNQd98nhki
         ENfA==
X-Gm-Message-State: ACgBeo0ffy1SMpF8r5R43piQuEIhxLRuNnbh7bt3G8/ThbkLJYx90NHO
	cpEEMCha99shpLsna+6Q/PfowhiR+8BjRw==
X-Google-Smtp-Source: AA6agR4xqzNJruHHilsGGgkAnwEEY/UyN3hNUVI6IoBm4SrQiRxV+ZW6U9+X5AoE4D7CJKgmp1VhtA==
X-Received: by 2002:ac8:5796:0:b0:344:9321:5e2c with SMTP id v22-20020ac85796000000b0034493215e2cmr10415649qta.249.1661782508194;
        Mon, 29 Aug 2022 07:15:08 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id fz18-20020a05622a5a9200b0031eb393aa45sm5211796qtb.40.2022.08.29.07.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:15:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-33dce2d4bc8so198861817b3.4;
        Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr8612505ybe.36.1661782506395;
 Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat> <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat> <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat> <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
 <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com> <20220829132953.sfv5yex2dhv76vrq@houat>
In-Reply-To: <20220829132953.sfv5yex2dhv76vrq@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2022 16:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mateusz Kwiatkowski <kfyatek@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_071511_384990_F5FBBC11 
X-CRM114-Status: GOOD (  24.29  )
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

On Mon, Aug 29, 2022 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 24, 2022 at 06:42:18PM +0200, Mateusz Kwiatkowski wrote:
> > - Speaking of closed captioning... a lot of different stuff were put in the
> >   blanking interval over the years. Like teletext in Europe. There are projects
> >   like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
> >   reconfigure the Raspberry Pi composite output to include the blanking interval
> >   in the framebuffer so that teletext can be output by drawing on the edge of
> >   the "screen" (from the computer point of view).
>
> I'm not sure how we would support this in KMS to be honest. Asking for a
> wider mode and the userspace putting whatever it wants in the margins
> seems like a good choice.

s/wider/higher/

Teletext is transmitted in the "visible" parts of (horizontal) lines, but during
the vertical blank.

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
