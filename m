Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA351C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU/YYwYtO966TKmIy0RUIoTvc3MVcf8HhgVqENfBEtM=; b=HxNWCfqBt+xqSQbXYKRvRUulE1
	vET+amid3hS8Jb23Tj5J+B/ZG3ajxCKMOKjCAZQIpU8xXBvNKSqNhAw6xwkfPDceXBYj3GnBwQWX+
	GjoTsJKjoJOGaBBAhh9sWZEs6Ka01lusWjyz4yDvavZ2qi/uaVQcLbrV7/HByY3AohZGaLiTIAcBn
	U3IBtEQTvAM9dfcC5C09f6gikbz6Re4/I0Bs3By39FV2Xp5jd8mCK0o/xZ+mi/PSL6gcGryTsMHM/
	AZcjTC1SflHwx9oa0XtVCncZ9hpkEP0rCRD6uwgC00kn/bGoAv5S4EB514dD4twVFh0M4V4HfyuQK
	004vkSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEkz-00000001FRk-1gXJ;
	Fri, 29 Mar 2024 16:07:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEkv-00000001FQB-2iCv
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 16:07:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4154614b47eso9484985e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711728414; x=1712333214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=910sYo/xx/qV+ioXaoBH98NDqB9jTlEs+LCNU9Jr8Vg=;
        b=Q0b++54KLcvi2Ll07kWim1cYJtcw/tJ8fgWRQfY4brsjTpQqnyVUuQmLePfB4ymP+t
         oQUeq+/RtY9HXMYWQEhRdiVX1FFiWSSVbKb8s6Wcim7QKyvrKTMv+faJRiLCbFkjENHu
         s1TPpjpWFD3LrrMswhorasACKze7cBIudlUriCm2swf3+8tvZlgJG5RctQHNWE9xqhbn
         x0sl53TTMNFud9MWVA5Whl1EXMfLd7+DpSbxidUOmfjTI///t13/+q9NN0WMMuBc4rBm
         mpmPTC24HOrpTbxehXaJNV9SsXhRoh6RylgG/Qdo6iQ2/f9QTF/a6eKDCDVGcJ9D/2mq
         6Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711728414; x=1712333214;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=910sYo/xx/qV+ioXaoBH98NDqB9jTlEs+LCNU9Jr8Vg=;
        b=G6lYPT+MEaYPupH9jwqOY78DKo0iADmVd/WI2Bccb5ZY8zGMWjbVuVR9WzufDnNg9V
         QK2u0uEFINgPkpN4NVu1s1tiIv7Dj4Y4HvryoGk4i/SZqww8jLBm2PGboIRR1bxCkCrC
         uTTzkiLZZWXuq1ciKuijwIJYg4FwigMT9qodPkWhpAws11ZD2Ypo1gmFWPIdBF6CqFHy
         FsrUdomNmthkUa8lo9cwffYG6HU7PKmBkDdUBpR+h7ZoYz5Y7qQRBDc6dJA/20UM64gl
         LqzCdHTrwk5hzwikQMT8hxI7YWMsZuf2VeYZI5pu10JPvxTeWj65Ph6rnRvm1oOWNAvv
         X+zA==
X-Forwarded-Encrypted: i=1; AJvYcCV8I2YWNdz+UD1JxbQEYj3ZNeZpFxwKS983gsQ70rA1Bhj3z39RBoGX6EMVkzlPGEAKXpW0lUoq8jNE9+BZPBhnNjUeU2yahYddO83UvUnOQa0=
X-Gm-Message-State: AOJu0Yy5WQ8Dwsfy54EtFPXLvlxnGytsIp2lgmfkyoAvqt2htu8QqCVj
	dpN2Ti7G5xSZeeUsKj9QwpKI4AdIoHi8Dsa0V9zmhyLMir3zUz3Sr/p/5Pc12uw=
X-Google-Smtp-Source: AGHT+IEUGFncxOKRlhWzHn6/3rGUasXsB6aBZluKSo+5RB0TvYX13ogX/YivIl/dkflWpGfRX1SW6A==
X-Received: by 2002:a05:600c:314b:b0:414:5e9b:804b with SMTP id h11-20020a05600c314b00b004145e9b804bmr5106212wmo.10.1711728413972;
        Fri, 29 Mar 2024 09:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232? ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0041550a32112sm1917639wmq.42.2024.03.29.09.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 09:06:53 -0700 (PDT)
Message-ID: <15e637ee-e72d-494c-bc0e-fc30921e9285@linaro.org>
Date: Fri, 29 Mar 2024 17:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v11 3/7] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki
 <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
 <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-3-04f55de44604@linaro.org>
 <1jv8558b11.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <1jv8558b11.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_090701_842135_3B4A68EC 
