Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EEBC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFE2205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mChVUPnQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZpuVFHG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFE2205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9zI9bcE2mGJ1B0ilfR07XcC8C4Yocoi5pNQd/IZt3ZA=; b=mChVUPnQbGkgkC
	/luZL/yW8BXcG8CkVV3jaT6KD0HMIT2N9UwC/90SallBfu1pzWt+JnICNzfm9TmGGkQDe995/7d30
	SFebcbFbZFKO3uO29/URuk2hfUcQcRUsPUalNjQT3nxru0mNYrZDcRcZbmjf4vd3e2skVcn2+JTA7
	AtrgjT6l9M/uBip2W6kXxOHueTdQhj0hZHNdVaCNB8DoF53pg9JNB2Ev6LCOTcyJsb6MPhVgXyrwH
	YUoOQzmTQJi7VpY9ZbrJN5Lz7IvkhvtwZKGfXhURD5kdui1HpLg5//C5MjFLV9E6j0vkjdxwSo4jp
	tX8crAJORU2flrkEJJlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3PHn-0007hZ-D7; Thu, 29 Aug 2019 18:36:43 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3PHZ-0007Wy-RA
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 18:36:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id u17so2038420pgi.6
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=r5eQHx60AZEp2EvCtEHQAjfXaLzkd6ZeSmX0m8nrcX8=;
 b=vZpuVFHGdubinXoHYQDkmFSCagP7I0L+sorE/9cXtefs3pGkxBCbnHJ3CmJ8x9W7E/
 8GGPGRD1npLv2IaiLiWx9dcwdS9BXRxSLbaAZdG4feeS74V6jXS2337JrSuDHVDkNYCF
 JmX+PEj7/jqqlMJnxiTtM0lBRueL68z7Sc5sty5dwiQV3YEwyKaPCWpKGEGUrAl5XWzV
 23aX1sH2r7SzQ5GSTU1oWsAAJ5gIIAX6N55cW4CFSJSljjVSh38QxZm0nidDoD0KlPc2
 QOjySuO4nKwFWpr95Xw1Fg/2YN27TsG8FRU5HRAqzR+oe4qJLNbBVtPwCIRnMS7A5UWM
 okAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=r5eQHx60AZEp2EvCtEHQAjfXaLzkd6ZeSmX0m8nrcX8=;
 b=MjvsRN3wEpO1/1aSAWUInZX1dtuH/AghSEkUU3Dgsstfi6roor335d1iB3LIyd5aNC
 XDvzJYayHxQdTQhc/31OFi/W37v/ipY7IHe3Nh6MM/lciXwJaficLiLnewcdasLBqsKE
 deXywlfJA0t4d1ELuEb2GGVvdTLPzOjnemz/osKgS50ULq1VEQuFfKk70RU7/4qtpssw
 6wKxuTpY7VRMp7BnbafuB2h3x4mUFmKxPtkRXU1/djQNvbu1VpkN4gCV9tFkMgOjzAOx
 WnpRqrQfpMMf2h92e2p+XpF77wlXHefcunYjouPyMa+J5l8YE4JFVPBfWVi/zFJ94gHb
 gh4A==
X-Gm-Message-State: APjAAAXyC0bOGB8g60hMEbx93ct489fLM+6s6Q+Vo8XtIefmkYxZzg0S
 UoW6u1mQy77fBmE+Fdo4niYBb6eM8SM=
X-Google-Smtp-Source: APXvYqxQ5S5iOBn/oKcNK6LCNECljsX2YS8Y1NTaPIa3FfVFSLBdHo/fiHCzZXVdsB7uJkGMGeA3Bg==
X-Received: by 2002:a63:29c7:: with SMTP id p190mr9421737pgp.124.1567103788676; 
 Thu, 29 Aug 2019 11:36:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s16sm4813490pfs.6.2019.08.29.11.36.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 11:36:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.4 (round 2)
Date: Thu, 29 Aug 2019 11:36:27 -0700
Message-ID: <7h4l1zrf84.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_113629_875348_6D6D737B 
X-CRM114-Status: GOOD (  14.08  )
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

Hello Arnd, Olof,

Another (final) round of 64-bit DT updates for Amlogic SoCs for v5.4.
Highlights are in the tag description, but of note is a tag pulled in
from the clock tree due to a handful of new clocks used for DVFS and
power domains.

Please pull.

Thanks,

Kevin


The following changes since commit e9a12e14322d7ddafeed6aec0d3fb02c0b5dc03c:

  arm64: dts: add support for SM1 based SEI Robotics SEI610 (2019-08-20 13:31:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 703d5ec6f8aa59964d78d28d07ca3251345d483f:

  arm64: dts: khadas-vim3: add support for the SM1 based VIM3L (2019-08-29 11:13:39 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.4 (round 2)
- new board: Khadas VIM3L (SM1/S905D3 SoC)
- support power domains on G12[AB] and SM1 SoCs
- DT binding fixups based on YAML schema
- add a bunch of remote control keymap
- enable DVFS on SM1/SEI610 board

----------------------------------------------------------------
Christian Hewitt (7):
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

Kevin Hilman (2):
      arm64: dts: meson: g12a-common: add VRTC
      Merge tag 'clk-meson-dt-v5.4-3' of git://github.com/BayLibre/clk-meson into v5.4/dt64-rebase

Neil Armstrong (23):
      dt-bindings: clk: meson: add sm1 periph clock controller bindings
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
      arm64: meson-g12: add Everything-Else power domain controller
      arm64: dts: meson-sm1-sei610: add HDMI display support
      arm64: dts: meson-sm1-sei610: add USB support
      arm64: dts: meson-sm1-sei610: enable DVFS
      dt-bindings: power: add Amlogic Everything-Else power domains bindings
      arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi
      dt-bindings: arm: amlogic: add Amlogic SM1 based Khadas VIM3L bindings
      arm64: dts: khadas-vim3: add support for the SM1 based VIM3L

 Documentation/devicetree/bindings/arm/amlogic.yaml                 |   3 +-
 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml |  93 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/Makefile                               |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                         |   6 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi                  | 113 +++++++++++++++++--------------
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                 |   3 +-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                        |   9 +++
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts       |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi            | 355 -----------------------------------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts               |   5 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts       |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi                        |   9 +++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                          |  19 +++---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts             |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi                   |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts               |   4 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts             |   4 ++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts           |   4 ++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts     |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts        |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                         |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts              |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                 | 360 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts             |  70 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                   |  83 +++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                         |  85 ++++++++++++++++++++++-
 include/dt-bindings/clock/g12a-clkc.h                              |   5 ++
 include/dt-bindings/power/meson-g12a-power.h                       |  13 ++++
 include/dt-bindings/power/meson-sm1-power.h                        |  18 +++++
 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h         |  38 +++++++++++
 36 files changed, 895 insertions(+), 441 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
 create mode 100644 include/dt-bindings/power/meson-g12a-power.h
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
