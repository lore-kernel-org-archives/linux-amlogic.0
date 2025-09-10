Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFBCA0FED
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQMMvmlwWJvUgTAISV9q5GQT3hH2Xw/dYnup4V8Bweo=; b=jSf/jV1jdfmbnr
	am1CebIy95e/+ezuHq8HULvNd35qQ1gmx0lUELlNnJtbxRntM+HydeWmthCA5AniKQDU7PfwEjsMl
	nPCZdq1oWgaEZ4wivy2JZCHHUYoEavxPXD5P1C70Y91Sd+1oifHnt5qjbxKEwa71JK4sV9/sgy6+Z
	NpJlBwHrDZRIksEEZYFxjSTAsP/nXdnLl1mN3buq/3u1Wx+cD/57SQEzAr0bW+/13QYtm1XivpGaj
	Ir2j7twj85sa6cLD4rPJnx5E/mu6GrH01SnGQlqSNGPa2x/Qr1ZNp5f0LLcGIVKwkxxY7tcWC42ON
	TXDJsG0127sLEx4aR7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHL0-0000000DI6y-2rkZ;
	Wed, 10 Sep 2025 09:42:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHKw-0000000DI4S-3KM8
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 09:42:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso41169535e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Sep 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757497317; x=1758102117; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OBSNMCSZFkYoD+gDD6u3qKCw6C8XYzkirO4cLs6lbo=;
        b=kwRwr95f9aDj1PeLvevQK9aF/lzJofU1JWe3JvOpnnVd5guU9D342d0OrpBmk1w6zA
         60TzIAiWgNRiRJG/NaGJmrUtuDjXCrfVzA1XfAgBwZBwl6C/f2ldG4yiQLp+/jN3Braa
         BxKN54mNVe4CYa/02BtZHFB0eiATR0ZqHb/i2gGZ+YHVKMnzodsWwX3zLj3Qb3c0XpV3
         JRXoe+ipZi5ScZixGcE5NcP6qeMlfCTf+L9ZgwN1cDWCEhHiMVrIWFZHuKmJpgd0ETfr
         Anb515a25DiMuv+dGB+mPdR8xTw+gSVeJpoJX+QPHCVjthwM1gVXW+3KBbG5cFO0+c9N
         F2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497317; x=1758102117;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OBSNMCSZFkYoD+gDD6u3qKCw6C8XYzkirO4cLs6lbo=;
        b=bXulHrAv3GDhll+09lXV9aWErb9BsW1YGluqSYZBzrqj6gUt+W4/YvVAwdCN7vldw1
         QamEuDFlpnXHlLDgORTRUsMnkMqaS/R/kDloenpnf2u9ugCHGIkqD0G9c8tyPsdKgHWc
         NEF1kwnR5XjEfaTm0kVqfyZWhyAMWMFHBgWcitE6wTTik5+OfWDy2exo1bGeQbT8TSvx
         jQfIzAk7w4/hYcBuZ8w8NWbJhm+3h7QvH8mU/AjlnnVuiDU4Df2cI8/y5AEiQVoPy7eF
         BT9Zx96oVzsjv0iLQ+8ZHwMBtOtipXPN30iBCnAzwj/zcG07YX6GVDh0Y6Dj7qvT4odR
         Qf7g==
X-Forwarded-Encrypted: i=1; AJvYcCXbmqR8XQwVDuf055NplNGyHM0vGF/tNGoJvprrh/tdAKBy5OZVHhjRoglN/7/I9MGvieN7NprBL411EqPT@lists.infradead.org
X-Gm-Message-State: AOJu0YxapFqijBBupHrHekDeF7sw4XIuZEq9wzF4rqa4LQd/tg9ur9mh
	cGdudKQFR3SYbIYU7RCnOFMWwXqiqxyaHmxeDEdIrrN7SDYr1NHqYg3+uBhjGtXiM4Y=
X-Gm-Gg: ASbGncs26NwnjAIjJHpTtgdOARRQdnr7WFsRhAJVEaNOqLnMD6SKmjTM6gxK0IE5Cwa
	Jxx9DZZLKmPRXT3sRDayMSEx4IyviBNzirJPwRRtjImo025wwKBhFu0g4zYLSL5UX/3P+H5Nzs1
	3DIyjyDJb2/7URGcs7+bjTaXiFCCA41ygPgroZkjLQo5u1sT6JKjpHYyyXKOM2/IMjOTgrB7saH
	BIhTTbbr2+JEqJ6Fnqw85RoYxPjXvos4T++vKeEhXApBEYzV70VqMl6oAT0PN5Xcvj7yIFn9P20
	DvHh7SOSQo6RYzro0vo00ggsx8ou5ST2E1mynQZw4Ieoc9mFbApuv9mJDmQP9n8gtGI+hG1PJlL
	AmKEUbYNvdrYePhrlIm+4oyKa1x0r979n
