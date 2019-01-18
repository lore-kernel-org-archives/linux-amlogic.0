Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAAEC43444
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD342087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1fNMbpO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VdIjtsE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD342087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gt51gtrdligadLuBHQ9dehWrx+gQLL976GEe++rZ7k=; b=r1fNMbpOGixrx/
	ikbxi3qVC8X12yho5FlGm4tN5fz4ltucRaRhOLixmvhv15zp6h7H18PVA0HQyZ6si+5egpACD3hmO
	3tJexLksN2Mwc/bgXM8kb3Ouls8nEd32ZsixeQtAYs9i0tBc3mFQEbl/abKOE8Iat1hfCWDGllCDK
	WS+xPeOHvhdchcEFjk+ExU0eR9p1SCKK+rysAqBO4coVGUiOrWbqXo8ATtmCL8e0Xpg3zbhrZBDQW
	V+75oyyOx0RKv7aAe9pCUVMjqWo510hgQHQOCcQbA8mbcvxIgc6i1/GGNvMeK9/hT9rXPP8kcKZy7
	+RzID9cAGvE77dZEq6rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRU6-0007nH-SV; Fri, 18 Jan 2019 10:34:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRU1-0007hp-Ko
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:34:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id p4so14408028wrt.7
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WdeB7J3piuy6ZDKjEl32ympFqvEDkNjVRULX9ObH+Ww=;
 b=VdIjtsE2ZFVwl/fkTypw7k9OPEFSEZCOzzE4hIuAXBBa+w5BanA3IKJf3LbsoGPRCQ
 jJ3WwNqdX85gXDH81JqmZI5nbjp5qtVRkvKkEYG6v8ieuFCNyRrZPyAiSlIuOSrJTKwS
 61QFYaIQ1vlad8KLDFMXRQJV3NnfDr3k6ioMHHp1ZhGS288Xfx+X+A1LlaJ2yChy3jvf
 IPWBJSkWsB/fNhyClVQ93bbuRGFFjOMFqkPI8Q1mMOh3lXzVGW4yTwLAsLyfLO22LIS3
 qm6a0hqnc7FzmYux12q3LEZTyiitit0EBgXhh7VzqP6qaBP60GhTaRdvdljwzq5KWUw9
 xUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WdeB7J3piuy6ZDKjEl32ympFqvEDkNjVRULX9ObH+Ww=;
 b=dRERG6+3qmXdmo2GBeYGGHttSYZG0ktOMz3aw4LriDPMd/WcrQHKijfRWKhjqPxEld
 rhbscmzia1+5qHmaVeDGUx0QjeuEaytKeDFHmAo4lYe0bYq6S0gSAQsTLWQA1xBeo6bj
 pdSPIUqvNBkAW5UCGiwc1b4U0nCn0Z8wBdYhRosIrvB2s4WrciMzGRMSUl1B2j9tZJDT
 GuWTv0TZ/BnIVHBjv/qyHzbkhgaHEysPMSJgbewzC2nTdSqtqZZzd3Xgwi+rIseRW6OF
 3F2LCw0GVUZ/HHj+jA7EaGJLYlNeTA6bjcb2Qy5kbkRA/c01TVY/2ckaLQJDjX2FR/64
 R7Dw==
X-Gm-Message-State: AJcUukciwV5xN1tjQl22JRpd/Z3WJLR10ZV8nfGtH6X0dLaMTgG4nDjv
 o6eyI1qC1+AlfxETBtgv0ZIfNw==
X-Google-Smtp-Source: ALg8bN5VBtgxQVkQtrIDqJGZCo2DF6vs2c/cYeBycbnsFPQwIkzrE42qIu9hXzh61CDxdsYXVMcSHA==
X-Received: by 2002:adf:9061:: with SMTP id h88mr15636747wrh.65.1547807679136; 
 Fri, 18 Jan 2019 02:34:39 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s16sm67066247wrt.77.2019.01.18.02.34.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:34:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/4] soc: amlogic: clk-measure: add axg and g12a support
