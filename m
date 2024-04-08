Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F3CD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0OjbJfQohMX4UziE5s6iWc9Xs/YJuOs0a8MbK8wBV4=; b=EQJCjOlTsN+q5ZwfBUnJhmOaWO
	mISVUJq8ko/kSj9iX6cNj5eH90tExc1Fn0IP+n00CgVk9QdJ2mvH7Z7r3oL0lGCQt5zL0bvlZYyAt
	w6ePxOQfPuZ/ZyKS1bEUb802SsSrHqaONdWzrLEz7qCUo23m+rqSeN2MkC8mAdL4l07No0gO7vyMA
	+JUfH/gkKZoe7C3XVwsG7gR5Vo95jIeNhoKK84OrvrOywcTw9mX7+EKXySeeh5XvuJiiJDMI3ovu/
	rTnE/lBRQw4tT6LdMFZbeLlL1+4CJfoVa8+WT+URcW6Vsq1hiOahM1jAXCkbQoUZXEqM60CKyWdPl
	MAthuTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtl9k-0000000F4Fp-3ANy;
	Mon, 08 Apr 2024 09:19:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtl9g-0000000F4E6-3kau
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 09:19:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-416664dbee1so4477325e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712567946; x=1713172746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+X8sGaNu+7zgdnn3L3toqhCWyJlQ5mBbe91/Sg3EK4=;
        b=aJdaHsKFd58VNN34R86M3vr5nfLuMjul8PryYy9RpvmpAkmopm6vIP4h7LoNDoXg5/
         lvHTfSh5ngKHEWgJPwTpeMZxSrRr6ryWin7IllsohBwY4r3C+bxOR8vUQDYe0F0TVTBC
         c123TEP1z47wLd6XaZws2EJM1MWK5EtSW9taXTSXSRZVeBUX8k6mqLyKn7EwRqGK2IS7
         ig76BFM4MNewREhJ7V37x+X77kIfrkdhWZGNPNyACvhuC0FVU2q2U34+AoaP0RdFtTt6
         Cla/rhYUF372K17OwJMBH/v6eZ9EN1QiHtfyAIFCCsxvDgwrfJuW4zPZKbtinKMRSBaT
         ZgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567946; x=1713172746;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m+X8sGaNu+7zgdnn3L3toqhCWyJlQ5mBbe91/Sg3EK4=;
        b=xAX8MDCJosqkJxw3PEZha+IUcL+m6cy8xhcxJnA7JaJWmOWLkvtcdN75DjqrMrqCq3
         9Jb+wVDSMXDBEsmR5QWr9DBDNGOQ+50KgfWISNOaRTYvlGDg5gtVkM5CVtl+oaUH9T+W
         qC13RMPmuSQX1EMCh41v7hz4yUo9zbxhdCGZOpJSIX+nCQzvqpkUndjBY0J8KgeAN9rm
         efLphfSmvZqUBan3Mg53/VkB4FYV/h6zXh3kpUBpHU7bjrUw9GNiJT1cUvp4a4johJHy
         xZz4CY/PPWMzwsLoHZOUfGPiGhzzBV7TVeTB0D61tC5J3Cr81OikXvbnShj3H2brwGrF
         4qiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsrcywE1Sic5nnuhriXwB9jZzTcsMoZR2nPB/klm/tT4hJGTvLSq+nHmMoLLZdAss8XdqubxRBFflfiFMDHMfjGKUUZxaRenHxRqVlmXOIZuk=
X-Gm-Message-State: AOJu0YxkVfTVb3iE6SXBxY8201VfZ3e5XqLm03YoJjEFNM9JO3o7a12h
	gKEmwBBW+FxqSv0F2acMxXEfBS8FZWGL/s4aKAlLemuwvgMj7YqQ/1thu+esjYo=
X-Google-Smtp-Source: AGHT+IEe+Nz6gK9it/jNyMfDPLKrr+azkgZeETNSGLMTmujr+CFQ5mGJCWue4R5KbZZwTQ+wXoWTkw==
X-Received: by 2002:a05:600c:3514:b0:415:666e:9355 with SMTP id h20-20020a05600c351400b00415666e9355mr7241821wmq.15.1712567945737;
        Mon, 08 Apr 2024 02:19:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b0c8:7091:4315:491e? ([2a01:e0a:982:cbb0:b0c8:7091:4315:491e])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b004163059bb53sm11463820wmo.16.2024.04.08.02.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:19:05 -0700 (PDT)
Message-ID: <1a0b8a39-7e15-4773-af5d-5888af3a47af@linaro.org>
Date: Mon, 8 Apr 2024 11:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
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
 <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
 <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_021909_001478_5BA2F801 
X-CRM114-Status: GOOD (  23.21  )
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

