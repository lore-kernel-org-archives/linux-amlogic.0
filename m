Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3309BC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XTMCVKUiL3nJHWX41iOFnx/baLdD1Cb69zgE9Wo13w=; b=mj6pRAeXH6lHyj
	tmdM+p+eaqztEs7ijBAeXJ2b9R+rJKL2RYEY3ZMyPt6ktKAxcEBDo+6DEqiNGg1E2SYBTus+RKSjv
	2K5ZK1olgZ1AqFt3hOzUMH4ODAQX9RRXILWtEDW/MIBccUP7HsVyTwn6KCC+h2yFcRlhBOJaI6fLn
	4fC/rO+nx+LdVI6urY7S4eK9DdziKiFqQHLWKb4DoABZiLIq4Rjo3fYiQb/unIgE4OZUHWM63jVFZ
	a2//io5F9TlC9tSur3v3W/xdBa19DNnO9xrq5TdZBijEfvXVmuBK9rp66Ttap8D4gEbD4OiHMgNX9
	JLE4mYIUKG2swPH6Hp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcEQ-00CnuL-Fp; Thu, 20 Jan 2022 18:32:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcEO-00CnsT-2Z
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 18:32:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z22so32343309edd.12
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+00NBU4zPpWp7jpvjiMcHu68nnfj/RSjb+xkfc0Ftio=;
 b=Ujrw03rYXeOdIrBL1FYq12Y7BD9PHdzWXOTbvGq3TL0sTrklNhYsPVirKgehYNdS71
 ywWPesI6LjjBA/ylLWyKbrznC3xu9vK2C4LwvKruPID0yH2J2uDbWAPWzjvhV1ctCBUb
 27SfQeB3rVS7zw3ck64PWI4MmubiXvrFuyjH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+00NBU4zPpWp7jpvjiMcHu68nnfj/RSjb+xkfc0Ftio=;
 b=zKhpyxxiI8hUr2A7Fjieys8871ztvhf49gFN6v0wMpU4WYkEjv8Z3PN5pLg0CNTmy3
 x2h+H/DH1NaSsyuvpr9kHQ7DPZtobGtUXXI6CexoSNXpY9u02OcZ8y3ZqzsSslCGte3C
 8EauZiPAyNRffhHNTz7pBFpucMWIaoYxUFhIkF+MevSIc6uwdE9BQ2rFxzRjnofHbsiN
 MQk8feepD0BL5v2DWSIGlP4O5fzqFCytjmdF1KOsCpaPT4j56UB/hQjvrfImIJTjCj2L
 jjqEPO6uLaTFiwDjF1JJ603H2JuvMQuRrjPiNNHZ+jjTrXaieEg/12RFipa1OpolozIU
 Pbqg==
X-Gm-Message-State: AOAM531DAKlD1d6Ne+rvhx7Zrg0X+hN811vm+rASzUdEK0SmSOYu7Nuz
 SMm9YH7oMdcN77mo403x3vQvPYrXXyJfsmfnxB4w2w==
X-Google-Smtp-Source: ABdhPJwtYYJyoFJwfwyt1kfWv+pgU8yVQH9Sl8CfaEbWcew1OIQe0t3QgSU+hVN98B+hr1XFAtv5BDKbO4q/1yNbR8k=
X-Received: by 2002:a17:906:5d0d:: with SMTP id
 g13mr131110ejt.167.1642703538208; 
 Thu, 20 Jan 2022 10:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
 <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
 <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
In-Reply-To: <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 21 Jan 2022 00:02:06 +0530
Message-ID: <CAMty3ZCb=oTw8inrk0MNHtjfJPVMKm2u-L8YSr=e0eQZ9HyQbA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_103220_159381_FD3F3FFB 
X-CRM114-Status: GOOD (  21.84  )
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

On Thu, Jan 20, 2022 at 10:00 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 20/01/2022 15:24, Jagan Teki wrote:
> > On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> >> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> >> Glue on other Amlogic SoCs.
> >>
> >> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> >> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> >> Analog PHY in the proper way.
> >>
> >> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> >> DW-MIPI-DSI transceiver.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/meson/Kconfig             |   7 +
> >>  drivers/gpu/drm/meson/Makefile            |   1 +
> >>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
> >>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
> >>  4 files changed, 525 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> >>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
> >>
> >> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> >> index 6c70fc3214af..71a1364b51e1 100644
> >> --- a/drivers/gpu/drm/meson/Kconfig
> >> +++ b/drivers/gpu/drm/meson/Kconfig
> >> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
> >>         default y if DRM_MESON
> >>         select DRM_DW_HDMI
> >>         imply DRM_DW_HDMI_I2S_AUDIO
> >> +
> >> +config DRM_MESON_DW_MIPI_DSI
> >> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
> >> +       depends on DRM_MESON
> >> +       default y if DRM_MESON
> >> +       select DRM_DW_MIPI_DSI
> >> +       select GENERIC_PHY_MIPI_DPHY
> >> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> >> index 833e18c20603..43071bdbd4b9 100644
> >> --- a/drivers/gpu/drm/meson/Makefile
> >> +++ b/drivers/gpu/drm/meson/Makefile
> >> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
> >>
> >>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
> >>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> >> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
> >
> > Can the naming convention prefix with dw-mipi-dsi like other glue
> > drivers follow?
>
> Seems only rockchip names their glue like that:
>
> $ find drivers/gpu/drm/ -name "*dw*mipi*dsi*.c"
> drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>
> If you look at dw-hdmi it's even worse:
>
> $ find drivers/gpu/drm/ -name "*dw*hdmi*.c" | grep -v mod
> drivers/gpu/drm/meson/meson_dw_hdmi.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> drivers/gpu/drm/imx/dw_hdmi-imx.c
> drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

Look like there is no standard naming, thanks.

Jagan.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
