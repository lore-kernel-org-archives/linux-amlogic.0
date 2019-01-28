Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBDEC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 09:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B8D20989
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 09:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDi/hvaE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j29qEjTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B8D20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubjrskbrrPWkAx7P1gENB/o1TQwXaq4Bu/uUsTLjjks=; b=BDi/hvaEO39Op5
	pkS3+t1KlWwoIpdQm/tqN3ebPHHNzC3A0/9VX4zMPxKemz30dtTuZeWDeu0bQsCHmiVsh24HmDor/
	AKGo4HpwTp+pEPp+LNbdjCiYVfC8aFbCeTSSlaLaSLV7X0TD8PvKUw/RIKhciBTh2DDtqCvlEOmvf
	j8TNO0aEU/c7M9Gd1F48X0E7rKrt8fGB9H2MnAjPoGTwDLCw69M6hz5z4feYR7GxB6EEOOq0dfnPq
	nf/7VPJY+zGRmY0UAH4CbPkpdcJj2plg8nwzhGcWiF117m+3uw+S5bfnT2kBNs5cB6HPiOaQFaQzr
	/yFo06zM6ajBBZ/IhZLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go2vq-0002GP-Df; Mon, 28 Jan 2019 09:10:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go2vm-0002G6-LN
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 09:10:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id v13so17078718wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vGjs1h5UxGDElJy+pqo4oLl+0ds9NUR3IfOqXTVnYHo=;
 b=j29qEjToJ6gNOlkLktvn1syJJLSwoR8UBaP/eF1ZjEHGCMwwHwjTkojKHyf+4ziyAj
 zE+97jH7mypc2syCmkvq2h9DMvSQnRYSz6dT1uIu+U1jYNcGEbHV5RdpOBonUanI4bH2
 kf87EQH6h48EnV+UMQr3lG0KNbU1FpkJDFHq6IXntGibiXKPfughwUk3ab+nZxwjBuhD
 OnP6wBbtkVNrgBVRkLyPiCLl719khcb5Oso0kpwVsuPZzN4tarQYRuJ9rbrHwOdR+qq0
 Y3bn75tRr/RjX4iFiXIjy0nXV6Gx9P7mIdlggXa2V0XRjUd9784URbdxPTm5BEqvwkGG
 enzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vGjs1h5UxGDElJy+pqo4oLl+0ds9NUR3IfOqXTVnYHo=;
 b=foOfHdI8u1xCsVZYmdqaU/4O+bOkOuDddX7VGECQ2jht1N+peV3lcecQTX+JqcoarK
 O/CWE8eqAzVqjbz01Vq5GpH4nEkLMtU/cpgF9Puk2iM+OO4DYNF6RXV7V8/FtmkIGKYq
 rWLkUTVjiH/ogEjukPGBiMC6DnKtZPoHHEB0ZCKEVpSMAq/dq4CkOmAE+5qtJYIKPqjh
 +yTk8vb+arUxGOTY68w0Iu0yDpu4luNYNGBJNTR5rqnneRUAdyW2ksN7CpRo8KmSFi0U
 9CSLbLuuOup64Kzsh8vc/mnJWxxpUvTJGpvDKl7JvGfMjE7n4fcll5vxXyjMyQxPKq3l
 H8CA==
X-Gm-Message-State: AJcUuke1uZtUmdrLlcmvjIkqRyCu1WFes/T1lEYFsUTiQylQJjZKOSle
 izIYURVsd7POSl2YZKBtr8gU3tkU2Yd7VA==
X-Google-Smtp-Source: ALg8bN5/QmOvU7O46zyXSTepT8d1WO/wDVvh3fuGBH8yJpwQV6eN12Y9eG5JANKorp5KtXLLrv+Lrw==
X-Received: by 2002:adf:9467:: with SMTP id 94mr20502221wrq.305.1548666611767; 
 Mon, 28 Jan 2019 01:10:11 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m15sm99699195wrr.95.2019.01.28.01.10.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jan 2019 01:10:11 -0800 (PST)
