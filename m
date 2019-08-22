Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B67C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E966B21743
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WyrWRKQj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="idQ8iW2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E966B21743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J6yVKdEMJKmOto4e/v6V7aAOwb6wWuTcDH87RKbjw9E=; b=WyrWRKQj13qrR/
	pVRb01nYShr7bAvSzQylWydWoFIzxYnd5FjGBTHYkOnAP4lSxWJQgRLRytqJ9ZKe4hSqZ/8FTzsia
	/FGN7A+tC7/JMRx4w9Cs8en2VS+6PEebhHWnVTbdd6hAIyvjN/98m7AaNkC4i1eP+QMDSH4Mnsbve
	yKwRb5/0tFAdMerQ6eVxO0xgGlpcJGIImjYTR5x6QBSJMOs71CkJZkBsely/8lRr7VxVs6RNY81I7
	a2BxpJBDp/NOJiZO0TNgdcM/bgNFhER80eTAviqOd8eXsXPqeSKeGtQM64qK27n2wJ2xVbbH/qI94
	tEqWwv9s7n8KfZp4CfDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0o1P-0001UM-3q; Thu, 22 Aug 2019 14:25:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0o1M-0001Fu-Ht
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 14:25:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so5605365wru.13
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OVx3jQWP4kZ5xJyqef16dDp2+r5/pkxkhk8LNAWmX4=;
 b=idQ8iW2xtN9Z7AliSk77ovUIB903UmaYQgKv3ApPk4O3q0V27W7ZDIobQ4+dlnAMiH
 cHbKdpngCnKxltSls1Y7TZXrbhU1iazWGtK96aKaaXSSWHc67X3E6Xl9RjMIylZOCkpO
 SHe2quUdPXW2RYKDJTf1SnjXzxANBS3R++T+aaNHCdOGH1KIkoSSS0FP+rfQu0/1Vf4g
 codkCiEWII91vRMM1SLUswJkkI//E4JAuruZMlk0uxgkqrSR9peFGZV98FGd5ScnoGz4
 BAj9fMJ0xoNrRvwOEIs2jB2bw5eEYGkRFzgU3Y5GC3cwdcSiRYRNTQwAy2QlVCsuh/bB
 uf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OVx3jQWP4kZ5xJyqef16dDp2+r5/pkxkhk8LNAWmX4=;
 b=TGaZgXEEXJQlwPDbz9mXH264j6hCLy6HQtXpwCNFD0EKPefVrYl3TGNdl7MMl3+zac
 zewmiLSEd4i/0TapO8damq4v/0f56pcX0q35onR9YY6vSSjyh433fdL/tHayrMAh2UjK
 6/Ewm37MrfdgJYbXNoRfPTZ9mI7BMnSs5IUUtdMweoe4e0g6kM7x7j7CeyF4plkH/bUk
 3yt/RQEBuDPSQQ6r/0QO+TKjXRGlKs1g0CmhNY7w57CdjP/iDbj6YZZ6Cxc9w+C4gWl5
 t+yyZVRyv1/XjrffcpNKiix9cqNvSZQlpRdGhpvi1xe/LZfm/10eFupp6/87hN7OpXqF
 RX4A==
X-Gm-Message-State: APjAAAXxE0Dc/0Hw0LONhT2fvvlCnMqUgZgdRPQccP2al5wZMz4wJLlw
 aBYlYwCc4NzyClL+Wd2uz/ULSA==
X-Google-Smtp-Source: APXvYqx3a41MFNhYZEgCdkzdje7C0zBjdhT4MO5uJCc4++EvcwS9Uz/v1rJGzSeEpyFmCrumGT1VbQ==
X-Received: by 2002:adf:f281:: with SMTP id k1mr47694586wro.154.1566483898729; 
 Thu, 22 Aug 2019 07:24:58 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 07:24:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH 0/6] arm64: meson-sm1: add support for DVFS
Date: Thu, 22 Aug 2019 16:24:49 +0200
Message-Id: <20190822142455.12506-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_072500_587261_FDDAD189 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
enables DVFS on the SM1 SoC for the SEI610 board.

The SM1 Clock structure is slightly different because of the Cortex-A55
core used, having the capability for each core of a same cluster to run
at a different frequency thanks to the newly used DynamIQ Shared Unit.

This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
with a bypass mux to use the CPU0 instead of the dedicated trees.

The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.

The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
G12A only a single version of the SoC is available.

Dependencies:
- patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
	but is not a strong dependency, it will work without

Neil Armstrong (6):
  dt-bindings: clk: meson: add sm1 periph clock controller bindings
  clk: meson: g12a: add support for SM1 GP1 PLL
  clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
  clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
  clk: meson: g12a: expose SM1 CPU 1, 2 & 3 clocks
  arm64: dts: meson-sm1-sei610: enable DVFS

 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
 drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  26 +-
 include/dt-bindings/clock/g12a-clkc.h         |   3 +
 6 files changed, 697 insertions(+), 5 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
