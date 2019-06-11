Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12700C4321A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:38:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA71620896
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 12:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QwCB1Md1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CZ9GRlYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA71620896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2dHUNp4opcvucVSTXLwMqNRpHgM2GRzj0pwElQs0We4=; b=QwCB1Md1OcjsX/
	UhKcV2jcznqwfA6GMkfxrpOIFtkc3YAx+ekTQMRLUslW9xj//Oedgz+L/qLyvL7L72NPf0gAfWJSR
	lKt5PES6szQHIdmnlHjMO9+Ac/m/4Qrjn/OiIjbiIJ0wcc1tuHdaYWpAfZFplGL7zqaI3SJ86LPyY
	ykgA8/4mAoX93xlHq07iM+c7s0AlxAp0HsDh9d0w/yjBck1YSn85HCziTj0rl4bxUOY9Zoew8T3Uf
	Yw5nPUl+oNmwnv8+wBUXryPqROe6wdrGY6t83BdP4Gqee4T/8C04Cf0HT+BgDfp5bC76yl6o7PK1W
	EEds1M20kdfbkcI9d5gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hag2h-0003YA-K3; Tue, 11 Jun 2019 12:38:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hag2f-0003Xe-6b
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 12:38:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id v14so12848226wrr.4
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=ua8dbQ0PYMtOfmOmHj3FX1FYigU/RZxoFrS9hw3wCAQ=;
 b=CZ9GRlYpaqHJpE3ea2eQKpeffCqvJwydOasniw/mWTGIYb2/7Q9jQEBjRnA6q7yLz9
 9WeZHyMwCYqaLq9gpJ/n5SFpyQtm7/kTidZGOi3FryD5iUN4txd71STUpNFuCrPvQ6f7
 S4EV9gPCkxudayX5Q5qOJ/qi1sUBRQxY9ZqpfqH/uIuT2eOarVkPXuRN+H2ii20y34QD
 /D7z3WqZ4Su0KTEisKVqzn8Nb6DxJejnHeotlUtQ9qRBpYsa5qH+2WBvTQM0NvvjHBqG
 9sb+9LU2kJcr1EqQ/DaRBuczU6mjS/HqmyQFPMavCkV/p6XlZ3aTWvdi3Zy5uIgLLeZV
 PWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=ua8dbQ0PYMtOfmOmHj3FX1FYigU/RZxoFrS9hw3wCAQ=;
 b=bAblIPPjzxoABmQibiN6Eyiht/GXl26of94wOvRIBR1l2q+xA3xqJbTji5DuINRStc
 qD8FxSHuK+mqYElqYGakkXRnb9tHPHMNYpwCrZtD/ivr5wZUYNHXifmCf9JMLnMp79Pj
 gpCm7uTZB992nw048CFlJkNLi1ym0XNxJed9NxfdOaI0dbqgNAT2LtYDOunUkrigAw+0
 bxm3OyMqPJOeB4Kj9mpUJdKVcjHbqNW48J90OGJ/5VthWdynf5ZTI5CYEOsAxX2mpwev
 KZ0MFVxViZjqOGTMPdiBh5tGDyKBktNaS8hrjhhdbRtzvAzA+iZMICvl4lN/Jo50z1LA
 URzw==
X-Gm-Message-State: APjAAAWh6kDZPGwo7xiXIr216zjyD93u49TAIPB0j8RgY4GfSlpWYZbh
 G93iAYIumgLX6aXDJnOhDe6eAw==
X-Google-Smtp-Source: APXvYqyWtPPjjPWqEp7Z0mPXz8EwfU+kOhNinox32AhFZYRHexAJvfx90c/9HQU008uxA30BgBwutg==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr4824737wrv.310.1560256698779; 
 Tue, 11 Jun 2019 05:38:18 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm2770805wmf.17.2019.06.11.05.38.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 05:38:18 -0700 (PDT)
Message-ID: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: update for v5.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Date: Tue, 11 Jun 2019 14:38:17 +0200
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_053821_242638_CBF31F35 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear clock maintainers,

Below is a request to pull Amlogic clock update for v5.3 based on the fixes
we just send. This update add the init() callback to the mpll clock driver
as discussed in the previous cycle. As promised, the rework to register/deregister
will follow.

Apart from this, we've got a fairly regular update, adding a bunch of new
clocks to several SoC families. It also adds support for g12b derived from the
g12a, which explains the significant line count in the g12a file.

The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:

  clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1

for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:

  clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)

----------------------------------------------------------------
Fix mpll fractional part and spread sprectrum issues
Add meson8 audio clocks
Add g12a temperature sensors clocks
Add g12a and g12b cpu clocks

----------------------------------------------------------------
Guillaume La Roque (2):
      dt-bindings: clk: g12a-clkc: add Temperature Sensor clock IDs
      clk: meson-g12a: add temperature sensor clocks

Jerome Brunet (10):
      clk: meson: mpll: properly handle spread spectrum
      clk: meson: gxbb: no spread spectrum on mpll0
      clk: meson: axg: spread spectrum is on mpll2
      clk: meson: mpll: add init callback and regs
      clk: meson: g12a: add mpll register init sequences
      clk: meson: eeclk: add init regs
      clk: meson: g12a: add controller register init
      Merge branch 'v5.3/dt' into v5.3/drivers
      Merge branch 'v5.3/dt' into v5.3/drivers
      Merge branch 'v5.3/dt' into v5.3/drivers

Martin Blumenstingl (4):
      dt-bindings: clock: meson8b: add the audio clocks
      clk: meson: meson8b: add the cts_amclk clocks
      clk: meson: meson8b: add the cts_mclk_i958 clocks
      clk: meson: meson8b: add the cts_i958 clock

Neil Armstrong (3):
      dt-bindings: clk: meson: add g12b periph clock controller bindings
      clk: meson: g12a: Add support for G12B CPUB clocks
      clk: meson: g12a: mark fclk_div3 as critical

 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/axg.c                            |  10 +-
 drivers/clk/meson/clk-mpll.c                       |  36 +-
 drivers/clk/meson/clk-mpll.h                       |   3 +
 drivers/clk/meson/g12a.c                           | 843 ++++++++++++++++++++-
 drivers/clk/meson/g12a.h                           |  41 +-
 drivers/clk/meson/gxbb.c                           |   5 -
 drivers/clk/meson/meson-eeclk.c                    |   3 +
 drivers/clk/meson/meson-eeclk.h                    |   2 +
 drivers/clk/meson/meson8b.c                        | 154 ++++
 drivers/clk/meson/meson8b.h                        |   8 +-
 include/dt-bindings/clock/g12a-clkc.h              |   1 +
 include/dt-bindings/clock/meson8b-clkc.h           |   3 +
 13 files changed, 1083 insertions(+), 27 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
