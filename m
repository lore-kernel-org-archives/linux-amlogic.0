Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943FE7718D
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRBUAKQJk0Ws2pfGAnPcSoDGEsfzOI3W7ANzCgeoTD8=; b=MK2dsnHiAsYjuqAFk+TLkWI4Ec
	PWCPuG2W7x0Hr3PFUJKxjR9n/G4bZsHB+HljTcb8n68lsTVknbHhSz6RZqCg4f8k1+r+6tziWB8rh
	spGSRQPHdxol7MNVl8at+04droxrjuycVwT2JNz85IdoWcHgZ6xv+D5VJpw26w7cjMgQC8gUoORYG
	SuQje57uyOgYB435tPShdPsM50doL+asrNa/zhOOBk1IZTNW3HvY0OHMyUoWLwNt8McrE0JeolhNC
	w5v2l0hEED8jzKZ1HpHX3yV8/a713jjCWoASnP+dl0u17I9iHj+kt1MqTHHTZ2hArbvIICnQkJpdS
	TFX42biA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavd-00000004g6r-2GrE;
	Fri, 20 Dec 2024 11:12:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaF8-00000004aov-0bRh
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 10:28:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43621d27adeso11890355e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 02:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690504; x=1735295304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=cZHyabbB3mOQ2ccw5nON5gpY2RDmvyKDGtPUajd0tQFUtjLadqzcZ5Q5xvtE17L+G0
         6rdHOjbbonwpX3xzOVDjbvz3bmxTD9VPVx76PU/3XQYXBhLIHFKFMynfFsHLX13ATjge
         fej18QA2FmtqEWto2fqxNtQC+qU8U9pl2GZhpo+IbUnFU3rVnYvyiKho1aUiD6UnJMb9
         E4y7C/8kxj1bKkA0qg0VCOpNflsbTXHvSPX6tN39JxISNz1H8s+F+7yMDsckVYqOpqh1
         45R/T3Yx62JKdmo+siwOF915V/ekV3FK3zXmPLe5sfCJ9Plwuegrsbo5cCvOMcYa4hUR
         Kuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690504; x=1735295304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HdJ/eOxCZGHcu9pA14lAD6dnUt0v18sp+NWLvry5BiA=;
        b=jHdZxzj9UauYEljLECXnCuW5sNev5t890mEiYVY8bsmF0LzbsKB+y3hYYh3S8+9J41
         PKkr1Djz+JTVTZPMUjZvBsUdm6cavGO2I80loS0snPll1m0Y7xJiCeRqvG14ZuY0sdRw
         MyZ4Al8J3pTxSlYnjgT/IzcamyT7PLS9GIKBNGkmN60idG9r6ley3n8516XGXZ3FzAga
         hiSR0mc45ppO6RqXRTEYnASHMvU/S+4KL7F5sZKoG0ebNiw68QlfPRlKhHbCnOCFVpSl
         5NJEl6oxkH5eUZbH4t/GtzQd5m+do4ai1yubozpv2WvUXBaRude9VBliifqIaYYzlHTb
         yydA==
X-Gm-Message-State: AOJu0YxDnJE/N8/bX1weVL62kqVnCwMZMMuZV3dYSujp8fdJ2SnNucuj
	62pLiRZMbPtlLTplYofEEhF7/6FYhHS+h0Wsdwjgm04I+MjeEK/DfaW4LXwk78Q=
X-Gm-Gg: ASbGncsMNJaD7YCOzO+dSVudf/nLdqIxK2rO+1MtfqaqeBDmchN3xqq2Ztf90Bgtc+i
	3iW/8l81wGVgWiCSxiy052GSiS/xKarL6u6ne/N0h2lyacTymPWpuMIy2v6ljp4qCBqERX2HSgZ
	S0yCtkxo1fP64VezHhkJeZVT0Skwe1cyqXO24kzFBDuM0OYbEIGP8n8hCzIKkaNMzKTS308uuTN
	wUUmjAfVBc1extbe+MMbYpkMkIdUHBO52lQXGCVDRcBDul7rQr/QzwxeKmJvo5Uxv+n
X-Google-Smtp-Source: AGHT+IEYzK+j+dey8xf+KzqWLoGsi0Q/WX4eyBcHDbdTKpfLYjVtZFyqCoMyxH7cKJs47i+/dXz29A==
X-Received: by 2002:a05:600c:470b:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-436685482f4mr17044165e9.7.1734690504486;
        Fri, 20 Dec 2024 02:28:24 -0800 (PST)
Received: from [192.168.7.191] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm76509465e9.38.2024.12.20.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:23 -0800 (PST)
Message-ID: <e74da1e8-d1fe-4937-9f41-63347beb40a2@linaro.org>
Date: Fri, 20 Dec 2024 11:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
 <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
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
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022826_250648_7CF7630D 
X-CRM114-Status: GOOD (  15.40  )
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

On 20/12/2024 11:25, Jerome Brunet wrote:
> gxbb_32k_clk_div sets CLK_DIVIDER_ROUND_CLOSEST in the init_data flag which
> is incorrect. This is field is not where the divider flags belong.
> 
> Thankfully, CLK_DIVIDER_ROUND_CLOSEST maps to bit 4 which is an unused
> clock flag, so there is no unintended consequence to this error.
> 
> Effectively, the clock has been used without CLK_DIVIDER_ROUND_CLOSEST
> so far, so just drop it.
> 
> Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/gxbb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 262c318edbd512239b79e5ad26643ae6c7b0173b..62494cf06e7d775bdb18b2242c3d45bf246bdd0e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1306,7 +1306,7 @@ static struct clk_regmap gxbb_32k_clk_div = {
>   			&gxbb_32k_clk_sel.hw
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
> +		.flags = CLK_SET_RATE_PARENT,
>   	},
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
