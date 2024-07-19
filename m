Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D51C3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k0lUF+n2z6oUnPPlt0MGQ2FjQoUosOEXyVrHqCLZo+A=; b=duTSVIF54OG4iP
	V+6H+dTo5v7SAXNGGj0qf/7qzJcAff0iRhzOCTPl3/YQ741+f/NixhSFC/4/J8q9HMIVHUSQqUbq9
	8VVmJwCuqnptC85HlnzoyEXI11SRJNBREioOyIG9co999PdPQr1ovoEazKf1JW2s9jVwhSDjPlfzB
	AFiwAmFfHfTfwRNX6PbIbLovG9cA1DIZSexlHQdRs7IbNAbnO63TO60Fb8yxecbFtOUvYhJKbmUv5
	WmdWV/b8Xbnxos9hCELesXI6Si7f8p9SEZArYNsKUUNeZb+txWlWJsHRa0iTDychkoVDuaprxP7An
	IbvBS8NFjEm/9jmxSQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk8Q-00000002HNN-2XHn;
	Fri, 19 Jul 2024 09:42:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk8N-00000002HM3-2VlJ
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:42:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso10671645e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721382158; x=1721986958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=absASMJWiUMJNRR/W+ONHnqy1vIsoCnEdvZkyAg2UEM=;
        b=pCyO6Fo5Hm64SEM+bF8bV2TiAf0MRYFPvuXEx2ekG/dxDYxj7u9/DdQfVfQb0UiYzZ
         TLqmg5Hc1Q+VgPGs4Xi32T+Urok/fQpKCScHQOz4OLeHhowdRupKdwA4i7xdjyMigfn+
         2YONiEykePu2aii/GVjnCjfOkXd9AKKrAqpfIb3qLP7Xf+xbxmfIZAmt+lshwAVRR79P
         da6fWB0P3W/vPqCLAFCZGL9AcrVxL70rp1F3C+N4yhtQ41hriiOaHcuc1YZxOagI2fRV
         rxt6kGmBCos5F4QjIbbTAYYMghtjD1WR+X5fy9AI1XbmjsqSHK0+NyoNNzrlV8aqf52x
         dUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382158; x=1721986958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=absASMJWiUMJNRR/W+ONHnqy1vIsoCnEdvZkyAg2UEM=;
        b=bL4tuCJQVntl7Yo8jYw5Y897jT+QmNiLblhZcdmY/5Vvik0ac73zuPv+4KXw4N+0Tz
         VzloS7yQJJ4+Vetq2MD1dKokwKKhunthyZhkffIMrvR5OJqRWGWslgSpc0jS+B93QBdk
         56mRF5XJwhpBfMIrw2pWp6XsJIFSdiDIa1LAoBhp0BPU+vwp4qvQa41dIjt6SgHP3mJe
         i0GEtxM+ucYsqnqbCEigixbbd0UgYb0X16B3/O+3ylqt9fP9Cz+JppTUzuTRNEr1QMAb
         kn/0Orr7jqmVeVd6IXVWyS+3qEywpfcbyJNeZo8VHiCHPc884NMPjmsjsFmC4IR1o3Sf
         PJpA==
X-Forwarded-Encrypted: i=1; AJvYcCX74PkFWSQPz6w2hSwzm8DRmBb/YWpLDhdvJVpaumvylNDGZExcvKGqisVI/MRUlL2lMxpFEfekbnVbsMqz0c/B0GbF+X7sEAsrBG8W7l3YSPk=
X-Gm-Message-State: AOJu0Yxl/u9UhvNMHzEyxhWBt7l+bzc+uSF3+6ncMv9GRvc23vNSPSjY
	ETHFNzFPWJP+9lVAyOEFbK81piqM9fi5BTo7IVPpMDDXDNGVqr/x5J3E6hP23I9XXBKXXHbnXr1
	6CDQ=
X-Google-Smtp-Source: AGHT+IG4v/ss+PiQLQnGGLGki6lPDQZENxCTZpG5h6RbskU4SnVGhhGFRVioB37Y3ZMtMayAAwk6sA==
X-Received: by 2002:a05:600c:4e92:b0:426:5c34:b19b with SMTP id 5b1f17b1804b1-427c2cc33damr46088045e9.20.1721382157653;
        Fri, 19 Jul 2024 02:42:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-427d2a8d988sm45267445e9.34.2024.07.19.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:42:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: meson: introduce symbol namespace for amlogic clocks
