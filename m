Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F4ECAAA3
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPpWrk5IHvfC6AkCAPjqt0P9N87Efm6aiFSmj7Re5ew=; b=ryjTnDKMy0QfHM
	INlU1GP09p8COwEgukN7PUtHdB7d/w6AXfAhm6uQ7jYG9hT3+GttGxpVo1hcUVp/no3NWyhQx+fb5
	az+hSGkCAc4Y7ZIwCTJ+BP50KGd9N/4/Bl9YaVyBMo90BjIoqSULKvDQ0LUNaILzFa0tRPrZdbMHl
	mevgx9OJsQHUGkI0V77m5TgaGEVu/VYQU7445PkqG3dwCPE7H+NNt4+iKm7ChyW0Dt6VwlkRGjByl
	HC9p71ONAvvh7mOP11+zsLAWnN/nxEpUVH+yRWhJWvfbFY4Cn52BavPEvNcQEzPBKrgXtw5G01v6t
	xTA8MKZwtaxPMAgUnAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRal8-006beB-Ka; Fri, 26 Aug 2022 14:56:34 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRal5-006bcp-R3
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 14:56:33 +0000
Received: by mail-io1-xd2c.google.com with SMTP id p187so1342743iod.8
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 07:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WfP7PKK/kP/UQn6JDVR+ao9+K/wbktbl89yGlLt1XDA=;
        b=qSriLe6sGxvcFbE/UHHD2rI2XMDjAW0dHY7O7RcRp7Us3ZJw9H8hpT+s/MJgZyqjES
         riAXklRISS8D2FV5i5FXSxtAgiq7SZJTZ2osW8Z7a9i7LkvOYOTVRVTAuVxSdiS8lhQu
         4nBlp0HhwuO/O5FxkF2GOa7t+NodiQtKbTuBvAqfMKBPnjlia9SJhH1VTgzw4QlOlucO
         JNWKaV8jw4rzRhOEYM8SvQDbyVM2fnncFlNdJ45d9V+UuXFFsOEQ/WQmNTIBZo34/QVi
         3x6jHlYcMiCAH5TeYyOg9Aa90XVIZIg9PrgRDtDU+rGiMF/f6XMYWUMEFEDQRPdo5QKz
         vweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WfP7PKK/kP/UQn6JDVR+ao9+K/wbktbl89yGlLt1XDA=;
        b=E7kM/G3QwguPoNNdRVFk2q+RuwvCV3bR9bNWHNrDUA2JwVj2JshWLto+MYT5C/uA1r
         4RNt80R/dYIiJp0YtT9VBueB5l8yM+cOQo5IBBOcE9J43QB8n4AIW1S6DeUpgah8e0PA
         Fncfioz+hbSALg6q3eXGL7sCuGeclzdSQ2IS2gbEFTTSii2zfNjmLRpQ7CIi8OmvndJ4
         BDLaFRke2QYPx4FObQMm8XCXmb+aqXUld9CyadYlgm8jQ7d/4lIM1wTcyIMB4ABZqoE5
         ZeE9VYfq83UJZ4LjFfhx9m8R6UrSa3n3WoJrP346rnQZxHeIWACdSLWO8pwqxmyEHsJJ
         jldA==
X-Gm-Message-State: ACgBeo2CnZBu6UOIMED+EdcG9EtpVvUgOpDR3pnhFDOgvCeTWRnadV2B
	OQkFKJnsn/2reONYkggu1kAZzmjl0NDCDhRuvLyowA==
X-Google-Smtp-Source: AA6agR6NYFhimbin+zyrq+sDMrYVT/drrxOiPOtliWNwKfkaSwhjjkNjiz6pmebIrhxHD/9opEX+9yjdpWBkP9XvnLw=
X-Received: by 2002:a05:6638:3722:b0:349:41f1:7ff5 with SMTP id
 k34-20020a056638372200b0034941f17ff5mr4067740jav.283.1661525789304; Fri, 26
 Aug 2022 07:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org> <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com> <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com> <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
In-Reply-To: <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
From: Dom Cobley <dom@raspberrypi.com>
Date: Fri, 26 Aug 2022 15:56:18 +0100
Message-ID: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_075631_973743_8987D810 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, 26 Aug 2022 at 05:08, Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
>    https://github.com/raspberrypi/linux/pull/4639
>
> Either of these approaches makes VEC mode switching work again. Obviously
> neither is appropriate for a permanent solution.

Might be worth trying the latest rpi-update firmware.
There was a change that affects restoring PIXEL/VEC clocks after a
power domain cycle.
There is also a fix for a USB boot breakage.

If you still have an issue that occurs in downstream pi tree but not
upstream, then create a linux github issue.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
