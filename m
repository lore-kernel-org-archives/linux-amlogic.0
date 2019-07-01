Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E91C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197CD2145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hV4p/Hzo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y/+nvdVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197CD2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FAHto1wG6VfalH7VJTcfGFT2nywsau30X5aGaSrF5lo=; b=hV4p/HzoYpWeq5
	/DG21lwPhLidKgmXCqLzRXvIpcksdUDLaEsepWa/srLGNJHv7Ltk/TImn42V8xDanpALsKG7+lv6d
	QQF6ce+BZh2wKm+gyTW/8VWmEbPckzEvSkA/PW3ib+XNvoTdP2jjRQGV25n66ToYMaRA0WLXGqGxL
	Z8s1M6eEoOmQbj9/AL8IZEm9L+1il7IocbSS6cViqVCxP3vA5IPzoPd70HmQ1+gaIU90lMa9sxs9I
	Qvt1HjteN/4RnqLUnYOFdFGE+J6zQekMP3mRYL09GFzMZQSUWEaQ4BeZtm4Vb2lzD7I+Fcj3UvgZ3
	4cDChpUbLNbe3wHRYNfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhsNv-0003vo-Mo; Mon, 01 Jul 2019 09:14:03 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhsN6-0003DM-Op
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 09:13:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id z23so15019407wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5u4pWU3fhpBiHxumPv/qTZvnc0aCekcJz77EzSTwqA=;
 b=Y/+nvdVSW313vqjXZLRZxPJSbMTY9V5q7d9kbNc707FQ5DLekBH9JBsqxcqQSdcpsG
 fa9fbsfFISHQYuSag01PKjhD83+23p8PsdwbCp6pLzymoDUwiIVRvK4/+jpO8JTVE1+a
 VvVSu1ae4DHEwx1lAL0LzX6VXG4GNQybC3ts7Z2vwR2gFq4KUWAJMLBjtMaGjD6NVTdv
 OLEZU+KjrXbbZtizvbXrdIf3H1cn0/yYeD4OJUF9i7JYk1covruE8wiu3q+SvWM7oq1l
 b38IsjfQaAtcb9JYO7ZSRG5G0gWBlvmfIWH+SxRWLqT1JkrWBCVlFXlw0AkG+l+Tc+88
 +p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5u4pWU3fhpBiHxumPv/qTZvnc0aCekcJz77EzSTwqA=;
 b=rNt8QFMCQZ0GW8moWHGFdtN/P5saGdlgQg+bSsGz15DwbxFz5VYFi37N20zrOd5oVj
 3CDBNJawluoLARkUy/V81Xqrs1vjn040ko5iY81Wn138rtCcxskQiBSYI8xqYPWKLi0q
 89UQW0QXecvvPHW7Tjadsx9y2xLK2OKN+WboP4tF9RTB0H91zQBIjyyD7awMzGm005y+
 xfylzcC1144jpjs38QMIBvMMqKJh/sTXGALXz80A9RjOhybxJeq5eaVSB+mRQmuw62nF
 ea0aHHq1Z0oBFIaSt/U96X+JPkebo/jQu65pWGsTQejW2EDld2OagHxhbe8Cp7+6oCJn
 mOzQ==
X-Gm-Message-State: APjAAAX+VKg9pcp9fgQYHaqiQd6/ZoIOfxBQ3izh0q/BDK9CpbcXMRai
 R6Wu4FJW4l/jV/usk00K7lXeaQ==
X-Google-Smtp-Source: APXvYqz2UhQEnseZ8WNhpF/O9vEWNicypD7qyv62oJG8BxzOAHVHA2jQIKd9fwd+Rev2X/o90QCKlw==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr15810427wmg.69.1561972390865; 
 Mon, 01 Jul 2019 02:13:10 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 02:13:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v3 00/14] arm64: g12a: add support for DVFS
Date: Mon,  1 Jul 2019 11:12:44 +0200
Message-Id: <20190701091258.3870-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_021312_804476_BEE776A2 
X-CRM114-Status: GOOD (  12.07  )
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

Changes since RFT/RFC v2 at [4]:
- Rebased on linux-amlogic v5.3/dt64 and clk-meson v5.3/drivers trees
- fixed mesure/measure in patch 5
- added Kevin's review tags

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
[4] https://patchwork.kernel.org/cover/11017273/

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

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 2416 ++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |   55 +
 .../boot/dts/amlogic/meson-g12a-u200.dts      |   54 +
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   52 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 2455 +----------------
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
 17 files changed, 3390 insertions(+), 2436 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
