Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B9C52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3e9DuYxeKdxi6jcnXjnB4qxubWGq6YsaIBGU1Or8e4=; b=4RcI3jy9KQZnE2eD6b3xThgbmH
	zCiJrtulInavpfWnh43xmP5oVuNoycnyIymS7/22kotz+P5TWchpHwwIAB2anwM41VNZWtuVaaeA7
	yhu5a4mT7Br5F00b6b0SNDXrW1dKZk7BgUXBpK/n6lS6QdCruDTFr16F6AAk52DP2N5Y7plvTsWpd
	WNgYFUORbghsCyii4sGX6ewq8Y3n4hfMImrbJeesD3J0//Z38UCMZZmAiCT8Xw5tJiBmwr/9/QEiA
	rfLtV/h/vDRqkcoIjVZ91zVq++LjBEEUIpLa0bIZLNrAWGJMV6A45t4Pm2ceWfIVdMZBEzA1iuI6u
	h9V9uDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Gi-00000002B1C-1WB9;
	Mon, 19 Aug 2024 16:30:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Gf-00000002Axf-0HwS
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:30:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-428e0d18666so35558695e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085003; x=1724689803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7r7S7wRPFk2pSvVl7ZU19q0fOw2MNDRQgJBqWmwGHPQ=;
        b=F8E8NfLCHydaEcjC50+uLxz1Pmn4+kV+Tsz69HhSPfaCouYg2UiBPK/eETHgwvYlYt
         QIX8p7CZ1hDyqPqQ8Dp8ZNMyUUkBVploFRzwQcR+5gViCSAW1/DdR4tFZ6gngiT62Ttd
         LTo3EgosGW+CwMOwupW9TytdwjVN5W8+maj5h22BahXaFDC5tWzBzENsKJLTya8TxcQR
         azqffz7ocw2YjEDeeLemMIkuUfFHmWodHOiahglZE6HiEeRBbU3njZw3v/PEpXXwk6kD
         6v+WH3bGmmyYuld7an2dGwiyfIYQbThHaUM2mFvc1FwTIOaLkfbZEMx7O5vuDRnB/YnJ
         7tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085003; x=1724689803;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7r7S7wRPFk2pSvVl7ZU19q0fOw2MNDRQgJBqWmwGHPQ=;
        b=QEX2ft0tAL6y4xD3XXe1paJils56XEK2SKh8AWMgGFydpIo+ZKpfE3thlNwbxuvX+s
         fJN6rOAWhgyIx11tqM9U+F739U8lptD6FJSaDHM7T3Jh+RoGaeYAOwrPD+9NtR3Kaup+
         B3dSa/7Em3i75kdlueYcodZxTI6VjarRyhv3SNNgVfOhybuBfAHo22Air4Lo+YNRadrn
         cZxEmRTKraqHnJqSkjcOc9KDUW5cllbZ4J3vKQ/HQEEAjqv5UMFKPsnhivvoe3xt0YeS
         FrdGl+5WgxNozIZRw+gyJwdWhh7QH9bYWwxD/AljY76usaiQFBmnOQSSLhz5qQ91VfBG
         nqnw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1ycH9Z8A8UKYznbPM7OogSGeJ877mA3r8ko/rZV3KHeRX2PMeEeOOh6D6ulGoLQbatXv9s9x99VXvSahbROhiS8AVVWK1KvED/c5wiJ0FG4=
X-Gm-Message-State: AOJu0YzW7OT1WZEeQwwuhQqZLxJpEm02aps4eO3Ym5jyH7hGVcLNwUnd
	fw//QhJehRXxXCFUeTiVwwx1jGar677ahYZn9Mc9Ceed6qmwIB2g/BH+5XND2lY4ird04FXVaXN
	F
X-Google-Smtp-Source: AGHT+IGMIVaSKllyXTJLYfxv8zWfWh7ofv0A8g8baFri8DEHir/qt24CJILAEMd+CXWxYTxmuGPIOw==
X-Received: by 2002:a05:600c:548e:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-429ed7ae653mr89860125e9.18.1724085003029;
        Mon, 19 Aug 2024 09:30:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed79d9a7sm114992515e9.39.2024.08.19.09.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:30:02 -0700 (PDT)
Message-ID: <a6ca8b79-8b64-4427-a625-abd61ffa7b21@linaro.org>
Date: Mon, 19 Aug 2024 18:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/9] reset: amlogic: use reset number instead of
 register count
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-6-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-6-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_093005_229426_778466B6 
X-CRM114-Status: GOOD (  16.62  )
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
> The reset driver from audio clock controller may register less
> reset than a register can hold. To avoid making any change while
> switching to auxiliary support, use the number of reset instead of the
> register count to define the bounds of the reset controller.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 8addd100e601..5b6f934c0265 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -17,7 +17,7 @@
>   #include <linux/types.h>
>   
>   struct meson_reset_param {
> -	unsigned int reg_count;
> +	unsigned int reset_num;
>   	unsigned int reset_offset;
>   	unsigned int level_offset;
>   	bool level_low_reset;
> @@ -87,21 +87,21 @@ static const struct reset_control_ops meson_reset_ops = {
>   };
>   
>   static const struct meson_reset_param meson8b_param = {
> -	.reg_count	= 8,
> +	.reset_num	= 256,
>   	.reset_offset	= 0x0,
>   	.level_offset	= 0x7c,
>   	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_a1_param = {
> -	.reg_count	= 3,
> +	.reset_num	= 96,
>   	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
>   	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_s4_param = {
> -	.reg_count	= 6,
> +	.reset_num	= 192,
>   	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
>   	.level_low_reset = true,
> @@ -148,8 +148,7 @@ static int meson_reset_probe(struct platform_device *pdev)
>   				     "can't init regmap mmio region\n");
>   
>   	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
> -		* regmap_config.reg_stride;
> +	data->rcdev.nr_resets = data->param->reset_num;
>   	data->rcdev.ops = &meson_reset_ops;
>   	data->rcdev.of_node = dev->of_node;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
