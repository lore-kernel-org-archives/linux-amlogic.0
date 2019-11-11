Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA4CC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:44:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 894C2206DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKjUlCK1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WRlmdfon"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 894C2206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RyMj2rAQIVkXCF/UotU3FpU0qRdZclweraW+sesTPa4=; b=lKjUlCK13DZVjq
	vKpexrv0mHMM0tmBQQLc+VUNxfKTYbGSfupvE5/p5MUy0coyxdz8JQJj/Od1KzKnzWj0lcH7QvUkU
	s8gBf2T5e+IQ6xGpVhfunxExdwHhSCQlHjYy5JCjkCUPyst/+NYk82Weh0AYC8n1YsFfLvlb3B0EY
	gjz745y9KJxKXbnn7G6ciH5UMeDEG+8dgnQ5xkxKgUPKC5a12JUmDEv6EayxUTvoes08p5WcKrtoU
	pEgMw1d3ROX7n+fu2gAOVPfiPwFPSB1hUds+KLerONyltkLO7TtLydS0IDpMd8qpsBggTdtbT8t6d
	XfMJVnIC0IUCljPXu00A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTxoi-00009d-Su; Mon, 11 Nov 2019 00:44:28 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTxof-00008e-3A
 for linux-amlogic@lists.infradead.org; Mon, 11 Nov 2019 00:44:27 +0000
Received: by mail-pf1-x441.google.com with SMTP id z4so9418826pfn.12
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Nov 2019 16:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=7D1i1PYEQ8E76vcTimQl2S5GrWJD0ZBxFsVuOgPA1vg=;
 b=WRlmdfonAhsw7WGkMLs4JVOF0FNJsRaSp8uUyn/dGtfHHwlObz4GnsuJRAgoRHlg91
 VI9DqhTzWET0o2VMwprjD+azrrFCcylHxiPLMKCxnJwxEsvwK0dAcABLTsCqKS9a8DTT
 1eS1MHNhgM2PpJkKXdq9nQglF5JMWl/oY+p/H6e0GamyH6FDHuvhnchhHcyd/npjvGrs
 iJ90nb1nqAn9lfpmroUQBgcLSwR1R+h2x9ksfqhT0VWuZ4g7lONfd0MdqDtMyhJcAUrh
 F1wSNlHG/MyTLqyXrYFGrtaODcWW9MPT3bc5mrT3/KwealKQk9meiSZoHPUKY+egYUp7
 Bltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=7D1i1PYEQ8E76vcTimQl2S5GrWJD0ZBxFsVuOgPA1vg=;
 b=K1BmKDG+vOsAxuE9DD/KXcCWoqbn9+VosWNvDS0fn3r/tMotDc8IiF2G+XEH8L2krX
 7GtW/oLWe+5jgEAWhCnTQU3Yuv++3Rj367u3JgO5lbaYaUsWGzyFWcFF5ykBXWeDC/Gp
 n8Up72YmiI5/YR/w1aa0kZQgKAJuB1XIGTH8LidWju1R7kVnmlSAAKu3GLPBFmICL4mA
 2D6KTvI65yumZwqAhQQY4Xg1mcjMvKufqmGIZ8cDQ4hc4fam5EUh4WJnrEYKtTYPw11j
 0PD3+m3Aw5LQekBp99QaLPyWIADe5B4U2E0qqpJ3t0MinFAZB+pa3caEfNn4cL2xQTl7
 QCmg==
X-Gm-Message-State: APjAAAV5YMVv1Un+kSROYYZlZQmhuadOOPEvCSmZy4y3NrOxG5idTLla
 0W3/2p6JqoVy3xzgIhA72tTBzg==
X-Google-Smtp-Source: APXvYqzLHb0WVLstmyXLb0sYizRwnHrygNRQ2u7KdMgm7LB5PW6v8H/FI+3BitphNcEt27MMuWVpBQ==
X-Received: by 2002:a63:5752:: with SMTP id h18mr25621946pgm.312.1573433064372; 
 Sun, 10 Nov 2019 16:44:24 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:7c60:912:1380:6df8])
 by smtp.gmail.com with ESMTPSA id f24sm11242922pjp.12.2019.11.10.16.44.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 10 Nov 2019 16:44:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.5
Date: Mon, 11 Nov 2019 01:44:22 +0100
Message-ID: <7hd0dzs0m1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_164425_144105_C8B2789F 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Arnd, Olof,

Here's a round of DT updates for v5.5.

Some highlights are in the tag description, but of note is that this PR
includes a clock tag (already in clk-next) to handle dependencies for
some new clocks added this round.

Please pull,

Kevin

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 87297878b5b7c2fc4cecd66fc96b3061d04b6b3b:

  arm64: dts: meson-gx: fix i2c compatible (2019-11-06 11:36:29 -0800)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.5

Hightlights
- new board; ugoos am6, based on G12B SoC
- g12: add thermal driver and cooling properties
- sm1: enable audio on SEI610 board
- IR: add several keymaps
- sdio: add keep-power-in-suspend property for multiple boards
- pcie: add support for G12A
- multiple fixes, cleanups

