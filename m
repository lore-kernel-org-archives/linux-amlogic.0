Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C655C43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 05:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S3r0ZPShlVnVdunrwv949wAVMuGY8+mJuW7k0p1xl38=; b=PIDpAbgyzdQqK1
	+7PcZfxCwgvtrraeTDPw7PJTvHrr0t5Dr5TxP8tCE2o8i9I+0sYYoO6ts+82aWeyvgqHbWNYLjogY
	TZ5oEb+Cv4m6b0LNXDxvLWH6a7/YqZ+e0k1YeGZoKtAyUV8+iJ9Brxw6AeceWgqr5+V1TQ0Fj96b7
	4iHQQUvH6xKVSgSH7sifcao1p4gWQ7yOgCQQgRS4Bcnh9m1a0SnjmdKKRmzjk0cimX2l4riWJ1Y8S
	dPtuxg9u4y5LGNPZ+trLhYpXl2u+EGKmR27GZ5W4GkozX8SUMlMa9QbLYLBAYMBuxw6MgQOTY8B65
	hALT9pVwZN6JqA1ACMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc05-0000000BXQo-1k6p;
	Mon, 06 Jul 2026 05:36:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc04-0000000BXQf-3O7q;
	Mon, 06 Jul 2026 05:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DF0141E89;
	Mon,  6 Jul 2026 05:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FD4AC2BCB8;
	Mon,  6 Jul 2026 05:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783316171;
	bh=N7/MvJhYUGrKV9Q70bL4Q1CmZHVRIk+QiqHWcOh3IWY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mef8iKmMX/lACumsghUSCgFN6P0gtmJj6dNNaRx8Negkp65Fa2xEPXJkzOqWuU3rs
	 OVIV8HcS3s6moeeKhdkvvlzcg1fHVrqYAKBOcUGAfnjQ0223Q7JXRRevqdRZJzU9O7
	 Jb2K4+Zrg8r+o/gY9ZAPm2DalpYuJyLG0AJz5RfUyfyzgzGL4JmexszlAfjNB8Kq0y
	 S1NMvIaZvdw7jHgbYDEsS2DFXHki8w1MUMMQ8tj11P2C67T5Os+3WQK8PdYcw6WdHH
	 S+282MjZj2YGdUwMsb6wGUsFHhlZja7SldmlL6Xfbg7nU06ZF357uzX25aSBFDTokj
	 /0T6f1vycBKaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E328C43458;
	Mon,  6 Jul 2026 05:36:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 13:36:03 +0800
Subject: [PATCH] soc: amlogic: clk-measure: Mark the clock measure table as
 __initconst
MIME-Version: 1.0
Message-Id: <20260706-clkmsr_optimization-v1-1-70f5aae6e60b@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAMI+S2oC/x2MQQqAIBAAvxJ7Ttg6ZPSViFDbaiktVCIK/550H
 JiZFwJ5pgBd8YKniwMfLkNVFmBW5RYSPGWGGusGJTbC7JsNfjzOyJYfFbMvdEuVmSTqmQhyeXq
 a+f6v/ZDSB4ltrM1lAAAA
X-Change-ID: 20260706-clkmsr_optimization-b8e1cd70bfee
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783316169; l=3839;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=n3+FWab2iM1pkmUi4HdCeGFTpcygj++bqfpdmrSHV1Q=;
 b=7PcHvkINB/VwMB1qf+9rKl1NuPq4ZemkkoFmBNTRfTGPIwr6Mi06cbHn4Drh0+fUK8c7OMovV
 Z+DCrLY0u8MBB3j34bpdU4H4xXZG+wFelO0nW9w7TTnQfhJ2e9rQeNT
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

The clock measure table is only used during initialization, and the
table data is copied to the msr_table field of struct meson_msr_data.

Mark it as __initconst so it can be freed after kernel initialization.
Taking T7 as an example, this frees approximately 5 KB of memory,
saving some runtime memory.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 8c4f3cc8c8ab..e1cf67fad83c 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -55,7 +55,7 @@ struct meson_msr {
 #define CLK_MSR_ID(__id, __name) \
 	[__id] = {.id = __id, .name = __name,}
 
-static const struct meson_msr_id clk_msr_m8[] = {
+static const struct meson_msr_id clk_msr_m8[] __initconst = {
 	CLK_MSR_ID(0, "ring_osc_out_ee0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee2"),
@@ -104,7 +104,7 @@ static const struct meson_msr_id clk_msr_m8[] = {
 	CLK_MSR_ID(63, "mipi_csi_cfg"),
 };
 
-static const struct meson_msr_id clk_msr_gx[] = {
+static const struct meson_msr_id clk_msr_gx[] __initconst = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -174,7 +174,7 @@ static const struct meson_msr_id clk_msr_gx[] = {
 	CLK_MSR_ID(82, "ge2d"),
 };
 
-static const struct meson_msr_id clk_msr_axg[] = {
+static const struct meson_msr_id clk_msr_axg[] __initconst = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -248,7 +248,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
 	CLK_MSR_ID(109, "audio_locker_in"),
 };
 
-static const struct meson_msr_id clk_msr_g12a[] = {
+static const struct meson_msr_id clk_msr_g12a[] __initconst = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -364,7 +364,7 @@ static const struct meson_msr_id clk_msr_g12a[] = {
 	CLK_MSR_ID(122, "audio_pdm_dclk"),
 };
 
-static const struct meson_msr_id clk_msr_sm1[] = {
+static const struct meson_msr_id clk_msr_sm1[] __initconst = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -494,7 +494,7 @@ static const struct meson_msr_id clk_msr_sm1[] = {
 	CLK_MSR_ID(127, "csi2_data"),
 };
 
-static const struct meson_msr_id clk_msr_c3[] = {
+static const struct meson_msr_id clk_msr_c3[] __initconst = {
 	CLK_MSR_ID(0,	"sys_clk"),
 	CLK_MSR_ID(1,	"axi_clk"),
 	CLK_MSR_ID(2,	"rtc_clk"),
@@ -634,7 +634,7 @@ static const struct meson_msr_id clk_msr_c3[] = {
 
 };
 
-static const struct meson_msr_id clk_msr_s4[] = {
+static const struct meson_msr_id clk_msr_s4[] __initconst = {
 	CLK_MSR_ID(0, "sys_clk"),
 	CLK_MSR_ID(1, "axi_clk"),
 	CLK_MSR_ID(2, "rtc_clk"),
@@ -787,7 +787,7 @@ static const struct meson_msr_id clk_msr_s4[] = {
 
 };
 
-static const struct meson_msr_id clk_msr_a1[] = {
+static const struct meson_msr_id clk_msr_a1[] __initconst = {
 	CLK_MSR_ID(0, "tdmout_b_sclk"),
 	CLK_MSR_ID(1, "tdmout_a_sclk"),
 	CLK_MSR_ID(2, "tdmin_lb_sclk"),
@@ -843,7 +843,7 @@ static const struct meson_msr_id clk_msr_a1[] = {
 	CLK_MSR_ID(61, "osc_ring_ramb"),
 };
 
-static const struct meson_msr_id clk_msr_t7[] = {
+static const struct meson_msr_id clk_msr_t7[] __initconst = {
 	CLK_MSR_ID(0, "sys"),
 	CLK_MSR_ID(1, "axi"),
 	CLK_MSR_ID(2, "rtc"),

---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-clkmsr_optimization-b8e1cd70bfee

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
