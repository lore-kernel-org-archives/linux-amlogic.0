Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F399C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 23:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F138723405
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 23:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IUHsNr2K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nwo9p5Bg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F138723405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTOWmaIxDNZM/2US4XpTW8j7KG6QR/v0wb8uin/wzNk=; b=IUHsNr2Kxbb/fn
	uLxFrUb/FbfgnYa6zZH1lS4FaOEm1+qWSJj7mWz2h47a0jMOGmPOxCHnkE1kYXYYQ1b66uu2Wp5Z5
	wcMXPfCKduhqYaQsjJj6GOooMZmdOH9qTsIo9HUuhxsMlPfi6XlNgo1t9Hkg6GqWA8znLCoy8qz/j
	BVRAxK/Dm/y9EnVl7SruvKQXjUzay11dYRsX724Cd7mURa1KoX0MN/iUmArqwStnuPWgSUHq/LunP
	Hy88fuYRA524Ybv4b6ro23cr7Jj9vrTIxrCHy6LsUnLl7E+WaG3gK36NwTUQ0K7wz2u84yerkdg5m
	zqtHprzN1qVREYsyG9/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3U1Y-0005d2-Os; Thu, 29 Aug 2019 23:40:16 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3U14-00043w-NF
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 23:39:49 +0000
Received: by mail-pg1-x542.google.com with SMTP id l21so2457778pgm.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HEiVkY+3jrwwZ9UTeF03txZpd3QG0gPJ7jjbBDpNrpI=;
 b=nwo9p5BgaEzokeDc4g1OPJH9QuiReCkeiNFj2UgJolVT/cvKrvWVMp8xN/QjN27dVh
 1UBRrTQV8CgIWQ/T6yQ1BMqQ90CAFHIiv1fVjux9DMa2Ihlq7a076Nqs2EoVt7s8IBHW
 /zXFlTTfw6yUflnfZq2Sl9Z0BpOwJi0sH0XcRfM5ZuiAFCma1zw5xF2CUvqjMl226/9v
 JF4sNJPdRYoo2tkdHv1du9S19qRNs9/3lzXvcnqqoFXhJ/Jw0NkBzwWY8YuauXncQ6T0
 xXVmKxt/xin7exmrkS0j4y91GbIJn+AkmMGnIQT7vXsjgpvPX7veGTEegLh1At9JXsrh
 AGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HEiVkY+3jrwwZ9UTeF03txZpd3QG0gPJ7jjbBDpNrpI=;
 b=FrXIJN8LRHt2HXTGZjBQBgIguVvPHw+CZr8oOUvZiC9r5yNOFehRd4StjgA/fFRFAI
 qzwxjWcQqCeICnjOoxpBz01aRZuki+Lecu7yWGtG3Z3jdlP3D1Mp7vp/NN6gmIoqrgMB
 ycQb+U89daNFvMsDZVzmrtpOFNVxEuRfhl+H5Tm5sfclhwncAY5tzf+X3NDNrGPNg4K4
 91BDHjWA7kIIu7UcrDD4Vg7UfQ854c5KmKL2j05TkdfxWrLz6QMwfbp7gcCE0E8iYX+C
 pbPeYiRCYGubC8K/NFmFittirs8CvMAmMaYtanvjfHHvq3mVVZZPByrPYinwzqPj+HZx
 K7Eg==
X-Gm-Message-State: APjAAAUBpTki4ram2JpQZXWSe0ftkWFVWNx8RTVgCuY8PXw2k4iCsY79
 CNAeoWPwimVzvUMyTX0vWQ915w==
X-Google-Smtp-Source: APXvYqzk3XbUqRC+l30V9x8gLtbrnvzE9Ix4qlBiqAzb2/NyKBAi+5ZcC5T5AENtMDjgAiG6rTFUfA==
X-Received: by 2002:a63:593:: with SMTP id 141mr10416110pgf.78.1567121985496; 
 Thu, 29 Aug 2019 16:39:45 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b18sm4668903pfi.160.2019.08.29.16.39.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 16:39:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.4 (round 2)
In-Reply-To: <7h4l1zrf84.fsf@baylibre.com>
References: <7h4l1zrf84.fsf@baylibre.com>
Date: Thu, 29 Aug 2019 16:39:44 -0700
Message-ID: <7hv9ufmthb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_163946_830465_E8A23254 
X-CRM114-Status: GOOD (  16.40  )
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

Kevin Hilman <khilman@baylibre.com> writes:

> Another (final) round of 64-bit DT updates for Amlogic SoCs for v5.4.
> Highlights are in the tag description, but of note is a tag pulled in
> from the clock tree due to a handful of new clocks used for DVFS and
> power domains.

Here's the promised respin (round 2.1):

In addition to the clock dependency listed above, this branch adds a
bunch of DT users of a new PM domain driver, which has new bindings and
DT headers added in my drivers PR.  That drivers branch is also merged
here to ensure this branch builds standlone also.

Sorry for the noise on the first attempt.

Please pull,

Kevin