On 05/04/2024 09:00, Jerome Brunet wrote:
> 
> On Thu 04 Apr 2024 at 18:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 04/04/2024 10:13, Jerome Brunet wrote:
>>> On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org>
>>> wrote:
>>>
>>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>>
>>>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
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
>>> The checkpatch warning is still there. Is it a choice or a mistake ?
>>> Documentation says "GPL v2" exists for historic reason which seems to
>>> hint "GPL" is preferred, and I suppose this is why checkpatch warns for
>>> it.
>>
>> Well I didn't see this warning, this is what I fixed:
>>
>> $ scripts/checkpatch.pl --strict drivers/clk/meson/vclk.c
>> CHECK: Alignment should match open parenthesis
>> #63: FILE: drivers/clk/meson/vclk.c:63:
>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>> +                                                    unsigned long prate)
>>
>> CHECK: Alignment should match open parenthesis
>> #73: FILE: drivers/clk/meson/vclk.c:73:
>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>> +                                             struct clk_rate_request *req)
>>
>> CHECK: Alignment should match open parenthesis
>> #83: FILE: drivers/clk/meson/vclk.c:83:
>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                                       unsigned long parent_rate)
>>
> 
> I would not ask a respin solely for this. It's nice to fix it but I was
> mostly after the warning TBH.
> 
>> <snip>
>>
>> It seems that checking a commit triggers an extra check....
>>
>> $ scripts/checkpatch.pl --strict -G 1bac9f6aa3c3
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> #58:
>> new file mode 100644
>>
>> <snip>
>>
>> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
>> #203: FILE: drivers/clk/meson/vclk.c:141:
>> +MODULE_LICENSE("GPL v2");
> 
> Hum, I'm running checkpatch against the mail itself, not the commit. I
> still get the warning

Patch or commit seems to trigger more tests than a file directly, anyway I sent a follow-up patch:
https://lore.kernel.org/all/20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org/

Thanks,
Neil

> 
>>
>> <snip>
>>
>> Neil
>>
>>>
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/clk/meson/Kconfig  |   4 ++
>>>>    drivers/clk/meson/Makefile |   1 +
>>>>    drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>>    4 files changed, 197 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>>> index 29ffd14d267b..8a9823789fa3 100644
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
>>>>    diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
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
>>>> index 000000000000..45dc216941ea
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.c
>>>> @@ -0,0 +1,141 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include "vclk.h"
>>>> +
>>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>>> +
>>>> +static inline struct meson_vclk_gate_data *
>>>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct meson_vclk_gate_data *)clk->data;
>>>> +}
>>>> +
>>>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
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
>>>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>>> +
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +}
>>>> +
>>>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops meson_vclk_gate_ops = {
>>>> +	.enable = meson_vclk_gate_enable,
>>>> +	.disable = meson_vclk_gate_disable,
>>>> +	.is_enabled = meson_vclk_gate_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>>>> +
>>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>>> +
>>>> +static inline struct meson_vclk_div_data *
>>>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>>>> +{
>>>> +	return (struct meson_vclk_div_data *)clk->data;
>>>> +}
>>>> +
>>>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>>>> +						unsigned long prate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>>>> +					 struct clk_rate_request *req)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>>> +				      vclk->flags);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				   unsigned long parent_rate)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
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
>>>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	/* Unreset the divider when ungating */
>>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	/* Reset the divider when gating */
>>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>>> +}
>>>> +
>>>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>>>> +{
>>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>>> +
>>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>>> +}
>>>> +
>>>> +const struct clk_ops meson_vclk_div_ops = {
>>>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>>>> +	.determine_rate = meson_vclk_div_determine_rate,
>>>> +	.set_rate = meson_vclk_div_set_rate,
>>>> +	.enable = meson_vclk_div_enable,
>>>> +	.disable = meson_vclk_div_disable,
>>>> +	.is_enabled = meson_vclk_div_is_enabled,
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>>> +MODULE_LICENSE("GPL v2");
>>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>>> new file mode 100644
>>>> index 000000000000..20b0b181db09
>>>> --- /dev/null
>>>> +++ b/drivers/clk/meson/vclk.h
>>>> @@ -0,0 +1,51 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>>> + */
>>>> +
>>>> +#ifndef __VCLK_H
>>>> +#define __VCLK_H
>>>> +
>>>> +#include "clk-regmap.h"
>>>> +#include "parm.h"
>>>> +
>>>> +/**
>>>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>>>> + *
>>>> + * @enable:	vclk enable field
>>>> + * @reset:	vclk reset field
>>>> + * @flags:	hardware-specific flags
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct meson_vclk_gate_data {
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops meson_vclk_gate_ops;
>>>> +
>>>> +/**
>>>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>>>> + *
>>>> + * @div:	divider field
>>>> + * @enable:	vclk divider enable field
>>>> + * @reset:	vclk divider reset field
>>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>>> + *
>>>> + * Flags:
>>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>>> + */
>>>> +struct meson_vclk_div_data {
>>>> +	struct parm div;
>>>> +	struct parm enable;
>>>> +	struct parm reset;
>>>> +	const struct clk_div_table *table;
>>>> +	u8 flags;
>>>> +};
>>>> +
>>>> +extern const struct clk_ops meson_vclk_div_ops;
>>>> +
>>>> +#endif /* __VCLK_H */
>>>
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
