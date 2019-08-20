Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D8BC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 22:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AD0206DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 22:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLQPNvHZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l1SBFn/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15AD0206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2tYat27qiB7xTs555YLZzMV2bSVQPH27QnhGPJDXevY=; b=MLQPNvHZAxPYMv
	TS8KM6SWTYOJF0YMpWzxpj3RtZnKkEhRwC+kE9nV6HIHifD574aiwPHv7aX/YCFYKyefR2lRcPkER
	qD3wl/TUjsigOAHZhAoIzFYfHMn5z7qipAebxoZBMtaRvmT2GFSZ5ZfQSfLTGw/StlfFXhQP1UASj
	i6UwgUy0UOrVddduornzqEljawhf71nziNQfeSKNAi7FTgm2mfH815o9uOeKUNkz9zbTbLIHCawaB
	vF7ZH+mOv/XR8KywpmEzHqHXcbmq6Dv1INWgtOKdQahz67mrk7iZ0k04aYCrgqUQpgOf6NcC+7geu
	sI2nfAcJ32V5h2Wy3v6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0CNQ-0007Y0-Vw; Tue, 20 Aug 2019 22:13:17 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0CNG-0007Or-LO
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 22:13:08 +0000
Received: by mail-pf1-x442.google.com with SMTP id q139so3241pfc.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 15:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=k2Wuee+uRdE3duVB1p3kOH3bI6LlcO35mEgSoRoQop4=;
 b=l1SBFn/YrSKYKs+hrfBTvXymBEUh0R7ZovD43eoFrnL0NGy6fe7WnQS0B16/U5P2vp
 kxVa2Xm5Nc0I4ueN3QAyStlNVEpX0Qc9FSZlOiJL2tlZ5UNBsvUMHOOC+CpWnnxmYhuE
 lHjX51f4jszNJe2YERgTIhTETt9Yns0lnWVNn6IHBWtaENFRGTvvXY08kKpMnjXLYltT
 FKMSgTI4rFU27KMssVKuusacC1XpvN9ERQRkPznMVSN33DNNPsuitjOKHqabk41EsKkw
 QbuuN6I62P2IOflni9NrYlnBVtjVuuIYQkSt4xh6HEI4wpUCgSDcfpMwmaGcMgxKz01L
 s7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=k2Wuee+uRdE3duVB1p3kOH3bI6LlcO35mEgSoRoQop4=;
 b=WKl6uqIM5QPRNMM2qmcm+BelicHNMn8NsS3jy+h1jfGtyguc1NzzVqgdvDyAEPcL8x
 kfO34GmIkG3l1LMA+nwz1KB6koG/ZGETB3APeZ5vENX7JYzqvimWZRYUgdhDTiG6jocK
 Hnf3FBWX/Ma4Q1802oeeOoWHuXMVMT1rrimmuqi3dktwkeq6rHSEb7af5RbkX4+E1zfb
 8dpsy1QoIvegaCEhgo4GiJC0ziH5qkajUE51TLHfbvDPvkBZgT2VRoaTbilLeUniLSiJ
 IC3K+GAW7OLLxwkTu79ItqnyrJGqRaVjRjlYOrsY7QP+zjhsagYhxqetlUJBxs6Gw034
 KDPQ==
X-Gm-Message-State: APjAAAWybxdNbMwpX2bNse2LbaUeI/MIdP9ML2q742accFIj6lovhqyT
 eTc/zgzs4L0WF5cpLeEaNxNkGQ==
X-Google-Smtp-Source: APXvYqyvpp314PMghrqC196URurtP785sPDptHj3sbn3LABt45bkP5DvLy3IyXRWgGeNNyOESg4kzQ==
X-Received: by 2002:a63:ff66:: with SMTP id s38mr27122269pgk.363.1566339185776; 
 Tue, 20 Aug 2019 15:13:05 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j6sm23320072pfa.141.2019.08.20.15.13.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 15:13:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.4
Date: Tue, 20 Aug 2019 15:13:04 -0700
Message-ID: <7hr25fbi4v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_151306_707743_35FE69A8 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Below is a regular round of DT updates for the 64-bit Amlogic SoCs.

Of note is a set of clock patches I've merged in from a stable tag
(already merged into clk-next.)  This was needed for some new IDs added
for the handful of new SoCs we've added this cycle.

Please pull.

Thanks,

