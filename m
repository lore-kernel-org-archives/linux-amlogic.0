Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E8C47088
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE3LaJHNwvhEEdI8yptZuyDPZu9L51kw3haIz+NK1fo=; b=cfrq0VRxloqr/B
	2b3ktAXDYDjhOXFZjzhL/ZlcynL5PBaZYzIQ60ScQjxPJQQRvn/3NViAaHgq/Mdcsgz4LqcIq44Ac
	uKhJBX6XGrdYIOSKACjOW2iP7E8RQFY6EkIPgKmg0h9wPQmBc95TtIBisENxWyVdWJbtKmpay7dH/
	VYjRov2O9RO1xNuEgwVtZScZGqonjQtFNbuqwJ3JXDl4tIe+qpURxBTt4xFWZal3MczRnIvltnyFX
	Mzhw8/R9s5tLxtlG85/brNhs1uKCvWfhrm68YI0xp7Rvb9L7Jyr8sdHLfu1a6iBj/k2aFrFkZAhqe
	DhLVPFJBXZGPI6SymTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14sR-00GESx-IV; Fri, 02 Dec 2022 12:10:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14sN-00GER4-Pz; Fri, 02 Dec 2022 12:10:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4AB9D5FD0B;
	Fri,  2 Dec 2022 15:10:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669983041;
	bh=lpeYfuXkQatYBY2807d/oVsDx5H9I0FeqpHrgX4TQZ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=VmYx4uXWPbGlQG85D7VA9EtDE8FzEznr08UIqtB+mWZ1vvaR4ps3bzI2EwtWhC3LA
	 EKkZ9gnhQ0arEoQMC/vVt9iTfsNz+wPS8EL/7WvXctFs6F8uvGwbJvC2TXEjbb5YaH
	 GDZSAXg7K1KbGDlOVDQNeTSZltKh0f16qfPm5VzdtjapTi30cjhv6ItrKbjPq0ffXF
	 flKPzqmh/A33gWTaFjz+mZ83m8EzEfaAVwIsBTcM5BmvHnbAoxlWITFbbHWgj+hvUi
	 z2SXSO7BJKaUgsilLy6obFaLgT6XUyjlcH6a2enwCfpQjkxNPVCwg7solzbK3cVwBP
	 o2/DWTSIVvMhQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 15:10:40 +0300 (MSK)
Date: Fri, 2 Dec 2022 15:10:40 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 09/11] clk: meson: redesign A1 Peripherals CLK
 controller
Message-ID: <20221202121040.4m7fw5jmcony66ab@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-10-ddrokosov@sberdevices.ru>
 <1jpmd26mi2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jpmd26mi2.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_041044_211005_96DD728B 
X-CRM114-Status: GOOD (  11.83  )
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

...

