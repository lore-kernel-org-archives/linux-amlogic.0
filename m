Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63190C33CAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD4E206E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 23:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="om5jIdqg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0vBlllSt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD4E206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AeOzwRA4TxWBBQWVxfSHqocP1O8DXyMA1T3FjE0GGqE=; b=om5jIdqgN/6yYF
	ojmMZtpAvL4Zcq4lgdoOKOnSl1x1KjpdqJUzeX6BKyGlvqeuk2zazY/y/AJuUKTly7858XmhC3ZAC
	93nKbsiwKf40gSKY+aieTg2P/9IlLHecXZ1d36KnHFUaj1Toxp5PPvWd61My7Q3ge7vmBpGq0iTzO
	mklZSDNodMAk+ouv9Idtd4oHnLQalIhiZ/hvPghWkr5OcWbCh45D3JaTdeaZI0pqNu3LMGTfj31HH
	EYjWNIs0T5bARxVYxrBJ/kUa8nPSxU95EuCaE/5pnuDO2QPAoW8aHbNk+b+FBeNOXTFkBOEYFlxfC
	W+2LMrivUubF4uUCCMxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9bH-00023y-Et; Mon, 13 Jan 2020 23:58:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9bF-00023P-FP
 for linux-amlogic@lists.infradead.org; Mon, 13 Jan 2020 23:58:26 +0000
Received: by mail-pf1-x442.google.com with SMTP id p14so5655361pfn.4
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2020 15:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sfnFG8e6nHigZXZN5d7e6J5tkHrTk899V9nU3cvnsOY=;
 b=0vBlllStm9mOrXOAr1XhyfKaRCaeUpg/XFWlQ/TWvziZCS1Tz9tFvurgG3+QMRHS0Q
 OwX/4/N4uD+a3RccFsP28Yfqm6HvgZKANot6WTGF3hY6eCXvdij2B//cZrBIwnOAkxxB
 GEkUFxYoyvNYfaNiKKeTqdgdiceePB7dSNqFRUoLIWX1drWgHySfyGQuWAKIBUB/yY2/
 B80vkesO+ZxF9tSLB5vQ3mo6Lbg0EpuEcatpzGA1ZnmeuSvTAzcxdssZbPLbIM1clLzj
 2gqlsyy+8OzS58jfGkV4gBll31docavPFTgz/obavl4hfUaWE5hSvFcieJShC6xfF3E1
 GnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=sfnFG8e6nHigZXZN5d7e6J5tkHrTk899V9nU3cvnsOY=;
 b=nq7ZigKhQOcRffwfvn1YRpNrj+Gzo8cxOyLWROCZL/D3lBNUe5eUAhjqZJJyaxwTwV
 sN/n9Z8kWsgaT7o89kxKSuHntgWtPIc/W47JcfMCKz93PxMR0mcB4lEbzhtnDbCSa0+1
 bMTJb+k4GdDnXgQ0FbN7MIQ9hTarsDjnCFD66vNdZije6WfVkdYS7I5AL21DWuBRo7Qs
 y7WuuKkOHO0uv2UrYsE5EXNsD12jxqtmP0uRq/z8xFRfv3W0kaocopO/0DFnmg3CJWyb
 qOkT6cjLhXbr5wtonijDzzTrzYXzdFvTqNgooAruumK3eIuap4B4bUHd3hJsdDBqCoFR
 dWKg==
X-Gm-Message-State: APjAAAX+7qhDhfltzf+dRGPaQnFH2mbLIgv7vrNQFo2aYReLh2DRY2em
 PrR9en/ip0pzJ6fvVXLHouEm+w==
X-Google-Smtp-Source: APXvYqzcKTYuoBZD23MxRDG95Yd4tEBaIsV3SsXXss9L/4KgTglYpyZOqhYJ4sBi4QIVEPmWfn8PvQ==
X-Received: by 2002:a62:6401:: with SMTP id y1mr21824825pfb.18.1578959904796; 
 Mon, 13 Jan 2020 15:58:24 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h3sm15355583pfo.132.2020.01.13.15.58.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jan 2020 15:58:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.6
Date: Mon, 13 Jan 2020 15:58:23 -0800
Message-ID: <7hsgkidi3k.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_155825_518648_C491AEEA 
X-CRM114-Status: GOOD (  11.39  )
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

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to be63807524ddfd4c2e87ffd6cf2de8e7617d4832:

  arm64: dts: meson: add audio fifo depths (2020-01-08 10:52:12 -0800)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.6
- new boards: libretech-pc (S912 and S905D versions)
- new board: Videostrong KII Pro
- A1: add reset controller

----------------------------------------------------------------
Jerome Brunet (4):
      arm64: dts: meson: gxl: add i2c C pins
      dt-bindings: arm: amlogic: add libretech-pc bindings
      arm64: dts: meson: add libretech-pc boards support
      arm64: dts: meson: add audio fifo depths

Maxime Jourdan (1):
      arm64: dts: meson-g12-common: add video decoder node

Mohammad Rasim (3):
      dt-bindings: Add vendor prefix for Videostrong
      dt-bindings: arm: amlogic: add Videostrong KII Pro bindings
      arm64: dts: meson-gxbb: add support for Videostrong KII Pro

Neil Armstrong (1):
      arm64: dts: meson-sm1: add video decoder compatible

Qianggui Song (1):
      arm64: dts: meson: a1: add pinctrl controller support

Xingyu Chen (1):
      arm64: dts: meson: add reset controller for Meson-A1 SoC

 Documentation/devicetree/bindings/arm/amlogic.yaml     |   3 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                   |   3 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi              |  25 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |   6 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  23 ++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi             |   6 +
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi | 375 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     |  78 +++++
 .../boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dts  |  16 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi             |   9 +
 .../boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts   |  62 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi             |  12 +
 13 files changed, 620 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
