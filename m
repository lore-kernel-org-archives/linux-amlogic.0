Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FD0C54E4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B68E5206DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 13:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2p9gMGX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V9IwWVvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B68E5206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItP5rfJBeSu7pODBnBQf1fqdR2acNECtry/NZq0ocKY=; b=D2p9gMGXP+liV1
	cjkKj/xm5uJP8NuyniXFG+S8ABsYbgjfVL05AKzLRV+rXmxC4j5j58+Mmk+oR/XYYUiSHOPpOgn4Y
	HUXG6eQ3aeeZUTCxgOXY+fJczwpZHl3KF9odY6rAhJki0JUJk3Ikmn1gpL/p6lJKmy1MTU86nwWFN
	reQGlXHt6FpjJal1KnOrxLKEzYi54QTYemRSl+ONmonNsWXY1wPj7M7v9iE6X6p//FmV4GXYd8IMl
	wWH3xGDheRZmsEpf0ERHUA26LMcLKhPuPaRCzT2bKKxUrJIqxNx3pNDuuYx7mP3YFUkg2YFzeg6Q4
	Dy626gZ2Fat2n4LGXpDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUvQ-0001X3-42; Tue, 12 May 2020 13:26:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUvL-0001Tj-L6
 for linux-amlogic@lists.infradead.org; Tue, 12 May 2020 13:26:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id j5so15393975wrq.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 May 2020 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Go6EA70bJtcKVjvR24qLP1HyJXRwhoEX5J2ggLK/lwQ=;
 b=V9IwWVvxcnMOOd8GRgTS4y27COjD5qrtjdcUZMAxV10Dvh5RLePnyv24HbbmrYTZkX
 GKKfzgDe0UDI6SYRYz/oDmbz3Vf/GybO6G0+nMAF4dL3ViBdTUZj4xaP+LFDaXHskxIF
 qwBoko4GWjQI04zwo1UArfZNOHCJGDbkEi6PqMk5LbaukqduKwtZDT5j4Mqb5cKC+Izy
 p0IZgDYZW64qSUSnSR3lli9NcOzExfZtu/PL9Ww5uVv7/K0CuGo0WYfgfRmA0z2zqFmh
 VVgsN/CJOjb2xq6ccsRMrq1VtofyoY+AuAk+E1U3Lhy7znx6YA8nMylVriZHmXBiP8s7
 xsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Go6EA70bJtcKVjvR24qLP1HyJXRwhoEX5J2ggLK/lwQ=;
 b=bBuH81yM5DgUc62Pu3fjfmUmqUIAFQF3Pkx8mT21eiMigKGTaQCX3zTXm6jhDK08n4
 oUZaQY/fKs0+y32Ut+fVIXFeB4P655T+k5KGNHRjmr/PsxgaZvyyi4Be7lpyKMs0urMt
 fHXzDKJ2Ck5By2tiFEG9kGXUdUcHkMRbJQnI4sbyzGdUPKLqrXV6Q7owOAfT55zYZQUU
 azUgV6lHUUoNSY4ii3OHA2KagfNbnAlQhlKlIchpGG56eGeu25wx5yUYnDlvoKb3K09R
 72Qz/260IAnpbHSPuw95QMj87DGXROgbrucBmWL6pln9HV4xJH+8E1NxHz7BYHas6O37
 wthw==
X-Gm-Message-State: AGi0PuaA2KVKTa5JYAvnhXfU//NBphfouQmQVWdbe+Ipxvx+t16eSFzd
 6oHukjAzYx4v8ehubAJcyKDfKQ==
X-Google-Smtp-Source: APiQypI2kanwMn4n6b+uBjRG3a2Lgj0R69NagRGMzqIb2DZ1OgzPeFumG1+jUYUZSQEWNSEXhZ40Pw==
X-Received: by 2002:adf:face:: with SMTP id a14mr24734851wrs.397.1589289977653; 
 Tue, 12 May 2020 06:26:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 g15sm14441844wro.71.2020.05.12.06.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 06:26:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lee.jones@linaro.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
 srinivas.kandagatla@linaro.org
Subject: [PATCH v2 0/6] mfd: Add support for Khadas Microcontroller
Date: Tue, 12 May 2020 15:26:07 +0200
Message-Id: <20200512132613.31507-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_062619_697070_1857D656 
X-CRM114-Status: GOOD (  12.04  )
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

The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
connected via I2C.

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Thie serie adds :
- the bindings
- the MFD driver
- the HWMON cell driver
- the NVMEM cell driver
- updates MAINTAINERS
- add support into the Khadas VIM3/VIM3L DT

Patch 6 depends on [1].

Changes since RFC v1 at [2]:
- moved hwmon driver to thermal-only
- moved the SM1 thermal nodes in a separate serie
- added the bindings review tag from rob

[1] http://lore.kernel.org/r/20200512093916.19676-1-narmstrong@baylibre.com
[2] http://lore.kernel.org/r/20200421080102.22796-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: mfd: add Khadas Microcontroller bindings
  mfd: add support for the Khadas System control Microcontroller
  thermal: add support for the MCU controlled FAN on Khadas boards
  nvmem: add support for the Khadas MCU Programmable User Memory
  MAINTAINERS: add myself as maintainer for Khadas MCU drivers
  arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  44 +++++
 MAINTAINERS                                   |  10 +
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  23 +++
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/khadas-mcu.c                      | 143 ++++++++++++++
 drivers/nvmem/Kconfig                         |   8 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/khadas-mcu-user-mem.c           | 128 +++++++++++++
 drivers/thermal/Kconfig                       |  10 +
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/khadas_mcu_fan.c              | 174 ++++++++++++++++++
 include/linux/mfd/khadas-mcu.h                |  91 +++++++++
 13 files changed, 649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
 create mode 100644 drivers/mfd/khadas-mcu.c
 create mode 100644 drivers/nvmem/khadas-mcu-user-mem.c
 create mode 100644 drivers/thermal/khadas_mcu_fan.c
 create mode 100644 include/linux/mfd/khadas-mcu.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
