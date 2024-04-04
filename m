Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B0ACD1297
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5f37s6XxqQMw/NjHq2reQJthy3CNaPI4QkSkRdzSVzw=; b=bEXJqOK4XMcKcLzNQbaq+drj0v
	Us1/1jbyEljx8t5Pp0Kfhw1eBqFH9Bk4NwZ9yg8rfp3u/NqjwbSHUZG2BWIzY1ozvGQqQQTlGx93y
	Nn/veA9ZNGYqQigS/px3absjqJD94lHl6PYe+9MoCdbV8KW7Kd7Z7No6HkUYQew3+1YTRBxW0XG88
	+LcMlsu/7F2U7uaexBHiXYb7tXQImaXa2tT84w4ZlT3xBGyUVoSRWRAwRArnLqrfjMTKB26AYyG2o
	nAsOEUfnvdgHam4f5o+PUYelswYOoehn4szni4ZeDlNnP9RCbHSJHOrIIeZl2SPUVjiBWYDv5Fmmf
	QGQ+0gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsQRW-00000003Zss-2srd;
	Thu, 04 Apr 2024 17:00:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsQRS-00000003ZpW-0Pgd
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 16:59:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-343b4601415so534194f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2024 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712249993; x=1712854793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Sy/O7JrPcSJpu77aPp9TPQX84YpKNhe7+xiQxZncY=;
        b=I82u8TbjacPcKSBO3YqgQX5L1WqvsWt4MTtBeMYNgCBaWlc4e476s1LXnj2y0w7rmq
         CogCa1UiOL4hdgyUdld7l1NGwFOXl+xFWkab8jA6DJqAju3r8zzAjvslt9yvSSOYZ5F7
         7AbAy2dEgrfzvt5K1/GfeabhVuWEsDPXDxeptDhSdKa8bQCurL1k4y2jhBgHNYuh06v5
         OvClQH8UztNdpZ8KK95IZQQmaCUy+pMcs1N64JJYFj2ZZHElZurMjMp128dXb6RZzUS4
         DBj0iMSNOeTfxgGWBIFIn8om6R6aDgOp9WIPGmr/WUEIBopn+avSh4nwkw66KcmwSJ88
         /AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712249993; x=1712854793;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l3Sy/O7JrPcSJpu77aPp9TPQX84YpKNhe7+xiQxZncY=;
        b=EH0sqUv8vPznDRUDPU0pRUDYSimkYSnsrgQxeEWlHiLAj6ZXGAMbfn8X6EhfbggYlt
         /GlxPIcxhWkRYS35WQCVKW1Q6LHv23T4Nfc4HUKAEKWdgON86FzDYt/Y97o7qR8ninDi
         KnTzlqPj6W9kfw9xQN0lyMMCze4fEGsg1j3aNbsoFKEltODH6iKoehcnMtLZIJkZuKDg
         Ici6KkxU/I45TP/r7YnOqzsL3n3xohERVMr3eXL9hWqqTh5/W977okKZUUgT6YjtVYnU
         tL5am8sm4LhTc2V0ZfE5xtzkjAbx6k9xZ2Lt4POa11mARa0F+7+uYXQMmGT2EVqu1I3K
         Sa1w==
X-Forwarded-Encrypted: i=1; AJvYcCV22INz0U5vgo9hwHQsn2HMU4nNCDvZs0hJeWqtbVaM6i5KdoErCTk8YL2tWrBTYL59y4+e5mjwYJ9vup+5rV2sdOAP40yhNvEJelcsrxLxqRQ=
X-Gm-Message-State: AOJu0Yx+onohVROgKBKWi0q4BSjslSp88sjRrLk0EfXaNqRf522R2nAe
	BkHRAPR5RGsKuH9V7TrUtKD1MJqrkQ3JT85+emIjVqBCMBzj32OpcoGxJkDx7bg=
X-Google-Smtp-Source: AGHT+IFjXaNrqfypx/RIQ+/6bcfFkAfBL80K/QjtfVHCoqExHR3ODQL4yTaaXd1xO2D4BDgljPA4/A==
X-Received: by 2002:adf:ab1e:0:b0:343:6b42:b3bb with SMTP id q30-20020adfab1e000000b003436b42b3bbmr35091wrc.31.1712249993185;
        Thu, 04 Apr 2024 09:59:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5910:95db:d5a3:46d6? ([2a01:e0a:982:cbb0:5910:95db:d5a3:46d6])
        by smtp.gmail.com with ESMTPSA id ce8-20020a5d5e08000000b003433e4c6d43sm16950894wrb.32.2024.04.04.09.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 09:59:52 -0700 (PDT)
Message-ID: <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
Date: Thu, 4 Apr 2024 18:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 2/7] clk: meson: add vclk driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
 <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_095958_230061_E0588B5A 
X-CRM114-Status: GOOD (  22.66  )
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

