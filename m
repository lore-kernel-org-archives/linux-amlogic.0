Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13605C48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F3320645
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQZZigTU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EmhhuBkj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2F3320645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OsywfDIXU51pJOJIM9Vt6p6+PTqkA2saRXxiXqwUVok=; b=ZQZZigTUxW/jXA
	KtKLOHf3IO2MqyClh1V4Or3YtoQKQN1UTajGg6FYVZte/c5OJHBUZnIAj98fJbPO8aCxqgohaNacb
	FSr3W2bVv5jgJ6HauGQpB+jd/gLK5LDzj+WCBNlPulmMmcw0zgWlhcQM1J8TVrCpO4iBe8TmKyAuT
	/I0/N1AN9J8YNSIc+WFC/6xyEfp69qPHzv77kPPv6iUMycKy70R4w/5mrIh9ZtcElABg53NNj99kP
	eLnjHrkTm3XGsUFTeg5yXijdh1JotrWMVZ2t3RiDzKZojnKwQimsebYsLvKcKkJ+ZjY+FZgylm9u/
	Ql7oSwMR0d4OWL3nsw6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3t2-0002Y0-LB; Wed, 26 Jun 2019 09:06:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3sz-0002WS-Qa
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id f15so1807409wrp.2
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mNkBOhUSKZktXVzPgYHzPfOcBUciHYL1qLyKm8m40Ho=;
 b=EmhhuBkjS/9rAtIkcIwpIcgZ3Gwn0zrnRkXyLjCQGmjeXCOilfqZFNx1wo3/FJFa7U
 9Zf3mWYjuMWiSMztjZ+t0JkNLNA6+0NxTB0hHImzdVdROhyBF+N/VFwugbb1cfquvnDM
 GigBE7k6TeDt+uMKPhQ6uMbUFN9qCJoBpsLPJXOVwMC1otSloUNC73MuEtir+kHO0GpJ
 tf6H17PB/xAW7OUvxq1AdK5eoVwnr8vjho6yMVp+WQGfyPxn3AUJX6jitZCBLI+iwgR1
 Yv64S3XIM0zji9dq5d9l+SNyhHmrsz6JnPZIiYZwTnGRwGDwbOdd2uQvWaS+1r9FPz7r
 kYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mNkBOhUSKZktXVzPgYHzPfOcBUciHYL1qLyKm8m40Ho=;
 b=cdYQQtiyQlAbyuxP8/dA/Lj10EAA/ogPixgeOZNjFBSUXh9Iqe+LpE8iYiUKvD1+vo
 tSiZh9fVx5ZvnQTm8KrM6h/YPc0kSYZksZCd/WrasVpcU+rbNgxxuTRdSvr6r1DXy1mW
 PPmtnDqWZ/qujTsonwlIuqotOAaVZ+21Pz9gOhva9gQlrSwZ7Ez1qiMRzBQh58hhTHXF
 76ppyLDwSWnrTjq/bsRfFYHjReD9IBC7L/MEpI/s1oNBmu1O0QZot7w67AR7VC3fcqQ7
 /qe0WG3JhnkGTkbxJOmMlwu8do164j7YP8TMDTF2XdosImml9yGP+DZcZoF4i3eVMFjR
 O+Hg==
X-Gm-Message-State: APjAAAVzQNmhbKonBlkoe59+emeoCKD6HzOSUvpna31B0JksRAt5uowG
 /z0m2PC4YUie0YqjVTAFn/xo6g==
X-Google-Smtp-Source: APXvYqwkO8aDGnvu8iP8rFMRwxiWuy/j1doyJakOZ/B3vub9BJrH3obe1f2ZF8drEhnPsKEo5ODJtQ==
X-Received: by 2002:adf:afde:: with SMTP id y30mr2683421wrd.197.1561539996153; 
 Wed, 26 Jun 2019 02:06:36 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 02:06:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v2 00/14] arm64: g12a: add support for DVFS
Date: Wed, 26 Jun 2019 11:06:18 +0200
Message-Id: <20190626090632.7540-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020637_867050_26D1637F 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
cpu_clk / cpub_clk
|   \- cpu_clk_dyn
|      |  \- cpu_clk_premux0
|      |        |- cpu_clk_postmux0
|      |        |    |- cpu_clk_dyn0_div
|      |        |    \- xtal/fclk_div2/fclk_div3
|      |        \- xtal/fclk_div2/fclk_div3
|      \- cpu_clk_premux1
|            |- cpu_clk_postmux1
|            |    |- cpu_clk_dyn1_div
|            |    \- xtal/fclk_div2/fclk_div3
|            \- xtal/fclk_div2/fclk_div3
\ sys_pll / sys1_pll

This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
the CPU clock in a safe way as recommended by the vendor Documentation
and reference code.

This patchset :
- introduces needed core and meson clk changes
- adds support for the G12B second cluster clock measurer ids
- protects clock measurer from cooncurent measures
- adds the clock notifiers
- moves the G12A DT to a common g12a-common dtsi
- adds the G12A and G12B OPPs
- enables DVFS on all supported boards

Dependencies:
- PWM AO input order fix at [1]
- PWM enhancements from Martin at [2]

Changes since RFT/RFC v1 at [3]:
- Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
- Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
- Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
- Fixed typo in "this the current path" in g12a.c
- Fixed G12B dtsi by adding back the sdio quirk
- Fixed G12A dtsi unwanted sdio quirk removal
- Fixed various checkpatch errors

[1] https://patchwork.kernel.org/patch/11006835/
[2] https://patchwork.kernel.org/patch/11006835/
[3] https://patchwork.kernel.org/cover/11006929/

Neil Armstrong (14):
  pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
  clk: core: introduce clk_hw_set_parent()
  clk: meson: regmap: export regmap_div ops functions
  clk: meson: eeclk: add setup callback
  soc: amlogic: meson-clk-measure: protect measure with a mutex
  soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B
  arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
  arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
  arm64: dts: meson-g12a: add cpus OPP table
  arm64: dts: meson-g12a: enable DVFS on G12A boards
  arm64: dts: meson-g12b: add cpus OPP tables
  arm64: dts: meson-g12b-odroid-n2: enable DVFS

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 2464 ++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |   55 +
 .../boot/dts/amlogic/meson-g12a-u200.dts      |   55 +
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   52 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 2502 +----------------
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |   96 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  145 +-
 drivers/clk/clk.c                             |    6 +
 drivers/clk/meson/clk-regmap.c                |   10 +-
 drivers/clk/meson/clk-regmap.h                |    5 +
 drivers/clk/meson/g12a.c                      |  500 +++-
 drivers/clk/meson/meson-eeclk.c               |    6 +
 drivers/clk/meson/meson-eeclk.h               |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |    9 +
 drivers/soc/amlogic/meson-clk-measure.c       |   14 +-
 include/dt-bindings/clock/g12a-clkc.h         |    1 +
 include/linux/clk-provider.h                  |    1 +
 17 files changed, 3439 insertions(+), 2483 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