Date: Fri, 18 Jan 2019 11:34:21 +0100
Message-Id: <20190118103423.15075-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_023441_802124_EB35CBE4 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the axg and g12a SoC family in amlogic clk measure

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 194 ++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index daea191a66fa..5570180b94a1 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -165,6 +165,192 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
 	CLK_MSR_ID(82, "ge2d"),
 };
 
+static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
+	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
+	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
+	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
+	CLK_MSR_ID(3, "a53_ring_osc"),
+	CLK_MSR_ID(4, "gp0_pll"),
+	CLK_MSR_ID(5, "gp1_pll"),
+	CLK_MSR_ID(7, "clk81"),
+	CLK_MSR_ID(9, "encl"),
+	CLK_MSR_ID(17, "sys_pll_div16"),
+	CLK_MSR_ID(18, "sys_cpu_div16"),
+	CLK_MSR_ID(20, "rtc_osc_out"),
+	CLK_MSR_ID(23, "mmc_clk"),
+	CLK_MSR_ID(28, "sar_adc"),
+	CLK_MSR_ID(31, "mpll_test_out"),
+	CLK_MSR_ID(40, "mod_eth_tx_clk"),
+	CLK_MSR_ID(41, "mod_eth_rx_clk_rmii"),
+	CLK_MSR_ID(42, "mp0_out"),
+	CLK_MSR_ID(43, "fclk_div5"),
+	CLK_MSR_ID(44, "pwm_b"),
+	CLK_MSR_ID(45, "pwm_a"),
+	CLK_MSR_ID(46, "vpu"),
+	CLK_MSR_ID(47, "ddr_dpll_pt"),
+	CLK_MSR_ID(48, "mp1_out"),
+	CLK_MSR_ID(49, "mp2_out"),
+	CLK_MSR_ID(50, "mp3_out"),
+	CLK_MSR_ID(51, "sd_emmm_c"),
+	CLK_MSR_ID(52, "sd_emmc_b"),
+	CLK_MSR_ID(61, "gpio_msr"),
+	CLK_MSR_ID(66, "audio_slv_lrclk_c"),
+	CLK_MSR_ID(67, "audio_slv_lrclk_b"),
+	CLK_MSR_ID(68, "audio_slv_lrclk_a"),
+	CLK_MSR_ID(69, "audio_slv_sclk_c"),
+	CLK_MSR_ID(70, "audio_slv_sclk_b"),
+	CLK_MSR_ID(71, "audio_slv_sclk_a"),
+	CLK_MSR_ID(72, "pwm_d"),
+	CLK_MSR_ID(73, "pwm_c"),
+	CLK_MSR_ID(73, "wifi_beacon"),
+	CLK_MSR_ID(75, "tdmin_lb_lrcl"),
+	CLK_MSR_ID(76, "tdmin_lb_sclk"),
+	CLK_MSR_ID(77, "rng_ring_osc_0"),
+	CLK_MSR_ID(78, "rng_ring_osc_1"),
+	CLK_MSR_ID(79, "rng_ring_osc_2"),
+	CLK_MSR_ID(80, "rng_ring_osc_3"),
+	CLK_MSR_ID(81, "vapb"),
+	CLK_MSR_ID(82, "ge2d"),
+	CLK_MSR_ID(84, "audio_resample"),
+	CLK_MSR_ID(85, "audio_pdm_sys"),
+	CLK_MSR_ID(86, "audio_spdifout"),
+	CLK_MSR_ID(87, "audio_spdifin"),
+	CLK_MSR_ID(88, "audio_lrclk_f"),
+	CLK_MSR_ID(89, "audio_lrclk_e"),
+	CLK_MSR_ID(90, "audio_lrclk_d"),
+	CLK_MSR_ID(91, "audio_lrclk_c"),
+	CLK_MSR_ID(92, "audio_lrclk_b"),
+	CLK_MSR_ID(93, "audio_lrclk_a"),
+	CLK_MSR_ID(94, "audio_sclk_f"),
+	CLK_MSR_ID(95, "audio_sclk_e"),
+	CLK_MSR_ID(96, "audio_sclk_d"),
+	CLK_MSR_ID(97, "audio_sclk_c"),
+	CLK_MSR_ID(98, "audio_sclk_b"),
+	CLK_MSR_ID(99, "audio_sclk_a"),
+	CLK_MSR_ID(100, "audio_mclk_f"),
+	CLK_MSR_ID(101, "audio_mclk_e"),
+	CLK_MSR_ID(102, "audio_mclk_d"),
+	CLK_MSR_ID(103, "audio_mclk_c"),
+	CLK_MSR_ID(104, "audio_mclk_b"),
+	CLK_MSR_ID(105, "audio_mclk_a"),
+	CLK_MSR_ID(106, "pcie_refclk_n"),
+	CLK_MSR_ID(107, "pcie_refclk_p"),
+	CLK_MSR_ID(108, "audio_locker_out"),
+	CLK_MSR_ID(109, "audio_locker_in"),
+};
+
+static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
+	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
+	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
+	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
+	CLK_MSR_ID(3, "sys_cpu_ring_osc"),
+	CLK_MSR_ID(4, "gp0_pll"),
+	CLK_MSR_ID(6, "enci"),
+	CLK_MSR_ID(7, "clk81"),
+	CLK_MSR_ID(8, "encp"),
+	CLK_MSR_ID(9, "encl"),
+	CLK_MSR_ID(10, "vdac"),
+	CLK_MSR_ID(11, "eth_tx"),
+	CLK_MSR_ID(12, "hifi_pll"),
+	CLK_MSR_ID(13, "mod_tcon"),
+	CLK_MSR_ID(14, "fec_0"),
+	CLK_MSR_ID(15, "fec_1"),
+	CLK_MSR_ID(16, "fec_2"),
+	CLK_MSR_ID(17, "sys_pll_div16"),
+	CLK_MSR_ID(18, "sys_cpu_div16"),
+	CLK_MSR_ID(19, "lcd_an_ph2"),
+	CLK_MSR_ID(20, "rtc_osc_out"),
+	CLK_MSR_ID(21, "lcd_an_ph3"),
+	CLK_MSR_ID(22, "eth_phy_ref"),
+	CLK_MSR_ID(23, "mpll_50m"),
+	CLK_MSR_ID(24, "eth_125m"),
+	CLK_MSR_ID(25, "eth_rmii"),
+	CLK_MSR_ID(26, "sc_int"),
+	CLK_MSR_ID(27, "in_mac"),
+	CLK_MSR_ID(28, "sar_adc"),
+	CLK_MSR_ID(31, "mpll_test_out"),
+	CLK_MSR_ID(32, "vdec"),
+	CLK_MSR_ID(33, "sys_cpu_ring_osc_1"),
+	CLK_MSR_ID(34, "eth_mpll_50m"),
+	CLK_MSR_ID(35, "mali"),
+	CLK_MSR_ID(36, "hdmi_tx_pixel"),
+	CLK_MSR_ID(37, "cdac"),
+	CLK_MSR_ID(38, "vdin_meas"),
+	CLK_MSR_ID(39, "bt656"),
+	CLK_MSR_ID(41, "eth_rx_or_rmii"),
+	CLK_MSR_ID(42, "mp0_out"),
+	CLK_MSR_ID(43, "fclk_div5"),
+	CLK_MSR_ID(44, "pwm_b"),
+	CLK_MSR_ID(45, "pwm_a"),
+	CLK_MSR_ID(46, "vpu"),
+	CLK_MSR_ID(47, "ddr_dpll_pt"),
+	CLK_MSR_ID(48, "mp1_out"),
+	CLK_MSR_ID(49, "mp2_out"),
+	CLK_MSR_ID(50, "mp3_out"),
+	CLK_MSR_ID(51, "sd_emmc_c"),
+	CLK_MSR_ID(52, "sd_emmc_b"),
+	CLK_MSR_ID(53, "sd_emmc_a"),
+	CLK_MSR_ID(54, "vpu_clkc"),
+	CLK_MSR_ID(55, "vid_pll_div_out"),
+	CLK_MSR_ID(56, "wave420l_a"),
+	CLK_MSR_ID(57, "wave420l_c"),
+	CLK_MSR_ID(58, "wave420l_b"),
+	CLK_MSR_ID(59, "hcodec"),
+	CLK_MSR_ID(61, "gpio_msr"),
+	CLK_MSR_ID(62, "hevcb"),
+	CLK_MSR_ID(63, "dsi_meas"),
+	CLK_MSR_ID(64, "spicc_1"),
+	CLK_MSR_ID(65, "spicc_0"),
+	CLK_MSR_ID(66, "vid_lock"),
+	CLK_MSR_ID(67, "dsi_phy"),
+	CLK_MSR_ID(68, "hdcp22_skp"),
+	CLK_MSR_ID(69, "hdcp22_esm"),
+	CLK_MSR_ID(70, "pwm_f"),
+	CLK_MSR_ID(71, "pwm_e"),
+	CLK_MSR_ID(72, "pwm_d"),
+	CLK_MSR_ID(73, "pwm_c"),
+	CLK_MSR_ID(75, "hevcf"),
+	CLK_MSR_ID(77, "rng_ring_osc_0"),
+	CLK_MSR_ID(78, "rng_ring_osc_1"),
+	CLK_MSR_ID(79, "rng_ring_osc_2"),
+	CLK_MSR_ID(80, "rng_ring_osc_3"),
+	CLK_MSR_ID(81, "vapb"),
+	CLK_MSR_ID(82, "ge2d"),
+	CLK_MSR_ID(83, "co_rx"),
+	CLK_MSR_ID(84, "co_tx"),
+	CLK_MSR_ID(89, "hdmi_todig"),
+	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(94, "eth_phy_rx"),
+	CLK_MSR_ID(95, "eth_phy_pll"),
+	CLK_MSR_ID(96, "vpu_b"),
+	CLK_MSR_ID(97, "cpu_b_tmp"),
+	CLK_MSR_ID(98, "ts"),
+	CLK_MSR_ID(99, "ring_osc_out_ee_3"),
+	CLK_MSR_ID(100, "ring_osc_out_ee_4"),
+	CLK_MSR_ID(101, "ring_osc_out_ee_5"),
+	CLK_MSR_ID(102, "ring_osc_out_ee_6"),
+	CLK_MSR_ID(103, "ring_osc_out_ee_7"),
+	CLK_MSR_ID(104, "ring_osc_out_ee_8"),
+	CLK_MSR_ID(105, "ring_osc_out_ee_9"),
+	CLK_MSR_ID(106, "ephy_test"),
+	CLK_MSR_ID(107, "au_dac_g128x"),
+	CLK_MSR_ID(108, "audio_locker_out"),
+	CLK_MSR_ID(109, "audio_locker_in"),
+	CLK_MSR_ID(110, "audio_tdmout_c_sclk"),
+	CLK_MSR_ID(111, "audio_tdmout_b_sclk"),
+	CLK_MSR_ID(112, "audio_tdmout_a_sclk"),
+	CLK_MSR_ID(113, "audio_tdmin_lb_sclk"),
+	CLK_MSR_ID(114, "audio_tdmin_c_sclk"),
+	CLK_MSR_ID(115, "audio_tdmin_b_sclk"),
+	CLK_MSR_ID(116, "audio_tdmin_a_sclk"),
+	CLK_MSR_ID(117, "audio_resample"),
+	CLK_MSR_ID(118, "audio_pdm_sys"),
+	CLK_MSR_ID(119, "audio_spdifout_b"),
+	CLK_MSR_ID(120, "audio_spdifout"),
+	CLK_MSR_ID(121, "audio_spdifin"),
+	CLK_MSR_ID(122, "audio_pdm_dclk"),
+};
+
 static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 			       unsigned int duration)
 {
@@ -337,6 +523,14 @@ static const struct of_device_id meson_msr_match_table[] = {
 		.compatible = "amlogic,meson8b-clk-measure",
 		.data = (void *)clk_msr_m8,
 	},
+	{
+		.compatible = "amlogic,meson-axg-clk-measure",
+		.data = (void *)clk_msr_axg,
+	},
+	{
+		.compatible = "amlogic,meson-g12a-clk-measure",
+		.data = (void *)clk_msr_g12a,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