> > @@ -1873,13 +1875,6 @@ static MESON_GATE(a1_prod_i2c,		AXI_CLK_EN,	12);
> >  /* Array of all clocks provided by this provider */
> >  static struct clk_hw_onecell_data a1_periphs_hw_onecell_data = {
> >  	.hws = {
> > -		[CLKID_SYS_B_SEL]		= &a1_sys_b_sel.hw,
> > -		[CLKID_SYS_B_DIV]		= &a1_sys_b_div.hw,
> > -		[CLKID_SYS_B]			= &a1_sys_b.hw,
> > -		[CLKID_SYS_A_SEL]		= &a1_sys_a_sel.hw,
> > -		[CLKID_SYS_A_DIV]		= &a1_sys_a_div.hw,
> > -		[CLKID_SYS_A]			= &a1_sys_a.hw,
> > -		[CLKID_SYS_CLK]			= &a1_sys_clk.hw,
> >  		[CLKID_XTAL_CLKTREE]		= &a1_xtal_clktree.hw,
> >  		[CLKID_XTAL_FIXPLL]		= &a1_xtal_fixpll.hw,
> >  		[CLKID_XTAL_USB_PHY]		= &a1_xtal_usb_phy.hw,
> > @@ -1887,6 +1882,7 @@ static struct clk_hw_onecell_data a1_periphs_hw_onecell_data = {
> >  		[CLKID_XTAL_HIFIPLL]		= &a1_xtal_hifipll.hw,
> >  		[CLKID_XTAL_SYSPLL]		= &a1_xtal_syspll.hw,
> >  		[CLKID_XTAL_DDS]		= &a1_xtal_dds.hw,
> > +		[CLKID_SYS_CLK]			= &a1_sys_clk.hw,
> >  		[CLKID_CLKTREE]			= &a1_clk_tree.hw,
> >  		[CLKID_RESET_CTRL]		= &a1_reset_ctrl.hw,
> >  		[CLKID_ANALOG_CTRL]		= &a1_analog_ctrl.hw,
> > @@ -1940,93 +1936,99 @@ static struct clk_hw_onecell_data a1_periphs_hw_onecell_data = {
> >  		[CLKID_CPU_CTRL]		= &a1_cpu_ctrl.hw,
> >  		[CLKID_ROM]			= &a1_rom.hw,
> >  		[CLKID_PROC_I2C]		= &a1_prod_i2c.hw,
> > +		[CLKID_DSPA_SEL]		= &a1_dspa_sel.hw,
> > +		[CLKID_DSPB_SEL]		= &a1_dspb_sel.hw,
> > +		[CLKID_DSPA_EN]			= &a1_dspa_en.hw,
> > +		[CLKID_DSPA_EN_NIC]		= &a1_dspa_en_nic.hw,
> > +		[CLKID_DSPB_EN]			= &a1_dspb_en.hw,
> > +		[CLKID_DSPB_EN_NIC]		= &a1_dspb_en_nic.hw,
> > +		[CLKID_RTC_CLK]			= &a1_rtc_clk.hw,
> > +		[CLKID_CECA_32K]		= &a1_ceca_32k_clkout.hw,
> > +		[CLKID_CECB_32K]		= &a1_cecb_32k_clkout.hw,
> > +		[CLKID_24M]			= &a1_24m.hw,
> > +		[CLKID_12M]			= &a1_12m.hw,
> > +		[CLKID_FCLK_DIV2_DIVN]		= &a1_fclk_div2_divn.hw,
> > +		[CLKID_GEN]			= &a1_gen.hw,
> > +		[CLKID_SARADC_SEL]		= &a1_saradc_sel.hw,
> > +		[CLKID_SARADC_CLK]		= &a1_saradc_clk.hw,
> > +		[CLKID_PWM_A]			= &a1_pwm_a.hw,
> > +		[CLKID_PWM_B]			= &a1_pwm_b.hw,
> > +		[CLKID_PWM_C]			= &a1_pwm_c.hw,
> > +		[CLKID_PWM_D]			= &a1_pwm_d.hw,
> > +		[CLKID_PWM_E]			= &a1_pwm_e.hw,
> > +		[CLKID_PWM_F]			= &a1_pwm_f.hw,
> > +		[CLKID_SPICC]			= &a1_spicc.hw,
> > +		[CLKID_TS]			= &a1_ts.hw,
> > +		[CLKID_SPIFC]			= &a1_spifc.hw,
> > +		[CLKID_USB_BUS]			= &a1_usb_bus.hw,
> > +		[CLKID_SD_EMMC]			= &a1_sd_emmc.hw,
> > +		[CLKID_PSRAM]			= &a1_psram.hw,
> > +		[CLKID_DMC]			= &a1_dmc.hw,
> > +		[CLKID_SYS_A_SEL]		= &a1_sys_a_sel.hw,
> > +		[CLKID_SYS_A_DIV]		= &a1_sys_a_div.hw,
> > +		[CLKID_SYS_A]			= &a1_sys_a.hw,
> > +		[CLKID_SYS_B_SEL]		= &a1_sys_b_sel.hw,
> > +		[CLKID_SYS_B_DIV]		= &a1_sys_b_div.hw,
> > +		[CLKID_SYS_B]			= &a1_sys_b.hw,
> >  		[CLKID_DSPA_A_SEL]		= &a1_dspa_a_sel.hw,
> >  		[CLKID_DSPA_A_DIV]		= &a1_dspa_a_div.hw,
> >  		[CLKID_DSPA_A]			= &a1_dspa_a.hw,
> >  		[CLKID_DSPA_B_SEL]		= &a1_dspa_b_sel.hw,
> >  		[CLKID_DSPA_B_DIV]		= &a1_dspa_b_div.hw,
> >  		[CLKID_DSPA_B]			= &a1_dspa_b.hw,
> > -		[CLKID_DSPA_SEL]		= &a1_dspa_sel.hw,
> >  		[CLKID_DSPB_A_SEL]		= &a1_dspb_a_sel.hw,
> >  		[CLKID_DSPB_A_DIV]		= &a1_dspb_a_div.hw,
> >  		[CLKID_DSPB_A]			= &a1_dspb_a.hw,
> >  		[CLKID_DSPB_B_SEL]		= &a1_dspb_b_sel.hw,
> >  		[CLKID_DSPB_B_DIV]		= &a1_dspb_b_div.hw,
> >  		[CLKID_DSPB_B]			= &a1_dspb_b.hw,
> > -		[CLKID_DSPB_SEL]		= &a1_dspb_sel.hw,
> > -		[CLKID_DSPA_EN]			= &a1_dspa_en.hw,
> > -		[CLKID_DSPA_EN_NIC]		= &a1_dspa_en_nic.hw,
> > -		[CLKID_DSPB_EN]			= &a1_dspb_en.hw,
> > -		[CLKID_DSPB_EN_NIC]		= &a1_dspb_en_nic.hw,
> > -		[CLKID_24M]			= &a1_24m.hw,
> > -		[CLKID_24M_DIV2]		= &a1_24m_div2.hw,
> > -		[CLKID_12M]			= &a1_12m.hw,
> > +		[CLKID_RTC_32K_CLKIN]		= &a1_rtc_32k_clkin.hw,
> > +		[CLKID_RTC_32K_DIV]		= &a1_rtc_32k_div.hw,
> > +		[CLKID_RTC_32K_XTAL]		= &a1_rtc_32k_xtal.hw,
> > +		[CLKID_RTC_32K_SEL]		= &a1_rtc_32k_sel.hw,
> > +		[CLKID_CECB_32K_CLKIN]		= &a1_cecb_32k_clkin.hw,
> > +		[CLKID_CECB_32K_DIV]		= &a1_cecb_32k_div.hw,
> > +		[CLKID_CECB_32K_SEL_PRE]	= &a1_cecb_32k_sel_pre.hw,
> > +		[CLKID_CECB_32K_SEL]		= &a1_cecb_32k_sel.hw,
> > +		[CLKID_CECA_32K_CLKIN]		= &a1_ceca_32k_clkin.hw,
> > +		[CLKID_CECA_32K_DIV]		= &a1_ceca_32k_div.hw,
> > +		[CLKID_CECA_32K_SEL_PRE]	= &a1_ceca_32k_sel_pre.hw,
> > +		[CLKID_CECA_32K_SEL]		= &a1_ceca_32k_sel.hw,
> >  		[CLKID_DIV2_PRE]		= &a1_fclk_div2_divn_pre.hw,
> > -		[CLKID_FCLK_DIV2_DIVN]		= &a1_fclk_div2_divn.hw,
> > +		[CLKID_24M_DIV2]		= &a1_24m_div2.hw,
> >  		[CLKID_GEN_SEL]			= &a1_gen_sel.hw,
> >  		[CLKID_GEN_DIV]			= &a1_gen_div.hw,
> > -		[CLKID_GEN]			= &a1_gen.hw,
> > -		[CLKID_SARADC_SEL]		= &a1_saradc_sel.hw,
> >  		[CLKID_SARADC_DIV]		= &a1_saradc_div.hw,
> > -		[CLKID_SARADC_CLK]		= &a1_saradc_clk.hw,
> >  		[CLKID_PWM_A_SEL]		= &a1_pwm_a_sel.hw,
> >  		[CLKID_PWM_A_DIV]		= &a1_pwm_a_div.hw,
> > -		[CLKID_PWM_A]			= &a1_pwm_a.hw,
> >  		[CLKID_PWM_B_SEL]		= &a1_pwm_b_sel.hw,
> >  		[CLKID_PWM_B_DIV]		= &a1_pwm_b_div.hw,
> > -		[CLKID_PWM_B]			= &a1_pwm_b.hw,
> >  		[CLKID_PWM_C_SEL]		= &a1_pwm_c_sel.hw,
> >  		[CLKID_PWM_C_DIV]		= &a1_pwm_c_div.hw,
> > -		[CLKID_PWM_C]			= &a1_pwm_c.hw,
> >  		[CLKID_PWM_D_SEL]		= &a1_pwm_d_sel.hw,
> >  		[CLKID_PWM_D_DIV]		= &a1_pwm_d_div.hw,
> > -		[CLKID_PWM_D]			= &a1_pwm_d.hw,
> >  		[CLKID_PWM_E_SEL]		= &a1_pwm_e_sel.hw,
> >  		[CLKID_PWM_E_DIV]		= &a1_pwm_e_div.hw,
> > -		[CLKID_PWM_E]			= &a1_pwm_e.hw,
> >  		[CLKID_PWM_F_SEL]		= &a1_pwm_f_sel.hw,
> >  		[CLKID_PWM_F_DIV]		= &a1_pwm_f_div.hw,
> > -		[CLKID_PWM_F]			= &a1_pwm_f.hw,
> >  		[CLKID_SPICC_SEL]		= &a1_spicc_sel.hw,
> >  		[CLKID_SPICC_DIV]		= &a1_spicc_div.hw,
> >  		[CLKID_SPICC_SEL2]		= &a1_spicc_sel2.hw,
> > -		[CLKID_SPICC]			= &a1_spicc.hw,
> >  		[CLKID_TS_DIV]			= &a1_ts_div.hw,
> > -		[CLKID_TS]			= &a1_ts.hw,
> >  		[CLKID_SPIFC_SEL]		= &a1_spifc_sel.hw,
> >  		[CLKID_SPIFC_DIV]		= &a1_spifc_div.hw,
> >  		[CLKID_SPIFC_SEL2]		= &a1_spifc_sel2.hw,
> > -		[CLKID_SPIFC]			= &a1_spifc.hw,
> >  		[CLKID_USB_BUS_SEL]		= &a1_usb_bus_sel.hw,
> >  		[CLKID_USB_BUS_DIV]		= &a1_usb_bus_div.hw,
> > -		[CLKID_USB_BUS]			= &a1_usb_bus.hw,
> >  		[CLKID_SD_EMMC_SEL]		= &a1_sd_emmc_sel.hw,
> >  		[CLKID_SD_EMMC_DIV]		= &a1_sd_emmc_div.hw,
> >  		[CLKID_SD_EMMC_SEL2]		= &a1_sd_emmc_sel2.hw,
> > -		[CLKID_SD_EMMC]			= &a1_sd_emmc.hw,
> >  		[CLKID_PSRAM_SEL]		= &a1_psram_sel.hw,
> >  		[CLKID_PSRAM_DIV]		= &a1_psram_div.hw,
> >  		[CLKID_PSRAM_SEL2]		= &a1_psram_sel2.hw,
> > -		[CLKID_PSRAM]			= &a1_psram.hw,
> >  		[CLKID_DMC_SEL]			= &a1_dmc_sel.hw,
> >  		[CLKID_DMC_DIV]			= &a1_dmc_div.hw,
> >  		[CLKID_DMC_SEL2]		= &a1_dmc_sel2.hw,
> > -		[CLKID_DMC]			= &a1_dmc.hw,
> > -		[CLKID_RTC_32K_CLKIN]		= &a1_rtc_32k_clkin.hw,
> > -		[CLKID_RTC_32K_DIV]		= &a1_rtc_32k_div.hw,
> > -		[CLKID_RTC_32K_XTAL]		= &a1_rtc_32k_xtal.hw,
> > -		[CLKID_RTC_32K_SEL]		= &a1_rtc_32k_sel.hw,
> > -		[CLKID_RTC_CLK]			= &a1_rtc_clk.hw,
> > -		[CLKID_CECA_32K_CLKIN]		= &a1_ceca_32k_clkin.hw,
> > -		[CLKID_CECA_32K_DIV]		= &a1_ceca_32k_div.hw,
> > -		[CLKID_CECA_32K_SEL_PRE]	= &a1_ceca_32k_sel_pre.hw,
> > -		[CLKID_CECA_32K_SEL]		= &a1_ceca_32k_sel.hw,
> > -		[CLKID_CECA_32K]		= &a1_ceca_32k_clkout.hw,
> > -		[CLKID_CECB_32K_CLKIN]		= &a1_cecb_32k_clkin.hw,
> > -		[CLKID_CECB_32K_DIV]		= &a1_cecb_32k_div.hw,
> > -		[CLKID_CECB_32K_SEL_PRE]	= &a1_cecb_32k_sel_pre.hw,
> > -		[CLKID_CECB_32K_SEL]		= &a1_cecb_32k_sel.hw,
> > -		[CLKID_CECB_32K]		= &a1_cecb_32k_clkout.hw,
> >  		[NR_CLKS]			= NULL,
> >  	},
> 
> Please avoid this ordering change - It is borderline impossible to
> review.
> 
> Keep the ID Order

Yes, it's what I'm trying to achieve here - keeping the ID order. Jian
Hu's version mixed up CLKDID definitions. This patch resolves such
problem. Anyway, next version will not have such diff, because patches
will be squashed.

...

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
