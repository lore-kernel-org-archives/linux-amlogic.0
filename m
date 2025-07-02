Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06365C83F0A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6wcCl3Twl3ipJpq7goLd10sNn1vrxtRFqDeRhPTNv14=; b=M53GQ6IUnOvevh
	alfOraF61+fahlZ+mrROkCArVeNPMW//xSrrgEHPmjCjqDxL0GHIg/JxEueqHxGAPEfqGj9UOIeTb
	41mjJeb+dKNwrA34HiZp5s+MyrB908zqtL2VlXH4ZnsUPsmqBH7YTEbbHsqfAjxemweYOba8PYAFL
	XADYbzSpukP8e+xf2UNkBEgGqICLgvViXkzqebkIILBMFGEAs7QEMvVYs9UTUT6tGNqkMM59mIeoA
	DY5oLNZxiLcAAPRtwOdJ0M6iI3bLLgwC6qgwfera4Kuh6l2lhAxVnrtP24WKxhpkebBRXyBRRg0t3
	sSlIygqHCNBw322ESrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0So-00000008yUc-1pXZ;
	Wed, 02 Jul 2025 16:37:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMg-00000008mqA-1HAE
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso4817314f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470033; x=1752074833; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZEXD2+i9jrIQND3h3J1ExPn/hJoUIEOFDjyNRmi8MA=;
        b=OJ9QHfaZ5TtUNGlB321InfORf28A4PRhPRAwbDLHHH0gY+r8jtMCMrM5v4Aj8jOZAD
         saY//Fli3FeDYeTbBLAEZYYlKfo+daMu3xwqX1k2cBRZ4d9y2yyNGCLse3hFdrH3A+Tg
         M1+TWO19IR/wGRffCSA7s0gmfT+Q9Mnp6W2d83IY/LBjw6gaX8pU4JbGkHQEiofPkZa1
         WTDoWwCeIqfIaO72Apgqh5wBd1hQWX7j5ex437kr413efOrzRyLuk1QxWaZPNCKkEwBW
         CQwkg5BfkCjwYJiuCi0TMr51OugatClwNqmVNLg++2ZZYXsN33T4th55vwwCFF75e3yj
         b6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470033; x=1752074833;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZEXD2+i9jrIQND3h3J1ExPn/hJoUIEOFDjyNRmi8MA=;
        b=JYQrv9rGqgbtDoPT6Ow9MTVxe0Z5NUoboFfgXNZ3mZ4CLPiDH3At2wZJpCujUPVkCY
         zzMRGjZIzBHAh32ksZbqkqdJ3HjalrQiKr/FRQH22UqRaNOC75Xm/Pf7Gg/7WodlXMf7
         FGzL5sOluFNly7nNWrraHdl504MqTNXEEti6aLC91UXd30KvW81gM40P8cB3hLY2gKEG
         eDypYlW2B2DrnY+5MN21dAkpw9ArBp16IzC0zljK6yckix6No1f/uCn7zxWY+bviY8HL
         GutKeeo1kltvLMhII6zpKy0YB30ki5rTGxkXCuZMZ01GfFDJ/d1DJ0zx36hNj1tcOxnF
         BbKg==
X-Gm-Message-State: AOJu0Yw4F++6vFe6Dx2OiIsNvD450ERfwxoKELeOOfQX00tK/o4HNbWS
	s6y3TgdE5MGmIZULhrS5GlcZVo09guUvyfNYJj2gfLqgvZFNWUqnkPAZwCK9RQryodY=
X-Gm-Gg: ASbGnctmIQx8aBu+E3BjiDTJiVBTJuvMKpjtWKd9MG5rx5f/TuX0szwKoy3yCJlHoUL
	L7lEWtUAtadAYkLIshM2Aw5/lnMjykDNEpFrzwowoVq4DXEc/ILxKz/zXLsV/iPbExHyd1KI1l6
	HwqpGpeii7XC+KdvvHsiJ2npUlYBO7bjVBLxK3+54sjbAyTBPCNKf5ifB3Nm1nEVz2pSuURDdxg
	VZWfLFuCCh6jOKtsFC2LE2/Go9Mw2Sqk/zqyesVwEDt8QnJlNVyrD2nlCnqgEWzbk+XG8E1O8zC
	IY2bV1+wBEDl3Kp6rsnPt19v7Bz+kS4nxfSP6jgjGWYl6M0KYpHH+4CWKqHT/x+Sj8+qrMzHNlG
	b
