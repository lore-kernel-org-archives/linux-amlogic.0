Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FAC3064D
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XAwo9S+acMQt9djdyUHJ9FL/B5Qu8IzRlSKvR6a+6f4=; b=ok8R8p9+r15rvE
	2Ff1npRV2P8xjEflo2XvzORifMmeB34rA6OlbKTagJNMlPw2sG27WQIx8qM9/prXzgK6is8uTxAoC
	UjWmzH/pPkAqp3jPlcMYIqzN6boZT7lrBq6BfpP/5uSiUBo4XxbZcsEs2hVsAeEbLTE0GcQMqvqwT
	5TS0cgD3gToJT706VM7sOgvnuhH3347FjCbCggwSa42T3Q1C+cDQBO4mz0aqr75Bx+Dpf26S2bayL
	X5IXxBr5kmmmUYnRIDWt8J0Wcsqw8StUgraN5F8ck+PorokPthRrHhKgFipsxquJ3Zp4q9hTT1pg8
	TN3BzT4M3GR5dEWJTzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCXV-0000000Dzke-26VT;
	Fri, 28 Jun 2024 14:25:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCXS-0000000Dzjp-23Ph
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 14:25:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-36279cf6414so419851f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2024 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719584721; x=1720189521; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wc4W/nnUZPvJSFnr3oqmM9v2zpK+FhEQbUMqeT0qCRw=;
        b=dsvcFjpd4E54w1aB2LfStxN15JQe1iCIbdIDZAJT3YFDmLTa0b+8A1gXa0i/TCFaOC
         6n/AmxgOLm0ECnfFrqMy7z5BSw1AdKDu6LFs/nt9bZNPu5dsZGiZWZdN7nKgLfsFi9SD
         5vvo64bBjG4+olfZxSzU6SlnskL+DhQtNixgdyIFW/6X5mZ+S3XILIq91jNdXRoptb9+
         xR+mF4AcO60H4AAiMbbslip5W6pMzPRjJFNJawcY8jYzAKCW1q5e046eBPyvSaNAd0Zz
         nB//KM5YLDPaL0ukv+HhzIyl/PgKE7gc0WqzGLuisbe0MWWHnocEU2AMV31ju5lv1bGr
         tSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584721; x=1720189521;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wc4W/nnUZPvJSFnr3oqmM9v2zpK+FhEQbUMqeT0qCRw=;
        b=A35IhckHldrb7fr9QdM7POMmztsn6vmhfWaACYcC8o8uMIo+p46SNHCsS53NySJQ8i
         jjeqPqHGNqPKXLwu6s3Z8M1iUUvHNzz6nbfVHSr6dC8Nx1h00KIrsgL9y40pWm0nqcn5
         Mf80t45z2cl1b5tvnKiqTPDtx8ZVwa8F3TCxoBtRuo1wNVL/CIU1jyDtkHnt9i2ueZXm
         xUQlkt0RihUIog/+eJ1G4e+ZFNemXojKh3fdoOxbim1ZmfwIjnzaKz93OmXOl1gVZ5qZ
         EUDMBO4IjN+DfXtVnuPHSVw/N5Oyvcd0W3JgVseMyLn2MAqKSGxtKiemt7JrkiUZYsYm
         QO9g==
X-Forwarded-Encrypted: i=1; AJvYcCVpHEf8i/o5onC0uEGabLBcIBowsbNL7M4kgcns4y5SWnEIktbXGnUbLWVvCtjV2I1asmfBriV/cMNlwWhhrLPwb6lYydh3h/yz/MlQC1WTSYc=
X-Gm-Message-State: AOJu0YzsD7+EpomLRITkrKcZQ4hy9pJFxd+qA/13xbbXs+JjhENJUYG9
	8qCh271XqS3kAWOWOFOdl/OLRJyRp5RvfgX3aJRQkAutb2goM9bIQkhPvclns7E=
X-Google-Smtp-Source: AGHT+IET4FDNLdQFfZXi/Skee7y4f9QTaiC7MXrennb0SpwFOx9I6+py5FrnjC7GFRgLsPNApO51+A==
X-Received: by 2002:a5d:4343:0:b0:364:8568:f843 with SMTP id ffacd0b85a97d-366e964789cmr10741684f8f.59.1719584720645;
        Fri, 28 Jun 2024 07:25:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e1345sm2451201f8f.54.2024.06.28.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:25:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.11
