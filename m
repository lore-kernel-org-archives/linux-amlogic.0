Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9CDC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8Nj//9AmrtjHR7ijNMAjddPUUbQnD4Vfd7C2C85zWY=; b=fS+UTXC5tq4QzI
	XvsOMmDCZPoDcUj1PF20ebF0NjyyYu63VQNkO8msG4XR5hff69knV+rDENXQE90Gq7D3MKlp6yK3J
	A6Yeptx+O7BS8bmf4s0GWpnrP861eFWImsFZyE+ilCASxTN1Qqt4923rg2lvq8HUt9PZzaG8RXwVg
	JZFFO0lA5mSVVOqtpjUBJKkAUBZDqmdGWq4gmnvyJ0sZCbM795JTeUflg597qsDUlxCy+f+HviaM0
	EeNQS30S1q//19Rvq49dHmMCb8dubnvp+4XcXcTMfjm1CpIbD4nqgsr3l+SaxUvy6r1GctsPwX1Jj
	FWR67GLPeFsGmbJVuG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYNC-00BtQc-UI; Thu, 20 Jan 2022 14:25:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYNA-00BtOX-D7
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 14:25:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id j23so24298959edp.5
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAhsQDmY+UEIFHjWgi4z9bftnzJtob5tCT+hA+Of3Tc=;
 b=KJEjgCdFG0dpF+3j0wAsKxGexfu15gsGWeXYUVgoDvXZHy2v0EQey/SQX7X4mYBsSp
 I2UnEh7K6RxCTHjo7Shad43R2GcXtPLrFEKdOCAxEif+jzcmr0OzMr/cGHYQmUOjX0dX
 j8VWdbTp3bckcfROeq0sRC9ycPXnU++G0KRAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAhsQDmY+UEIFHjWgi4z9bftnzJtob5tCT+hA+Of3Tc=;
 b=t43oJAbEubQkKWsLNGM8mTVqafoQJtXSnWO8DOGqMepGSJj8QIRvKEamlKbX6dFjH/
 Sq0xjeREyN61ASXx7a4eDuoVcTKXrjUXHEIN2a9AtivFqbWH3W7GzC+eUok22YnYnMFd
 8t7n/uHI09c+S+yAQyW9kBH+qviyMrrSa1sf7rALyuitLwHqrFEN1/icUo16mpLFTIUZ
 OPLXgqeDkOP1r0Ed+zLHBAaK6eYLGNkb4K9wF5Lr0W9NVOm0RLHP6+sG53zGd87kFOTN
 0rlibSUNo3T7S1VKc5vW32bQRRUNX/6G/V+TKsnVRU67+i9pUNE5Wu55oRLo5tgQtOeq
 Gfqw==
X-Gm-Message-State: AOAM530UATV3CSoqxZoZp+zsSUMR5bHhklcAmVr0Zhl2kvmD5l7u21e7
 eQc0JuOkmV8iCZbCFEV+U+5PXqMb8THBxNqdeinTBA==
X-Google-Smtp-Source: ABdhPJy4wH7/I8d3vpY8drpkpk3qBL9l/808L6I024OQggLfoUx7l3gQI5KIjzpg9Q0pWjfKBcf3bh29R7L7Wb5fBgc=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr13521547edb.271.1642688706615; 
 Thu, 20 Jan 2022 06:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-7-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 19:54:55 +0530
Message-ID: <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_062508_468434_34763616 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> Glue on other Amlogic SoCs.
>
> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> Analog PHY in the proper way.
>
> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> DW-MIPI-DSI transceiver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/Kconfig             |   7 +
>  drivers/gpu/drm/meson/Makefile            |   1 +
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
>  4 files changed, 525 insertions(+)
>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
>
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index 6c70fc3214af..71a1364b51e1 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
>         default y if DRM_MESON
>         select DRM_DW_HDMI
>         imply DRM_DW_HDMI_I2S_AUDIO
> +
> +config DRM_MESON_DW_MIPI_DSI
> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
> +       depends on DRM_MESON
> +       default y if DRM_MESON
> +       select DRM_DW_MIPI_DSI
> +       select GENERIC_PHY_MIPI_DPHY
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> index 833e18c20603..43071bdbd4b9 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o

Can the naming convention prefix with dw-mipi-dsi like other glue
drivers follow?

Jagan.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
