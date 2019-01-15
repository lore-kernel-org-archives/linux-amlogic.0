Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8824C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795F120657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i1LqEESG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="skcc5IjM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 795F120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iDU0DV5XvUf+IRsUzPOKnBt99QDbwjZK3PPhSX4rNUw=; b=i1LqEESGQjLh+u
	SScgMPvj//BFSr0qPmI6S2orDOM/EPl52FHa37cbyjFvkWG1TMK8Ihtgv0WYTlVzVqfZJEvkxgmK5
	utIv2cqndJSwqQMGi+Knq8qFIn5dN5DHt0uLPyUDCHyzY/ktyRk+cAatQHWizdtsJlEAkKM+AZsRM
	O2+26Vm5v5fJ+zFmHQVQvA99N57arv3nGInygd+j/97LxaFctNQt2XoyMyc3tasqMyXCm8Epybo82
	2xilNgElY4AZtE/GSTJFLgliDnjWK6oGbsFaLRkjfO0sgjyrwQzxg3vOKMCDD60puZz/VQA81gGGM
	UG3IoLVrjP+FcKtt/Z5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRPu-0007By-V1; Tue, 15 Jan 2019 16:18:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPi-00072y-IJ
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id y8so3799567wmi.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9rU3I88UrxK7zXnA0GpfZb1Gz+RQ0Dpw9A81f2X7l0=;
 b=skcc5IjMGDjrShVV5xoGX5OTpHnT4QJOWW/flqh9dHYizCARASglSvPqVyzgxzTuzf
 zw6CCHGIEWC+epB9QfBNcehXmzSONWCglCthpRstpZgyH1jZDqrPkfY0Y6dfLP8lgVfD
 BBPNtCq3Jk0Ilx855exPJ7e+KfTmPwLxwgbeGF82zA5A42AJnrAxhinFfZdD5xOBdlXU
 bh6Ye86ZhyK+6FKx6ZHgXjc6PMvaXgpbKmL/Cyq8ho1HwkEVUL+Mdv7lcNlRBzNuRpG5
 74Tzafcmvht8nI34coksFVdIfeEpUTtLg7+xB62yqUM0o77FfwVHKB1N+CZmT73ybV00
 Cq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9rU3I88UrxK7zXnA0GpfZb1Gz+RQ0Dpw9A81f2X7l0=;
 b=JdzyNkrGBBC1iIn8n3/jVsFmEwPHwszwZAw/5tu6U4X3jqnV8ZZBvQyZB/SpG8sXvN
 LLpZU6oAxBwb6I4zP8MjodidFDykPgPIwcMmXrCeja0U+m9E5ImaUT0mHJgJsG5hjy5D
 a+wT6Zovv0CM49kiyTYB9thtY+Xj/APkCh9O0CxcahL7TgwzT1l4ija2MV5pwmRb/s/P
 OgkCtU14earZ4kTlfEDnQi7HV0GVYNPX/10fpxkzL+r95AitZZdI8hDw55ckCc6XisaQ
 yscicAgJa0MRPAFuj7l/6qq6goCOBkYLy5lGqYdFm+8HnDbTNuNNJ63M1T/1ZiV5K/uI
 VdcQ==
X-Gm-Message-State: AJcUuke6GdGXS2N3ij+vNSpZVcHdf+4Q1+4PIF9h+kWNIozM34Gkf0oJ
 2AbP8kqAiEOr+Mq1clIMTaJ+EA==
X-Google-Smtp-Source: ALg8bN4KMdssgFjpI4TgoEyJ8YL5b8XS1l0TqfxofXfkoVRhZ1J05y4ZowPQohjoyPBTGnmD8cSIBg==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr4088045wme.152.1547569083716; 
 Tue, 15 Jan 2019 08:18:03 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:03 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 00/11] meson: add support for Video Output
Date: Tue, 15 Jan 2019 17:17:48 +0100
Message-Id: <20190115161759.1657-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081806_660499_56FE1F96 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for CVBS and/or HDMI output for Amlogic
Meson GX SoCs (GXBB, GXL and GXM) based on the Linux Meson DRM driver
ported to the U-Boot Video DM model. It supports only the "DMT" video
modes reported by the monitors since AVI InfoFrame management is
missing from the U-Boot video model.

The port includes some changes in the dw-hdmi driver to support custom
PHY calls and support for the ColorSpace converter since the
Amlogic Meson GX video pipeline can only output un YUV444 mode, thus
activating the CSC is needed to output RGB for HDMI.