X-Google-Smtp-Source: AGHT+IECpWxeElBoSmJlvb93CQNlef939HEeihtXTY2qzYHwnEYlCFa1/geWXCnGm0yUCufzbNrdFg==
X-Received: by 2002:a05:6000:4028:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3b200b4657bmr2630366f8f.40.1751470032604;
        Wed, 02 Jul 2025 08:27:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
Date: Wed, 02 Jul 2025 17:25:58 +0200
Message-Id: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIZPZWgC/x2MMQqAMAwAvyKZDZhQBP2KOGiNGtRWWhSh+HeLw
 w033CWIElQitEWCILdG9S4LlQXYdXCLoE7ZgSs2xER4SPQO7b5lZHDXiWzQkB2FGjY1NZDTM8i
 sz7/t+vf9AECO6ihmAAAA
X-Change-ID: 20241211-meson-clk-cleanup-24-41cbe1924619
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LJVxQf7NdIcUrlOkMpBxQHCXouOiNXQbPohW3ECQIQk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+yeQ57OOFVKwuT0WWvU3Gndq1dETWjEaNQW
 UlN7cL+DN+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPsgAKCRDm/A8cN/La
 hYKJD/9+M0TmYQdd3/rSQbthQJaQj5IMrKfVvlmGpsIup6XF2eDdZesRI9d0dx3qbUusH/ZkSBv
 dFZ360Mkrh3KmVvSMhQ27HhAnCl+4ikVzKiOFWsW40pJ1Njyi+OPi83jqPuQM0VRxmK8wsX+Je+
 3WnON3E8oX0i8v+AKXZFoygZwe4eoDSEdvA0Ecy1yZCZzRB6ZBO16GElQmdAU60A6/6A1F8YJv0
 ixMR1YspvPjr2R2fXeM6RCgfhQ48u9Q98Tdmqv9jxuWIviHOF6TC12EinFxTXb+au6aOmHl97EN
 6lb9D4kh+xZ9hxHHEnaSvdEWG2i2SbFHo4vpe5fODA56uGN8f5uDAfzQATLlS98PxlaHqfOBxJp
 3rTkjnghRfIK42Pxpyeygsl/VHWjEHiF89WCvEPBuuXvfGp43PBK0HtI6s1y1GrLHph444DO84F
 RnBQNrTWcHKJCPhERyUUB/0C7yTD/ndbZgmZzqnhIPA/B1ZrOxOcIdCRwd788VxIHo0YklB1Rr3
 vLfVn0J1WNWl8JH5TY9UB2Q7jxZCN3U0mGZ5I3rVDjuhEO3S4O/57FXFIz8QewKGLhNXTAROkDl
 d6t3WjrO19YZUDhgJGUOLsjPoKld6FZhT1/qRCLM/rA/1Luto/JmY34J2zJhIJDZ7YQTmI8EqJZ
 lnruOJj7adMCW/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082714_350641_639B4D31 
X-CRM114-Status: GOOD (  17.69  )
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

The work on this patchset started with the submission of the Amlogic t7
peripheral clock controller [1]. This controller is fairly similar to
existing controllers. Once again, it redefines the peripheral clock macro,
the probe function and composite clock helpers, even if it is almost the
same as in other controllers. This code duplication trend has been going on
for too long and now is the time to properly address the problem.

There is clearly 4 parts in this patchset. These are sent together for v1
to show why what the ugly first part is useful. If more versions are
needed, the patchset will be split in 4.

While all controllers are doing more or less the same things, tiny and
often pointless differences have emerged between the controllers. This
makes it harder to exploit SoC commonalities.

The first part of this series deals with that problem and realign things
up. There is nothing complicated going on there beside renaming. It is the
ugly stuff, yet necessary, we have to go through to get to the interesting
stuff afterwards. There is one change per controller for the review, with
the intent to squash this into a single change on application.