Date: Fri, 28 Jun 2024 16:25:19 +0200
Message-ID: <1j34oxxhyo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_072522_549979_4BA9DFE9 
X-CRM114-Status: GOOD (  11.68  )
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


Hi Stephen,

Here is the Amlogic clock update for v6.11
The biggest part is the introduction of a new SoC support (C3), the rest
is regular house keeping as described below.

Please pull
Cheers

Jerome

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.11-1

for you to fetch changes up to befe87380e21f0d37633273e1068c9318f8135ff:

  clk: meson: add missing MODULE_DESCRIPTION() macros (2024-06-14 09:29:41 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.11

* Minor S4 clock fixes
* DT bindings Yaml conversion of the AXG audio controller
* C3 clock controllers support
* Flag added to skip init of already enabled PLLs and avoid relocking
* A1 DT bindings updates for system pll support
* Add missing MODULE_DESCRIPTION where necessary.

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: clock: meson: Convert axg-audio-clkc to YAML format

Dmitry Rokosov (3):
      clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled PLL
      dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
      dt-bindings: clock: meson: a1: peripherals: support sys_pll input

Jerome Brunet (4):
      Merge branch 'v6.11/bindings' into v6.11/drivers
      Merge branch 'v6.11/bindings' into v6.11/drivers
      Merge branch 'v6.11/bindings' into v6.11/drivers
      clk: meson: add missing MODULE_DESCRIPTION() macros

Xianwei Zhao (7):
      clk: meson: s4: fix fixed_pll_dco clock
      clk: meson: s4: fix pwm_j_div parent clock
      dt-bindings: clock: add Amlogic C3 PLL clock controller
      dt-bindings: clock: add Amlogic C3 SCMI clock controller support
      dt-bindings: clock: add Amlogic C3 peripherals clock controller
      clk: meson: c3: add support for the C3 SoC PLL clock
      clk: meson: c3: add c3 clock peripherals controller driver

 .../clock/amlogic,a1-peripherals-clkc.yaml         |    9 +-
 .../bindings/clock/amlogic,a1-pll-clkc.yaml        |    9 +-
 .../bindings/clock/amlogic,axg-audio-clkc.txt      |   59 -
 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  201 ++
 .../clock/amlogic,c3-peripherals-clkc.yaml         |  120 +
 .../bindings/clock/amlogic,c3-pll-clkc.yaml        |   59 +
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a1-peripherals.c                 |    3 +-
 drivers/clk/meson/a1-pll.c                         |    3 +-
 drivers/clk/meson/axg-aoclk.c                      |    3 +-
 drivers/clk/meson/axg.c                            |    3 +-
 drivers/clk/meson/c3-peripherals.c                 | 2366 ++++++++++++++++++++
 drivers/clk/meson/c3-pll.c                         |  747 ++++++
 drivers/clk/meson/clk-pll.c                        |   40 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/g12a-aoclk.c                     |    3 +-
 drivers/clk/meson/g12a.c                           |    3 +-
 drivers/clk/meson/gxbb-aoclk.c                     |    2 +
 drivers/clk/meson/gxbb.c                           |    3 +-
 drivers/clk/meson/meson-aoclk.c                    |    2 +
 drivers/clk/meson/meson-clkc-utils.c               |    1 +
 drivers/clk/meson/meson-eeclk.c                    |    2 +
 drivers/clk/meson/s4-peripherals.c                 |    5 +-
 drivers/clk/meson/s4-pll.c                         |    8 +-
 .../clock/amlogic,a1-peripherals-clkc.h            |    1 +
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |    1 +
 .../clock/amlogic,c3-peripherals-clkc.h            |  212 ++
 include/dt-bindings/clock/amlogic,c3-pll-clkc.h    |   40 +
 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h   |   27 +
 30 files changed, 3873 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/c3-peripherals.c
 create mode 100644 drivers/clk/meson/c3-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
