Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC363C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Oct 2021 13:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A9560F56
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Oct 2021 13:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98A9560F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yJZAQafkqv5a3vKt5rQjJ6uKPgZH+9KSPp/FAZv2idA=; b=EIWineY+ivh9OH
	ukZNsQDJXEizYns1PGNwlGnSf41UGVYeMrsJwQZmJA97vgcasynqObK5sks6yVtX4Hi24hQwbv3DB
	6306t70Tzaqydow9cqmsi/gCceTWNDm41GXyBee29tcLiDDuLLyWLfvhn8bYs0FXQjfDGaYStwAJa
	XNZyJZZWAEYcjJVQZecwZi1/5MrNKx1T3MYnrd/YD4kWMYbx2R/1TerFhjwFCuTDiKeekizEzN2NE
	1wqGnfHa9xZ/zBvutGZPHtTEw51Cn84Gu/va8em+IwB8+G8qIUvnsTBPh2fcKehKG6Z7UokTRAKpI
	q+Nz9KVfYLdPyPObBypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhBE9-00E9FN-4i; Sun, 31 Oct 2021 13:50:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhBE5-00E9Ee-LN; Sun, 31 Oct 2021 13:50:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r8so11492341wra.7;
 Sun, 31 Oct 2021 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hivsyzWfKb3IO8otmU12m10waXWHE3SQBgrLl9NXhYc=;
 b=ntusG/q2A7X9rwYeDzz2+YEIQ1Jd8RONbiYaut+GxmTprG5IPiDXBJHlq7yBcJFPqS
 zI8lUtfwcOiX+TGXNTcHUEiKIsqjZ7tTClBFwntuarXEHkXsY39x+0stx8X/gFLcnkKU
 xrmCIeFbQ6LBFnIFvTU3WJKK4TLqi/t2sMLfXl4FEao3zmhBxTSGwv2j0pI8aEdsOKx/
 5ZakTDQWpknICQRZIc9YRnU8R0kE/X/hVkCSTmy8KP7jdbU/0fV2uoWCvtnrvZo9MUJv
 hsKIoArXFU9LHJ8uFcDr82EiECFdiuZ0kPw3GQi/ewAY2QsGiX8YnnJH/CQuKeeluoKK
 LRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hivsyzWfKb3IO8otmU12m10waXWHE3SQBgrLl9NXhYc=;
 b=ml6WR7iIRRS7n+Eb8qe01PTrkFcQJIKKz+rj+48J1eFEs//KceXPJJaGP/2Jb4jWuk
 V5OwZOgyi9cJYOnq8Wv/J4XOuwMlgYQ1uyUPuvNG+J3iHEl1iD1XPMVGUlh+OSJRV5Mn
 R9kgrBiJBTEMmlnpMR1nvBt+06rXXFCHbOmKIP53spfizhPPRmDbYYawccSXNDDlIGtQ
 w27ekhHx7ncMuB25fhon4VI53LgsKK6uaGEs4CXeWuicTwuTf60kpFQBncc0bROYjNG8
 mxdyXNo8sP8koaLrq7C8VTorqts2FnmeHadkvc/0p7sRwAdoqlwCUviN8ORVcqZ2WB2f
 XHxQ==
X-Gm-Message-State: AOAM531Zyr2W+SCR7jn+1gbhFHOWg9vcVvfZnN6/VVOUM97iu0f5XYt5
 c0voJhHPh+bpc3J9IGOtOJzt1rgm9ME=
X-Google-Smtp-Source: ABdhPJyZNW6hRFZ0KIw1IUOGC0/lHJKyMf2hCpcJ3nFRX7gzQk8HLC04NHaaqq3lEk7R62WlBBRb9A==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr31149783wrr.11.1635688219167; 
 Sun, 31 Oct 2021 06:50:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-73cd-c100-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:73cd:c100:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o26sm13589719wmc.17.2021.10.31.06.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 06:50:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3] clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
Date: Sun, 31 Oct 2021 14:50:06 +0100
Message-Id: <20211031135006.1508796-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_065021_768005_41AF7B8B 
X-CRM114-Status: GOOD (  19.75  )
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
---
changes since v2 at [1]:
- add Christian's Tested-by (thank you!)
- s/his/the/ to fix the grammar in the first sentence as spotted by
  Christian (off-list)

changes since v1 at [0]:
- consider HHI_MPLL_CNTL[25] as SDM_EN bit after Jerome helped me
  understand the purpose of SDM_EN and gave some explanation why this
  can't be a spread spectrum bit


[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20211016145939.15643-1-martin.blumenstingl@googlemail.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/patch/20211027185326.1653827-1-martin.blumenstingl@googlemail.com/


 drivers/clk/meson/gxbb.c | 44 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index d6eed760327d..608e0e8ca49a 100644
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
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
