Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5AEC282DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EF2218AF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kAVC/eF0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2UMQGp/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EF2218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EzjD9A1mXQBag6WTdg0jCb1O1LRq45pUFGpsergpe3E=; b=kAVC/eF04bLtBw
	yQzD9i2l+AoOY4rXU4KVyxDjtXI/2vlmkPYmy37CYrB3zfjzq+6m6CX3xOfqZ3v6um9TdKswtKJNe
	fCBP/l3uRXlyvu8aTlFHubDgcPih9deNbMF8pArE3w5pu9F1aJ5UnE+ZdnnTojPxSI+qywz5F952p
	jXDc1YSi7FS8FD472pAUSCPBmGYVQFwiOs6/Ju5ZAN4uG2rM07OoIQqmeSIukY+vTetDGMU8pKOW4
	DF+Wy5yKUroK49NCWzSQ5AEsXugdda9XhRffLF1+5d//6k0OokU6AOJSpXSRJr/5VS6e/63CRQj6e
	yn1vOsu+5WX+xllKmnKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpYPD-0005Ol-Sv; Fri, 01 Feb 2019 12:58:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpYPA-0005N1-N9
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:58:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id d15so6036921wmb.3
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJocF0Jbo22IO1ME0IAzs50ImWTx0z6/2nWE1aOgS/c=;
 b=2UMQGp/wdQTfPMj65J4sG1Jt3uszaS9uR8Luk9GiR2+1U0W0VHR7CxVcXz8DXFiFiO
 vMIsC+2EDvHQAj3sZV096K+13GKICypHfm8PE3n65XSCBuCg2l8UoOn/dGIlxIPhrVTR
 9pXFAcHodsAMaUWybgZXfJuK0qy3ALd3QExgpQv2Xsim3QhukNBeXeD2Oy4mVx4i2OfZ
 ur0pF6VmPYK9SExjrmiDf6A33icw05EsHrMe6jaAINK/EyJSB+Ef1sWzKNda7Es3trIh
 sdKrlmYdL90yXdQX+c8a8CIqWEEKVRAQdpduXNlP6qyxML0CYVY6AqrmvlBU2KgHuJ0z
 yTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJocF0Jbo22IO1ME0IAzs50ImWTx0z6/2nWE1aOgS/c=;
 b=bUqY3srVuKLu6ViNI+uqY1imhI1HFyCYRQs9P27w9Y6z9b8bpOEPfQx/Q9qK9HmKEN
 S+7CUdnCVxWKblHxBWo5n9wPv+apEYwIcTdb84TcW8igF+DlPvFlKAbVI0OsmCVgTqGa
 NhOae9oXTNDUKW0l06ULVi+vYOoVXR9/Y+JItE0HQxKyPks4H6QjD9HqpGuDev4Qw037
 YALR8rNmcWPn8bIsK3IxVSct/0xONmSOMODxwyOcXJdIrT0LXvBAwR72AaRnhMvh/J8Z
 gIH5FziP0MTtN6wSYCZlIXKriESRlMEF7M6kFZXwlGv0VcOsFEV4DcxIeSf3Pr4cPwJX
 Q7ew==
X-Gm-Message-State: AHQUAubqA/sERyMABWhvfNMnyAeuLdUdwtZly48vrKxSDCiIK4Z4aiCx
 vnZ5+/CiYgadeU6ZxBgcRUq4lg==
X-Google-Smtp-Source: AHgI3IY3chUMWFOccpOEDA94LuKZQ7J2e9+gk15jn/UVqjadzFBC2ni+HopknzEYppWrXps01vMcLA==
X-Received: by 2002:a1c:2d42:: with SMTP id t63mr2479868wmt.9.1549025926970;
 Fri, 01 Feb 2019 04:58:46 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id w16sm8709750wrp.1.2019.02.01.04.58.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 04:58:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 0/4] clk: meson: rework drivers dependencies
Date: Fri,  1 Feb 2019 13:58:37 +0100
Message-Id: <20190201125841.26785-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_045848_752166_C85FF6AC 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The goal of this patchset to clean-up the dependencies between
the controllers and the different clock drivers provided in the meson
directory. The expected result is that each controllers can pick the
the clock drivers they need, without necessarily pulling everything.

This is becoming important as we are adding more and more controllers
to support new amlogic SoC.

Patch 1 and 2 are out of the meson directory but have been acked by
Stephen.

Changes since v1 [0]:
 * Squashed patch 4 to 14
 * Sort Makefile alphanumerically

[0]: https://lkml.kernel.org/r/20190128180430.28689-1-jbrunet@baylibre.com

Jerome Brunet (4):
  clk: export some clk_hw function symbols for module drivers
  clk: meson: use CONFIG_ARCH_MESON to enter meson clk directory
  clk: meson: axg-audio does not require syscon
  clk: meson: rework and clean drivers dependencies

 drivers/clk/Makefile                          |   2 +-
 drivers/clk/clk.c                             |   3 +
 drivers/clk/meson/Kconfig                     |  84 +++++++---
 drivers/clk/meson/Makefile                    |  27 ++--
 drivers/clk/meson/axg-aoclk.c                 |   4 +-
 drivers/clk/meson/axg-audio.c                 |   5 +-
 drivers/clk/meson/axg.c                       |   5 +-
 drivers/clk/meson/clk-dualdiv.c               |  10 +-
 drivers/clk/meson/clk-dualdiv.h               |  33 ++++
 drivers/clk/meson/clk-input.c                 |   7 +-
 drivers/clk/meson/clk-input.h                 |  19 +++
 drivers/clk/meson/clk-mpll.c                  |  12 +-
 drivers/clk/meson/clk-mpll.h                  |  30 ++++
 drivers/clk/meson/clk-phase.c                 |  75 ++++++++-
 drivers/clk/meson/clk-phase.h                 |  26 ++++
 drivers/clk/meson/clk-pll.c                   |  13 +-
 drivers/clk/meson/clk-pll.h                   |  43 ++++++
 drivers/clk/meson/clk-regmap.c                |   5 +
 drivers/clk/meson/clk-regmap.h                |  15 ++
 drivers/clk/meson/clk-triphase.c              |  68 --------
 drivers/clk/meson/clkc.h                      | 146 ------------------
 drivers/clk/meson/gxbb-aoclk.c                |   4 +-
 drivers/clk/meson/gxbb.c                      |   5 +-
 drivers/clk/meson/meson-aoclk.c               |   2 +
 drivers/clk/meson/meson-aoclk.h               |   5 +-
 drivers/clk/meson/meson8b.c                   |   3 +-
 drivers/clk/meson/parm.h                      |  46 ++++++
 drivers/clk/meson/sclk-div.c                  |  10 +-
 .../clk/meson/{clkc-audio.h => sclk-div.h}    |  16 +-
 drivers/clk/meson/vid-pll-div.c               |  10 +-
 drivers/clk/meson/vid-pll-div.h               |  20 +++
 31 files changed, 470 insertions(+), 283 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.h
 create mode 100644 drivers/clk/meson/clk-input.h
 create mode 100644 drivers/clk/meson/clk-mpll.h
 create mode 100644 drivers/clk/meson/clk-phase.h
 create mode 100644 drivers/clk/meson/clk-pll.h
 delete mode 100644 drivers/clk/meson/clk-triphase.c
 delete mode 100644 drivers/clk/meson/clkc.h
 create mode 100644 drivers/clk/meson/parm.h
 rename drivers/clk/meson/{clkc-audio.h => sclk-div.h} (54%)
 create mode 100644 drivers/clk/meson/vid-pll-div.h

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
