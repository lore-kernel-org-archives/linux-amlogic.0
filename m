Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12899C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D878D2067D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H68QT3Ev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dzibTd7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D878D2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZJJdnoGfgyaTf+T29NA7iWNYMZ0151WtGhBPL1iBFi8=; b=H68QT3Ev3QBD40
	xxLAr89SsoVnpAIYEKF5u2CIemGkLTH4kQmmzwqPA/TRqrSeA1PaOVAw5rBrezZOjRjThZwiezcTQ
	bz8KefuFVc0157Q/M7w533jogEUO6GIsdlHGB4H3Bj9LNfwvbfiLZFbRnmBlgkP+xfygJrTyF2HSx
	v79492wvJLYXktgOuVPR6suIg6PYSfzWJ0zRXcyD2FfUbiQvdJfQNrs1ERTm2rBPI14FJ5X6znbXc
	N1gJm6nklUZMvKsmR74YWaZwpWQ3YWqindxsXjsY5PJhl/XYRbptXO5KOtOGyxuUWGqkGYC/cDhn1
	uO/nxNfqmCTIxsT+zx0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcei-0006hX-RF; Thu, 09 Jan 2020 18:35:40 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcef-0006gx-Ad
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:35:39 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m1so1504854pjv.4
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2020 10:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OUXUt/oQ1sY1HAXZnXl8Nf1nvrjHHdo/02v/NVZ95iM=;
 b=dzibTd7HyAmsiiNgJDmOlbQus7giSZoeUzodYjN1EByjHRUceckM7ANrQFdp5ZnQOC
 Qu/+b+3LlL+I+5KCjE8x10Tj/LjRCgjZGSyWZhNgvLvdniYjS6r1p/PNOCqxf/Cc3Gdd
 pnamOcEqtnNPJjDVWROIpFLz8nK0tx3vvbM5eQieXUnrxFL+BHH/KsrYngKS7Xe9aYlq
 nll0OJwvIqubkrOk/K48jg0NuLHtl2mHPhm483Kc8gakkcr87IV8Bftrr4lJFiDR0Lcs
 FCizP4F2n9mDfT6o2BbmkKnxu9+erJtmfgyVRZasO/RqLCY2Cq/XIueGzgkyKgbI6VOv
 ukcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=OUXUt/oQ1sY1HAXZnXl8Nf1nvrjHHdo/02v/NVZ95iM=;
 b=uZVpEoaz4Z+eRDVldDI4LQoTEBQ67DHR+PFmwDI3wjOSUdreF2fRBm1xl88Z6xGF+Q
 c/shsgBzTGESAG27f/QFF2xAXG5wupruuW1fpu/nBg/2EWqF7jtqVKkVL3HRaWw4Sm8P
 cub6T9OVA0RZMNs2DDFP9DvuQEv+OP0Cm4Dj1sl/55iEjJJj5sR6nFbSBtnMFGf3CCFV
 YhMBo+gCD+1ORjlBgRF8BXxt4jLzQ0jeUrtsCLlkN4FJlTLTa9A/kCJiPXiB8d7xqWkX
 StSW7GBJ0xoOcn8Rwx9TUZ/2yTCaqvBI9iEvAwE0jK+FoS4ahscsV28GoceyHhQdm6xP
 2MKQ==
X-Gm-Message-State: APjAAAU2yFj6WETiLQsaCVOPTn+u90fkTi7HzHAhXh/YkZiX4zV1iqIu
 bXxSsuko1zW7Y7xbaaEwrLX1+w==
X-Google-Smtp-Source: APXvYqxGx63AudpVWMHbZpv9dMKpR4QvVcuow2kWkH7/yXxpyQ5sFdpsG3afvx3KZ6jE2aXfV4hkWQ==
X-Received: by 2002:a17:90b:1243:: with SMTP id
 gx3mr7022211pjb.117.1578594932398; 
 Thu, 09 Jan 2020 10:35:32 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v5sm8456542pfn.122.2020.01.09.10.35.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jan 2020 10:35:31 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: Amlogic fixes for v5.5-rc1
Date: Thu, 09 Jan 2020 10:35:29 -0800
Message-ID: <7hmuaweavi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_103537_507646_A2F08924 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 30388cc075720aa0af4f2cb5933afa1f8f39d313:

  arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt (2019-12-09 15:21:21 -0800)

----------------------------------------------------------------
arm-soc: Amlogic fixes for v5.5-rc

----------------------------------------------------------------
Guillaume La Roque (1):
      arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt

Kevin Hilman (1):
      arm64: dts: meson-sm1-sei610: gpio-keys: switch to IRQs

Martin Blumenstingl (4):
      ARM: dts: meson8: fix the size of the PMU registers
      soc: amlogic: meson-ee-pwrc: propagate PD provider registration errors
      soc: amlogic: meson-ee-pwrc: propagate errors from pm_genpd_init()
      dt-bindings: reset: meson8b: fix duplicate reset IDs

 arch/arm/boot/dts/meson8.dtsi                     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 28 ++++++++++++++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c               | 24 +++++++++++++++---------
 include/dt-bindings/reset/amlogic,meson8b-reset.h |  6 +++---
 4 files changed, 45 insertions(+), 15 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
