Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3487C8300C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEQ262x6tNN8P2ZtlNuHsU+Esj5CkSp+2D9TjrQ2+Vg=; b=j4Fux+kTeiMV5D
	DpTYAQR/gttfN9dhdSsiOZGSjfAgV8v3pke0WptUx1sGafvrYEnETWoLlctdpLo/pS/WoJAtwTBf/
	1yz7pu2jdh8nafoYnNNKVtF1JeYEy9xneI/HcKSWOKdeNUzmVdL6czolGAMtVtIvZCFX0bkKIgTF5
	TxXQylCwonoChLgBwcqbzJ7L0t+D1HDsGvhqhULOKYSDd8JS9MFKAbzsA6ZRtaAPvMxy/yaeWxCK4
	32G+xoqfmH2Pq5aOcNu7iYufS/yoybnTmFDkISUo++ZnGCHP/M0M9GmOyYRrDv/14qBATbLzfn3/N
	f8pI1qG13Oai6i8m2sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fHa-003gOs-0h;
	Mon, 12 Jun 2023 11:00:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIv-003OVe-0q
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30fc26affa9so455954f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563858; x=1689155858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbmC2tPXu7Plws9RR0tJzVAbqwrUbXt6C9ZgJTjEcFU=;
        b=j34cukKZT24kOOcuyPjTpJHUQWs5DkfZPoalFxFvyR271AcnPvrYtaDLNJgtikED2x
         c6754piIhGhCmSv1EVXVoYOCmtlQ6kq/l/D/lOXSMH+KK1s/aVFS75Pi54uWNbC63oIf
         JJd9jMwj+Umfn2okDZYMP9CVtIbIaLjmKdpLPOeUGEWaOyjYck/cwqA9QdVuUXZx0FiE
         W4X2eTJQNoslZ/VSVbqraBu7f7eAZqubDN4glzlold8ch/MytDZhSOG5Y43CHq9oUFmZ
         ptQm87vQNVmc8AscaZQ114an7ErYtL2iiv5IwsltVX3plMMV9Nf1iYZGr66zjqJiLL8+
         1rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563858; x=1689155858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbmC2tPXu7Plws9RR0tJzVAbqwrUbXt6C9ZgJTjEcFU=;
        b=FA7aRpE3S76zFpDJ4sTIwWSMuijb2pevDJtzxAKa1DYL0LNMVwNWRkoAGiuTVEQv2+
         tAkneMJpXFCdz+COaQy8chhpAjKwWuQnjXuo2V77m63nhZXtgmOocNj3H7uG+6MQnLIr
         FMmEy+Z7tjuJnk14xhAzcUwgdeHilXBcAq37KFj0Hf9Q5NKrezbRuuL1nFAV2VqzF7OQ
         wtfXY4vrcDb/JHC2xYX0aSClzng5nvTDNqF4WTCWLUyg2HFnPZm2Slz+b0t/g9zg/O6U
         53kZHt6fHe7rlegDx9iaUvk3M3P8nOQ9w77jmwejH4X2IbwvjDVi6DimTbwjjCx3eLJx
         BBwQ==
X-Gm-Message-State: AC+VfDy6WPc0PMkDn5APfmei8KBGUtRi4jOoydBeJZMFNJT+6hoYWhFq
	gpeDWlyaqJgyTY5yu20pYE2Bcg==
X-Google-Smtp-Source: ACHHUZ4wOMKO/+1v6hwyByJVH407FFEtogM5Wm3YKD9oUk66xURxaa+0V8NVYtMGFEdZIW5PymzXWA==
X-Received: by 2002:a5d:698b:0:b0:30f:bcf2:9b2 with SMTP id g11-20020a5d698b000000b0030fbcf209b2mr2475789wru.56.1686563858404;
        Mon, 12 Jun 2023 02:57:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:21 +0200
