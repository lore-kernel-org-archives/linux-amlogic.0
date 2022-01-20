Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8069CC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uardJvkqb1IACMuct8dQfZlZih1OFs3EN21vtTjUdnE=; b=LKYINZv3w2gc+A8YOymjrYI8fn
	9up6UL3khP/Ly9gzXoL52N0Xdnp0Dim29m6GjU773Ldza5iH9iPactlJU0HkT2KbTouiubNcJMJKk
	D1LviQszUtwRZ5pIkc6MZfXQNRH36Zb0G1iZzqK8rHxytp48ANRPpxWAnUSC6ajaAD7ZpjmMKByae
	/KopVAFeFaSPfEQ6/Fq4z1iOB3kQRNPgA6qgyV/9PXCGDsxrGO1k0ps3u5gdz0f3u/8XTwtIbdw8O
	fo/h8faI6mB8qwxUmXU8XjEyuNRZBp+0eMAEeqnucXyHSZZcyFoBCCCOAqQcBrKUaLi+CUL5XU2yG
	5clV88Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAaKW-00COug-Ev; Thu, 20 Jan 2022 16:30:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAaKI-00COpV-GH
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 16:30:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so14972346wms.3
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzQQqeSGM3LxrK+WlCEqJXUoY8XCwDe0p9TbewA3bqI=;
 b=SMmvG8ttOsH2vuDlmU0xbdKf8b0D1tZeGEAes0tKRsVpLPBDxdDKxdwg3kHTju7JRR
 q3B4myh5Iob5I9CE61Irl4AhfpX28mPM49bLGV9nKAHK4vpnf/41gRGfp3J0tyUfU0jG
 OHw4jUit5a+p5QtVu5gNEm00RX1xcns7bk1WZHVxxX/nLcqUeDYDs1lLYl+N8KNI7t1l
 Rv8XQ7BzAtoBAbVa683Znz2sAR/Ok49tux4Jml34p3qUvFe2168yZnVf9JGKaOW+5x9S
 nIsQdhXS7HnmTujM9T9qgK4QCZw842A3JYycTgXEh6yqW1UKtBxlDaiNELAVWD8HWx0I
 op9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VzQQqeSGM3LxrK+WlCEqJXUoY8XCwDe0p9TbewA3bqI=;
 b=qY/Ovny/yxgPmFhaUeSjmWTtdGZWkGzFSe/71W/6KAn//phazK9HXa49kFXZfTSaGu
 W5Hd0A+3ZNnwIAA08na1QBiZjPSBU2mxcOOnqXtM8P3OOC6hhhv6dkTQd27ySNljBpb2
 nj4ZCN7ymqzZLJgaSr9o5XWhAE83TGr5dZ5HNnQwwgd9ycCv4Ckaq8DpQN3ta/epBcSD
 evZIYh2286lofnj26LPfbzLwcJ4ILm16NOVJ2JKBXzTesOqNQxVByERx+40m6xOzVPgX
 M51+hm8gXeDgVHsnSZkG7ZagLICbBjqEAtjYghXM6ksUJ0hABCCqNmX/USLSTZe+CgFo
 wdjA==
X-Gm-Message-State: AOAM5331jtWwH2Gvl8kFik6NtfvGZQp6RAFigKMi1eu3j5EiAyo2FJuR
 BP6Hy7IjhZ/bFAz+d+z6JcN1SQ==
X-Google-Smtp-Source: ABdhPJy04CbGdXKCJfGvM1t5iOiiIWRQ30w4QVsJUTsNDk2vUYA8WdMht68yiE/0LjztlBaEdUy6Iw==
X-Received: by 2002:a1c:256:: with SMTP id 83mr6927850wmc.89.1642696216410;
 Thu, 20 Jan 2022 08:30:16 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id p15sm3074542wrq.66.2022.01.20.08.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:30:15 -0800 (PST)
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
 <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
Date: Thu, 20 Jan 2022 17:30:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_083018_563278_A678334A 
X-CRM114-Status: GOOD (  18.30  )
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

Hi,

On 20/01/2022 15:24, Jagan Teki wrote:
> On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
>> Glue on other Amlogic SoCs.
>>
>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
>> Analog PHY in the proper way.
>>
>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>> DW-MIPI-DSI transceiver.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/Kconfig             |   7 +
>>  drivers/gpu/drm/meson/Makefile            |   1 +
>>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
>>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
>>  4 files changed, 525 insertions(+)
>>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
>>
>> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
>> index 6c70fc3214af..71a1364b51e1 100644
>> --- a/drivers/gpu/drm/meson/Kconfig
>> +++ b/drivers/gpu/drm/meson/Kconfig
>> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
>>         default y if DRM_MESON
>>         select DRM_DW_HDMI
>>         imply DRM_DW_HDMI_I2S_AUDIO
>> +
>> +config DRM_MESON_DW_MIPI_DSI
>> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
>> +       depends on DRM_MESON
>> +       default y if DRM_MESON
>> +       select DRM_DW_MIPI_DSI
>> +       select GENERIC_PHY_MIPI_DPHY
>> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
>> index 833e18c20603..43071bdbd4b9 100644
>> --- a/drivers/gpu/drm/meson/Makefile
>> +++ b/drivers/gpu/drm/meson/Makefile
>> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>>
>>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
>> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
> 
> Can the naming convention prefix with dw-mipi-dsi like other glue
> drivers follow?

Seems only rockchip names their glue like that:

$ find drivers/gpu/drm/ -name "*dw*mipi*dsi*.c"
drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
drivers/gpu/drm/stm/dw_mipi_dsi-stm.c

If you look at dw-hdmi it's even worse:

$ find drivers/gpu/drm/ -name "*dw*hdmi*.c" | grep -v mod
drivers/gpu/drm/meson/meson_dw_hdmi.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
drivers/gpu/drm/imx/dw_hdmi-imx.c
drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

Neil
> 
> Jagan.
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
