Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD80C2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6tnd8EY7U2ESuHUpS1hSnKCKdQjnKYjp9VEngIzlBs=; b=XjMZEYuIcbee1bIZSDdpCi2r1H
	Ed3QYi3O06ctuLw+xsZPjjkhcZr5sJT/OSKV6G1bM3uCTJHyheNEQ9hAwWBWPoybJnzMYXK2A2g1K
	lp3l5iOqwksOVEIhxozy7cLDeOT03ryxipjTDIktsEhxZ0Z5GrNo+FP6zIf7Git6w0qsGlwnGur3s
	OTyjoYXwC0d0xEaK1L4q8sx9QDOK4NHzkLDKtk76aYyFp4rOBz/EhoUO8LmDq3a8lxpo7a4beYZ2g
	b9v1ZlNdmkN1oTcve5I0st2l39V/6aF143zDdcd1/EHdIeCOGVxNjBnKs7eNWCE8sb75gYN+oC9Mi
	S2MhrxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxdM-00000009tSH-3GuH;
	Wed, 03 Jul 2024 10:54:44 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxdH-00000009tQ1-2kTv
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jul 2024 10:54:41 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so58345791fa.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2024 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004077; x=1720608877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlOwgA2oPXO1Req4JpCHFaG+S8N43204bimZ4vVEKzk=;
        b=F8K/tLnZfXaEYOX42s2HnSMyEpcKCKjFpihpklQmxxuH++LTWVWrwwAtl4BntaZaGC
         nUN8YpZmydpZlYrXCs9agcaizH6+kRWnbu3VZNU4m7nAFAKQxdtlhULHxypR5Ko9zt/P
         +ub7Yiz6DN4FnFrJse2qezAJ9YbqMNfhYEGI3TZ+jdyqrxtPAnKUaoLWCoTBKt44flkF
         +EngxGCRBEAMPQDcuQzF1wWVQRdklkVTsc2YAbx0pvYDMVkQqhOuGoDUi5FgMhQEW9Md
         ye6zvlQFBnObGsRPC8C0nq2cob7GUufRcxV/FcLRmDBnviM0zR8XYtvMCOa/4WyZQtLk
         w7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004077; x=1720608877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rlOwgA2oPXO1Req4JpCHFaG+S8N43204bimZ4vVEKzk=;
        b=ASYqe/HOA88iLDtuE7UqZ9jwQGfcO6mY3OjGx58aBZcBmwwxiemeKFwgs3Bzx2+z1A
         FBl95xUdZnIV5lyZqEziW2NsRrWpk4PDTegGYMb3ks4s9iaCabiuTvQJ45Z3Q5UQBrwE
         yZPPcg0qofnvLrvzc8izVyfPC1urNafIEqniSPmwm93WTavNEzfAtXQn2T6VjCZxYIqF
         IWlcawMNBweikQ8pe5oWY9r7cOBtvCTzxN2Ec/zgn0zQQwRUZicwjITz164qayoEW15I
         7gM8/Y/+oxFMaFqYsIMKJ7Bdg2QJYRL72w9M9X5+k2C3Z3TXRvxA5iMH9nNQFzDMPm+z
         8jKg==
X-Gm-Message-State: AOJu0YzfnEX683u73I8NHEBJFyVS2Yh7wJ5be53aI4gezXyp0vJtQVF/
	zXq9xg8gxFHOitc2SrjOFHUERFQdur9E21cXc0otNbkMOWCOTQCOOiYBiCg0ybk=
X-Google-Smtp-Source: AGHT+IFeGsG5TeLKU7VX6O7WQdWbFt2TMF/Q9K55GPSurTDC3XQJCOCEimowm1HlG2bUkeLZmrPjTw==
X-Received: by 2002:a05:651c:2c6:b0:2ec:543f:6013 with SMTP id 38308e7fff4ca-2ee5e3acd8dmr64013921fa.13.1720004075177;
        Wed, 03 Jul 2024 03:54:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:34 -0700 (PDT)
Message-ID: <6353f1d2-5bd3-4194-9932-0d92f78f8d75@linaro.org>
Date: Wed, 3 Jul 2024 12:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/10] clk: meson: a1: pll: Constify struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_035439_732932_88037A43 
X-CRM114-Status: GOOD (  13.03  )
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

On 03/07/2024 11:50, Javier Carrasco wrote:
> `a1_pll_regmap_cfg` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/a1-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index a16e537d139a..4d0a6305b07f 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>   	&hifi_pll,
>   };
>   
> -static struct regmap_config a1_pll_regmap_cfg = {
> +static const struct regmap_config a1_pll_regmap_cfg = {
>   	.reg_bits   = 32,
>   	.val_bits   = 32,
>   	.reg_stride = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
