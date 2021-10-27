Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA54C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Oct 2021 19:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB08D60041
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Oct 2021 19:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB08D60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4z23el68yTqp9W/OePdNouiLNDhUfgkEsc5Yv4Oc950=; b=D1O+d+zb77dsh0
	Tsr7UdlIsVDiIvX5T+lcllGrlWNBllDd2p03QjRmMT1i5oBr3F6fOAz8Vsg9vI8gYcMrZwjlUPQIM
	zh6NNmkaOoeiS+LDAOKPoo31PjyV+xz0P6+W56FS/JrzvNVhV233w7l+3BQ8yFriwKlmLzDRGiI/Y
	9/N4Dyy9XgRqV7N/U4jr3n8TtlRZWOor47PidBcM8Zg5oXSOXrKD/fOdMK6Y4h3ZCGEV+A4vbHpjl
	16/RADYYdnju1hhOqSRsaa4dLgrLJrXhvnCAYeBltJEoswbFQoNJxeOr3mfVgaahl6WxXBiyDFcTp
	AUrAGR/N03waZACe9Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfoSa-005s31-M6; Wed, 27 Oct 2021 19:19:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfo3d-005iJn-Ns; Wed, 27 Oct 2021 18:53:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id s14so2896546wrb.3;
 Wed, 27 Oct 2021 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghkMcTRtb43N3YdUu4YWLPRNuCh7skOTM0WREEH03Wk=;
 b=TtBUJvYSDqBxohi8rAPArMGIODu0zUVDqWHhPtcq2OYRV0qnhmUXCqNsDfXVPItZpd
 aCIDhua9MAjbw5Db5FLkDqeFydCKCVlu7+r1Nu2OFSoMnnKpivRzLVSFsb+ojeisMrrI
 eozsx5ZHi3fFokL2spLjx8+TPk0cssfUAzy7aFInOyD07Hq15lHZiDmjyiICMue89qBt
 AXdK8cHVy5Y69vhnpu7g0hlA0lliKUGhY7T2x/zHy4zRTLW0ezzALVah1SxezIBZIxAv
 QKnlNHTXri2bV9snr0fo007XbGjakuwztOsxJD+YnAJKJrdBwD6I2CAYTA0vA84RCFxF
 wGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ghkMcTRtb43N3YdUu4YWLPRNuCh7skOTM0WREEH03Wk=;
 b=FhdemKejrFMZ6TfYbNv8EUicrCSVOPDPtrw+vwJ8o1fwuGmASfQU8Yz5hdLuGc6yvX
 mlsG3gmoOg8HBqMZJMMy1Y+tzGTmt2/gqwRrrfiAtT09vBfRlNw+1zC8PuDuxHygdCWa
 uvWb0D/NQrsNaP0F2i9I+jAv0DYXCVxFA3gAitpW97so+KpJtvQujvbi63+jZLLn5P8w
 638kqdZ4dO4SMc0MKVhmemanrJcqBFsOf781MGyOVifrjbLh6bjOPV1ldbvjA3DYDQ9i
 bq9aCo9q8dAeZIGUTg6Ahqo/VglJSL0nM3OZDju0aFi9VurmoNFcjiR+Bgf6/Kizwjkb
 Vj5w==
X-Gm-Message-State: AOAM532x5my54atUWLeqcCfOZApvGmMNu3sGvnldjeaIz4iqDZvnh4IK
 /OSZOBO8E6ueJ+Q4wjp3/3k=
X-Google-Smtp-Source: ABdhPJx1yonb4WvATmUVWibIL1AAOrKgRq224XhlX7xgOubtAbDj7yLEoOmcg1IVARM+6Gz8UEuLgQ==
X-Received: by 2002:adf:dd07:: with SMTP id a7mr36895914wrm.395.1635360830263; 
 Wed, 27 Oct 2021 11:53:50 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c1dc-4b00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c1dc:4b00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id n5sm4048879wme.6.2021.10.27.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:53:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2] clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
Date: Wed, 27 Oct 2021 20:53:26 +0200
Message-Id: <20211027185326.1653827-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_115353_821870_3359DBC2 
X-CRM114-Status: GOOD (  19.08  )
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

There are reports that 48kHz audio does not work on his WeTek Play 2
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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes since v1 at [0]:
- consider HHI_MPLL_CNTL[25] as SDM_EN bit after Jerome helped me
  understand the purpose of SDM_EN and gave some explanation why this
  can't be a spread spectrum bit


[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20211016145939.15643-1-martin.blumenstingl@googlemail.com/


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