Video Support needs some tweaks in the DT like the u-boot,dm-pre-reloc for
the VPU node and a tweak to access the HHI registers from the DW-HDMI
glue driver. A port of a linux patch is also necessary to hook a regulator
to enable HDMI.

Finally, it enables console mux and console env for all Amlogic boards
and enabled Video Support for the Libre Computer AML-S905X-CC board.

Jorge Ramirez-Ortiz (2):
  video: dw_hdmi: support SoC specific read/write ops
  video: dw_hdmi: add support for color conversion

Maxime Jourdan (6):
  power: domain: meson-gx-pwrc-vpu: add missing depends
  arm64: dts: meson-gx: vpu should be probed before relocation
  arm64: dts: meson-gx: add hhi reg entry to hdmi_tx
  arm: meson: board-gx: Setup VPU in fdt
  arm: meson64: enable console mux and console env by default
  arm: libretech-cc: enable video by default

Neil Armstrong (3):
  video: Add Meson Video Processing Unit Driver
  arm64: dts: meson-gx: Add hdmi_5v regulator as hdmi tx supply
  configs: meson64: use vidconsole and usbkbd if enabled

 arch/arm/dts/meson-gx-u-boot.dtsi             |   21 +
 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi |    7 +
 arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi  |    7 +
 .../meson-gxl-s905x-khadas-vim-u-boot.dtsi    |    7 +
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   |    1 +
 .../meson-gxl-s905x-libretech-cc-u-boot.dtsi  |    7 +
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |    1 +
 arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi |    7 +
 arch/arm/dts/meson-gxl-s905x-p212.dts         |    1 +
 .../arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi |    7 +
 arch/arm/dts/meson-gxm-khadas-vim2.dts        |    1 +
 arch/arm/include/asm/arch-meson/meson-vpu.h   |   13 +
 arch/arm/mach-meson/board-gx.c                |    5 +
 configs/khadas-vim2_defconfig                 |    2 +
 configs/khadas-vim_defconfig                  |    2 +
 configs/libretech-cc_defconfig                |    8 +
 configs/odroid-c2_defconfig                   |    2 +
 configs/p212_defconfig                        |    2 +
 drivers/power/domain/Kconfig                  |    2 +-
 drivers/video/Kconfig                         |    2 +
 drivers/video/Makefile                        |    1 +
 drivers/video/dw_hdmi.c                       |  267 ++-
 drivers/video/meson/Kconfig                   |   12 +
 drivers/video/meson/Makefile                  |    9 +
 drivers/video/meson/meson_canvas.c            |   45 +
 drivers/video/meson/meson_dw_hdmi.c           |  445 +++++
 drivers/video/meson/meson_dw_hdmi.h           |  134 ++
 drivers/video/meson/meson_plane.c             |  177 ++
 drivers/video/meson/meson_registers.h         | 1393 ++++++++++++++++
 drivers/video/meson/meson_vclk.c              |  893 ++++++++++
 drivers/video/meson/meson_venc.c              | 1464 +++++++++++++++++
 drivers/video/meson/meson_vpu.c               |  211 +++
 drivers/video/meson/meson_vpu.h               |   97 ++
 drivers/video/meson/meson_vpu_init.c          |  440 +++++
 drivers/video/meson/simplefb_common.c         |   29 +
 drivers/video/meson/simplefb_common.h         |   21 +
 include/configs/meson64.h                     |   23 +
 include/dw_hdmi.h                             |   74 +
 include/media_bus_format.h                    |  156 ++
 39 files changed, 5992 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/dts/meson-gx-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxbb-odroidc2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxm-khadas-vim2-u-boot.dtsi
 create mode 100644 arch/arm/include/asm/arch-meson/meson-vpu.h
 create mode 100644 drivers/video/meson/Kconfig
 create mode 100644 drivers/video/meson/Makefile
 create mode 100644 drivers/video/meson/meson_canvas.c
 create mode 100644 drivers/video/meson/meson_dw_hdmi.c
 create mode 100644 drivers/video/meson/meson_dw_hdmi.h
 create mode 100644 drivers/video/meson/meson_plane.c
 create mode 100644 drivers/video/meson/meson_registers.h
 create mode 100644 drivers/video/meson/meson_vclk.c
 create mode 100644 drivers/video/meson/meson_venc.c
 create mode 100644 drivers/video/meson/meson_vpu.c
 create mode 100644 drivers/video/meson/meson_vpu.h
 create mode 100644 drivers/video/meson/meson_vpu_init.c
 create mode 100644 drivers/video/meson/simplefb_common.c
 create mode 100644 drivers/video/meson/simplefb_common.h
 create mode 100644 include/media_bus_format.h

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
