Return-Path: <SRS0=PWIy=PE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97232C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Oct 2021 15:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5139D6109E
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Oct 2021 15:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5139D6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6sixhfUdMFNMy5hfAGPp1m61K+NbVSeM3AeRECGtxZg=; b=0i8scLl2+mhhm8
	wblhRSev2xFnKDFHKavb0gVz3hleFB8ueGsjeEjf9Gyvf/7E9qlZyiUIVndlGaoZdLlqZXj4u/6WP
	+9bKp5pBo4dGXSyeHLl1otmSWmxyZmsFg4SYfwSnhmpGFRf+h8NPAw37olK+1IPNUiJs+GXd2vJNY
	QmBH3Tf1xoEGhDzA/NCyI9sNF92nV5S6XJ6j3NRlZYqsyT/9/NjNiweAtcCnBZZdJXyt+Pkg7oNoN
	CR4+c6nVV9g0VI80BSUxjuJX+QChwW1YTGuniVjzMVh/75bHYMIBj8ZJIGq5FlME7KWxquQab0PP7
	jsKioxsMUJIV7PR/MFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mblAX-00ApW5-1j; Sat, 16 Oct 2021 15:00:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mblAU-00ApQ7-0V; Sat, 16 Oct 2021 15:00:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t2so31778085wrb.8;
 Sat, 16 Oct 2021 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KqnMuFpgSADQq8LPQeZiTx5HVHbVDQMXAFWHZfFF9ZU=;
 b=fk6S2/0U84Ed4T3ZK/U92G/9b6uIOmZ9WS6lCYyMAtTq4M0vSHh9GNLEAUbEW7U+ut
 dmoc70mZ9dAiuHQxKj+Ohy+JyJrvjaCoG5U81nEO0KU4nlovcjYIx84N6gjx3qWS+RK5
 cfkulnmvbTqh8Por5CFHoNGRwib+wNlFZAED4KW4hLJUPd6b/Tbd9jmYXbiIdK4viFXp
 /bOd2d91jI2KKnJT4G3YAmYlMqw/UCooyVr2id8UR+H9fqbCGLm6a8ATt3jt/hu62yDi
 9g0gT8LfkchWkMVlLKUWQ2CzzRM+TmiimAxB2ufhzGgTitD/VpINbAwCCz3MD8N69L/O
 ru8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KqnMuFpgSADQq8LPQeZiTx5HVHbVDQMXAFWHZfFF9ZU=;
 b=mk8KU6fEjVdY1tmAVGqOcyGN/G4HRAW15ZOsx3xB9xVhEb1gLy4xbGOl4syFmmQjzY
 hCIGNVU5qteMiPXC9zBK5eLapD15kNiwtKGMaXlvzKBXwnLgjX2EaewV9x4Husdg/G4C
 ZcuVna8/c419G/wlU1JWRWPr8xdHd6ibvwQhk+x0KSBzlBanxmW33Y7PBz2iROoK+dT5
 +ONAhMS12EddjKAjMwqmJPc3c7ZpcyuaspC3OldPd0+NR9o32OgYhsKQXVhT2mVulOGD
 oGht60RoQhiqoN6LctxeIlS7ZRIdOMbLUODFvjeLlIo0N0LvO02M4eR9Vwn5vnF4/JJt
 MXOw==
X-Gm-Message-State: AOAM531rCtXDB0autJzodBjO3MA/nPaX57cNORshveYSqVBz+AaC4hre
 za82vZD5DgW3VFyqp6tFPSALOMHI6N8=
X-Google-Smtp-Source: ABdhPJy2g66J/9AMlkBlIifsI4nVNpR0kyb4gKOZhUVlH9yhJd/6Dd7f2cmtbUvbfO3Hu7LYaOmcQw==
X-Received: by 2002:a5d:6982:: with SMTP id g2mr22269558wru.51.1634396406342; 
 Sat, 16 Oct 2021 08:00:06 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7b82-9800-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7b82:9800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id k17sm13543280wmj.0.2021.10.16.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 08:00:05 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Cc: narmstrong@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0 on
 GXBB
Date: Sat, 16 Oct 2021 16:59:39 +0200
Message-Id: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_080014_086263_F6CD776A 
X-CRM114-Status: GOOD (  18.01  )
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

Christian reports that 48kHz audio does not work on his WeTek Play 2
(which uses a GXBB SoC), while 44.1kHz audio works fine on the same
board. He also reports that 48kHz audio works on GXL and GXM SoCs,
which are using an (almost) identical AIU (audio controller).

