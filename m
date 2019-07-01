Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C35C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F17208E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UK21Rqri";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1znE4gl4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F17208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y3g7zN77YBWc/1fUjRCSaJWMleJFY+hN4j8F9VIJVY0=; b=UK21RqrigL3cKA
	oJal2pacp6AdWt8oeN8pE/lgVMinTXjKI5X/EIA9IxtE3kvRntVR9qKirVteWnSJxyLDzuSVXMT9l
	o5+olToe47sXe4QfBudkdW5XXuYplAnJMvnGrlR4yysaSrRVtO0s08IDqw23z/4S2iSjI84zWnQXu
	8Wrn/r+DyirNGx8zfYd46WteWvudJPgMnDKSnlzqcAYQlBBG5FfCLqttrSuW88xjhdgcr44pB1bV1
	tsBTnTnHZFmhpX9t1rFHn4kiFGeBWocTqWVhPrQWiWGfKoTfyI3gC+mk0nl7UjLu++JCaa0E9Z79A
	AKDBqJ4S9+tUBRnbeVdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtr1-0007HB-IB; Mon, 01 Jul 2019 10:48:11 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqI-0006Xz-19
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so15365478wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7rpMOf4wxLFtawlTyWVY4xaI18jSPPLrKFDVZa4/PQ=;
 b=1znE4gl4nBKL3TrkCEXR49QIExUOwN5zY5wtDDRfCBLxB5wwxsi9jHSFgQsvLSJatz
 XCft5Q4hnZfg5oF1D0c0ccWaK+DhNGkBR6dC9TgY7wqmz6v6wOZDQuDhiQ3ey6XvQXOK
 IiaUv+e/1nwJjlMZVoe+rtJeBh0PC7oBf0vokvUbJ/zZoFKfPyl0oaaBRGn7GFQNZLFM
 WzNgO50BkV+7m5Jskz8qCN9lXwbccrGRVZG+yJXR3ZD6E7A+fqGZuWFltXK+sbHvBu9V
 ky7MnEXAkj95GpQw6WUdxkSVekZfjx2kvhX0sqVKNcaT36fIcL8Nnn/lD7S+8fZeNMgr
 ikxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7rpMOf4wxLFtawlTyWVY4xaI18jSPPLrKFDVZa4/PQ=;
 b=I4jVIf4rDndD57pMnqsnqQwQrsEur0GG8qhC9eB9wtE/4/InmneLZO78TbCSUSXAPw
 3tzrWZ+hr83f3ih2poBwqAqOGvuTWG4BQmAdQ6oWbjSLyq/RGf6q+USitTD+tDRA7gbf
 MqQQN/wT94/gvZQ4vt5xYnM6Ad7PueSgWSU1SViJdnq2parU1RqZDjHRup6lDRzdbOq2
 RV+Nlt+r41SVzlUVqQeLv3gB7jExXMIinnrYxOq/+BoLudtiUdodOA9K0M9ewaVwMgLY
 tm0HyElC3z1EaB3VCx6S4sUdki8/KigzfIkd4zgfdmoM5CfTNV+qMLacaWwN9fu9p/Ad
 Cu9Q==
X-Gm-Message-State: APjAAAX7zJrRbVPw+ZtQF4dUp4vz7Pu9zxjUrIxTu6iBnfd73TFnIL0i
 6KAh+h1EWDv1h2wP8JVWc2fAzA==
X-Google-Smtp-Source: APXvYqztw6hZgyYXumNmOMmn1IVeX/nJA3RXzBHSo1EL+/+nMOoG6rGaaCmTgnIE4oKyzcxkjdwJBw==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr16511863wmf.45.1561978044141; 
 Mon, 01 Jul 2019 03:47:24 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC 00/11] arm64: Add support for Amlogic SM1 SoC Family
Date: Mon,  1 Jul 2019 12:46:54 +0200
Message-Id: <20190701104705.18271-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034726_074232_183B680B 
X-CRM114-Status: GOOD (  11.57  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The new Amlogic SM1 SoC Family is a derivative of the Amlogic G12A
SoC Family, with the following changes :
- Cortex-A55 cores instead of A53
- more power domains, including USB & PCIe
- a neural network co-processor (NNA)
- a CSI input and image processor
- some changes in the audio complex, thus not yet enabled
- new clocks, for NNA, CSI and a clock tree for each CPU Core

This serie does not add support for NNA, CSI or DVFS, it only
aligns with the current G12A Support.

With thie serie, the SEI610 Board has supported :
- Default-boot CPU frequency
- 4k60 HDMI without audio
- USB3 & USB-C OTG
- Ethernet
- LEDs
- IR
- GPIO Buttons
- eMMC
- SDCard
- SDIO WiFi
- UART Bluetooth

Audio (HDMI, Embedded HP, MIcs), IR Output, & RGB Led would be
supported in following patchsets.

Dependencies:
- g12-common.dtsi from the DVFS patchset at [1]

[1] https://patchwork.kernel.org/cover/11025309/

Neil Armstrong (11):
  soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
  dt-bindings: power: amlogic, meson-gx-pwrc: Add SM1 bindings
  soc: amlogic: gx-pwrc-vpu: add SM1 support
  soc: amlogic: Add support for SM1 power controller
  dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
  soc: amlogic: clk-measure: Add support for SM1
  dt-bindings: media: meson-ao-cec: add SM1 compatible
  media: platform: meson-ao-cec-g12a: add support for SM1
  dt-bindings: arm: amlogic: add SM1 bindings
  dt-bindings: arm: amlogic: add SEI Robotics SEI610 bindings
  arm64: dts: add support for SM1 based SEI Robotics SEI610

 .../devicetree/bindings/arm/amlogic.yaml      |   5 +
 .../bindings/media/meson-ao-cec.txt           |   8 +-
 .../bindings/power/amlogic,meson-gx-pwrc.txt  |  35 ++
 .../bindings/soc/amlogic/clk-measure.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 329 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  77 ++++
 drivers/media/platform/meson/ao-cec-g12a.c    |  37 +-
 drivers/soc/amlogic/Kconfig                   |  11 +
 drivers/soc/amlogic/Makefile                  |   1 +
 drivers/soc/amlogic/meson-clk-measure.c       | 134 +++++++
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c       | 120 +++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        |   2 +
 drivers/soc/amlogic/meson-sm1-pwrc.c          | 245 +++++++++++++
 include/dt-bindings/power/meson-sm1-power.h   |  15 +
 15 files changed, 1017 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
 create mode 100644 drivers/soc/amlogic/meson-sm1-pwrc.c
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
