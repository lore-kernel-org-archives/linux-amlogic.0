Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920F5C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJwGH9/+yElZeNleuJJnM3bdx74f213Fd8QkK/yqtKw=; b=0AiKwEw+UWWV32
	C2nkCL62bDdJEBUtUckO8syX6/v6b+PPYydOItvv3ksX8fmxhPpTBT+BCgSYPETFjiYCAVoaUojwS
	XvDFOAlZ6FnHG4L+N+axtga1kxBlNkSdNo2EhVeH36LlXjCbclYMMK5vehojSXU42ItRCVwdBegwB
	vEF0hsyRIYmwZdoD5SOvcBT5flGL7XTFzxYT66XskI3ElkS6MCwrWxxDuzwgZB5wYYzkPmHjzSN3q
	aR0LQg3UXzcqLzYw4MCVjM4BlRwk0wHe6pX38Kq6Dp/YjlJ+ot0D31G76F0hfmChYw5W8dSpPGh09
	3ZY3CFPuTXX7xVxPsiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VMB-00Ff9V-TZ; Mon, 17 Jan 2022 16:59:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VLn-00FemL-WC; Mon, 17 Jan 2022 16:59:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1526B8113A;
 Mon, 17 Jan 2022 16:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223C9C36AE3;
 Mon, 17 Jan 2022 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438761;
 bh=lwk4z1qF/+7RF7Vl9dzFXszBwZQtFzeHpBCcrjjmNeI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fqqvIy8tlFcmUrDGy8Wdogvdd/lR/vSCmO9uYF9FGiA6WdZCg6I5Mg1rtnSsRqO4Q
 bZK4mxVyBAMXYn2fYMoK2p+hoqeRR8ZHoWTTC2lQ8vEh1Qkz0nSMv98JCsqlfp80/u
 0NnyoMql9jsbzvN8vz1hhErbRsYUPa5egqDszTlcYCl345dvLIr9NFLBqJgK0Y5fio
 Oh/EYUJyN1SvM65UtcPeiGQ+x7BnNDbSnB4xNkfhCx3idDP1cWszJAFBCzsrccdf/p
 Vuf9GYY0lTDXSFXZMPMmRu8DhQXQlDFltqwB1QXTBOxPkhBXEvvH7AVxnAuTXTRbU9
 HfwJsDYA0XRTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 12/52] clk: meson: gxbb: Fix the SDM_EN bit for
 MPLL0 on GXBB
Date: Mon, 17 Jan 2022 11:58:13 -0500
Message-Id: <20220117165853.1470420-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_085924_358776_F56DEF05 
X-CRM114-Status: GOOD (  19.39  )
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

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit ff54938dd190d85f740b9bf9dde59b550936b621 ]

There are reports that 48kHz audio does not work on the WeTek Play 2
(which uses a GXBB SoC), while 44.1kHz audio works fine on the same
board. There are also reports of 48kHz audio working fine on GXL and
GXM SoCs, which are using an (almost) identical AIU (audio controller).

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

The rate seen by meson-clk-msr is very close to what we would get when
SDM (the fractional part) was ignored:
  (2000000000Hz * 16384) / ((16384 * 6) = 333.33MHz
If SDM was considered the we should get close to:
  (2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294.9MHz

Further experimenting shows that HHI_MPLL_CNTL7[15] does not have any
effect on the rate of MPLL0 as seen my meson-clk-msr (regardless of
whether that bit is zero or one the rate is always the same according to
meson-clk-msr). Using HHI_MPLL_CNTL[25] on the other hand as SDM_EN
results in SDM being considered for the rate output by the hardware. The
rate - as seen by meson-clk-msr - matches with what we expect when
SDM_EN is enabled (fractional part is being considered, resulting in a
294.9MHz output) or disable (fractional part being ignored, resulting in
a 333.33MHz output).

Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20211031135006.1508796-1-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/gxbb.c | 44 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index d6eed760327d0..608e0e8ca49a8 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -713,6 +713,35 @@ static struct clk_regmap gxbb_mpll_prediv = {
 };
 
 static struct clk_regmap gxbb_mpll0_div = {
+	.data = &(struct meson_clk_mpll_data){
+		.sdm = {
+			.reg_off = HHI_MPLL_CNTL7,
+			.shift   = 0,
+			.width   = 14,
+		},
+		.sdm_en = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 25,
+			.width	 = 1,
+		},
+		.n2 = {
+			.reg_off = HHI_MPLL_CNTL7,
+			.shift   = 16,
+			.width   = 9,
+		},
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
@@ -749,7 +778,16 @@ static struct clk_regmap gxbb_mpll0 = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
 		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) { &gxbb_mpll0_div.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * GXL and GXBB have different SDM_EN registers. We
+			 * fallback to the global naming string mechanism so
+			 * mpll0_div picks up the appropriate one.
+			 */
+			.name = "mpll0_div",
+			.index = -1,
+		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -3044,7 +3082,7 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
 		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
 		[CLKID_VAPB]		    = &gxbb_vapb.hw,
-		[CLKID_MPLL0_DIV]	    = &gxbb_mpll0_div.hw,
+		[CLKID_MPLL0_DIV]	    = &gxl_mpll0_div.hw,
 		[CLKID_MPLL1_DIV]	    = &gxbb_mpll1_div.hw,
 		[CLKID_MPLL2_DIV]	    = &gxbb_mpll2_div.hw,
 		[CLKID_MPLL_PREDIV]	    = &gxbb_mpll_prediv.hw,
@@ -3439,7 +3477,7 @@ static struct clk_regmap *const gxl_clk_regmaps[] = {
 	&gxbb_mpll0,
 	&gxbb_mpll1,
 	&gxbb_mpll2,
-	&gxbb_mpll0_div,
+	&gxl_mpll0_div,
 	&gxbb_mpll1_div,
 	&gxbb_mpll2_div,
 	&gxbb_cts_amclk_div,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
