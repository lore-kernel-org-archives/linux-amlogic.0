Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE3BCF6497
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDN+DmQ2PgIWp2gi+j9B5LILP1Kv65Hcn2itDxu2KBU=; b=eqHD4YfK+N/U85
	u+PZyr6R5VZdJi3gxuUuieUXTvOBvzrvTf4CSqB6EHP4qjH0U93jPuSjmSDUxX7u9kqBPBAraNofe
	pQ5dMz/ppqYUU2AqStXAQf/3uBWFF9uYiGBsmwsnBcugnOJFVFUH4YJZCQwFvLDWXEj4zgtuD/c7U
	gyRIxrJx3tjme4rvmo59C+5JVqNXJRY8a89a4uYpJmM4UfBfqloE6Yng5vsCEH72Yi/rtLPOkyNXX
	9qNhwB4fWLTKymv9wVUbDUzWJO+hUd6+BPtcc4feFTiR3SjzESW6iRrPRrcL++GsaA43HG+6m+8Fi
	btfZPsQcYn0Xg2mzt7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDTM-0000000GgHv-3tmA;
	Mon, 30 Sep 2024 10:17:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svDS8-0000000GgAK-3JYD
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 10:16:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37ccfbbd467so2410851f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 03:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727691387; x=1728296187; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ept6PF3z6zGmfanJb7Xv6BjUTwCdrXXzgAXSokyXkdU=;
        b=vS9GN+A/rfRoNzBTX4OXAHbSgAK8iDb3N1MwnR+57TziHhF10v1QSlumoXv2n2CoMr
         ROyoTkU+jG5waWABLynkRz4ofVDy2BpWtc7yaQwIEUs1SWx3XrsPLlMOVal40O4zq/E6
         IZvWCYL7p5ZgZINiRSx2GhVdFUd0Et3fjM/WkQE+9LOdJSEELPaXczPRslzSoYk4LGVM
         mOMbLSQHo2fBrjw4NutrPESLrY2ZNHAGbUzj9b0sjxBl3erjLoLmBRqZ15JglAdukNDE
         GCS5d5LdsMF+WbC8g7BLx3lFHPKvq6jVRzrqRzhrLJgtwtxPutIdE/q/4sHWSl0DCeof
         11RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727691387; x=1728296187;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ept6PF3z6zGmfanJb7Xv6BjUTwCdrXXzgAXSokyXkdU=;
        b=L9R91uCpxqlAGLCUptAuslRSvIB49/bGsvDzaAggz4DTvBD7D1b7CztAIK6kBz65pq
         osnM0XWyyLaH459ye6ezOGXIJWNa+UaM9shJ7A5cd/lIJRmnVFzT9dNyNKw2/L3YSxS4
         Dwcb/788wmUhmpBs9fu6dY9KO7MVe5Ce6attDGtoPtC2qNk5xS986o2doArHts9N1jl1
         sCBNfZu6ubxpmyPkKguH1theitou/yd+w2uBp8ZXSQtec7Vgna0zJuXf0AI/2e8jADxB
         8cSih6qLUrBwGWGMOYBPNtnaFgElmwGd6ElEVdITHYY5HVhj74OFfeXy8NmE8RJMwVpa
         r5Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWdTPQe3wpFpWRM71tc6Gb60BmqAPwWG9gbAM/33pBRNM4d9WbV6ydAyA91m1skZyMeZOOg+BAGeP5jC8nS@lists.infradead.org
X-Gm-Message-State: AOJu0YyjoGTEx81hxn5Wkv9OCZehpPHQRPladYYuEuPX8CNGC18Q+eLR
	+IykumBbyK0Ti5j2wjrsCnIoeITyjTLuSJzKub9tcFqqd9THlS7ofFTLJDQEDuM=
X-Google-Smtp-Source: AGHT+IE9hAG6wDYLSDHEcerPNno3aHUL2cQSG0dDgw4C8t0z2/bGDDaSzeigceSgmlLPCKImmNAdcg==
X-Received: by 2002:adf:fec7:0:b0:37c:d11c:aa45 with SMTP id ffacd0b85a97d-37cd5b1ebcfmr5961790f8f.59.1727691386672;
        Mon, 30 Sep 2024 03:16:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e433sm8645836f8f.36.2024.09.30.03.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:16:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] clk: meson: add A5 clock peripherals controller driver