Experimenting has shown that MPLL0 is causing this problem. In the .dts
we have by default:
	assigned-clocks = <&clkc CLKID_MPLL0>,
			  <&clkc CLKID_MPLL1>,
			  <&clkc CLKID_MPLL2>;
	assigned-clock-rates = <294912000>,
			       <270950400>,
			       <393216000>;
The MPLL0 rate is divisible by 48kHz without remainder and the MPLL1
rate is divisible by 44.1kHz without remainder. Swapping these two clock
rates "fixes" 48kHz audio but breaks 44.1kHz audio.

Everything looks normal when looking at the info provided by the common
clock framework while playing 48kHz audio (via I2S with mclk-fs = 256):
        mpll_prediv                 1        1        0  2000000000
           mpll0_div                1        1        0   294909641
              mpll0                 1        1        0   294909641
                 cts_amclk_sel       1        1        0   294909641
                    cts_amclk_div       1        1        0    12287902
                       cts_amclk       1        1        0    12287902

meson-clk-msr however shows that the actual MPLL0 clock is off by more
than 38MHz:
        mp0_out               333322917    +/-10416Hz

The 3.14 vendor kernel uses the following code to enable SSEN only for
MPLL0 (where con_reg2 is HHI_MPLL_CNTL and SSEN_shift is 25):
	if (strncmp(hw->clk->name, "mpll_clk_out0", 13) == 0) {
		val = readl(mpll->con_reg2);
		val |= 1 <<  mpll->SSEN_shift;
		writel(val, mpll->con_reg2);
	}

Add the SSEN (spread spectrum enable) bit and add the
CLK_MESON_MPLL_SPREAD_SPECTRUM flag to enable this bit for MPLL0. Do
this for GXBB *only* since GXL doesn't seem to care if this bit is set
or not, meaning that meson-clk-msr always sees (approximately) the same
frequency as common clock framework.

Fixes: 8925dbd03bb29b ("clk: meson: gxbb: no spread spectrum on mpll")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 50 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index d6eed760327d..673bc915c7d9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -713,6 +713,41 @@ static struct clk_regmap gxbb_mpll_prediv = {
 };
 
 static struct clk_regmap gxbb_mpll0_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = HHI_MPLL_CNTL7,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = HHI_MPLL_CNTL7,
+			.shift   = 15,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = HHI_MPLL_CNTL7,
+			.shift   = 16,
+			.width   = 9,
+		},
+		.ssen = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 25,
+			.width   = 1,
+		},
+		.flags = CLK_MESON_MPLL_SPREAD_SPECTRUM,
+		.lock = &meson_clk_lock,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll0_div",
+		.ops = &meson_clk_mpll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&gxbb_mpll_prediv.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap gxl_mpll0_div = {
 	.data = &(struct meson_clk_mpll_data){
 		.sdm = {
 			.reg_off = HHI_MPLL_CNTL7,
@@ -749,7 +784,16 @@ static struct clk_regmap gxbb_mpll0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) { &gxbb_mpll0_div.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * GXL and GXBB have different SSEN requirements. We
+			 * fallback to the global naming string mechanism so
+			 * mpll0_div picks up the appropriate one.
+			 */
+			.name = "mpll0_div",
+			.index = -1,
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -3044,7 +3088,7 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
 		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
 		[CLKID_VAPB]		    = &gxbb_vapb.hw,
-		[CLKID_MPLL0_DIV]	    = &gxbb_mpll0_div.hw,
+		[CLKID_MPLL0_DIV]	    = &gxl_mpll0_div.hw,
 		[CLKID_MPLL1_DIV]	    = &gxbb_mpll1_div.hw,
 		[CLKID_MPLL2_DIV]	    = &gxbb_mpll2_div.hw,
 		[CLKID_MPLL_PREDIV]	    = &gxbb_mpll_prediv.hw,
@@ -3439,7 +3483,7 @@ static struct clk_regmap *const gxl_clk_regmaps[] = {
 	&gxbb_mpll0,
 	&gxbb_mpll1,
 	&gxbb_mpll2,
-	&gxbb_mpll0_div,
+	&gxl_mpll0_div,
 	&gxbb_mpll1_div,
 	&gxbb_mpll2_div,
 	&gxbb_cts_amclk_div,
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
