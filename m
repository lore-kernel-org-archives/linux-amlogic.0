Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10938C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 10:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42EE2087E
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 10:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rHOpdD5c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rerU53LB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42EE2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FlYaDD+d+LAUfDjQY7v4F6d1YW29yB1CUK7Y7JKFQXE=; b=rHOpdD5cDfH8aY
	I8KSUoDEoSlQadEcAtTFKc2JD52RvEvikrB09PPMQjTWbEu1vsO/yBQAC1+g0/7MbS8nSjDiz7VfO
	+D7sGVsNeiSVKWUAvrpjKCyCPAFsHIUgkbt4EgRpGVAgqK8Wyznv6NR+OqUbW3gmfzNnGDPm8MKkE
	6FnT7dI+sABhBOGCvp68IZk90/KQzGOOud2FgT8GioTI0Fl0l4wk6l27Xs4+hZyZkA0ha0Eo3GmDX
	o6VwvCXp45V/MYmTiAN2xzZzShMQExItgEKhSrX2VT2LuXump4t328zjHmpEBJC4yJduo4hvAyVOH
	LxvWCzL7lt1brhlILOtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfIi-0001Ne-IS; Fri, 01 Mar 2019 10:21:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfIY-0001E9-Q2
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 10:21:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id n2so25227654wrw.8
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2019 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nElNlZouH94P7AzbldSSkfrMGRqzf/hdHWeWWp+K708=;
 b=rerU53LB+TkcD5/bPTwLLiFoMmhLcFeVnndc42pJ0NWBmToOLFtLS/tnCDlQmH+Y9R
 ksKXPxoVgTlFyDn1dmnrS/kFic/RzvaV7GkgsvQFq8oxiM6YZ1Zwl6dcLUYikGPYnRMQ
 10oUuzX2KwiF16h7HnDAJ0d9yOY+hFr4j//S4Ha2OCyhRfoGO2rRnUUHQxERd1qXKcyy
 31EsFt2sprzGd9tUGbK4FleihZuiQ3aOWxYDhVKtzF9VSszx/MdzdkBIqh2lTte7By6b
 J3v34v5H/1unr1tVMOkarugBFLXGgBa919Ga+Mie3r00Dspxl0rXAnTAfydtyO31jriN
 O3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nElNlZouH94P7AzbldSSkfrMGRqzf/hdHWeWWp+K708=;
 b=bJmCqf0aJN4mc/r5DUc+Cg7mz162JnSrRj5JTvFlFgmjfuXQjUgR4uD6qE1WKbZwxF
 Bzs0Z4stXsjS86n7fcBhb8x2XBh+Ob8iD1JsJFUlwGFZx0h+24hAsbjaDWL/AcWT02CB
 eX3HSC15pjEPW3v/tqkUMX5K/SmueBNtbQ/QU8PeI5JqxdHJAd5aqDIMIiV47SVhrZ+a
 9CfQYHls/d3eBEmZzxqrwphcyoqP+ur76/FhVfuGoJsd5eNaoioKle9K8j9WzYPA6qpi
 /rZROyBDI5OZr/ZRMhI3fnWsNq7VGtXuEosFhD1URVQ9IXyCI/PLcCK9l1Han4M8THcu
 6T6A==
X-Gm-Message-State: APjAAAXdYSSlQkrOr1ezNw3jYnnH71UxqdWTpCw/VgBzNh1w5KaBcAqT
 hnTt3k6Eikkqqz4hcUPJ3KgyCA==
X-Google-Smtp-Source: APXvYqxVgA392/3bl96BZwxC06Jd03FyoK+trN1mSRPNpZREOoGPzRYIAOWBJAbug1sMtRKNd6rkTA==
X-Received: by 2002:adf:c752:: with SMTP id b18mr2846977wrh.105.1551435704134; 
 Fri, 01 Mar 2019 02:21:44 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f68sm14446626wmg.5.2019.03.01.02.21.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Mar 2019 02:21:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/2] clk: meson: g12a: Add CPU Clock support
Date: Fri,  1 Mar 2019 11:21:38 +0100
Message-Id: <20190301102140.7181-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_022146_913211_5F048872 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the clock tree feeding the 4xCortex A53
cpu cluster.

This patchet does not handle clock changing, this will be added in a
secondary patchset.

The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
muxes.

The CPU clock must be switched to a safe clock while changing the clocks
before the non-glitch muxes. Proper support will be added later.

In this patchset, clocks are set read-only.

Neil Armstrong (2):
  clk: meson-g12a: add cpu clock bindings
  clk: meson: g12a: add cpu clocks

 drivers/clk/meson/g12a.c              | 348 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  25 +-
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 3 files changed, 373 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
