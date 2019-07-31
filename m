Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D74C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:43:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7784E206B8
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/bl4+PI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KJZc4a+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7784E206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bZbdt97BFrvAluii7z6QwZBetiwU94qk3ggm2Z9K5R4=; b=M/bl4+PIb63g6v
	K44GO8woN3yDlXQDjEEFXD5M9QXvlax3MowUCD3Oe5bUt10/aQsbVNeESNC3LFVeXetIwzASZJs5q
	SHyl9AfS7jiCDvKkKGRsl0hpWOftAPVdAGb7SOyjtR8kgvX5ZaN1a+/Ky+pR9WmuAJbKYSZApbS6j
	nmg3SbgWj+6GCtvtzK3PVhWjT5MfOBpUyqZrMfxZ/+ZX2+XU6xcVzUU6X62t2KmC6zjmYQCgMSb3h
	Fy0YbCwmOuprwFROwLJ0ul/K6wcGl3xNsXTnwI8v6PJwWg/xCzxyxFXZVkM7qfyaZqKgJrPcuUmlb
	w2FFcYpHA41mELZg4BDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnwp-0004vH-C0; Wed, 31 Jul 2019 12:43:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsntq-0008RT-7G
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:40:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id a15so60648300wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWI8GcxEz+8gc9lvCcOoQING9GchM8UZJzjKufeSqmc=;
 b=KJZc4a+DmVn+4+DGSWDg3GlzhLG6glcKG0j5wUAHME+JibRtdrXRNjSx+a7MyRFDuI
 hd9NV9MqzrJ/yfhsVmI9FywxsVr8GndD0kH+2ROkya1T14Jp7p2MDg0M9asAFCeTsBOp
 6xgrnxr12N5wi8/DD0EsAOL4YSdL51rXYOv4g3mJ+5yoqYlFDs9cZ5oz9Gp32hG3cL2l
 Kqamv6Q1+LgceZ1bIeqvgoTi0+iVmCw4OHvf9OwuAMQBQOXO/8BSoIHiC6NcngAl40Hv
 QBl3FZ8ix9alal5rJIZ0/1oOJ+GxtrSvzwFXNioZ0F2lX78iYTH1+d8jz2zSAL/GpAnb
 YnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWI8GcxEz+8gc9lvCcOoQING9GchM8UZJzjKufeSqmc=;
 b=GAw4UTva/y2swRodBN0XSPOFyft/NIXgNfh9y7xkx8039VFuThdbIl7pRCRGcpOGKi
 tJ77nbYndnvOCU/VOi0tOdhTiCZOL/pNEMfAKUeDSnh3y+6kX446u410xzKp6G2s66lU
 FZ0vGckksm6UZEy0/LCOJTsDlaYoGtMhL9mJEJkEsWRf5Lvn2doOjjCp0pEj4rdpuRNe
 iWNlYLKsmrOuySoyUsiV8lCsCW34jTTrhdpJPKBdIXFKsJr81gcya08hUJjW5DaF6E++
 BGMHSREwxWtTm2mIexmw4jIJdOAxBs3ACJWBPuJtn78Q6kqsKPJk2EzUuu9qR8/S/HUg
 kmqw==
X-Gm-Message-State: APjAAAUsNLjsIFvZdANO1jWocoBuAim3x0sGrMY/K/KmLkfM6BH5HndA
 Ni4T+Luis9oAKio7oHz8IYS8VA==
X-Google-Smtp-Source: APXvYqy978uWNvioeZ+pGIg+DyWJ20pUO7ItCJsalId7cA/5/FSwIaSFd8Ad245l+bIIqRqGxzP6Aw==
X-Received: by 2002:a1c:1d4f:: with SMTP id d76mr15481312wmd.127.1564576803831; 
 Wed, 31 Jul 2019 05:40:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x185sm62504271wmg.46.2019.07.31.05.40.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:40:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/6] arm64: add support for the Khadas VIM3
Date: Wed, 31 Jul 2019 14:39:54 +0200
Message-Id: <20190731124000.22072-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_054010_655579_605EC5B6 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Khadas VIM3 uses the Amlogic S922X or A311S SoC, both based on the
Amlogic G12B SoC family, on a board with the same form factor as the
VIM/VIM2 models. It ships in two variants; basic and
pro which differ in RAM and eMMC size:

- 2GB (basic) or 4GB (pro) LPDDR4 RAM
- 16GB (basic) or 32GB (pro) eMMC 5.1 storage
- 16MB SPI flash
- 10/100/1000 Base-T Ethernet
- AP6398S Wireless (802.11 a/b/g/n/ac, BT5.0)
- HDMI 2.1 video
- 1x USB 2.0 + 1x USB 3.0 ports
- 1x USB-C (power) with USB 2.0 OTG
- 3x LED's (1x red, 1x blue, 1x white)
- 3x buttons (power, function, reset)
- IR receiver
- M2 socket with PCIe, USB, ADC & I2C
- 40pin GPIO Header
- 1x micro SD card slot

First of all, the S922X and A311D are now specified since they differ
by some HW features and the capable operating points.

A common meson-g12b-khadas-vim3.dtsi is added to support both S922X and
A311D SoCs supported by two variants of the board.

Odroid-N2 is changed to use the s922x.dtsi include.

Dependencies:
- patch 5 & 6: "arm64: g12a: add support for DVFS" at [1]

[1] https://patchwork.kernel.org/cover/11063837/

Christian Hewitt (4):
  soc: amlogic: meson-gx-socinfo: add A311D id
  dt-bindings: arm: amlogic: add support for the Khadas VIM3
  arm64: dts: meson-g12b: support a311d and s922x cpu operating points
  arm64: dts: meson-g12b-khadas-vim3: add initial device-tree

Neil Armstrong (2):
  dt-bindings: arm: amlogic: add bindings for G12B based S922X SoC
  dt-bindings: arm: amlogic: add bindings for the Amlogic G12B based
    A311D SoC

 .../devicetree/bindings/arm/amlogic.yaml      |   9 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  15 +
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 149 +++++
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 542 ++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |   2 +-
 .../amlogic/meson-g12b-s922x-khadas-vim3.dts  |  15 +
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 124 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   | 115 ----
 drivers/soc/amlogic/meson-gx-socinfo.c        |   1 +
 10 files changed, 858 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