In-Reply-To: <4ce0c864-fd82-42f3-8122-7ff921b5cc8b@amlogic.com> (Xianwei
	Zhao's message of "Sun, 29 Sep 2024 16:44:03 +0800")
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
	<20240914-a5-clk-v1-5-5ee2c4f1b08c@amlogic.com>
	<1jjzf1xf55.fsf@starbuckisacylon.baylibre.com>
	<4ce0c864-fd82-42f3-8122-7ff921b5cc8b@amlogic.com>
Date: Mon, 30 Sep 2024 12:16:25 +0200
Message-ID: <1jldz9tpja.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_031628_890507_76CF9EBF 
X-CRM114-Status: GOOD (  38.43  )
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

On Sun 29 Sep 2024 at 16:44, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

[...]

>>> +static A4_SYS_GATE(sys_eth_mac,              CLKCTRL_SYS_CLK_EN0_REG0, 26, 0);
>>> +
>>> +/*
>>> + * FIXME: sys_gic provides the clock for GIC(Generic Interrupt Controller).
>>> + * After clock is disabled, The GIC cannot work properly. At present, the driver
>>> + * used by our GIC is the public driver in kernel, and there is no management
>>> + * clock in the driver.
>>> + */
>>> +static A4_SYS_GATE(sys_gic,          CLKCTRL_SYS_CLK_EN0_REG0, 27, CLK_IS_CRITICAL);
>> The GIC has a driver. If it needs clock, maybe it should request it and
>> enable it, maybe as optional.
>> 
>
> This has been explained in C3. GIC is a public driver that does not
> reference clock, so you suggest setting it as CRITICAL and adding the
> "FIXME" annotation.

Yes indeed ... and at some point, it is expected something will be done
a actually fix the situation ... not just pile-up FIXME comments.

Adding a clock to a driver that should have one seems doable.

>
>>> +static A4_SYS_GATE(sys_rama,         CLKCTRL_SYS_CLK_EN0_REG0, 28, 0);
>>> +
>>> +/*
>>> + * NOTE: sys_big_nic provides the clock to the control bus of the NIC(Network
>>> + * Interface Controller) between multiple devices(CPU, DDR, RAM, ROM, GIC,
>>> + * SPIFC, CAPU, JTAG, EMMC, SDIO, sec_top, USB, Audio, ETH, SPICC) in the
>>> + * system. After clock is disabled, The NIC cannot work.
>>> + */
>> This comment looks like a clock that should be passed as ressource to a
>> bus or power-domain to be properly manage. This is a pattern that keeps
>> on repeating. I will not block you on it this time around but I strong
>> suggest you fix up the situation on the related platform. Next time
>> around, the reason won't be a valid one.
>> 
>
> There are too many modules associated with this clock... The most important
> is the inclusion of some system-level modules that are not managed by the
> driver in the kernel and cannot close their clocks, perhaps it is not
> appropriate to describe it here.
>
> In the next version I moved it to scmi-clk for management?

No. The number of module associated with a clock should not be a
concern and SCMI should not be a 'Hide all the things I don't want to do
in linux things'.

You've got a bus that needs a clocks. There are possibilities associate
a clock with bus in DT, either directly or through power-domains. Please
do it correctly.

>
>>> +static A4_SYS_GATE(sys_big_nic,              CLKCTRL_SYS_CLK_EN0_REG0, 29, CLK_IS_CRITICAL);
>>> +static A4_SYS_GATE(sys_ramb,         CLKCTRL_SYS_CLK_EN0_REG0, 30, 0);
>>> +static A4_SYS_GATE(sys_audio_top,    CLKCTRL_SYS_CLK_EN0_REG1, 0, 0);
>>> +static A4_SYS_GATE(sys_audio_vad,    CLKCTRL_SYS_CLK_EN0_REG1, 1, 0);
>>> +static A4_SYS_GATE(sys_usb,          CLKCTRL_SYS_CLK_EN0_REG1, 2, 0);
>>> +static A4_SYS_GATE(sys_sd_emmc_a,    CLKCTRL_SYS_CLK_EN0_REG1, 3, 0);
>>> +static A4_SYS_GATE(sys_sd_emmc_c,    CLKCTRL_SYS_CLK_EN0_REG1, 4, 0);
>>> +static A4_SYS_GATE(sys_pwm_ab,               CLKCTRL_SYS_CLK_EN0_REG1, 5, 0);
>>> +static A4_SYS_GATE(sys_pwm_cd,               CLKCTRL_SYS_CLK_EN0_REG1, 6, 0);
>>> +static A4_SYS_GATE(sys_pwm_ef,               CLKCTRL_SYS_CLK_EN0_REG1, 7, 0);
>>> +static A4_SYS_GATE(sys_pwm_gh,               CLKCTRL_SYS_CLK_EN0_REG1, 8, 0);
>>> +static A4_SYS_GATE(sys_spicc_1,              CLKCTRL_SYS_CLK_EN0_REG1, 9, 0);
>>> +static A4_SYS_GATE(sys_spicc_0,              CLKCTRL_SYS_CLK_EN0_REG1, 10, 0);
>>> +static A4_SYS_GATE(sys_uart_a,               CLKCTRL_SYS_CLK_EN0_REG1, 11, 0);
>>> +static A4_SYS_GATE(sys_uart_b,               CLKCTRL_SYS_CLK_EN0_REG1, 12, 0);
>>> +static A4_SYS_GATE(sys_uart_c,               CLKCTRL_SYS_CLK_EN0_REG1, 13, 0);
>>> +static A4_SYS_GATE(sys_uart_d,               CLKCTRL_SYS_CLK_EN0_REG1, 14, 0);
>>> +static A4_SYS_GATE(sys_uart_e,               CLKCTRL_SYS_CLK_EN0_REG1, 15, 0);
>>> +static A4_SYS_GATE(sys_i2c_m_a,              CLKCTRL_SYS_CLK_EN0_REG1, 16, 0);
>>> +static A4_SYS_GATE(sys_i2c_m_b,              CLKCTRL_SYS_CLK_EN0_REG1, 17, 0);
>>> +static A4_SYS_GATE(sys_i2c_m_c,              CLKCTRL_SYS_CLK_EN0_REG1, 18, 0);
>>> +static A4_SYS_GATE(sys_i2c_m_d,              CLKCTRL_SYS_CLK_EN0_REG1, 19, 0);
>>> +static A4_SYS_GATE(sys_rtc,          CLKCTRL_SYS_CLK_EN0_REG1, 21, 0);
>>> +
>>> +#define A4_AXI_GATE(_name, _reg, _bit, _flags)                               \
>>> +     A4_CLK_GATE(_name, _reg, _bit, axiclk,                          \
>>> +                 &clk_regmap_gate_ops, _flags)
>>> +
>>> +static A4_AXI_GATE(axi_audio_vad,    CLKCTRL_AXI_CLK_EN0, 0, 0);
>>> +static A4_AXI_GATE(axi_audio_top,    CLKCTRL_AXI_CLK_EN0, 1, 0);
>>> +
>>> +/*
>>> + * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
>>> + * clock is disabled, The NIC cannot work.
>>> + */
>>> +static A4_AXI_GATE(axi_sys_nic,              CLKCTRL_AXI_CLK_EN0, 2, CLK_IS_CRITICAL);
>>> +static A4_AXI_GATE(axi_ramb,         CLKCTRL_AXI_CLK_EN0, 5, 0);
>>> +static A4_AXI_GATE(axi_rama,         CLKCTRL_AXI_CLK_EN0, 6, 0);
>>> +
>>> +/*
>>> + * NOTE: axi_cpu_dmc provides the clock to the AXI bus where the CPU accesses
>>> + * the DDR. After clock is disabled, The CPU will not have access to the DDR.
>>> + */
>>> +static A4_AXI_GATE(axi_cpu_dmc,              CLKCTRL_AXI_CLK_EN0, 7, CLK_IS_CRITICAL);
>>> +static A4_AXI_GATE(axi_nna,          CLKCTRL_AXI_CLK_EN0, 12, 0);
>>> +
>>> +/*
>>> + * NOTE: axi_dev1_dmc provides the clock for the peripherals(EMMC, SDIO,
>>> + * sec_top, USB, Audio) to access the AXI bus of the DDR.
>>> + */
>> Same.
>> 
>
> These normal peripheral drivers manage the clock without a problem.
>
>>> +static A4_AXI_GATE(axi_dev1_dmc,     CLKCTRL_AXI_CLK_EN0, 13, 0);
>>> +
>>> +/*
>>> + * NOTE: axi_dev0_dmc provides the clock for the peripherals(ETH and SPICC)
>>> + * to access the AXI bus of the DDR.
>>> + */
>>> +static A4_AXI_GATE(axi_dev0_dmc,     CLKCTRL_AXI_CLK_EN0, 14, 0);
>>> +static A4_AXI_GATE(axi_dsp_dmc,              CLKCTRL_AXI_CLK_EN0, 15, 0);
>>> +
>>> +static struct clk_regmap clk_12_24m_in = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_CLK12_24_CTRL,
>>> +             .bit_idx = 11,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "clk_12_24m_in",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_data = &(const struct clk_parent_data) {
>>> +                     .fw_name = "xtal_24m",
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap clk_12_24m = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_CLK12_24_CTRL,
>>> +             .shift = 10,
>>> +             .width = 1,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "clk_12_24m",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &clk_12_24m_in.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +
>>> +/* FIXME: set value 0 will div by 2 like value 1 */
>> Again, it is fine when it happens once, like the c3.
>> When the pattern starts repeating, it is time to do something about it.
>> 
>
> The corresponding suggestions have been made to the hardware designer, but
> now the designed chip cannot be repaired.

Not asking to fix the HW (although that would be nice if you could)
The HW is what it is. The SW needs fixing. That you can do.

>
>>> +static struct clk_regmap fclk_25m_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_CLK12_24_CTRL,
>>> +             .shift = 0,
>>> +             .width = 8,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "fclk_25m_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_data = &(const struct clk_parent_data) {
>>> +                     .fw_name = "fix",
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap fclk_25m = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_CLK12_24_CTRL,
>>> +             .bit_idx = 12,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "fclk_25m",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &fclk_25m_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +/*
>>> + * Channel 3(ddr_dpll_pt_clk) is manged by the DDR module; channel 12(cts_msr_clk)
>>> + * is manged by clock measures module. Their hardware are out of clock tree.
>> Yet, they exist and should be part of the bindings since they are
>> obviously input to this clock.
>> 
>
> Will add it to bindings, as optional input clock source.
>
>>> + * Channel 4 5 8 9 10 11 13 14 15 16 18 are not connected.
>>> + *
>>> + * gp1 is designed for DSU (DynamIQ Shared Unit) alone. It cannot be changed
>>> + * arbitrarily. gp1 is read-only in the kernel and is only open for debug purposes.
>>> + */
>>> +static u32 gen_parent_table[] = { 0, 1, 2, 6, 7, 17, 19, 20, 21, 22, 23, 24, 25,
>>> +                               26, 27, 28};
>>> +
>>> +static const struct clk_parent_data gen_parent_data[] = {
>>> +     { .fw_name = "oscin" },
>>> +     { .hw = &rtc_clk.hw },
>>> +     { .fw_name = "sysplldiv16" },
>>> +     { .fw_name = "gp1" },
>>> +     { .fw_name = "hifi" },
>>> +     { .fw_name = "cpudiv16" },
>>> +     { .fw_name = "fdiv2" },
>>> +     { .fw_name = "fdiv2p5" },
>>> +     { .fw_name = "fdiv3" },
>>> +     { .fw_name = "fdiv4" },
>>> +     { .fw_name = "fdiv5" },
>>> +     { .fw_name = "fdiv7" },
>>> +     { .fw_name = "mpll0" },
>>> +     { .fw_name = "mpll1" },
>>> +     { .fw_name = "mpll2" },
>>> +     { .fw_name = "mpll3" }
>>> +};

[...]

>>> +
>>> +static struct clk_regmap pwm_h_sel =
>>> +     AML_PWM_CLK_MUX(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25);
>>> +static struct clk_regmap pwm_h_div =
>>> +     AML_PWM_CLK_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16);
>>> +static struct clk_regmap pwm_h =
>>> +     AML_PWM_CLK_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
>>> +
>>> +/* Channel 7 is gp1. */
>> and ? if GP1 is RO, why can't you add it here ?
>> 
>
> gp1_pll is a special clock for DSU, it is integrated into dsu_clk, we
> don't want other modules to reference it.
>
> My understanding is that gp1_pll should not be provided to the peripheral
> clock tree, perhaps this is a redundant design.

Then /* Channel 7 is gp1 which is reserved for DSU */

Note that if GP1 is actually RO and DSU does not change the rate at
runtime through other means, then listing GP1 here should not be a
problem, spi would just be user of an available PLL.

>
>>> +static const struct clk_parent_data spicc_parent_data[] = {
>>> +     { .fw_name = "oscin" },
>>> +     { .fw_name = "sysclk" },
>>> +     { .fw_name = "fdiv4" },
>>> +     { .fw_name = "fdiv3" },
>>> +     { .fw_name = "fdiv2" },
>>> +     { .fw_name = "fdiv5" },
>>> +     { .fw_name = "fdiv7" }
>>> +};
>>> +
>>> +static struct clk_regmap spicc_0_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_SPICC_CLK_CTRL,
>>> +             .mask = 0x7,
>>> +             .shift = 7,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "spicc_0_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = spicc_parent_data,
>>> +             .num_parents = ARRAY_SIZE(spicc_parent_data),
>>> +     },
>>> +};

