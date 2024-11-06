Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD34FD44D75
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dm+WD7J5hhqnQmmfowhZluBgk0aHmOHosoGGYVKIda4=; b=HTS9gES3KC2vbC
	CWkBHG8OAPsJ+gBjXKUVjo7uzFmtpEmIIn8gWxELij70w3tK7N0ISYjBQCG7gRrSelfuCBPVCN/Of
	4+LfqqlZ7HRvoEi7AIkIxpce683ASGPRtA6imjkisoBmUjYe/TutQjClOqrJMaJtYKPnqQrhDfjmZ
	7HW48MxcnavrjQEvQUBebnFmx06AZSLqmf2FSQcyasIchep/Gs3bNO2z3jYW/iLKWhZzKe4mzyuAf
	0dgC72x0x9xnloiNvRxdxRDD9f4OfkCASnJRwTQyajdYX3QFyxCKLOrc4EZYrFJMmuoHTBGsB4/3q
	+uHChVeRuKHM+DfFGraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h3T-00000003ch7-2MWd;
	Wed, 06 Nov 2024 14:30:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1q-00000003btR-3W4j
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Nov 2024 14:29:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso79430755e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2024 06:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730903340; x=1731508140; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fR07OvAKZCcn4c5fWCDFwwdic4q9vTVULluh2TSx4BY=;
        b=X2+bkobaTkOcW1a2YS9TXrPxzBHn2pY/8q/BAdNzCYWTXN7gDNN/CZt9ERthH3HrfC
         gbG8GoSbjhFQxIW/Gz435fm5rIInxoBWu2uehFDiZQpV0STCWDRHrOfmK9Dc67ca9Rib
         6OLBJkTtv19zmlBWWUN6JNzBpWpjs4JwUrXfz8lF6O/Mkiu+sfIWTXVEdraSeMrTnpQl
         XGLGJlHelP8mNb+ko+2AKF5NwDMOmbCErk6DDokh2OD6YH4fhz9KXS3Lv/9ezDuEHCLC
         BXuYuus9h2F8qHxnImHXe+Au6HIqH8O2caIhZLhLQIt1MJUk86R6+wkNuUVVqq0PeBMH
         Twtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903340; x=1731508140;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR07OvAKZCcn4c5fWCDFwwdic4q9vTVULluh2TSx4BY=;
        b=A/XUOY+4mxhMR93u8pX4N0v5oxMjdN4IFeizZpXXLXpILG57dB7uVmQ52CerJ0rejf
         ANwYVOyN1MxPJRPADqXjXzspnwhEoZMptLnM5nn+VdrSwdC2+sWpPdP2FeI2T+x1Kph7
         mf7cLZRGDhJrlwXzu+14Lrx8qsJBju4t35Kev4Y131nZDsqBeRWsnc/ikrj1L8YPptg3
         1hkhxaWoOlIPzSLiLrNgCBK9g/hbCa+SuKMs3lMAvZpB9VwZ+tPzHr8+YeVWDXDgod1U
         1t2xJU3zH5SU/mbq/Rnr9E+aIV1JL3LgdFLtw84QCQguyMidhwN0G31+3pwANf3f0bVr
         cPFw==
X-Forwarded-Encrypted: i=1; AJvYcCXN0r3UHKukXMH2qRQEk8tcyzzCWAS6O1zoWMLhQNBS/+LJ9BWKWVsAJGHOhxySvlW3kbMZJ4JQJCtPz81W@lists.infradead.org
X-Gm-Message-State: AOJu0YxTKDhACX8ByAmoL0uURNiIPXK58ljQ4ffxooii40tzlWe63jvu
	sVcpFiuhTdE/bKXlxxgq4+YHO4O+f7tKTqsRn0XENz3IxAOTy7YjmRBvjoMm+T1KdxcwHXHdy29
	8
X-Google-Smtp-Source: AGHT+IGstdQ9A4MrGynIfGTZqv+ah9OkeHbjRp/dz/mM+KY45mCPilbar4JgbcfnSu8Wz5uGPgy1Uw==
X-Received: by 2002:a05:600c:444d:b0:42f:75e0:780e with SMTP id 5b1f17b1804b1-4328324ad00mr207455705e9.10.1730903339920;
        Wed, 06 Nov 2024 06:28:59 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:aefe:7cf1:a25f:8f85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7a9esm19251468f8f.21.2024.11.06.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.13
