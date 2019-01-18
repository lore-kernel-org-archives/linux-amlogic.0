Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2035C1B0FD
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF7F2054F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmR2BHCQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pCREDqKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF7F2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzSAE26V3MpmAbI0PJEaotgPFQq7G5STnEm+SIWTW4E=; b=gmR2BHCQuRXjgn
	F7h672HYjrJ3RG8FHEu4WGSpYIdDIQcDIZTcQfxsMWf0Tr13EJESxw0rj8TDrFVwQ9ktjqyYMIR5t
	OBcFu61IJzQYQEINgpxa28eMdLWairP8WDNs4BCTNw15l0QexOtusVuKMF+2ZZQlVjLCpcABgqm+6
	tJVbqd5hOMSWdCdclYHPuniIIN0QTslKAMFx7agMMmhBBO6NgmCTjTsKchzdXpAjknTK6dSz3UfTb
	HfoGx8H1GpQX484CAtagffj0iyNjmmsYqf3ET2OwrqicVD6F5GXhhlhYOQQQQ+sF1L1eNJl4EkHLH
	E42UrjUq4E/CPL6401PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkc4v-0004bR-Hu; Fri, 18 Jan 2019 21:53:29 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkc4r-0004aW-Ky
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 21:53:27 +0000
Received: by mail-oi1-x244.google.com with SMTP id x23so10161731oix.3
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 13:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1u8UfibnV2s5c6/1XwYGDa3Lo+NOwnVHYGFXbT5cpzk=;
 b=pCREDqKD3muMjz7YAgij6hdwRg+EsT1QONVI4nooUgJGcZfh5uo1ia2NYABtHd+Vbe
 ZRIA82oqqsazrJxN7nsLTH/F15uQQ4sRelB6+Q6az7lste7wuzhddsZDueLVSapUC9Ni
 tDp+Hk4/pe6gjjPTsYXl6KW83K1XCUnO3FdL1d20xRIcYVrcOUtLC13miFVGBiw8+99o
 ubDt4YqOJRI9ZbZLQXQihfuqmRwVf1OaURjLHAvO//7SJhxQkglKIqZU7yN9yV1Ubici
 DRLE3YLgeCBTxwOGondE7sNapotjBeYKcQP84fd1Khcdq0qu3BqrePelQOUw+T51Xifj
 722A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1u8UfibnV2s5c6/1XwYGDa3Lo+NOwnVHYGFXbT5cpzk=;
 b=pzSXua41A8Ts9g+ZUeE5S9rMun7Pf+1vscqzvsXNNcdZx5BPo0KwNu7Ce1wSCF8gj4
 aX0G8vBDNPnfOBVJqoJAm+axdWGBaxEZLQ/iHWCUHSfj4FScoRa51rgnVzDFTpO+GpUH
 qtvvY7L3wzXY32NsxdpNTm6+4EWtXivvbcSa4v7LQf6BkizJLgqxzUR71J2VLWu12nGi
 KcE9eK/ZcKBP8QCDw2fdYi+JbbvnQYskOMsW0VBGBVnCYqNygN4Ia7hG5Worss8nSvgt
 ZNWe4Svb5+aidFDVr/lWUnRESXjezbKpgIaz4ltYxAsQoBzidHDytb4pBDj/g/FO/SS9
 2z+g==
X-Gm-Message-State: AJcUukeM8qRZ8uz8bRPolFrT5al3/9tpfBPfjdvC5QTTrIS+kg1ZUWtx
 bcaEA8aGD9uOM88gKTvNHsfFM0Izm5Hn/+rREQUNWF8Z
X-Google-Smtp-Source: ALg8bN5xZ06M/b13GzYkymVx2nNa4kbgJvJKV+mNPsxyeLiVaId4mWGJiH7yjgsfZT/32gPR3scskcT9q1shUvJp9a4=
X-Received: by 2002:aca:5b43:: with SMTP id p64mr1484492oib.41.1547848403596; 
 Fri, 18 Jan 2019 13:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <20190118103423.15075-3-jbrunet@baylibre.com>
In-Reply-To: <20190118103423.15075-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 22:53:12 +0100
Message-ID: <CAFBinCBxuqwpVMkkv_nKnhCf9HW0GCnw-T4Dyuc0eQYgc_UDTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] soc: amlogic: clk-measure: add axg and g12a support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_135325_685356_EE9C6900 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, Jan 18, 2019 at 11:34 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add support for the axg and g12a SoC family in amlogic clk measure
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
with the "wifi_beacon" issue below solved:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