Subject: [PATCH v2 04/19] clk: meson: migrate a1 clock drivers out of
 hw_onecell_data to drop NR_CLKS
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-4-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17870;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZLWNIGY2IJxgTN/Cyxq7KREpLST5U+rlCF56Wlhe7+M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwGBjisLHde571WUUjrihrnT8HjUkGNHj3j4vgA
 yMwa416JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsBgAKCRB33NvayMhJ0fzHD/
 9klEUpui7IaMfUJFPVV0GUkG962ogoG4za2QgtF6tZabSwEQdxZAFAy1zxJp0rwkNrFvnreO79NA6o
 EJawxL4JGuGEIiSAxquwXE5tuME2Q1GkrafcXRgT38U6XnMGcVyYCNq4bE31SIv3SB2uPvx1GwkNI2
 QtUpYtgTGyhgn2Tfm8M+fTJq+uf560lX+Z6a5SIqWB+IkhtBPqSO7uJgkNSIZbmnB387IsfdvfKgli
 AXDDRosXLM/rDB/2rqVeCW7SQIdKshu7W8Ftrw40mzMnHM/ZW0cfjhAOI3LWuI7WMPXLBs82nee9Ak
 jHh7qHF/gzQxGjxnof5lv7iV/LrNSpMRKF+ASp2yCc2UQ/ruUmwrsvLhmKHcIQtH31+1t+2v4CYNBz
 ViYEtXwM+iO1c0EGJGGB55Ibtmumo7HW9i7HZuGETi9eP3TS/WWmlej7ss7BxXelaaTYQS6N9uUKEb
 CAlF/4g2XA5frJvozvzNmWaMr1wpUXA3Ddt+N/sfgWpICAcyDSRX0d5joPfSgHYWs86xLKE/Cf6RUB
 jwg8R9u86+C8ZQbgR7G6n2LTjP8I5vTso9uR6kWm6mafYeib36s2718xkEMcVHKtI2qOT3BJ98UcDS
 RFzMc2ZG/clG6FGW1MoiHepsgyE5fjzAEGVkWOSRnzTcewYyz9YPI9ldzeLw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025741_327097_82EFA219 
X-CRM114-Status: GOOD (  13.77  )
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

The way hw_onecell_data is declared:
struct clk_hw_onecell_data {
	unsigned int num;
	struct clk_hw *hws[];
};

makes it impossible to have the clk_hw table declared outside while
using ARRAY_SIZE() to determine ".num" due to ".hws" being a flexible
array member.

Completely move out of hw_onecell_data and add a custom
devm_of_clk_add_hw_provider() "get" callback to retrieve the clk_hw
in order to finally get rid on the NR_CLKS define.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig          |   2 +
 drivers/clk/meson/a1-peripherals.c | 323 +++++++++++++++++++------------------
 drivers/clk/meson/a1-peripherals.h |   1 -
 drivers/clk/meson/a1-pll.c         |  36 +++--
 drivers/clk/meson/a1-pll.h         |   1 -
 5 files changed, 183 insertions(+), 180 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index caadaf973317..7ae076cd9645 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -108,6 +108,7 @@ config COMMON_CLK_A1_PLL
 	tristate "Amlogic A1 SoC PLL controller support"
 	depends on ARM64
 	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_PLL
 	help
 	  Support for the PLL clock controller on Amlogic A113L based
@@ -119,6 +120,7 @@ config COMMON_CLK_A1_PERIPHERALS
 	depends on ARM64
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
 	help
 	  Support for the Peripherals clock controller on Amlogic A113L based
 	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index b320134fefeb..a5cab418736a 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -13,6 +13,7 @@
 #include "a1-peripherals.h"
 #include "clk-dualdiv.h"
 #include "clk-regmap.h"
