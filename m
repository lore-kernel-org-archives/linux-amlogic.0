Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D967C3A5A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A0D22D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eiRYIcje";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E0MgQD/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A0D22D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/NakG49u/CweMaH7RKIrOPY5l5GDWezQtZ0Y4wS3b0=; b=eiRYIcje3CcMER
	r3dtY5L4NVGfzP+QVNY+HIgb+7XcaTNc7Ak/h9NZxY9YxmcXjg+/3rivZG+sbk0sBX0/oZxams3M5
	wD0klIWOaYJQ5nURCTn667FpjvCvEDwhm1juV6Hb4o8ECmVqJdPyT8Dzpiy1UrnSgV6T3L2smHUrT
	rAIet/ibx8nHaEbv+XoQklzzx2320urLzgWCMOlRaKy+mGQWwYmp4G8bZqQYG1SaHWpUAwg5sfD5O
	1lNVp8as9uVo86yysyhpJoCmAUWrR78U9c1MfaUTLVLefDYD2V4H2tQ/ssSkNYG3K4ZzsoeojkCBy
	Liq2fshET7RFb1I5n7xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RTu-0006iG-IY; Wed, 21 Aug 2019 14:20:58 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RTq-0006fh-Ix
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:20:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id c5so2133561wmb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hgbbdW56kZ9dbt4pURRNeqYEzO7tOgAeaDiUmq4v1w=;
 b=E0MgQD/1DR5lR/EVgfVAzXNjcUBnyq4K7Ghg+Niucl7aAj3rOqg3UJg7t1gBQ2yrb2
 OZLhhSeoR2nsOxtm+miQ2krAI5eyTGHczpNeSNkmY0eEHzuFfUfjl+GLIG1lZ+rzmdKo
 Olh11zxk7rTUK4QUx+w5VTNTZ64pgdRc/lwZ9D+myQk1L9yXgGaVeeoPttE7pNJjYU1/
 FFodCccBS/7U0y200sFowkpauy+YDx8PHdmt0luiyhpc0Rqs18q+jChaZ7WYjxlDINjE
 d3QGYwJpL292p2LjxUAKUgpJ61vJrlRRyVUBAiJWUySDIAVNuqcmuOQWuFpIIl6Mb2Dh
 PSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hgbbdW56kZ9dbt4pURRNeqYEzO7tOgAeaDiUmq4v1w=;
 b=KWg6re8mazXWt7oHxxc4Nzmx5vWA8u1eg8IDTn0RtPh68KQdpJfldXtgEmZJ1sb97a
 4bR1knYWJuSsEoKrDEgLNouOrGgXMdVEM+hDyNwXAWrJNezIYXBjNuk9hH1/87wK7ryl
 YnuKdq5YwueP9hbl/7uy0MiFLPMxOfs+Rnr+v480a6UrFnki7e8fDfY+YDqiufFhlx4Q
 iyst4iRW1Fm/DXrng96hQFHyViIHIpYSTUYBNEnGTTtMZqq8Cq1u1ZSnNBkA0I9tSL0u
 jiTRyPjKNVsrqttj14sctUDsTq0um721/AP6HaGzDt0Y3V5f20HPchfB8ahYoC61p+wL
 se2Q==
X-Gm-Message-State: APjAAAU34ln8GKG6EduoBdnRtsovLsO6+ZYX4KuvpiNSsTLhGZeuIEPA
 juDb/H6QOvMuoFhpLC9wKyFLXA==
X-Google-Smtp-Source: APXvYqy+BKmYE4t79zuMDWuHtMYIbNyIVmEb2qK2hKucfvDuuOO+H7pzCxk9BLseZMyZsL1udITvhw==
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr322764wml.138.1566397252864; 
 Wed, 21 Aug 2019 07:20:52 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:20:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 00/14] arm64: dts: meson: fixes following YAML bindings
 schemas conversion
Date: Wed, 21 Aug 2019 16:20:29 +0200
Message-Id: <20190821142043.14649-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072054_632660_7C29FF1F 
X-CRM114-Status: UNSURE (   7.26  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is the first set of DT fixes following the first YAML bindings conversion
at [1], [2] and [3].

After this set of fixes, the remaining errors are :
meson-axg-s400.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12a-sei510.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12b-odroid-n2.dt.yaml: usb-hub: gpios:0:0: 20 is not valid under any of the given schemas
meson-g12b-odroid-n2.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
meson-g12a-x96-max.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'

These are only cosmetic changes, and should not break drivers implementation
following the bindings.

Changes since v1 at [4]:
- Added suggested commit text from Martin in patches 1 & 2
- Fixed NanoPi K2 model name

[1] https://patchwork.kernel.org/cover/11083597/
[2] https://patchwork.kernel.org/cover/11103229/
[3] https://patchwork.kernel.org/cover/11083649/
[4] https://patchwork.kernel.org/cover/11094063/

Neil Armstrong (14):
  arm64: dts: meson: fix ethernet mac reg format
  arm64: dts: meson-gx: drop the vpu dmc memory cell
  arm64: dts: meson-gx: fix reset controller compatible
  arm64: dts: meson-gx: fix spifc compatible
  arm64: dts: meson-gx: fix watchdog compatible
  arm64: dts: meson-gx: fix mhu compatible
  arm64: dts: meson-gx: fix periphs bus node name
  arm64: dts: meson-gxl: fix internal phy compatible
  arm64: dts: meson-axg: fix MHU compatible
  arm64: dts: meson-g12a: fix reset controller compatible
  arm64: dts: meson-g12a-x96-max: fix compatible
  arm64: dts: meson-gxbb-nanopi-k2: add missing model
  arm64: dts: meson-gxbb-p201: fix snps,reset-delays-us format
  arm64: dts: meson: fix boards regulators states format

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  6 +++---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  7 +++----
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     | 19 +++++++++----------
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  1 +
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  4 ++--
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  4 ++--
 .../boot/dts/amlogic/meson-gxbb-p201.dts      |  2 +-
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  4 ++--
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  4 ++--
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  5 +----
 13 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
