Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE882C48292
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpOWE74zShuPhfoAdTNHBRAs1fllK8rHB1JMR+k0ifE=; b=EqQRLu3hyTCJHUhtsEyRRY/yZK
	8dMmbm/T37yOxh2LeLa2zbxz3XSaHvqdb7vuiNXgqhssjBrIVYJIXHMYQ3qEQd5XFL9uuNcT3oNbN
	VUVkHFADrKQNo1rNUwEHDUeX9D+/Bi7RKBwnrYj/vKKZSUkr2eBNIhAWqBnC2kr/5gl22F4nMQ2tt
	KPmXJpGfvugxWCk1UqjEUemr0JfzYg23X8mZURYaP2DX3S5hHQ3AYqxz48wSpNX90XnJUXJNaMpeB
	bk/wXseKuPRbq4G7Suwo/DpLf2WtktmFanO2DQHeOELWf6q3nvuLKYDDsdLUSFHprfohNAGDcdtzz
	zFWRVeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2kV-0000000493D-2hWX;
	Mon, 05 Feb 2024 17:27:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2kQ-0000000491C-2PbE
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:27:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40fb63c40c0so41725105e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707154028; x=1707758828; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMru6AidNjxHu9ibv3haOjJruYNOLtUg/L29w6bwKNE=;
        b=ZWy2PQIg+hzRF4QrWlnHzrxGHl96MH92m6psBX5iHFYpMl3Rluq5IDOdYVYZj12PVU
         t6hT/4exCqKMojFi2PAztmkspmJVxJB66+K6vBhh8FGhSZPajcReMOz//2OosOlVvyGg
         FjVptDN6bFhlCNpCYD2pqhErkWVAmXuf90698CY9HRhD3DpW8M5Mutyeeo6/sie3HGMh
         /8xUGQByG0zTqeqh4fpqLVQe3IVHIzceMtFu15vMx2wGdUweKdqgkn4lhDrvw1+3MiuE
         ixUFYviiD4PYAEeF6FszTx1MVfjko7cmY7hnDPw1DQv9XvcLBoaISgLhQ3C3XvxC04F6
         bbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154028; x=1707758828;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fMru6AidNjxHu9ibv3haOjJruYNOLtUg/L29w6bwKNE=;
        b=Y/gL9OSci7v1HU+f04WrdTh+fvxb2G6w1ipGGVw9+zYFLQMjhTrBGx6a9B2FqvB7Xo
         WJsUrnSSj4KzyxX69zkZtODV6tEW9s1jRoY9YDFMqotwNz33pRtzPBmVWgRmxjo4RmCA
         p6iiDGkDddAHLFdEpkqaxFvz22E9r1wxSB9047pn1jQRKy2Oy2/2OU61jurIx5qDHxdc
         k070/14Npxp7JCSqtpJ6DVpLO6zep2ZlC6uRvoqqu3J0AUY9Av/9+LJsGFFnCOnniWxM
         ftqvQ3QSp/HJQDzzYyzYgdf8TTtb7qLsMBsda06/tUmJgnGzIVsjJPIUqv/arRZqYGfi
         HDkQ==
X-Gm-Message-State: AOJu0Yzk4p0dF88DAlHOW08UhW2zz5VDt3r/bAmj9Wtycl6Loj/X5c7W
	G51eW8lqm21bQCfti8cylV8kFnS0I8B/4SKioILgHoT24n1ReZHIbMSCmhGIdWs=