Date: Fri, 19 Jul 2024 11:42:26 +0200
Message-ID: <20240719094228.3985595-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_024239_673351_9DD01BA3 
X-CRM114-Status: GOOD (  10.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Symbols exported by the Amlogic clock modules are only meant to be used by
Amlogic clock controller drivers. Using a dedicated symbols namespace make
that clear and help clean the global namespace of symbols other modules do
no need.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c   |  1 +
 drivers/clk/meson/a1-pll.c           |  1 +
 drivers/clk/meson/axg-aoclk.c        |  1 +
 drivers/clk/meson/axg-audio.c        |  1 +
 drivers/clk/meson/axg.c              |  1 +
 drivers/clk/meson/c3-peripherals.c   |  1 +
 drivers/clk/meson/c3-pll.c           |  1 +
 drivers/clk/meson/clk-cpu-dyndiv.c   |  3 ++-
 drivers/clk/meson/clk-dualdiv.c      |  5 +++--
 drivers/clk/meson/clk-mpll.c         |  5 +++--
 drivers/clk/meson/clk-phase.c        |  8 ++++----
 drivers/clk/meson/clk-pll.c          |  7 ++++---
 drivers/clk/meson/clk-regmap.c       | 13 +++++++------
 drivers/clk/meson/g12a-aoclk.c       |  1 +
 drivers/clk/meson/g12a.c             |  1 +
 drivers/clk/meson/gxbb-aoclk.c       |  1 +
 drivers/clk/meson/gxbb.c             |  1 +
 drivers/clk/meson/meson-aoclk.c      |  3 ++-
 drivers/clk/meson/meson-clkc-utils.c |  3 ++-
 drivers/clk/meson/meson-eeclk.c      |  3 ++-
 drivers/clk/meson/s4-peripherals.c   |  1 +
 drivers/clk/meson/s4-pll.c           |  1 +
 drivers/clk/meson/sclk-div.c         |  3 ++-
 drivers/clk/meson/vclk.c             |  5 +++--
 drivers/clk/meson/vid-pll-div.c      |  3 ++-
 25 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 99b5bc450446..53ffbc1cd6f4 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2246,3 +2246,4 @@ MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index a16e537d139a..5236821bc3bc 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -360,3 +360,4 @@ MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index fa1dcb7f91e4..1dabc81535a6 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -342,3 +342,4 @@ module_platform_driver(axg_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 06dc1e1f45e5..beda86349389 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1912,3 +1912,4 @@ module_platform_driver(axg_audio_driver);
 MODULE_DESCRIPTION("Amlogic AXG/G12A/SM1 Audio Clock driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 065b5f198297..757c7a28c53d 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -2187,3 +2187,4 @@ module_platform_driver(axg_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 56b33d23c317..dae80943a6c7 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2364,3 +2364,4 @@ module_platform_driver(c3_peripherals_driver);
 MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 6d5271c61d14..5ff409e89cd2 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -745,3 +745,4 @@ module_platform_driver(c3_pll_driver);
 MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index aa824b030cb8..6c1f58826e24 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -65,8 +65,9 @@ const struct clk_ops meson_clk_cpu_dyndiv_ops = {
 	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
 };
-EXPORT_SYMBOL_GPL(meson_clk_cpu_dyndiv_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_cpu_dyndiv_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic CPU Dynamic Clock divider");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index d46c02b51be5..913bf25d3771 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -130,14 +130,15 @@ const struct clk_ops meson_clk_dualdiv_ops = {
 	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
 };
-EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_dualdiv_ro_ops = {
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
-EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ro_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic dual divider driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index eae9b7dc5a6c..f639d56f0fd3 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -165,7 +165,7 @@ const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.determine_rate	= mpll_determine_rate,
 };
-EXPORT_SYMBOL_GPL(meson_clk_mpll_ro_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ro_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
@@ -173,8 +173,9 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.set_rate	= mpll_set_rate,
 	.init		= mpll_init,
 };
-EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic MPLL driver");
 MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index ff3f0b1a3ed1..c1526fbfb6c4 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -61,7 +61,7 @@ const struct clk_ops meson_clk_phase_ops = {
 	.get_phase	= meson_clk_phase_get_phase,
 	.set_phase	= meson_clk_phase_set_phase,
 };
-EXPORT_SYMBOL_GPL(meson_clk_phase_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_phase_ops, CLK_MESON);
 
 /*
  * This is a special clock for the audio controller.
@@ -123,7 +123,7 @@ const struct clk_ops meson_clk_triphase_ops = {
 	.get_phase	= meson_clk_triphase_get_phase,
 	.set_phase	= meson_clk_triphase_set_phase,
 };
-EXPORT_SYMBOL_GPL(meson_clk_triphase_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_triphase_ops, CLK_MESON);
 
 /*
  * This is a special clock for the audio controller.
@@ -178,9 +178,9 @@ const struct clk_ops meson_sclk_ws_inv_ops = {
 	.get_phase	= meson_sclk_ws_inv_get_phase,
 	.set_phase	= meson_sclk_ws_inv_set_phase,
 };
-EXPORT_SYMBOL_GPL(meson_sclk_ws_inv_ops);
-
+EXPORT_SYMBOL_NS_GPL(meson_sclk_ws_inv_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic phase driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 467dc8b61a37..bc570a2ff3a3 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -472,7 +472,7 @@ const struct clk_ops meson_clk_pcie_pll_ops = {
 	.enable		= meson_clk_pcie_pll_enable,
 	.disable	= meson_clk_pll_disable
 };
-EXPORT_SYMBOL_GPL(meson_clk_pcie_pll_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pcie_pll_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_pll_ops = {
 	.init		= meson_clk_pll_init,
@@ -483,15 +483,16 @@ const struct clk_ops meson_clk_pll_ops = {
 	.enable		= meson_clk_pll_enable,
 	.disable	= meson_clk_pll_disable
 };
-EXPORT_SYMBOL_GPL(meson_clk_pll_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_pll_ro_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
-EXPORT_SYMBOL_GPL(meson_clk_pll_ro_ops);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ro_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic PLL driver");
 MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index ad116d24f700..07f7e441b916 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -49,12 +49,12 @@ const struct clk_ops clk_regmap_gate_ops = {
 	.disable = clk_regmap_gate_disable,
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_gate_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_gate_ro_ops = {
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_gate_ro_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, CLK_MESON);
 
 static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 						unsigned long prate)
@@ -125,13 +125,13 @@ const struct clk_ops clk_regmap_divider_ops = {
 	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_divider_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_divider_ro_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
 
 static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
 {
@@ -174,13 +174,14 @@ const struct clk_ops clk_regmap_mux_ops = {
 	.set_parent = clk_regmap_mux_set_parent,
 	.determine_rate = clk_regmap_mux_determine_rate,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_mux_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_mux_ro_ops = {
 	.get_parent = clk_regmap_mux_get_parent,
 };
-EXPORT_SYMBOL_GPL(clk_regmap_mux_ro_ops);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic regmap backed clock driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index a5f4d15d8396..f0a18d8c9fc2 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -477,3 +477,4 @@ module_platform_driver(g12a_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ec3b61686770..3c01b395205d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5616,3 +5616,4 @@ module_platform_driver(g12a_driver);
 
 MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 33fafbdf65c4..83b034157b35 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -303,3 +303,4 @@ module_platform_driver(gxbb_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index d3175e4335bb..f071faad1ebb 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -3571,3 +3571,4 @@ module_platform_driver(gxbb_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 2dd064201fae..053940ee8940 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -88,7 +88,8 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
-EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
+EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic Always-ON Clock Controller helpers");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 4dd5948b7ae4..a8cd2c21fab7 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -20,7 +20,8 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 
 	return data->hws[idx];
 }
-EXPORT_SYMBOL_GPL(meson_clk_hw_get);
+EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 570992eece86..66f79e384fe5 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -57,7 +57,8 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
-EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
+EXPORT_SYMBOL_NS_GPL(meson_eeclkc_probe, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 130c50554290..ee01e6839f38 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3814,3 +3814,4 @@ module_platform_driver(s4_driver);
 MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index c2afade24f9f..d679ee8f85fd 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -873,3 +873,4 @@ module_platform_driver(s4_driver);
 MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index 987f5b06587c..ae03b048182f 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -247,8 +247,9 @@ const struct clk_ops meson_sclk_div_ops = {
 	.set_duty_cycle = sclk_div_set_duty_cycle,
 	.init		= sclk_div_init,
 };
-EXPORT_SYMBOL_GPL(meson_sclk_div_ops);
+EXPORT_SYMBOL_NS_GPL(meson_sclk_div_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic Sample divider driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
index e886df55d6e3..36f637d2d01b 100644
--- a/drivers/clk/meson/vclk.c
+++ b/drivers/clk/meson/vclk.c
@@ -49,7 +49,7 @@ const struct clk_ops meson_vclk_gate_ops = {
 	.disable = meson_vclk_gate_disable,
 	.is_enabled = meson_vclk_gate_is_enabled,
 };
-EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
+EXPORT_SYMBOL_NS_GPL(meson_vclk_gate_ops, CLK_MESON);
 
 /* The VCLK Divider has supplementary reset & enable bits */
 
@@ -134,8 +134,9 @@ const struct clk_ops meson_vclk_div_ops = {
 	.disable = meson_vclk_div_disable,
 	.is_enabled = meson_vclk_div_is_enabled,
 };
-EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
+EXPORT_SYMBOL_NS_GPL(meson_vclk_div_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic vclk clock driver");
 MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index ee129f86794d..486cf68fc97a 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -92,8 +92,9 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 const struct clk_ops meson_vid_pll_div_ro_ops = {
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
-EXPORT_SYMBOL_GPL(meson_vid_pll_div_ro_ops);
+EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, CLK_MESON);
 
 MODULE_DESCRIPTION("Amlogic video pll divider driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(CLK_MESON);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