On 04/04/2024 10:13, Jerome Brunet wrote:
> 
> On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>
>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
>> VCLK sub-tree rate has been set, this is implemented in
>> the gate enable callback.
>>
>> The VCLK_DIV clocks as enable and reset bits used to disable
>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>> the rate is set while the divider is disabled and in reset mode.
>>
>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>> of the divider logic and vendor does this exact sequence to ensure
>> the divider is correctly set.
> 
> The checkpatch warning is still there. Is it a choice or a mistake ?
> 
> Documentation says "GPL v2" exists for historic reason which seems to
> hint "GPL" is preferred, and I suppose this is why checkpatch warns for
> it.

Well I didn't see this warning, this is what I fixed:

$ scripts/checkpatch.pl --strict drivers/clk/meson/vclk.c
CHECK: Alignment should match open parenthesis
#63: FILE: drivers/clk/meson/vclk.c:63:
+static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
+                                                    unsigned long prate)

CHECK: Alignment should match open parenthesis
#73: FILE: drivers/clk/meson/vclk.c:73:
+static int meson_vclk_div_determine_rate(struct clk_hw *hw,
+                                             struct clk_rate_request *req)

CHECK: Alignment should match open parenthesis
#83: FILE: drivers/clk/meson/vclk.c:83:
+static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+                                       unsigned long parent_rate)

<snip>

It seems that checking a commit triggers an extra check....

$ scripts/checkpatch.pl --strict -G 1bac9f6aa3c3
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#58:
new file mode 100644

<snip>

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#203: FILE: drivers/clk/meson/vclk.c:141:
+MODULE_LICENSE("GPL v2");

<snip>

Neil

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/Kconfig  |   4 ++
>>   drivers/clk/meson/Makefile |   1 +
>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>   4 files changed, 197 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 29ffd14d267b..8a9823789fa3 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>   	tristate
>>   	select COMMON_CLK_MESON_REGMAP
>>   
>> +config COMMON_CLK_MESON_VCLK
>> +	tristate
>> +	select COMMON_CLK_MESON_REGMAP
>> +
>>   config COMMON_CLK_MESON_CLKC_UTILS
>>   	tristate
>>   
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 9ee4b954c896..9ba43fe7a07a 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>   obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>   
>>   # Amlogic Clock controllers
>>   
>> diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>> new file mode 100644
>> index 000000000000..45dc216941ea
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include "vclk.h"
>> +
>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>> +
>> +static inline struct meson_vclk_gate_data *
>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>> +{
>> +	return (struct meson_vclk_gate_data *)clk->data;
>> +}
>> +
>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>> +
>> +	/* Do a reset pulse */
>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +}
>> +
>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops meson_vclk_gate_ops = {
>> +	.enable = meson_vclk_gate_enable,
>> +	.disable = meson_vclk_gate_disable,
>> +	.is_enabled = meson_vclk_gate_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>> +
>> +/* The VCLK Divider has supplementary reset & enable bits */
>> +
>> +static inline struct meson_vclk_div_data *
>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>> +{
>> +	return (struct meson_vclk_div_data *)clk->data;
>> +}
>> +
>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>> +						unsigned long prate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>> +				   vclk->table, vclk->flags, vclk->div.width);
>> +}
>> +
>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>> +					 struct clk_rate_request *req)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>> +				      vclk->flags);
>> +}
>> +
>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				   unsigned long parent_rate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +	int ret;
>> +
>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>> +			      vclk->flags);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	meson_parm_write(clk->map, &vclk->div, ret);
>> +
>> +	return 0;
>> +};
>> +
>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	/* Unreset the divider when ungating */
>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	/* Reset the divider when gating */
>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>> +}
>> +
>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>> +
>> +	return meson_parm_read(clk->map, &vclk->enable);
>> +}
>> +
>> +const struct clk_ops meson_vclk_div_ops = {
>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>> +	.determine_rate = meson_vclk_div_determine_rate,
>> +	.set_rate = meson_vclk_div_set_rate,
>> +	.enable = meson_vclk_div_enable,
>> +	.disable = meson_vclk_div_disable,
>> +	.is_enabled = meson_vclk_div_is_enabled,
>> +};
>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>> +
>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>> new file mode 100644
>> index 000000000000..20b0b181db09
>> --- /dev/null
>> +++ b/drivers/clk/meson/vclk.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +
>> +#ifndef __VCLK_H
>> +#define __VCLK_H
>> +
>> +#include "clk-regmap.h"
>> +#include "parm.h"
>> +
>> +/**
>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>> + *
>> + * @enable:	vclk enable field
>> + * @reset:	vclk reset field
>> + * @flags:	hardware-specific flags
>> + *
>> + * Flags:
>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>> + */
>> +struct meson_vclk_gate_data {
>> +	struct parm enable;
>> +	struct parm reset;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops meson_vclk_gate_ops;
>> +
>> +/**
>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>> + *
>> + * @div:	divider field
>> + * @enable:	vclk divider enable field
>> + * @reset:	vclk divider reset field
>> + * @table:	array of value/divider pairs, last entry should have div = 0
>> + *
>> + * Flags:
>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>> + */
>> +struct meson_vclk_div_data {
>> +	struct parm div;
>> +	struct parm enable;
>> +	struct parm reset;
>> +	const struct clk_div_table *table;
>> +	u8 flags;
>> +};
>> +
>> +extern const struct clk_ops meson_vclk_div_ops;
>> +
>> +#endif /* __VCLK_H */
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