Kevin


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to e9a12e14322d7ddafeed6aec0d3fb02c0b5dc03c:

  arm64: dts: add support for SM1 based SEI Robotics SEI610 (2019-08-20 13:31:11 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.4

Highlights
- new SoCs (G12B family): S922X, A311D
- new SoCs (SM1 family): S905X3
- new board: SEI Robotics SEI610 (SM1/S905X3)
- new board: Khadas VIM3 (G12B/A311D)
- DVFS/CPUfreq support on G12[AB] family

----------------------------------------------------------------
Alexandre Mergnat (13):
      clk: meson: g12a: fix hifi typo in mali parent_names
      clk: meson: axg-audio: migrate to the new parent description method
      clk: meson: g12a-aoclk: migrate to the new parent description method
      clk: meson: gxbb-aoclk: migrate to the new parent description method
      clk: meson: axg-aoclk: migrate to the new parent description method
      clk: meson: remove ao input bypass clocks
      clk: meson: g12a: migrate to the new parent description method
      clk: meson: gxbb: migrate to the new parent description method
      clk: meson: axg: migrate to the new parent description method
      clk: meson: meson8b: migrate to the new parent description method
      clk: meson: clk-regmap: migrate to new parent description method
      clk: meson: remove ee input bypass clocks
      clk: meson: remove clk input helper

Christian Hewitt (4):
      dt-bindings: arm: amlogic: add support for the Khadas VIM3
      arm64: dts: meson-g12b: support a311d and s922x cpu operating points
      dt-bindings: arm: amlogic: fix x96-max/sei510 section in amlogic.yaml
      arm64: dts: meson-g12b-khadas-vim3: add initial device-tree

Jerome Brunet (2):
      Merge branch 'v5.4/dt' into v5.4/drivers
      arm64: dts: meson: add ethernet fifo sizes

Kevin Hilman (2):
      arm64: dts: amlogic: g12 CPU timers stop in suspend
      Merge tag 'clk-meson-v5.4-1' of git://github.com/BayLibre/clk-meson into v5.4/dt64

Maxime Jourdan (3):
      dt-bindings: media: amlogic,vdec: add default compatible
      arm64: dts: meson-gx: add video decoder entry
      arm64: dts: meson: add video decoder entries

Neil Armstrong (17):
      arm64: dts: meson-g12a: add missing dwc2 phy-names
      arm64: dts: meson-g12a-sei510: enable IR controller
      clk: core: introduce clk_hw_set_parent()
      clk: meson: add g12a cpu dynamic divider driver
      clk: meson: g12a: add notifiers to handle cpu clock change
      clk: meson: g12a: expose CPUB clock ID for G12B
      arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
      arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
      arm64: dts: meson-g12a: add cpus OPP table
      arm64: dts: meson-g12a: enable DVFS on G12A boards
      arm64: dts: meson-g12b: add cpus OPP tables
      dt-bindings: arm: amlogic: add bindings for G12B based S922X SoC
      dt-bindings: arm: amlogic: add bindings for the Amlogic G12B based A311D SoC
      arm64: dts: meson-g12b-odroid-n2: enable DVFS
      dt-bindings: arm: amlogic: add SM1 bindings
      dt-bindings: arm: amlogic: add SEI Robotics SEI610 bindings
      arm64: dts: add support for SM1 based SEI Robotics SEI610

Xavier Ruppen (1):
      arm64: dts: amlogic: odroid-n2: keep SD card regulator always on

 Documentation/devicetree/bindings/arm/amlogic.yaml           |   20 +-
 Documentation/devicetree/bindings/media/amlogic,vdec.txt     |    5 +-
 arch/arm64/boot/dts/amlogic/Makefile                         |    3 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   |    2 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 2420 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts            |   61 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts              |   54 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts           |   52 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                  | 2417 ++-------------------------------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts |   15 +
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi            |  149 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi      |  544 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts         |   99 +++-
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts |   15 +
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi            |  124 +++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi                  |   30 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    |   16 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  |   11 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   |   11 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                   |    4 +
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts             |  300 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                   |   68 +++
 drivers/clk/clk.c                                            |    6 +
 drivers/clk/meson/Kconfig                                    |   11 +-
 drivers/clk/meson/Makefile                                   |    2 +-
 drivers/clk/meson/axg-aoclk.c                                |   63 ++-
 drivers/clk/meson/axg-audio.c                                |  261 +++++------
 drivers/clk/meson/axg.c                                      |  207 +++++---
 drivers/clk/meson/clk-cpu-dyndiv.c                           |   73 +++
 drivers/clk/meson/clk-cpu-dyndiv.h                           |   20 +
 drivers/clk/meson/clk-input.c                                |   49 --
 drivers/clk/meson/clk-input.h                                |   19 -
 drivers/clk/meson/clk-regmap.h                               |   12 +-
 drivers/clk/meson/g12a-aoclk.c                               |   81 ++--
 drivers/clk/meson/g12a.c                                     | 1626 +++++++++++++++++++++++++++++++++++++++++++++------------------
 drivers/clk/meson/g12a.h                                     |    1 -
 drivers/clk/meson/gxbb-aoclk.c                               |   55 ++-
 drivers/clk/meson/gxbb.c                                     |  657 ++++++++++++++++++--------
 drivers/clk/meson/meson-aoclk.c                              |   37 --
 drivers/clk/meson/meson-aoclk.h                              |    8 -
 drivers/clk/meson/meson-eeclk.c                              |   10 -
 drivers/clk/meson/meson-eeclk.h                              |    2 -
 drivers/clk/meson/meson8b.c                                  |  710 +++++++++++++++++++---------
 include/dt-bindings/clock/g12a-clkc.h                        |    1 +
 include/linux/clk-provider.h                                 |    1 +
 45 files changed, 6660 insertions(+), 3672 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h
 delete mode 100644 drivers/clk/meson/clk-input.c
 delete mode 100644 drivers/clk/meson/clk-input.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
