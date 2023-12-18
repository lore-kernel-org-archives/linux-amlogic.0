Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370FCC35274
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Dec 2023 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBsg/WDRQtuXB5mL2dpCRMdZiEWjwEG0Ek1DjKGg8HA=; b=Secx/JWbvbaqgDSMrIDwXVQfSe
	/wZgkW4KNKJeJRY1U7gxaPtG2CNF0UdorJGXY2259Am6LpuiZZXz7FQGQp5uvYteY0yKBMF56kYtg
	Rq1WTpC9rQkfbotsfMmEbY7TUxojGjek8HLlNJBlUHUeGwfgOWmBI9vmws5D9GKEDUJs4AzE6N/ch
	JOuM8YNCi5Ufj8JgwRvZnJ3SeoL8nqOFbATo7apIftsrzBwKtJHcdmUrg0OGFfOO9kCu3uvgSjjeU
	HnN55lUzeCA/FWELRsd60QyivdySocR3qvZF05mKP4P1tYWHx5QWJQTcABjImrMVmEpGZXCbie8Hl
	k3UQPsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFA6G-009h5Y-1k;
	Mon, 18 Dec 2023 09:39:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFA6C-009h4Q-0x
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Dec 2023 09:39:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6d47bb467a9so903849b3a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Dec 2023 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702892381; x=1703497181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTYEtunIedVhrIrUbrN5OGHL/0lewttUjOiPfnpbhG4=;
        b=IvXgUPQEE9ge4V/9jSQK+jCF/Pr826Lvu+64uBe9dq9r1dtI2jeyhoX/8C060EBpSN
         gUa5V8RJQFV9sc/LZefrhq4HjBggdqLtU/tP5UfgeLGrLY9VwvdjBK32SNm6IAW1IvaH
         dixqKj2VM9ezH0c+XsDx2CSheEnbYgeRX8J528J+y9xdRJI4KaHkZWeHWaY0NBuPwURC
         PBNt/a7zrN41nUHTXYuJL3NcgdeYKxDqrK5naA4Er0z0XTJBpblTcYuepd7mtXI4+tuU
         VT5pphvqNibuvSE3qX6pv/fcs6sln/a90hTSgK06esc2w7iSxomVzU5qvPXSJYKt9Ujz
         UKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702892381; x=1703497181;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BTYEtunIedVhrIrUbrN5OGHL/0lewttUjOiPfnpbhG4=;
        b=ekzaERHK25d0WYG2CkKEmUeD/7Kew6sj/jKCWr5dAJBnCKrCFrtv07FNlQ58cuWw/z
         Uo8E8vUDeMi3u9MGRxkU4ztsbYRx7q46kEe8M7vA8gw12GOtfAkFolvATf4oZnX9cXWe
         SAgbzlDWqZID/GwvzxdYhw52xhd4rATgi+Be1knMrrP9iC0zgXByjKuU6Ne+B04ltats
         I5VlS2kg12C2esL7UpCZobQoTHWdRD/Wbx9je1CGip/dwz79e/d9bczqfvQfFtDGJJmz
         RBuLaqiKb9bm1ZLa8h9PUW1CWPpylm9McM+KGPUEyLrgnfS/t+TpgZ+pM4B4T9/GiBwB
         dWeA==
X-Gm-Message-State: AOJu0YzF5vbdXQ26eB+sn5mLi9dSTR0nKpBu50Z8KdAnACPwEkt50Aqe
	VXt4YxYS0wcbpphHB/gIDdnVbg==
X-Google-Smtp-Source: AGHT+IF92lD4uQGcOvnMiAVb7hcO4gcbwh7m7LghWfKxV9vSCKKOHDlYmmYLmBb0BH9hREskDXqLvQ==
X-Received: by 2002:a05:6a20:3712:b0:194:341e:8f5c with SMTP id t18-20020a056a20371200b00194341e8f5cmr1602230pze.50.1702892381093;
        Mon, 18 Dec 2023 01:39:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b425:da5d:c0cf:a505? ([2a01:e0a:982:cbb0:b425:da5d:c0cf:a505])
        by smtp.gmail.com with ESMTPSA id e10-20020aa798ca000000b006d7bfb2f30csm1333167pfm.148.2023.12.18.01.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 01:39:40 -0800 (PST)
