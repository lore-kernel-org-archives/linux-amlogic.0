Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7972C5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7063B21BF6
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDfrBuO6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PfODrLPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7063B21BF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFoABSK/S/x+Q4Byut9Z8JvCrAbOIkNYnLIsA2RoSbk=; b=VDfrBuO6tiTka9
	T7oJEf97FuHOO7aEJ5VJUTo12ginvTZT6aTVBomZ37ptvWoWoBy+B99sB9e5+TFRqth7RGFyecLwg
	WoaWwDVfCqi9+WPcsuFdafm4spkGty61eb1of+17Rk+sxisSLzLRoz7BtT9b4sjOfSeJYQK9hBr4A
	kDc+SE9LpR/y71hokHmT95aiUvlnNKg9ytyup1n5nb1OXGXaOs9iNtiJ4eJP3pqR0Z9swYTeupQa4
	4+bcOxgHzstgXTNA4hGXISbuGeTCxa3j3nG1NV/8ZbzYYhzpVpHHmygl2y4b3M0B8fdTFZhT03Klu
	F+jQ47bUiPbQ+u974HVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiSYz-0006lj-9q; Tue, 02 Jul 2019 23:51:53 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiSYv-0006lG-VJ; Tue, 02 Jul 2019 23:51:51 +0000
Received: by mail-ot1-x341.google.com with SMTP id o101so371015ota.8;
 Tue, 02 Jul 2019 16:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8CM/kRSfMkCLm6zorYMm+jmWg0Fr4K0UKURUwHLiI0=;
 b=PfODrLPtL/UekUDd5MyivTx7mO9uIfNsXn1/AL0i36O2i27oA1cIPzJin/uG0IzLpt
 S5Xx4hNZq+KvGLbjNVEp6xTRbGAEhi4yUzsW8Ess3o3NKkAOE95F2vOSdyhlEcznDyvv
 xWIqWX+5HZ4QLRhxnRt7fzGhBZa4c+Ajk0dju9VV38wAzvIA9M8anMy41hE5CJCzvwBg
 c5+JnLVr/aQTZoX0A+1JjZ4QhYcpUFm1qVW/f/D+wGe/TmQIsuVjaKeb/c3hSHeL4/rQ
 ufoupQW/yrA97DAebmIYhmreBqQP+BMggZbsvGxPifIVEyoan8dMPhjTceDK9vkatgAb
 W4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8CM/kRSfMkCLm6zorYMm+jmWg0Fr4K0UKURUwHLiI0=;
 b=UwEcOTzCha8WEz7IelkAzT7TuRVVbouN3hRdJCAFqAD/HK+KecHsns8ROGAHpKg43Z
 /qDQOFGURloEBoHOuSG8mx/zhyfPacLKTYvJaSOEZMWLVPk7ZTyitNyElevHYZMYFYJo
 TrAjwCDJGLFfZnTpYd6XwfLu4pVnQVCDmZnvQ8TCxEd2SvLErdQeDgd4JNnP+FuOQV2U
 S8UYkdcfPj9cVbu7uVf+N77miyc5CGHoZKDd895S7AHf7qxIauKzhj6sPx06A6sWwVc6
 C60eCdLB3/VoRu2nwMAykhfrZdUkhbRyQc0m5FhWKtDV6zDAdUvkVMyUmVOVLV/zJkTw
 4UaQ==
X-Gm-Message-State: APjAAAXL/hi8ymltNh44vseMhD8Y23v+KFU5+/lnBuETzL3AvaRC+1OQ
 tn/oOKrqFkA8z2IpLHgYJfp7RWRryZH4XdMwrYECIA==
X-Google-Smtp-Source: APXvYqxPGdi5M83frYcEZkzIV4wjd1HSnqegfLcqSwdA8d9Vo+sKThli7P7OnkwgIwXWNWYlTAlgfzSDd8+mXHOWQbM=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr27461252otb.81.1562111509160; 
 Tue, 02 Jul 2019 16:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-7-narmstrong@baylibre.com>
In-Reply-To: <20190701104705.18271-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:51:38 +0200
Message-ID: <CAFBinCD8aBVo-WTaKTe7JyxqFyd=cVXDzHpwED4dx=rUtE3Uig@mail.gmail.com>
Subject: Re: [RFC 06/11] soc: amlogic: clk-measure: Add support for SM1
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_165150_032877_5D23C732 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jul 1, 2019 at 12:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the clk-measurer clocks IDs for the Amlogic SM1 SoC family.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 134 ++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index f09b404b39d3..e32e97613000 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -357,6 +357,136 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>         CLK_MSR_ID(122, "audio_pdm_dclk"),
>  };
>
> +static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
> +       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
> +       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
> +       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> +       CLK_MSR_ID(3, "ring_osc_out_ee_3"),
> +       CLK_MSR_ID(4, "gp0_pll"),
> +       CLK_MSR_ID(5, "gp1_pll"),
> +       CLK_MSR_ID(6, "enci"),
> +       CLK_MSR_ID(7, "clk81"),
> +       CLK_MSR_ID(8, "encp"),
> +       CLK_MSR_ID(9, "encl"),
> +       CLK_MSR_ID(10, "vdac"),
> +       CLK_MSR_ID(11, "eth_tx"),
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
> +       CLK_MSR_ID(23, "mpll_50m"),
> +       CLK_MSR_ID(24, "eth_125m"),
> +       CLK_MSR_ID(25, "eth_rmii"),
> +       CLK_MSR_ID(26, "sc_int"),
> +       CLK_MSR_ID(27, "in_mac"),
> +       CLK_MSR_ID(28, "sar_adc"),
> +       CLK_MSR_ID(29, "pcie_inp"),
> +       CLK_MSR_ID(30, "pcie_inn"),
> +       CLK_MSR_ID(31, "mpll_test_out"),
> +       CLK_MSR_ID(32, "vdec"),
> +       CLK_MSR_ID(34, "eth_mpll_50m"),
> +       CLK_MSR_ID(35, "mali"),
> +       CLK_MSR_ID(36, "hdmi_tx_pixel"),
> +       CLK_MSR_ID(37, "cdac"),
> +       CLK_MSR_ID(38, "vdin_meas"),
> +       CLK_MSR_ID(39, "bt656"),
> +       CLK_MSR_ID(40, "arm_ring_osc_out_4"),
> +       CLK_MSR_ID(41, "eth_rx_or_rmii"),
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
> +       CLK_MSR_ID(40, "arm_ring_osc_out_5"),
is this index 40 or 60?

> +       CLK_MSR_ID(61, "gpio_msr"),
> +       CLK_MSR_ID(62, "hevcb"),
> +       CLK_MSR_ID(63, "dsi_meas"),
> +       CLK_MSR_ID(64, "spicc_1"),
> +       CLK_MSR_ID(65, "spicc_0"),
> +       CLK_MSR_ID(66, "vid_lock"),
> +       CLK_MSR_ID(67, "dsi_phy"),
> +       CLK_MSR_ID(68, "hdcp22_esm"),
> +       CLK_MSR_ID(69, "hdcp22_skp"),
> +       CLK_MSR_ID(70, "pwm_f"),
> +       CLK_MSR_ID(71, "pwm_e"),
> +       CLK_MSR_ID(72, "pwm_d"),
> +       CLK_MSR_ID(73, "pwm_c"),
> +       CLK_MSR_ID(74, "arm_ring_osc_out_6"),
> +       CLK_MSR_ID(75, "hevcf"),
> +       CLK_MSR_ID(74, "arm_ring_osc_out_7"),
is this index 74 or 76?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