please have a look at the other comments regarding G12A as well.
since I don't have any other information than what's available in
buildroot_openlinux_kernel_4.9_fbdev_20180706 I can't say whether your
IDs / names are right or not (all I can say is: some don't match with
that specific buildroot version).

> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 194 ++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index daea191a66fa..5570180b94a1 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -165,6 +165,192 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>         CLK_MSR_ID(82, "ge2d"),
>  };
>
> +static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
> +       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
> +       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
> +       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> +       CLK_MSR_ID(3, "a53_ring_osc"),
> +       CLK_MSR_ID(4, "gp0_pll"),
> +       CLK_MSR_ID(5, "gp1_pll"),
> +       CLK_MSR_ID(7, "clk81"),
> +       CLK_MSR_ID(9, "encl"),
> +       CLK_MSR_ID(17, "sys_pll_div16"),
> +       CLK_MSR_ID(18, "sys_cpu_div16"),
> +       CLK_MSR_ID(20, "rtc_osc_out"),
> +       CLK_MSR_ID(23, "mmc_clk"),
> +       CLK_MSR_ID(28, "sar_adc"),
> +       CLK_MSR_ID(31, "mpll_test_out"),
> +       CLK_MSR_ID(40, "mod_eth_tx_clk"),
> +       CLK_MSR_ID(41, "mod_eth_rx_clk_rmii"),
> +       CLK_MSR_ID(42, "mp0_out"),
> +       CLK_MSR_ID(43, "fclk_div5"),
> +       CLK_MSR_ID(44, "pwm_b"),
> +       CLK_MSR_ID(45, "pwm_a"),
> +       CLK_MSR_ID(46, "vpu"),
> +       CLK_MSR_ID(47, "ddr_dpll_pt"),
> +       CLK_MSR_ID(48, "mp1_out"),
> +       CLK_MSR_ID(49, "mp2_out"),
> +       CLK_MSR_ID(50, "mp3_out"),
> +       CLK_MSR_ID(51, "sd_emmm_c"),
> +       CLK_MSR_ID(52, "sd_emmc_b"),
> +       CLK_MSR_ID(61, "gpio_msr"),
> +       CLK_MSR_ID(66, "audio_slv_lrclk_c"),
> +       CLK_MSR_ID(67, "audio_slv_lrclk_b"),
> +       CLK_MSR_ID(68, "audio_slv_lrclk_a"),
> +       CLK_MSR_ID(69, "audio_slv_sclk_c"),
> +       CLK_MSR_ID(70, "audio_slv_sclk_b"),
> +       CLK_MSR_ID(71, "audio_slv_sclk_a"),
> +       CLK_MSR_ID(72, "pwm_d"),
> +       CLK_MSR_ID(73, "pwm_c"),
> +       CLK_MSR_ID(73, "wifi_beacon"),
"wifi_beacon" is ID 74 according to Amlogic's buildroot kernel sources
(buildroot_openlinux_kernel_4.9_fbdev_20180706)

> +       CLK_MSR_ID(75, "tdmin_lb_lrcl"),
> +       CLK_MSR_ID(76, "tdmin_lb_sclk"),
> +       CLK_MSR_ID(77, "rng_ring_osc_0"),
> +       CLK_MSR_ID(78, "rng_ring_osc_1"),
> +       CLK_MSR_ID(79, "rng_ring_osc_2"),
> +       CLK_MSR_ID(80, "rng_ring_osc_3"),
> +       CLK_MSR_ID(81, "vapb"),
> +       CLK_MSR_ID(82, "ge2d"),
> +       CLK_MSR_ID(84, "audio_resample"),
> +       CLK_MSR_ID(85, "audio_pdm_sys"),
> +       CLK_MSR_ID(86, "audio_spdifout"),
> +       CLK_MSR_ID(87, "audio_spdifin"),
> +       CLK_MSR_ID(88, "audio_lrclk_f"),
> +       CLK_MSR_ID(89, "audio_lrclk_e"),
> +       CLK_MSR_ID(90, "audio_lrclk_d"),
> +       CLK_MSR_ID(91, "audio_lrclk_c"),
> +       CLK_MSR_ID(92, "audio_lrclk_b"),
> +       CLK_MSR_ID(93, "audio_lrclk_a"),
> +       CLK_MSR_ID(94, "audio_sclk_f"),
> +       CLK_MSR_ID(95, "audio_sclk_e"),
> +       CLK_MSR_ID(96, "audio_sclk_d"),
> +       CLK_MSR_ID(97, "audio_sclk_c"),
> +       CLK_MSR_ID(98, "audio_sclk_b"),
> +       CLK_MSR_ID(99, "audio_sclk_a"),
> +       CLK_MSR_ID(100, "audio_mclk_f"),
> +       CLK_MSR_ID(101, "audio_mclk_e"),
> +       CLK_MSR_ID(102, "audio_mclk_d"),
> +       CLK_MSR_ID(103, "audio_mclk_c"),
> +       CLK_MSR_ID(104, "audio_mclk_b"),
> +       CLK_MSR_ID(105, "audio_mclk_a"),
> +       CLK_MSR_ID(106, "pcie_refclk_n"),
> +       CLK_MSR_ID(107, "pcie_refclk_p"),
> +       CLK_MSR_ID(108, "audio_locker_out"),
> +       CLK_MSR_ID(109, "audio_locker_in"),
> +};
> +
> +static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
> +       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
> +       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
> +       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> +       CLK_MSR_ID(3, "sys_cpu_ring_osc"),
> +       CLK_MSR_ID(4, "gp0_pll"),
> +       CLK_MSR_ID(6, "enci"),
> +       CLK_MSR_ID(7, "clk81"),
> +       CLK_MSR_ID(8, "encp"),
> +       CLK_MSR_ID(9, "encl"),
> +       CLK_MSR_ID(10, "vdac"),
> +       CLK_MSR_ID(11, "eth_tx"),
Amlogic's buildroot kernel
(buildroot_openlinux_kernel_4.9_fbdev_20180706) calls this
"mac_eth_tx_clk".
I leave it up to you whether you want to change it to "mac_eth_tx" or
not (it's only used for debugging purpose and I don't know what the
actual signal name in the G12A datasheet is)