[...]

>>> +
>>> +static struct clk_regmap dspa_1 = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_DSPA_CLK_CTRL0,
>>> +             .bit_idx = 29,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "dspa_1",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &dspa_1_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>> A word about SET_RATE_GATE ?
>> 
>
> Look at the response to one of the questions below.

Still a word ? your comment below does justify this flag clearly.

>
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap dspa = {
>>> +     .data = &(struct clk_regmap_mux_data){
>>> +             .offset = CLKCTRL_DSPA_CLK_CTRL0,
>>> +             .mask = 0x1,
>>> +             .shift = 15,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "dspa",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &dspa_0.hw,
>>> +                     &dspa_1.hw
>>> +             },
>>> +             .num_parents = 2,
>>> +             /*
>>> +              * NOTE: This level of mux is "no glitch mux", and mux_0
>>> +              * (here dspa_0) is not only the clock source for mux, but also
>>> +              * provides a working clock for "no glitch mux". "no glitch mux"
>>> +              * can be switched only when mux_0 has a clock input. Therefore,
>>> +              * add flag CLK_OPS_PARENT_ENABLE to ensure that mux_0 has clock
>>> +              * when "no glitch mux" works.
>>> +              */
>>> +             .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>> Humm CLK_OPS_PARENT_ENABLE is not how we have handling glitch free mux
>> so far. What changed ?
>> 
>
> This is a hidden problem we have discovered in recent years, the previous
> chip use is ping-pong switching "no-glitch-mux/glitch free" have this
> problem. If mux_0 does not have a clock "no-glitch-mux", it will not be
> able to switch channels, and I will organize and submit patch to fix it
> later.

The NOTE comment and what the code does are not aligned.
* Your comment says that input #0 must be enabled for the mux to work
* The flag ensure that parent is enabled before switching to it. There
  is nothing specific about input #0

>
>>> +     },
>>> +};
>>> +
>>> +/* Channel 6 is gp1. */
>>> +static u32 nna_parent_table[] = { 0, 1, 2, 3, 4, 5, 7};
>>> +
>>> +static const struct clk_parent_data nna_parent_data[] = {
>>> +     { .fw_name = "oscin" },
>>> +     { .fw_name = "fdiv2p5" },
>>> +     { .fw_name = "fdiv4" },
>>> +     { .fw_name = "fdiv3" },
>>> +     { .fw_name = "fdiv5" },
>>> +     { .fw_name = "fdiv2" },
>>> +     { .fw_name = "hifi" }
>>> +};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
