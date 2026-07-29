Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D7DC54F51
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gH//NEG0VrqKa1yRQXnLLq/9x6VXyaNi/KL6kCLFJtA=; b=B82jfq5uLrsefA
	MEbNSd0nX8WvWOLCExlPguquR1d7o8idgTuYsZfpp/SZXKy6WkzSEbjXu8Us7Wdl36rITEUbkbrEN
	WOo+zDfq+Gpp18GvmjWe0bsGW26TDfLzFj7lDFBLoAWqDqp71WWPuJwn4PBzENLtDaLHwR51e/iR3
	BnIp7wtjOqUnp7oD1JE7VldNR048DXQN/fU6fjx7ejvZbWDC8iGbbbJwqFhli1YnuYjZ8aDz7V0Gg
	xOUiCEMT/TiSkDPKT5VLBMse2yY9uc2CW3lF10Ki0DGvWdOzt99IsfkH9vCANeYwBIMxtjvOwKppK
	65SQb0CUBD/3o6/CBxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51V-00000008Dih-4Bwa;
	Wed, 29 Jul 2026 14:12:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51T-00000008Dgx-33XN
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso722103f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334358; x=1785939158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=AsIyLdupwpCM+479y6VyVVc6FVP1LTklzA2WWBRpITDywQ0WNP41yQ+WlqFfoCYMSv
         trTYf4p6YwCf4Yzvd8WmGDVuokSFdqZa7SqPoPysjxza4Glz4RBH97JuM78HSCI2QUyi
         Uf29vKRODhGA6TUv6wiCuL1OsGflAQ0QFuR/twSTSn6D4M2ixTblvu7GbFmJhNZrfRJI
         mi7HAcGyk1sNyp+hz5mVuGWyvd2w5P0/au38wwNtxONjqgkRMxP1wwNRE4tMbIntrGQb
         nA/DUiZu529WFipPzVXc+1H3UzryxH1xvWDoQMaGJurOE1hxMAdHdxagR8urn+G7qKHZ
         ctng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334358; x=1785939158;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=MSbbtYBWEgRG1vCREKm888nVhp0aIZJIExDOEB1CzMF979/NSeKW1P6z8IRNqbU7Fx
         uDnI4VDAUpdCnWccRWShBSwc0tPhQzpMHTvDtVsFbWCB9U8WmAKDNaUzDi4y/hNy1z6m
         qEXWRrycTy5mHyLH6Pd46ZKISEzNOl8kn+aOhqKAINgtvLo4L8oYpB2kP4upz/OKBsQM
         HSgEsKatQncibJ4Q/3vNvzEvpUcmW1XoBl7GhFSKz3ImCzcbOno7231iSwda/ITvjZhX
         KvKLmW8xBZf/J6neIZt6WzlVKzCQ299TOYtF18JaBANlPnVaDoT88GvHKXvsugU1E/C0
         W+jQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod3O9mww745ueYaJrfhemNomLZGsRn+P9oTT+Cou29tQh8ywfok0kB6iAlTCoU/9tJPLMxBtPxhwrFR1V4@lists.infradead.org
X-Gm-Message-State: AOJu0YzNgb+0K4xXPu2ztq6Z6vnJCtAVJ/M7WJKmY9SPycfSmvx4tosg
	xiXW4k2Wz0Or4o9y+1qdFbiaE0U+PsMenMwCwKLW/Dl8jXBMmsx7PvF1
X-Gm-Gg: AR+sD13K+Q11b/ZnXG+GKd4HmN0E941ezuT5F79Iboy+VsGg8kgEZGyAY0G7RTV8NsH
	MZZsiZ5m5JlmNyoIaOnwFlsNt3wsYTDvzQ6y15/A1BS84kyVZzyDl26OdArD9ZF6iD7lwfipurq
	gu4XaGlIboPExzIgjaVcdKOJ196JZdDkhzLjdqxW79AMWoB26PcDPZ6Qf25NHwtXgqALJ6ZELr6
	5vaMj3GgwtV15lfl2u5qWZlpN5eWH7s02h3huoLxkGc7Zlz8lqw2b5KkMdOel+dPMd6VpUocmgy
	xtCxumS4hsuqSvrXTGEvAZtL+PfrXg5ndezmEGZHeljliZ2qxzQAMTqs1qiJ7zzleO05OaHbIqc
	AI1dL6XKE7r3ruR/kCXTPJkdssqKaE5Q0+ZOalbrDGfl2ROQ/zZPlhqXi/UYyZGaHocyfBIlkoW
	baksUp+LdAhUNnMZ/Vunxn1OORH9ftucse/aBwLucpAFmu51DFSV9ZUV+y20d1UkX2R5iyUeJz8
	3Khq8DDYVrIdxX0CwQfkQ==
X-Received: by 2002:a05:6000:2c0a:b0:47f:9464:86c3 with SMTP id ffacd0b85a97d-47fb1ee73e1mr8634331f8f.57.1785334357591;
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:31 +0200
Message-ID: <20260729141234.65037-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071239_782812_F669E014 
X-CRM114-Status: GOOD (  12.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

---
Changes in v3:
- Polished meson-g12b-zora-p1.dts.
  - Use proper comment with /* and */.
  - Use the new bindings with function and color properties instead of
    label in leds node.
  - Include dt-bindings/leds/common.h.

---
Changes in v4:
- Dropped unnecessary sentences from patch 1 and 2.
- Renamed "wifi32k" node to "clock-32768" as updated guidelines suggest.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