> +       CLK_MSR_ID(12, "hifi_pll"),
> +       CLK_MSR_ID(13, "mod_tcon"),
> +       CLK_MSR_ID(14, "fec_0"),
> +       CLK_MSR_ID(15, "fec_1"),
> +       CLK_MSR_ID(16, "fec_2"),
> +       CLK_MSR_ID(17, "sys_pll_div16"),
> +       CLK_MSR_ID(18, "sys_cpu_div16"),
> +       CLK_MSR_ID(19, "lcd_an_ph2"),
> +       CLK_MSR_ID(20, "rtc_osc_out"),
> +       CLK_MSR_ID(21, "lcd_an_ph3"),
> +       CLK_MSR_ID(22, "eth_phy_ref"),
similar to the "eth_tx" clock above this is called
"mac_eth_phy_ref_clk" in the buildroot kernel which I'm using as
reference

> +       CLK_MSR_ID(23, "mpll_50m"),
> +       CLK_MSR_ID(24, "eth_125m"),
> +       CLK_MSR_ID(25, "eth_rmii"),
> +       CLK_MSR_ID(26, "sc_int"),
> +       CLK_MSR_ID(27, "in_mac"),
> +       CLK_MSR_ID(28, "sar_adc"),
Amlogic's buildroot_openlinux_kernel_4.9_fbdev_20180706 kernel also has:
29 = "pcie_clk_inp"
30 = "pcie_clk_inn"

> +       CLK_MSR_ID(31, "mpll_test_out"),
> +       CLK_MSR_ID(32, "vdec"),
> +       CLK_MSR_ID(33, "sys_cpu_ring_osc_1"),
> +       CLK_MSR_ID(34, "eth_mpll_50m"),
> +       CLK_MSR_ID(35, "mali"),
> +       CLK_MSR_ID(36, "hdmi_tx_pixel"),
> +       CLK_MSR_ID(37, "cdac"),
> +       CLK_MSR_ID(38, "vdin_meas"),
> +       CLK_MSR_ID(39, "bt656"),
> +       CLK_MSR_ID(41, "eth_rx_or_rmii"),
similar to the "eth_tx" clock above this is called
"mac_eth_rx_clk_rmii" in the buildroot kernel which I'm using as
reference