X-CRM114-Status: GOOD (  26.10  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/03/2024 13:35, Jerome Brunet wrote:
> 
> On Mon 25 Mar 2024 at 12:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> In order to setup the DSI clock, let's make the unused VCLK2 clock path
>> configuration via CCF.
>>
>> The nocache option is removed from following clocks:
>> - vclk2_sel
>> - vclk2_input
>> - vclk2_div
>> - vclk2
>> - vclk_div1
>> - vclk2_div2_en
>> - vclk2_div4_en
>> - vclk2_div6_en
>> - vclk2_div12_en
>> - vclk2_div2
>> - vclk2_div4
>> - vclk2_div6
>> - vclk2_div12
>> - cts_encl_sel
>>
>> vclk2 and vclk2_div uses the newly introduced vclk regmap driver
>> to handle the enable and reset bits.
>>
>> In order to set a rate on cts_encl via the vclk2 clock path,
>> the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
>> to keep CCF from selection a parent.
>> The parents of cts_encl_sel & vclk2_sel are expected to be defined
>> in DT or manually set by the display driver at some point.
>>
>> The following clock scheme is to be used for DSI:
>>
>> xtal
>> \_ gp0_pll_dco
>>     \_ gp0_pll
>>        |- vclk2_sel
>>        |  \_ vclk2_input
>>        |     \_ vclk2_div
>>        |        \_ vclk2
>>        |           \_ vclk2_div1
>>        |              \_ cts_encl_sel
>>        |                 \_ cts_encl	-> to VPU LCD Encoder
>>        |- mipi_dsi_pxclk_sel
>>        \_ mipi_dsi_pxclk_div
>>           \_ mipi_dsi_pxclk		-> to DSI controller
>>
>> The mipi_dsi_pxclk_div is set as bypass with a single /1 entry in div_table
>> in order to use the same GP0 for mipi_dsi_pxclk and vclk2_input.
>>
>> The SET_RATE_PARENT is only set on the mipi_dsi_pxclk_sel clock so the
>> DSI bitclock is the reference base clock to calculate the vclk2_div value
>> when pixel clock is set on the cts_encl endpoint.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/Kconfig |  1 +
>>   drivers/clk/meson/g12a.c  | 72 ++++++++++++++++++++++++++++++++++-------------
>>   2 files changed, 53 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 8a9823789fa3..59a40a49f8e1 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -144,6 +144,7 @@ config COMMON_CLK_G12A
>>   	select COMMON_CLK_MESON_EE_CLKC
>>   	select COMMON_CLK_MESON_CPU_DYNDIV
>>   	select COMMON_CLK_MESON_VID_PLL_DIV
>> +	select COMMON_CLK_MESON_VCLK
>>   	select MFD_SYSCON
>>   	help
>>   	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 90f4c6103014..083882e53b65 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -22,6 +22,7 @@
>>   #include "clk-regmap.h"
>>   #include "clk-cpu-dyndiv.h"
>>   #include "vid-pll-div.h"
>> +#include "vclk.h"
>>   #include "meson-eeclk.h"
>>   #include "g12a.h"
>>   
>> @@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_vclk_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_NO_REPARENT,
>>   	},
>>   };
>>   
>> @@ -3193,7 +3194,6 @@ static struct clk_regmap g12a_vclk2_input = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>   	},
>>   };
>>   
>> @@ -3215,19 +3215,32 @@ static struct clk_regmap g12a_vclk_div = {
>>   };
>>   
>>   static struct clk_regmap g12a_vclk2_div = {
>> -	.data = &(struct clk_regmap_div_data){
>> -		.offset = HHI_VIID_CLK_DIV,
>> -		.shift = 0,
>> -		.width = 8,
>> +	.data = &(struct meson_vclk_div_data){
>> +		.div = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 0,
>> +			.width   = 8,
>> +		},
>> +		.enable = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 16,
>> +			.width   = 1,
>> +		},
>> +		.reset = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 17,
>> +			.width   = 1,
>> +		},
>> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
>>   	},
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "vclk2_div",
>> -		.ops = &clk_regmap_divider_ops,
>> +		.ops = &meson_vclk_div_ops,
>>   		.parent_hws = (const struct clk_hw *[]) {
>>   			&g12a_vclk2_input.hw
>>   		},
>>   		.num_parents = 1,
>> -		.flags = CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_GATE,
>>   	},
>>   };
>>   
>> @@ -3246,16 +3259,24 @@ static struct clk_regmap g12a_vclk = {
>>   };
>>   
>>   static struct clk_regmap g12a_vclk2 = {
>> -	.data = &(struct clk_regmap_gate_data){
>> -		.offset = HHI_VIID_CLK_CNTL,
>> -		.bit_idx = 19,
>> +	.data = &(struct meson_vclk_gate_data){
>> +		.enable = {
>> +			.reg_off = HHI_VIID_CLK_CNTL,
>> +			.shift   = 19,
>> +			.width   = 1,
>> +		},
>> +		.reset = {
>> +			.reg_off = HHI_VIID_CLK_CNTL,
>> +			.shift   = 15,
>> +			.width   = 1,
>> +		},
>>   	},
>>   	.hw.init = &(struct clk_init_data) {
>>   		.name = "vclk2",
>> -		.ops = &clk_regmap_gate_ops,
>> +		.ops = &meson_vclk_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3339,7 +3360,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3353,7 +3374,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3367,7 +3388,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3381,7 +3402,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3395,7 +3416,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3461,6 +3482,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
>>   			&g12a_vclk2_div2_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3474,6 +3496,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
>>   			&g12a_vclk2_div4_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3487,6 +3510,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
>>   			&g12a_vclk2_div6_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3500,6 +3524,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
>>   			&g12a_vclk2_div12_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3561,7 +3586,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_cts_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>>   	},
>>   };
>>   
>> @@ -3717,15 +3742,22 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT,
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> +/* Force as bypass by forcing a single /1 table entry, and not rely of boot value */
> 
> The comment here is not entirely accurate.
> 
> The table below will actually force to only use a 1 divider on
> .set_rate(), not on boot, AFAICT.
> 
> The boot value will stay in the register until the first call to set_rate().
> 
> Considering this is quite fragile as it is, It would be nice to prefix
> the updated comment with "FIXME"

Ack

> 
>> +static const struct clk_div_table g12a_mipi_dsi_pxclk_div_table[] = {
>> +	{ .val = 0, .div = 1 },
>> +	{ /* sentinel */ },
>> +};
>> +
>>   static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
>>   	.data = &(struct clk_regmap_div_data){
>>   		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
>>   		.shift = 0,
>>   		.width = 7,
>> +		.table = g12a_mipi_dsi_pxclk_div_table,
>>   	},
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "mipi_dsi_pxclk_div",
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
