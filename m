Return-Path: <SRS0=bhK5=27=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3664C282DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2020 16:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85287206ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2020 16:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYLVjy14";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0KIDPA3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85287206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IBiE4bnoKrj6DjDx5/4J8NchLMyH/milvelggzxsq5w=; b=bYLVjy14cno+6K
	Ut/TvFlVpqf15b89CWNIVQopOErRZzP7TSYjRhBt2M4tXTD0YgSILRbF5jqQLnZHt1bTAGNoH4ffC
	Cao/hyD6BVXDlR7hPXCNhjWiuOVoEj+Ho3931E5BsSugiMx1jjw8bAg5TU1sdJ2k8jf0yk+YYFWSX
	12Duw3f9Oy+q3v/17cfQn903+NHZlhcFEL/1prSMEWRgMIhlMOWO0yrGZTuxCbImKhHx/4eRlbZG+
	I97ma0SwPqgnMMN8tn+CGN3ci+JnFzvsiyM3u7A/7UIlcUwy3QxDR2UzQbh4E9iPwQDZmVzs3okTj
	4rTNw69tYdk0zcp3iJxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipwt2-0001T7-1c; Fri, 10 Jan 2020 16:11:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipwsy-0001Sa-VH
 for linux-amlogic@lists.infradead.org; Fri, 10 Jan 2020 16:11:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id u2so2552024wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 10 Jan 2020 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=11CBeVx0qG2qVwiQYzkWGfj3hi25ILYcyR118XXNZfM=;
 b=0KIDPA3k6hM19fhd3wV4dg4R6+PIUPXb0JNDvXktMvDixTehCJqFmxFGbjBvRGTn/a
 hPPbPMoW5KnnH35V5t5q37OU+fOkboVn43+Wfyw3J2tB9ykhUk2SfTFTWr1orL9Xeqq7
 UU1DvT8R+Qj4SBbeVxibYwx/YOghcGdro1/sV/DHr20L8+H7TlXmKGQGqqymtR0+NvXO
 6fWvrmtm4WORl+ROmc3V7G4KaPfvKpbzQRBIVy8XAIMvMVcZ6mhLzbKpXSCtQWyTVvYw
 K9YID78dEy4MTviHeuxJ9GZ+f/+K4pQ1eHxKmQBGC8Qv8MLBmZoIYBqQMCGsRDQ+pE0S
 g6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=11CBeVx0qG2qVwiQYzkWGfj3hi25ILYcyR118XXNZfM=;
 b=FQIjSQsE8qsV/bJoItIpYHAL4zOyrElrYxZ4V0aAWfU1qKpxNufoOK0LbxvnRlIXXR
 BkGyQ9pIpgP/0GLENX83a5warh1SnyOZErAtQWfgnjBqBzSbAw1/j5cHZcAdp6skv9Vk
 JR3jiK0O4tss6NML3UJraff7HnUId/z9FKG62+oBNp1opscLJQUJIeSDIaZEgDd61McR
 41rtEiyF8fPqojUUSDQGNzI5qtA0lJ2hNwBuVuzws8yu18IP3nQhAYZYLiFygTzfeMON
 qn06roqjfn5zfSXSVGxKAOTZJejA/wsL6622rKwFkRY7OVPcLXPhrtaoXJDR64Sy9uxb
 HqvA==
X-Gm-Message-State: APjAAAVTDsY6EY3Cl8BEHjPL1YvflJoyQFMUYuiEhdqwkP0qRn9zyP7V
 slDLDGyHact13GZIbdatzoQq4Q==
X-Google-Smtp-Source: APXvYqwVR7JRuUkKA5QJmBxEY0+sSIt5jRCWtZzf6A0xlR5i8Dy47hKoLjJSgIg2vQ9n6xNxHw1+FA==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr5260601wmg.38.1578672703762; 
 Fri, 10 Jan 2020 08:11:43 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d8sm2701059wre.13.2020.01.10.08.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 08:11:42 -0800 (PST)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [GIT PULL]: Amlogic clock updates for v5.6
Date: Fri, 10 Jan 2020 17:11:42 +0100
Message-ID: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_081145_052308_59160AEE 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen

Here are the updates for the amlogic clocks for this cycle.
The bulk of it is a clean up of the 32bits SoC clock controllers by
Martin.

Cheers
Jerome

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.6-1

for you to fetch changes up to 64c76b31774db5a0c0ce8df13aef618912136e32:

  clk: clarify that clk_set_rate() does updates from top to bottom (2020-01-07 11:31:47 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.6:
* Add meson8b DDR clock controller
* Add input clocks to meson8b controllers
* Fix meson8b mali clock update using the glitch free mux
* Fix pll driver division by zero init

----------------------------------------------------------------
Jerome Brunet (2):
      clk: meson: g12a: fix missing uart2 in regmap table
      Merge branch 'v5.5/fixes' into v5.6/drivers

Martin Blumenstingl (9):
      dt-bindings: clock: add the Amlogic Meson8 DDR clock controller binding
      dt-bindings: clock: meson8b: add the clock inputs
      clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
      clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
      clk: meson: meson8b: change references to the XTAL clock to use [fw_]name
      clk: meson: meson8b: don't register the XTAL clock when provided via OF
      clk: meson: meson8b: use of_clk_hw_register to register the clocks
      clk: meson: meson8b: make the CCF use the glitch-free mali mux
      clk: clarify that clk_set_rate() does updates from top to bottom

Remi Pommarel (1):
      clk: meson: pll: Fix by 0 division in __pll_params_to_rate()

 .../bindings/clock/amlogic,meson8-ddr-clkc.yaml    |  50 +++++++
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   5 +
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/clk-pll.c                        |   9 ++
 drivers/clk/meson/g12a.c                           |   1 +
 drivers/clk/meson/meson8-ddr.c                     | 149 +++++++++++++++++++++
 drivers/clk/meson/meson8b.c                        | 124 +++++++++--------
 include/dt-bindings/clock/meson8-ddr-clkc.h        |   4 +
 include/linux/clk.h                                |   3 +
 9 files changed, 291 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 drivers/clk/meson/meson8-ddr.c
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