X-Google-Smtp-Source: AGHT+IGqsklbXdcarnxN/oePIcw2eHMQaP5PO315W+UnHaCzfnREsw03nS1Y5e21/Q6K0XmDyFQsww==
X-Received: by 2002:a05:600c:43c9:b0:40f:de25:f9b4 with SMTP id f9-20020a05600c43c900b0040fde25f9b4mr334103wmn.26.1707154027677;
        Mon, 05 Feb 2024 09:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXoBk7xaDOAj/sPyYLWj9t+ELr5A3fttpi5QII/7M/c70qSFluxBCnl41i/l9ANS9wjBXyuHhV32eaF2hWhKptfmf3E7+Jm+xybKwXaeDJFqgRcyk8wJriY/bhnlQ8l3zzEQtzRydK6yoVjxRfl2OeFywHwFfL7DraNJQCExU6HbUJeRuZJj4JuER1+IOAV1/XDAV159usi1ehzHCWTErAeLEFPiLVmyRR2mtIOM24SD4jP2uBWFFQ2dNmyWNIrfw9XbdhSM2cx17FzIiGWlDYbURdDOs4iz5y2OnhSTelu570uDKhrlHGV6u5dNXljurmfjWaIM2Ohp797TfbZnqk9RNIWOD84Oa0D84SqAhDMXCC5pFAE8qzQjnujteB4ft+y3C39IUedBX8MbgOTmHhVnVGl6r9k4YGaspN94Rz4unPBzeaEUpYwUNeQwIXyZ4jdUd4XXQii3EFwxX0GEqSaK0HvmsN4sImIMv3DT+vjGTYVugJ1Z3WN9Dt96twXPAmDULePAAWSgubqIQOlFf7ZBqLmMUZ6Zis1CxXhWXgHxtCxWfpUi4BCG8GlW49epyUshNxRL6sdhkhv10x4y34f+Xn+29aiVPK2bBIGm8gnaA5sjK5WeaMUsfvG7dW/ovBjHTEYNblXIQbW6d6GIpTHZKz3fEoQFqvvJiOFT2PPfS0rB34VhtvcLYykSo/su4pUzAteF11xYKwm4F64vIODrxNAKQnW8LW+57WFTGEHC6dBzD8mRDcvVdmive9m3PrCsRzSpeGXdEhE0BVA34B22cIgz2Re21TjfK97wfUPGloHw+6TUhyntYehWP4m/vejsoLUIYH4NLCbLoLCISNDLGACDb8hoS9ymwZY5WM=
Received: from ?IPV6:2a01:e0a:982:cbb0:bbd9:ac3e:db1d:9662? ([2a01:e0a:982:cbb0:bbd9:ac3e:db1d:9662])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c4f5000b0040e3635ca65sm9310508wmq.2.2024.02.05.09.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 09:27:06 -0800 (PST)
Message-ID: <9d7b3a35-6d21-4b7a-8669-cf3610467cad@linaro.org>
Date: Mon, 5 Feb 2024 18:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 07/12] clk: meson: add vclk driver
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Remi Pommarel
 <repk@triplefau.lt>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
 <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
 <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
 <1jfs0rywqi.fsf@starbuckisacylon.baylibre.com>
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
Organization: Linaro Developer Services
In-Reply-To: <1jfs0rywqi.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092710_858318_D3184BA2 
X-CRM114-Status: GOOD (  19.24  )
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

