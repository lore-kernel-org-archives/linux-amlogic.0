Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000CCCAC598
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Sep 2025 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jfGHYVOCk/yNiNE2tLkbBVOVwRqQTluP9RToA35Q/ZE=; b=cufqhHB/6TXIqz
	gqoOAwUlVPdHBoA/ekd1x7Aui3aAG3iJgfL/wez2O78ooqgEJBFLSPf3SKMSVM2ofE5VjXz2/rISG
	zBqs4CST9IXD4zm/4D2FXI2g7eX0BQvvX9cOmDYcPISRbB5J3XybFlCD/eFUqLk6NeUVwsMOOUPbo
	hcMfcq490WKvQiP0APpgO7gKnHxtsMtiFnzbGK/yc0WOvQo5WXUTzXW7wroPm9+5blZuCUc8aePc7
	MOi6kezVhnie+h+2l98OMipMGZhqdG0Z3semCgRBD50ZgsWvD0TvaTMebG/Srhx1/756RkVHe+i6L
	l8OhuM6RK4OJSSpKuyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Tk-00000003T8o-0rTt;
	Mon, 15 Sep 2025 09:26:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Tg-00000003T7C-3tw0
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Sep 2025 09:26:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so2961165e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Sep 2025 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757928387; x=1758533187; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hs6GWuV18CGeToReruv/f07z6TMgsUaRPyZmMmtsSrc=;
        b=wmoMFXo9ldUm7YoTW8tG7aRI3xA/fz/cDDa8FXdrPaq8qWgLGG1VLXP3M58DbkuAOb
         DdIWpII77afYDOvlEim84gJu46Hd34Y+fAuXhn54kKsNNk+3/FNCgPPWvdG75Jo+bJqz
         MOIiG0JF7MXpF9iTq82xtjIdOMJH3CL0/YW7WLNemQAyU4+w01I2ogI7J/SfwVFg+JVC
         dgOqcEMtXAGLCGwe60rvXXiwjfM2wFUTosFKwZIkJIqxxcudixkuVhNQywDB0ps2iiXl
         hM70+A2CwNhwO/ji13x9x6P3prTWe3OCuJslTkHnBJu8+dy9yemh2tgwEy2nxukJE4ym
         0hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757928387; x=1758533187;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hs6GWuV18CGeToReruv/f07z6TMgsUaRPyZmMmtsSrc=;
        b=qmXzsAvklxfGnSVXMH8LhnA1tfu3cftf1rpBZLpYNaMX/+p0//UfdK3wI2IEblXOZK
         mNp289zP6IZfJkS1TESopfvXJkrB7NDUIBLzROTmPZKMAfB5sYHOX5iXQg0SVWkXLIk1
         amEV1GOU9Ti62p2cqDUGwkc1jjbDIV3BfNC9IFm5zRQuuCcdkfQAET6gnjIzuKde/0ao
         mpRoj4n41AkMJsuJinGboeTqwC/WkA7tOsMSDJeAxFXs/657Ouojdj/1E8EmDJXKntzX
         ovGKbv20h2+ixpdmddNfUe0/jpal94NyRTohCHY2lfdA5sw1uv7eRdo6UX/wdcTeJFhs
         sYQA==
X-Forwarded-Encrypted: i=1; AJvYcCWsZ5qZn53f9v4BTPTir1Fb92N3MEITcCHOs1lFDxZvOxYpG0eM/te0zF+hbhCcALV6r1Rz/Nkt+7jxGbsN@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrUUhSTlTUwjv42O0JliRdi118fI5C6DyhQlJlI6AWsqRm8Xu
	hoQdD3mTKC/Qjy7lt32mFMjAm5C3D/BreHEK0k5LsJj270JrugK19AoAoa4HqaYVetC3YXVG6RX
	0tkmd
X-Gm-Gg: ASbGncv968EZKdeOCcUjenz8zmt7liaxramt23wjOe9A8GXfSXrsJd5BC96lDI8w1Fm
	ohkzNS22xnzJiZRzToFgZMCiDZ89JGd9EA0MVLhxhysrKbbKlSs2W8gTTnQVosNS4qg0d8lQ9T1
	TW4Ekicy6jbIaS9jUFBNX3cJwaEq9m009m2CpoaKjzMVFea9q7MGmOuis4DxZJ+Jq0E7H28SWJh
	osl1BcjJ20p7YHz0r4bXBczqkgowuGpT1Kry6TTVMcrl8RRQMGpRUBeEGvgBSy7jn/vuKOpPvtN
	4ShEI73pWizrBdBHq4ucr3tdKapsD2Wp15IaF8b9HHEZcBIpFfyIZrwR7wY16/KQ+qoa4YdHmH3
	vc2AOL4UUiy7XJWWQgI3u2A==
X-Google-Smtp-Source: AGHT+IFgxxLS2pJg24kRWNPyu3hgcRcX74JPOpS67jGIEm8dm9wZLjy1miiz+i+z7lmiREfwu/WfaA==
X-Received: by 2002:a05:6000:220f:b0:3cd:590c:61e0 with SMTP id ffacd0b85a97d-3e765a03542mr12295242f8f.54.1757928386771;
        Mon, 15 Sep 2025 02:26:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:508e:f12d:6dca:3a75])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e94163c03dsm7324441f8f.63.2025.09.15.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:26:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.18
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Sep 2025 11:26:25 +0200
Message-ID: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022629_103868_0A8A8769 
X-CRM114-Status: GOOD (  10.79  )
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

Here are the Amlogic clock updates for v6.18.

This is mostly a clean up of pointless differences between the
controllers which have been accumulated over the years. Hopefully, this
will help with the maintenance and simplify the review of the incoming
new controllers.

Overall, this is just simple stuff but since it touches every Amlogic
controllers, the diff is fairly large.

Please pull
Cheers

Jerome

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.18-1

for you to fetch changes up to 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf:

  clk: amlogic: c3-peripherals: use helper for basic composite clocks (2025-09-04 18:27:12 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.18

* Factorize clock controller probe functions
* Clean up peripheral clocks definitions
* Clean redundant composite clock definitions

----------------------------------------------------------------
Jerome Brunet (13):
      clk: amlogic: naming consistency alignment
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
 drivers/clk/meson/meson-clkc-utils.c |   86 +-
 drivers/clk/meson/meson-clkc-utils.h |   89 +
 drivers/clk/meson/meson-eeclk.c      |   60 -
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   62 +-
 drivers/clk/meson/meson8b.c          |  746 ++++----
 drivers/clk/meson/s4-peripherals.c   | 1160 ++++--------
 drivers/clk/meson/s4-pll.c           |   82 +-
 23 files changed, 4434 insertions(+), 6040 deletions(-)
 delete mode 100644 drivers/clk/meson/meson-eeclk.c
 delete mode 100644 drivers/clk/meson/meson-eeclk.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