X-Google-Smtp-Source: AGHT+IFhJUYuLbSMnUTSqjS1CD9WH9ciAuMmnQkgVDBas13o9m9uUxWF1IbevCk3GCBXb/HsRxReFw==
X-Received: by 2002:a05:6000:18a4:b0:3cc:8d94:1108 with SMTP id ffacd0b85a97d-3e641e3cffemr11252957f8f.22.1757497316478;
        Wed, 10 Sep 2025 02:41:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c75e:f70c:b449:e087])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521bf85esm6365253f8f.1.2025.09.10.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:41:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com> (Chuan Liu
	via's message of "Tue, 09 Sep 2025 15:29:12 +0800")
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
	<20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Sep 2025 11:41:55 +0200
Message-ID: <1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024158_869075_0A3FD9EA 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue 09 Sep 2025 at 15:29, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Add video encoder, demodulator and CVBS clocks.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 203 insertions(+)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 6d69b132d1e1..b855e8f1fc04 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -44,6 +44,7 @@
>  #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
>  #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
>  #define CLKCTRL_HDCP22_CTRL                        0x100
> +#define CLKCTRL_CDAC_CLK_CTRL                      0x108
>  #define CLKCTRL_VDEC_CLK_CTRL                      0x140
>  #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
>  #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
> @@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
>  	},
>  };
>  
> +static struct clk_regmap s4_cts_encl_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = CLKCTRL_VIID_CLK_DIV,
> +		.mask = 0xf,
> +		.shift = 12,
> +		.table = s4_cts_parents_val_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cts_encl_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = s4_cts_parents,
> +		.num_parents = ARRAY_SIZE(s4_cts_parents),
> +		.flags = CLK_SET_RATE_PARENT,

Do you really expect the rate of the parents to be adjusted when calling
set_rate() on this clock ?

It all trickle down to vclks which are shared with enci encp and vdac
clocks, so maybe not such a good idea, don't you think ?

> +	},
> +};
> +
>  static struct clk_regmap s4_cts_vdac_sel = {
>  	.data = &(struct clk_regmap_mux_data){
>  		.offset = CLKCTRL_VIID_CLK_DIV,
> @@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
>  	},
>  };
>  
> +static struct clk_regmap s4_cts_encl = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = CLKCTRL_VID_CLK_CTRL2,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cts_encl",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cts_encl_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static struct clk_regmap s4_cts_vdac = {
>  	.data = &(struct clk_regmap_gate_data){
>  		.offset = CLKCTRL_VID_CLK_CTRL2,
> @@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
>  	},
>  };
>  
> +/* CVBS DAC */
> +static struct clk_regmap s4_cdac_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.mask = 0x3,
> +		.shift = 16,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal", },
> +			{ .fw_name = "fclk_div5" },
> +		},
> +		.num_parents = 2,
> +	},
> +};
> +
> +static struct clk_regmap s4_cdac_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.shift = 0,
> +		.width = 16,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cdac_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_cdac = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_CDAC_CLK_CTRL,
> +		.bit_idx = 20,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cdac",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_cdac_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.mask = 0x3,
> +		.shift = 9,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal" },
> +			{ .fw_name = "fclk_div7" },
> +			{ .fw_name = "fclk_div4" }
> +		},
> +		.num_parents = 3,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_demod_core_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_demod_core = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.bit_idx = 8
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "demod_core",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_demod_core_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* CVBS ADC */
> +static struct clk_regmap s4_adc_extclk_in_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.mask = 0x7,
> +		.shift = 25,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal" },
> +			{ .fw_name = "fclk_div4" },
> +			{ .fw_name = "fclk_div3" },
> +			{ .fw_name = "fclk_div5" },
> +			{ .fw_name = "fclk_div7" },
> +			{ .fw_name = "mpll2" },
> +			{ .fw_name = "gp0_pll" },
> +			{ .fw_name = "hifi_pll" }
> +		},
> +		.num_parents = 8,
> +	},
> +};
> +
> +static struct clk_regmap s4_adc_extclk_in_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.shift = 16,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_adc_extclk_in_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_adc_extclk_in = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = CLKCTRL_DEMOD_CLK_CTRL,
> +		.bit_idx = 24
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "adc_extclk_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_adc_extclk_in_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
>  
>  #define S4_PCLK(_name, _reg, _bit, _flags) \
> @@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>  	[CLKID_HDCP22_SKPCLK_SEL]	= &s4_hdcp22_skpclk_sel.hw,
>  	[CLKID_HDCP22_SKPCLK_DIV]	= &s4_hdcp22_skpclk_div.hw,
>  	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk.hw,
> +	[CLKID_CTS_ENCL_SEL]		= &s4_cts_encl_sel.hw,
> +	[CLKID_CTS_ENCL]		= &s4_cts_encl.hw,
> +	[CLKID_CDAC_SEL]		= &s4_cdac_sel.hw,
> +	[CLKID_CDAC_DIV]		= &s4_cdac_div.hw,
> +	[CLKID_CDAC]			= &s4_cdac.hw,
> +	[CLKID_DEMOD_CORE_SEL]		= &s4_demod_core_sel.hw,
> +	[CLKID_DEMOD_CORE_DIV]		= &s4_demod_core_div.hw,
> +	[CLKID_DEMOD_CORE]		= &s4_demod_core.hw,
> +	[CLKID_ADC_EXTCLK_IN_SEL]	= &s4_adc_extclk_in_sel.hw,
> +	[CLKID_ADC_EXTCLK_IN_DIV]	= &s4_adc_extclk_in_div.hw,
> +	[CLKID_ADC_EXTCLK_IN]		= &s4_adc_extclk_in.hw,
>  };
>  
>  static const struct meson_clkc_data s4_peripherals_clkc_data = {

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