Date: Wed, 06 Nov 2024 15:28:57 +0100
Message-ID: <1jy11w307q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062902_930270_96E636B9 
X-CRM114-Status: GOOD (  15.75  )
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

Here is the Amlogic clock update for v6.13.

This is one is a bit out of the ordinary. You'll notice a fair amount
change in drivers/reset. We completed the rework to take the resets of
the axg controller out of drivers/clk/meson. This code will now be
maintained where it belongs. This will also allow to not duplicate reset
driver with the new audio clock controllers coming up.

The reset change present in this PR come from the following tag provided
by Philipp:

https://git.pengutronix.de/cgit/pza/linux/tag/?h=reset-amlogic-aux

One of the change present in this PR depends on these reset changes
which is why I pulled it.

The rest of the PR is business as usual.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.13-1

for you to fetch changes up to 664988eb47dd2d6ae1d9e4188ec91832562f8f26:

  clk: amlogic: axg-audio: use the auxiliary reset driver (2024-10-14 10:11:05 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.13

* Fix hifi_pll rate calculation on s4 and c3
* Move audio reset implementation from the axg-audio clock controller
  driver to the reset directory, using the auxiliary device bus.
* Remove the unnecessary spinlock in the mpll driver
* Fix meson8 clock controller DT bindings

----------------------------------------------------------------
Chuan Liu (5):
      clk: meson: s4: pll: hifi_pll support fractional multiplier
      clk: meson: Support PLL with fixed fractional denominators
      clk: meson: c3: pll: fix frac maximum value for hifi_pll
      clk: meson: s4: pll: fix frac maximum value for hifi_pll
      clk: meson: mpll: Delete a useless spinlock from the MPLL

Jerome Brunet (14):
      clk: meson: meson8b: remove spinlock
      Merge tag 'v6.12-rc1' into clk-meson-next
      Merge branch 'v6.13/bindings' into clk-meson-next
      reset: amlogic: convert driver to regmap
      reset: amlogic: use generic data matching function
      reset: amlogic: make parameters unsigned
      reset: amlogic: add driver parameters
      reset: amlogic: use reset number instead of register count
      reset: amlogic: add reset status support
      reset: amlogic: move drivers to a dedicated directory
      reset: amlogic: split the device core and platform probe
      reset: amlogic: add auxiliary reset driver support
      Merge tag 'reset-amlogic-aux' into clk-meson-next
      clk: amlogic: axg-audio: use the auxiliary reset driver

Neil Armstrong (1):
      dt-bindings: clock: convert amlogic,meson8b-clkc.txt to dtschema

Philipp Zabel (1):
      reset: amlogic: Fix small whitespace issue

 .../bindings/clock/amlogic,meson8-clkc.yaml        |  45 ++++++
 .../bindings/clock/amlogic,meson8b-clkc.txt        |  51 -------
 drivers/clk/meson/Kconfig                          |   1 +
 drivers/clk/meson/axg-audio.c                      | 109 ++------------
 drivers/clk/meson/axg.c                            |   6 -
 drivers/clk/meson/c3-pll.c                         |   1 +
 drivers/clk/meson/clk-mpll.c                       |  11 --
 drivers/clk/meson/clk-mpll.h                       |   1 -
 drivers/clk/meson/clk-pll.c                        |   8 +-
 drivers/clk/meson/clk-pll.h                        |   1 +
 drivers/clk/meson/g12a.c                           |   6 -
 drivers/clk/meson/gxbb.c                           |   6 -
 drivers/clk/meson/meson8b.c                        |  10 --
 drivers/clk/meson/s4-pll.c                         |  13 +-
 drivers/reset/Kconfig                              |  15 +-
 drivers/reset/Makefile                             |   3 +-
 drivers/reset/amlogic/Kconfig                      |  27 ++++
 drivers/reset/amlogic/Makefile                     |   4 +
 .../reset/{ => amlogic}/reset-meson-audio-arb.c    |   0
 drivers/reset/amlogic/reset-meson-aux.c            | 136 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson-common.c         | 142 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c                | 105 ++++++++++++++
 drivers/reset/amlogic/reset-meson.h                |  28 ++++
 drivers/reset/reset-meson.c                        | 159 ---------------------
 include/soc/amlogic/reset-meson-aux.h              |  23 +++
 25 files changed, 535 insertions(+), 376 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-clkc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-common.c
 create mode 100644 drivers/reset/amlogic/reset-meson.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/reset-meson-aux.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