> +       CLK_MSR_ID(42, "mp0_out"),
> +       CLK_MSR_ID(43, "fclk_div5"),
> +       CLK_MSR_ID(44, "pwm_b"),
> +       CLK_MSR_ID(45, "pwm_a"),
> +       CLK_MSR_ID(46, "vpu"),
> +       CLK_MSR_ID(47, "ddr_dpll_pt"),
> +       CLK_MSR_ID(48, "mp1_out"),
> +       CLK_MSR_ID(49, "mp2_out"),
> +       CLK_MSR_ID(50, "mp3_out"),
> +       CLK_MSR_ID(51, "sd_emmc_c"),
> +       CLK_MSR_ID(52, "sd_emmc_b"),
> +       CLK_MSR_ID(53, "sd_emmc_a"),
> +       CLK_MSR_ID(54, "vpu_clkc"),
> +       CLK_MSR_ID(55, "vid_pll_div_out"),
> +       CLK_MSR_ID(56, "wave420l_a"),
> +       CLK_MSR_ID(57, "wave420l_c"),
> +       CLK_MSR_ID(58, "wave420l_b"),
> +       CLK_MSR_ID(59, "hcodec"),
> +       CLK_MSR_ID(61, "gpio_msr"),
> +       CLK_MSR_ID(62, "hevcb"),
> +       CLK_MSR_ID(63, "dsi_meas"),
> +       CLK_MSR_ID(64, "spicc_1"),
> +       CLK_MSR_ID(65, "spicc_0"),
> +       CLK_MSR_ID(66, "vid_lock"),
> +       CLK_MSR_ID(67, "dsi_phy"),
> +       CLK_MSR_ID(68, "hdcp22_skp"),
> +       CLK_MSR_ID(69, "hdcp22_esm"),
buildroot_openlinux_kernel_4.9_fbdev_20180706 has these 68 and 69
swapped, I'm not sure which one is right though:
69 = "cts_hdcp22_skpclk"
68 = "cts_hdcp22_esmclk"

> +       CLK_MSR_ID(70, "pwm_f"),
> +       CLK_MSR_ID(71, "pwm_e"),
> +       CLK_MSR_ID(72, "pwm_d"),
> +       CLK_MSR_ID(73, "pwm_c"),
> +       CLK_MSR_ID(75, "hevcf"),
> +       CLK_MSR_ID(77, "rng_ring_osc_0"),
> +       CLK_MSR_ID(78, "rng_ring_osc_1"),
> +       CLK_MSR_ID(79, "rng_ring_osc_2"),
> +       CLK_MSR_ID(80, "rng_ring_osc_3"),
> +       CLK_MSR_ID(81, "vapb"),
> +       CLK_MSR_ID(82, "ge2d"),
> +       CLK_MSR_ID(83, "co_rx"),
> +       CLK_MSR_ID(84, "co_tx"),
> +       CLK_MSR_ID(89, "hdmi_todig"),
> +       CLK_MSR_ID(90, "hdmitx_sys"),
> +       CLK_MSR_ID(94, "eth_phy_rx"),
> +       CLK_MSR_ID(95, "eth_phy_pll"),
this is called "eth_phy_plltxclk" in
buildroot_openlinux_kernel_4.9_fbdev_20180706 which I'm using as
refernece

> +       CLK_MSR_ID(96, "vpu_b"),
> +       CLK_MSR_ID(97, "cpu_b_tmp"),
> +       CLK_MSR_ID(98, "ts"),
> +       CLK_MSR_ID(99, "ring_osc_out_ee_3"),
> +       CLK_MSR_ID(100, "ring_osc_out_ee_4"),
> +       CLK_MSR_ID(101, "ring_osc_out_ee_5"),
> +       CLK_MSR_ID(102, "ring_osc_out_ee_6"),
> +       CLK_MSR_ID(103, "ring_osc_out_ee_7"),
> +       CLK_MSR_ID(104, "ring_osc_out_ee_8"),
> +       CLK_MSR_ID(105, "ring_osc_out_ee_9"),
> +       CLK_MSR_ID(106, "ephy_test"),
> +       CLK_MSR_ID(107, "au_dac_g128x"),
> +       CLK_MSR_ID(108, "audio_locker_out"),
> +       CLK_MSR_ID(109, "audio_locker_in"),
> +       CLK_MSR_ID(110, "audio_tdmout_c_sclk"),
> +       CLK_MSR_ID(111, "audio_tdmout_b_sclk"),
> +       CLK_MSR_ID(112, "audio_tdmout_a_sclk"),
> +       CLK_MSR_ID(113, "audio_tdmin_lb_sclk"),
> +       CLK_MSR_ID(114, "audio_tdmin_c_sclk"),
> +       CLK_MSR_ID(115, "audio_tdmin_b_sclk"),
> +       CLK_MSR_ID(116, "audio_tdmin_a_sclk"),
> +       CLK_MSR_ID(117, "audio_resample"),
> +       CLK_MSR_ID(118, "audio_pdm_sys"),
> +       CLK_MSR_ID(119, "audio_spdifout_b"),
> +       CLK_MSR_ID(120, "audio_spdifout"),
> +       CLK_MSR_ID(121, "audio_spdifin"),
the three clocks above use a "_mst_clk" suffix in
buildroot_openlinux_kernel_4.9_fbdev_20180706.
I'm not sure if that "_mst" suffix is relevant (might stand for "master")


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
