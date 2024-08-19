Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FFCC52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY9S/Vhj/42gqOwjiw9AoPO2hO8LbNxfrpRujouXJXY=; b=OT6WPpNHElK1qy5/Ig7dKozhVv
	bVTI+SwvuovDuxZYmfFR6K2NHArjyw1nlhNgQejdlKhgndUfIQMO0wYUQ01Z/kcjIISF/7w0+x6Ms
	DprgDtDHYNSayhdDdnpfEDm/S0JXxV+3jmz4pii04HXuLTdI4bw6lehNwRa6dhQ8sDn/CbX6SWiAs
	0zkuLuqfzF3Q3P8ODfHGMKGzUsSX+5hWlFkP5ObkAag8Qk3JJGWE0Je6MeUWZn29Gd5LGICvVfgat
	5L+DHv4D2zQ/JPJZ3sg5zl2lDmbOYz7kUT+/IHjdYiiqwjrhSNxzTUntRAi4Yg8pfzj/NFy6yk9J9
	DcHKErgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4mM-000000022rf-1NsZ;
	Mon, 19 Aug 2024 15:58:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4lS-000000022b8-3iMS
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 15:57:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428163f7635so39377865e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724083069; x=1724687869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYLXx6IK436ZXUWm98Vv0I9P30RpVgjMhTotCo81moA=;
        b=iAKM8ZK1/iuR//W0ZLfOQCywFVlyOp7vZcF/PdjE38Ji7lfeVDUAGxyAX4dFFyVcFU
         uljuxLxIbnOV/mbhSXEkbhTvpLpSjsMRj4p0uXT8Qc3AMmNpwsK5cSijuO+FG8Y6Jf6o
         ieSFK3zTQFqtplrQCRJ0edF4VOC3lCxX+07ORbcpobKgs0YM1KPsFzsggOBt76zCMU48
         7U7DW42FtHn9kNSzAqAhhqaB8zjF/btX7+3fwgb5wczpLIyS7qJfK7Md8vFiuH99vbEx
         0UCqypBvsukkpV4Tdny7eSEnuVBGoIQ+lGdtPt5GSdcmkfeoQjoQCsFakUutqpMB47Ik
         oYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083069; x=1724687869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gYLXx6IK436ZXUWm98Vv0I9P30RpVgjMhTotCo81moA=;
        b=TihAwg19WqcfGoPbJKPTcUNqZ/kjjEOCto8ILdhbkDjfRvjfzQYjB9I90xokHrqhYQ
         qOyHo3braWgT54Cj6OcdxpjQQoFU/sxLvNM9H38UOgd1wCzU0Ha7pfCm06XfcEwzZW/F
         FYbK1+bCz03ohRB/6avExCd2yzaWojr5vtHTcrKV143CIcZYNjtOGGBM9QlR1iVjwNnU
         NsM3Suy+6a++ZM04hxiC30XD3vegIkCPjOs37vXL1l47ku6JM64z7N70PVbj/wAIKneQ
         7rSxtk9bKG/JGDaIs2G7luGghEOMb6ctwwk4WCZ+zeRQSJQF24pJu+PSaJcdjxG+OMfX
         032w==
X-Forwarded-Encrypted: i=1; AJvYcCXnsgWNbor5nWrDT9i+/K/tWnzRb0CUFK+OsYIZKNYZ4u9LOnbTR7ncf+LsPvGLC1SmLLlY6iPLkKRs77BpBvOZdv3Xe8sWSAoNkiLMq1OBjSU=
X-Gm-Message-State: AOJu0YxSV0jwYWhLNDlHUQh0fD2ytzrXxDZSbowhyyRfE3AXy9g89IsE
	Nj4vHiKURMfOGhJVxunYdRsPDbWlz9fYQ3fxzoijllM0FqynCdlGw1sKgGWyT7wH/UeMHdL11vJ
	d
X-Google-Smtp-Source: AGHT+IEWZ9kdWV6uTHZAXTq9g0kGd7Rheid4jblAqZmzIcGKVPLZkk5lJdCcW5NMGYbQoypK0W3cIQ==
X-Received: by 2002:a05:600c:46c9:b0:427:985b:178b with SMTP id 5b1f17b1804b1-429ed79e585mr67849275e9.16.1724083068540;
        Mon, 19 Aug 2024 08:57:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aabe9sm10897543f8f.92.2024.08.19.08.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:57:48 -0700 (PDT)
Message-ID: <614de1b0-fcaf-457c-9183-1f3cd7f91b38@linaro.org>
Date: Mon, 19 Aug 2024 17:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/9] reset: amlogic: add driver parameters
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-5-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-5-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_085750_968546_B13D6E0D 
X-CRM114-Status: GOOD (  19.38  )
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

On 08/08/2024 12:27, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, allow to customise
> the reset offset, same as the level offset. Also add an option to make
> the level reset active low or high.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 460ad2f8360f..8addd100e601 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -18,7 +18,9 @@
>   
>   struct meson_reset_param {
>   	unsigned int reg_count;
> +	unsigned int reset_offset;
>   	unsigned int level_offset;
> +	bool level_low_reset;
>   };
>   
>   struct meson_reset {
> @@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>   	unsigned int offset, bit;
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->reset_offset;
>   
>   	return regmap_write(data->map, offset, BIT(bit));
>   }
> @@ -59,9 +62,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
>   	offset += data->param->level_offset;
> +	assert ^= data->param->level_low_reset;
>   
>   	return regmap_update_bits(data->map, offset,
> -				  BIT(bit), assert ? 0 : BIT(bit));
> +				  BIT(bit), assert ? BIT(bit) : 0);
>   }
>   
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
>   
>   static const struct meson_reset_param meson8b_param = {
>   	.reg_count	= 8,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x7c,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_a1_param = {
>   	.reg_count	= 3,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_s4_param = {
>   	.reg_count	= 6,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,

Just a comment, I would rather leave the "default" users of this driver with the default value
and use level_high_reset = true for the clock ones

Neil

>   };
>   
>   static const struct of_device_id meson_reset_dt_ids[] = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