Second is the factorisation of the probe functions so those stop being
copy/pasted in each clock controller drivers.

Then the clean-up and factorisation for the PCLK macros, again to stop
copy/paste but also the silent use CLK_IGNORE_UNUSED.

Finally the introduction of macros for composite clock definitions. The
same pattern as the for the PCLKs started to appear on s4, c3 and t7. Done
properly, this could also help reduce the verbosity of the older
controllers.

With this, the c3-peripherals controller may be used as an example of what
future similar controllers should look like.

After this, there is still some house keeping to be done in the amlogic
clock drivers:
- Moving remaining reset drivers to the reset subsystem
- Proper decoupling of clk-regmap from the clock controllers
- Reduce verbosity of older controllers with the composite macros, where it
  makes sense.

[1]: https://lore.kernel.org/linux-clk/20250108094025.2664201-6-jian.hu@amlogic.com/

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (26):
      clk: amlogic: a1-peripherals: naming consistency alignment
      clk: amlogic: a1-pll: naming consistency alignment
      clk: amlogic: axg-ao: naming consistency alignment
      clk: amlogic: axg: naming consistency alignment
      clk: amlogic: c3-peripherals: naming consistency alignment
      clk: amlogic: c3-pll: naming consistency alignment
      clk: amlogic: g12a-ao: naming consistency alignment
      clk: amlogic: g12a: naming consistency alignment
      clk: amlogic: gxbb-ao: naming consistency alignment
      clk: amlogic: gxbb: naming consistency alignment
      clk: amlogic: meson8b: naming consistency alignment
      clk: amlogic: s4-peripherals: naming consistency alignment
      clk: amlogic: s4-pll: naming consistency alignment
      clk: amlogic: meson8-ddr: naming consistency alignment
      clk: amlogic: drop meson-clkcee
      clk: amlogic: add probe helper for mmio based controllers
      clk: amlogic: use probe helper in mmio based controllers
      clk: amlogic: aoclk: use clkc-utils syscon probe
      clk: amlogic: move PCLK definition to clkc-utils
      clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
      clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
      clk: amlogic: introduce a common pclk definition
      clk: amlogic: use the common pclk definition
      clk: amlogic: add composite clock helpers
      clk: amlogic: align s4 and c3 pwm clock descriptions
      clk: amlogic: c3-peripherals: use helper for basic composite clocks

 drivers/clk/meson/Kconfig            |   13 +-
 drivers/clk/meson/Makefile           |    1 -
 drivers/clk/meson/a1-peripherals.c   |  995 +++++-----
 drivers/clk/meson/a1-pll.c           |  124 +-
 drivers/clk/meson/axg-aoclk.c        |  153 +-
 drivers/clk/meson/axg.c              |  237 +--
 drivers/clk/meson/c3-peripherals.c   | 2055 ++++++---------------
 drivers/clk/meson/c3-pll.c           |  245 ++-
 drivers/clk/meson/clk-regmap.h       |   20 -
 drivers/clk/meson/g12a-aoclk.c       |  238 +--
 drivers/clk/meson/g12a.c             | 3316 +++++++++++++++++-----------------
 drivers/clk/meson/gxbb-aoclk.c       |  123 +-
 drivers/clk/meson/gxbb.c             |  611 ++++---
 drivers/clk/meson/meson-aoclk.c      |   32 +-
 drivers/clk/meson/meson-aoclk.h      |    2 +-
 drivers/clk/meson/meson-clkc-utils.c |   89 +-
 drivers/clk/meson/meson-clkc-utils.h |   89 +
 drivers/clk/meson/meson-eeclk.c      |   60 -
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   62 +-
 drivers/clk/meson/meson8b.c          |  746 ++++----
 drivers/clk/meson/s4-peripherals.c   | 1160 ++++--------
 drivers/clk/meson/s4-pll.c           |   82 +-
 23 files changed, 4437 insertions(+), 6040 deletions(-)
---
base-commit: 2c37e1c671428002519e7615d786b9b692261052
change-id: 20241211-meson-clk-cleanup-24-41cbe1924619

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