On 27/11/2023 17:24, Jerome Brunet wrote:
> 
> On Mon 27 Nov 2023 at 17:14, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 24/11/2023 15:41, Jerome Brunet wrote:
>>> On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org>
>>> wrote:
>>>
>>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>>
>>>> The VCLK has a "SOFT RESET" bit to toggle after the whole
>>>> VCLK sub-tree rate has been set, this is implemented in
>>>> the gate enable callback.
>>>>
>>>> The VCLK_DIV clocks as enable and reset bits used to disable
>>>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>>>> the rate is set while the divider is disabled and in reset mode.
>>>>
>>>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>>>> of the divider logic and vendor does this exact sequence to ensure
>>>> the divider is correctly set.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/clk/meson/Kconfig  |   5 ++
>>>>    drivers/clk/meson/Makefile |   1 +
>>>>    drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>>    4 files changed, 198 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index 29ffd14d267b..59a40a49f8e1 100644
>>>> --- a/drivers/clk/meson/Kconfig
>>>> +++ b/drivers/clk/meson/Kconfig
>>>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>>>    	tristate
>>>>    	select COMMON_CLK_MESON_REGMAP
>>>>    +config COMMON_CLK_MESON_VCLK
>>>> +	tristate
>>>> +	select COMMON_CLK_MESON_REGMAP
>>>> +
>>>>    config COMMON_CLK_MESON_CLKC_UTILS
>>>>    	tristate
>>>>    @@ -140,6 +144,7 @@ config COMMON_CLK_G12A
>>>>    	select COMMON_CLK_MESON_EE_CLKC
>>>>    	select COMMON_CLK_MESON_CPU_DYNDIV
>>>>    	select COMMON_CLK_MESON_VID_PLL_DIV
>>>> +	select COMMON_CLK_MESON_VCLK
>>> This particular line belong in the next patch
>>>
>>>>    	select MFD_SYSCON
>>>>    	help
>>>>    	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>>> index 9ee4b954c896..9ba43fe7a07a 100644
>>>> --- a/drivers/clk/meson/Makefile
>>>> +++ b/drivers/clk/meson/Makefile
>>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>>>    obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>>>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>>>      # Amlogic Clock controllers
>>>>    diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>>>> new file mode 100644
>>>> index 000000000000..47f08a52b49f
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.c
>>>> @@ -0,0 +1,141 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include "vclk.h"
>>>> +
>>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>>> +
>>>> +static inline struct clk_regmap_vclk_data *
>>>> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct clk_regmap_vclk_data *)clk->data;
>>>> +}
>>>> +
>>>> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>>> +
>>>> +	/* Do a reset pulse */
>>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +}
>>>> +
>>>> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops clk_regmap_vclk_ops = {
>>>> +	.enable = clk_regmap_vclk_enable,
>>>> +	.disable = clk_regmap_vclk_disable,
>>>> +	.is_enabled = clk_regmap_vclk_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
>>> s/clk_regmap_vclk/meson_vclk at least for what is exported, ideally most
>>> all the code.
>>> I get clk_regmap_ comes from code copied from clk_regmap.c.
>>> The reason the this part is different (and not using parm) if that when
>>> I converted amlogic to regmap, I hope we could make this generic,
>>> possibly converging between aml and qcom (which was the only other
>>> platform using regmap for clock at the time). This is why clk_regmap.c
>>> is a bit different from the other driver.
>>> For the aml specific drivers, best to look at the mpll or cpu-dyndiv one.
>>>
>>>> +
>>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>>> +
>>>> +static inline struct clk_regmap_vclk_div_data *
>>>> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct clk_regmap_vclk_div_data *)clk->data;
>>>> +}
>>>> +
>>>> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
>>>> +						     unsigned long prate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +
>>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>>> +}
>>>> +
>>>> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
>>>> +					      struct clk_rate_request *req)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +
>>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>>> +				      vclk->flags);
>>>> +}
>>>> +
>>>> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +					unsigned long parent_rate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +	int ret;
>>>> +
>>>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>>>> +			      vclk->flags);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->div, ret);
>>>> +
>>>> +	return 0;
>>>> +};
>>>> +
>>>> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +
>>>> +	/* Unreset the divider when ungating */
>>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +
>>>> +	/* Reset the divider when gating */
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>>> +}
>>>> +
>>>> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops clk_regmap_vclk_div_ops = {
>>>> +	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
>>>> +	.determine_rate = clk_regmap_vclk_div_determine_rate,
>>>> +	.set_rate = clk_regmap_vclk_div_set_rate,
>>>> +	.enable = clk_regmap_vclk_div_enable,
>>>> +	.disable = clk_regmap_vclk_div_disable,
>>>> +	.is_enabled = clk_regmap_vclk_div_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>>> +MODULE_LICENSE("GPL v2");
>>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>>> new file mode 100644
>>>> index 000000000000..4f25d7ad2717
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.h
>>
>> Is vclk.c/h ok ? clk-vclk doesn't look pretty, but I can switch to it to
>> keep files organized.
> 
> I don't have a strong opinion about it.
> I would have suggested vclk-div.c/h - like sclk ... but you do have gate
> ops in there, so ... :/
> 
> This made me realize that one does not really go without the other.
> It is more a coherent block, isn't it ?
> Would it make more sense to have these 2 merged in a single clk_ops ?

No those a 2 separate blocks, one is for VCLK clock input and the other is for the DIV
block, and the reset isn't used in the same way so I can't merge them.

> 
> It's bit late to point this out, sorry about that.
> 
> I let you decide whether to merge the ops or not and which name to pick.
> 
> If you keep them separated, meson_vclk_gate_ops instead of just
> meson_vclk_ops, to make things clear.

Ack

> 
>>
>> Neil
>>
>>>> @@ -0,0 +1,51 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#ifndef __VCLK_H
>>>> +#define __VCLK_H
>>> This is too generic.
>>> Please add the MESON prefix like the other clock driver please.
>>>
>>>> +
>>>> +#include "clk-regmap.h"
>>>> +#include "parm.h"
>>>> +
>>>> +/**
>>>> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
>>>> + *
>>>> + * @enable:	vclk enable field
>>>> + * @reset:	vclk reset field
>>>> + * @flags:	hardware-specific flags
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct clk_regmap_vclk_data {
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops clk_regmap_vclk_ops;
>>>> +
>>>> +/**
>>>> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
>>>> + *
>>>> + * @div:	divider field
>>>> + * @enable:	vclk divider enable field
>>>> + * @reset:	vclk divider reset field
>>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct clk_regmap_vclk_div_data {
>>>> +	struct parm div;
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	const struct clk_div_table *table;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops clk_regmap_vclk_div_ops;
>>>> +
>>>> +#endif /* __VCLK_H */
>>>
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
