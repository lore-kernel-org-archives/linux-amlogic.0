Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CEBC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 20:50:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B7B20829
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 20:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHfuM2ls";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ybLWn3q4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B7B20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IXhGpfLC8jvfiI1oJ+hhI5J4eb92iNAa5UEZl7yh0Zo=; b=LHfuM2lsNy6PpaUuwLNRoxsAmg
	FWBkWQQKe6NbULlVQ17KYoa5N3vslgJ+4tWkgBvmlgymL9thOs37tmDNfCBpeseiDrYVbOwTGGtXr
	kK1ANTYeK6D3gteyoqArti369302clJbayMDSXQ4LbAH0whtcsSejwNqnbm/gIk63XVg82d7vw5R1
	NF6vcO3iBsxwWGQH6oJ5CWchcJTrecSKN0EVWYUDuycPJ3KGUolg92gjr+xjooHGv9CAYkNb7Q97v
	dOk1RORIHz2QzXbcyqOwY5/Um+RGdtvPlh4OBzKh/fXLIIjfwjfmnRMzzz0QA3Rg0irKPFODYccAz
	j4+GYLiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX9Rt-00059X-3S; Mon, 26 Oct 2020 20:50:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX9Rp-00056t-JY
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 20:50:34 +0000
Received: by mail-pf1-x442.google.com with SMTP id y14so6845095pfp.13
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PFDpUwXn+6ftLoJZOkjcFHWPJESrMsSZ67/zuNPPhfw=;
 b=ybLWn3q4ZWdVTv7xE7YD9Mb/vBWEFaffbmDF+uhGhP6yxuWW5dxd5M0GKhIJpTllbC
 IFKccX8Dtr24+o4EpmNBtfk2mDvpnnma2HF5/btgJksY6WvwBtZYSY5sm2PbE20IhnXb
 0c9y6zrzmIrhnbv9XY5EMUn7OpL4Wxj8nbo0wep/DiyUnCpVVUV+3w9moVIWZQBV4xVe
 3DXxKYYzoAGl4/IoUP9CWzuT0pPplgOjN+TSmbj/m9gFjkoIQ7t1oCxWr5lpHo3dttaX
 /SpW/yIZ6OvaFIjpduMjMGNk92lZeBA1rxBB/cgDOb1RKh0/d6W2L2O3zHb8Zx11PrFi
 DeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=PFDpUwXn+6ftLoJZOkjcFHWPJESrMsSZ67/zuNPPhfw=;
 b=dwBhynWeUvRUXQBJ7dXgkwTbOa/co+Gg9enWhmbxbNaKL3Kok3CMEmTFlyYpyusbju
 RJejQ49RKl4/wJTrvttEv31iGzJq5lKre80sL7D8rTer9GVQyiV/AXYLgM/ou84S1O0W
 42usauYU4U5DU41dBI0OYIkGXgNSAPdQzo1FJpRGuQ6XArf2zHnYHb0/ucl2o3tHoVzi
 Vmae4odMa8RJrBWbGNsANGjiPLYvWPtxzlgUhsdIyFZdynUFUAjHwVJnRRh2CMQF0ssf
 yCPUsU2+Q9ZsUADoCIMdWhYKGFqBwjh4bBQq2I6tzSmq3b7PZ9nh7ShrlsWZsQc5uEGy
 uRZw==
X-Gm-Message-State: AOAM532d2ckJ4ONo8zo70+/9yS68aQyz2gnUHU+segswLFG4MQcJAEn0
 eA4U/7Pn74uWeUDRnlQKmdLl/A==
X-Google-Smtp-Source: ABdhPJwsFRDHNR6v5o7jIsYFO5R/VtwrtYhZ4yUjUZH3MEmO0h/4e7kXoFqswwc/8L4e4j9sVeIx5A==
X-Received: by 2002:aa7:8287:0:b029:142:2501:39ec with SMTP id
 s7-20020aa782870000b0290142250139ecmr11358081pfm.59.1603745429899; 
 Mon, 26 Oct 2020 13:50:29 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 186sm12388556pff.95.2020.10.26.13.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 13:50:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] Amlogic fixes for v5.10-rc
Date: Mon, 26 Oct 2020 13:50:28 -0700
Message-ID: <7hlffshfu3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_165033_648672_CC4978EA 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Here's a few fixes for v5.10-rc.

This also includes the 2nd round of 64-bit DT changes submitted for the
v5.10 merge window as discussed here:
https://lore.kernel.org/linux-amlogic/7ho8lkl9fw.fsf@baylibre.com/

Please pull,

Kevin


The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:

  arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to f7d933388f11f66e5af9e5663a17f26523fddd07:

  arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm (2020-10-23 11:12:54 -0700)

----------------------------------------------------------------
Amlogic fixes for v5.10-rc1
- misc DT only fixes

----------------------------------------------------------------
Anand Moon (1):
      arm64: dts: amlogic: add missing ethernet reset ID

Jerome Brunet (1):
      arm64: dts: meson: odroid-n2 plus: fix vddcpu_a pwm

Martin Blumenstingl (2):
      arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible
      ARM: dts: meson8: remove two invalid interrupt lines from the GPU node

Neil Armstrong (2):
      arm64: dts: meson-axg: add USB nodes
      arm64: dts: meson-axg-s400: enable USB OTG

Scott K Logan (1):
      arm64: dts: meson: add missing g12 rng clock

 arch/arm/boot/dts/meson8.dtsi                             |  2 --
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts            |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi         |  6 +++++-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                 |  3 +++
 6 files changed, 67 insertions(+), 4 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