Message-ID: <db90068a-8eac-458e-bc22-aceb59870f5d@linaro.org>
Date: Mon, 18 Dec 2023 10:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
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
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
 <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
 <b23ddc3b-d995-4cd6-91f2-3efa59d345a5@linaro.org>
 <1j34wvdtux.fsf@starbuckisacylon.baylibre.com>
 <41a1246e-c885-460a-8208-16844e95e1ae@linaro.org>
 <1jjzq3zhaw.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jjzq3zhaw.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_013944_364003_97C1DE04 
X-CRM114-Status: GOOD (  34.88  )
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

Hi,

On 27/11/2023 09:38, Jerome Brunet wrote:
> 
>>>
>>>>
>>>> I suspect mipi_dsi_pxclk_div was added to achieve fractional vclk/bitclk ratios,
>>>> since it doesn't exist on AXG. Not sure we would ever need it... and none
>>>> of the other upstream DSI drivers supports such setups.
>>>>
>>>> The main reasons I set only mipi_dsi_pxclk in DT is because :
>>>> 1) the DSI controller requires a bitclk to respond, pclk is not enough
>>>> 2) GP0 is disabled with an invalid config at cold boot, thus we cannot
>>>> rely on a default/safe rate on an initial prepare_enable().
>>>> This permits setting initial valid state for the DSI controller, while
>>>> the actual bitclk and vclk are calculated dynamically with panel/bridge
>>>> runtime parameters.
>>> Nothing against setting rate in DT when it is static. Setting it then
>>> overriding it is not easy to follow.
>>
>> Yup, would be simpler to only have parenting set in DT, since it must
>> stay static, I'm fine trying to move rate setup to code.
>>
>>> To work around GP0 not being set, assuming you want to keep rate
>>> propagation as it is, you could call clk_set_rate() on cts_encl (possibly w/o
>>> enabling it) to force a setup on gp0 then clk_prepare_enable() on
>>> pxclk. You'd get a your safe rate on GP0 and the clock you need on pxclk.
>>> It is a bit hackish. Might be better to claim gp0 in your driver to
>>> manage it directly, cutting rate propagation above it to control each
>>> branch of the subtree as you need. It seems you need to have control over
>>> that anyway and it would be clear GP0 is expected to belong to DSI.
>>
>> Controlling the PLL from the DSI controller seems violating too much layers,
>> DSI controller driver is not feed directly by the PLL so it's a non-sense
>> regarding DT properties.
> 
> Not sure what you mean by this. You have shown in your the commit
> message that the DSI clocks make significant subtree. I don't see a
> problem if you need to manage the root of that subtree. I'd be great if
> you didn't need to, but it is what it is ...

I really think the choice of PLL should not be done by the DSI controller,
but by the Video pipeline driver or statically until we can do this.

My point is that we should only define the clocks that are related to each
hardware, for example the whole VCLK/VCLK2 clocks should be defined for the
VPU HW, then only the few endpoint clocks should be defined for the HDMI
or DSI controllers, PHY clock and ENCI/ENCP for HDMI, DSI and ENCL for DSI.

The big plan is to entirely switch to CCF for VPU, but first I want to have
DSI working, and since DSI needs GP0, we need CCF for that so the intermediate
plan is to have partial CCF handling only for DSI with fixed clock tree in DT,
then in the future the Meson DRM driver would set up the appropriate clock
tree for HDMI, DSI, Composite and perhaps DP for T7 SoCs then the controller
bridge will call the clk_set_rate() in the same design I did for DSI.

Here's the tracked item: https://gitlab.com/amlogic-foss/mainline-linux-issues-tracker/-/issues/9

CCF clock control is a mandatory item to solved dual-head display: https://gitlab.com/amlogic-foss/mainline-linux-issues-tracker/-/issues/6

> 
>>
>> Setting a safe clock from the DSI controller probe is an idea, but again I
>> don't know which value I should use...
> 
> You mentionned that the problem comes DSI bridges that needs to change
> at runtime. I don't know much about those TBH, but is there
> anyway you can come up with a static GP0 rate that would then be able to
> divide to serve all the rates bridge would need in your use case ?

No, there's no such things in the DSI world, MIPI only specifies the electrical
and transport layer, everything else is custom per vendor.

> 
> GP0 can go a lot higher than ~100MHz and there are dividers unused in the
> tree it seems.
> 
> I suppose there is a finite number of required rate for each use case ?
> If there are not too many and there is a common divider that allows a
> common rate GP0 can do, it would solve your problem. It's a lot of if
> but It is worth checking.
> 
> This is how audio works and DT assigned rate is a good match in this case.

Yeah I know, but I would love it but no...

> 
>>
>> I'll review the clk parenting flags and try to hack something.
>>
>> Thanks,
>> Neil
>>
>>

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