Subject: Re: [PATCH u-boot 00/11] meson: add support for Video Output
To: agust@denx.de, Tom Rini <trini@konsulko.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <f18da31d-d1ac-efcb-099c-cdfcd225fd60@baylibre.com>
Date: Mon, 28 Jan 2019 10:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_011014_770342_5A35D4EF 
X-CRM114-Status: GOOD (  20.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mjourdan@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anatolij, Tom,

Could you have a look at patches 2, 3 & 4 ?
Is there a more dedicated reviewer for this ?

Thanks,
Neil

On 15/01/2019 17:17, Neil Armstrong wrote:
> This patchset adds support for CVBS and/or HDMI output for Amlogic
> Meson GX SoCs (GXBB, GXL and GXM) based on the Linux Meson DRM driver
> ported to the U-Boot Video DM model. It supports only the "DMT" video
> modes reported by the monitors since AVI InfoFrame management is
> missing from the U-Boot video model.
> 
> The port includes some changes in the dw-hdmi driver to support custom
> PHY calls and support for the ColorSpace converter since the
> Amlogic Meson GX video pipeline can only output un YUV444 mode, thus
> activating the CSC is needed to output RGB for HDMI.
> 
> Video Support needs some tweaks in the DT like the u-boot,dm-pre-reloc for
> the VPU node and a tweak to access the HHI registers from the DW-HDMI
> glue driver. A port of a linux patch is also necessary to hook a regulator
> to enable HDMI.
> 
> Finally, it enables console mux and console env for all Amlogic boards
> and enabled Video Support for the Libre Computer AML-S905X-CC board.
> 
> Jorge Ramirez-Ortiz (2):
>   video: dw_hdmi: support SoC specific read/write ops
>   video: dw_hdmi: add support for color conversion
> 
> Maxime Jourdan (6):
>   power: domain: meson-gx-pwrc-vpu: add missing depends
>   arm64: dts: meson-gx: vpu should be probed before relocation
>   arm64: dts: meson-gx: add hhi reg entry to hdmi_tx
>   arm: meson: board-gx: Setup VPU in fdt
>   arm: meson64: enable console mux and console env by default
>   arm: libretech-cc: enable video by default
> 
> Neil Armstrong (3):
>   video: Add Meson Video Processing Unit Driver
>   arm64: dts: meson-gx: Add hdmi_5v regulator as hdmi tx supply
>   configs: meson64: use vidconsole and usbkbd if enabled
> 
>  arch/arm/dts/meson-gx-u-boot.dtsi             |   21 +
>  arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi |    7 +
>  arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi  |    7 +
>  .../meson-gxl-s905x-khadas-vim-u-boot.dtsi    |    7 +
>  arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   |    1 +
>  .../meson-gxl-s905x-libretech-cc-u-boot.dtsi  |    7 +
>  arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |    1 +
>  arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi |    7 +
>  arch/arm/dts/meson-gxl-s905x-p212.dts         |    1 +
>  .../arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi |    7 +
>  arch/arm/dts/meson-gxm-khadas-vim2.dts        |    1 +
>  arch/arm/include/asm/arch-meson/meson-vpu.h   |   13 +
>  arch/arm/mach-meson/board-gx.c                |    5 +
>  configs/khadas-vim2_defconfig                 |    2 +
>  configs/khadas-vim_defconfig                  |    2 +
>  configs/libretech-cc_defconfig                |    8 +
>  configs/odroid-c2_defconfig                   |    2 +
>  configs/p212_defconfig                        |    2 +
>  drivers/power/domain/Kconfig                  |    2 +-
>  drivers/video/Kconfig                         |    2 +
>  drivers/video/Makefile                        |    1 +
>  drivers/video/dw_hdmi.c                       |  267 ++-
>  drivers/video/meson/Kconfig                   |   12 +
>  drivers/video/meson/Makefile                  |    9 +
>  drivers/video/meson/meson_canvas.c            |   45 +
>  drivers/video/meson/meson_dw_hdmi.c           |  445 +++++
>  drivers/video/meson/meson_dw_hdmi.h           |  134 ++
>  drivers/video/meson/meson_plane.c             |  177 ++
>  drivers/video/meson/meson_registers.h         | 1393 ++++++++++++++++
>  drivers/video/meson/meson_vclk.c              |  893 ++++++++++
>  drivers/video/meson/meson_venc.c              | 1464 +++++++++++++++++
>  drivers/video/meson/meson_vpu.c               |  211 +++
>  drivers/video/meson/meson_vpu.h               |   97 ++
>  drivers/video/meson/meson_vpu_init.c          |  440 +++++
>  drivers/video/meson/simplefb_common.c         |   29 +
>  drivers/video/meson/simplefb_common.h         |   21 +
>  include/configs/meson64.h                     |   23 +
>  include/dw_hdmi.h                             |   74 +
>  include/media_bus_format.h                    |  156 ++
>  39 files changed, 5992 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/dts/meson-gx-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi
>  create mode 100644 arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi
>  create mode 100644 arch/arm/include/asm/arch-meson/meson-vpu.h
>  create mode 100644 drivers/video/meson/Kconfig
>  create mode 100644 drivers/video/meson/Makefile
>  create mode 100644 drivers/video/meson/meson_canvas.c
>  create mode 100644 drivers/video/meson/meson_dw_hdmi.c
>  create mode 100644 drivers/video/meson/meson_dw_hdmi.h
>  create mode 100644 drivers/video/meson/meson_plane.c
>  create mode 100644 drivers/video/meson/meson_registers.h
>  create mode 100644 drivers/video/meson/meson_vclk.c
>  create mode 100644 drivers/video/meson/meson_venc.c
>  create mode 100644 drivers/video/meson/meson_vpu.c
>  create mode 100644 drivers/video/meson/meson_vpu.h
>  create mode 100644 drivers/video/meson/meson_vpu_init.c
>  create mode 100644 drivers/video/meson/simplefb_common.c
>  create mode 100644 drivers/video/meson/simplefb_common.h
>  create mode 100644 include/media_bus_format.h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
