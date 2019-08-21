Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB044C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 11:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF4B23402
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 11:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYFqq8hS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hgz89Dj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF4B23402
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yMSLO5OCZ34MAfCvHq2VXqsn6qbTK/x9aGs7C+hpk/E=; b=PYFqq8hSCeXbIB
	34hDMz2HRm6AUpFO8ykuxSUdsOxy8KZaSL3exxOWNbyvQD9NQnDYgUS27H/bibVh//fDoGWYPXSkv
	Tv9YHZgdtlRjVVEGR92Y5yIhDfQxyI6MFs+YioTdlxR0hccmraT1uzdQikXQJwkOi9AHt9bRosIvD
	2ynQtLJP4RCW/7GYTeklWWhAArw7vFEi7rWbvfD22yLuSUQUHEbWbz0boH4o/dfFH93knar2luXg1
	fmP4DP7eZ00kHpsYu06qdttuTsUW/B5qvU82J0vjhciRAHfFMMbl7pA/FO6WsMqrW6RVQ1NvPLzJG
	41XUk5eUNGj/kxbQV4PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Ozf-0001M6-EG; Wed, 21 Aug 2019 11:41:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0OzY-0001H0-0P
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 11:41:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id d16so1802745wme.2
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8o3T2t5tz7Ixcjhq857p3V1LeL5QkE3oMH88PryfCM=;
 b=hgz89Dj8EeATIFFjaX2KCz0C0uNpZrY6QVX6pEY33E64+i8O/OuKaESi3p4fdK2r2Z
 z3pwPkLNuACjxRRfK4Nyn8j3lYz5gApK5BBWdosClSfrsvnto88TYv8GANdPhaDUuceH
 nyQ63eaHKAYQvJQPOp4SwMw6BLc3jg2z7K0fsqMvovx5oLxNLr1t2u0WJcKEqaVKOevR
 F8kZvLViHXnGIECx0lXkgBtF0PgZTrEcICBkcoFQz3no1rTFrj8SY3GMtJsyAHjkLlKb
 nmi8SBh8WYSmiqhszrysruibpzkQDDZxec3PiA1PWdpURj/yr1KzA+Yxc5RLUU1iDi4C
 o4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8o3T2t5tz7Ixcjhq857p3V1LeL5QkE3oMH88PryfCM=;
 b=DMGO+2Mo6zqD2ZXlRm1wjqKYimDDLy8twbLaIS6jmUGWx0T7rWA7ac1T1asH1Dtd8C
 P5sgGTa/zaeIemJsA989npuiG4KBJgUSGEdMZkM5n54v/J0fa1UDMdLQ5fy2rguCQhIS
 bTGAe8AtG+dSADLB561Gve8OBQiaLfT1GGH1lP4ekc5zBcEp1a1LGy55qZ0vXOmAtsvA
 K/weVct9h9Ojhw8g3sLAEG2lkFmX392deHVaKqnAlnKz+Kf70PKpvPdHMk0yRrQ+XcuJ
 PDvOYZ1Ddw2rCPE1DGas/C1JuVgY9CynNbmNoUZgKHYOKzodWDx4Zu6XhZvfL+5PW75Z
 BNdQ==
X-Gm-Message-State: APjAAAVg8sCGZ1eAcMzfhD41BRurZRKMQS6gEARnQwA0ZxxKtkeu376t
 FG921ItjEC3ub/F0UjRm1xcBFw==
X-Google-Smtp-Source: APXvYqzrf0tMJG6BPFz3rwTLTrCXMVxjFRd5KCZ5s+IEF3EuyTik4+AtnX+i6dCshLvZBUUTBNaCMg==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr5595031wmf.100.1566387683719; 
 Wed, 21 Aug 2019 04:41:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm24049686wrv.9.2019.08.21.04.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 04:41:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	ulf.hansson@linaro.org
Subject: [PATCH 0/5] arm64: meson: add support for SM1 Power Domains
Date: Wed, 21 Aug 2019 13:41:16 +0200
Message-Id: <20190821114121.10430-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_044128_109180_353A077B 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset introduces a new "Everything-Else Power Domain Controller"
designed to handle all the different non-Always On peripherals like :
- VPU
- Ethernet Memories
- USB, PCIe, Audio, NNA on SM1

The current "gx-vpu-pwrc" process has been integrated to support the VPU
and the other power domains in a single driver.

Support for SoC domains has been made generic and easily extendable.

In order to restart from clean architecture :
- the PWRC node has been moved into the HHI simple-mfd, this suits much
  better than beeing in the AO RTI simple-mfd
- a brand new yaml bindings schemas has been written
- reset-names has been added to clarify which resets are needed, so we can
  dispatch them to domains

For G12A, the PWRC now offers support for the ethmac memory power domain.

For SM1, it also offers support for PCIe, USB, NNA, ethmac and Audio power
domains.

The DOS domains has been excluded for now, but can be added very easily.

GX hasn't been integrated for now, but it would follow the same scheme
as G12A support.

Neil Armstrong (5):
  dt-bindings: power: add Amlogic Everything-Else power domains bindings
  soc: amlogic: Add support for Everything-Else power domains controller
  arm64: meson-g12: add Everything-Else power domain controller
  arm64: dts: meson-sm1-sei610: add HDMI display support
  arm64: dts: meson-sm1-sei610: add USB support

 .../bindings/power/amlogic,meson-ee-pwrc.yaml |  93 +++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  92 +--
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   9 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |   9 +
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  28 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  15 +-
 drivers/soc/amlogic/Kconfig                   |  11 +
 drivers/soc/amlogic/Makefile                  |   1 +
 drivers/soc/amlogic/meson-ee-pwrc.c           | 560 ++++++++++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  13 +
 include/dt-bindings/power/meson-sm1-power.h   |  18 +
 11 files changed, 801 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
 create mode 100644 drivers/soc/amlogic/meson-ee-pwrc.c
 create mode 100644 include/dt-bindings/power/meson-g12a-power.h
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