----------------------------------------------------------------
Anand Moon (6):
      arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
      arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
      arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power failed warning
      arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0 regulator
      arm64: dts: meson: odroid-c2: Add missing regulator linked to VDDIO_AO3V3 regulator
      arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI supply

Carlo Caione (1):
      arm64: dts: meson: Link nvmem and secure-monitor nodes

Christian Hewitt (11):
      dt-bindings: Add vendor prefix for Ugoos
      dt-bindings: arm: amlogic: Add support for the Ugoos AM6
      arm64: dts: meson-g12b-ugoos-am6: add initial device-tree
      arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-polled node
      arm64: dts: meson-gxl-s905x-khadas-vim: fix uart_A bluetooth node
      arm64: dts: meson-gxm-khadas-vim2: fix uart_A bluetooth node
      arm64: dts: meson: libretech-ac: update model description
      dt-bindings: arm: amlogic: update libretech-cc compatible
      arm64: dts: meson: libretech-cc: update model and compatible
      arm64: dts: meson-gxm-vega-s96: set rc-vega-s9x ir keymap
      arm64: dts: meson-gxbb-vega-s95: set rc-vega-s9x ir keymap

Corentin Labbe (1):
      ARM64: dts: amlogic: adds crypto hardware node

Frank Hartung (1):
      arm64: dts: meson: Add capacity-dmips-mhz attributes to G12B

Guillaume La Roque (4):
      arm64: dts: meson: g12: add temperature sensor
      arm64: dts: meson: g12: Add minimal thermal zone
      arm64: dts: meson: g12a: add cooling properties
      arm64: dts: meson: g12b: add cooling properties

Jerome Brunet (12):
      arm64: dts: meson: sm1: set gpio interrupt controller compatible
      arm64: dts: meson: axg: fix audio fifo reg size
      arm64: dts: meson: g12: fix audio fifo reg size
      arm64: dts: meson: g12: add a g12 layer
      arm64: dts: meson: g12: factor the power domain.
      arm64: dts: meson: g12: move audio bus out of g12-common
      reset: dt-bindings: meson: update arb bindings for sm1
      arm64: dts: meson: g12a: add audio devices resets
      dt-bindings: clk: axg-audio: add sm1 bindings
      dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
      arm64: dts: meson: sm1: add audio devices
      arm64: dts: meson: sei610: enable audio

Jianxin Pan (3):
      dt-bindings: arm: amlogic: add A1 bindings
      dt-bindings: arm: amlogic: add Amlogic AD401 bindings
      arm64: dts: add support for A1 based Amlogic AD401

Kevin Hilman (2):
      Merge branch 'reset/meson-sm1-bindings' of git://git.pengutronix.de/git/pza/linux into v5.5/dt64-redo
      Merge tag 'clk-meson-dt-v5.5-1' of git://github.com/BayLibre/clk-meson into v5.5/dt64-redo

Neil Armstrong (23):
      arm64: dts: meson-g12a-sei510: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-g12a-x96-max: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gx-p23x-q20x: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxbb-nanopi-k2: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxbb-nexbox-a95x: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxbb-p20x: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxbb-vega-s95: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxbb-wetek: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxl-s805x-p241: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxl-s905x-nexbox-a95x: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxl-s905x-p212: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxm-khadas-vim2: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-gxm-rbox-pro: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-sm1-sei610: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-g12b-khadas-vim3: add keep-power-in-suspend property in SDIO node
      arm64: dts: meson-g12a: Add PCIe node
      arm64: dts: khadas-vim3: add commented support for PCIe
      arm64: dts: meson-g12: add support for simplefb
      arm64: dts: meson-g12a: fix gpu irq order
      arm64: dts: meson-gxm: fix gpu irq order
      arm64: dts: meson-g12b-odroid-n2: add missing amlogic, s922x compatible
      arm64: dts: meson-gx: cec node should be disabled by default
      arm64: dts: meson-gx: fix i2c compatible

 Documentation/devicetree/bindings/arm/amlogic.yaml                      |   9 +-
 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt      |   3 +-
 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt |   3 +-
 Documentation/devicetree/bindings/vendor-prefixes.yaml                  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                                    |   2 +
 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts                          |  30 +++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi                               | 130 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                              |  13 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi                       | 455 +++++++++++++++++++--------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi                              | 392 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                       |   3 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                      |   3 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                             |  33 +++--
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts            |  25 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts                    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts            |  25 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts                    | 557 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi                             |  26 ++--
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                     |   3 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                               |  10 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts                    |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts                  |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                     |  73 ++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi                        |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi                    |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi                       |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts            |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts                    |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts              |   7 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts            |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts             |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi                   |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                              |  10 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts                   |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                      |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts                      |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                              |   6 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                      |   7 +
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts                  |  25 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                        | 208 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                              | 344 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/axg-audio-clkc.h                              |  10 ++
 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h                 |   2 +
 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h              |  15 +++
 44 files changed, 2107 insertions(+), 371 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