+#include "meson-clkc-utils.h"
 
 static struct clk_regmap xtal_in = {
 	.data = &(struct clk_regmap_gate_data){
@@ -1866,165 +1867,161 @@ static MESON_GATE(rom,		AXI_CLK_EN,	11);
 static MESON_GATE(prod_i2c,	AXI_CLK_EN,	12);
 
 /* Array of all clocks registered by this provider */
-static struct clk_hw_onecell_data a1_periphs_clks = {
-	.hws = {
-		[CLKID_XTAL_IN]			= &xtal_in.hw,
-		[CLKID_FIXPLL_IN]		= &fixpll_in.hw,
-		[CLKID_USB_PHY_IN]		= &usb_phy_in.hw,
-		[CLKID_USB_CTRL_IN]		= &usb_ctrl_in.hw,
-		[CLKID_HIFIPLL_IN]		= &hifipll_in.hw,
-		[CLKID_SYSPLL_IN]		= &syspll_in.hw,
-		[CLKID_DDS_IN]			= &dds_in.hw,
-		[CLKID_SYS]			= &sys.hw,
-		[CLKID_CLKTREE]			= &clktree.hw,
-		[CLKID_RESET_CTRL]		= &reset_ctrl.hw,
-		[CLKID_ANALOG_CTRL]		= &analog_ctrl.hw,
-		[CLKID_PWR_CTRL]		= &pwr_ctrl.hw,
-		[CLKID_PAD_CTRL]		= &pad_ctrl.hw,
-		[CLKID_SYS_CTRL]		= &sys_ctrl.hw,
-		[CLKID_TEMP_SENSOR]		= &temp_sensor.hw,
-		[CLKID_AM2AXI_DIV]		= &am2axi_dev.hw,
-		[CLKID_SPICC_B]			= &spicc_b.hw,
-		[CLKID_SPICC_A]			= &spicc_a.hw,
-		[CLKID_MSR]			= &msr.hw,
-		[CLKID_AUDIO]			= &audio.hw,
-		[CLKID_JTAG_CTRL]		= &jtag_ctrl.hw,
-		[CLKID_SARADC_EN]		= &saradc_en.hw,
-		[CLKID_PWM_EF]			= &pwm_ef.hw,
-		[CLKID_PWM_CD]			= &pwm_cd.hw,
-		[CLKID_PWM_AB]			= &pwm_ab.hw,
-		[CLKID_CEC]			= &cec.hw,
-		[CLKID_I2C_S]			= &i2c_s.hw,
-		[CLKID_IR_CTRL]			= &ir_ctrl.hw,
-		[CLKID_I2C_M_D]			= &i2c_m_d.hw,
-		[CLKID_I2C_M_C]			= &i2c_m_c.hw,
-		[CLKID_I2C_M_B]			= &i2c_m_b.hw,
-		[CLKID_I2C_M_A]			= &i2c_m_a.hw,
-		[CLKID_ACODEC]			= &acodec.hw,
-		[CLKID_OTP]			= &otp.hw,
-		[CLKID_SD_EMMC_A]		= &sd_emmc_a.hw,
-		[CLKID_USB_PHY]			= &usb_phy.hw,
-		[CLKID_USB_CTRL]		= &usb_ctrl.hw,
-		[CLKID_SYS_DSPB]		= &sys_dspb.hw,
-		[CLKID_SYS_DSPA]		= &sys_dspa.hw,
-		[CLKID_DMA]			= &dma.hw,
-		[CLKID_IRQ_CTRL]		= &irq_ctrl.hw,
-		[CLKID_NIC]			= &nic.hw,
-		[CLKID_GIC]			= &gic.hw,
-		[CLKID_UART_C]			= &uart_c.hw,
-		[CLKID_UART_B]			= &uart_b.hw,
-		[CLKID_UART_A]			= &uart_a.hw,
-		[CLKID_SYS_PSRAM]		= &sys_psram.hw,
-		[CLKID_RSA]			= &rsa.hw,
-		[CLKID_CORESIGHT]		= &coresight.hw,
-		[CLKID_AM2AXI_VAD]		= &am2axi_vad.hw,
-		[CLKID_AUDIO_VAD]		= &audio_vad.hw,
-		[CLKID_AXI_DMC]			= &axi_dmc.hw,
-		[CLKID_AXI_PSRAM]		= &axi_psram.hw,
-		[CLKID_RAMB]			= &ramb.hw,
-		[CLKID_RAMA]			= &rama.hw,
-		[CLKID_AXI_SPIFC]		= &axi_spifc.hw,
-		[CLKID_AXI_NIC]			= &axi_nic.hw,
-		[CLKID_AXI_DMA]			= &axi_dma.hw,
-		[CLKID_CPU_CTRL]		= &cpu_ctrl.hw,
-		[CLKID_ROM]			= &rom.hw,
-		[CLKID_PROC_I2C]		= &prod_i2c.hw,
-		[CLKID_DSPA_SEL]		= &dspa_sel.hw,
-		[CLKID_DSPB_SEL]		= &dspb_sel.hw,
-		[CLKID_DSPA_EN]			= &dspa_en.hw,
-		[CLKID_DSPA_EN_NIC]		= &dspa_en_nic.hw,
-		[CLKID_DSPB_EN]			= &dspb_en.hw,
-		[CLKID_DSPB_EN_NIC]		= &dspb_en_nic.hw,
-		[CLKID_RTC]			= &rtc.hw,
-		[CLKID_CECA_32K]		= &ceca_32k_out.hw,
-		[CLKID_CECB_32K]		= &cecb_32k_out.hw,
-		[CLKID_24M]			= &clk_24m.hw,
-		[CLKID_12M]			= &clk_12m.hw,
-		[CLKID_FCLK_DIV2_DIVN]		= &fclk_div2_divn.hw,
-		[CLKID_GEN]			= &gen.hw,
-		[CLKID_SARADC_SEL]		= &saradc_sel.hw,
-		[CLKID_SARADC]			= &saradc.hw,
-		[CLKID_PWM_A]			= &pwm_a.hw,
-		[CLKID_PWM_B]			= &pwm_b.hw,
-		[CLKID_PWM_C]			= &pwm_c.hw,
-		[CLKID_PWM_D]			= &pwm_d.hw,
-		[CLKID_PWM_E]			= &pwm_e.hw,
-		[CLKID_PWM_F]			= &pwm_f.hw,
-		[CLKID_SPICC]			= &spicc.hw,
-		[CLKID_TS]			= &ts.hw,
-		[CLKID_SPIFC]			= &spifc.hw,
-		[CLKID_USB_BUS]			= &usb_bus.hw,
-		[CLKID_SD_EMMC]			= &sd_emmc.hw,
-		[CLKID_PSRAM]			= &psram.hw,
-		[CLKID_DMC]			= &dmc.hw,
-		[CLKID_SYS_A_SEL]		= &sys_a_sel.hw,
-		[CLKID_SYS_A_DIV]		= &sys_a_div.hw,
-		[CLKID_SYS_A]			= &sys_a.hw,
-		[CLKID_SYS_B_SEL]		= &sys_b_sel.hw,
-		[CLKID_SYS_B_DIV]		= &sys_b_div.hw,
-		[CLKID_SYS_B]			= &sys_b.hw,
-		[CLKID_DSPA_A_SEL]		= &dspa_a_sel.hw,
-		[CLKID_DSPA_A_DIV]		= &dspa_a_div.hw,
-		[CLKID_DSPA_A]			= &dspa_a.hw,
-		[CLKID_DSPA_B_SEL]		= &dspa_b_sel.hw,
-		[CLKID_DSPA_B_DIV]		= &dspa_b_div.hw,
-		[CLKID_DSPA_B]			= &dspa_b.hw,
-		[CLKID_DSPB_A_SEL]		= &dspb_a_sel.hw,
-		[CLKID_DSPB_A_DIV]		= &dspb_a_div.hw,
-		[CLKID_DSPB_A]			= &dspb_a.hw,
-		[CLKID_DSPB_B_SEL]		= &dspb_b_sel.hw,
-		[CLKID_DSPB_B_DIV]		= &dspb_b_div.hw,
-		[CLKID_DSPB_B]			= &dspb_b.hw,
-		[CLKID_RTC_32K_IN]		= &rtc_32k_in.hw,
-		[CLKID_RTC_32K_DIV]		= &rtc_32k_div.hw,
-		[CLKID_RTC_32K_XTAL]		= &rtc_32k_xtal.hw,
-		[CLKID_RTC_32K_SEL]		= &rtc_32k_sel.hw,
-		[CLKID_CECB_32K_IN]		= &cecb_32k_in.hw,
-		[CLKID_CECB_32K_DIV]		= &cecb_32k_div.hw,
-		[CLKID_CECB_32K_SEL_PRE]	= &cecb_32k_sel_pre.hw,
-		[CLKID_CECB_32K_SEL]		= &cecb_32k_sel.hw,
-		[CLKID_CECA_32K_IN]		= &ceca_32k_in.hw,
-		[CLKID_CECA_32K_DIV]		= &ceca_32k_div.hw,
-		[CLKID_CECA_32K_SEL_PRE]	= &ceca_32k_sel_pre.hw,
-		[CLKID_CECA_32K_SEL]		= &ceca_32k_sel.hw,
-		[CLKID_DIV2_PRE]		= &fclk_div2_divn_pre.hw,
-		[CLKID_24M_DIV2]		= &clk_24m_div2.hw,
-		[CLKID_GEN_SEL]			= &gen_sel.hw,
-		[CLKID_GEN_DIV]			= &gen_div.hw,
-		[CLKID_SARADC_DIV]		= &saradc_div.hw,
-		[CLKID_PWM_A_SEL]		= &pwm_a_sel.hw,
-		[CLKID_PWM_A_DIV]		= &pwm_a_div.hw,
-		[CLKID_PWM_B_SEL]		= &pwm_b_sel.hw,
-		[CLKID_PWM_B_DIV]		= &pwm_b_div.hw,
-		[CLKID_PWM_C_SEL]		= &pwm_c_sel.hw,
-		[CLKID_PWM_C_DIV]		= &pwm_c_div.hw,
-		[CLKID_PWM_D_SEL]		= &pwm_d_sel.hw,
-		[CLKID_PWM_D_DIV]		= &pwm_d_div.hw,
-		[CLKID_PWM_E_SEL]		= &pwm_e_sel.hw,
-		[CLKID_PWM_E_DIV]		= &pwm_e_div.hw,
-		[CLKID_PWM_F_SEL]		= &pwm_f_sel.hw,
-		[CLKID_PWM_F_DIV]		= &pwm_f_div.hw,
-		[CLKID_SPICC_SEL]		= &spicc_sel.hw,
-		[CLKID_SPICC_DIV]		= &spicc_div.hw,
-		[CLKID_SPICC_SEL2]		= &spicc_sel2.hw,
-		[CLKID_TS_DIV]			= &ts_div.hw,
-		[CLKID_SPIFC_SEL]		= &spifc_sel.hw,
-		[CLKID_SPIFC_DIV]		= &spifc_div.hw,
-		[CLKID_SPIFC_SEL2]		= &spifc_sel2.hw,
-		[CLKID_USB_BUS_SEL]		= &usb_bus_sel.hw,
-		[CLKID_USB_BUS_DIV]		= &usb_bus_div.hw,
-		[CLKID_SD_EMMC_SEL]		= &sd_emmc_sel.hw,
-		[CLKID_SD_EMMC_DIV]		= &sd_emmc_div.hw,
-		[CLKID_SD_EMMC_SEL2]		= &sd_emmc_sel2.hw,
-		[CLKID_PSRAM_SEL]		= &psram_sel.hw,
-		[CLKID_PSRAM_DIV]		= &psram_div.hw,
-		[CLKID_PSRAM_SEL2]		= &psram_sel2.hw,
-		[CLKID_DMC_SEL]			= &dmc_sel.hw,
-		[CLKID_DMC_DIV]			= &dmc_div.hw,
-		[CLKID_DMC_SEL2]		= &dmc_sel2.hw,
-		[NR_CLKS]			= NULL,
-	},
-	.num = NR_CLKS,
+static struct clk_hw *a1_periphs_hw_clks[] = {
+	[CLKID_XTAL_IN]			= &xtal_in.hw,
+	[CLKID_FIXPLL_IN]		= &fixpll_in.hw,
+	[CLKID_USB_PHY_IN]		= &usb_phy_in.hw,
+	[CLKID_USB_CTRL_IN]		= &usb_ctrl_in.hw,
+	[CLKID_HIFIPLL_IN]		= &hifipll_in.hw,
+	[CLKID_SYSPLL_IN]		= &syspll_in.hw,
+	[CLKID_DDS_IN]			= &dds_in.hw,
+	[CLKID_SYS]			= &sys.hw,
+	[CLKID_CLKTREE]			= &clktree.hw,
+	[CLKID_RESET_CTRL]		= &reset_ctrl.hw,
+	[CLKID_ANALOG_CTRL]		= &analog_ctrl.hw,
+	[CLKID_PWR_CTRL]		= &pwr_ctrl.hw,
+	[CLKID_PAD_CTRL]		= &pad_ctrl.hw,
+	[CLKID_SYS_CTRL]		= &sys_ctrl.hw,
+	[CLKID_TEMP_SENSOR]		= &temp_sensor.hw,
+	[CLKID_AM2AXI_DIV]		= &am2axi_dev.hw,
+	[CLKID_SPICC_B]			= &spicc_b.hw,
+	[CLKID_SPICC_A]			= &spicc_a.hw,
+	[CLKID_MSR]			= &msr.hw,
+	[CLKID_AUDIO]			= &audio.hw,
+	[CLKID_JTAG_CTRL]		= &jtag_ctrl.hw,
+	[CLKID_SARADC_EN]		= &saradc_en.hw,
+	[CLKID_PWM_EF]			= &pwm_ef.hw,
+	[CLKID_PWM_CD]			= &pwm_cd.hw,
+	[CLKID_PWM_AB]			= &pwm_ab.hw,
+	[CLKID_CEC]			= &cec.hw,
+	[CLKID_I2C_S]			= &i2c_s.hw,
+	[CLKID_IR_CTRL]			= &ir_ctrl.hw,
+	[CLKID_I2C_M_D]			= &i2c_m_d.hw,
+	[CLKID_I2C_M_C]			= &i2c_m_c.hw,
+	[CLKID_I2C_M_B]			= &i2c_m_b.hw,
+	[CLKID_I2C_M_A]			= &i2c_m_a.hw,
+	[CLKID_ACODEC]			= &acodec.hw,
+	[CLKID_OTP]			= &otp.hw,
+	[CLKID_SD_EMMC_A]		= &sd_emmc_a.hw,
+	[CLKID_USB_PHY]			= &usb_phy.hw,
+	[CLKID_USB_CTRL]		= &usb_ctrl.hw,
+	[CLKID_SYS_DSPB]		= &sys_dspb.hw,
+	[CLKID_SYS_DSPA]		= &sys_dspa.hw,
+	[CLKID_DMA]			= &dma.hw,
+	[CLKID_IRQ_CTRL]		= &irq_ctrl.hw,
+	[CLKID_NIC]			= &nic.hw,
+	[CLKID_GIC]			= &gic.hw,
+	[CLKID_UART_C]			= &uart_c.hw,
+	[CLKID_UART_B]			= &uart_b.hw,
+	[CLKID_UART_A]			= &uart_a.hw,
+	[CLKID_SYS_PSRAM]		= &sys_psram.hw,
+	[CLKID_RSA]			= &rsa.hw,
+	[CLKID_CORESIGHT]		= &coresight.hw,
+	[CLKID_AM2AXI_VAD]		= &am2axi_vad.hw,
+	[CLKID_AUDIO_VAD]		= &audio_vad.hw,
+	[CLKID_AXI_DMC]			= &axi_dmc.hw,
+	[CLKID_AXI_PSRAM]		= &axi_psram.hw,
+	[CLKID_RAMB]			= &ramb.hw,
+	[CLKID_RAMA]			= &rama.hw,
+	[CLKID_AXI_SPIFC]		= &axi_spifc.hw,
+	[CLKID_AXI_NIC]			= &axi_nic.hw,
+	[CLKID_AXI_DMA]			= &axi_dma.hw,
+	[CLKID_CPU_CTRL]		= &cpu_ctrl.hw,
+	[CLKID_ROM]			= &rom.hw,
+	[CLKID_PROC_I2C]		= &prod_i2c.hw,
+	[CLKID_DSPA_SEL]		= &dspa_sel.hw,
+	[CLKID_DSPB_SEL]		= &dspb_sel.hw,
+	[CLKID_DSPA_EN]			= &dspa_en.hw,
+	[CLKID_DSPA_EN_NIC]		= &dspa_en_nic.hw,
+	[CLKID_DSPB_EN]			= &dspb_en.hw,
+	[CLKID_DSPB_EN_NIC]		= &dspb_en_nic.hw,
+	[CLKID_RTC]			= &rtc.hw,
+	[CLKID_CECA_32K]		= &ceca_32k_out.hw,
+	[CLKID_CECB_32K]		= &cecb_32k_out.hw,
+	[CLKID_24M]			= &clk_24m.hw,
+	[CLKID_12M]			= &clk_12m.hw,
+	[CLKID_FCLK_DIV2_DIVN]		= &fclk_div2_divn.hw,
+	[CLKID_GEN]			= &gen.hw,
+	[CLKID_SARADC_SEL]		= &saradc_sel.hw,
+	[CLKID_SARADC]			= &saradc.hw,
+	[CLKID_PWM_A]			= &pwm_a.hw,
+	[CLKID_PWM_B]			= &pwm_b.hw,
+	[CLKID_PWM_C]			= &pwm_c.hw,
+	[CLKID_PWM_D]			= &pwm_d.hw,
+	[CLKID_PWM_E]			= &pwm_e.hw,
+	[CLKID_PWM_F]			= &pwm_f.hw,
+	[CLKID_SPICC]			= &spicc.hw,
+	[CLKID_TS]			= &ts.hw,
+	[CLKID_SPIFC]			= &spifc.hw,
+	[CLKID_USB_BUS]			= &usb_bus.hw,
+	[CLKID_SD_EMMC]			= &sd_emmc.hw,
+	[CLKID_PSRAM]			= &psram.hw,
+	[CLKID_DMC]			= &dmc.hw,
+	[CLKID_SYS_A_SEL]		= &sys_a_sel.hw,
+	[CLKID_SYS_A_DIV]		= &sys_a_div.hw,
+	[CLKID_SYS_A]			= &sys_a.hw,
+	[CLKID_SYS_B_SEL]		= &sys_b_sel.hw,
+	[CLKID_SYS_B_DIV]		= &sys_b_div.hw,
+	[CLKID_SYS_B]			= &sys_b.hw,
+	[CLKID_DSPA_A_SEL]		= &dspa_a_sel.hw,
+	[CLKID_DSPA_A_DIV]		= &dspa_a_div.hw,
+	[CLKID_DSPA_A]			= &dspa_a.hw,
+	[CLKID_DSPA_B_SEL]		= &dspa_b_sel.hw,
+	[CLKID_DSPA_B_DIV]		= &dspa_b_div.hw,
+	[CLKID_DSPA_B]			= &dspa_b.hw,
+	[CLKID_DSPB_A_SEL]		= &dspb_a_sel.hw,
+	[CLKID_DSPB_A_DIV]		= &dspb_a_div.hw,
+	[CLKID_DSPB_A]			= &dspb_a.hw,
+	[CLKID_DSPB_B_SEL]		= &dspb_b_sel.hw,
+	[CLKID_DSPB_B_DIV]		= &dspb_b_div.hw,
+	[CLKID_DSPB_B]			= &dspb_b.hw,
+	[CLKID_RTC_32K_IN]		= &rtc_32k_in.hw,
+	[CLKID_RTC_32K_DIV]		= &rtc_32k_div.hw,
+	[CLKID_RTC_32K_XTAL]		= &rtc_32k_xtal.hw,
+	[CLKID_RTC_32K_SEL]		= &rtc_32k_sel.hw,
+	[CLKID_CECB_32K_IN]		= &cecb_32k_in.hw,
+	[CLKID_CECB_32K_DIV]		= &cecb_32k_div.hw,
+	[CLKID_CECB_32K_SEL_PRE]	= &cecb_32k_sel_pre.hw,
+	[CLKID_CECB_32K_SEL]		= &cecb_32k_sel.hw,
+	[CLKID_CECA_32K_IN]		= &ceca_32k_in.hw,
+	[CLKID_CECA_32K_DIV]		= &ceca_32k_div.hw,
+	[CLKID_CECA_32K_SEL_PRE]	= &ceca_32k_sel_pre.hw,
+	[CLKID_CECA_32K_SEL]		= &ceca_32k_sel.hw,
+	[CLKID_DIV2_PRE]		= &fclk_div2_divn_pre.hw,
+	[CLKID_24M_DIV2]		= &clk_24m_div2.hw,
+	[CLKID_GEN_SEL]			= &gen_sel.hw,
+	[CLKID_GEN_DIV]			= &gen_div.hw,
+	[CLKID_SARADC_DIV]		= &saradc_div.hw,
+	[CLKID_PWM_A_SEL]		= &pwm_a_sel.hw,
+	[CLKID_PWM_A_DIV]		= &pwm_a_div.hw,
+	[CLKID_PWM_B_SEL]		= &pwm_b_sel.hw,
+	[CLKID_PWM_B_DIV]		= &pwm_b_div.hw,
+	[CLKID_PWM_C_SEL]		= &pwm_c_sel.hw,
+	[CLKID_PWM_C_DIV]		= &pwm_c_div.hw,
+	[CLKID_PWM_D_SEL]		= &pwm_d_sel.hw,
+	[CLKID_PWM_D_DIV]		= &pwm_d_div.hw,
+	[CLKID_PWM_E_SEL]		= &pwm_e_sel.hw,
+	[CLKID_PWM_E_DIV]		= &pwm_e_div.hw,
+	[CLKID_PWM_F_SEL]		= &pwm_f_sel.hw,
+	[CLKID_PWM_F_DIV]		= &pwm_f_div.hw,
+	[CLKID_SPICC_SEL]		= &spicc_sel.hw,
+	[CLKID_SPICC_DIV]		= &spicc_div.hw,
+	[CLKID_SPICC_SEL2]		= &spicc_sel2.hw,
+	[CLKID_TS_DIV]			= &ts_div.hw,
+	[CLKID_SPIFC_SEL]		= &spifc_sel.hw,
+	[CLKID_SPIFC_DIV]		= &spifc_div.hw,
+	[CLKID_SPIFC_SEL2]		= &spifc_sel2.hw,
+	[CLKID_USB_BUS_SEL]		= &usb_bus_sel.hw,
+	[CLKID_USB_BUS_DIV]		= &usb_bus_div.hw,
+	[CLKID_SD_EMMC_SEL]		= &sd_emmc_sel.hw,
+	[CLKID_SD_EMMC_DIV]		= &sd_emmc_div.hw,
+	[CLKID_SD_EMMC_SEL2]		= &sd_emmc_sel2.hw,
+	[CLKID_PSRAM_SEL]		= &psram_sel.hw,
+	[CLKID_PSRAM_DIV]		= &psram_div.hw,
+	[CLKID_PSRAM_SEL2]		= &psram_sel2.hw,
+	[CLKID_DMC_SEL]			= &dmc_sel.hw,
+	[CLKID_DMC_DIV]			= &dmc_div.hw,
+	[CLKID_DMC_SEL2]		= &dmc_sel2.hw,
 };
 
 /* Convenience table to populate regmap in .probe */
@@ -2190,6 +2187,11 @@ static struct regmap_config a1_periphs_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static struct meson_clk_hw_data a1_periphs_clks = {
+	.hws = a1_periphs_hw_clks,
+	.num = ARRAY_SIZE(a1_periphs_hw_clks),
+};
+
 static int meson_a1_periphs_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2219,8 +2221,7 @@ static int meson_a1_periphs_probe(struct platform_device *pdev)
 					     clkid);
 	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-					   &a1_periphs_clks);
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_periphs_clks);
 }
 
 static const struct of_device_id a1_periphs_clkc_match_table[] = {
diff --git a/drivers/clk/meson/a1-peripherals.h b/drivers/clk/meson/a1-peripherals.h
index 526fc9ba5c9f..4d60456a95a9 100644
--- a/drivers/clk/meson/a1-peripherals.h
+++ b/drivers/clk/meson/a1-peripherals.h
@@ -108,6 +108,5 @@
 #define CLKID_DMC_SEL		151
 #define CLKID_DMC_DIV		152
 #define CLKID_DMC_SEL2		153
-#define NR_CLKS			154
 
 #endif /* __A1_PERIPHERALS_H */
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index bd2f1d1ec6e4..25e6b567afd5 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include "a1-pll.h"
 #include "clk-regmap.h"
+#include "meson-clkc-utils.h"
 
 static struct clk_regmap fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
@@ -268,22 +269,18 @@ static struct clk_regmap fclk_div7 = {
 };
 
 /* Array of all clocks registered by this provider */
-static struct clk_hw_onecell_data a1_pll_clks = {
-	.hws = {
-		[CLKID_FIXED_PLL_DCO]	= &fixed_pll_dco.hw,
-		[CLKID_FIXED_PLL]	= &fixed_pll.hw,
-		[CLKID_FCLK_DIV2_DIV]	= &fclk_div2_div.hw,
-		[CLKID_FCLK_DIV3_DIV]	= &fclk_div3_div.hw,
-		[CLKID_FCLK_DIV5_DIV]	= &fclk_div5_div.hw,
-		[CLKID_FCLK_DIV7_DIV]	= &fclk_div7_div.hw,
-		[CLKID_FCLK_DIV2]	= &fclk_div2.hw,
-		[CLKID_FCLK_DIV3]	= &fclk_div3.hw,
-		[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
-		[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
-		[CLKID_HIFI_PLL]	= &hifi_pll.hw,
-		[NR_PLL_CLKS]		= NULL,
-	},
-	.num = NR_PLL_CLKS,
+static struct clk_hw *a1_pll_hw_clks[] = {
+	[CLKID_FIXED_PLL_DCO]	= &fixed_pll_dco.hw,
+	[CLKID_FIXED_PLL]	= &fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]	= &fclk_div2_div.hw,
+	[CLKID_FCLK_DIV3_DIV]	= &fclk_div3_div.hw,
+	[CLKID_FCLK_DIV5_DIV]	= &fclk_div5_div.hw,
+	[CLKID_FCLK_DIV7_DIV]	= &fclk_div7_div.hw,
+	[CLKID_FCLK_DIV2]	= &fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	= &fclk_div3.hw,
+	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
+	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
 };
 
 static struct clk_regmap *const a1_pll_regmaps[] = {
@@ -302,6 +299,11 @@ static struct regmap_config a1_pll_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static struct meson_clk_hw_data a1_pll_clks = {
+	.hws = a1_pll_hw_clks,
+	.num = ARRAY_SIZE(a1_pll_hw_clks),
+};
+
 static int meson_a1_pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -332,7 +334,7 @@ static int meson_a1_pll_probe(struct platform_device *pdev)
 					     clkid);
 	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
 					   &a1_pll_clks);
 }
 
diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
index 29726651b056..82570759e6a2 100644
--- a/drivers/clk/meson/a1-pll.h
+++ b/drivers/clk/meson/a1-pll.h
@@ -42,6 +42,5 @@
 #define CLKID_FCLK_DIV3_DIV	3
 #define CLKID_FCLK_DIV5_DIV	4
 #define CLKID_FCLK_DIV7_DIV	5
-#define NR_PLL_CLKS		11
 
 #endif /* __A1_PLL_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
