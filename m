Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31DEC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C822B2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iATwJMhV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F0OuPbca"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C822B2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/EwjJxi+gb6WDWGdjCbvdkpjXdfmAe9Wt48Y7nhs94=; b=iATwJMhVTuJoWx
	J2GgdhAx4y7jxwFwMXK3R0h5RTnyfhYR7zIu8xaBIpGe+t6aUAAlF75usAzOOaQbiDSdtoWCk1ljl
	x17N1DuYUDaOJl3+DFSQ0S0PoatMoU4/jhGUoFM4egU5FvOvqWldNiZef6mVILO0VdQrTUTrCxGAT
	CLtpHI8gvW+xxWqKwFqUw9GZBZAeYafJMnYJ1RPsr6oqmVuT9zilm9MAu9bOXSLCRYLzNxh9NjMeP
	e2MJflLpdwDlE1DKi4XQ4pE2GdNijYHOl9AgW0zzD8EKYtfdtMFx2U5ZOfPGokztFWUUilDXKh5Dd
	jS5H4k62PN+nopNDkyaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEyL-00017o-W0; Mon, 27 May 2019 12:43:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEy8-0000ne-8W
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:43:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id y3so16052533wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKi6i530JJNrkfWp8zdTE/DlNf+AJ6vpEuNiHI586GM=;
 b=F0OuPbcaU47Vw5cIofDI7N8sCg5q5HjGbe75cSt5fxbmgeL/gwFfe0z2Wex7Xk06+v
 KyG3eIWcX65wfRkP5yFfwX2MTmFf4YvIPSZ1sfR1vF1vL5KWjLpfqFxNLMzGW92WyTZ0
 xQHBioJ2CSnMfPDUutyRdQFF8edHOg7JnkFzKVpAXmvHIL4ES9prSLURjwD+JEwbDGxK
 ixEefmZ8lZXsS+0UWbqOEroGQcLF9GJipI2ge/K4pAZ7ZxZs8O4K2GqhChbwBA2HoQIf
 KPQrFoIVhCSob5K6Aky/XPD+3Qw/jM0QmRhk1va3R4IzLIYlAEQiAuh2kDeG0+YVUM8H
 IzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKi6i530JJNrkfWp8zdTE/DlNf+AJ6vpEuNiHI586GM=;
 b=JYJjInnBZ+bWODealknZ9aV4nu1tQYSWs//mgRr+kUD0CDgPfgKUoj8OgdWPTobNrr
 t1hvUNHsaum9fQqW7P0rWo0xK+bimibNRHmGpdFCGo9riuznE44vKkZ3zlTr1w8myAtg
 3E6S/Ba8tfCmX5Ple9gKFYLavu/+W3u19VN2xs5Os+crtJkGzFGazLQpNyCfX2HzMcuV
 RyQq2Z8PBueEGB7Fp9dh5ulfWsSZYxf1gvnFHymjjKqnKHYX76x4N/YSRShZvkhKMLlQ
 er8PNxTnI6rhLjihD9iSOBB22fgHkIKnDV3A8MnWtKw6W3N6koOUhH9lPZwVY6g6ypqB
 5QZQ==
X-Gm-Message-State: APjAAAUzKZV+b/hAKRTsZ1F73V3nuaNDgLBrnfKeKoY/BBNq1TuB9YSC
 RZc8TyG6aYcCjDZBBGgtHeQA+g==
X-Google-Smtp-Source: APXvYqwLlj5CMrnZHpa7NOKgj27nP4BBbZEUNpyia+Gjsf8jHnw5YAJDwN7ERYC5zPTVIVnhO1qS3g==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr9242682wmf.35.1558960990603;
 Mon, 27 May 2019 05:43:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm11494930wrt.45.2019.05.27.05.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 05:43:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/3] mmc: meson-gx: add dram-access-quirk support
Date: Mon, 27 May 2019 14:43:04 +0200
Message-Id: <20190527124307.32075-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_054312_917866_41A8236E 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
the data from DRAM, leading to a broken controller.

Add the amlogic,ddr-access-quirk property so signal this particular
controller has this bug and needs a quirk to work properly.

But each MMC controller has 1,5KiB of SRAM after the registers, that can
be used as bounce buffer to avoid direct DDR access from the integrated
DMAs (this SRAM may be used by the boot ROM when DRAM is not yet initialized).

The quirk is to disable the chained descriptor for this controller, and
use this SRAM memory zone as buffer for the bounce buffer fallback mode.

The performance hit hasn't been evaluated, but the fix has been tested
using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
at 50MHz clock. It gave around 170 Mbits/sec as SDR104 and 200MHz clock.

Changes since v1:
* use DRAM instead of DDR, added details in bindings on internal DMA controller
* fix probe() to not try to unallocate bounce buffer on error
* replace DT patch adding SDIO property to patch adding SDIO controller

Jerome Brunet (1):
  arm64: dts: meson: g12a: add SDIO controller

Neil Armstrong (2):
  dt-bindings: mmc: meson-gx: add dram-access-quirk property
  mmc: meson-gx: add dram-access-quirk

 .../bindings/mmc/amlogic,meson-gx.txt         |  4 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 37 ++++++++++
 drivers/mmc/host/meson-gx-mmc.c               | 70 +++++++++++++++----
 3 files changed, 96 insertions(+), 15 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