The following changes since commit e9a12e14322d7ddafeed6aec0d3fb02c0b5dc03c:

  arm64: dts: add support for SM1 based SEI Robotics SEI610 (2019-08-20 13:31:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2.1

for you to fetch changes up to b09d116b787a4ee2587a631baf2532738a5ce833:

  arm64: dts: meson-sm1-sei610: add stdout-path property back (2019-08-29 16:18:38 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.4 (round 2)
- new board: Khadas VIM3L (SM1/S905D3 SoC)
- support power domains on G12[AB] and SM1 SoCs
- DT binding fixups based on YAML schema
- add a bunch of remote control keymap
- enable DVFS on SM1/SEI610 board

----------------------------------------------------------------
Christian Hewitt (8):
      soc: amlogic: meson-gx-socinfo: add A311D id
      arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
      arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
      arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
      arm64: dts: meson-gxbb-wetek-play2: add rc-wetek-play2 keymap
      arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas keymap
      arm64: dts: meson-gxl-s905w-tx3-mini: add rc-tx3mini keymap
      arm64: dts: meson-gxm-khadas-vim2: use rc-khadas keymap

Jerome Brunet (3):
      dt-bindings: clock: meson: add resets to the audio clock controller
      arm64: dts: meson: g12a: audio clock controller provides resets
      arm64: dts: meson: g12a: add reset to tdm formatters

Kevin Hilman (3):
      Merge tag 'amlogic-drivers-2.1' of https://git.kernel.org/.../khilman/linux-amlogic into v5.4/dt64-2
      Merge tag 'clk-meson-dt-v5.4-3' of git://github.com/BayLibre/clk-meson into v5.4/dt64-2
      arm64: dts: meson: g12a-common: add VRTC

Neil Armstrong (31):
      soc: amlogic: meson-clk-measure: protect measure with a mutex
      soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
      soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
      dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
      soc: amlogic: clk-measure: Add support for SM1
      dt-bindings: clk: meson: add sm1 periph clock controller bindings
      soc: amlogic: Add support for Everything-Else power domains controller
      dt-bindings: power: add Amlogic Everything-Else power domains bindings
      arm64: dts: meson: fix ethernet mac reg format
      arm64: dts: meson-gx: drop the vpu dmc memory cell
      arm64: dts: meson-gx: fix reset controller compatible
      arm64: dts: meson-gx: fix spifc compatible
      arm64: dts: meson-gx: fix watchdog compatible
      arm64: dts: meson-gx: fix mhu compatible
      arm64: dts: meson-gx: fix periphs bus node name
      arm64: dts: meson-gxl: fix internal phy compatible
      arm64: dts: meson-axg: fix MHU compatible
      arm64: dts: meson-g12a: fix reset controller compatible
      arm64: dts: meson-g12a-x96-max: fix compatible
      arm64: dts: meson-gxbb-nanopi-k2: add missing model
      arm64: dts: meson-gxbb-p201: fix snps, reset-delays-us format
      arm64: dts: meson: fix boards regulators states format
      arm64: dts: meson-g12: add Everything-Else power domain controller
      arm64: dts: meson-sm1-sei610: add HDMI display support
      arm64: dts: meson-sm1-sei610: add USB support
      arm64: dts: meson-sm1-sei610: enable DVFS
      arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi
      dt-bindings: arm: amlogic: add Amlogic SM1 based Khadas VIM3L bindings
      arm64: dts: khadas-vim3: add support for the SM1 based VIM3L
      arm64: dts: meson-sm1-sei610: enable DVFS
      arm64: dts: meson-sm1-sei610: add stdout-path property back

Nishka Dasgupta (1):
      soc: amlogic: meson-gx-socinfo: Add of_node_put() before return

 Documentation/devicetree/bindings/arm/amlogic.yaml                 |   3 +-
 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml |  93 +++++++++++++++++++
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile                               |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                         |   6 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi                  | 113 +++++++++++++----------
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                 |   3 +-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                        |   9 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts       |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi            | 355 ----------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts               |   5 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts       |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi                        |   9 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                          |  19 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts             |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi                   |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts               |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts             |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts           |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts     |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts        |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                         |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts              |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                 | 360 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts             |  70 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                   |  83 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                         |  85 ++++++++++++++++-
 drivers/soc/amlogic/Kconfig                                        |  11 +++
 drivers/soc/amlogic/Makefile                                       |   1 +
 drivers/soc/amlogic/meson-clk-measure.c                            | 148 ++++++++++++++++++++++++++++-
 drivers/soc/amlogic/meson-ee-pwrc.c                                | 492 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                             |   7 +-
 include/dt-bindings/clock/g12a-clkc.h                              |   5 +
 include/dt-bindings/power/meson-g12a-power.h                       |  13 +++
 include/dt-bindings/power/meson-sm1-power.h                        |  18 ++++
 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h         |  38 ++++++++
 42 files changed, 1553 insertions(+), 443 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
 create mode 100644 drivers/soc/amlogic/meson-ee-pwrc.c
 create mode 100644 include/dt-bindings/power/meson-g12a-power.h
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
