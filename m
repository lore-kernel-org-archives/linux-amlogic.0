Return-Path: <SRS0=+FUZ=FD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BFDC3E8C5
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Nov 2020 20:51:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27C720786
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Nov 2020 20:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vWF/fi0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AHfp4NMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27C720786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5x+q1tYNNlOfbLpTMoYRnL2KJ3A0IL12Oxmqa05lcU=; b=vWF/fi0eeXUDCIFOw81FSRdBpP
	vg1/CeCMbc3xjrJMp73MK9aglqlu149kVYU3/9c2nhMY+j+LxfdhjwIyfzSBs0XaRWbidO1rTX9FY
	IeykueZ+QHuPnUl/MFP22msO7RyjgZ/SCymol1G1K83gjtycqagdBj+n9L/6UPUzGVx0A62bYCSeX
	jTdYaWb2m/We7gmvSpOAZDP7vc1Y1bVcPTYErlH1besCy6YKDsHmwsHUHJinrah0R1pSmG5COFaMN
	baivHyIc2ZQI2R4gq/McAbZGPLwXpnmTn6GeHPnRK7r9KilHoP4LBnEq/uw4khAFuWPFb5CpXFRhr
	EjtxbVZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjTei-0005md-E3; Sun, 29 Nov 2020 20:50:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjTeg-0005mH-2S
 for linux-amlogic@lists.infradead.org; Sun, 29 Nov 2020 20:50:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id m6so12622927wrg.7
 for <linux-amlogic@lists.infradead.org>; Sun, 29 Nov 2020 12:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:message-id:date:mime-version;
 bh=11SVmcLjK6UeFfGAKdcpke7xMCZ9FSgIq3yT8lzKa94=;
 b=AHfp4NMRjG8JWl/9iTpWPVMuwaSEbag4HV3CNGrEb/gF8xalghqVhjFJfXp5O0+N/A
 R5Fknc1GS9LAIMwxVW4AZtCF5Q9EBT+v9fPMjs3d1Hvn8YI/ls5LLNj7vKWwhGbBdz9K
 18zSm6Dp/ZdnV8x7HQ/pSfW4PdQIDI6/afWUC4lcmd5xCpeB8bX+EYDNQjVcvlNCBxdx
 0wGeacQB2jt6fRXIPaKJCoNGdXFZEdWtjx86poYnkhJtoXiLvrJdE5NkewzmEaH9N44E
 mYPrLidjCXwP7DeHvOjVYdjJW/nXkK01gKh0SUuShg2XQ0BjIqZsoGbtbke58qoynetl
 W1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
 :mime-version;
 bh=11SVmcLjK6UeFfGAKdcpke7xMCZ9FSgIq3yT8lzKa94=;
 b=XgLxiXpLBXRUGZlPDdLFNfpi+pBHBsAooKOagFMkiaGinktOFRm0QX+M9NwkK0Sm+D
 mGSPIZaQkYGe02oaXaQK9W+9KNvLrD2UEfxM0DIhnZaf04XS/JpuwZysTlKg20GwwD90
 xe8xkVq86pRO6yGdZ88NoZ3J8S+BteSrf558eWyrzEL+GMgrGxX4yJKj+++N80Eq/2CP
 9voQ1UA2MKVYX5GTds/MMBMIiMz2u2olMkyGFuFBCVd8PoOhy3sCdJmnoUtoItdrlw6k
 1VKcMKp5IsAK9lOuL1BCetjZcTddCh8r2X8CYAkpTfKW2tgTKskSQeoZpyWuFbHQ0iwV
 AGUg==
X-Gm-Message-State: AOAM533CoUizkpPaQXkspTnKglm8EhPbmBdv5YQPcjuPezxOsxYjRtNl
 dyMLOBbM9dB/uA5fDobe4VipSQ==
X-Google-Smtp-Source: ABdhPJyz9WSYSxftKGwJFmeQpGKUPueZj3cuy71FZGjwc2q0bk77rAfZOnzfT4/JFUi59k2stggxEQ==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr24466673wrw.145.1606683042908; 
 Sun, 29 Nov 2020 12:50:42 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id k11sm16065846wmj.42.2020.11.29.12.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:50:42 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL]: clk: meson: amlogic updates for v5.11 
Message-ID: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
Date: Sun, 29 Nov 2020 21:50:40 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_155046_257836_E9BE7467 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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


Hi Stephen,

Here are the updates for amlogic clocks for v5.11. This is based on your
clk-hw branch, instead of the usual rc1, since it depends on clk_hw
stuff you've already applied.

Please Pull.
Thx.

Cheers
Jerome

----------------------------------------------------------------
Amlogic clock changes for v5.11

* Add MIPI DSI clocks for axg and g12
* Make it possible to build controllers as modules
* Fix Video PLL clock dependency

----------------------------------------------------------------
Jerome Brunet (2):
      Merge branch 'v5.11/headers' into integ
      Merge branch 'v5.11/headers' into v5.11/drivers

Kevin Hilman (2):
      clk: meson: Kconfig: fix dependency for G12A
      clk: meson: enable building as modules

Neil Armstrong (6):
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
      clk: meson: axg: add Video Clocks
      clk: meson: axg: add MIPI DSI Host clock
      dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
      clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/Kconfig             |   7 +-
 drivers/clk/meson/axg-aoclk.c         |   5 +-
 drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h               |  23 +-
 drivers/clk/meson/g12a-aoclk.c        |   5 +-
 drivers/clk/meson/g12a.c              |  79 +++-
 drivers/clk/meson/g12a.h              |   3 +-
 drivers/clk/meson/gxbb-aoclk.c        |   5 +-
 drivers/clk/meson/gxbb.c              |   5 +-
 drivers/clk/meson/meson-aoclk.c       |   4 +
 drivers/clk/meson/meson-eeclk.c       |   3 +
 include/dt-bindings/clock/axg-clkc.h  |  25 ++
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 13 files changed, 979 insertions(+), 11 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
