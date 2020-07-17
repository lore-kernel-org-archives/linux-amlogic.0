Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C1C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 09:56:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27ADD2070E
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 09:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/+8bK3y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oUjA7LiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27ADD2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0AGgSqMY2Iz9jYF1dTkaC4Y3LDV1UUvSFHCo30rqnS8=; b=Y/+8bK3yOESiDaKihdW0fwJxH1
	w/7J7E9+yZ3yYsaxzM8ioWQpTxfh5dPGIH+aGCzLQ7II1MIAQUaJ/g4NcvMA6rduEDDVHAxldbkVO
	k0JQwH0/SHQDGLjmoJ2KVfsZlcTnuhblhhf8TZxzVHEiYGDMnkqcyT9mkIaZ6cqrVtZhmgvu9kay8
	0n4X9idOtfacaJ9jEA2zQ7QFOiq5yLYZcXuV3qA8XhrtAYNotRnYZ4AoIiAwM/tpbfgc0sRh1piIr
	2PP8TVxncixfF8vdf0AabpYTkkfK8rpSthZC3Uw7kAIiBuKUVTpMfFS1UqaO0oBDiy+PrWw7OhOkw
	UQ+iE/Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwN5x-0005IG-BG; Fri, 17 Jul 2020 09:55:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwN5v-0005Ha-8Q
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 09:55:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id q5so10337621wru.6
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=D701MasqXkpIbnGbW6mmFxiPCZpNnoz2VIxKQ9a2TVg=;
 b=oUjA7LiK7g/fj9w7b0gpT99pp6/39EIHf2cGYGiTZzVVEqVQhsr1ysmE9WYK4jyszG
 +I53qjxkiALRySZjzAU2gDt7AEPOIm2UaErJ4KBlFSm4ssFMfYpLZouh5zDI6DA2cd8c
 YNUZ61y3Hg6Wp6UJinak/PfFtFB7ksOBbcc2O2SXOS6N9kqHnkXl39wQT5GOZBgOxfOJ
 L66KRDdMjC2xPyxb2ovVmsGX7O1N/x0gJjRAKxYBIOLTi5VhNse858G7UqlyKu7htI3g
 4PMtqTimd3Pe1ArjvJRtORn6vVK3yFYQYMprAOGpUTPyaeXRSUiJNmtgzTES6DcxneKL
 mUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=D701MasqXkpIbnGbW6mmFxiPCZpNnoz2VIxKQ9a2TVg=;
 b=D4QoW+cYefVSoOhvYobLZXF5O6WZJPjT804vVF2z7/hetvFa66JWKb/g24MMa51pcN
 HsGXDgY7dprAAYBcgY5p5RjFmhLAOEFEAgcqvV+HvxXENm0f9J55TPdEbahpNz1SrMA7
 X4JKe+KuCbJ26UYMFaZhnnekb93itaRBVRZUomndHuH5aSSw3YD3a4H6d74ZsnlCl9IA
 QEONXXiQ6CEGdH0sWIuzMrXBEy+0KULCLs4chW9kEBAJr2QCRFZQ3pn/vk95nnAoNcBs
 LjuSkHTmYmXicTszl9ofi6DKg1Rl7aj61UmGh3/ibAGYwrCpOie1MqhpanSwavjEzg7a
 DU5g==
X-Gm-Message-State: AOAM53089wa5Y0u9ZVRXIWTAsylYD18ZnfbvrWHLbRSAnpelZ9CDIq+B
 EaD2qMJjZvQxgbdTQ8At52bqIA==
X-Google-Smtp-Source: ABdhPJzW5rYJYz3Kx7HIHJoWVAnuRW8zocuIaNeL4sZwZQs/RbS59MNrNMZem3kZcrD0BmFW+RaTPw==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr9310818wru.411.1594979753967; 
 Fri, 17 Jul 2020 02:55:53 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r28sm14154720wrr.20.2020.07.17.02.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:55:52 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] clk: meson: updates for v5.9
Date: Fri, 17 Jul 2020 11:55:51 +0200
Message-ID: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_055555_312129_C62800FA 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

Here are the amlogic clock changes for v5.9
Business as usual - Please pull.

Cheers
Jerome

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.9-1

for you to fetch changes up to 2568528f55356a2f20f80a18244d3e235cbd2cab:

  clk: meson: meson8b: add the vclk2_en gate clock (2020-07-09 11:37:44 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.9:
* g12: add neural network accelerator clock sources
* meson8: remove critical flag for main PLL divider
* meson8: add video decoder clock gates

----------------------------------------------------------------
Dmitry Shmidt (2):
      dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
      clk: meson: g12a: Add support for NNA CLK source clocks

Martin Blumenstingl (3):
      clk: meson: meson8b: Drop CLK_IS_CRITICAL from fclk_div2
      clk: meson: meson8b: add the vclk_en gate clock
      clk: meson: meson8b: add the vclk2_en gate clock

 drivers/clk/meson/g12a.c              | 119 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   7 +-
 drivers/clk/meson/meson8b.c           |  67 ++++++++++++++-----
 drivers/clk/meson/meson8b.h           |   4 +-
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 5 files changed, 180 insertions(+), 19 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
